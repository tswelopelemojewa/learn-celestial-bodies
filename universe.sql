--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    constellation text,
    designations text,
    name_meaning text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy1_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy1_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy1_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy1_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy1_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_star_planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star_planet_moon (
    galaxy_star_planet_moon_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer NOT NULL,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.galaxy_star_planet_moon OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq OWNED BY public.galaxy_star_planet_moon.galaxy_star_planet_moon_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_planet numeric(15,3),
    diameter_in_km integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    number_of_moons integer,
    distance_from_earth numeric(18,3),
    is_spherrical boolean,
    star_id integer NOT NULL,
    has_life boolean
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
    name character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    discovery_year integer,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy1_galaxy_id_seq'::regclass);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon ALTER COLUMN galaxy_star_planet_moon_id SET DEFAULT nextval('public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our very own', ' ', 'Our own galaxy. It is said to look like a band of light');
INSERT INTO public.galaxy VALUES (2, 'Backward Galaxy', 'Centaurus', 'NGC 4622, PGC 42701', 'It seems to rotate in the opposite direction to what it should according to its shape.');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Andromeda', 'M31, NGC 224, UGC 454, PGC 2557', 'In mythology, Andromeda is the daughter of the kings of Ethiopia and is said to be more beautiful than the Nereids. She becomes queen of Greece when she marries Perseus');
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'Coma Berenices', 'Evil Eye Galaxy, M64, NGC 4826, PGC 44182', 'It looks like an eye with a dark stripe underneath');
INSERT INTO public.galaxy VALUES (5, 'Butterfly Galaxies', 'Virgo', 'NGC 4567 & 4568, UGC 7776 & 7777, PGC 42064 & 42069', 'Binary galaxies. It looks like a pair of butterfly wings.');
INSERT INTO public.galaxy VALUES (6, 'Antennae Galaxy', 'Corvus', 'NGC 4038 & 4039, ', 'Our own galaxy. It is said to look like a band of light');


--
-- Data for Name: galaxy_star_planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star_planet_moon VALUES (1, 'Itachi', 1, 1, 1, 1);
INSERT INTO public.galaxy_star_planet_moon VALUES (2, 'Kisame', 1, 2, 3, 2);
INSERT INTO public.galaxy_star_planet_moon VALUES (3, 'Nagato', 1, 2, 1, 2);
INSERT INTO public.galaxy_star_planet_moon VALUES (4, 'Obito', 3, 4, 12, 2);
INSERT INTO public.galaxy_star_planet_moon VALUES (5, 'Sasori', 3, 3, 11, 2);
INSERT INTO public.galaxy_star_planet_moon VALUES (6, 'Konan', 1, 1, 9, 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400.000, 28383322, 1);
INSERT INTO public.moon VALUES (2, 'Deimos', 23460.000, 387322, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 9270.000, 2376328, 4);
INSERT INTO public.moon VALUES (4, 'Adrastea', 128980.000, 637446, 6);
INSERT INTO public.moon VALUES (5, 'Aitne', 23547000.000, 64823732, 6);
INSERT INTO public.moon VALUES (6, 'Amalthea', 181300.000, 732634, 6);
INSERT INTO public.moon VALUES (7, 'Aegir', 20735000.000, 4273623, 7);
INSERT INTO public.moon VALUES (8, 'Anthe', 197700.000, 2632562, 7);
INSERT INTO public.moon VALUES (9, 'Atlas', 137640.000, 2563542, 7);
INSERT INTO public.moon VALUES (10, 'Ariel', 191240.000, 23654522, 5);
INSERT INTO public.moon VALUES (11, 'Belinda', 75260.000, 2736542, 5);
INSERT INTO public.moon VALUES (12, 'Bianca', 75260.000, 4762873, 5);
INSERT INTO public.moon VALUES (13, 'Creassida', 61770.000, 98374, 5);
INSERT INTO public.moon VALUES (14, 'Despina', 62000.000, 263532, 8);
INSERT INTO public.moon VALUES (15, 'Larissa', 73600.000, 2326732, 8);
INSERT INTO public.moon VALUES (16, 'Laomedeia', 22613200.000, 265343, 8);
INSERT INTO public.moon VALUES (17, 'Neso', 47279670.000, 7232563, 8);
INSERT INTO public.moon VALUES (18, 'Proteus', 117600.000, 287346, 8);
INSERT INTO public.moon VALUES (19, 'Nix', 48675.000, 2365247, 9);
INSERT INTO public.moon VALUES (20, 'Hydra', 64780.000, 236548754, 9);
INSERT INTO public.moon VALUES (21, 'Charon', 19571.000, 2736843, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mecury', 0, 10.000, true, 1, false);
INSERT INTO public.planet VALUES (3, 'Venus', 0, 5.000, true, 1, false);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 10.000, false, 3, false);
INSERT INTO public.planet VALUES (5, 'Uranus', 27, 30.000, false, 2, false);
INSERT INTO public.planet VALUES (6, 'Jupiter', 67, 15.000, false, 1, false);
INSERT INTO public.planet VALUES (7, 'sartun', 62, 20.000, false, 1, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 25.000, false, 1, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 35.000, false, 1, false);
INSERT INTO public.planet VALUES (10, 'Vegeta', 5, 362.000, true, 4, false);
INSERT INTO public.planet VALUES (11, 'Namek', 5, 39.000, false, 2, false);
INSERT INTO public.planet VALUES (12, 'Pandora', 78, 35.000, false, 2, false);
INSERT INTO public.planet VALUES (1, 'Earth', 1, 0.000, false, 1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 6, 1600, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centuri', 8, 1998, 1);
INSERT INTO public.star VALUES (3, 'Mirach', 12, 2002, 3);
INSERT INTO public.star VALUES (4, 'Almach', 20, 2008, 3);
INSERT INTO public.star VALUES (5, 'Charon', 30, 2012, 2);
INSERT INTO public.star VALUES (6, 'Susanoo', 32, 2024, 4);


--
-- Name: galaxy1_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy1_galaxy_id_seq', 6, true);


--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy1_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy1_name_key UNIQUE (name);


--
-- Name: galaxy galaxy1_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy1_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_name_key UNIQUE (name);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_pkey PRIMARY KEY (galaxy_star_planet_moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star_planet_moon galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

