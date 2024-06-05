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
-- Name: black_holes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_holes (
    black_holes_id integer NOT NULL,
    name character varying NOT NULL,
    is_spherical boolean,
    has_life boolean,
    age_in_millions_years integer,
    distance_from_earth integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.black_holes OWNER TO freecodecamp;

--
-- Name: black_holes_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_holes_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_holes_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_holes_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_holes_hole_id_seq OWNED BY public.black_holes.black_holes_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean,
    is_spherical boolean,
    number_of_stars_in_billions numeric(7,3),
    galaxy_type integer,
    type_desc text
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
    name character varying,
    age_in_millions_of_years integer,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(7,3),
    moon_type integer,
    planet_id integer NOT NULL
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
    name character varying,
    age_in_millions_of_years integer,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(7,3),
    planet_type integer,
    star_id integer NOT NULL
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
    name character varying,
    age_in_millions_of_years integer,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(7,3),
    star_type integer,
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
-- Name: black_holes black_holes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes ALTER COLUMN black_holes_id SET DEFAULT nextval('public.black_holes_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: black_holes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_holes VALUES (1, 'Sagittarius A*', true, false, 4000000, 26000, 1);
INSERT INTO public.black_holes VALUES (2, 'M87*', true, false, 5500000, 55000, 6);
INSERT INTO public.black_holes VALUES (3, 'Cygnus X-1', false, false, 600000, 6100, 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 12600, true, false, NULL, 0, NULL);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 13800, false, false, 20.000, 1, NULL);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 13800, false, false, 1000.000, 0, NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 13000, false, true, 40.000, 1, NULL);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 13000, false, false, 2.000, 2, NULL);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 13000, false, true, 1000.000, 3, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 4500, false, true, 0.000, 1, 3);
INSERT INTO public.moon VALUES (22, 'Phobos', 4500, false, true, 0.003, 1, 4);
INSERT INTO public.moon VALUES (23, 'Deimos', 4500, false, true, 0.005, 1, 4);
INSERT INTO public.moon VALUES (24, 'Ganymede', 4500, false, true, 1.070, 2, 5);
INSERT INTO public.moon VALUES (25, 'Callisto', 4500, false, true, 1.880, 2, 5);
INSERT INTO public.moon VALUES (26, 'Io', 4500, false, true, 0.421, 2, 5);
INSERT INTO public.moon VALUES (27, 'Europa', 4500, false, true, 0.671, 2, 5);
INSERT INTO public.moon VALUES (28, 'Titan', 4500, false, true, 1.220, 2, 6);
INSERT INTO public.moon VALUES (29, 'Enceladus', 4500, false, true, 0.001, 2, 6);
INSERT INTO public.moon VALUES (30, 'Mimas', 4500, false, true, 0.001, 2, 6);
INSERT INTO public.moon VALUES (31, 'Triton', 4500, false, true, 0.354, 1, 8);
INSERT INTO public.moon VALUES (32, 'Charon', 4500, false, true, 0.002, 1, 9);
INSERT INTO public.moon VALUES (33, 'Phoebe', 4500, false, true, 0.129, 1, 9);
INSERT INTO public.moon VALUES (34, 'Rhea', 4500, false, true, 0.001, 1, 9);
INSERT INTO public.moon VALUES (35, 'Dione', 4500, false, true, 0.001, 1, 9);
INSERT INTO public.moon VALUES (36, 'Hyperion', 4500, false, true, 0.001, 1, 9);
INSERT INTO public.moon VALUES (37, 'Iapetus', 4500, false, true, 0.002, 1, 9);
INSERT INTO public.moon VALUES (38, 'Miranda', 4500, false, true, 0.001, 1, 9);
INSERT INTO public.moon VALUES (39, 'Ariel', 4500, false, true, 0.001, 1, 9);
INSERT INTO public.moon VALUES (40, 'Umbriel', 4500, false, true, 0.001, 1, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500, false, true, 54.600, 1, 2);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, false, true, 108.200, 1, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 4500, true, true, 0.000, 1, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 4500, false, true, 225.000, 1, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4500, false, false, 588.000, 2, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 4500, false, false, 1195.000, 2, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 4500, false, false, 1784.000, 2, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 4500, false, false, 2793.000, 2, 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 4500, false, true, 3667.000, 1, 3);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 10000, true, true, 5000.000, 3, 4);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 10000, true, true, 4000.000, 3, 6);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 10000, true, true, 4100.000, 3, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 4600, false, true, 8.300, 0, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 4600, false, true, 4.370, 0, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 4600, false, true, 4.370, 1, 1);
INSERT INTO public.star VALUES (6, 'Sirius', 250, false, true, 8.600, 3, 1);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 1000000, false, true, 642.500, 4, 1);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 6000, false, true, 4.240, 5, 1);


--
-- Name: black_holes_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_holes_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: black_holes black_holes_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_name_key UNIQUE (name);


--
-- Name: black_holes black_holes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_pkey PRIMARY KEY (black_holes_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: black_holes black_hole_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_hole_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

