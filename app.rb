require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

# methods for the homepage #

get('/') do
  @projects = Project.all
  erb(:projects)
end
get('/projects') do
  @projects = Project.all
  erb(:projects)
end

post('/projects') do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save()
  @projects = Project.all()
  erb(:projects)
end

get('/projects/new') do
  erb(:new_project)
end

# Methods pertaining to particular projects #

get('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @projects = Project.all()
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

patch('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update(params[:new_project])
  @projects = Project.all()
  erb(:projects)
end

delete('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.delete()
  @projects = Project.all()
  erb(:projects)
end

#  Methods pertaining to particular volunteers #

get('/projects/:id/volunteers/:volunteer_id/edit') do
  @project = Project.find(params[:id].to_i())
  @volunteer = Volunteer.find(params[:volunteer_id].to_i())
  erb(:volunteer)
end

get('/projects/:id/volunteers/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i())
  erb(:volunteer)
end

post('/projects/:id/volunteers') do
  @project = Project.find(params[:id].to_i())
  @volunteer = Volunteer.new({:name => (params[:new_volunteer]), :project_id => @project.id, :id => nil})
  @volunteer.save()
  erb(:project)
end

patch('/projects/:id/volunteers/:volunteer_id') do
  @project = Project.find(params[:id].to_i())
  @volunteer = Volunteer.find(params[:volunteer_id].to_i())
  @volunteer.update(params[:edit_volunteer], @project.id)
  erb(:project)
end

delete('/projects/:id/volunteers/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i())
  @volunteer.delete()
  @project = Project.find(params[:id].to_i())
  erb(:project)
end