--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: antoniocruz1
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.projects OWNER TO antoniocruz1;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: antoniocruz1
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO antoniocruz1;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: antoniocruz1
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: antoniocruz1
--

CREATE TABLE public.volunteers (
    id integer NOT NULL,
    project_id integer,
    name character varying
);


ALTER TABLE public.volunteers OWNER TO antoniocruz1;

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: antoniocruz1
--

CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_id_seq OWNER TO antoniocruz1;

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: antoniocruz1
--

ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: antoniocruz1
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: antoniocruz1
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: antoniocruz1
--

COPY public.projects (id, title) FROM stdin;
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: antoniocruz1
--

COPY public.volunteers (id, project_id, name) FROM stdin;
646	844	\N
647	845	\N
648	846	\N
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: antoniocruz1
--

SELECT pg_catalog.setval('public.projects_id_seq', 849, true);


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: antoniocruz1
--

SELECT pg_catalog.setval('public.volunteers_id_seq', 656, true);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: antoniocruz1
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: antoniocruz1
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

