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
    name character varying(30),
    type character varying(50),
    distance_from_earth numeric(10,2),
    number_of_stars integer,
    is_active boolean DEFAULT true NOT NULL
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
    planet_id integer,
    distance_from_planet numeric(10,2),
    diameter integer,
    surface_type text,
    CONSTRAINT name CHECK ((name IS NOT NULL))
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
    name character varying(30),
    star_id integer,
    radius integer,
    mass numeric(10,2),
    atmosphere text,
    has_life boolean DEFAULT false NOT NULL
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    orbit_period integer,
    has_communication boolean DEFAULT true NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    spectral_type character varying(50),
    luminosity numeric(10,2)
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000.00, 200, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000.00, 300, true);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Elliptical', 53490000.00, 150, true);
INSERT INTO public.galaxy VALUES (4, 'Messier 31', 'Spiral', 2537000.00, 280, true);
INSERT INTO public.galaxy VALUES (5, 'Messier 33', 'Spiral', 2723000.00, 90, true);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring', 150000.00, 50, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 384400.00, 3475, 'Rocky');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 9377.00, 22, 'Rocky');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 23460.00, 12, 'Rocky');
INSERT INTO public.moon VALUES (4, 'Io', 3, 421800.00, 3660, 'Rocky, Volcanic');
INSERT INTO public.moon VALUES (5, 'Europa', 3, 671100.00, 3122, 'Water, Ice, Rocky');
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 1070400.00, 5262, 'Rocky, Ice');
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 1882700.00, 4821, 'Rocky, Ice');
INSERT INTO public.moon VALUES (8, 'Titan', 4, 1221870.00, 5150, 'Rocky, Ice, Methane Lakes');
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 527068.00, 1528, 'Rocky, Ice');
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 3560840.00, 1436, 'Rocky, Ice');
INSERT INTO public.moon VALUES (11, 'Triton', 5, 354759.00, 2705, 'Rocky, Ice, Volcanic');
INSERT INTO public.moon VALUES (12, 'Titania', 6, 436300.00, 1578, 'Rocky, Ice');
INSERT INTO public.moon VALUES (13, 'Oberon', 6, 583500.00, 1523, 'Rocky, Ice');
INSERT INTO public.moon VALUES (14, 'Charon', 7, 19591.00, 1208, 'Rocky, Ice');
INSERT INTO public.moon VALUES (15, 'Hydra', 7, 64738.00, 50, 'Rocky, Ice');
INSERT INTO public.moon VALUES (16, 'Nix', 7, 48694.00, 49, 'Rocky, Ice');
INSERT INTO public.moon VALUES (17, 'Kerberos', 7, 57814.00, 19, 'Rocky, Ice');
INSERT INTO public.moon VALUES (18, 'Styx', 7, 42656.00, 16, 'Rocky, Ice');
INSERT INTO public.moon VALUES (19, 'Moon20', 1, 200000.00, 200, 'Unknown');
INSERT INTO public.moon VALUES (20, 'Moon21', 1, 250000.00, 250, 'Unknown');
INSERT INTO public.moon VALUES (21, 'Moon22', 1, 300000.00, 300, 'Unknown');
INSERT INTO public.moon VALUES (22, 'Moon23', 1, 350000.00, 350, 'Unknown');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, 5.97, 'Nitrogen, Oxygen', true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3389, 0.64, 'Carbon Dioxide, Nitrogen', false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 2, 69911, 1898.00, 'Hydrogen, Helium', false);
INSERT INTO public.planet VALUES (4, 'Saturn', 2, 58232, 568.00, 'Hydrogen, Helium', false);
INSERT INTO public.planet VALUES (5, 'Neptune', 3, 24622, 102.00, 'Hydrogen, Helium, Methane', false);
INSERT INTO public.planet VALUES (6, 'Uranus', 3, 25362, 86.80, 'Hydrogen, Helium, Methane', false);
INSERT INTO public.planet VALUES (7, 'Ceres', 1, 470, 0.00, NULL, false);
INSERT INTO public.planet VALUES (8, 'Pluto', 1, 1188, 0.00, NULL, false);
INSERT INTO public.planet VALUES (9, 'Haumea', 1, 620, 0.00, NULL, false);
INSERT INTO public.planet VALUES (10, 'Makemake', 1, 715, 0.00, NULL, false);
INSERT INTO public.planet VALUES (11, 'Eris', 1, 1163, 0.00, NULL, false);
INSERT INTO public.planet VALUES (13, 'Mercury', 1, 2440, 0.33, 'Minimal atmosphere, mostly composed of oxygen, sodium, hydrogen, helium, and potassium', false);
INSERT INTO public.planet VALUES (14, 'Venus', 1, 6052, 4.87, 'Carbon dioxide, nitrogen', false);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Satellite1', 1, 30, true);
INSERT INTO public.satellite VALUES (2, 'Satellite2', 1, 45, true);
INSERT INTO public.satellite VALUES (3, 'Satellite3', 2, 25, false);
INSERT INTO public.satellite VALUES (4, 'Satellite4', 3, 60, true);
INSERT INTO public.satellite VALUES (5, 'Satellite5', 4, 35, true);
INSERT INTO public.satellite VALUES (6, 'Satellite6', 5, 40, false);
INSERT INTO public.satellite VALUES (7, 'Satellite7', 6, 55, true);
INSERT INTO public.satellite VALUES (8, 'Satellite8', 7, 70, true);
INSERT INTO public.satellite VALUES (9, 'Satellite9', 1, 28, true);
INSERT INTO public.satellite VALUES (10, 'Satellite10', 2, 42, true);
INSERT INTO public.satellite VALUES (11, 'Satellite11', 3, 58, false);
INSERT INTO public.satellite VALUES (12, 'Satellite12', 4, 63, true);
INSERT INTO public.satellite VALUES (13, 'Satellite13', 5, 47, true);
INSERT INTO public.satellite VALUES (14, 'Satellite14', 6, 51, false);
INSERT INTO public.satellite VALUES (15, 'Satellite15', 7, 67, true);
INSERT INTO public.satellite VALUES (16, 'Satellite16', 1, 33, true);
INSERT INTO public.satellite VALUES (17, 'Satellite17', 2, 49, true);
INSERT INTO public.satellite VALUES (18, 'Satellite18', 3, 66, false);
INSERT INTO public.satellite VALUES (19, 'Satellite19', 4, 72, true);
INSERT INTO public.satellite VALUES (20, 'Satellite20', 5, 55, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.00);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 'G2V', 0.50);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M1Ib', 130000.00);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 'A1V', 25.40);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 'M5.5V', 0.00);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'A0V', 37.00);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: satellite name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT name UNIQUE (name);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

