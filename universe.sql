--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: fiction; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.fiction (
    fiction_id integer NOT NULL,
    is_fiction boolean,
    name character varying(30) NOT NULL
);


ALTER TABLE public.fiction OWNER TO freecodecamp;

--
-- Name: fiction_universe_fiction_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.fiction_universe_fiction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fiction_universe_fiction_id_seq OWNER TO freecodecamp;

--
-- Name: fiction_universe_fiction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.fiction_universe_fiction_id_seq OWNED BY public.fiction.fiction_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    have_life boolean,
    age integer,
    age_million_years numeric(18,2),
    number_solar_systems integer,
    fiction_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    have_life boolean,
    age integer,
    age_million_years numeric(18,2),
    have_human_missions boolean,
    human_missions_number integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moons_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moons_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    have_life boolean,
    age integer,
    age_million_years numeric(18,2),
    have_moons boolean,
    planets_number integer,
    galaxy_id integer,
    moon_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    have_life boolean,
    age integer,
    age_million_years numeric(18,2),
    planets_number integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: fiction fiction_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fiction ALTER COLUMN fiction_id SET DEFAULT nextval('public.fiction_universe_fiction_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: fiction; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.fiction VALUES (1, true, 'STAR WARS');
INSERT INTO public.fiction VALUES (2, false, 'Real Life');
INSERT INTO public.fiction VALUES (3, true, 'STAR TREK');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (4, 'Cigar', 'Cigar', false, 4, 4.45, 15400000, 1);
INSERT INTO public.galaxy VALUES (5, 'Whirpool Galaxy', 'Whirpool Galaxy', true, 12, 11.92, 180000000, 1);
INSERT INTO public.galaxy VALUES (6, 'Satelite Galaxy', 'Satelite Galaxy', true, 14, 13.52, 250000000, 1);
INSERT INTO public.galaxy VALUES (1, 'Skydriver Galaxy', 'Whirpool Galaxy', true, 14, 13.61, 200000000, 1);
INSERT INTO public.galaxy VALUES (2, 'Magellanes Cloud Galaxy', 'Satelite Galaxy', false, 1, 1.11, 10000, 1);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 'Satelite Galaxy', false, 5, 5.50, 120000000, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Centax-1', 'Curuscant System', true, 1, 0.81, true, 8, 1);
INSERT INTO public.moon VALUES (22, 'Centax-2', 'Curuscant System', true, 1, 1.00, true, 1, 1);
INSERT INTO public.moon VALUES (23, 'Centax-3', 'Curuscant Galaxy', true, 1, 0.09, true, 1, 1);
INSERT INTO public.moon VALUES (24, 'Hesperidium', 'Curuscant System', true, 1, 0.45, true, 4, 1);
INSERT INTO public.moon VALUES (25, 'Muscave', 'Curuscant System', true, 2, 1.92, true, 8, 1);
INSERT INTO public.moon VALUES (26, 'Ajan  moon', 'Alderan System', false, 4, 3.52, true, 5, 6);
INSERT INTO public.moon VALUES (27, 'Garazeb', 'Kashyyyk System', true, 1, 0.81, true, 8, 2);
INSERT INTO public.moon VALUES (28, 'Orrelios', 'Kashyyyk System', true, 1, 1.00, true, 1, 2);
INSERT INTO public.moon VALUES (29, 'Lego', 'Mon Calamari System', true, 1, 0.09, true, 1, 4);
INSERT INTO public.moon VALUES (30, 'Kloss', 'Mon Calamari System', true, 1, 0.45, true, 4, 4);
INSERT INTO public.moon VALUES (31, 'Thyton', 'Curuscant System', true, 2, 1.92, true, 8, 1);
INSERT INTO public.moon VALUES (32, 'Foerost', 'Curuscant System', false, 4, 3.52, true, 5, 1);
INSERT INTO public.moon VALUES (1, 'Curuscant', 'Human System', true, 10, 9.81, true, 8, 1);
INSERT INTO public.moon VALUES (2, 'Kashyyyk', 'Whookie System', true, 18, 17.92, true, 7, 2);
INSERT INTO public.moon VALUES (3, 'Nal Hutta moon', 'Hutt Galaxy', true, 15, 15.09, true, 7, 3);
INSERT INTO public.moon VALUES (4, 'Mon Calamari moon', 'Calamari System', true, 4, 4.45, true, 4, 4);
INSERT INTO public.moon VALUES (5, 'Dantooine moon', 'Dantooine System', true, 12, 11.92, true, 18, 5);
INSERT INTO public.moon VALUES (6, 'Alderaan moon', 'Alderan System', true, 14, 13.52, true, 25, 6);
INSERT INTO public.moon VALUES (7, 'Tatooine moon', 'Human System', true, 10, 9.81, true, 8, 7);
INSERT INTO public.moon VALUES (8, 'Genosis', 'Genosian System', true, 18, 17.92, true, 7, 8);
INSERT INTO public.moon VALUES (9, 'Kamino', 'Kaminoan System', true, 15, 15.09, true, 7, 9);
INSERT INTO public.moon VALUES (10, 'Utapau', 'Human System', true, 4, 4.45, true, 1, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Curuscant', 'Human Planet', true, 10, 9.81, true, 1, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Kashyyyk', 'Whookie Planet', true, 18, 17.92, true, 1, NULL, 2);
INSERT INTO public.planet VALUES (3, 'Nal Hutta', 'Hutt Planet', true, 15, 15.09, true, 2, NULL, 3);
INSERT INTO public.planet VALUES (4, 'Mon Calamarin', 'Calamari Planet', true, 4, 4.45, true, 3, NULL, 4);
INSERT INTO public.planet VALUES (5, 'Dantooine', 'Dantooine Planet', true, 12, 11.92, true, 6, NULL, 5);
INSERT INTO public.planet VALUES (6, 'Alderaan', 'Alderan Planet (Destroyed)', false, 14, 13.52, true, 0, NULL, 6);
INSERT INTO public.planet VALUES (7, 'Tatooine', 'Human Planet', true, 10, 9.81, true, 1, NULL, 7);
INSERT INTO public.planet VALUES (8, 'Genosis', 'Genosis Planet', false, 18, 17.92, true, 1, NULL, 8);
INSERT INTO public.planet VALUES (9, 'Kamino', 'Kamino Planet', true, 15, 15.09, true, 2, NULL, 9);
INSERT INTO public.planet VALUES (10, 'Utapau', 'Utapau Planet', false, 4, 4.45, true, 4, NULL, 10);
INSERT INTO public.planet VALUES (11, 'Endor', 'Human Planet', true, 10, 9.81, true, 1, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Kessel', 'Human Planet', false, 18, 17.92, true, 1, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Exegol', 'Sith Planet', false, 15, 15.09, true, 2, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'Mygeeto', 'Uknown Planet', false, 4, 4.45, true, 3, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Curuscant', 'Human System', true, 10, 9.81, 8, 1);
INSERT INTO public.star VALUES (2, 'Kashyyyk', 'Whookie System', true, 18, 17.92, 7, 1);
INSERT INTO public.star VALUES (3, 'Nal Hutta', 'Hutt Galaxy', true, 15, 15.09, 7, 1);
INSERT INTO public.star VALUES (4, 'Mon Calamari', 'Calamari System', true, 4, 4.45, 4, 1);
INSERT INTO public.star VALUES (5, 'Dantooine', 'Dantooine System', true, 12, 11.92, 18, 1);
INSERT INTO public.star VALUES (6, 'Alderaan', 'Alderan System', false, 14, 13.52, 25, 1);
INSERT INTO public.star VALUES (7, 'Tatooine', 'Human System', true, 10, 9.81, 8, 1);
INSERT INTO public.star VALUES (8, 'Genosis', 'Genosian System', true, 18, 17.92, 7, 1);
INSERT INTO public.star VALUES (9, 'Kamino', 'Kaminoan System', true, 15, 15.09, 7, 1);
INSERT INTO public.star VALUES (10, 'Utapau', 'Human System', true, 4, 4.45, 1, 1);


--
-- Name: fiction_universe_fiction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.fiction_universe_fiction_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moons_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_moon_id_seq', 32, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: fiction fiction_universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fiction
    ADD CONSTRAINT fiction_universe_pkey PRIMARY KEY (fiction_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy uc_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uc_name UNIQUE (name);


--
-- Name: fiction uc_name_fiction; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fiction
    ADD CONSTRAINT uc_name_fiction UNIQUE (name);


--
-- Name: moon uc_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uc_name_moon UNIQUE (name);


--
-- Name: planet uc_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uc_name_planet UNIQUE (name);


--
-- Name: star uc_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uc_name_star UNIQUE (name);


--
-- Name: galaxy fiction; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fiction FOREIGN KEY (fiction_id) REFERENCES public.fiction(fiction_id);


--
-- Name: planet fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

