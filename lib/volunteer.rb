require 'pry'

class Volunteer
  attr_reader :id
  attr_accessor :name, :project_id, :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    name = volunteer.fetch("name")
    id = volunteer.fetch("id").to_i
    project_id = volunteer.fetch("project_id").to_i
    Volunteer.new({:name => name, :project_id => project_id, :id => id})
  end

  def self.find_by_project(project_id)
    volunteers = []
    returned_volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{proj_id};")
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({
        :name => name, 
        :project_id => project_id, 
        :id => id}))
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', '#{@project_id}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  def update(attributes)
    @name = attributes[:name]
    @project_id = attributes[:project_id]
    DB.exec("UPDATE volunteers SET name = '#{@name}', project_id = #{@project_id} WHERE id = #{@id};")
  end 

  def ==(volunteer_to_compare)
    self.name == volunteer_to_compare.name && self.id == volunteer_to_compare.id
  end

  def project
    Project.find(self.project_id)
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{@id};")
  end
end