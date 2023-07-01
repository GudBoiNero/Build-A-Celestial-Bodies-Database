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

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    galaxy_id integer NOT NULL,
    comet_id integer DEFAULT nextval('public.comet_comet_id_seq'::regclass) NOT NULL,
    name character varying(40) NOT NULL,
    tail_length_in_km integer NOT NULL,
    nucleus_size_in_km integer NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass) NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    distance_in_ly integer,
    radius_in_ly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    planet_id integer NOT NULL,
    moon_id integer DEFAULT nextval('public.moon_moon_id_seq'::regclass) NOT NULL,
    name character varying(40) NOT NULL,
    spherical boolean NOT NULL,
    has_atmosphere boolean DEFAULT true NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    galaxy_id integer NOT NULL,
    planet_id integer DEFAULT nextval('public.planet_planet_id_seq'::regclass) NOT NULL,
    name character varying(40) NOT NULL,
    average_temp_in_celsius numeric NOT NULL,
    description text NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    galaxy_id integer NOT NULL,
    star_id integer DEFAULT nextval('public.star_star_id_seq'::regclass) NOT NULL,
    name character varying(40) NOT NULL,
    distance_in_ly integer NOT NULL,
    mass_in_kg integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

-- SUPER MARIO GALAXY IS SO COOL
INSERT INTO public.galaxy(galaxy_id, name, description, distance_in_ly, radius_in_ly) VALUES(
    1, 
    'Freezeflame Galaxy', 
    'The Freezeflame Galaxy consists of a piece of frozen water, ice, and hot magma. It contains Ice Flowers and Fire Flowers.', 
    4284, -- Arbitrary Numbers
    522500 -- Arbitrary Numbers
), (
    2, 
    'Honeyclimb Galaxy', 
    'The Honeyclimb Galaxy is located in the Bedroom. This galaxy tests Marios skill with the Bee Mushroom. It only contains a single Power Star.', 
    25910, -- Arbitrary Numbers
    2100 -- Arbitrary Numbers
), (
    3, 
    'Ghostly Galaxy', 
    'The Ghostly Galaxy is located in the Kitchen and the second encountered. Its unlocking criterea is to get 20 Power Stars, including the Grand Stars in Bowser Jr.s Robot Reactor and Bowsers Star Reactor. The galaxy is ghost themed and the boss is Bouldergeist. Luigi makes his first appearance in this galaxy.', 
    139, -- Arbitrary Numbers
    2491 -- Arbitrary Numbers
), (
    4, 
    'Deep Dark Galaxy', 
    'The Deep Dark Galaxy features an underwater cavern. In order to unlock this galaxy, Mario must get 46 Power Stars. The Toad Brigade and the Starshroom appear in this galaxy. It is a ghost-themed galaxy, like the Boos Boneyard Galaxy and the Ghostly Galaxy, although its theme is closer to that of an abandoned cave. The main planet in it has a beach with many Crabbers. There are very few planets aside from the big, main one. Guppy makes his second appearance here.', 
    19495, -- Arbitrary Numbers
    2049 -- Arbitrary Numbers
), (
    5, 
    'Snow Cap Galaxy', 
    'The Snow Cap Galaxy is a galaxy that has Mario chase down Star Bunnies on a snow-covered planet. The Fire Flower makes an appearance in this galaxy. It is accessed via the Hungry Luma next to the Garden, which only appears after The Sinking Lava Spire has been completed.', 
    1848, -- Arbitrary Numbers
    1294 -- Arbitrary Numbers
), (
    6, 
    'Matter Splatter Galaxy', 
    'The Matter Splatter Galaxy basically consists of matter everywhere. And theres just one problem: Its there one second and the next, its gone. If Mario is not careful, or he makes one single mistake, he will fall into the cosmos and youll have to try again. This is a really hard mission if the player doesnt know what he or she is doing.', 
    294194, -- Arbitrary Numbers
    19535 -- Arbitrary Numbers
);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet(galaxy_id, name, average_temp_in_celsius, description, star_id, has_life) VALUES (
    6, 
    'Switch Swap Planet', 
    0,
    'Random objects appear and disappear at a steady rate. Not sure why though.',
    6, -- star_id
    false -- has life
), (
    6, 
    'Flip Flop Planet', 
    5,
    'There are a bunch of buttons that make some objects dissapear, and others reappear in their place. Pretty strange, right?',
    6, -- star_id
    false -- has life
), (
    5, 
    'Frozen Peak Planet', 
    -45,
    'Literally Mt. Everest. I assume its pretty dangerous',
    5, -- star_id
    true -- has life
), (
    4, 
    'Noir Sea Planet', 
    -20,
    'A pitch black sea with terrifying creatures lurking below. Sounds like a nice beach day!',
    4, -- star_id
    true -- has life
), (
    3, 
    'Haunted House Planet',
    0,
    'Its a haunted house.' ,
    3, -- star_id
    false -- has life
), (
    3, 
    'Ghastly Planet', 
    -5,
    'A scary planet meant for only the dead to go. Enter only if you wish to see the horrors of the paranormal.',
    3, -- star_id
    false -- has life
), (
    1, 
    'Scorched Planet', 
    255,
    'This planet is way too hot. Magma is located everywhere you look.',
    1, -- star_id
    false -- has life
), (
    1, 
    'Freezeburned Planet', 
    -150,
    'A planet so cold it got burnt. Maybe dont go there.',
    1, -- star_id
    false -- has life
), (
    2, 
    'Sweet Comb Planet', 
    1,
    'An incredibly sweet planet. Filled to the brim with cute and fluffy bees. Plus there are tons of honeycombs.',
    2, -- star_id
    true -- has life
), (
    2, 
    'Farmstead Planet', 
    1,
    'It seems the bees here have taken to a life of farming. It appears they enjoy seeing the fruits of their labor after pollination their crops.',
    2, -- star_id
    true -- has life
), (
    1, 
    'Glass Eruptions Planet', 
    1,
    'The entire planet is made up of ice like formations. Occasionally these formations spontaneously erupt out of seemingly nowhere.',
    1, -- star_id
    true -- has life
), (
    3, 
    'Abstract Planet', 
    1,
    '"From my observations, I notice many abrubt random movement from the terrain and objects around me. It looks like any normal forest, but the atmosphere is bleak and dark." - Star Traveler',
    3, -- star_id
    true -- has life
);

--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star(galaxy_id, name, distance_in_ly, mass_in_kg) VALUES 
    (1, 'Hot And Cold Star', 19259, 1900000), 
    (2, 'Cookie Star', 1295, 28350), 
    (3, 'Wisp Star', 128599, 1850),
    (4, 'Black Star', 81259, 89025),
    (5, 'Frozen Solid Star', 91559, 7728),
    (6, 'Light Switch Star', 853210, 8913);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon(planet_id, name, spherical, has_atmosphere) VALUES 
    (1, 'Lego Brick', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false),
    (0, '', false, false);

--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: comet comet_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);

--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

