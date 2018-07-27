--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name character varying,
    auth_token character varying,
    "encrypted_password'" character varying,
    phone character varying,
    state character varying
);


ALTER TABLE public.admins OWNER TO xiewei;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO xiewei;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: awards; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.awards (
    id integer NOT NULL,
    award_name character varying(64) NOT NULL,
    url character varying(128) NOT NULL,
    info character varying(128) NOT NULL
);


ALTER TABLE public.awards OWNER TO xiewei;

--
-- Name: awards_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.awards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.awards_id_seq OWNER TO xiewei;

--
-- Name: awards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.awards_id_seq OWNED BY public.awards.id;


--
-- Name: coaches; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.coaches (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    country_name character varying(64) NOT NULL,
    name character varying(64) NOT NULL,
    image_address character varying(128) NOT NULL
);


ALTER TABLE public.coaches OWNER TO xiewei;

--
-- Name: coaches_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.coaches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coaches_id_seq OWNER TO xiewei;

--
-- Name: coaches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.coaches_id_seq OWNED BY public.coaches.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    group_name character varying(64) NOT NULL,
    team_name character varying(64) NOT NULL,
    match_played integer NOT NULL,
    win_number integer NOT NULL,
    draw_number integer NOT NULL,
    lost_number integer NOT NULL,
    goal_number integer NOT NULL,
    goal_against integer NOT NULL,
    diff_goal integer NOT NULL,
    points integer NOT NULL
);


ALTER TABLE public.groups OWNER TO xiewei;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO xiewei;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: matches; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.matches (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    date character varying(64) NOT NULL,
    group_name character varying(64) NOT NULL,
    location character varying(64) NOT NULL,
    country_left character varying(64) NOT NULL,
    country_right character varying(64) NOT NULL,
    score character varying(64) NOT NULL,
    match_number integer NOT NULL
);


ALTER TABLE public.matches OWNER TO xiewei;

--
-- Name: matches_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.matches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matches_id_seq OWNER TO xiewei;

--
-- Name: matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.matches_id_seq OWNED BY public.matches.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.players (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    number integer NOT NULL,
    name character varying(64) NOT NULL,
    country character varying(64) NOT NULL,
    role character varying(64) NOT NULL,
    image_address character varying(128) NOT NULL
);


ALTER TABLE public.players OWNER TO xiewei;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_id_seq OWNER TO xiewei;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: players_statistic_with_disciplinaries; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.players_statistic_with_disciplinaries (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    rank integer NOT NULL,
    player_name character varying(64) NOT NULL,
    matches_payed integer,
    yellow_cards integer,
    second_yellow_cards integer,
    red_cards integer,
    fouls_committed integer,
    fouls_suffered integer,
    fouls_causing_penalty integer
);


ALTER TABLE public.players_statistic_with_disciplinaries OWNER TO xiewei;

--
-- Name: players_statistic_with_disciplinaries_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.players_statistic_with_disciplinaries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_statistic_with_disciplinaries_id_seq OWNER TO xiewei;

--
-- Name: players_statistic_with_disciplinaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.players_statistic_with_disciplinaries_id_seq OWNED BY public.players_statistic_with_disciplinaries.id;


--
-- Name: players_statistic_with_goals_scoreds; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.players_statistic_with_goals_scoreds (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    rank integer NOT NULL,
    player_name character varying(32) NOT NULL,
    goals_scored integer NOT NULL,
    assists integer NOT NULL,
    minutes_played integer NOT NULL,
    matches_played integer NOT NULL,
    penalties_scored integer NOT NULL,
    goals_scored_left integer DEFAULT 0,
    goals_scored_right integer DEFAULT 0,
    headed_goals integer DEFAULT 0
);


ALTER TABLE public.players_statistic_with_goals_scoreds OWNER TO xiewei;

--
-- Name: players_statistic_with_goals_scoreds_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.players_statistic_with_goals_scoreds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_statistic_with_goals_scoreds_id_seq OWNER TO xiewei;

--
-- Name: players_statistic_with_goals_scoreds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.players_statistic_with_goals_scoreds_id_seq OWNED BY public.players_statistic_with_goals_scoreds.id;


--
-- Name: players_statistic_with_shots; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.players_statistic_with_shots (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    rank integer NOT NULL,
    player_name character varying(32) NOT NULL,
    matches_played integer,
    minutes_played integer,
    shots_number integer,
    "attempts_On_target" integer,
    attempts_off_target integer,
    shots_blocked integer
);


ALTER TABLE public.players_statistic_with_shots OWNER TO xiewei;

--
-- Name: players_statistic_with_shots_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.players_statistic_with_shots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_statistic_with_shots_id_seq OWNER TO xiewei;

--
-- Name: players_statistic_with_shots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.players_statistic_with_shots_id_seq OWNED BY public.players_statistic_with_shots.id;


--
-- Name: players_statistic_with_top_saves; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.players_statistic_with_top_saves (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    rank integer NOT NULL,
    player_name character varying(32) NOT NULL,
    matched_played integer,
    minutes_played integer,
    saves_number integer,
    save_rate character varying(20)
);


ALTER TABLE public.players_statistic_with_top_saves OWNER TO xiewei;

--
-- Name: players_statistic_with_top_saves_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.players_statistic_with_top_saves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_statistic_with_top_saves_id_seq OWNER TO xiewei;

--
-- Name: players_statistic_with_top_saves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.players_statistic_with_top_saves_id_seq OWNED BY public.players_statistic_with_top_saves.id;


--
-- Name: team_statistic_with_attempts; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.team_statistic_with_attempts (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    rank integer NOT NULL,
    team_name character varying(12) NOT NULL,
    matches_payed integer NOT NULL,
    shots_number integer NOT NULL,
    attempts_on_target integer NOT NULL,
    attempts_off_target integer NOT NULL,
    shots_blocked_number integer NOT NULL
);


ALTER TABLE public.team_statistic_with_attempts OWNER TO xiewei;

--
-- Name: team_statistic_with_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.team_statistic_with_attempts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_statistic_with_attempts_id_seq OWNER TO xiewei;

--
-- Name: team_statistic_with_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.team_statistic_with_attempts_id_seq OWNED BY public.team_statistic_with_attempts.id;


--
-- Name: team_statistic_with_disciplinaries; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.team_statistic_with_disciplinaries (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    rank integer NOT NULL,
    team_name character varying(12) NOT NULL,
    matches_payed integer NOT NULL,
    yellow_cards integer,
    second_yellow_cards integer,
    red_cards integer,
    fouls_committed integer,
    fouls_suffered integer,
    fouls_causing_penalty integer
);


ALTER TABLE public.team_statistic_with_disciplinaries OWNER TO xiewei;

--
-- Name: team_statistic_with_disciplinaries_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.team_statistic_with_disciplinaries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_statistic_with_disciplinaries_id_seq OWNER TO xiewei;

--
-- Name: team_statistic_with_disciplinaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.team_statistic_with_disciplinaries_id_seq OWNED BY public.team_statistic_with_disciplinaries.id;


--
-- Name: team_statistic_with_top_goals; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.team_statistic_with_top_goals (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    rank integer NOT NULL,
    team_name character varying(12) NOT NULL,
    matches_payed integer NOT NULL,
    goals_for integer NOT NULL,
    goals_scored integer NOT NULL,
    goals_against integer NOT NULL,
    penalty_goal integer NOT NULL,
    own_goals integer NOT NULL,
    open_play_goals integer NOT NULL,
    set_piece_goals integer NOT NULL
);


ALTER TABLE public.team_statistic_with_top_goals OWNER TO xiewei;

--
-- Name: team_statistic_with_top_goals_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.team_statistic_with_top_goals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_statistic_with_top_goals_id_seq OWNER TO xiewei;

--
-- Name: team_statistic_with_top_goals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.team_statistic_with_top_goals_id_seq OWNED BY public.team_statistic_with_top_goals.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    flag_address character varying(128) NOT NULL,
    team_name character varying(64) NOT NULL
);


ALTER TABLE public.teams OWNER TO xiewei;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO xiewei;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: world_cup_archives; Type: TABLE; Schema: public; Owner: xiewei
--

CREATE TABLE public.world_cup_archives (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    world_cup_url character varying(128),
    country_name character varying(128),
    year character varying(64),
    winner_country character varying(64),
    runners_up_name character varying(64),
    third_name character varying(64),
    fourth_name character varying(64),
    final_result character varying(128),
    title character varying(64)
);


ALTER TABLE public.world_cup_archives OWNER TO xiewei;

--
-- Name: world_cup_archives_id_seq; Type: SEQUENCE; Schema: public; Owner: xiewei
--

CREATE SEQUENCE public.world_cup_archives_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.world_cup_archives_id_seq OWNER TO xiewei;

--
-- Name: world_cup_archives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xiewei
--

ALTER SEQUENCE public.world_cup_archives_id_seq OWNED BY public.world_cup_archives.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: awards id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.awards ALTER COLUMN id SET DEFAULT nextval('public.awards_id_seq'::regclass);


--
-- Name: coaches id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.coaches ALTER COLUMN id SET DEFAULT nextval('public.coaches_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: matches id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.matches ALTER COLUMN id SET DEFAULT nextval('public.matches_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: players_statistic_with_disciplinaries id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.players_statistic_with_disciplinaries ALTER COLUMN id SET DEFAULT nextval('public.players_statistic_with_disciplinaries_id_seq'::regclass);


--
-- Name: players_statistic_with_goals_scoreds id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.players_statistic_with_goals_scoreds ALTER COLUMN id SET DEFAULT nextval('public.players_statistic_with_goals_scoreds_id_seq'::regclass);


--
-- Name: players_statistic_with_shots id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.players_statistic_with_shots ALTER COLUMN id SET DEFAULT nextval('public.players_statistic_with_shots_id_seq'::regclass);


--
-- Name: players_statistic_with_top_saves id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.players_statistic_with_top_saves ALTER COLUMN id SET DEFAULT nextval('public.players_statistic_with_top_saves_id_seq'::regclass);


--
-- Name: team_statistic_with_attempts id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.team_statistic_with_attempts ALTER COLUMN id SET DEFAULT nextval('public.team_statistic_with_attempts_id_seq'::regclass);


--
-- Name: team_statistic_with_disciplinaries id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.team_statistic_with_disciplinaries ALTER COLUMN id SET DEFAULT nextval('public.team_statistic_with_disciplinaries_id_seq'::regclass);


--
-- Name: team_statistic_with_top_goals id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.team_statistic_with_top_goals ALTER COLUMN id SET DEFAULT nextval('public.team_statistic_with_top_goals_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Name: world_cup_archives id; Type: DEFAULT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.world_cup_archives ALTER COLUMN id SET DEFAULT nextval('public.world_cup_archives_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.admins (id, created_at, updated_at, deleted_at, name, auth_token, "encrypted_password'", phone, state) FROM stdin;
1	2018-07-20 18:11:31.156668+08	2018-07-20 18:11:31.156668+08	\N	18717711819	82e4679aad1986e610dec30b5ed3b33d2f9e5806	$2a$04$5Wu7npoNeok1xtCHXTLDk.XgNqGjZkzxhcsiOaNmBPIioxQ3LaqQS	18717711819	admin
2	2018-07-21 00:10:11.099085+08	2018-07-21 00:10:11.099085+08	\N	FIFA-World-Cup	c6d81d35bc598ddedf3e0b798cd5d463139ab6c9	$2a$04$wKHmdGixgrISJM7wV3rKn.6HX5Bjg8.JbelGYl/443ber3aXI/K8K	110120119	admin
3	2018-07-21 15:35:24.595623+08	2018-07-21 15:35:24.595623+08	\N	xieweiwei	af3e134a94bc491853739baab275af6ee41d8388	$2a$04$Oj4riiVjTMt3xolPK0pzieYRrxww4KpVJvytOKBfMVmwEqY5zz0je	187277272727	admin
\.


--
-- Data for Name: awards; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.awards (id, award_name, url, info) FROM stdin;
1	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	2018: Harry Kane (England) 6 goals
2	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	2014: James Rodríguez (Colombia) 6 Goals
3	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	2010: Thomas Muller (Germany ) 5 Goals
4	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	2006: Miroslav Klose (Germany) 5 Goals
5	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	2002: Ronaldo (Brazil) 8 Goals
6	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1998: Davor Suker (Croatia) 6 Goals
7	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1994: Hristo Stoichkov (Bulgaria), Oleg Salenko (Russia) 6 Goals
8	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1990: Salvatore Schillaci (Italy) 6 Goals
9	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1986: Gary Lineker (England) 6 Goals
10	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1982: Paolo Rossi (Italy) 6 Goals
11	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1978: Mario Kempes (Argentina) 6 Goals
12	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1974: Grzegorz Lato (Poland) 7 Goals
13	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1970: Gerd Muller (Germany) 10 Goals
14	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1966: Eusebio (Portugal) 9 Goals
15	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1958: Just Fontaine (France) 13 Goals
16	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1954: Sandor Kocsis (Hungary) 11 Goals
17	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1950: Ademir (Brazil) 9 Goals
18	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1938: Leonidas (Brazil) 8 Goals
19	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1934: Oldrich Nejedly (Czechoslovakia) 5 Goals
20	adidas Golden Boot Award	https://www.fifa.com/worldcup/awards/golden-boot/	1930: Guillermo Stabile (Argentina) 8 Goals
21	adidas Golden Glove Award	https://www.fifa.com/worldcup/awards/golden-glove/	2010: Iker Casillas (Spain)
22	adidas Golden Glove Award	https://www.fifa.com/worldcup/awards/golden-glove/	2006: Gianluigi Buffon (ITA) *
23	adidas Golden Glove Award	https://www.fifa.com/worldcup/awards/golden-glove/	2002: Oliver Kahn (GER) *
24	adidas Golden Glove Award	https://www.fifa.com/worldcup/awards/golden-glove/	1998: Fabien Barthez (FRA) *
25	adidas Golden Glove Award	https://www.fifa.com/worldcup/awards/golden-glove/	1994: Michel Preud’homme (BEL) *
26	adidas Golden Ball Award	https://www.fifa.com/worldcup/awards/golden-ball/	2014: Lionel Messi (Argentina)
27	adidas Golden Ball Award	https://www.fifa.com/worldcup/awards/golden-ball/	2010: Diego Forlan (Uruguay)
28	adidas Golden Ball Award	https://www.fifa.com/worldcup/awards/golden-ball/	2006: Zinedine Zidane (France)
29	adidas Golden Ball Award	https://www.fifa.com/worldcup/awards/golden-ball/	2002: Oliver Kahn (Germany)
30	adidas Golden Ball Award	https://www.fifa.com/worldcup/awards/golden-ball/	1998: Ronaldo (Brazil)
31	adidas Golden Ball Award	https://www.fifa.com/worldcup/awards/golden-ball/	1994: Romario (Brazil)
32	adidas Golden Ball Award	https://www.fifa.com/worldcup/awards/golden-ball/	1990: Salvatore Schillaci (Italy)
33	adidas Golden Ball Award	https://www.fifa.com/worldcup/awards/golden-ball/	1986: Diego Maradona (Argentina)
34	adidas Golden Ball Award	https://www.fifa.com/worldcup/awards/golden-ball/	1982: Paolo Rossi (Italy)
\.


--
-- Data for Name: coaches; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.coaches (id, created_at, updated_at, deleted_at, country_name, name, image_address) FROM stdin;
1	2018-07-16 18:55:39.095496+08	2018-07-16 18:55:39.095496+08	\N	Poland	Adam NAWALKA	https://api.fifa.com/api/v1/picture/players/2018fwc/54986_sq-300_jpg?allowDefaultPicture=true
2	2018-07-16 18:55:39.101191+08	2018-07-16 18:55:39.101191+08	\N	Denmark	Age HAREIDE	https://api.fifa.com/api/v1/picture/players/2018fwc/50605_sq-300_jpg?allowDefaultPicture=true
3	2018-07-16 18:55:39.103809+08	2018-07-16 18:55:39.103809+08	\N	Japan	Akira NISHINO	https://api.fifa.com/api/v1/picture/players/2018fwc/55195_sq-300_jpg?allowDefaultPicture=true
4	2018-07-16 18:55:39.107927+08	2018-07-16 18:55:39.107927+08	\N	Senegal	Aliou CISSE	https://api.fifa.com/api/v1/picture/players/2018fwc/177583_sq-300_jpg?allowDefaultPicture=true
5	2018-07-16 18:55:39.110198+08	2018-07-16 18:55:39.110198+08	\N	Australia	Bert VAN MARWIJK	https://api.fifa.com/api/v1/picture/players/2018fwc/296143_sq-300_jpg?allowDefaultPicture=true
6	2018-07-16 18:55:39.112259+08	2018-07-16 18:55:39.112259+08	\N	IR Iran	Carlos QUEIROZ	https://api.fifa.com/api/v1/picture/players/2018fwc/34969_sq-300_jpg?allowDefaultPicture=true
7	2018-07-16 18:55:39.114206+08	2018-07-16 18:55:39.114206+08	\N	France	Didier DESCHAMPS	https://api.fifa.com/api/v1/picture/players/2018fwc/48455_sq-300_jpg?allowDefaultPicture=true
8	2018-07-16 18:55:39.118479+08	2018-07-16 18:55:39.118479+08	\N	Spain	Fernando HIERRO	https://api.fifa.com/api/v1/picture/players/2018fwc/174605_sq-300_jpg?allowDefaultPicture=true
9	2018-07-16 18:55:39.121044+08	2018-07-16 18:55:39.121044+08	\N	Portugal	Fernando SANTOS	https://api.fifa.com/api/v1/picture/players/2018fwc/325536_sq-300_jpg?allowDefaultPicture=true
10	2018-07-16 18:55:39.125216+08	2018-07-16 18:55:39.125216+08	\N	England	Gareth SOUTHGATE	https://api.fifa.com/api/v1/picture/players/2018fwc/155121_sq-300_jpg?allowDefaultPicture=true
11	2018-07-16 18:55:39.128279+08	2018-07-16 18:55:39.128279+08	\N	Nigeria	Gernot ROHR	https://api.fifa.com/api/v1/picture/players/2018fwc/321621_sq-300_jpg?allowDefaultPicture=true
12	2018-07-16 18:55:39.132992+08	2018-07-16 18:55:39.132992+08	\N	Egypt	Hector CUPER	https://api.fifa.com/api/v1/picture/players/2018fwc/299443_sq-300_jpg?allowDefaultPicture=true
13	2018-07-16 18:55:39.135314+08	2018-07-16 18:55:39.135314+08	\N	Iceland	Heimir HALLGRIMSSON	https://api.fifa.com/api/v1/picture/players/2018fwc/375569_sq-300_jpg?allowDefaultPicture=true
14	2018-07-16 18:55:39.137187+08	2018-07-16 18:55:39.137187+08	\N	Panama	Hernan GOMEZ	https://api.fifa.com/api/v1/picture/players/2018fwc/170782_sq-300_jpg?allowDefaultPicture=true
15	2018-07-16 18:55:39.139242+08	2018-07-16 18:55:39.139242+08	\N	Morocco	Herve RENARD	https://api.fifa.com/api/v1/picture/players/2018fwc/296787_sq-300_jpg?allowDefaultPicture=true
16	2018-07-16 18:55:39.141419+08	2018-07-16 18:55:39.141419+08	\N	Sweden	Janne ANDERSSON	https://api.fifa.com/api/v1/picture/players/2018fwc/398564_sq-300_jpg?allowDefaultPicture=true
17	2018-07-16 18:55:39.143591+08	2018-07-16 18:55:39.143591+08	\N	Germany	Joachim LOEW	https://api.fifa.com/api/v1/picture/players/2018fwc/232917_sq-300_jpg?allowDefaultPicture=true
18	2018-07-16 18:55:39.146334+08	2018-07-16 18:55:39.146334+08	\N	Argentina	Jorge SAMPAOLI	https://api.fifa.com/api/v1/picture/players/2018fwc/364182_sq-300_jpg?allowDefaultPicture=true
19	2018-07-16 18:55:39.151399+08	2018-07-16 18:55:39.151399+08	\N	Colombia	Jose PEKERMAN	https://api.fifa.com/api/v1/picture/players/2018fwc/40510_sq-300_jpg?allowDefaultPicture=true
20	2018-07-16 18:55:39.153708+08	2018-07-16 18:55:39.153708+08	\N	Saudi Arabia	Juan Antonio PIZZI	https://api.fifa.com/api/v1/picture/players/2018fwc/155147_sq-300_jpg?allowDefaultPicture=true
21	2018-07-16 18:55:39.156159+08	2018-07-16 18:55:39.156159+08	\N	Mexico	Juan Carlos OSORIO	https://api.fifa.com/api/v1/picture/players/2018fwc/331044_sq-300_jpg?allowDefaultPicture=true
22	2018-07-16 18:55:39.163359+08	2018-07-16 18:55:39.163359+08	\N	Serbia	Mladen KRSTAJIC	https://api.fifa.com/api/v1/picture/players/2018fwc/182757_sq-300_jpg?allowDefaultPicture=true
23	2018-07-16 18:55:39.16562+08	2018-07-16 18:55:39.16562+08	\N	Tunisia	Nabil MAALOUL	https://api.fifa.com/api/v1/picture/players/2018fwc/199561_sq-300_jpg?allowDefaultPicture=true
24	2018-07-16 18:55:39.168657+08	2018-07-16 18:55:39.168657+08	\N	Costa Rica	Oscar RAMIREZ	https://api.fifa.com/api/v1/picture/players/2018fwc/44547_sq-300_jpg?allowDefaultPicture=true
25	2018-07-16 18:55:39.170981+08	2018-07-16 18:55:39.170981+08	\N	Uruguay	Oscar TABAREZ	https://api.fifa.com/api/v1/picture/players/2018fwc/61566_sq-300_jpg?allowDefaultPicture=true
26	2018-07-16 18:55:39.173741+08	2018-07-16 18:55:39.173741+08	\N	Peru	Ricardo GARECA	https://api.fifa.com/api/v1/picture/players/2018fwc/49791_sq-300_jpg?allowDefaultPicture=true
27	2018-07-16 18:55:39.178875+08	2018-07-16 18:55:39.178875+08	\N	Belgium	Roberto MARTINEZ	https://api.fifa.com/api/v1/picture/players/2018fwc/396423_sq-300_jpg?allowDefaultPicture=true
28	2018-07-16 18:55:39.181108+08	2018-07-16 18:55:39.181108+08	\N	Korea Republic	SHIN Taeyong	https://api.fifa.com/api/v1/picture/players/2018fwc/194551_sq-300_jpg?allowDefaultPicture=true
29	2018-07-16 18:55:39.183144+08	2018-07-16 18:55:39.183144+08	\N	Russia	Stanislav CHERCHESOV	https://api.fifa.com/api/v1/picture/players/2018fwc/77514_sq-300_jpg?allowDefaultPicture=true
30	2018-07-16 18:55:39.185131+08	2018-07-16 18:55:39.185131+08	\N	Brazil	TITE	https://api.fifa.com/api/v1/picture/players/2018fwc/404828_sq-300_jpg?allowDefaultPicture=true
31	2018-07-16 18:55:39.187057+08	2018-07-16 18:55:39.187057+08	\N	Switzerland	Vladimir PETKOVIC	https://api.fifa.com/api/v1/picture/players/2018fwc/377066_sq-300_jpg?allowDefaultPicture=true
32	2018-07-16 18:55:39.189039+08	2018-07-16 18:55:39.189039+08	\N	Croatia	Zlatko DALIC	https://api.fifa.com/api/v1/picture/players/2018fwc/400769_sq-300_jpg?allowDefaultPicture=true
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.groups (id, created_at, updated_at, deleted_at, group_name, team_name, match_played, win_number, draw_number, lost_number, goal_number, goal_against, diff_goal, points) FROM stdin;
1	2018-07-16 18:55:33.087756+08	2018-07-16 18:55:33.087756+08	\N	Group A	Uruguay	3	3	0	0	5	0	0	9
2	2018-07-16 18:55:33.090675+08	2018-07-16 18:55:33.090675+08	\N	Group A	Russia	3	2	0	1	8	0	0	6
3	2018-07-16 18:55:33.093295+08	2018-07-16 18:55:33.093295+08	\N	Group A	Saudi Arabia	3	1	0	2	2	0	0	3
4	2018-07-16 18:55:33.095806+08	2018-07-16 18:55:33.095806+08	\N	Group A	Egypt	3	0	0	3	2	0	0	0
5	2018-07-16 18:55:33.098261+08	2018-07-16 18:55:33.098261+08	\N	Group B	Spain	3	1	2	0	6	0	0	5
6	2018-07-16 18:55:33.100798+08	2018-07-16 18:55:33.100798+08	\N	Group B	Portugal	3	1	2	0	5	0	0	5
7	2018-07-16 18:55:33.103323+08	2018-07-16 18:55:33.103323+08	\N	Group B	IR Iran	3	1	1	1	2	0	0	4
8	2018-07-16 18:55:33.106597+08	2018-07-16 18:55:33.106597+08	\N	Group B	Morocco	3	0	1	2	2	0	0	1
9	2018-07-16 18:55:33.109206+08	2018-07-16 18:55:33.109206+08	\N	Group C	France	3	2	1	0	3	0	0	7
10	2018-07-16 18:55:33.111852+08	2018-07-16 18:55:33.111852+08	\N	Group C	Denmark	3	1	2	0	2	0	0	5
11	2018-07-16 18:55:33.114282+08	2018-07-16 18:55:33.114282+08	\N	Group C	Peru	3	1	0	2	2	0	0	3
12	2018-07-16 18:55:33.11594+08	2018-07-16 18:55:33.11594+08	\N	Group C	Australia	3	0	1	2	2	0	0	1
13	2018-07-16 18:55:33.118033+08	2018-07-16 18:55:33.118033+08	\N	Group D	Croatia	3	3	0	0	7	0	0	9
14	2018-07-16 18:55:33.119911+08	2018-07-16 18:55:33.119911+08	\N	Group D	Argentina	3	1	1	1	3	0	0	4
15	2018-07-16 18:55:33.123311+08	2018-07-16 18:55:33.123311+08	\N	Group D	Nigeria	3	1	0	2	3	0	0	3
16	2018-07-16 18:55:33.1255+08	2018-07-16 18:55:33.1255+08	\N	Group D	Iceland	3	0	1	2	2	0	0	1
17	2018-07-16 18:55:33.12803+08	2018-07-16 18:55:33.12803+08	\N	Group E	Brazil	3	2	1	0	5	0	0	7
18	2018-07-16 18:55:33.13021+08	2018-07-16 18:55:33.13021+08	\N	Group E	Switzerland	3	1	2	0	5	0	0	5
19	2018-07-16 18:55:33.132443+08	2018-07-16 18:55:33.132443+08	\N	Group E	Serbia	3	1	0	2	2	0	0	3
20	2018-07-16 18:55:33.135139+08	2018-07-16 18:55:33.135139+08	\N	Group E	Costa Rica	3	0	1	2	2	0	0	1
21	2018-07-16 18:55:33.138671+08	2018-07-16 18:55:33.138671+08	\N	Group F	Sweden	3	2	0	1	5	0	0	6
22	2018-07-16 18:55:33.141187+08	2018-07-16 18:55:33.141187+08	\N	Group F	Mexico	3	2	0	1	3	0	0	6
23	2018-07-16 18:55:33.143726+08	2018-07-16 18:55:33.143726+08	\N	Group F	Korea Republic	3	1	0	2	3	0	0	3
24	2018-07-16 18:55:33.145855+08	2018-07-16 18:55:33.145855+08	\N	Group F	Germany	3	1	0	2	2	0	0	3
25	2018-07-16 18:55:33.148187+08	2018-07-16 18:55:33.148187+08	\N	Group G	Belgium	3	3	0	0	9	0	0	9
26	2018-07-16 18:55:33.150428+08	2018-07-16 18:55:33.150428+08	\N	Group G	England	3	2	0	1	8	0	0	6
27	2018-07-16 18:55:33.15286+08	2018-07-16 18:55:33.15286+08	\N	Group G	Tunisia	3	1	0	2	5	0	0	3
28	2018-07-16 18:55:33.155427+08	2018-07-16 18:55:33.155427+08	\N	Group G	Panama	3	0	0	3	2	0	0	0
29	2018-07-16 18:55:33.158105+08	2018-07-16 18:55:33.158105+08	\N	Group H	Colombia	3	2	0	1	5	0	0	6
30	2018-07-16 18:55:33.16087+08	2018-07-16 18:55:33.16087+08	\N	Group H	Japan	3	1	1	1	4	0	0	4
31	2018-07-16 18:55:33.163347+08	2018-07-16 18:55:33.163347+08	\N	Group H	Senegal	3	1	1	1	4	0	0	4
32	2018-07-16 18:55:33.165837+08	2018-07-16 18:55:33.165837+08	\N	Group H	Poland	3	1	0	2	2	0	0	3
\.


--
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.matches (id, created_at, updated_at, deleted_at, date, group_name, location, country_left, country_right, score, match_number) FROM stdin;
1	2018-07-16 18:55:30.997317+08	2018-07-16 18:55:30.997317+08	\N	14 Jun 2018 - 18:00      Local time	Group A	Luzhniki Stadium      Moscow	Russia      RUS	Saudi Arabia      KSA	5-0	1
2	2018-07-16 18:55:31.00094+08	2018-07-16 18:55:31.00094+08	\N	15 Jun 2018 - 17:00      Local time	Group A	Ekaterinburg Arena      Ekaterinburg	Egypt      EGY	Uruguay      URU	0-1	2
3	2018-07-16 18:55:31.003982+08	2018-07-16 18:55:31.003982+08	\N	15 Jun 2018 - 18:00      Local time	Group B	Saint Petersburg Stadium      St. Petersburg	Morocco      MAR	IR Iran      IRN	0-1	4
4	2018-07-16 18:55:31.006742+08	2018-07-16 18:55:31.006742+08	\N	15 Jun 2018 - 21:00      Local time	Group B	Fisht Stadium      Sochi	Portugal      POR	Spain      ESP	3-3	3
5	2018-07-16 18:55:31.009208+08	2018-07-16 18:55:31.009208+08	\N	16 Jun 2018 - 13:00      Local time	Group C	Kazan Arena      Kazan	France      FRA	Australia      AUS	2-1	5
6	2018-07-16 18:55:31.012447+08	2018-07-16 18:55:31.012447+08	\N	16 Jun 2018 - 16:00      Local time	Group D	Spartak Stadium      Moscow	Argentina      ARG	Iceland      ISL	1-1	7
7	2018-07-16 18:55:31.016624+08	2018-07-16 18:55:31.016624+08	\N	16 Jun 2018 - 19:00      Local time	Group C	Mordovia Arena      Saransk	Peru      PER	Denmark      DEN	0-1	6
8	2018-07-16 18:55:31.019278+08	2018-07-16 18:55:31.019278+08	\N	16 Jun 2018 - 21:00      Local time	Group D	Kaliningrad Stadium      Kaliningrad	Croatia      CRO	Nigeria      NGA	2-0	8
9	2018-07-16 18:55:31.021815+08	2018-07-16 18:55:31.021815+08	\N	17 Jun 2018 - 16:00      Local time	Group E	Samara Arena      Samara	Costa Rica      CRC	Serbia      SRB	0-1	10
10	2018-07-16 18:55:31.024663+08	2018-07-16 18:55:31.024663+08	\N	17 Jun 2018 - 18:00      Local time	Group F	Luzhniki Stadium      Moscow	Germany      GER	Mexico      MEX	0-1	11
11	2018-07-16 18:55:31.027155+08	2018-07-16 18:55:31.027155+08	\N	17 Jun 2018 - 21:00      Local time	Group E	Rostov Arena      Rostov-On-Don	Brazil      BRA	Switzerland      SUI	1-1	9
12	2018-07-16 18:55:31.030111+08	2018-07-16 18:55:31.030111+08	\N	18 Jun 2018 - 15:00      Local time	Group F	Nizhny Novgorod Stadium      Nizhny Novgorod	Sweden      SWE	Korea Republic      KOR	1-0	12
13	2018-07-16 18:55:31.032764+08	2018-07-16 18:55:31.032764+08	\N	18 Jun 2018 - 18:00      Local time	Group G	Fisht Stadium      Sochi	Belgium      BEL	Panama      PAN	3-0	13
14	2018-07-16 18:55:31.035601+08	2018-07-16 18:55:31.035601+08	\N	18 Jun 2018 - 21:00      Local time	Group G	Volgograd Arena      Volgograd	Tunisia      TUN	England      ENG	1-2	14
15	2018-07-16 18:55:31.038371+08	2018-07-16 18:55:31.038371+08	\N	19 Jun 2018 - 15:00      Local time	Group H	Mordovia Arena      Saransk	Colombia      COL	Japan      JPN	1-2	16
16	2018-07-16 18:55:31.043207+08	2018-07-16 18:55:31.043207+08	\N	19 Jun 2018 - 18:00      Local time	Group H	Spartak Stadium      Moscow	Poland      POL	Senegal      SEN	1-2	15
17	2018-07-16 18:55:31.046061+08	2018-07-16 18:55:31.046061+08	\N	19 Jun 2018 - 21:00      Local time	Group A	Saint Petersburg Stadium      St. Petersburg	Russia      RUS	Egypt      EGY	3-1	17
18	2018-07-16 18:55:31.049005+08	2018-07-16 18:55:31.049005+08	\N	20 Jun 2018 - 15:00      Local time	Group B	Luzhniki Stadium      Moscow	Portugal      POR	Morocco      MAR	1-0	19
19	2018-07-16 18:55:31.052356+08	2018-07-16 18:55:31.052356+08	\N	20 Jun 2018 - 18:00      Local time	Group A	Rostov Arena      Rostov-On-Don	Uruguay      URU	Saudi Arabia      KSA	1-0	18
20	2018-07-16 18:55:31.055119+08	2018-07-16 18:55:31.055119+08	\N	20 Jun 2018 - 21:00      Local time	Group B	Kazan Arena      Kazan	IR Iran      IRN	Spain      ESP	0-1	20
21	2018-07-16 18:55:31.058249+08	2018-07-16 18:55:31.058249+08	\N	21 Jun 2018 - 16:00      Local time	Group C	Samara Arena      Samara	Denmark      DEN	Australia      AUS	1-1	22
22	2018-07-16 18:55:31.060603+08	2018-07-16 18:55:31.060603+08	\N	21 Jun 2018 - 20:00      Local time	Group C	Ekaterinburg Arena      Ekaterinburg	France      FRA	Peru      PER	1-0	21
23	2018-07-16 18:55:31.063346+08	2018-07-16 18:55:31.063346+08	\N	21 Jun 2018 - 21:00      Local time	Group D	Nizhny Novgorod Stadium      Nizhny Novgorod	Argentina      ARG	Croatia      CRO	0-3	23
24	2018-07-16 18:55:31.067424+08	2018-07-16 18:55:31.067424+08	\N	22 Jun 2018 - 15:00      Local time	Group E	Saint Petersburg Stadium      St. Petersburg	Brazil      BRA	Costa Rica      CRC	2-0	25
25	2018-07-16 18:55:31.070003+08	2018-07-16 18:55:31.070003+08	\N	22 Jun 2018 - 18:00      Local time	Group D	Volgograd Arena      Volgograd	Nigeria      NGA	Iceland      ISL	2-0	24
26	2018-07-16 18:55:31.072789+08	2018-07-16 18:55:31.072789+08	\N	22 Jun 2018 - 20:00      Local time	Group E	Kaliningrad Stadium      Kaliningrad	Serbia      SRB	Switzerland      SUI	1-2	26
27	2018-07-16 18:55:31.075473+08	2018-07-16 18:55:31.075473+08	\N	23 Jun 2018 - 15:00      Local time	Group G	Spartak Stadium      Moscow	Belgium      BEL	Tunisia      TUN	5-2	29
28	2018-07-16 18:55:31.078015+08	2018-07-16 18:55:31.078015+08	\N	23 Jun 2018 - 18:00      Local time	Group F	Rostov Arena      Rostov-On-Don	Korea Republic      KOR	Mexico      MEX	1-2	28
29	2018-07-16 18:55:31.080606+08	2018-07-16 18:55:31.080606+08	\N	23 Jun 2018 - 21:00      Local time	Group F	Fisht Stadium      Sochi	Germany      GER	Sweden      SWE	2-1	27
30	2018-07-16 18:55:31.08356+08	2018-07-16 18:55:31.08356+08	\N	24 Jun 2018 - 15:00      Local time	Group G	Nizhny Novgorod Stadium      Nizhny Novgorod	England      ENG	Panama      PAN	6-1	30
31	2018-07-16 18:55:31.086088+08	2018-07-16 18:55:31.086088+08	\N	24 Jun 2018 - 20:00      Local time	Group H	Ekaterinburg Arena      Ekaterinburg	Japan      JPN	Senegal      SEN	2-2	32
32	2018-07-16 18:55:31.088711+08	2018-07-16 18:55:31.088711+08	\N	24 Jun 2018 - 21:00      Local time	Group H	Kazan Arena      Kazan	Poland      POL	Colombia      COL	0-3	31
33	2018-07-16 18:55:31.091361+08	2018-07-16 18:55:31.091361+08	\N	25 Jun 2018 - 18:00      Local time	Group A	Samara Arena      Samara	Uruguay      URU	Russia      RUS	3-0	33
34	2018-07-16 18:55:31.094168+08	2018-07-16 18:55:31.094168+08	\N	25 Jun 2018 - 17:00      Local time	Group A	Volgograd Arena      Volgograd	Saudi Arabia      KSA	Egypt      EGY	2-1	34
35	2018-07-16 18:55:31.097+08	2018-07-16 18:55:31.097+08	\N	25 Jun 2018 - 20:00      Local time	Group B	Kaliningrad Stadium      Kaliningrad	Spain      ESP	Morocco      MAR	2-2	36
36	2018-07-16 18:55:31.100118+08	2018-07-16 18:55:31.100118+08	\N	25 Jun 2018 - 21:00      Local time	Group B	Mordovia Arena      Saransk	IR Iran      IRN	Portugal      POR	1-1	35
37	2018-07-16 18:55:31.105232+08	2018-07-16 18:55:31.105232+08	\N	26 Jun 2018 - 17:00      Local time	Group C	Fisht Stadium      Sochi	Australia      AUS	Peru      PER	0-2	38
38	2018-07-16 18:55:31.108751+08	2018-07-16 18:55:31.108751+08	\N	26 Jun 2018 - 17:00      Local time	Group C	Luzhniki Stadium      Moscow	Denmark      DEN	France      FRA	0-0	37
39	2018-07-16 18:55:31.111556+08	2018-07-16 18:55:31.111556+08	\N	26 Jun 2018 - 21:00      Local time	Group D	Saint Petersburg Stadium      St. Petersburg	Nigeria      NGA	Argentina      ARG	1-2	39
40	2018-07-16 18:55:31.114622+08	2018-07-16 18:55:31.114622+08	\N	26 Jun 2018 - 21:00      Local time	Group D	Rostov Arena      Rostov-On-Don	Iceland      ISL	Croatia      CRO	1-2	40
41	2018-07-16 18:55:31.120025+08	2018-07-16 18:55:31.120025+08	\N	27 Jun 2018 - 17:00      Local time	Group F	Kazan Arena      Kazan	Korea Republic      KOR	Germany      GER	2-0	43
42	2018-07-16 18:55:31.122304+08	2018-07-16 18:55:31.122304+08	\N	27 Jun 2018 - 19:00      Local time	Group F	Ekaterinburg Arena      Ekaterinburg	Mexico      MEX	Sweden      SWE	0-3	44
43	2018-07-16 18:55:31.124688+08	2018-07-16 18:55:31.124688+08	\N	27 Jun 2018 - 21:00      Local time	Group E	Spartak Stadium      Moscow	Serbia      SRB	Brazil      BRA	0-2	41
44	2018-07-16 18:55:31.127578+08	2018-07-16 18:55:31.127578+08	\N	27 Jun 2018 - 21:00      Local time	Group E	Nizhny Novgorod Stadium      Nizhny Novgorod	Switzerland      SUI	Costa Rica      CRC	2-2	42
45	2018-07-16 18:55:31.130176+08	2018-07-16 18:55:31.130176+08	\N	28 Jun 2018 - 17:00      Local time	Group H	Volgograd Arena      Volgograd	Japan      JPN	Poland      POL	0-1	47
46	2018-07-16 18:55:31.133252+08	2018-07-16 18:55:31.133252+08	\N	28 Jun 2018 - 18:00      Local time	Group H	Samara Arena      Samara	Senegal      SEN	Colombia      COL	0-1	48
47	2018-07-16 18:55:31.136173+08	2018-07-16 18:55:31.136173+08	\N	28 Jun 2018 - 21:00      Local time	Group G	Mordovia Arena      Saransk	Panama      PAN	Tunisia      TUN	1-2	46
48	2018-07-16 18:55:31.139195+08	2018-07-16 18:55:31.139195+08	\N	28 Jun 2018 - 20:00      Local time	Group G	Kaliningrad Stadium      Kaliningrad	England      ENG	Belgium      BEL	0-1	45
49	2018-07-16 18:55:31.1423+08	2018-07-16 18:55:31.1423+08	\N	30 Jun 2018 - 17:00      Local time	Round of 16	Kazan Arena      Kazan	France      FRA	Argentina      ARG	4-3	50
50	2018-07-16 18:55:31.145019+08	2018-07-16 18:55:31.145019+08	\N	30 Jun 2018 - 21:00      Local time	Round of 16	Fisht Stadium      Sochi	Uruguay      URU	Portugal      POR	2-1	49
51	2018-07-16 18:55:31.14783+08	2018-07-16 18:55:31.14783+08	\N	01 Jul 2018 - 17:00      Local time	Round of 16	Luzhniki Stadium      Moscow	Spain      ESP	Russia      RUS	1-1	51
52	2018-07-16 18:55:31.150767+08	2018-07-16 18:55:31.150767+08	\N	01 Jul 2018 - 21:00      Local time	Round of 16	Nizhny Novgorod Stadium      Nizhny Novgorod	Croatia      CRO	Denmark      DEN	1-1	52
53	2018-07-16 18:55:31.153647+08	2018-07-16 18:55:31.153647+08	\N	02 Jul 2018 - 18:00      Local time	Round of 16	Samara Arena      Samara	Brazil      BRA	Mexico      MEX	2-0	53
54	2018-07-16 18:55:31.157299+08	2018-07-16 18:55:31.157299+08	\N	02 Jul 2018 - 21:00      Local time	Round of 16	Rostov Arena      Rostov-On-Don	Belgium      BEL	Japan      JPN	3-2	54
55	2018-07-16 18:55:31.16252+08	2018-07-16 18:55:31.16252+08	\N	03 Jul 2018 - 17:00      Local time	Round of 16	Saint Petersburg Stadium      St. Petersburg	Sweden      SWE	Switzerland      SUI	1-0	55
56	2018-07-16 18:55:31.165066+08	2018-07-16 18:55:31.165066+08	\N	03 Jul 2018 - 21:00      Local time	Round of 16	Spartak Stadium      Moscow	Colombia      COL	England      ENG	1-1	56
57	2018-07-16 18:55:31.167451+08	2018-07-16 18:55:31.167451+08	\N	06 Jul 2018 - 17:00      Local time	Quarter-finals	Nizhny Novgorod Stadium      Nizhny Novgorod	Uruguay      URU	France      FRA	0-2	57
58	2018-07-16 18:55:31.172121+08	2018-07-16 18:55:31.172121+08	\N	06 Jul 2018 - 21:00      Local time	Quarter-finals	Kazan Arena      Kazan	Brazil      BRA	Belgium      BEL	1-2	58
59	2018-07-16 18:55:31.176415+08	2018-07-16 18:55:31.176415+08	\N	07 Jul 2018 - 18:00      Local time	Quarter-finals	Samara Arena      Samara	Sweden      SWE	England      ENG	0-2	60
60	2018-07-16 18:55:31.179312+08	2018-07-16 18:55:31.179312+08	\N	07 Jul 2018 - 21:00      Local time	Quarter-finals	Fisht Stadium      Sochi	Russia      RUS	Croatia      CRO	2-2	59
61	2018-07-16 18:55:31.181823+08	2018-07-16 18:55:31.181823+08	\N	10 Jul 2018 - 21:00      Local time	Semi-finals	Saint Petersburg Stadium      St. Petersburg	France      FRA	Belgium      BEL	1-0	61
62	2018-07-16 18:55:31.184358+08	2018-07-16 18:55:31.184358+08	\N	11 Jul 2018 - 21:00      Local time	Semi-finals	Luzhniki Stadium      Moscow	Croatia      CRO	England      ENG	2-1	62
63	2018-07-16 18:55:31.187279+08	2018-07-16 18:55:31.187279+08	\N	14 Jul 2018 - 17:00      Local time	Play-off for third place	Saint Petersburg Stadium      St. Petersburg	Belgium      BEL	England      ENG	2-0	63
64	2018-07-16 18:55:31.190048+08	2018-07-16 18:55:31.190048+08	\N	15 Jul 2018 - 18:00      Local time	Final	Luzhniki Stadium      Moscow	France      FRA	Croatia      CRO	4-2	64
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.players (id, created_at, updated_at, deleted_at, number, name, country, role, image_address) FROM stdin;
1	2018-07-16 18:55:36.392234+08	2018-07-16 18:55:36.392234+08	\N	13	Aaron MOOY	Australia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/312252_sq-300_jpg?allowDefaultPicture=true
2	2018-07-16 18:55:36.396842+08	2018-07-16 18:55:36.396842+08	\N	19	ABDALLA SAID	Egypt	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/230099_sq-300_jpg?allowDefaultPicture=true
3	2018-07-16 18:55:36.399996+08	2018-07-16 18:55:36.399996+08	\N	16	Abdiel ARROYO	Panama	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/337225_sq-300_jpg?allowDefaultPicture=true
4	2018-07-16 18:55:36.403316+08	2018-07-16 18:55:36.403316+08	\N	1	Abdoulaye DIALLO	Senegal	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/395924_sq-300_jpg?allowDefaultPicture=true
5	2018-07-16 18:55:36.405617+08	2018-07-16 18:55:36.405617+08	\N	15	ABDULLAH ALKHAIBARI	Saudi Arabia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/411624_sq-300_jpg?allowDefaultPicture=true
6	2018-07-16 18:55:36.408022+08	2018-07-16 18:55:36.408022+08	\N	1	ABDULLAH ALMUAIOUF	Saudi Arabia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/404372_sq-300_jpg?allowDefaultPicture=true
7	2018-07-16 18:55:36.41011+08	2018-07-16 18:55:36.41011+08	\N	14	ABDULLAH OTAYF	Saudi Arabia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/339474_sq-300_jpg?allowDefaultPicture=true
8	2018-07-16 18:55:36.412249+08	2018-07-16 18:55:36.412249+08	\N	12	Abdullahi SHEHU	Nigeria	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/369428_sq-300_jpg?allowDefaultPicture=true
9	2018-07-16 18:55:36.414799+08	2018-07-16 18:55:36.414799+08	\N	11	ABDULMALEK ALKHAIBRI	Saudi Arabia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/295184_sq-300_jpg?allowDefaultPicture=true
10	2018-07-16 18:55:36.417973+08	2018-07-16 18:55:36.417973+08	\N	8	Abel AGUILAR	Colombia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/198243_sq-300_jpg?allowDefaultPicture=true
11	2018-07-16 18:55:36.421263+08	2018-07-16 18:55:36.421263+08	\N	2	Achraf HAKIMI	Morocco	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/400721_sq-300_jpg?allowDefaultPicture=true
12	2018-07-16 18:55:36.424301+08	2018-07-16 18:55:36.424301+08	\N	2	Adama MBENGUE	Senegal	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/408938_sq-300_jpg?allowDefaultPicture=true
13	2018-07-16 18:55:36.426688+08	2018-07-16 18:55:36.426688+08	\N	22	Adem LJAJIC	Serbia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/319554_sq-300_jpg?allowDefaultPicture=true
14	2018-07-16 18:55:36.429007+08	2018-07-16 18:55:36.429007+08	\N	17	Adil RAMI	France	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/299876_sq-300_jpg?allowDefaultPicture=true
15	2018-07-16 18:55:36.431499+08	2018-07-16 18:55:36.431499+08	\N	18	Adnan JANUZAJ	Belgium	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/379910_sq-300_jpg?allowDefaultPicture=true
16	2018-07-16 18:55:36.434582+08	2018-07-16 18:55:36.434582+08	\N	13	Adolfo MACHADO	Panama	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/295901_sq-300_jpg?allowDefaultPicture=true
17	2018-07-16 18:55:36.438063+08	2018-07-16 18:55:36.438063+08	\N	23	ADRIEN SILVA	Portugal	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/319491_sq-300_jpg?allowDefaultPicture=true
18	2018-07-16 18:55:36.440466+08	2018-07-16 18:55:36.440466+08	\N	3	AHMED ELMOHAMADY	Egypt	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/256311_sq-300_jpg?allowDefaultPicture=true
19	2018-07-16 18:55:36.443011+08	2018-07-16 18:55:36.443011+08	\N	7	AHMED FATHI	Egypt	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/303682_sq-300_jpg?allowDefaultPicture=true
20	2018-07-16 18:55:36.445034+08	2018-07-16 18:55:36.445034+08	\N	6	AHMED HEGAZY	Egypt	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/344640_sq-300_jpg?allowDefaultPicture=true
21	2018-07-16 18:55:36.448688+08	2018-07-16 18:55:36.448688+08	\N	15	Ahmed KHALIL	Tunisia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/411655_sq-300_jpg?allowDefaultPicture=true
22	2018-07-16 18:55:36.451872+08	2018-07-16 18:55:36.451872+08	\N	7	Ahmed MUSA	Nigeria	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/344714_sq-300_jpg?allowDefaultPicture=true
23	2018-07-16 18:55:36.45433+08	2018-07-16 18:55:36.45433+08	\N	22	Ahmed TAGNAOUTI	Morocco	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/371553_sq-300_jpg?allowDefaultPicture=true
24	2018-07-16 18:55:36.45667+08	2018-07-16 18:55:36.45667+08	\N	9	Alan DZAGOEV	Russia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/302539_sq-300_jpg?allowDefaultPicture=true
25	2018-07-16 18:55:36.459788+08	2018-07-16 18:55:36.459788+08	\N	4	Albert GUDMUNDSSON	Iceland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/411384_sq-300_jpg?allowDefaultPicture=true
26	2018-07-16 18:55:36.466951+08	2018-07-16 18:55:36.466951+08	\N	2	Alberto RODRIGUEZ	Peru	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/202638_sq-300_jpg?allowDefaultPicture=true
27	2018-07-16 18:55:36.470248+08	2018-07-16 18:55:36.470248+08	\N	8	Albin EKDAL	Sweden	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/360340_sq-300_jpg?allowDefaultPicture=true
28	2018-07-16 18:55:36.472802+08	2018-07-16 18:55:36.472802+08	\N	3	Aldo CORZO	Peru	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/306194_sq-300_jpg?allowDefaultPicture=true
29	2018-07-16 18:55:36.47578+08	2018-07-16 18:55:36.47578+08	\N	11	Aleksandar KOLAROV	Serbia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/291438_sq-300_jpg?allowDefaultPicture=true
30	2018-07-16 18:55:36.47804+08	2018-07-16 18:55:36.47804+08	\N	9	Aleksandar MITROVIC	Serbia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/370456_sq-300_jpg?allowDefaultPicture=true
31	2018-07-16 18:55:36.480568+08	2018-07-16 18:55:36.480568+08	\N	8	Aleksandar PRIJOVIC	Serbia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/294103_sq-300_jpg?allowDefaultPicture=true
32	2018-07-16 18:55:36.484745+08	2018-07-16 18:55:36.484745+08	\N	21	Aleksandr EROKHIN	Russia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/404421_sq-300_jpg?allowDefaultPicture=true
33	2018-07-16 18:55:36.488188+08	2018-07-16 18:55:36.488188+08	\N	17	Aleksandr GOLOVIN	Russia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/371639_sq-300_jpg?allowDefaultPicture=true
34	2018-07-16 18:55:36.490579+08	2018-07-16 18:55:36.490579+08	\N	18	Alex IWOBI	Nigeria	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/395533_sq-300_jpg?allowDefaultPicture=true
35	2018-07-16 18:55:36.493573+08	2018-07-16 18:55:36.493573+08	\N	22	Alex RODRIGUEZ	Panama	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/357006_sq-300_jpg?allowDefaultPicture=true
36	2018-07-16 18:55:36.495912+08	2018-07-16 18:55:36.495912+08	\N	19	Alexander SAMEDOV	Russia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/216435_sq-300_jpg?allowDefaultPicture=true
37	2018-07-16 18:55:36.49799+08	2018-07-16 18:55:36.49799+08	\N	15	Alexey MIRANCHUK	Russia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/371765_sq-300_jpg?allowDefaultPicture=true
38	2018-07-16 18:55:36.501952+08	2018-07-16 18:55:36.501952+08	\N	11	Alfred FINNBOGASON	Iceland	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/359847_sq-300_jpg?allowDefaultPicture=true
39	2018-07-16 18:55:36.504755+08	2018-07-16 18:55:36.504755+08	\N	23	Alfred GOMIS	Senegal	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/408940_sq-300_jpg?allowDefaultPicture=true
40	2018-07-16 18:55:36.506768+08	2018-07-16 18:55:36.506768+08	\N	13	Alfred NDIAYE	Senegal	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/274154_sq-300_jpg?allowDefaultPicture=true
41	2018-07-16 18:55:36.50972+08	2018-07-16 18:55:36.50972+08	\N	12	Alfredo TALAVERA	Mexico	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/175546_sq-300_jpg?allowDefaultPicture=true
42	2018-07-16 18:55:36.512118+08	2018-07-16 18:55:36.512118+08	\N	4	ALI ALBULAYHI	Saudi Arabia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/407983_sq-300_jpg?allowDefaultPicture=true
43	2018-07-16 18:55:36.514858+08	2018-07-16 18:55:36.514858+08	\N	1	Ali BEIRANVAND	IR Iran	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/380007_sq-300_jpg?allowDefaultPicture=true
44	2018-07-16 18:55:36.519001+08	2018-07-16 18:55:36.519001+08	\N	2	ALI GABR	Egypt	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/401838_sq-300_jpg?allowDefaultPicture=true
45	2018-07-16 18:55:36.521487+08	2018-07-16 18:55:36.521487+08	\N	12	Ali MAALOUL	Tunisia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/332643_sq-300_jpg?allowDefaultPicture=true
46	2018-07-16 18:55:36.52389+08	2018-07-16 18:55:36.52389+08	\N	18	Alireza JAHANBAKHSH	IR Iran	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/379886_sq-300_jpg?allowDefaultPicture=true
47	2018-07-16 18:55:36.526608+08	2018-07-16 18:55:36.526608+08	\N	1	ALISSON	Brazil	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/308370_sq-300_jpg?allowDefaultPicture=true
48	2018-07-16 18:55:36.528996+08	2018-07-16 18:55:36.528996+08	\N	23	Alphonse AREOLA	France	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/368840_sq-300_jpg?allowDefaultPicture=true
49	2018-07-16 18:55:36.53187+08	2018-07-16 18:55:36.53187+08	\N	12	Alvaro ODRIOZOLA	Spain	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/407625_sq-300_jpg?allowDefaultPicture=true
50	2018-07-16 18:55:36.53475+08	2018-07-16 18:55:36.53475+08	\N	18	Amine HARIT	Morocco	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/372114_sq-300_jpg?allowDefaultPicture=true
51	2018-07-16 18:55:36.537864+08	2018-07-16 18:55:36.537864+08	\N	22	Amir ABEDZADEH	IR Iran	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/411643_sq-300_jpg?allowDefaultPicture=true
52	2018-07-16 18:55:36.540156+08	2018-07-16 18:55:36.540156+08	\N	22	AMR WARDA	Egypt	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/363867_sq-300_jpg?allowDefaultPicture=true
53	2018-07-16 18:55:36.545791+08	2018-07-16 18:55:36.545791+08	\N	4	Anderson SANTAMARIA	Peru	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/398457_sq-300_jpg?allowDefaultPicture=true
54	2018-07-16 18:55:36.548093+08	2018-07-16 18:55:36.548093+08	\N	18	Andre CARRILLO	Peru	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/349696_sq-300_jpg?allowDefaultPicture=true
55	2018-07-16 18:55:36.552943+08	2018-07-16 18:55:36.552943+08	\N	9	ANDRE SILVA	Portugal	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/384756_sq-300_jpg?allowDefaultPicture=true
56	2018-07-16 18:55:36.555244+08	2018-07-16 18:55:36.555244+08	\N	6	Andreas CHRISTENSEN	Denmark	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/401281_sq-300_jpg?allowDefaultPicture=true
57	2018-07-16 18:55:36.557588+08	2018-07-16 18:55:36.557588+08	\N	21	Andreas CORNELIUS	Denmark	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/360188_sq-300_jpg?allowDefaultPicture=true
58	2018-07-16 18:55:36.559902+08	2018-07-16 18:55:36.559902+08	\N	4	Andreas GRANQVIST	Sweden	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/214667_sq-300_jpg?allowDefaultPicture=true
59	2018-07-16 18:55:36.562282+08	2018-07-16 18:55:36.562282+08	\N	12	Andrei LUNEV	Russia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/411573_sq-300_jpg?allowDefaultPicture=true
60	2018-07-16 18:55:36.564836+08	2018-07-16 18:55:36.564836+08	\N	9	Andrej KRAMARIC	Croatia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/336472_sq-300_jpg?allowDefaultPicture=true
61	2018-07-16 18:55:36.568444+08	2018-07-16 18:55:36.568444+08	\N	18	Andres GUARDADO	Mexico	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/251352_sq-300_jpg?allowDefaultPicture=true
62	2018-07-16 18:55:36.571534+08	2018-07-16 18:55:36.571534+08	\N	6	Andres INIESTA	Spain	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/183857_sq-300_jpg?allowDefaultPicture=true
63	2018-07-16 18:55:36.574133+08	2018-07-16 18:55:36.574133+08	\N	11	Andrew NABBOUT	Australia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/411241_sq-300_jpg?allowDefaultPicture=true
64	2018-07-16 18:55:36.576722+08	2018-07-16 18:55:36.576722+08	\N	5	Andrey SEMENOV	Russia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/379985_sq-300_jpg?allowDefaultPicture=true
65	2018-07-16 18:55:36.579063+08	2018-07-16 18:55:36.579063+08	\N	7	Andrija ZIVKOVIC	Serbia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/375538_sq-300_jpg?allowDefaultPicture=true
66	2018-07-16 18:55:36.582038+08	2018-07-16 18:55:36.582038+08	\N	14	Andy POLO	Peru	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/394981_sq-300_jpg?allowDefaultPicture=true
67	2018-07-16 18:55:36.584958+08	2018-07-16 18:55:36.584958+08	\N	11	Angel DI MARIA	Argentina	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/266800_sq-300_jpg?allowDefaultPicture=true
68	2018-07-16 18:55:36.58835+08	2018-07-16 18:55:36.58835+08	\N	20	Anibal GODOY	Panama	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/269514_sq-300_jpg?allowDefaultPicture=true
69	2018-07-16 18:55:36.59071+08	2018-07-16 18:55:36.59071+08	\N	9	Anice BADRI	Tunisia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/407145_sq-300_jpg?allowDefaultPicture=true
70	2018-07-16 18:55:36.593231+08	2018-07-16 18:55:36.593231+08	\N	18	Ante REBIC	Croatia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/369058_sq-300_jpg?allowDefaultPicture=true
71	2018-07-16 18:55:36.59603+08	2018-07-16 18:55:36.59603+08	\N	12	ANTHONY LOPES	Portugal	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/373077_sq-300_jpg?allowDefaultPicture=true
72	2018-07-16 18:55:36.598424+08	2018-07-16 18:55:36.598424+08	\N	7	Antoine GRIEZMANN	France	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/336435_sq-300_jpg?allowDefaultPicture=true
73	2018-07-16 18:55:36.604522+08	2018-07-16 18:55:36.604522+08	\N	16	Anton MIRANCHUK	Russia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/411574_sq-300_jpg?allowDefaultPicture=true
74	2018-07-16 18:55:36.606453+08	2018-07-16 18:55:36.606453+08	\N	16	Antonio RUEDIGER	Germany	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/379955_sq-300_jpg?allowDefaultPicture=true
75	2018-07-16 18:55:36.608425+08	2018-07-16 18:55:36.608425+08	\N	2	Antonio RUKAVINA	Serbia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/291447_sq-300_jpg?allowDefaultPicture=true
76	2018-07-16 18:55:36.610428+08	2018-07-16 18:55:36.610428+08	\N	23	Ari SKULASON	Iceland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/300371_sq-300_jpg?allowDefaultPicture=true
77	2018-07-16 18:55:36.612315+08	2018-07-16 18:55:36.612315+08	\N	7	Arkadiusz MILIK	Poland	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/362823_sq-300_jpg?allowDefaultPicture=true
78	2018-07-16 18:55:36.61462+08	2018-07-16 18:55:36.61462+08	\N	11	Armando COOPER	Panama	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/267700_sq-300_jpg?allowDefaultPicture=true
79	2018-07-16 18:55:36.617835+08	2018-07-16 18:55:36.617835+08	\N	21	Arnor TRAUSTASON	Iceland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/401147_sq-300_jpg?allowDefaultPicture=true
80	2018-07-16 18:55:36.62654+08	2018-07-16 18:55:36.62654+08	\N	17	Aron GUNNARSSON	Iceland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/300382_sq-300_jpg?allowDefaultPicture=true
81	2018-07-16 18:55:36.629464+08	2018-07-16 18:55:36.629464+08	\N	22	Artem DZYUBA	Russia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/358889_sq-300_jpg?allowDefaultPicture=true
82	2018-07-16 18:55:36.631962+08	2018-07-16 18:55:36.631962+08	\N	3	Artur JEDRZEJCZYK	Poland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/270895_sq-300_jpg?allowDefaultPicture=true
83	2018-07-16 18:55:36.634253+08	2018-07-16 18:55:36.634253+08	\N	21	Ashkan DEJAGAH	IR Iran	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/196812_sq-300_jpg?allowDefaultPicture=true
84	2018-07-16 18:55:36.636697+08	2018-07-16 18:55:36.636697+08	\N	18	Ashley  YOUNG	England	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/299962_sq-300_jpg?allowDefaultPicture=true
85	2018-07-16 18:55:36.63904+08	2018-07-16 18:55:36.63904+08	\N	6	Axel WITSEL	Belgium	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/290821_sq-300_jpg?allowDefaultPicture=true
86	2018-07-16 18:55:36.64211+08	2018-07-16 18:55:36.64211+08	\N	12	AYMAN ASHRAF	Egypt	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/306460_sq-300_jpg?allowDefaultPicture=true
87	2018-07-16 18:55:36.645167+08	2018-07-16 18:55:36.645167+08	\N	16	Aymen MATHLOUTHI	Tunisia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/212413_sq-300_jpg?allowDefaultPicture=true
88	2018-07-16 18:55:36.647725+08	2018-07-16 18:55:36.647725+08	\N	9	Ayoub EL KAABI	Morocco	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/411678_sq-300_jpg?allowDefaultPicture=true
89	2018-07-16 18:55:36.653413+08	2018-07-16 18:55:36.653413+08	\N	16	Aziz BEHICH	Australia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/349342_sq-300_jpg?allowDefaultPicture=true
90	2018-07-16 18:55:36.656957+08	2018-07-16 18:55:36.656957+08	\N	20	Aziz BOUHADDOUZ	Morocco	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/407125_sq-300_jpg?allowDefaultPicture=true
91	2018-07-16 18:55:36.660601+08	2018-07-16 18:55:36.660601+08	\N	18	Bartosz BERESZYNSKI	Poland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/370435_sq-300_jpg?allowDefaultPicture=true
92	2018-07-16 18:55:36.664599+08	2018-07-16 18:55:36.664599+08	\N	12	Bartosz BIALKOWSKI	Poland	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/270890_sq-300_jpg?allowDefaultPicture=true
93	2018-07-16 18:55:36.667027+08	2018-07-16 18:55:36.667027+08	\N	18	Bassem SRARFI	Tunisia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/407144_sq-300_jpg?allowDefaultPicture=true
94	2018-07-16 18:55:36.669913+08	2018-07-16 18:55:36.669913+08	\N	22	Benjamin MENDY	France	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/335995_sq-300_jpg?allowDefaultPicture=true
95	2018-07-16 18:55:36.675062+08	2018-07-16 18:55:36.675062+08	\N	2	Benjamin PAVARD	France	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/411471_sq-300_jpg?allowDefaultPicture=true
96	2018-07-16 18:55:36.677574+08	2018-07-16 18:55:36.677574+08	\N	11	BERNARDO SILVA	Portugal	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/395205_sq-300_jpg?allowDefaultPicture=true
97	2018-07-16 18:55:36.679979+08	2018-07-16 18:55:36.679979+08	\N	22	BETO	Portugal	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/214404_sq-300_jpg?allowDefaultPicture=true
98	2018-07-16 18:55:36.682189+08	2018-07-16 18:55:36.682189+08	\N	8	Birkir BJARNASON	Iceland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/300376_sq-300_jpg?allowDefaultPicture=true
99	2018-07-16 18:55:36.686222+08	2018-07-16 18:55:36.686222+08	\N	2	Birkir SAEVARSSON	Iceland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/300344_sq-300_jpg?allowDefaultPicture=true
100	2018-07-16 18:55:36.689288+08	2018-07-16 18:55:36.689288+08	\N	9	Bjorn SIGURDARSON	Iceland	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/359845_sq-300_jpg?allowDefaultPicture=true
101	2018-07-16 18:55:36.69299+08	2018-07-16 18:55:36.69299+08	\N	14	Blaise MATUIDI	France	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/358014_sq-300_jpg?allowDefaultPicture=true
102	2018-07-16 18:55:36.695853+08	2018-07-16 18:55:36.695853+08	\N	7	Blas PEREZ	Panama	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/202039_sq-300_jpg?allowDefaultPicture=true
103	2018-07-16 18:55:36.699018+08	2018-07-16 18:55:36.699018+08	\N	15	Blerim DZEMAILI	Switzerland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/216646_sq-300_jpg?allowDefaultPicture=true
104	2018-07-16 18:55:36.701877+08	2018-07-16 18:55:36.701877+08	\N	12	Brad JONES	Australia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/181467_sq-300_jpg?allowDefaultPicture=true
105	2018-07-16 18:55:36.706275+08	2018-07-16 18:55:36.706275+08	\N	6	Branislav IVANOVIC	Serbia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/214388_sq-300_jpg?allowDefaultPicture=true
106	2018-07-16 18:55:36.709097+08	2018-07-16 18:55:36.709097+08	\N	7	Breel EMBOLO	Switzerland	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/393480_sq-300_jpg?allowDefaultPicture=true
107	2018-07-16 18:55:36.717648+08	2018-07-16 18:55:36.717648+08	\N	2	BRUNO ALVES	Portugal	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/210213_sq-300_jpg?allowDefaultPicture=true
108	2018-07-16 18:55:36.721518+08	2018-07-16 18:55:36.721518+08	\N	16	BRUNO FERNANDES	Portugal	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/395206_sq-300_jpg?allowDefaultPicture=true
109	2018-07-16 18:55:36.723872+08	2018-07-16 18:55:36.723872+08	\N	2	Bryan IDOWU	Nigeria	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/411700_sq-300_jpg?allowDefaultPicture=true
110	2018-07-16 18:55:36.726921+08	2018-07-16 18:55:36.726921+08	\N	8	Bryan OVIEDO	Costa Rica	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/270149_sq-300_jpg?allowDefaultPicture=true
111	2018-07-16 18:55:36.729405+08	2018-07-16 18:55:36.729405+08	\N	10	Bryan RUIZ	Costa Rica	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/214876_sq-300_jpg?allowDefaultPicture=true
112	2018-07-16 18:55:36.732794+08	2018-07-16 18:55:36.732794+08	\N	12	Camilo VARGAS	Colombia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/360642_sq-300_jpg?allowDefaultPicture=true
113	2018-07-16 18:55:36.736087+08	2018-07-16 18:55:36.736087+08	\N	7	Carlos BACCA	Colombia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/349512_sq-300_jpg?allowDefaultPicture=true
114	2018-07-16 18:55:36.738+08	2018-07-16 18:55:36.738+08	\N	12	Carlos CACEDA	Peru	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/275431_sq-300_jpg?allowDefaultPicture=true
115	2018-07-16 18:55:36.740386+08	2018-07-16 18:55:36.740386+08	\N	3	Carlos SALCEDO	Mexico	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/395518_sq-300_jpg?allowDefaultPicture=true
116	2018-07-16 18:55:36.742945+08	2018-07-16 18:55:36.742945+08	\N	6	Carlos SANCHEZ	Colombia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/280487_sq-300_jpg?allowDefaultPicture=true
117	2018-07-16 18:55:36.745232+08	2018-07-16 18:55:36.745232+08	\N	5	Carlos SANCHEZ	Uruguay	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/392673_sq-300_jpg?allowDefaultPicture=true
118	2018-07-16 18:55:36.748472+08	2018-07-16 18:55:36.748472+08	\N	11	Carlos VELA	Mexico	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/234552_sq-300_jpg?allowDefaultPicture=true
119	2018-07-16 18:55:36.751107+08	2018-07-16 18:55:36.751107+08	\N	5	CASEMIRO	Brazil	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/308386_sq-300_jpg?allowDefaultPicture=true
120	2018-07-16 18:55:36.754463+08	2018-07-16 18:55:36.754463+08	\N	16	CASSIO	Brazil	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/266773_sq-300_jpg?allowDefaultPicture=true
121	2018-07-16 18:55:36.757025+08	2018-07-16 18:55:36.757025+08	\N	21	CEDRIC	Portugal	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/336491_sq-300_jpg?allowDefaultPicture=true
122	2018-07-16 18:55:36.759898+08	2018-07-16 18:55:36.759898+08	\N	5	Celso BORGES	Costa Rica	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/236530_sq-300_jpg?allowDefaultPicture=true
123	2018-07-16 18:55:36.761898+08	2018-07-16 18:55:36.761898+08	\N	14	Cesar AZPILICUETA	Spain	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/270948_sq-300_jpg?allowDefaultPicture=true
124	2018-07-16 18:55:36.764321+08	2018-07-16 18:55:36.764321+08	\N	11	Cheikh NDOYE	Senegal	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/395925_sq-300_jpg?allowDefaultPicture=true
125	2018-07-16 18:55:36.768014+08	2018-07-16 18:55:36.768014+08	\N	8	Cheikhou KOUYATE	Senegal	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/353765_sq-300_jpg?allowDefaultPicture=true
126	2018-07-16 18:55:36.771409+08	2018-07-16 18:55:36.771409+08	\N	20	Chidozie AWAZIEM	Nigeria	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/407163_sq-300_jpg?allowDefaultPicture=true
127	2018-07-16 18:55:36.773789+08	2018-07-16 18:55:36.773789+08	\N	7	Christian BOLANOS	Costa Rica	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/183796_sq-300_jpg?allowDefaultPicture=true
128	2018-07-16 18:55:36.776413+08	2018-07-16 18:55:36.776413+08	\N	8	Christian CUEVA	Peru	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/349700_sq-300_jpg?allowDefaultPicture=true
129	2018-07-16 18:55:36.778872+08	2018-07-16 18:55:36.778872+08	\N	10	Christian ERIKSEN	Denmark	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/321716_sq-300_jpg?allowDefaultPicture=true
130	2018-07-16 18:55:36.781019+08	2018-07-16 18:55:36.781019+08	\N	15	Christian RAMOS	Peru	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/228728_sq-300_jpg?allowDefaultPicture=true
131	2018-07-16 18:55:36.783276+08	2018-07-16 18:55:36.783276+08	\N	12	Corentin TOLISSO	France	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/404566_sq-300_jpg?allowDefaultPicture=true
132	2018-07-16 18:55:36.787972+08	2018-07-16 18:55:36.787972+08	\N	11	Cristhian STUANI	Uruguay	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/229506_sq-300_jpg?allowDefaultPicture=true
133	2018-07-16 18:55:36.790742+08	2018-07-16 18:55:36.790742+08	\N	4	Cristian ANSALDI	Argentina	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/298593_sq-300_jpg?allowDefaultPicture=true
134	2018-07-16 18:55:36.798892+08	2018-07-16 18:55:36.798892+08	\N	16	Cristian GAMBOA	Costa Rica	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/307026_sq-300_jpg?allowDefaultPicture=true
135	2018-07-16 18:55:36.803003+08	2018-07-16 18:55:36.803003+08	\N	22	Cristian PAVON	Argentina	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/371828_sq-300_jpg?allowDefaultPicture=true
136	2018-07-16 18:55:36.805983+08	2018-07-16 18:55:36.805983+08	\N	7	Cristian RODRIGUEZ	Uruguay	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/216567_sq-300_jpg?allowDefaultPicture=true
137	2018-07-16 18:55:36.808402+08	2018-07-16 18:55:36.808402+08	\N	2	Cristian ZAPATA	Colombia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/200209_sq-300_jpg?allowDefaultPicture=true
138	2018-07-16 18:55:36.811348+08	2018-07-16 18:55:36.811348+08	\N	7	CRISTIANO RONALDO	Portugal	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/201200_sq-300_jpg?allowDefaultPicture=true
139	2018-07-16 18:55:36.813623+08	2018-07-16 18:55:36.813623+08	\N	7	Daler KUZIAEV	Russia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/411572_sq-300_jpg?allowDefaultPicture=true
140	2018-07-16 18:55:36.815842+08	2018-07-16 18:55:36.815842+08	\N	2	Dani CARVAJAL	Spain	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/380048_sq-300_jpg?allowDefaultPicture=true
141	2018-07-16 18:55:36.822238+08	2018-07-16 18:55:36.822238+08	\N	16	Daniel AKPEYI	Nigeria	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/230229_sq-300_jpg?allowDefaultPicture=true
142	2018-07-16 18:55:36.826231+08	2018-07-16 18:55:36.826231+08	\N	17	Daniel ARZANI	Australia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/389503_sq-300_jpg?allowDefaultPicture=true
143	2018-07-16 18:55:36.828711+08	2018-07-16 18:55:36.828711+08	\N	9	Daniel COLINDRES	Costa Rica	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/361029_sq-300_jpg?allowDefaultPicture=true
144	2018-07-16 18:55:36.830996+08	2018-07-16 18:55:36.830996+08	\N	23	Danijel SUBASIC	Croatia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/299887_sq-300_jpg?allowDefaultPicture=true
145	2018-07-16 18:55:36.8338+08	2018-07-16 18:55:36.8338+08	\N	14	DANILO	Brazil	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/335656_sq-300_jpg?allowDefaultPicture=true
146	2018-07-16 18:55:36.837852+08	2018-07-16 18:55:36.837852+08	\N	3	Danny ROSE	England	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/274036_sq-300_jpg?allowDefaultPicture=true
147	2018-07-16 18:55:36.840596+08	2018-07-16 18:55:36.840596+08	\N	18	Danny VUKOVIC	Australia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/197419_sq-300_jpg?allowDefaultPicture=true
148	2018-07-16 18:55:36.843577+08	2018-07-16 18:55:36.843577+08	\N	14	Danny WELBECK	England	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/274034_sq-300_jpg?allowDefaultPicture=true
149	2018-07-16 18:55:36.84729+08	2018-07-16 18:55:36.84729+08	\N	1	David DE GEA	Spain	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/269859_sq-300_jpg?allowDefaultPicture=true
150	2018-07-16 18:55:36.849825+08	2018-07-16 18:55:36.849825+08	\N	20	David GUZMAN	Costa Rica	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/270143_sq-300_jpg?allowDefaultPicture=true
151	2018-07-16 18:55:36.853472+08	2018-07-16 18:55:36.853472+08	\N	1	David OSPINA	Colombia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/228686_sq-300_jpg?allowDefaultPicture=true
152	2018-07-16 18:55:36.856928+08	2018-07-16 18:55:36.856928+08	\N	21	David SILVA	Spain	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/200176_sq-300_jpg?allowDefaultPicture=true
153	2018-07-16 18:55:36.86407+08	2018-07-16 18:55:36.86407+08	\N	23	Davinson SANCHEZ	Colombia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/386013_sq-300_jpg?allowDefaultPicture=true
154	2018-07-16 18:55:36.870552+08	2018-07-16 18:55:36.870552+08	\N	23	Dawid KOWNACKI	Poland	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/411482_sq-300_jpg?allowDefaultPicture=true
155	2018-07-16 18:55:36.872726+08	2018-07-16 18:55:36.872726+08	\N	20	Dedryck BOYATA	Belgium	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/358118_sq-300_jpg?allowDefaultPicture=true
156	2018-07-16 18:55:36.875172+08	2018-07-16 18:55:36.875172+08	\N	6	Dejan LOVREN	Croatia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/312432_sq-300_jpg?allowDefaultPicture=true
157	2018-07-16 18:55:36.877314+08	2018-07-16 18:55:36.877314+08	\N	20	Dele ALLI	England	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/401298_sq-300_jpg?allowDefaultPicture=true
158	2018-07-16 18:55:36.879359+08	2018-07-16 18:55:36.879359+08	\N	6	Denis CHERYSHEV	Russia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/358883_sq-300_jpg?allowDefaultPicture=true
159	2018-07-16 18:55:36.881557+08	2018-07-16 18:55:36.881557+08	\N	17	Denis ZAKARIA	Switzerland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/401448_sq-300_jpg?allowDefaultPicture=true
160	2018-07-16 18:55:36.887375+08	2018-07-16 18:55:36.887375+08	\N	15	Diafra SAKHO	Senegal	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/408939_sq-300_jpg?allowDefaultPicture=true
161	2018-07-16 18:55:36.88954+08	2018-07-16 18:55:36.88954+08	\N	19	Diego COSTA	Spain	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/367920_sq-300_jpg?allowDefaultPicture=true
162	2018-07-16 18:55:36.891983+08	2018-07-16 18:55:36.891983+08	\N	3	Diego GODIN	Uruguay	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/229499_sq-300_jpg?allowDefaultPicture=true
163	2018-07-16 18:55:36.894347+08	2018-07-16 18:55:36.894347+08	\N	17	Diego LAXALT	Uruguay	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/368657_sq-300_jpg?allowDefaultPicture=true
164	2018-07-16 18:55:36.89674+08	2018-07-16 18:55:36.89674+08	\N	21	Dimitrios PETRATOS	Australia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/333076_sq-300_jpg?allowDefaultPicture=true
165	2018-07-16 18:55:36.900729+08	2018-07-16 18:55:36.900729+08	\N	19	Djibril SIDIBE	France	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/398682_sq-300_jpg?allowDefaultPicture=true
166	2018-07-16 18:55:36.903407+08	2018-07-16 18:55:36.903407+08	\N	21	Domagoj VIDA	Croatia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/299896_sq-300_jpg?allowDefaultPicture=true
167	2018-07-16 18:55:36.906168+08	2018-07-16 18:55:36.906168+08	\N	1	Dominik LIVAKOVIC	Croatia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/369029_sq-300_jpg?allowDefaultPicture=true
168	2018-07-16 18:55:36.908722+08	2018-07-16 18:55:36.908722+08	\N	7	DOUGLAS COSTA	Brazil	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/305070_sq-300_jpg?allowDefaultPicture=true
169	2018-07-16 18:55:36.910756+08	2018-07-16 18:55:36.910756+08	\N	14	Dries MERTENS	Belgium	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/358114_sq-300_jpg?allowDefaultPicture=true
170	2018-07-16 18:55:36.913092+08	2018-07-16 18:55:36.913092+08	\N	15	Duje CALETA-CAR	Croatia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/372424_sq-300_jpg?allowDefaultPicture=true
171	2018-07-16 18:55:36.917144+08	2018-07-16 18:55:36.917144+08	\N	10	Dusan TADIC	Serbia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/298698_sq-300_jpg?allowDefaultPicture=true
172	2018-07-16 18:55:36.920213+08	2018-07-16 18:55:36.920213+08	\N	3	Dusko TOSIC	Serbia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/212308_sq-300_jpg?allowDefaultPicture=true
173	2018-07-16 18:55:36.922711+08	2018-07-16 18:55:36.922711+08	\N	11	Dylan BRONN	Tunisia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/411653_sq-300_jpg?allowDefaultPicture=true
174	2018-07-16 18:55:36.924839+08	2018-07-16 18:55:36.924839+08	\N	10	Eden HAZARD	Belgium	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/273996_sq-300_jpg?allowDefaultPicture=true
175	2018-07-16 18:55:36.926954+08	2018-07-16 18:55:36.926954+08	\N	23	EDERSON	Brazil	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/395427_sq-300_jpg?allowDefaultPicture=true
176	2018-07-16 18:55:36.93025+08	2018-07-16 18:55:36.93025+08	\N	8	Edgar BARCENAS	Panama	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/400416_sq-300_jpg?allowDefaultPicture=true
177	2018-07-16 18:55:36.933481+08	2018-07-16 18:55:36.933481+08	\N	21	Edinson CAVANI	Uruguay	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/267834_sq-300_jpg?allowDefaultPicture=true
178	2018-07-16 18:55:36.935989+08	2018-07-16 18:55:36.935989+08	\N	20	Edison FLORES	Peru	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/394797_sq-300_jpg?allowDefaultPicture=true
179	2018-07-16 18:55:36.938215+08	2018-07-16 18:55:36.938215+08	\N	21	Edson ALVAREZ	Mexico	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/400634_sq-300_jpg?allowDefaultPicture=true
180	2018-07-16 18:55:36.940603+08	2018-07-16 18:55:36.940603+08	\N	18	Eduardo SALVIO	Argentina	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/268992_sq-300_jpg?allowDefaultPicture=true
181	2018-07-16 18:55:36.944196+08	2018-07-16 18:55:36.944196+08	\N	3	Ehsan HAJI SAFI	IR Iran	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/288961_sq-300_jpg?allowDefaultPicture=true
182	2018-07-16 18:55:36.946907+08	2018-07-16 18:55:36.946907+08	\N	1	Eiji KAWASHIMA	Japan	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/198117_sq-300_jpg?allowDefaultPicture=true
183	2018-07-16 18:55:36.95238+08	2018-07-16 18:55:36.95238+08	\N	3	Elderson ECHIEJILE	Nigeria	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/267647_sq-300_jpg?allowDefaultPicture=true
184	2018-07-16 18:55:36.954928+08	2018-07-16 18:55:36.954928+08	\N	17	Ellyes SKHIRI	Tunisia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/411658_sq-300_jpg?allowDefaultPicture=true
185	2018-07-16 18:55:36.957726+08	2018-07-16 18:55:36.957726+08	\N	10	Emil FORSBERG	Sweden	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/398550_sq-300_jpg?allowDefaultPicture=true
186	2018-07-16 18:55:36.964128+08	2018-07-16 18:55:36.964128+08	\N	20	Emil HALLFREDSSON	Iceland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/300348_sq-300_jpg?allowDefaultPicture=true
187	2018-07-16 18:55:36.966821+08	2018-07-16 18:55:36.966821+08	\N	16	Emil KRAFTH	Sweden	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/398561_sq-300_jpg?allowDefaultPicture=true
188	2018-07-16 18:55:36.970512+08	2018-07-16 18:55:36.970512+08	\N	15	Enzo PEREZ	Argentina	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/316997_sq-300_jpg?allowDefaultPicture=true
189	2018-07-16 18:55:36.973747+08	2018-07-16 18:55:36.973747+08	\N	4	Eric  DIER	England	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/369400_sq-300_jpg?allowDefaultPicture=true
190	2018-07-16 18:55:36.976525+08	2018-07-16 18:55:36.976525+08	\N	15	Eric DAVIS	Panama	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/337232_sq-300_jpg?allowDefaultPicture=true
191	2018-07-16 18:55:36.980014+08	2018-07-16 18:55:36.980014+08	\N	5	Erick GUTIERREZ	Mexico	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/386332_sq-300_jpg?allowDefaultPicture=true
192	2018-07-16 18:55:36.982985+08	2018-07-16 18:55:36.982985+08	\N	1	ESSAM ELHADARY	Egypt	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/155050_sq-300_jpg?allowDefaultPicture=true
193	2018-07-16 18:55:36.985737+08	2018-07-16 18:55:36.985737+08	\N	7	Ever BANEGA	Argentina	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/266790_sq-300_jpg?allowDefaultPicture=true
194	2018-07-16 18:55:36.988938+08	2018-07-16 18:55:36.988938+08	\N	17	Fabian DELPH	England	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/306520_sq-300_jpg?allowDefaultPicture=true
195	2018-07-16 18:55:36.991007+08	2018-07-16 18:55:36.991007+08	\N	22	Fabian SCHAER	Switzerland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/356411_sq-300_jpg?allowDefaultPicture=true
196	2018-07-16 18:55:36.992979+08	2018-07-16 18:55:36.992979+08	\N	22	FAGNER	Brazil	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/266774_sq-300_jpg?allowDefaultPicture=true
197	2018-07-16 18:55:36.996632+08	2018-07-16 18:55:36.996632+08	\N	19	FAHAD ALMUWALLAD	Saudi Arabia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/339470_sq-300_jpg?allowDefaultPicture=true
198	2018-07-16 18:55:36.999223+08	2018-07-16 18:55:36.999223+08	\N	8	Fakhreddine BEN YOUSSEF	Tunisia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/364668_sq-300_jpg?allowDefaultPicture=true
199	2018-07-16 18:55:37.002188+08	2018-07-16 18:55:37.002188+08	\N	18	Farid DIAZ	Colombia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/394417_sq-300_jpg?allowDefaultPicture=true
200	2018-07-16 18:55:37.005125+08	2018-07-16 18:55:37.005125+08	\N	1	Farouk BEN MUSTAPHA	Tunisia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/320518_sq-300_jpg?allowDefaultPicture=true
201	2018-07-16 18:55:37.007685+08	2018-07-16 18:55:37.007685+08	\N	11	Faycal FAJR	Morocco	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/395756_sq-300_jpg?allowDefaultPicture=true
202	2018-07-16 18:55:37.011675+08	2018-07-16 18:55:37.011675+08	\N	6	Federico FAZIO	Argentina	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/266784_sq-300_jpg?allowDefaultPicture=true
203	2018-07-16 18:55:37.014593+08	2018-07-16 18:55:37.014593+08	\N	13	Fedor KUDRIASHOV	Russia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/404424_sq-300_jpg?allowDefaultPicture=true
204	2018-07-16 18:55:37.016872+08	2018-07-16 18:55:37.016872+08	\N	10	Fedor SMOLOV	Russia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/358871_sq-300_jpg?allowDefaultPicture=true
205	2018-07-16 18:55:37.019309+08	2018-07-16 18:55:37.019309+08	\N	23	Felipe BALOY	Panama	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/201720_sq-300_jpg?allowDefaultPicture=true
206	2018-07-16 18:55:37.022721+08	2018-07-16 18:55:37.022721+08	\N	13	Ferjani SASSI	Tunisia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/370575_sq-300_jpg?allowDefaultPicture=true
207	2018-07-16 18:55:37.025172+08	2018-07-16 18:55:37.025172+08	\N	17	FERNANDINHO	Brazil	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/208016_sq-300_jpg?allowDefaultPicture=true
208	2018-07-16 18:55:37.02828+08	2018-07-16 18:55:37.02828+08	\N	1	Fernando MUSLERA	Uruguay	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/229498_sq-300_jpg?allowDefaultPicture=true
209	2018-07-16 18:55:37.031686+08	2018-07-16 18:55:37.031686+08	\N	4	Fidel ESCOBAR	Panama	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/385030_sq-300_jpg?allowDefaultPicture=true
210	2018-07-16 18:55:37.034626+08	2018-07-16 18:55:37.034626+08	\N	14	Filip BRADARIC	Croatia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/402149_sq-300_jpg?allowDefaultPicture=true
211	2018-07-16 18:55:37.039491+08	2018-07-16 18:55:37.039491+08	\N	14	Filip HELANDER	Sweden	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/395270_sq-300_jpg?allowDefaultPicture=true
212	2018-07-16 18:55:37.046792+08	2018-07-16 18:55:37.046792+08	\N	17	Filip KOSTIC	Serbia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/401178_sq-300_jpg?allowDefaultPicture=true
213	2018-07-16 18:55:37.052184+08	2018-07-16 18:55:37.052184+08	\N	6	FILIPE LUIS	Brazil	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/217161_sq-300_jpg?allowDefaultPicture=true
214	2018-07-16 18:55:37.055049+08	2018-07-16 18:55:37.055049+08	\N	20	Florian THAUVIN	France	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/368965_sq-300_jpg?allowDefaultPicture=true
215	2018-07-16 18:55:37.05713+08	2018-07-16 18:55:37.05713+08	\N	23	Francis UZOHO	Nigeria	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/372607_sq-300_jpg?allowDefaultPicture=true
216	2018-07-16 18:55:37.059461+08	2018-07-16 18:55:37.059461+08	\N	15	Francisco CALVO	Costa Rica	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/339797_sq-300_jpg?allowDefaultPicture=true
217	2018-07-16 18:55:37.064455+08	2018-07-16 18:55:37.064455+08	\N	12	Franco ARMANI	Argentina	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/398422_sq-300_jpg?allowDefaultPicture=true
218	2018-07-16 18:55:37.067207+08	2018-07-16 18:55:37.067207+08	\N	3	Francois MOUBANDJE	Switzerland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/398508_sq-300_jpg?allowDefaultPicture=true
219	2018-07-16 18:55:37.071961+08	2018-07-16 18:55:37.071961+08	\N	18	FRED	Brazil	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/394018_sq-300_jpg?allowDefaultPicture=true
220	2018-07-16 18:55:37.075461+08	2018-07-16 18:55:37.075461+08	\N	22	Frederik RONNOW	Denmark	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/401283_sq-300_jpg?allowDefaultPicture=true
221	2018-07-16 18:55:37.078411+08	2018-07-16 18:55:37.078411+08	\N	12	Frederik SCHRAM	Iceland	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/411385_sq-300_jpg?allowDefaultPicture=true
222	2018-07-16 18:55:37.082883+08	2018-07-16 18:55:37.082883+08	\N	6	Gabriel GOMEZ	Panama	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/197912_sq-300_jpg?allowDefaultPicture=true
223	2018-07-16 18:55:37.085247+08	2018-07-16 18:55:37.085247+08	\N	9	GABRIEL JESUS	Brazil	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/386559_sq-300_jpg?allowDefaultPicture=true
224	2018-07-16 18:55:37.088693+08	2018-07-16 18:55:37.088693+08	\N	2	Gabriel MERCADO	Argentina	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/266796_sq-300_jpg?allowDefaultPicture=true
225	2018-07-16 18:55:37.091277+08	2018-07-16 18:55:37.091277+08	\N	9	Gabriel TORRES	Panama	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/239360_sq-300_jpg?allowDefaultPicture=true
226	2018-07-16 18:55:37.093707+08	2018-07-16 18:55:37.093707+08	\N	7	Gaku SHIBASAKI	Japan	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/307719_sq-300_jpg?allowDefaultPicture=true
227	2018-07-16 18:55:37.097345+08	2018-07-16 18:55:37.097345+08	\N	15	Gary CAHILL	England	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/305764_sq-300_jpg?allowDefaultPicture=true
228	2018-07-16 18:55:37.100506+08	2018-07-16 18:55:37.100506+08	\N	13	Gaston SILVA	Uruguay	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/332883_sq-300_jpg?allowDefaultPicture=true
229	2018-07-16 18:55:37.103932+08	2018-07-16 18:55:37.103932+08	\N	16	Gelson FERNANDES	Switzerland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/216650_sq-300_jpg?allowDefaultPicture=true
230	2018-07-16 18:55:37.106412+08	2018-07-16 18:55:37.106412+08	\N	18	GELSON MARTINS	Portugal	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/384766_sq-300_jpg?allowDefaultPicture=true
231	2018-07-16 18:55:37.110714+08	2018-07-16 18:55:37.110714+08	\N	3	Gen SHOJI	Japan	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/384847_sq-300_jpg?allowDefaultPicture=true
232	2018-07-16 18:55:37.113065+08	2018-07-16 18:55:37.113065+08	\N	8	Genki HARAGUCHI	Japan	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/347718_sq-300_jpg?allowDefaultPicture=true
233	2018-07-16 18:55:37.115326+08	2018-07-16 18:55:37.115326+08	\N	3	Gerard PIQUE	Spain	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/216973_sq-300_jpg?allowDefaultPicture=true
234	2018-07-16 18:55:37.117687+08	2018-07-16 18:55:37.117687+08	\N	6	Ghanem SAISS	Morocco	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/398599_sq-300_jpg?allowDefaultPicture=true
235	2018-07-16 18:55:37.120733+08	2018-07-16 18:55:37.120733+08	\N	20	Ghaylen CHAALELI	Tunisia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/407141_sq-300_jpg?allowDefaultPicture=true
236	2018-07-16 18:55:37.122771+08	2018-07-16 18:55:37.122771+08	\N	3	Giancarlo GONZALEZ	Costa Rica	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/268821_sq-300_jpg?allowDefaultPicture=true
237	2018-07-16 18:55:37.125902+08	2018-07-16 18:55:37.125902+08	\N	10	Giorgian DE ARRASCAETA	Uruguay	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/368652_sq-300_jpg?allowDefaultPicture=true
238	2018-07-16 18:55:37.132813+08	2018-07-16 18:55:37.132813+08	\N	10	Giovani DOS SANTOS	Mexico	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/234551_sq-300_jpg?allowDefaultPicture=true
239	2018-07-16 18:55:37.135722+08	2018-07-16 18:55:37.135722+08	\N	20	Giovani LO CELSO	Argentina	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/395414_sq-300_jpg?allowDefaultPicture=true
240	2018-07-16 18:55:37.138075+08	2018-07-16 18:55:37.138075+08	\N	22	GO Yohan	Korea Republic	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/375627_sq-300_jpg?allowDefaultPicture=true
241	2018-07-16 18:55:37.140067+08	2018-07-16 18:55:37.140067+08	\N	17	GONCALO GUEDES	Portugal	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/384751_sq-300_jpg?allowDefaultPicture=true
242	2018-07-16 18:55:37.142758+08	2018-07-16 18:55:37.142758+08	\N	9	Gonzalo HIGUAIN	Argentina	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/271550_sq-300_jpg?allowDefaultPicture=true
243	2018-07-16 18:55:37.146035+08	2018-07-16 18:55:37.146035+08	\N	21	Gotoku SAKAI	Japan	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/321736_sq-300_jpg?allowDefaultPicture=true
244	2018-07-16 18:55:37.148195+08	2018-07-16 18:55:37.148195+08	\N	10	Granit XHAKA	Switzerland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/311558_sq-300_jpg?allowDefaultPicture=true
245	2018-07-16 18:55:37.150109+08	2018-07-16 18:55:37.150109+08	\N	10	Grzegorz KRYCHOWIAK	Poland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/269735_sq-300_jpg?allowDefaultPicture=true
246	2018-07-16 18:55:37.153394+08	2018-07-16 18:55:37.153394+08	\N	13	Guillermo OCHOA	Mexico	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/215285_sq-300_jpg?allowDefaultPicture=true
247	2018-07-16 18:55:37.15548+08	2018-07-16 18:55:37.15548+08	\N	4	Guillermo VARELA	Uruguay	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/368660_sq-300_jpg?allowDefaultPicture=true
248	2018-07-16 18:55:37.157732+08	2018-07-16 18:55:37.157732+08	\N	13	Gustav SVENSSON	Sweden	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/406882_sq-300_jpg?allowDefaultPicture=true
249	2018-07-16 18:55:37.161674+08	2018-07-16 18:55:37.161674+08	\N	10	Gylfi SIGURDSSON	Iceland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/300377_sq-300_jpg?allowDefaultPicture=true
250	2018-07-16 18:55:37.164237+08	2018-07-16 18:55:37.164237+08	\N	7	Hakim ZIYACH	Morocco	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/395759_sq-300_jpg?allowDefaultPicture=true
251	2018-07-16 18:55:37.166833+08	2018-07-16 18:55:37.166833+08	\N	21	Hamdi NAGUEZ	Tunisia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/401797_sq-300_jpg?allowDefaultPicture=true
252	2018-07-16 18:55:37.170083+08	2018-07-16 18:55:37.170083+08	\N	3	Hamza MENDYL	Morocco	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/401882_sq-300_jpg?allowDefaultPicture=true
253	2018-07-16 18:55:37.17261+08	2018-07-16 18:55:37.17261+08	\N	1	Hannes HALLDORSSON	Iceland	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/359843_sq-300_jpg?allowDefaultPicture=true
254	2018-07-16 18:55:37.176359+08	2018-07-16 18:55:37.176359+08	\N	9	Haris SEFEROVIC	Switzerland	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/311554_sq-300_jpg?allowDefaultPicture=true
255	2018-07-16 18:55:37.178912+08	2018-07-16 18:55:37.178912+08	\N	3	Harold CUMMINGS	Panama	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/337231_sq-300_jpg?allowDefaultPicture=true
256	2018-07-16 18:55:37.181185+08	2018-07-16 18:55:37.181185+08	\N	9	Harry KANE	England	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/369419_sq-300_jpg?allowDefaultPicture=true
257	2018-07-16 18:55:37.184188+08	2018-07-16 18:55:37.184188+08	\N	6	Harry MAGUIRE	England	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/407498_sq-300_jpg?allowDefaultPicture=true
258	2018-07-16 18:55:37.188169+08	2018-07-16 18:55:37.188169+08	\N	9	HATAN BAHBRI	Saudi Arabia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/339485_sq-300_jpg?allowDefaultPicture=true
259	2018-07-16 18:55:37.19192+08	2018-07-16 18:55:37.19192+08	\N	16	Hector HERRERA	Mexico	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/329092_sq-300_jpg?allowDefaultPicture=true
260	2018-07-16 18:55:37.194038+08	2018-07-16 18:55:37.194038+08	\N	15	Hector MORENO	Mexico	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/238112_sq-300_jpg?allowDefaultPicture=true
261	2018-07-16 18:55:37.198195+08	2018-07-16 18:55:37.198195+08	\N	14	Henrik DALSGAARD	Denmark	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/318477_sq-300_jpg?allowDefaultPicture=true
262	2018-07-16 18:55:37.20208+08	2018-07-16 18:55:37.20208+08	\N	19	Hiroki SAKAI	Japan	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/350003_sq-300_jpg?allowDefaultPicture=true
263	2018-07-16 18:55:37.205789+08	2018-07-16 18:55:37.205789+08	\N	22	Hirving  LOZANO	Mexico	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/386337_sq-300_jpg?allowDefaultPicture=true
264	2018-07-16 18:55:37.208131+08	2018-07-16 18:55:37.208131+08	\N	15	Holmar EYJOLFSSON	Iceland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/300369_sq-300_jpg?allowDefaultPicture=true
265	2018-07-16 18:55:37.216553+08	2018-07-16 18:55:37.216553+08	\N	14	HONG Chul	Korea Republic	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/329912_sq-300_jpg?allowDefaultPicture=true
266	2018-07-16 18:55:37.218795+08	2018-07-16 18:55:37.218795+08	\N	18	Hordur MAGNUSSON	Iceland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/401146_sq-300_jpg?allowDefaultPicture=true
267	2018-07-16 18:55:37.221782+08	2018-07-16 18:55:37.221782+08	\N	16	Hotaru YAMAGUCHI	Japan	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/356466_sq-300_jpg?allowDefaultPicture=true
268	2018-07-16 18:55:37.223767+08	2018-07-16 18:55:37.223767+08	\N	2	Hugo AYALA	Mexico	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/309592_sq-300_jpg?allowDefaultPicture=true
269	2018-07-16 18:55:37.225778+08	2018-07-16 18:55:37.225778+08	\N	1	Hugo LLORIS	France	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/297105_sq-300_jpg?allowDefaultPicture=true
270	2018-07-16 18:55:37.228324+08	2018-07-16 18:55:37.228324+08	\N	16	HUSSAIN ALMOQAHWI	Saudi Arabia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/390000_sq-300_jpg?allowDefaultPicture=true
271	2018-07-16 18:55:37.23177+08	2018-07-16 18:55:37.23177+08	\N	11	HWANG Heechan	Korea Republic	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/395083_sq-300_jpg?allowDefaultPicture=true
272	2018-07-16 18:55:37.233747+08	2018-07-16 18:55:37.233747+08	\N	17	Iago ASPAS	Spain	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/402138_sq-300_jpg?allowDefaultPicture=true
273	2018-07-16 18:55:37.237166+08	2018-07-16 18:55:37.237166+08	\N	4	Ian SMITH	Costa Rica	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/389725_sq-300_jpg?allowDefaultPicture=true
274	2018-07-16 18:55:37.240625+08	2018-07-16 18:55:37.240625+08	\N	5	Idrissa Gana GUEYE	Senegal	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/332314_sq-300_jpg?allowDefaultPicture=true
275	2018-07-16 18:55:37.242887+08	2018-07-16 18:55:37.242887+08	\N	1	Igor AKINFEEV	Russia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/215017_sq-300_jpg?allowDefaultPicture=true
276	2018-07-16 18:55:37.24521+08	2018-07-16 18:55:37.24521+08	\N	23	Igor SMOLNIKOV	Russia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/375357_sq-300_jpg?allowDefaultPicture=true
277	2018-07-16 18:55:37.248178+08	2018-07-16 18:55:37.248178+08	\N	1	Ikechukwu EZENWA	Nigeria	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/273287_sq-300_jpg?allowDefaultPicture=true
278	2018-07-16 18:55:37.252345+08	2018-07-16 18:55:37.252345+08	\N	21	Ilkay GUENDOGAN	Germany	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/358690_sq-300_jpg?allowDefaultPicture=true
279	2018-07-16 18:55:37.25595+08	2018-07-16 18:55:37.25595+08	\N	3	Ilya KUTEPOV	Russia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/404425_sq-300_jpg?allowDefaultPicture=true
280	2018-07-16 18:55:37.258339+08	2018-07-16 18:55:37.258339+08	\N	22	Isaac Kiese THELIN	Sweden	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/395273_sq-300_jpg?allowDefaultPicture=true
281	2018-07-16 18:55:37.260828+08	2018-07-16 18:55:37.260828+08	\N	22	ISCO	Spain	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/313374_sq-300_jpg?allowDefaultPicture=true
282	2018-07-16 18:55:37.263216+08	2018-07-16 18:55:37.263216+08	\N	10	Ismael DIAZ	Panama	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/372342_sq-300_jpg?allowDefaultPicture=true
283	2018-07-16 18:55:37.265746+08	2018-07-16 18:55:37.265746+08	\N	18	Ismaila SARR	Senegal	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/401889_sq-300_jpg?allowDefaultPicture=true
284	2018-07-16 18:55:37.267926+08	2018-07-16 18:55:37.267926+08	\N	8	Iury GAZINSKY	Russia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/379988_sq-300_jpg?allowDefaultPicture=true
285	2018-07-16 18:55:37.270761+08	2018-07-16 18:55:37.270761+08	\N	4	Ivan PERISIC	Croatia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/359381_sq-300_jpg?allowDefaultPicture=true
286	2018-07-16 18:55:37.273279+08	2018-07-16 18:55:37.273279+08	\N	7	Ivan RAKITIC	Croatia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/296633_sq-300_jpg?allowDefaultPicture=true
287	2018-07-16 18:55:37.275912+08	2018-07-16 18:55:37.275912+08	\N	3	Ivan STRINIC	Croatia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/357988_sq-300_jpg?allowDefaultPicture=true
288	2018-07-16 18:55:37.278349+08	2018-07-16 18:55:37.278349+08	\N	6	Jacek GORALSKI	Poland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/402079_sq-300_jpg?allowDefaultPicture=true
289	2018-07-16 18:55:37.281607+08	2018-07-16 18:55:37.281607+08	\N	13	Jack BUTLAND	England	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/344536_sq-300_jpg?allowDefaultPicture=true
290	2018-07-16 18:55:37.284133+08	2018-07-16 18:55:37.284133+08	\N	22	Jackson IRVINE	Australia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/355775_sq-300_jpg?allowDefaultPicture=true
291	2018-07-16 18:55:37.286831+08	2018-07-16 18:55:37.286831+08	\N	1	Jaime PENEDO	Panama	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/213770_sq-300_jpg?allowDefaultPicture=true
292	2018-07-16 18:55:37.29285+08	2018-07-16 18:55:37.29285+08	\N	16	Jakub BLASZCZYKOWSKI	Poland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/216944_sq-300_jpg?allowDefaultPicture=true
293	2018-07-16 18:55:37.295267+08	2018-07-16 18:55:37.295267+08	\N	3	James MEREDITH	Australia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/397636_sq-300_jpg?allowDefaultPicture=true
294	2018-07-16 18:55:37.298038+08	2018-07-16 18:55:37.298038+08	\N	10	James RODRIGUEZ	Colombia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/269058_sq-300_jpg?allowDefaultPicture=true
295	2018-07-16 18:55:37.301081+08	2018-07-16 18:55:37.301081+08	\N	14	Jamie MacLAREN	Australia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/368899_sq-300_jpg?allowDefaultPicture=true
296	2018-07-16 18:55:37.304044+08	2018-07-16 18:55:37.304044+08	\N	11	Jamie VARDY	England	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/400820_sq-300_jpg?allowDefaultPicture=true
297	2018-07-16 18:55:37.306486+08	2018-07-16 18:55:37.306486+08	\N	5	Jan BEDNAREK	Poland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/406995_sq-300_jpg?allowDefaultPicture=true
298	2018-07-16 18:55:37.309037+08	2018-07-16 18:55:37.309037+08	\N	5	Jan VERTONGHEN	Belgium	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/290904_sq-300_jpg?allowDefaultPicture=true
299	2018-07-16 18:55:37.311453+08	2018-07-16 18:55:37.311453+08	\N	20	JANG Hyunsoo	Korea Republic	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/336682_sq-300_jpg?allowDefaultPicture=true
300	2018-07-16 18:55:37.313691+08	2018-07-16 18:55:37.313691+08	\N	3	Jannik VESTERGAARD	Denmark	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/358302_sq-300_jpg?allowDefaultPicture=true
301	2018-07-16 18:55:37.316381+08	2018-07-16 18:55:37.316381+08	\N	20	Javier AQUINO	Mexico	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/350124_sq-300_jpg?allowDefaultPicture=true
302	2018-07-16 18:55:37.319344+08	2018-07-16 18:55:37.319344+08	\N	14	Javier HERNANDEZ	Mexico	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/228599_sq-300_jpg?allowDefaultPicture=true
303	2018-07-16 18:55:37.321894+08	2018-07-16 18:55:37.321894+08	\N	14	Javier MASCHERANO	Argentina	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/182372_sq-300_jpg?allowDefaultPicture=true
304	2018-07-16 18:55:37.324238+08	2018-07-16 18:55:37.324238+08	\N	16	Jefferson  LERMA	Colombia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/395550_sq-300_jpg?allowDefaultPicture=true
305	2018-07-16 18:55:37.326501+08	2018-07-16 18:55:37.326501+08	\N	10	Jefferson FARFAN	Peru	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/201748_sq-300_jpg?allowDefaultPicture=true
306	2018-07-16 18:55:37.32881+08	2018-07-16 18:55:37.32881+08	\N	17	Jens Stryger LARSEN	Denmark	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/395455_sq-300_jpg?allowDefaultPicture=true
307	2018-07-16 18:55:37.331497+08	2018-07-16 18:55:37.331497+08	\N	17	Jerome BOATENG	Germany	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/299442_sq-300_jpg?allowDefaultPicture=true
308	2018-07-16 18:55:37.334003+08	2018-07-16 18:55:37.334003+08	\N	7	Jesse  LINGARD	England	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/398743_sq-300_jpg?allowDefaultPicture=true
309	2018-07-16 18:55:37.336618+08	2018-07-16 18:55:37.336618+08	\N	17	Jesus CORONA	Mexico	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/314918_sq-300_jpg?allowDefaultPicture=true
310	2018-07-16 18:55:37.338977+08	2018-07-16 18:55:37.338977+08	\N	23	Jesus GALLARDO	Mexico	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/402772_sq-300_jpg?allowDefaultPicture=true
311	2018-07-16 18:55:37.34095+08	2018-07-16 18:55:37.34095+08	\N	21	Jimmy DURMAZ	Sweden	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/365630_sq-300_jpg?allowDefaultPicture=true
312	2018-07-16 18:55:37.343255+08	2018-07-16 18:55:37.343255+08	\N	23	JO Hyeonwoo	Korea Republic	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/397753_sq-300_jpg?allowDefaultPicture=true
313	2018-07-16 18:55:37.345837+08	2018-07-16 18:55:37.345837+08	\N	10	JOAO MARIO	Portugal	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/368700_sq-300_jpg?allowDefaultPicture=true
314	2018-07-16 18:55:37.348353+08	2018-07-16 18:55:37.348353+08	\N	8	JOAO MOUTINHO	Portugal	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/200199_sq-300_jpg?allowDefaultPicture=true
315	2018-07-16 18:55:37.350992+08	2018-07-16 18:55:37.350992+08	\N	12	Joel CAMPBELL	Costa Rica	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/307529_sq-300_jpg?allowDefaultPicture=true
316	2018-07-16 18:55:37.353444+08	2018-07-16 18:55:37.353444+08	\N	15	Joel OBI	Nigeria	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/329076_sq-300_jpg?allowDefaultPicture=true
317	2018-07-16 18:55:37.356034+08	2018-07-16 18:55:37.356034+08	\N	20	Johan DJOUROU	Switzerland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/216645_sq-300_jpg?allowDefaultPicture=true
318	2018-07-16 18:55:37.358434+08	2018-07-16 18:55:37.358434+08	\N	17	Johan MOJICA	Colombia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/394500_sq-300_jpg?allowDefaultPicture=true
319	2018-07-16 18:55:37.365201+08	2018-07-16 18:55:37.365201+08	\N	11	Johan VENEGAS	Costa Rica	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/395354_sq-300_jpg?allowDefaultPicture=true
320	2018-07-16 18:55:37.367415+08	2018-07-16 18:55:37.367415+08	\N	7	Johann GUDMUNDSSON	Iceland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/300351_sq-300_jpg?allowDefaultPicture=true
321	2018-07-16 18:55:37.369961+08	2018-07-16 18:55:37.369961+08	\N	11	John GUIDETTI	Sweden	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/398551_sq-300_jpg?allowDefaultPicture=true
322	2018-07-16 18:55:37.372171+08	2018-07-16 18:55:37.372171+08	\N	10	John Obi MIKEL	Nigeria	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/234463_sq-300_jpg?allowDefaultPicture=true
323	2018-07-16 18:55:37.374334+08	2018-07-16 18:55:37.374334+08	\N	19	John OGU	Nigeria	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/367504_sq-300_jpg?allowDefaultPicture=true
324	2018-07-16 18:55:37.37681+08	2018-07-16 18:55:37.37681+08	\N	5	John STONES	England	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/369434_sq-300_jpg?allowDefaultPicture=true
325	2018-07-16 18:55:37.379206+08	2018-07-16 18:55:37.379206+08	\N	2	Johnny ACOSTA	Costa Rica	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/339447_sq-300_jpg?allowDefaultPicture=true
326	2018-07-16 18:55:37.382037+08	2018-07-16 18:55:37.382037+08	\N	22	Jon BODVARSSON	Iceland	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/401145_sq-300_jpg?allowDefaultPicture=true
327	2018-07-16 18:55:37.384811+08	2018-07-16 18:55:37.384811+08	\N	3	Jonas HECTOR	Germany	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/401377_sq-300_jpg?allowDefaultPicture=true
328	2018-07-16 18:55:37.387661+08	2018-07-16 18:55:37.387661+08	\N	5	Jonas KNUDSEN	Denmark	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/365738_sq-300_jpg?allowDefaultPicture=true
329	2018-07-16 18:55:37.389969+08	2018-07-16 18:55:37.389969+08	\N	16	Jonas LOSSL	Denmark	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/318462_sq-300_jpg?allowDefaultPicture=true
330	2018-07-16 18:55:37.392305+08	2018-07-16 18:55:37.392305+08	\N	6	Jonathan DOS SANTOS	Mexico	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/318612_sq-300_jpg?allowDefaultPicture=true
331	2018-07-16 18:55:37.394823+08	2018-07-16 18:55:37.394823+08	\N	20	Jonathan URRETAVISCAYA	Uruguay	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/305384_sq-300_jpg?allowDefaultPicture=true
332	2018-07-16 18:55:37.397704+08	2018-07-16 18:55:37.397704+08	\N	8	Jordan HENDERSON	England	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/356189_sq-300_jpg?allowDefaultPicture=true
333	2018-07-16 18:55:37.400918+08	2018-07-16 18:55:37.400918+08	\N	1	Jordan PICKFORD	England	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/336022_sq-300_jpg?allowDefaultPicture=true
334	2018-07-16 18:55:37.403146+08	2018-07-16 18:55:37.403146+08	\N	18	Jordi ALBA	Spain	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/306954_sq-300_jpg?allowDefaultPicture=true
335	2018-07-16 18:55:37.405912+08	2018-07-16 18:55:37.405912+08	\N	12	Jose CALDERON	Panama	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/198478_sq-300_jpg?allowDefaultPicture=true
336	2018-07-16 18:55:37.40802+08	2018-07-16 18:55:37.40802+08	\N	21	Jose CARVALLO	Peru	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/229480_sq-300_jpg?allowDefaultPicture=true
337	2018-07-16 18:55:37.410209+08	2018-07-16 18:55:37.410209+08	\N	1	Jose CORONA	Mexico	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/195231_sq-300_jpg?allowDefaultPicture=true
338	2018-07-16 18:55:37.412656+08	2018-07-16 18:55:37.412656+08	\N	22	Jose CUADRADO	Colombia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/411340_sq-300_jpg?allowDefaultPicture=true
339	2018-07-16 18:55:37.414806+08	2018-07-16 18:55:37.414806+08	\N	6	JOSE FONTE	Portugal	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/398511_sq-300_jpg?allowDefaultPicture=true
340	2018-07-16 18:55:37.41668+08	2018-07-16 18:55:37.41668+08	\N	2	Jose GIMENEZ	Uruguay	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/368655_sq-300_jpg?allowDefaultPicture=true
341	2018-07-16 18:55:37.419106+08	2018-07-16 18:55:37.419106+08	\N	21	Jose IZQUIERDO	Colombia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/411341_sq-300_jpg?allowDefaultPicture=true
342	2018-07-16 18:55:37.421192+08	2018-07-16 18:55:37.421192+08	\N	21	Jose Luis RODRIGUEZ	Panama	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/411176_sq-300_jpg?allowDefaultPicture=true
343	2018-07-16 18:55:37.42323+08	2018-07-16 18:55:37.42323+08	\N	18	Joshua KIMMICH	Germany	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/386413_sq-300_jpg?allowDefaultPicture=true
344	2018-07-16 18:55:37.429927+08	2018-07-16 18:55:37.429927+08	\N	19	Joshua RISDON	Australia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/397717_sq-300_jpg?allowDefaultPicture=true
345	2018-07-16 18:55:37.432076+08	2018-07-16 18:55:37.432076+08	\N	19	Josip DRMIC	Switzerland	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/356399_sq-300_jpg?allowDefaultPicture=true
346	2018-07-16 18:55:37.434283+08	2018-07-16 18:55:37.434283+08	\N	22	Josip PIVARIC	Croatia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/375261_sq-300_jpg?allowDefaultPicture=true
347	2018-07-16 18:55:37.436975+08	2018-07-16 18:55:37.436975+08	\N	8	JU Sejong	Korea Republic	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/390529_sq-300_jpg?allowDefaultPicture=true
348	2018-07-16 18:55:37.439693+08	2018-07-16 18:55:37.439693+08	\N	11	Juan CUADRADO	Colombia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/309714_sq-300_jpg?allowDefaultPicture=true
349	2018-07-16 18:55:37.442592+08	2018-07-16 18:55:37.442592+08	\N	20	Juan QUINTERO	Colombia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/356704_sq-300_jpg?allowDefaultPicture=true
350	2018-07-16 18:55:37.444966+08	2018-07-16 18:55:37.444966+08	\N	20	Julian BRANDT	Germany	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/385947_sq-300_jpg?allowDefaultPicture=true
351	2018-07-16 18:55:37.447288+08	2018-07-16 18:55:37.447288+08	\N	7	Julian DRAXLER	Germany	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/358692_sq-300_jpg?allowDefaultPicture=true
352	2018-07-16 18:55:37.449659+08	2018-07-16 18:55:37.449659+08	\N	3	JUNG Seunghyun	Korea Republic	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/395087_sq-300_jpg?allowDefaultPicture=true
353	2018-07-16 18:55:37.452387+08	2018-07-16 18:55:37.452387+08	\N	15	JUNG Wooyoung	Korea Republic	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/356534_sq-300_jpg?allowDefaultPicture=true
354	2018-07-16 18:55:37.454922+08	2018-07-16 18:55:37.454922+08	\N	11	KAHRABA	Egypt	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/369215_sq-300_jpg?allowDefaultPicture=true
355	2018-07-16 18:55:37.456996+08	2018-07-16 18:55:37.456996+08	\N	3	Kalidou KOULIBALY	Senegal	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/339820_sq-300_jpg?allowDefaultPicture=true
356	2018-07-16 18:55:37.459188+08	2018-07-16 18:55:37.459188+08	\N	15	Kamil GLIK	Poland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/269695_sq-300_jpg?allowDefaultPicture=true
357	2018-07-16 18:55:37.462033+08	2018-07-16 18:55:37.462033+08	\N	11	Kamil GROSICKI	Poland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/269706_sq-300_jpg?allowDefaultPicture=true
358	2018-07-16 18:55:37.464356+08	2018-07-16 18:55:37.464356+08	\N	4	Kara MBODJI	Senegal	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/353758_sq-300_jpg?allowDefaultPicture=true
359	2018-07-16 18:55:37.466915+08	2018-07-16 18:55:37.466915+08	\N	14	Kari ARNASON	Iceland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/231598_sq-300_jpg?allowDefaultPicture=true
360	2018-07-16 18:55:37.46964+08	2018-07-16 18:55:37.46964+08	\N	10	Karim ANSARIFARD	IR Iran	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/330659_sq-300_jpg?allowDefaultPicture=true
361	2018-07-16 18:55:37.471993+08	2018-07-16 18:55:37.471993+08	\N	8	Karim EL AHMADI	Morocco	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/232674_sq-300_jpg?allowDefaultPicture=true
362	2018-07-16 18:55:37.474332+08	2018-07-16 18:55:37.474332+08	\N	12	Karl-Johan JOHNSSON	Sweden	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/398556_sq-300_jpg?allowDefaultPicture=true
363	2018-07-16 18:55:37.477051+08	2018-07-16 18:55:37.477051+08	\N	8	Karol LINETTY	Poland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/401277_sq-300_jpg?allowDefaultPicture=true
364	2018-07-16 18:55:37.479439+08	2018-07-16 18:55:37.479439+08	\N	1	Kasper  SCHMEICHEL	Denmark	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/278388_sq-300_jpg?allowDefaultPicture=true
365	2018-07-16 18:55:37.482062+08	2018-07-16 18:55:37.482062+08	\N	12	Kasper DOLBERG	Denmark	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/402096_sq-300_jpg?allowDefaultPicture=true
366	2018-07-16 18:55:37.48493+08	2018-07-16 18:55:37.48493+08	\N	4	Keisuke HONDA	Japan	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/233500_sq-300_jpg?allowDefaultPicture=true
367	2018-07-16 18:55:37.487574+08	2018-07-16 18:55:37.487574+08	\N	20	Keita BALDE	Senegal	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/401888_sq-300_jpg?allowDefaultPicture=true
368	2018-07-16 18:55:37.489997+08	2018-07-16 18:55:37.489997+08	\N	14	Kelechi IHEANACHO	Nigeria	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/372542_sq-300_jpg?allowDefaultPicture=true
369	2018-07-16 18:55:37.49267+08	2018-07-16 18:55:37.49267+08	\N	19	Kendall WASTON	Costa Rica	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/236536_sq-300_jpg?allowDefaultPicture=true
370	2018-07-16 18:55:37.496782+08	2018-07-16 18:55:37.496782+08	\N	22	Kenner GUTIERREZ	Costa Rica	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/307016_sq-300_jpg?allowDefaultPicture=true
371	2018-07-16 18:55:37.498887+08	2018-07-16 18:55:37.498887+08	\N	22	Kenneth OMERUO	Nigeria	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/315424_sq-300_jpg?allowDefaultPicture=true
372	2018-07-16 18:55:37.501232+08	2018-07-16 18:55:37.501232+08	\N	13	Kepa ARRIZABALAGA	Spain	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/369110_sq-300_jpg?allowDefaultPicture=true
373	2018-07-16 18:55:37.503627+08	2018-07-16 18:55:37.503627+08	\N	7	Kevin DE BRUYNE	Belgium	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/358120_sq-300_jpg?allowDefaultPicture=true
374	2018-07-16 18:55:37.505908+08	2018-07-16 18:55:37.505908+08	\N	12	Kevin TRAPP	Germany	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/274179_sq-300_jpg?allowDefaultPicture=true
375	2018-07-16 18:55:37.508969+08	2018-07-16 18:55:37.508969+08	\N	1	Keylor NAVAS	Costa Rica	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/199175_sq-300_jpg?allowDefaultPicture=true
376	2018-07-16 18:55:37.510973+08	2018-07-16 18:55:37.510973+08	\N	16	Khadim NDIAYE	Senegal	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/353111_sq-300_jpg?allowDefaultPicture=true
377	2018-07-16 18:55:37.512384+08	2018-07-16 18:55:37.512384+08	\N	13	Khalid BOUTAIB	Morocco	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/401884_sq-300_jpg?allowDefaultPicture=true
378	2018-07-16 18:55:37.513805+08	2018-07-16 18:55:37.513805+08	\N	16	KI Sungyueng	Korea Republic	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/268406_sq-300_jpg?allowDefaultPicture=true
379	2018-07-16 18:55:37.515648+08	2018-07-16 18:55:37.515648+08	\N	12	Kieran TRIPPIER	England	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/306504_sq-300_jpg?allowDefaultPicture=true
380	2018-07-16 18:55:37.517758+08	2018-07-16 18:55:37.517758+08	\N	21	KIM Jinhyeon	Korea Republic	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/268426_sq-300_jpg?allowDefaultPicture=true
381	2018-07-16 18:55:37.51987+08	2018-07-16 18:55:37.51987+08	\N	12	KIM Minwoo	Korea Republic	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/274285_sq-300_jpg?allowDefaultPicture=true
382	2018-07-16 18:55:37.522027+08	2018-07-16 18:55:37.522027+08	\N	1	KIM Seunggyu	Korea Republic	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/274281_sq-300_jpg?allowDefaultPicture=true
383	2018-07-16 18:55:37.524014+08	2018-07-16 18:55:37.524014+08	\N	9	KIM Shinwook	Korea Republic	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/321745_sq-300_jpg?allowDefaultPicture=true
384	2018-07-16 18:55:37.525879+08	2018-07-16 18:55:37.525879+08	\N	19	KIM Younggwon	Korea Republic	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/375754_sq-300_jpg?allowDefaultPicture=true
385	2018-07-16 18:55:37.52786+08	2018-07-16 18:55:37.52786+08	\N	13	Koen CASTEELS	Belgium	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/373315_sq-300_jpg?allowDefaultPicture=true
386	2018-07-16 18:55:37.530126+08	2018-07-16 18:55:37.530126+08	\N	8	KOKE	Spain	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/313410_sq-300_jpg?allowDefaultPicture=true
387	2018-07-16 18:55:37.53213+08	2018-07-16 18:55:37.53213+08	\N	13	KOO Jacheol	Korea Republic	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/291393_sq-300_jpg?allowDefaultPicture=true
388	2018-07-16 18:55:37.534579+08	2018-07-16 18:55:37.534579+08	\N	23	Kosuke NAKAMURA	Japan	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/331184_sq-300_jpg?allowDefaultPicture=true
389	2018-07-16 18:55:37.536863+08	2018-07-16 18:55:37.536863+08	\N	23	Kristoffer NORDFELDT	Sweden	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/360496_sq-300_jpg?allowDefaultPicture=true
390	2018-07-16 18:55:37.538767+08	2018-07-16 18:55:37.538767+08	\N	2	Kyle WALKER	England	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/356750_sq-300_jpg?allowDefaultPicture=true
391	2018-07-16 18:55:37.540783+08	2018-07-16 18:55:37.540783+08	\N	10	Kylian MBAPPE	France	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/389867_sq-300_jpg?allowDefaultPicture=true
392	2018-07-16 18:55:37.542962+08	2018-07-16 18:55:37.542962+08	\N	21	Lamine GASSAMA	Senegal	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/319348_sq-300_jpg?allowDefaultPicture=true
393	2018-07-16 18:55:37.545133+08	2018-07-16 18:55:37.545133+08	\N	19	Lasse SCHONE	Denmark	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/313907_sq-300_jpg?allowDefaultPicture=true
394	2018-07-16 18:55:37.547276+08	2018-07-16 18:55:37.547276+08	\N	23	Leander DENDONCKER	Belgium	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/402015_sq-300_jpg?allowDefaultPicture=true
395	2018-07-16 18:55:37.549738+08	2018-07-16 18:55:37.549738+08	\N	17	LEE Jaesung	Korea Republic	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/390525_sq-300_jpg?allowDefaultPicture=true
396	2018-07-16 18:55:37.552028+08	2018-07-16 18:55:37.552028+08	\N	10	LEE Seungwoo	Korea Republic	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/390081_sq-300_jpg?allowDefaultPicture=true
397	2018-07-16 18:55:37.557075+08	2018-07-16 18:55:37.557075+08	\N	2	LEE Yong	Korea Republic	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/363578_sq-300_jpg?allowDefaultPicture=true
398	2018-07-16 18:55:37.559226+08	2018-07-16 18:55:37.559226+08	\N	6	Leon BALOGUN	Nigeria	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/402251_sq-300_jpg?allowDefaultPicture=true
399	2018-07-16 18:55:37.561568+08	2018-07-16 18:55:37.561568+08	\N	14	Leon GORETZKA	Germany	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/379953_sq-300_jpg?allowDefaultPicture=true
400	2018-07-16 18:55:37.563835+08	2018-07-16 18:55:37.563835+08	\N	23	Leonel MOREIRA	Costa Rica	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/270136_sq-300_jpg?allowDefaultPicture=true
401	2018-07-16 18:55:37.566298+08	2018-07-16 18:55:37.566298+08	\N	10	Lionel MESSI	Argentina	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/229397_sq-300_jpg?allowDefaultPicture=true
402	2018-07-16 18:55:37.568921+08	2018-07-16 18:55:37.568921+08	\N	12	Lovre KALINIC	Croatia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/376287_sq-300_jpg?allowDefaultPicture=true
403	2018-07-16 18:55:37.571524+08	2018-07-16 18:55:37.571524+08	\N	5	Lucas BIGLIA	Argentina	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/200133_sq-300_jpg?allowDefaultPicture=true
404	2018-07-16 18:55:37.573823+08	2018-07-16 18:55:37.573823+08	\N	21	Lucas HERNANDEZ	France	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/411470_sq-300_jpg?allowDefaultPicture=true
405	2018-07-16 18:55:37.57627+08	2018-07-16 18:55:37.57627+08	\N	14	Lucas TORREIRA	Uruguay	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/371670_sq-300_jpg?allowDefaultPicture=true
406	2018-07-16 18:55:37.579059+08	2018-07-16 18:55:37.579059+08	\N	11	Lucas VAZQUEZ	Spain	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/400713_sq-300_jpg?allowDefaultPicture=true
407	2018-07-16 18:55:37.581826+08	2018-07-16 18:55:37.581826+08	\N	6	Ludwig AUGUSTINSSON	Sweden	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/395264_sq-300_jpg?allowDefaultPicture=true
408	2018-07-16 18:55:37.584647+08	2018-07-16 18:55:37.584647+08	\N	17	Luis ADVINCULA	Peru	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/349697_sq-300_jpg?allowDefaultPicture=true
409	2018-07-16 18:55:37.586888+08	2018-07-16 18:55:37.586888+08	\N	14	Luis MURIEL	Colombia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/339731_sq-300_jpg?allowDefaultPicture=true
410	2018-07-16 18:55:37.588894+08	2018-07-16 18:55:37.588894+08	\N	17	Luis OVALLE	Panama	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/267688_sq-300_jpg?allowDefaultPicture=true
411	2018-07-16 18:55:37.591+08	2018-07-16 18:55:37.591+08	\N	9	Luis SUAREZ	Uruguay	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/270775_sq-300_jpg?allowDefaultPicture=true
412	2018-07-16 18:55:37.593258+08	2018-07-16 18:55:37.593258+08	\N	18	Luis TEJADA	Panama	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/213780_sq-300_jpg?allowDefaultPicture=true
413	2018-07-16 18:55:37.595653+08	2018-07-16 18:55:37.595653+08	\N	19	Luka JOVIC	Serbia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/385536_sq-300_jpg?allowDefaultPicture=true
414	2018-07-16 18:55:37.59793+08	2018-07-16 18:55:37.59793+08	\N	4	Luka MILIVOJEVIC	Serbia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/365641_sq-300_jpg?allowDefaultPicture=true
415	2018-07-16 18:55:37.600229+08	2018-07-16 18:55:37.600229+08	\N	10	Luka MODRIC	Croatia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/241559_sq-300_jpg?allowDefaultPicture=true
416	2018-07-16 18:55:37.603219+08	2018-07-16 18:55:37.603219+08	\N	18	Lukas LERAGER	Denmark	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/405205_sq-300_jpg?allowDefaultPicture=true
417	2018-07-16 18:55:37.605725+08	2018-07-16 18:55:37.605725+08	\N	22	Lukasz FABIANSKI	Poland	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/216931_sq-300_jpg?allowDefaultPicture=true
418	2018-07-16 18:55:37.607805+08	2018-07-16 18:55:37.607805+08	\N	20	Lukasz PISZCZEK	Poland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/216955_sq-300_jpg?allowDefaultPicture=true
419	2018-07-16 18:55:37.609863+08	2018-07-16 18:55:37.609863+08	\N	14	Lukasz TEODORCZYK	Poland	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/367469_sq-300_jpg?allowDefaultPicture=true
420	2018-07-16 18:55:37.611804+08	2018-07-16 18:55:37.611804+08	\N	13	Maciej RYBUS	Poland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/299687_sq-300_jpg?allowDefaultPicture=true
421	2018-07-16 18:55:37.613768+08	2018-07-16 18:55:37.613768+08	\N	2	Mahdi TORABI	IR Iran	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/390535_sq-300_jpg?allowDefaultPicture=true
422	2018-07-16 18:55:37.615885+08	2018-07-16 18:55:37.615885+08	\N	15	MAHMOUD HAMDY	Egypt	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/411607_sq-300_jpg?allowDefaultPicture=true
423	2018-07-16 18:55:37.618184+08	2018-07-16 18:55:37.618184+08	\N	19	Majid HOSSEINI	IR Iran	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/371735_sq-300_jpg?allowDefaultPicture=true
424	2018-07-16 18:55:37.6243+08	2018-07-16 18:55:37.6243+08	\N	17	Makoto HASEBE	Japan	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/289027_sq-300_jpg?allowDefaultPicture=true
425	2018-07-16 18:55:37.626822+08	2018-07-16 18:55:37.626822+08	\N	9	Mame DIOUF	Senegal	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/330687_sq-300_jpg?allowDefaultPicture=true
426	2018-07-16 18:55:37.629281+08	2018-07-16 18:55:37.629281+08	\N	2	MANSOUR ALHARBI	Saudi Arabia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/347316_sq-300_jpg?allowDefaultPicture=true
427	2018-07-16 18:55:37.632889+08	2018-07-16 18:55:37.632889+08	\N	5	Manuel AKANJI	Switzerland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/405178_sq-300_jpg?allowDefaultPicture=true
428	2018-07-16 18:55:37.635862+08	2018-07-16 18:55:37.635862+08	\N	4	Manuel DA COSTA	Morocco	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/299073_sq-300_jpg?allowDefaultPicture=true
429	2018-07-16 18:55:37.638593+08	2018-07-16 18:55:37.638593+08	\N	4	MANUEL FERNANDES	Portugal	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/201099_sq-300_jpg?allowDefaultPicture=true
430	2018-07-16 18:55:37.640772+08	2018-07-16 18:55:37.640772+08	\N	1	Manuel NEUER	Germany	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/228912_sq-300_jpg?allowDefaultPicture=true
431	2018-07-16 18:55:37.643048+08	2018-07-16 18:55:37.643048+08	\N	22	Marc-Andre TER STEGEN	Germany	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/309302_sq-300_jpg?allowDefaultPicture=true
432	2018-07-16 18:55:37.646818+08	2018-07-16 18:55:37.646818+08	\N	12	MARCELO	Brazil	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/218284_sq-300_jpg?allowDefaultPicture=true
433	2018-07-16 18:55:37.648761+08	2018-07-16 18:55:37.648761+08	\N	11	Marcelo BROZOVIC	Croatia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/380000_sq-300_jpg?allowDefaultPicture=true
434	2018-07-16 18:55:37.651529+08	2018-07-16 18:55:37.651529+08	\N	20	Marco ASENSIO	Spain	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/400715_sq-300_jpg?allowDefaultPicture=true
435	2018-07-16 18:55:37.653768+08	2018-07-16 18:55:37.653768+08	\N	8	Marco FABIAN	Mexico	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/319311_sq-300_jpg?allowDefaultPicture=true
436	2018-07-16 18:55:37.656152+08	2018-07-16 18:55:37.656152+08	\N	11	Marco REUS	Germany	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/352394_sq-300_jpg?allowDefaultPicture=true
437	2018-07-16 18:55:37.659866+08	2018-07-16 18:55:37.659866+08	\N	8	Marcos ACUNA	Argentina	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/401204_sq-300_jpg?allowDefaultPicture=true
438	2018-07-16 18:55:37.662626+08	2018-07-16 18:55:37.662626+08	\N	16	Marcos ROJO	Argentina	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/318688_sq-300_jpg?allowDefaultPicture=true
439	2018-07-16 18:55:37.665273+08	2018-07-16 18:55:37.665273+08	\N	21	Marcos URENA	Costa Rica	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/270144_sq-300_jpg?allowDefaultPicture=true
440	2018-07-16 18:55:37.667824+08	2018-07-16 18:55:37.667824+08	\N	9	Marcus BERG	Sweden	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/297243_sq-300_jpg?allowDefaultPicture=true
441	2018-07-16 18:55:37.670319+08	2018-07-16 18:55:37.670319+08	\N	19	Marcus RASHFORD	England	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/401470_sq-300_jpg?allowDefaultPicture=true
442	2018-07-16 18:55:37.673151+08	2018-07-16 18:55:37.673151+08	\N	19	Marcus ROHDEN	Sweden	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/398549_sq-300_jpg?allowDefaultPicture=true
443	2018-07-16 18:55:37.676034+08	2018-07-16 18:55:37.676034+08	\N	2	MARIO FERNANDES	Russia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/312866_sq-300_jpg?allowDefaultPicture=true
444	2018-07-16 18:55:37.678686+08	2018-07-16 18:55:37.678686+08	\N	18	Mario GAVRANOVIC	Switzerland	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/319470_sq-300_jpg?allowDefaultPicture=true
445	2018-07-16 18:55:37.681263+08	2018-07-16 18:55:37.681263+08	\N	23	Mario GOMEZ	Germany	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/216784_sq-300_jpg?allowDefaultPicture=true
446	2018-07-16 18:55:37.684401+08	2018-07-16 18:55:37.684401+08	\N	17	Mario MANDZUKIC	Croatia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/375518_sq-300_jpg?allowDefaultPicture=true
447	2018-07-16 18:55:37.687061+08	2018-07-16 18:55:37.687061+08	\N	19	MARIO RUI	Portugal	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/336510_sq-300_jpg?allowDefaultPicture=true
448	2018-07-16 18:55:37.689181+08	2018-07-16 18:55:37.689181+08	\N	5	Mark MILLIGAN	Australia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/197411_sq-300_jpg?allowDefaultPicture=true
449	2018-07-16 18:55:37.691321+08	2018-07-16 18:55:37.691321+08	\N	23	Marko DMITROVIC	Serbia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/401177_sq-300_jpg?allowDefaultPicture=true
450	2018-07-16 18:55:37.696263+08	2018-07-16 18:55:37.696263+08	\N	16	Marko GRUJIC	Serbia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/385537_sq-300_jpg?allowDefaultPicture=true
451	2018-07-16 18:55:37.702138+08	2018-07-16 18:55:37.702138+08	\N	20	Marko PJACA	Croatia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/369057_sq-300_jpg?allowDefaultPicture=true
452	2018-07-16 18:55:37.70484+08	2018-07-16 18:55:37.70484+08	\N	8	Marouane FELLAINI	Belgium	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/290902_sq-300_jpg?allowDefaultPicture=true
453	2018-07-16 18:55:37.707621+08	2018-07-16 18:55:37.707621+08	\N	13	MARQUINHOS	Brazil	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/332946_sq-300_jpg?allowDefaultPicture=true
454	2018-07-16 18:55:37.709683+08	2018-07-16 18:55:37.709683+08	\N	11	Martin BRAITHWAITE	Denmark	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/372857_sq-300_jpg?allowDefaultPicture=true
455	2018-07-16 18:55:37.711955+08	2018-07-16 18:55:37.711955+08	\N	22	Martin CACERES	Uruguay	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/267829_sq-300_jpg?allowDefaultPicture=true
456	2018-07-16 18:55:37.71413+08	2018-07-16 18:55:37.71413+08	\N	12	Martin CAMPANA	Uruguay	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/312993_sq-300_jpg?allowDefaultPicture=true
457	2018-07-16 18:55:37.716725+08	2018-07-16 18:55:37.716725+08	\N	5	Martin OLSSON	Sweden	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/358053_sq-300_jpg?allowDefaultPicture=true
458	2018-07-16 18:55:37.719203+08	2018-07-16 18:55:37.719203+08	\N	23	Martin SILVA	Uruguay	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/175629_sq-300_jpg?allowDefaultPicture=true
459	2018-07-16 18:55:37.721785+08	2018-07-16 18:55:37.721785+08	\N	2	Marvin PLATTENHARDT	Germany	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/309312_sq-300_jpg?allowDefaultPicture=true
460	2018-07-16 18:55:37.723969+08	2018-07-16 18:55:37.723969+08	\N	9	MARWAN MOHSEN	Egypt	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/339900_sq-300_jpg?allowDefaultPicture=true
461	2018-07-16 18:55:37.726221+08	2018-07-16 18:55:37.726221+08	\N	12	Masaaki HIGASHIGUCHI	Japan	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/356269_sq-300_jpg?allowDefaultPicture=true
462	2018-07-16 18:55:37.72903+08	2018-07-16 18:55:37.72903+08	\N	7	Masoud SHOJAEI	IR Iran	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/213170_sq-300_jpg?allowDefaultPicture=true
463	2018-07-16 18:55:37.731669+08	2018-07-16 18:55:37.731669+08	\N	8	Massimo LUONGO	Australia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/339116_sq-300_jpg?allowDefaultPicture=true
464	2018-07-16 18:55:37.733992+08	2018-07-16 18:55:37.733992+08	\N	8	Mateo KOVACIC	Croatia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/339987_sq-300_jpg?allowDefaultPicture=true
465	2018-07-16 18:55:37.736213+08	2018-07-16 18:55:37.736213+08	\N	15	Mateus URIBE	Colombia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/398409_sq-300_jpg?allowDefaultPicture=true
466	2018-07-16 18:55:37.739093+08	2018-07-16 18:55:37.739093+08	\N	7	Mathew LECKIE	Australia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/321697_sq-300_jpg?allowDefaultPicture=true
467	2018-07-16 18:55:37.74145+08	2018-07-16 18:55:37.74145+08	\N	1	Mathew RYAN	Australia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/339117_sq-300_jpg?allowDefaultPicture=true
468	2018-07-16 18:55:37.743796+08	2018-07-16 18:55:37.743796+08	\N	13	Mathias  JORGENSEN	Denmark	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/318485_sq-300_jpg?allowDefaultPicture=true
469	2018-07-16 18:55:37.746001+08	2018-07-16 18:55:37.746001+08	\N	15	Matias VECINO	Uruguay	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/337196_sq-300_jpg?allowDefaultPicture=true
470	2018-07-16 18:55:37.748241+08	2018-07-16 18:55:37.748241+08	\N	5	Mats HUMMELS	Germany	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/311150_sq-300_jpg?allowDefaultPicture=true
471	2018-07-16 18:55:37.750354+08	2018-07-16 18:55:37.750354+08	\N	6	Matthew JURMAN	Australia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/306404_sq-300_jpg?allowDefaultPicture=true
472	2018-07-16 18:55:37.752585+08	2018-07-16 18:55:37.752585+08	\N	4	Matthias GINTER	Germany	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/379736_sq-300_jpg?allowDefaultPicture=true
473	2018-07-16 18:55:37.75535+08	2018-07-16 18:55:37.75535+08	\N	18	Maximiliano GOMEZ	Uruguay	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/407384_sq-300_jpg?allowDefaultPicture=true
474	2018-07-16 18:55:37.758006+08	2018-07-16 18:55:37.758006+08	\N	13	Maximiliano MEZA	Argentina	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/411433_sq-300_jpg?allowDefaultPicture=true
475	2018-07-16 18:55:37.760876+08	2018-07-16 18:55:37.760876+08	\N	16	Maximiliano PEREIRA	Uruguay	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/286481_sq-300_jpg?allowDefaultPicture=true
476	2018-07-16 18:55:37.766142+08	2018-07-16 18:55:37.766142+08	\N	22	Maya YOSHIDA	Japan	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/271253_sq-300_jpg?allowDefaultPicture=true
477	2018-07-16 18:55:37.769037+08	2018-07-16 18:55:37.769037+08	\N	14	Mbark BOUSSOUFA	Morocco	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/296799_sq-300_jpg?allowDefaultPicture=true
478	2018-07-16 18:55:37.7717+08	2018-07-16 18:55:37.7717+08	\N	19	Mbaye NIANG	Senegal	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/336000_sq-300_jpg?allowDefaultPicture=true
479	2018-07-16 18:55:37.774001+08	2018-07-16 18:55:37.774001+08	\N	5	Mehdi BENATIA	Morocco	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/305954_sq-300_jpg?allowDefaultPicture=true
480	2018-07-16 18:55:37.776323+08	2018-07-16 18:55:37.776323+08	\N	23	Mehdi CARCELA	Morocco	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/290868_sq-300_jpg?allowDefaultPicture=true
481	2018-07-16 18:55:37.778913+08	2018-07-16 18:55:37.778913+08	\N	17	Mehdi TAREMI	IR Iran	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/388475_sq-300_jpg?allowDefaultPicture=true
482	2018-07-16 18:55:37.781104+08	2018-07-16 18:55:37.781104+08	\N	10	Mesut OEZIL	Germany	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/305036_sq-300_jpg?allowDefaultPicture=true
483	2018-07-16 18:55:37.7842+08	2018-07-16 18:55:37.7842+08	\N	2	Michael KROHN-DEHLI	Denmark	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/302550_sq-300_jpg?allowDefaultPicture=true
484	2018-07-16 18:55:37.787278+08	2018-07-16 18:55:37.787278+08	\N	6	Michael LANG	Switzerland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/356407_sq-300_jpg?allowDefaultPicture=true
485	2018-07-16 18:55:37.789747+08	2018-07-16 18:55:37.789747+08	\N	2	Michael MURILLO	Panama	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/385031_sq-300_jpg?allowDefaultPicture=true
486	2018-07-16 18:55:37.791734+08	2018-07-16 18:55:37.791734+08	\N	2	Michal PAZDAN	Poland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/297356_sq-300_jpg?allowDefaultPicture=true
487	2018-07-16 18:55:37.793689+08	2018-07-16 18:55:37.793689+08	\N	21	Michy BATSHUAYI	Belgium	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/378835_sq-300_jpg?allowDefaultPicture=true
488	2018-07-16 18:55:37.795642+08	2018-07-16 18:55:37.795642+08	\N	5	Miguel ARAUJO	Peru	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/368000_sq-300_jpg?allowDefaultPicture=true
489	2018-07-16 18:55:37.797583+08	2018-07-16 18:55:37.797583+08	\N	19	Miguel BORJA	Colombia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/369538_sq-300_jpg?allowDefaultPicture=true
490	2018-07-16 18:55:37.79975+08	2018-07-16 18:55:37.79975+08	\N	7	Miguel LAYUN	Mexico	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/371044_sq-300_jpg?allowDefaultPicture=true
491	2018-07-16 18:55:37.803191+08	2018-07-16 18:55:37.803191+08	\N	6	Miguel TRAUCO	Peru	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/397791_sq-300_jpg?allowDefaultPicture=true
492	2018-07-16 18:55:37.805632+08	2018-07-16 18:55:37.805632+08	\N	2	Mikael LUSTIG	Sweden	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/300251_sq-300_jpg?allowDefaultPicture=true
493	2018-07-16 18:55:37.80802+08	2018-07-16 18:55:37.80802+08	\N	5	Milad MOHAMMADI	IR Iran	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/390537_sq-300_jpg?allowDefaultPicture=true
494	2018-07-16 18:55:37.810538+08	2018-07-16 18:55:37.810538+08	\N	19	Milan BADELJ	Croatia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/357991_sq-300_jpg?allowDefaultPicture=true
495	2018-07-16 18:55:37.812871+08	2018-07-16 18:55:37.812871+08	\N	14	Milan RODIC	Serbia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/411548_sq-300_jpg?allowDefaultPicture=true
496	2018-07-16 18:55:37.815064+08	2018-07-16 18:55:37.815064+08	\N	15	Mile JEDINAK	Australia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/197514_sq-300_jpg?allowDefaultPicture=true
497	2018-07-16 18:55:37.818155+08	2018-07-16 18:55:37.818155+08	\N	2	Milos DEGENEK	Australia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/331149_sq-300_jpg?allowDefaultPicture=true
498	2018-07-16 18:55:37.820782+08	2018-07-16 18:55:37.820782+08	\N	13	Milos VELJKOVIC	Serbia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/385852_sq-300_jpg?allowDefaultPicture=true
499	2018-07-16 18:55:37.822979+08	2018-07-16 18:55:37.822979+08	\N	3	MIRANDA	Brazil	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/289958_sq-300_jpg?allowDefaultPicture=true
500	2018-07-16 18:55:37.825883+08	2018-07-16 18:55:37.825883+08	\N	13	MOHAMED ABDELSHAFY	Egypt	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/356053_sq-300_jpg?allowDefaultPicture=true
501	2018-07-16 18:55:37.828418+08	2018-07-16 18:55:37.828418+08	\N	14	Mohamed BEN AMOR	Tunisia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/401798_sq-300_jpg?allowDefaultPicture=true
502	2018-07-16 18:55:37.837691+08	2018-07-16 18:55:37.837691+08	\N	17	MOHAMED ELNENY	Egypt	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/332777_sq-300_jpg?allowDefaultPicture=true
503	2018-07-16 18:55:37.845778+08	2018-07-16 18:55:37.845778+08	\N	23	MOHAMED ELSHENAWY	Egypt	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/408948_sq-300_jpg?allowDefaultPicture=true
504	2018-07-16 18:55:37.848135+08	2018-07-16 18:55:37.848135+08	\N	12	MOHAMED KANNO	Saudi Arabia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/407993_sq-300_jpg?allowDefaultPicture=true
505	2018-07-16 18:55:37.851563+08	2018-07-16 18:55:37.851563+08	\N	10	MOHAMED SALAH	Egypt	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/344654_sq-300_jpg?allowDefaultPicture=true
506	2018-07-16 18:55:37.855925+08	2018-07-16 18:55:37.855925+08	\N	13	Mohammad Reza KHANZADEH	IR Iran	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/379885_sq-300_jpg?allowDefaultPicture=true
507	2018-07-16 18:55:37.858521+08	2018-07-16 18:55:37.858521+08	\N	6	MOHAMMED ALBURAYK	Saudi Arabia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/397857_sq-300_jpg?allowDefaultPicture=true
508	2018-07-16 18:55:37.860946+08	2018-07-16 18:55:37.860946+08	\N	22	MOHAMMED ALOWAIS	Saudi Arabia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/396885_sq-300_jpg?allowDefaultPicture=true
509	2018-07-16 18:55:37.863338+08	2018-07-16 18:55:37.863338+08	\N	10	MOHAMMED ALSAHLAWI	Saudi Arabia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/288078_sq-300_jpg?allowDefaultPicture=true
510	2018-07-16 18:55:37.865577+08	2018-07-16 18:55:37.865577+08	\N	12	Monir EL KAJOUI	Morocco	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/395755_sq-300_jpg?allowDefaultPicture=true
511	2018-07-16 18:55:37.868556+08	2018-07-16 18:55:37.868556+08	\N	18	MOON Seonmin	Korea Republic	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/314722_sq-300_jpg?allowDefaultPicture=true
512	2018-07-16 18:55:37.870709+08	2018-07-16 18:55:37.870709+08	\N	8	Morteza POURALIGANJI	IR Iran	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/314249_sq-300_jpg?allowDefaultPicture=true
513	2018-07-16 18:55:37.872875+08	2018-07-16 18:55:37.872875+08	\N	23	MOTAZ HAWSAWI	Saudi Arabia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/339477_sq-300_jpg?allowDefaultPicture=true
514	2018-07-16 18:55:37.874916+08	2018-07-16 18:55:37.874916+08	\N	22	Mouez HASSEN	Tunisia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/411654_sq-300_jpg?allowDefaultPicture=true
515	2018-07-16 18:55:37.87705+08	2018-07-16 18:55:37.87705+08	\N	19	Moussa DEMBELE	Belgium	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/290825_sq-300_jpg?allowDefaultPicture=true
516	2018-07-16 18:55:37.879061+08	2018-07-16 18:55:37.879061+08	\N	14	Moussa KONATE	Senegal	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/353782_sq-300_jpg?allowDefaultPicture=true
517	2018-07-16 18:55:37.880981+08	2018-07-16 18:55:37.880981+08	\N	7	Moussa SOW	Senegal	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/327043_sq-300_jpg?allowDefaultPicture=true
518	2018-07-16 18:55:37.882929+08	2018-07-16 18:55:37.882929+08	\N	22	Moussa WAGUE	Senegal	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/386256_sq-300_jpg?allowDefaultPicture=true
519	2018-07-16 18:55:37.885565+08	2018-07-16 18:55:37.885565+08	\N	20	MUHANNAD ASIRI	Saudi Arabia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/330914_sq-300_jpg?allowDefaultPicture=true
520	2018-07-16 18:55:37.88791+08	2018-07-16 18:55:37.88791+08	\N	17	Nabil DIRAR	Morocco	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/296750_sq-300_jpg?allowDefaultPicture=true
521	2018-07-16 18:55:37.89+08	2018-07-16 18:55:37.89+08	\N	18	Nabil FEKIR	France	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/401458_sq-300_jpg?allowDefaultPicture=true
522	2018-07-16 18:55:37.891966+08	2018-07-16 18:55:37.891966+08	\N	22	Nacer CHADLI	Belgium	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/358108_sq-300_jpg?allowDefaultPicture=true
523	2018-07-16 18:55:37.893922+08	2018-07-16 18:55:37.893922+08	\N	4	NACHO	Spain	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/400711_sq-300_jpg?allowDefaultPicture=true
524	2018-07-16 18:55:37.895853+08	2018-07-16 18:55:37.895853+08	\N	16	Nacho MONREAL	Spain	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/299369_sq-300_jpg?allowDefaultPicture=true
525	2018-07-16 18:55:37.897831+08	2018-07-16 18:55:37.897831+08	\N	8	Nahitan NANDEZ	Uruguay	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/386284_sq-300_jpg?allowDefaultPicture=true
526	2018-07-16 18:55:37.900758+08	2018-07-16 18:55:37.900758+08	\N	1	Nahuel GUZMAN	Argentina	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/200999_sq-300_jpg?allowDefaultPicture=true
527	2018-07-16 18:55:37.905008+08	2018-07-16 18:55:37.905008+08	\N	23	Naim SLITI	Tunisia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/402235_sq-300_jpg?allowDefaultPicture=true
528	2018-07-16 18:55:37.907625+08	2018-07-16 18:55:37.907625+08	\N	2	Naomichi UEDA	Japan	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/331166_sq-300_jpg?allowDefaultPicture=true
529	2018-07-16 18:55:37.909846+08	2018-07-16 18:55:37.909846+08	\N	21	Nemanja MATIC	Serbia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/310082_sq-300_jpg?allowDefaultPicture=true
530	2018-07-16 18:55:37.91553+08	2018-07-16 18:55:37.91553+08	\N	18	Nemanja RADONJIC	Serbia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/385893_sq-300_jpg?allowDefaultPicture=true
531	2018-07-16 18:55:37.917757+08	2018-07-16 18:55:37.917757+08	\N	10	NEYMAR	Brazil	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/314197_sq-300_jpg?allowDefaultPicture=true
532	2018-07-16 18:55:37.920098+08	2018-07-16 18:55:37.920098+08	\N	13	Ngolo KANTE	France	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/398681_sq-300_jpg?allowDefaultPicture=true
533	2018-07-16 18:55:37.922499+08	2018-07-16 18:55:37.922499+08	\N	23	Nick POPE	England	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/411304_sq-300_jpg?allowDefaultPicture=true
534	2018-07-16 18:55:37.92447+08	2018-07-16 18:55:37.92447+08	\N	4	Nico ELVEDI	Switzerland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/398509_sq-300_jpg?allowDefaultPicture=true
535	2018-07-16 18:55:37.926659+08	2018-07-16 18:55:37.926659+08	\N	9	Nicolai JORGENSEN	Denmark	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/360184_sq-300_jpg?allowDefaultPicture=true
536	2018-07-16 18:55:37.928618+08	2018-07-16 18:55:37.928618+08	\N	17	Nicolas OTAMENDI	Argentina	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/310116_sq-300_jpg?allowDefaultPicture=true
537	2018-07-16 18:55:37.930612+08	2018-07-16 18:55:37.930612+08	\N	3	Nicolas TAGLIAFICO	Argentina	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/308322_sq-300_jpg?allowDefaultPicture=true
538	2018-07-16 18:55:37.932795+08	2018-07-16 18:55:37.932795+08	\N	15	Niklas SUELE	Germany	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/395488_sq-300_jpg?allowDefaultPicture=true
539	2018-07-16 18:55:37.935795+08	2018-07-16 18:55:37.935795+08	\N	16	Nikola KALINIC	Croatia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/297379_sq-300_jpg?allowDefaultPicture=true
540	2018-07-16 18:55:37.937864+08	2018-07-16 18:55:37.937864+08	\N	15	Nikola MILENKOVIC	Serbia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/411544_sq-300_jpg?allowDefaultPicture=true
541	2018-07-16 18:55:37.939834+08	2018-07-16 18:55:37.939834+08	\N	22	Nilson LOYOLA	Peru	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/398459_sq-300_jpg?allowDefaultPicture=true
542	2018-07-16 18:55:37.941875+08	2018-07-16 18:55:37.941875+08	\N	16	Noureddine AMRABAT	Morocco	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/291414_sq-300_jpg?allowDefaultPicture=true
543	2018-07-16 18:55:37.943931+08	2018-07-16 18:55:37.943931+08	\N	9	Odion IGHALO	Nigeria	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/312997_sq-300_jpg?allowDefaultPicture=true
544	2018-07-16 18:55:37.945807+08	2018-07-16 18:55:37.945807+08	\N	17	Ogenyi ONAZI	Nigeria	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/315429_sq-300_jpg?allowDefaultPicture=true
545	2018-07-16 18:55:37.947847+08	2018-07-16 18:55:37.947847+08	\N	8	Oghenekaro ETEBO	Nigeria	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/395531_sq-300_jpg?allowDefaultPicture=true
546	2018-07-16 18:55:37.949796+08	2018-07-16 18:55:37.949796+08	\N	4	OH Bansuk	Korea Republic	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/411413_sq-300_jpg?allowDefaultPicture=true
547	2018-07-16 18:55:37.953504+08	2018-07-16 18:55:37.953504+08	\N	20	Ola TOIVONEN	Sweden	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/300255_sq-300_jpg?allowDefaultPicture=true
548	2018-07-16 18:55:37.956103+08	2018-07-16 18:55:37.956103+08	\N	16	Olafur SKULASON	Iceland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/216678_sq-300_jpg?allowDefaultPicture=true
549	2018-07-16 18:55:37.958395+08	2018-07-16 18:55:37.958395+08	\N	9	Olivier GIROUD	France	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/358015_sq-300_jpg?allowDefaultPicture=true
550	2018-07-16 18:55:37.961193+08	2018-07-16 18:55:37.961193+08	\N	4	OMAR GABER	Egypt	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/344652_sq-300_jpg?allowDefaultPicture=true
551	2018-07-16 18:55:37.963921+08	2018-07-16 18:55:37.963921+08	\N	5	OMAR HAWSAWI	Saudi Arabia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/385091_sq-300_jpg?allowDefaultPicture=true
552	2018-07-16 18:55:37.966352+08	2018-07-16 18:55:37.966352+08	\N	9	Omid EBRAHIMI	IR Iran	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/346735_sq-300_jpg?allowDefaultPicture=true
553	2018-07-16 18:55:37.969369+08	2018-07-16 18:55:37.969369+08	\N	19	Oribe PERALTA	Mexico	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/227851_sq-300_jpg?allowDefaultPicture=true
554	2018-07-16 18:55:37.971984+08	2018-07-16 18:55:37.971984+08	\N	3	OSAMA HAWSAWI	Saudi Arabia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/278167_sq-300_jpg?allowDefaultPicture=true
555	2018-07-16 18:55:37.974231+08	2018-07-16 18:55:37.974231+08	\N	6	Oscar DUARTE	Costa Rica	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/312987_sq-300_jpg?allowDefaultPicture=true
556	2018-07-16 18:55:37.976193+08	2018-07-16 18:55:37.976193+08	\N	15	Oscar HILJEMARK	Sweden	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/372881_sq-300_jpg?allowDefaultPicture=true
557	2018-07-16 18:55:37.981863+08	2018-07-16 18:55:37.981863+08	\N	3	Oscar MURILLO	Colombia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/228688_sq-300_jpg?allowDefaultPicture=true
558	2018-07-16 18:55:37.984693+08	2018-07-16 18:55:37.984693+08	\N	11	Ousmane DEMBELE	France	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/398680_sq-300_jpg?allowDefaultPicture=true
559	2018-07-16 18:55:37.986918+08	2018-07-16 18:55:37.986918+08	\N	5	Oussama HADDADI	Tunisia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/401801_sq-300_jpg?allowDefaultPicture=true
560	2018-07-16 18:55:37.989798+08	2018-07-16 18:55:37.989798+08	\N	9	Paolo GUERRERO	Peru	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/225497_sq-300_jpg?allowDefaultPicture=true
561	2018-07-16 18:55:37.991944+08	2018-07-16 18:55:37.991944+08	\N	7	Paolo HURTADO	Peru	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/349685_sq-300_jpg?allowDefaultPicture=true
562	2018-07-16 18:55:37.994116+08	2018-07-16 18:55:37.994116+08	\N	17	Pape Alioune NDIAYE	Senegal	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/339919_sq-300_jpg?allowDefaultPicture=true
563	2018-07-16 18:55:37.996465+08	2018-07-16 18:55:37.996465+08	\N	6	PARK Jooho	Korea Republic	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/268411_sq-300_jpg?allowDefaultPicture=true
564	2018-07-16 18:55:37.998911+08	2018-07-16 18:55:37.998911+08	\N	18	Patrick PEMBERTON	Costa Rica	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/214874_sq-300_jpg?allowDefaultPicture=true
565	2018-07-16 18:55:38.001287+08	2018-07-16 18:55:38.001287+08	\N	6	Paul POGBA	France	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/367388_sq-300_jpg?allowDefaultPicture=true
566	2018-07-16 18:55:38.003629+08	2018-07-16 18:55:38.003629+08	\N	15	PAULINHO	Brazil	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/362727_sq-300_jpg?allowDefaultPicture=true
567	2018-07-16 18:55:38.006172+08	2018-07-16 18:55:38.006172+08	\N	21	Paulo DYBALA	Argentina	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/392905_sq-300_jpg?allowDefaultPicture=true
568	2018-07-16 18:55:38.010047+08	2018-07-16 18:55:38.010047+08	\N	23	Pedro AQUINO	Peru	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/397696_sq-300_jpg?allowDefaultPicture=true
569	2018-07-16 18:55:38.012231+08	2018-07-16 18:55:38.012231+08	\N	1	Pedro GALLESE	Peru	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/275261_sq-300_jpg?allowDefaultPicture=true
570	2018-07-16 18:55:38.014463+08	2018-07-16 18:55:38.014463+08	\N	4	PEDRO GEROMEL	Brazil	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/398286_sq-300_jpg?allowDefaultPicture=true
571	2018-07-16 18:55:38.017269+08	2018-07-16 18:55:38.017269+08	\N	15	Pejman MONTAZERI	IR Iran	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/251481_sq-300_jpg?allowDefaultPicture=true
572	2018-07-16 18:55:38.019575+08	2018-07-16 18:55:38.019575+08	\N	3	PEPE	Portugal	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/275931_sq-300_jpg?allowDefaultPicture=true
573	2018-07-16 18:55:38.022311+08	2018-07-16 18:55:38.022311+08	\N	23	Pepe REINA	Spain	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/175413_sq-300_jpg?allowDefaultPicture=true
574	2018-07-16 18:55:38.024818+08	2018-07-16 18:55:38.024818+08	\N	16	Phil JONES	England	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/358009_sq-300_jpg?allowDefaultPicture=true
575	2018-07-16 18:55:38.026972+08	2018-07-16 18:55:38.026972+08	\N	11	PHILIPPE COUTINHO	Brazil	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/308366_sq-300_jpg?allowDefaultPicture=true
576	2018-07-16 18:55:38.029511+08	2018-07-16 18:55:38.029511+08	\N	23	Pione SISTO	Denmark	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/395448_sq-300_jpg?allowDefaultPicture=true
577	2018-07-16 18:55:38.031868+08	2018-07-16 18:55:38.031868+08	\N	19	Piotr ZIELINSKI	Poland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/370436_sq-300_jpg?allowDefaultPicture=true
578	2018-07-16 18:55:38.035964+08	2018-07-16 18:55:38.035964+08	\N	18	Pontus JANSSON	Sweden	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/373312_sq-300_jpg?allowDefaultPicture=true
579	2018-07-16 18:55:38.038728+08	2018-07-16 18:55:38.038728+08	\N	12	Predrag RAJKOVIC	Serbia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/336393_sq-300_jpg?allowDefaultPicture=true
580	2018-07-16 18:55:38.041+08	2018-07-16 18:55:38.041+08	\N	3	Presnel KIMPEMBE	France	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/401459_sq-300_jpg?allowDefaultPicture=true
581	2018-07-16 18:55:38.043617+08	2018-07-16 18:55:38.043617+08	\N	9	Radamel FALCAO	Colombia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/229444_sq-300_jpg?allowDefaultPicture=true
582	2018-07-16 18:55:38.047892+08	2018-07-16 18:55:38.047892+08	\N	4	Rafael MARQUEZ	Mexico	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/178119_sq-300_jpg?allowDefaultPicture=true
583	2018-07-16 18:55:38.051458+08	2018-07-16 18:55:38.051458+08	\N	21	Rafal KURZAWA	Poland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/411483_sq-300_jpg?allowDefaultPicture=true
584	2018-07-16 18:55:38.059785+08	2018-07-16 18:55:38.059785+08	\N	6	Ragnar SIGURDSSON	Iceland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/300343_sq-300_jpg?allowDefaultPicture=true
585	2018-07-16 18:55:38.06191+08	2018-07-16 18:55:38.06191+08	\N	10	Raheem STERLING	England	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/336043_sq-300_jpg?allowDefaultPicture=true
586	2018-07-16 18:55:38.063929+08	2018-07-16 18:55:38.063929+08	\N	14	RAMADAN SOBHY	Egypt	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/401841_sq-300_jpg?allowDefaultPicture=true
587	2018-07-16 18:55:38.066042+08	2018-07-16 18:55:38.066042+08	\N	6	Rami BEDOUI	Tunisia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/273822_sq-300_jpg?allowDefaultPicture=true
588	2018-07-16 18:55:38.069089+08	2018-07-16 18:55:38.069089+08	\N	23	Ramin REZAEIAN	IR Iran	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/384797_sq-300_jpg?allowDefaultPicture=true
589	2018-07-16 18:55:38.07166+08	2018-07-16 18:55:38.07166+08	\N	14	Randall AZOFEIFA	Costa Rica	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/183794_sq-300_jpg?allowDefaultPicture=true
590	2018-07-16 18:55:38.073919+08	2018-07-16 18:55:38.073919+08	\N	5	RAPHAEL GUERREIRO	Portugal	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/395213_sq-300_jpg?allowDefaultPicture=true
591	2018-07-16 18:55:38.076159+08	2018-07-16 18:55:38.076159+08	\N	4	Raphael VARANE	France	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/359440_sq-300_jpg?allowDefaultPicture=true
592	2018-07-16 18:55:38.078274+08	2018-07-16 18:55:38.078274+08	\N	12	Rashid MAZAHERI	IR Iran	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/397792_sq-300_jpg?allowDefaultPicture=true
593	2018-07-16 18:55:38.080511+08	2018-07-16 18:55:38.080511+08	\N	9	Raul JIMENEZ	Mexico	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/356731_sq-300_jpg?allowDefaultPicture=true
594	2018-07-16 18:55:38.085085+08	2018-07-16 18:55:38.085085+08	\N	11	Raul RUIDIAZ	Peru	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/349703_sq-300_jpg?allowDefaultPicture=true
595	2018-07-16 18:55:38.087095+08	2018-07-16 18:55:38.087095+08	\N	8	Remo FREULER	Switzerland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/402021_sq-300_jpg?allowDefaultPicture=true
596	2018-07-16 18:55:38.089617+08	2018-07-16 18:55:38.089617+08	\N	8	RENATO AUGUSTO	Brazil	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/218292_sq-300_jpg?allowDefaultPicture=true
597	2018-07-16 18:55:38.091806+08	2018-07-16 18:55:38.091806+08	\N	13	Renato TAPIA	Peru	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/392903_sq-300_jpg?allowDefaultPicture=true
598	2018-07-16 18:55:38.093714+08	2018-07-16 18:55:38.093714+08	\N	16	Reza GHOOCHANNEJHAD	IR Iran	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/362641_sq-300_jpg?allowDefaultPicture=true
599	2018-07-16 18:55:38.095753+08	2018-07-16 18:55:38.095753+08	\N	15	RICARDO	Portugal	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/368706_sq-300_jpg?allowDefaultPicture=true
600	2018-07-16 18:55:38.097704+08	2018-07-16 18:55:38.097704+08	\N	19	Ricardo AVILA	Panama	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/411177_sq-300_jpg?allowDefaultPicture=true
601	2018-07-16 18:55:38.100061+08	2018-07-16 18:55:38.100061+08	\N	20	RICARDO QUARESMA	Portugal	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/189810_sq-300_jpg?allowDefaultPicture=true
602	2018-07-16 18:55:38.102687+08	2018-07-16 18:55:38.102687+08	\N	13	Ricardo RODRIGUEZ	Switzerland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/313559_sq-300_jpg?allowDefaultPicture=true
603	2018-07-16 18:55:38.105296+08	2018-07-16 18:55:38.105296+08	\N	10	Robbie KRUSE	Australia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/229043_sq-300_jpg?allowDefaultPicture=true
604	2018-07-16 18:55:38.107274+08	2018-07-16 18:55:38.107274+08	\N	9	Robert LEWANDOWSKI	Poland	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/299688_sq-300_jpg?allowDefaultPicture=true
605	2018-07-16 18:55:38.109508+08	2018-07-16 18:55:38.109508+08	\N	20	ROBERTO FIRMINO	Brazil	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/344547_sq-300_jpg?allowDefaultPicture=true
606	2018-07-16 18:55:38.111518+08	2018-07-16 18:55:38.111518+08	\N	1	Robin OLSEN	Sweden	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/398547_sq-300_jpg?allowDefaultPicture=true
607	2018-07-16 18:55:38.113795+08	2018-07-16 18:55:38.113795+08	\N	13	Rodney WALLACE	Costa Rica	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/356986_sq-300_jpg?allowDefaultPicture=true
608	2018-07-16 18:55:38.116212+08	2018-07-16 18:55:38.116212+08	\N	9	RODRIGO	Spain	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/337175_sq-300_jpg?allowDefaultPicture=true
609	2018-07-16 18:55:38.118624+08	2018-07-16 18:55:38.118624+08	\N	6	Rodrigo BENTANCUR	Uruguay	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/386538_sq-300_jpg?allowDefaultPicture=true
610	2018-07-16 18:55:38.12087+08	2018-07-16 18:55:38.12087+08	\N	21	Roman BUERKI	Switzerland	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/356676_sq-300_jpg?allowDefaultPicture=true
611	2018-07-16 18:55:38.128968+08	2018-07-16 18:55:38.128968+08	\N	5	Roman TORRES	Panama	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/198481_sq-300_jpg?allowDefaultPicture=true
612	2018-07-16 18:55:38.131896+08	2018-07-16 18:55:38.131896+08	\N	11	Roman ZOBNIN	Russia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/404429_sq-300_jpg?allowDefaultPicture=true
613	2018-07-16 18:55:38.134261+08	2018-07-16 18:55:38.134261+08	\N	9	Romelu LUKAKU	Belgium	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/358112_sq-300_jpg?allowDefaultPicture=true
614	2018-07-16 18:55:38.136651+08	2018-07-16 18:55:38.136651+08	\N	4	Roozbeh CHESHMI	IR Iran	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/406595_sq-300_jpg?allowDefaultPicture=true
615	2018-07-16 18:55:38.138917+08	2018-07-16 18:55:38.138917+08	\N	13	RUBEN DIAS	Portugal	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/384752_sq-300_jpg?allowDefaultPicture=true
616	2018-07-16 18:55:38.142357+08	2018-07-16 18:55:38.142357+08	\N	21	Ruben LOFTUS-CHEEK	England	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/411303_sq-300_jpg?allowDefaultPicture=true
617	2018-07-16 18:55:38.145958+08	2018-07-16 18:55:38.145958+08	\N	1	RUI PATRICIO	Portugal	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/269768_sq-300_jpg?allowDefaultPicture=true
618	2018-07-16 18:55:38.148212+08	2018-07-16 18:55:38.148212+08	\N	13	Runar RUNARSSON	Iceland	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/406732_sq-300_jpg?allowDefaultPicture=true
619	2018-07-16 18:55:38.150699+08	2018-07-16 18:55:38.150699+08	\N	19	Rurik GISLASON	Iceland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/300380_sq-300_jpg?allowDefaultPicture=true
620	2018-07-16 18:55:38.152971+08	2018-07-16 18:55:38.152971+08	\N	18	Ryota OHSHIMA	Japan	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/395327_sq-300_jpg?allowDefaultPicture=true
621	2018-07-16 18:55:38.157687+08	2018-07-16 18:55:38.157687+08	\N	19	Saber KHALIFA	Tunisia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/329718_sq-300_jpg?allowDefaultPicture=true
622	2018-07-16 18:55:38.160639+08	2018-07-16 18:55:38.160639+08	\N	10	Sadio MANE	Senegal	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/353790_sq-300_jpg?allowDefaultPicture=true
623	2018-07-16 18:55:38.162832+08	2018-07-16 18:55:38.162832+08	\N	6	Saeid EZATOLAHI	IR Iran	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/371736_sq-300_jpg?allowDefaultPicture=true
624	2018-07-16 18:55:38.164975+08	2018-07-16 18:55:38.164975+08	\N	7	Saifeddine KHAOUI	Tunisia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/411656_sq-300_jpg?allowDefaultPicture=true
625	2018-07-16 18:55:38.166951+08	2018-07-16 18:55:38.166951+08	\N	18	SALEM ALDAWSARI	Saudi Arabia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/339745_sq-300_jpg?allowDefaultPicture=true
626	2018-07-16 18:55:38.171258+08	2018-07-16 18:55:38.171258+08	\N	6	Salif SANE	Senegal	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/370169_sq-300_jpg?allowDefaultPicture=true
627	2018-07-16 18:55:38.174228+08	2018-07-16 18:55:38.174228+08	\N	7	SALMAN ALFARAJ	Saudi Arabia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/352891_sq-300_jpg?allowDefaultPicture=true
628	2018-07-16 18:55:38.17622+08	2018-07-16 18:55:38.17622+08	\N	5	SAM MORSY	Egypt	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/407023_sq-300_jpg?allowDefaultPicture=true
629	2018-07-16 18:55:38.178263+08	2018-07-16 18:55:38.178263+08	\N	14	Saman GHODDOS	IR Iran	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/411644_sq-300_jpg?allowDefaultPicture=true
630	2018-07-16 18:55:38.182777+08	2018-07-16 18:55:38.182777+08	\N	6	Sami KHEDIRA	Germany	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/196900_sq-300_jpg?allowDefaultPicture=true
631	2018-07-16 18:55:38.18489+08	2018-07-16 18:55:38.18489+08	\N	20	SAMIR SAAD	Egypt	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/312951_sq-300_jpg?allowDefaultPicture=true
632	2018-07-16 18:55:38.187118+08	2018-07-16 18:55:38.187118+08	\N	3	Samuel FRIDJONSSON	Iceland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/411383_sq-300_jpg?allowDefaultPicture=true
633	2018-07-16 18:55:38.191019+08	2018-07-16 18:55:38.191019+08	\N	5	Samuel UMTITI	France	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/368846_sq-300_jpg?allowDefaultPicture=true
634	2018-07-16 18:55:38.193851+08	2018-07-16 18:55:38.193851+08	\N	4	Santiago ARIAS	Colombia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/315614_sq-300_jpg?allowDefaultPicture=true
635	2018-07-16 18:55:38.19875+08	2018-07-16 18:55:38.19875+08	\N	20	Sardar AZMOUN	IR Iran	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/379887_sq-300_jpg?allowDefaultPicture=true
636	2018-07-16 18:55:38.201029+08	2018-07-16 18:55:38.201029+08	\N	7	SAUL	Spain	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/369190_sq-300_jpg?allowDefaultPicture=true
637	2018-07-16 18:55:38.208155+08	2018-07-16 18:55:38.208155+08	\N	19	Sebastian COATES	Uruguay	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/305382_sq-300_jpg?allowDefaultPicture=true
638	2018-07-16 18:55:38.211043+08	2018-07-16 18:55:38.211043+08	\N	7	Sebastian LARSSON	Sweden	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/214675_sq-300_jpg?allowDefaultPicture=true
639	2018-07-16 18:55:38.213047+08	2018-07-16 18:55:38.213047+08	\N	19	Sebastian RUDY	Germany	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/275630_sq-300_jpg?allowDefaultPicture=true
640	2018-07-16 18:55:38.216091+08	2018-07-16 18:55:38.216091+08	\N	20	Sergej MILINKOVIC-SAVIC	Serbia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/385545_sq-300_jpg?allowDefaultPicture=true
641	2018-07-16 18:55:38.219702+08	2018-07-16 18:55:38.219702+08	\N	4	Sergey IGNASHEVICH	Russia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/186787_sq-300_jpg?allowDefaultPicture=true
642	2018-07-16 18:55:38.22704+08	2018-07-16 18:55:38.22704+08	\N	19	Sergio AGUERO	Argentina	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/228528_sq-300_jpg?allowDefaultPicture=true
643	2018-07-16 18:55:38.229236+08	2018-07-16 18:55:38.229236+08	\N	5	Sergio BUSQUETS	Spain	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/303034_sq-300_jpg?allowDefaultPicture=true
644	2018-07-16 18:55:38.231577+08	2018-07-16 18:55:38.231577+08	\N	15	Sergio RAMOS	Spain	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/216814_sq-300_jpg?allowDefaultPicture=true
645	2018-07-16 18:55:38.23455+08	2018-07-16 18:55:38.23455+08	\N	16	SHERIF EKRAMY	Egypt	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/184382_sq-300_jpg?allowDefaultPicture=true
646	2018-07-16 18:55:38.236833+08	2018-07-16 18:55:38.236833+08	\N	18	SHIKABALA	Egypt	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/230098_sq-300_jpg?allowDefaultPicture=true
647	2018-07-16 18:55:38.24012+08	2018-07-16 18:55:38.24012+08	\N	10	Shinji KAGAWA	Japan	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/268596_sq-300_jpg?allowDefaultPicture=true
648	2018-07-16 18:55:38.242297+08	2018-07-16 18:55:38.242297+08	\N	9	Shinji OKAZAKI	Japan	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/286278_sq-300_jpg?allowDefaultPicture=true
649	2018-07-16 18:55:38.24442+08	2018-07-16 18:55:38.24442+08	\N	2	Sime VRSALJKO	Croatia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/336485_sq-300_jpg?allowDefaultPicture=true
650	2018-07-16 18:55:38.247888+08	2018-07-16 18:55:38.247888+08	\N	13	Simeon NWANKWO	Nigeria	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/411702_sq-300_jpg?allowDefaultPicture=true
651	2018-07-16 18:55:38.250177+08	2018-07-16 18:55:38.250177+08	\N	4	Simon KJAER	Denmark	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/309962_sq-300_jpg?allowDefaultPicture=true
652	2018-07-16 18:55:38.252161+08	2018-07-16 18:55:38.252161+08	\N	12	Simon MIGNOLET	Belgium	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/298738_sq-300_jpg?allowDefaultPicture=true
653	2018-07-16 18:55:38.25422+08	2018-07-16 18:55:38.25422+08	\N	17	Slawomir PESZKO	Poland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/216954_sq-300_jpg?allowDefaultPicture=true
654	2018-07-16 18:55:38.256695+08	2018-07-16 18:55:38.256695+08	\N	21	Sofyan AMRABAT	Morocco	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/372266_sq-300_jpg?allowDefaultPicture=true
655	2018-07-16 18:55:38.259513+08	2018-07-16 18:55:38.259513+08	\N	7	SON Heungmin	Korea Republic	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/307849_sq-300_jpg?allowDefaultPicture=true
656	2018-07-16 18:55:38.265051+08	2018-07-16 18:55:38.265051+08	\N	2	Stephan LICHTSTEINER	Switzerland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/196605_sq-300_jpg?allowDefaultPicture=true
657	2018-07-16 18:55:38.267229+08	2018-07-16 18:55:38.267229+08	\N	16	Steve MANDANDA	France	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/254133_sq-300_jpg?allowDefaultPicture=true
658	2018-07-16 18:55:38.269197+08	2018-07-16 18:55:38.269197+08	\N	15	Steven NZONZI	France	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/319327_sq-300_jpg?allowDefaultPicture=true
659	2018-07-16 18:55:38.271467+08	2018-07-16 18:55:38.271467+08	\N	14	Steven ZUBER	Switzerland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/356415_sq-300_jpg?allowDefaultPicture=true
660	2018-07-16 18:55:38.275559+08	2018-07-16 18:55:38.275559+08	\N	5	Sverrir INGASON	Iceland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/401143_sq-300_jpg?allowDefaultPicture=true
661	2018-07-16 18:55:38.277711+08	2018-07-16 18:55:38.277711+08	\N	2	Syam BEN YOUSSEF	Tunisia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/329717_sq-300_jpg?allowDefaultPicture=true
662	2018-07-16 18:55:38.279758+08	2018-07-16 18:55:38.279758+08	\N	17	TAISEER ALJASSAM	Saudi Arabia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/218083_sq-300_jpg?allowDefaultPicture=true
663	2018-07-16 18:55:38.284512+08	2018-07-16 18:55:38.284512+08	\N	21	TAISON	Brazil	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/329039_sq-300_jpg?allowDefaultPicture=true
664	2018-07-16 18:55:38.291823+08	2018-07-16 18:55:38.291823+08	\N	14	Takashi INUI	Japan	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/271255_sq-300_jpg?allowDefaultPicture=true
665	2018-07-16 18:55:38.294597+08	2018-07-16 18:55:38.294597+08	\N	11	Takashi USAMI	Japan	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/307739_sq-300_jpg?allowDefaultPicture=true
666	2018-07-16 18:55:38.296742+08	2018-07-16 18:55:38.296742+08	\N	8	TAREK HAMED	Egypt	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/395858_sq-300_jpg?allowDefaultPicture=true
667	2018-07-16 18:55:38.299109+08	2018-07-16 18:55:38.299109+08	\N	10	THIAGO	Spain	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/375512_sq-300_jpg?allowDefaultPicture=true
668	2018-07-16 18:55:38.301334+08	2018-07-16 18:55:38.301334+08	\N	4	Thiago CIONEK	Poland	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/398594_sq-300_jpg?allowDefaultPicture=true
669	2018-07-16 18:55:38.305331+08	2018-07-16 18:55:38.305331+08	\N	2	THIAGO SILVA	Brazil	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/289964_sq-300_jpg?allowDefaultPicture=true
670	2018-07-16 18:55:38.308447+08	2018-07-16 18:55:38.308447+08	\N	1	Thibaut COURTOIS	Belgium	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/358106_sq-300_jpg?allowDefaultPicture=true
671	2018-07-16 18:55:38.311048+08	2018-07-16 18:55:38.311048+08	\N	8	Thomas DELANEY	Denmark	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/372855_sq-300_jpg?allowDefaultPicture=true
672	2018-07-16 18:55:38.313762+08	2018-07-16 18:55:38.313762+08	\N	8	Thomas LEMAR	France	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/402049_sq-300_jpg?allowDefaultPicture=true
673	2018-07-16 18:55:38.317431+08	2018-07-16 18:55:38.317431+08	\N	15	Thomas MEUNIER	Belgium	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/358122_sq-300_jpg?allowDefaultPicture=true
674	2018-07-16 18:55:38.319669+08	2018-07-16 18:55:38.319669+08	\N	13	Thomas MUELLER	Germany	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/321722_sq-300_jpg?allowDefaultPicture=true
675	2018-07-16 18:55:38.3226+08	2018-07-16 18:55:38.3226+08	\N	3	Thomas VERMAELEN	Belgium	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/216880_sq-300_jpg?allowDefaultPicture=true
676	2018-07-16 18:55:38.324818+08	2018-07-16 18:55:38.324818+08	\N	16	Thorgan HAZARD	Belgium	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/378834_sq-300_jpg?allowDefaultPicture=true
677	2018-07-16 18:55:38.329279+08	2018-07-16 18:55:38.329279+08	\N	4	Tim CAHILL	Australia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/213001_sq-300_jpg?allowDefaultPicture=true
678	2018-07-16 18:55:38.33261+08	2018-07-16 18:55:38.33261+08	\N	9	Timo WERNER	Germany	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/404357_sq-300_jpg?allowDefaultPicture=true
679	2018-07-16 18:55:38.335196+08	2018-07-16 18:55:38.335196+08	\N	13	Tin JEDVAJ	Croatia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/372987_sq-300_jpg?allowDefaultPicture=true
680	2018-07-16 18:55:38.337023+08	2018-07-16 18:55:38.337023+08	\N	2	Toby ALDERWEIRELD	Belgium	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/290864_sq-300_jpg?allowDefaultPicture=true
681	2018-07-16 18:55:38.339241+08	2018-07-16 18:55:38.339241+08	\N	23	Tom ROGIC	Australia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/367641_sq-300_jpg?allowDefaultPicture=true
682	2018-07-16 18:55:38.341606+08	2018-07-16 18:55:38.341606+08	\N	9	Tomi JURIC	Australia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/379785_sq-300_jpg?allowDefaultPicture=true
683	2018-07-16 18:55:38.345965+08	2018-07-16 18:55:38.345965+08	\N	20	Tomoaki MAKINO	Japan	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/268477_sq-300_jpg?allowDefaultPicture=true
684	2018-07-16 18:55:38.348212+08	2018-07-16 18:55:38.348212+08	\N	8	Toni KROOS	Germany	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/275162_sq-300_jpg?allowDefaultPicture=true
685	2018-07-16 18:55:38.350994+08	2018-07-16 18:55:38.350994+08	\N	22	Trent ALEXANDER-ARNOLD	England	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/390761_sq-300_jpg?allowDefaultPicture=true
686	2018-07-16 18:55:38.353126+08	2018-07-16 18:55:38.353126+08	\N	20	Trent SAINSBURY	Australia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/339118_sq-300_jpg?allowDefaultPicture=true
687	2018-07-16 18:55:38.35537+08	2018-07-16 18:55:38.35537+08	\N	21	TREZIGUET	Egypt	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/363863_sq-300_jpg?allowDefaultPicture=true
688	2018-07-16 18:55:38.357504+08	2018-07-16 18:55:38.357504+08	\N	21	Tyronne EBUEHI	Nigeria	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/407161_sq-300_jpg?allowDefaultPicture=true
689	2018-07-16 18:55:38.366748+08	2018-07-16 18:55:38.366748+08	\N	5	Uros SPAJIC	Serbia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/404632_sq-300_jpg?allowDefaultPicture=true
690	2018-07-16 18:55:38.369203+08	2018-07-16 18:55:38.369203+08	\N	11	Vahid AMIRI	IR Iran	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/384795_sq-300_jpg?allowDefaultPicture=true
691	2018-07-16 18:55:38.371333+08	2018-07-16 18:55:38.371333+08	\N	14	Valentin PIMENTEL	Panama	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/392859_sq-300_jpg?allowDefaultPicture=true
692	2018-07-16 18:55:38.373587+08	2018-07-16 18:55:38.373587+08	\N	11	Valon BEHRAMI	Switzerland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/216627_sq-300_jpg?allowDefaultPicture=true
693	2018-07-16 18:55:38.375826+08	2018-07-16 18:55:38.375826+08	\N	5	Vedran CORLUKA	Croatia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/297373_sq-300_jpg?allowDefaultPicture=true
694	2018-07-16 18:55:38.379699+08	2018-07-16 18:55:38.379699+08	\N	3	Victor LINDELOF	Sweden	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/395283_sq-300_jpg?allowDefaultPicture=true
695	2018-07-16 18:55:38.383922+08	2018-07-16 18:55:38.383922+08	\N	11	Victor MOSES	Nigeria	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/274090_sq-300_jpg?allowDefaultPicture=true
696	2018-07-16 18:55:38.387196+08	2018-07-16 18:55:38.387196+08	\N	17	Viktor CLAESSON	Sweden	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/401465_sq-300_jpg?allowDefaultPicture=true
697	2018-07-16 18:55:38.390328+08	2018-07-16 18:55:38.390328+08	\N	15	Viktor FISCHER	Denmark	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/336131_sq-300_jpg?allowDefaultPicture=true
698	2018-07-16 18:55:38.394706+08	2018-07-16 18:55:38.394706+08	\N	4	Vincent KOMPANY	Belgium	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/216004_sq-300_jpg?allowDefaultPicture=true
699	2018-07-16 18:55:38.396822+08	2018-07-16 18:55:38.396822+08	\N	20	Vladimir GABULOV	Russia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/186785_sq-300_jpg?allowDefaultPicture=true
700	2018-07-16 18:55:38.399311+08	2018-07-16 18:55:38.399311+08	\N	14	Vladimir GRANAT	Russia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/358046_sq-300_jpg?allowDefaultPicture=true
701	2018-07-16 18:55:38.401297+08	2018-07-16 18:55:38.401297+08	\N	1	Vladimir STOJKOVIC	Serbia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/214386_sq-300_jpg?allowDefaultPicture=true
702	2018-07-16 18:55:38.403287+08	2018-07-16 18:55:38.403287+08	\N	10	Wahbi KHAZRI	Tunisia	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/364669_sq-300_jpg?allowDefaultPicture=true
703	2018-07-16 18:55:38.405562+08	2018-07-16 18:55:38.405562+08	\N	6	Wataru ENDO	Japan	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/395318_sq-300_jpg?allowDefaultPicture=true
704	2018-07-16 18:55:38.409684+08	2018-07-16 18:55:38.409684+08	\N	16	Wilder CARTAGENA	Peru	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/401945_sq-300_jpg?allowDefaultPicture=true
705	2018-07-16 18:55:38.41328+08	2018-07-16 18:55:38.41328+08	\N	4	Wilfred NDIDI	Nigeria	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/369512_sq-300_jpg?allowDefaultPicture=true
706	2018-07-16 18:55:38.416038+08	2018-07-16 18:55:38.416038+08	\N	23	Wilfredo CABALLERO	Argentina	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/181440_sq-300_jpg?allowDefaultPicture=true
707	2018-07-16 18:55:38.418647+08	2018-07-16 18:55:38.418647+08	\N	14	WILLIAM	Portugal	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/376349_sq-300_jpg?allowDefaultPicture=true
708	2018-07-16 18:55:38.420912+08	2018-07-16 18:55:38.420912+08	\N	5	William EKONG	Nigeria	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/395529_sq-300_jpg?allowDefaultPicture=true
709	2018-07-16 18:55:38.42331+08	2018-07-16 18:55:38.42331+08	\N	7	William KVIST	Denmark	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/299421_sq-300_jpg?allowDefaultPicture=true
710	2018-07-16 18:55:38.425252+08	2018-07-16 18:55:38.425252+08	\N	19	WILLIAN	Brazil	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/218306_sq-300_jpg?allowDefaultPicture=true
711	2018-07-16 18:55:38.429944+08	2018-07-16 18:55:38.429944+08	\N	5	Wilmar BARRIOS	Colombia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/394377_sq-300_jpg?allowDefaultPicture=true
712	2018-07-16 18:55:38.432697+08	2018-07-16 18:55:38.432697+08	\N	1	Wojciech SZCZESNY	Poland	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/269746_sq-300_jpg?allowDefaultPicture=true
713	2018-07-16 18:55:38.434879+08	2018-07-16 18:55:38.434879+08	\N	23	Xherdan SHAQIRI	Switzerland	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/321653_sq-300_jpg?allowDefaultPicture=true
714	2018-07-16 18:55:38.436828+08	2018-07-16 18:55:38.436828+08	\N	8	YAHIA ALSHEHRI	Saudi Arabia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/347165_sq-300_jpg?allowDefaultPicture=true
715	2018-07-16 18:55:38.444254+08	2018-07-16 18:55:38.444254+08	\N	1	Yann SOMMER	Switzerland	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/319460_sq-300_jpg?allowDefaultPicture=true
716	2018-07-16 18:55:38.446557+08	2018-07-16 18:55:38.446557+08	\N	11	Yannick CARRASCO	Belgium	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/398653_sq-300_jpg?allowDefaultPicture=true
717	2018-07-16 18:55:38.449543+08	2018-07-16 18:55:38.449543+08	\N	21	YASSER ALMOSAILEM	Saudi Arabia	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/198514_sq-300_jpg?allowDefaultPicture=true
718	2018-07-16 18:55:38.451627+08	2018-07-16 18:55:38.451627+08	\N	13	YASSER ALSHAHRANI	Saudi Arabia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/339482_sq-300_jpg?allowDefaultPicture=true
719	2018-07-16 18:55:38.453851+08	2018-07-16 18:55:38.453851+08	\N	1	Yassine BOUNOU	Morocco	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/356956_sq-300_jpg?allowDefaultPicture=true
720	2018-07-16 18:55:38.456223+08	2018-07-16 18:55:38.456223+08	\N	4	Yassine MERIAH	Tunisia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/395998_sq-300_jpg?allowDefaultPicture=true
721	2018-07-16 18:55:38.458509+08	2018-07-16 18:55:38.458509+08	\N	17	Yeltsin TEJEDA	Costa Rica	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/307541_sq-300_jpg?allowDefaultPicture=true
722	2018-07-16 18:55:38.460643+08	2018-07-16 18:55:38.460643+08	\N	13	Yerry MINA	Colombia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/395552_sq-300_jpg?allowDefaultPicture=true
723	2018-07-16 18:55:38.463011+08	2018-07-16 18:55:38.463011+08	\N	3	Yohan BEN ALOUANE	Tunisia	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/326645_sq-300_jpg?allowDefaultPicture=true
724	2018-07-16 18:55:38.465344+08	2018-07-16 18:55:38.465344+08	\N	19	Yoshimar YOTUN	Peru	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/349698_sq-300_jpg?allowDefaultPicture=true
725	2018-07-16 18:55:38.467247+08	2018-07-16 18:55:38.467247+08	\N	13	Yoshinori MUTO	Japan	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/384846_sq-300_jpg?allowDefaultPicture=true
726	2018-07-16 18:55:38.470768+08	2018-07-16 18:55:38.470768+08	\N	10	Younes BELHANDA	Morocco	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/353205_sq-300_jpg?allowDefaultPicture=true
727	2018-07-16 18:55:38.473843+08	2018-07-16 18:55:38.473843+08	\N	17	Youri TIELEMANS	Belgium	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/401444_sq-300_jpg?allowDefaultPicture=true
728	2018-07-16 18:55:38.476568+08	2018-07-16 18:55:38.476568+08	\N	15	Youssef AIT BENNASSER	Morocco	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/372130_sq-300_jpg?allowDefaultPicture=true
729	2018-07-16 18:55:38.479196+08	2018-07-16 18:55:38.479196+08	\N	19	Youssef EN NESYRI	Morocco	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/401885_sq-300_jpg?allowDefaultPicture=true
730	2018-07-16 18:55:38.482105+08	2018-07-16 18:55:38.482105+08	\N	12	Youssouf SABALY	Senegal	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/368848_sq-300_jpg?allowDefaultPicture=true
731	2018-07-16 18:55:38.485872+08	2018-07-16 18:55:38.485872+08	\N	5	YUN Youngsun	Korea Republic	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/329895_sq-300_jpg?allowDefaultPicture=true
732	2018-07-16 18:55:38.488356+08	2018-07-16 18:55:38.488356+08	\N	18	Yury ZHIRKOV	Russia	Midfielder	https://api.fifa.com/api/v1/picture/players/2018fwc/216432_sq-300_jpg?allowDefaultPicture=true
733	2018-07-16 18:55:38.490625+08	2018-07-16 18:55:38.490625+08	\N	20	Yussuf Yurary POULSEN	Denmark	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/336133_sq-300_jpg?allowDefaultPicture=true
734	2018-07-16 18:55:38.492745+08	2018-07-16 18:55:38.492745+08	\N	5	Yuto NAGATOMO	Japan	Defender	https://api.fifa.com/api/v1/picture/players/2018fwc/291372_sq-300_jpg?allowDefaultPicture=true
735	2018-07-16 18:55:38.495215+08	2018-07-16 18:55:38.495215+08	\N	15	Yuya OSAKO	Japan	Forward	https://api.fifa.com/api/v1/picture/players/2018fwc/275136_sq-300_jpg?allowDefaultPicture=true
736	2018-07-16 18:55:38.499815+08	2018-07-16 18:55:38.499815+08	\N	12	Yvon MVOGO	Switzerland	Goalkeeper	https://api.fifa.com/api/v1/picture/players/2018fwc/402022_sq-300_jpg?allowDefaultPicture=true
\.


--
-- Data for Name: players_statistic_with_disciplinaries; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.players_statistic_with_disciplinaries (id, created_at, updated_at, deleted_at, rank, player_name, matches_payed, yellow_cards, second_yellow_cards, red_cards, fouls_committed, fouls_suffered, fouls_causing_penalty) FROM stdin;
1	2018-07-16 18:55:49.21025+08	2018-07-16 18:55:49.21025+08	\N	1	Carlos SANCHEZ	3	1	0	1	6	1	2
2	2018-07-16 18:55:49.213252+08	2018-07-16 18:55:49.213252+08	\N	2	Michael LANG	3	0	0	1	3	0	0
3	2018-07-16 18:55:49.215812+08	2018-07-16 18:55:49.215812+08	\N	3	Jerome BOATENG	2	0	1	0	5	3	0
4	2018-07-16 18:55:49.219027+08	2018-07-16 18:55:49.219027+08	\N	4	Igor SMOLNIKOV	1	0	1	0	1	2	0
5	2018-07-16 18:55:49.221344+08	2018-07-16 18:55:49.221344+08	\N	5	Sebastian LARSSON	4	3	0	0	9	2	0
6	2018-07-16 18:55:49.223978+08	2018-07-16 18:55:49.223978+08	\N	6	Ante REBIC	6	2	0	0	21	11	0
7	2018-07-16 18:55:49.226768+08	2018-07-16 18:55:49.226768+08	\N	7	Javier MASCHERANO	4	2	0	0	15	6	1
8	2018-07-16 18:55:49.22997+08	2018-07-16 18:55:49.22997+08	\N	8	Hector HERRERA	4	2	0	0	15	6	0
9	2018-07-16 18:55:49.232436+08	2018-07-16 18:55:49.232436+08	\N	9	Mario MANDZUKIC	6	2	0	0	13	11	0
10	2018-07-16 18:55:49.235079+08	2018-07-16 18:55:49.235079+08	\N	10	Blaise MATUIDI	5	2	0	0	12	5	0
11	2018-07-16 18:55:49.23775+08	2018-07-16 18:55:49.23775+08	\N	11	Ngolo KANTE	7	2	0	0	11	4	0
12	2018-07-16 18:55:49.240343+08	2018-07-16 18:55:49.240343+08	\N	12	Sime VRSALJKO	6	2	0	0	10	7	0
13	2018-07-16 18:55:49.242968+08	2018-07-16 18:55:49.242968+08	\N	13	Yussuf Yurary POULSEN	3	2	0	0	9	2	2
14	2018-07-16 18:55:49.245688+08	2018-07-16 18:55:49.245688+08	\N	14	Thomas MEUNIER	5	2	0	0	9	1	0
15	2018-07-16 18:55:49.24819+08	2018-07-16 18:55:49.24819+08	\N	15	Valon BEHRAMI	4	2	0	0	8	5	0
16	2018-07-16 18:55:49.251619+08	2018-07-16 18:55:49.251619+08	\N	16	Rodrigo BENTANCUR	5	2	0	0	8	7	0
17	2018-07-16 18:55:49.254118+08	2018-07-16 18:55:49.254118+08	\N	17	Wilmar BARRIOS	3	2	0	0	8	3	0
18	2018-07-16 18:55:49.256537+08	2018-07-16 18:55:49.256537+08	\N	18	Lucas HERNANDEZ	7	2	0	0	8	15	0
19	2018-07-16 18:55:49.258871+08	2018-07-16 18:55:49.258871+08	\N	19	Karim EL AHMADI	3	2	0	0	7	1	0
20	2018-07-16 18:55:49.261202+08	2018-07-16 18:55:49.261202+08	\N	20	Ferjani SASSI	3	2	0	0	7	1	0
21	2018-07-16 18:55:49.263507+08	2018-07-16 18:55:49.263507+08	\N	21	Harry MAGUIRE	7	2	0	0	7	6	0
22	2018-07-16 18:55:49.266091+08	2018-07-16 18:55:49.266091+08	\N	22	Nemanja MATIC	3	2	0	0	6	4	0
23	2018-07-16 18:55:49.268422+08	2018-07-16 18:55:49.268422+08	\N	23	Hector MORENO	3	2	0	0	5	0	1
24	2018-07-16 18:55:49.271003+08	2018-07-16 18:55:49.271003+08	\N	24	Jan VERTONGHEN	6	2	0	0	5	3	0
25	2018-07-16 18:55:49.274554+08	2018-07-16 18:55:49.274554+08	\N	25	Mbaye NIANG	3	2	0	0	5	4	0
26	2018-07-16 18:55:49.279044+08	2018-07-16 18:55:49.279044+08	\N	26	Aleksandar MITROVIC	3	2	0	0	5	8	0
27	2018-07-16 18:55:49.281429+08	2018-07-16 18:55:49.281429+08	\N	27	Iury GAZINSKY	4	2	0	0	5	3	0
28	2018-07-16 18:55:49.285571+08	2018-07-16 18:55:49.285571+08	\N	28	Michael MURILLO	2	2	0	0	5	2	0
29	2018-07-16 18:55:49.288742+08	2018-07-16 18:55:49.288742+08	\N	29	Armando COOPER	2	2	0	0	4	5	0
30	2018-07-16 18:55:49.291017+08	2018-07-16 18:55:49.291017+08	\N	30	Toby ALDERWEIRELD	6	2	0	0	4	1	0
31	2018-07-16 18:55:49.293451+08	2018-07-16 18:55:49.293451+08	\N	31	Mikael LUSTIG	4	2	0	0	4	3	0
32	2018-07-16 18:55:49.295942+08	2018-07-16 18:55:49.295942+08	\N	32	CASEMIRO	4	2	0	0	4	2	0
33	2018-07-16 18:55:49.298371+08	2018-07-16 18:55:49.298371+08	\N	33	Mathias  JORGENSEN	3	2	0	0	4	2	1
34	2018-07-16 18:55:49.301017+08	2018-07-16 18:55:49.301017+08	\N	34	Fabian SCHAER	3	2	0	0	4	6	0
35	2018-07-16 18:55:49.303396+08	2018-07-16 18:55:49.303396+08	\N	35	JUNG Wooyoung	3	2	0	0	4	2	0
36	2018-07-16 18:55:49.305826+08	2018-07-16 18:55:49.305826+08	\N	36	CRISTIANO RONALDO	4	2	0	0	3	14	0
37	2018-07-16 18:55:49.308324+08	2018-07-16 18:55:49.308324+08	\N	37	Ever BANEGA	3	2	0	0	3	3	0
38	2018-07-16 18:55:49.310916+08	2018-07-16 18:55:49.310916+08	\N	38	Nicolas OTAMENDI	4	2	0	0	3	6	0
39	2018-07-16 18:55:49.31329+08	2018-07-16 18:55:49.31329+08	\N	39	Stephan LICHTSTEINER	3	2	0	0	2	4	0
40	2018-07-16 18:55:49.315789+08	2018-07-16 18:55:49.315789+08	\N	40	Kyle WALKER	5	2	0	0	2	5	1
41	2018-07-16 18:55:49.319032+08	2018-07-16 18:55:49.319032+08	\N	41	Kylian MBAPPE	7	2	0	0	1	14	0
42	2018-07-16 18:55:49.321708+08	2018-07-16 18:55:49.321708+08	\N	42	Aleksandr GOLOVIN	4	1	0	0	16	4	0
43	2018-07-16 18:55:49.323856+08	2018-07-16 18:55:49.323856+08	\N	43	Olivier GIROUD	7	1	0	0	14	4	0
44	2018-07-16 18:55:49.325766+08	2018-07-16 18:55:49.325766+08	\N	44	Paul POGBA	6	1	0	0	14	17	0
45	2018-07-16 18:55:49.327727+08	2018-07-16 18:55:49.327727+08	\N	45	Ivan STRINIC	6	1	0	0	11	8	0
46	2018-07-16 18:55:49.330011+08	2018-07-16 18:55:49.330011+08	\N	46	Thomas DELANEY	4	1	0	0	11	3	0
47	2018-07-16 18:55:49.332287+08	2018-07-16 18:55:49.332287+08	\N	47	Gabriel MERCADO	3	1	0	0	10	5	0
48	2018-07-16 18:55:49.334512+08	2018-07-16 18:55:49.334512+08	\N	48	Noureddine AMRABAT	3	1	0	0	10	8	0
49	2018-07-16 18:55:49.336571+08	2018-07-16 18:55:49.336571+08	\N	49	Axel WITSEL	6	1	0	0	9	9	0
50	2018-07-16 18:55:49.338788+08	2018-07-16 18:55:49.338788+08	\N	50	Ivan RAKITIC	7	1	0	0	9	20	0
51	2018-07-16 18:55:49.341038+08	2018-07-16 18:55:49.341038+08	\N	51	Santiago ARIAS	4	1	0	0	9	5	0
52	2018-07-16 18:55:49.34334+08	2018-07-16 18:55:49.34334+08	\N	52	Sergej MILINKOVIC-SAVIC	3	1	0	0	9	2	0
53	2018-07-16 18:55:49.348151+08	2018-07-16 18:55:49.348151+08	\N	53	Jesse  LINGARD	6	1	0	0	9	5	0
54	2018-07-16 18:55:49.350938+08	2018-07-16 18:55:49.350938+08	\N	54	Benjamin PAVARD	6	1	0	0	9	5	0
55	2018-07-16 18:55:49.353461+08	2018-07-16 18:55:49.353461+08	\N	55	Roman ZOBNIN	5	1	0	0	8	9	1
56	2018-07-16 18:55:49.356094+08	2018-07-16 18:55:49.356094+08	\N	56	Radamel FALCAO	4	1	0	0	7	9	0
57	2018-07-16 18:55:49.358939+08	2018-07-16 18:55:49.358939+08	\N	57	FAGNER	4	1	0	0	7	3	0
58	2018-07-16 18:55:49.361965+08	2018-07-16 18:55:49.361965+08	\N	58	David GUZMAN	3	1	0	0	7	1	0
59	2018-07-16 18:55:49.364499+08	2018-07-16 18:55:49.364499+08	\N	59	AHMED FATHI	3	1	0	0	7	1	1
60	2018-07-16 18:55:49.366819+08	2018-07-16 18:55:49.366819+08	\N	60	Gaku SHIBASAKI	4	1	0	0	7	2	0
61	2018-07-16 18:55:49.369296+08	2018-07-16 18:55:49.369296+08	\N	61	Dejan LOVREN	7	1	0	0	7	4	1
62	2018-07-16 18:55:49.37178+08	2018-07-16 18:55:49.37178+08	\N	62	MOON Seonmin	2	1	0	0	7	0	0
63	2018-07-16 18:55:49.374194+08	2018-07-16 18:55:49.374194+08	\N	63	Idrissa Gana GUEYE	3	1	0	0	7	2	0
64	2018-07-16 18:55:49.376816+08	2018-07-16 18:55:49.376816+08	\N	64	Youssouf SABALY	3	1	0	0	7	2	0
65	2018-07-16 18:55:49.380188+08	2018-07-16 18:55:49.380188+08	\N	65	LEE Jaesung	3	1	0	0	7	1	0
66	2018-07-16 18:55:49.382665+08	2018-07-16 18:55:49.382665+08	\N	66	Anibal GODOY	3	1	0	0	6	10	1
67	2018-07-16 18:55:49.385002+08	2018-07-16 18:55:49.385002+08	\N	67	Eden HAZARD	6	1	0	0	6	28	0
68	2018-07-16 18:55:49.387393+08	2018-07-16 18:55:49.387393+08	\N	68	Makoto HASEBE	4	1	0	0	6	3	0
69	2018-07-16 18:55:49.389975+08	2018-07-16 18:55:49.389975+08	\N	69	Mathew LECKIE	3	1	0	0	6	5	0
70	2018-07-16 18:55:49.392391+08	2018-07-16 18:55:49.392391+08	\N	70	CEDRIC	3	1	0	0	6	2	1
71	2018-07-16 18:55:49.394951+08	2018-07-16 18:55:49.394951+08	\N	71	Alfred FINNBOGASON	3	1	0	0	6	2	0
72	2018-07-16 18:55:49.397406+08	2018-07-16 18:55:49.397406+08	\N	72	LEE Yong	3	1	0	0	6	5	0
73	2018-07-16 18:55:49.400098+08	2018-07-16 18:55:49.400098+08	\N	73	TREZIGUET	3	1	0	0	6	1	0
74	2018-07-16 18:55:49.402377+08	2018-07-16 18:55:49.402377+08	\N	74	Vahid AMIRI	3	1	0	0	6	9	0
75	2018-07-16 18:55:49.404691+08	2018-07-16 18:55:49.404691+08	\N	75	RAPHAEL GUERREIRO	4	1	0	0	6	5	0
76	2018-07-16 18:55:49.407353+08	2018-07-16 18:55:49.407353+08	\N	76	Mile JEDINAK	3	1	0	0	5	2	0
77	2018-07-16 18:55:49.41029+08	2018-07-16 18:55:49.41029+08	\N	77	Gabriel GOMEZ	3	1	0	0	5	4	0
78	2018-07-16 18:55:49.414166+08	2018-07-16 18:55:49.414166+08	\N	78	John Obi MIKEL	3	1	0	0	5	1	0
79	2018-07-16 18:55:49.416869+08	2018-07-16 18:55:49.416869+08	\N	79	Mbark BOUSSOUFA	3	1	0	0	5	9	0
80	2018-07-16 18:55:49.419049+08	2018-07-16 18:55:49.419049+08	\N	80	Sergio BUSQUETS	4	1	0	0	5	13	0
81	2018-07-16 18:55:49.421093+08	2018-07-16 18:55:49.421093+08	\N	81	Mehdi BENATIA	2	1	0	0	5	2	0
82	2018-07-16 18:55:49.423013+08	2018-07-16 18:55:49.423013+08	\N	82	Nicolas TAGLIAFICO	4	1	0	0	5	6	0
83	2018-07-16 18:55:49.425144+08	2018-07-16 18:55:49.425144+08	\N	83	Omid EBRAHIMI	3	1	0	0	5	2	0
84	2018-07-16 18:55:49.427079+08	2018-07-16 18:55:49.427079+08	\N	84	Yoshimar YOTUN	3	1	0	0	5	5	0
85	2018-07-16 18:55:49.42899+08	2018-07-16 18:55:49.42899+08	\N	85	Kevin DE BRUYNE	6	1	0	0	5	3	0
86	2018-07-16 18:55:49.431642+08	2018-07-16 18:55:49.431642+08	\N	86	John STONES	7	1	0	0	5	2	0
87	2018-07-16 18:55:49.433841+08	2018-07-16 18:55:49.433841+08	\N	87	Josip PIVARIC	4	1	0	0	5	0	0
88	2018-07-16 18:55:49.4364+08	2018-07-16 18:55:49.4364+08	\N	88	Alireza JAHANBAKHSH	3	1	0	0	5	4	0
89	2018-07-16 18:55:49.442218+08	2018-07-16 18:55:49.442218+08	\N	89	Sardar AZMOUN	3	1	0	0	5	3	0
90	2018-07-16 18:55:49.44423+08	2018-07-16 18:55:49.44423+08	\N	90	Marcelo BROZOVIC	6	1	0	0	5	6	0
91	2018-07-16 18:55:49.446921+08	2018-07-16 18:55:49.446921+08	\N	91	Fidel ESCOBAR	3	1	0	0	5	4	1
92	2018-07-16 18:55:49.44915+08	2018-07-16 18:55:49.44915+08	\N	92	HWANG Heechan	3	1	0	0	5	5	0
93	2018-07-16 18:55:49.451715+08	2018-07-16 18:55:49.451715+08	\N	93	Carlos SALCEDO	4	1	0	0	5	0	0
94	2018-07-16 18:55:49.454719+08	2018-07-16 18:55:49.454719+08	\N	94	Pedro AQUINO	3	1	0	0	5	2	0
95	2018-07-16 18:55:49.459158+08	2018-07-16 18:55:49.459158+08	\N	95	Viktor CLAESSON	5	1	0	0	5	6	0
96	2018-07-16 18:55:49.461773+08	2018-07-16 18:55:49.461773+08	\N	96	Ilya KUTEPOV	5	1	0	0	5	2	0
97	2018-07-16 18:55:49.463434+08	2018-07-16 18:55:49.463434+08	\N	97	Ricardo AVILA	2	1	0	0	5	2	0
98	2018-07-16 18:55:49.465711+08	2018-07-16 18:55:49.465711+08	\N	98	RICARDO QUARESMA	3	1	0	0	4	2	0
99	2018-07-16 18:55:49.467983+08	2018-07-16 18:55:49.467983+08	\N	99	FERNANDINHO	5	1	0	0	4	2	0
100	2018-07-16 18:55:49.470876+08	2018-07-16 18:55:49.470876+08	\N	100	Luis TEJADA	2	1	0	0	4	1	0
101	2018-07-16 18:55:49.475372+08	2018-07-16 18:55:49.475372+08	\N	101	Gerard PIQUE	4	1	0	0	4	2	1
102	2018-07-16 18:55:49.478045+08	2018-07-16 18:55:49.478045+08	\N	102	Lionel MESSI	4	1	0	0	4	15	0
103	2018-07-16 18:55:49.482643+08	2018-07-16 18:55:49.482643+08	\N	103	James RODRIGUEZ	3	1	0	0	4	2	0
104	2018-07-16 18:55:49.485803+08	2018-07-16 18:55:49.485803+08	\N	104	Cristian GAMBOA	3	1	0	0	4	6	0
105	2018-07-16 18:55:49.488626+08	2018-07-16 18:55:49.488626+08	\N	105	Juan CUADRADO	4	1	0	0	4	12	0
106	2018-07-16 18:55:49.493031+08	2018-07-16 18:55:49.493031+08	\N	106	Granit XHAKA	4	1	0	0	4	5	0
107	2018-07-16 18:55:49.49493+08	2018-07-16 18:55:49.49493+08	\N	107	NEYMAR	5	1	0	0	4	26	0
108	2018-07-16 18:55:49.497761+08	2018-07-16 18:55:49.497761+08	\N	108	Eric DAVIS	2	1	0	0	4	1	0
109	2018-07-16 18:55:49.500043+08	2018-07-16 18:55:49.500043+08	\N	109	Aziz BEHICH	3	1	0	0	4	1	0
110	2018-07-16 18:55:49.504061+08	2018-07-16 18:55:49.504061+08	\N	110	Carlos BACCA	3	1	0	0	4	1	0
111	2018-07-16 18:55:49.506562+08	2018-07-16 18:55:49.506562+08	\N	111	Fedor SMOLOV	5	1	0	0	4	1	0
112	2018-07-16 18:55:49.510358+08	2018-07-16 18:55:49.510358+08	\N	112	KIM Younggwon	3	1	0	0	4	2	0
113	2018-07-16 18:55:49.51367+08	2018-07-16 18:55:49.51367+08	\N	113	Joshua RISDON	3	1	0	0	4	1	1
114	2018-07-16 18:55:49.517809+08	2018-07-16 18:55:49.517809+08	\N	114	Edgar BARCENAS	3	1	0	0	4	4	0
115	2018-07-16 18:55:49.521366+08	2018-07-16 18:55:49.521366+08	\N	115	Edson ALVAREZ	4	1	0	0	4	4	0
116	2018-07-16 18:55:49.523881+08	2018-07-16 18:55:49.523881+08	\N	116	Youri TIELEMANS	4	1	0	0	4	3	0
117	2018-07-16 18:55:49.527717+08	2018-07-16 18:55:49.527717+08	\N	117	Jesus GALLARDO	4	1	0	0	4	0	0
118	2018-07-16 18:55:49.53819+08	2018-07-16 18:55:49.53819+08	\N	118	Ghaylen CHAALELI	1	1	0	0	4	3	0
119	2018-07-16 18:55:49.54083+08	2018-07-16 18:55:49.54083+08	\N	119	Anice BADRI	3	1	0	0	4	2	0
120	2018-07-16 18:55:49.543542+08	2018-07-16 18:55:49.543542+08	\N	120	Mark MILLIGAN	3	1	0	0	3	0	0
121	2018-07-16 18:55:49.546421+08	2018-07-16 18:55:49.546421+08	\N	121	Masoud SHOJAEI	1	1	0	0	3	1	0
122	2018-07-16 18:55:49.549944+08	2018-07-16 18:55:49.549944+08	\N	122	TAISEER ALJASSAM	2	1	0	0	3	2	0
123	2018-07-16 18:55:49.552339+08	2018-07-16 18:55:49.552339+08	\N	123	Paolo GUERRERO	3	1	0	0	3	2	0
124	2018-07-16 18:55:49.555179+08	2018-07-16 18:55:49.555179+08	\N	124	Grzegorz KRYCHOWIAK	3	1	0	0	3	8	0
125	2018-07-16 18:55:49.558191+08	2018-07-16 18:55:49.558191+08	\N	125	Vedran CORLUKA	4	1	0	0	3	0	0
126	2018-07-16 18:55:49.560422+08	2018-07-16 18:55:49.560422+08	\N	126	Emil HALLFREDSSON	2	1	0	0	3	6	0
127	2018-07-16 18:55:49.562811+08	2018-07-16 18:55:49.562811+08	\N	127	Joel CAMPBELL	2	1	0	0	3	3	0
128	2018-07-16 18:55:49.565308+08	2018-07-16 18:55:49.565308+08	\N	128	SON Heungmin	3	1	0	0	3	5	0
129	2018-07-16 18:55:49.567879+08	2018-07-16 18:55:49.567879+08	\N	129	Mats HUMMELS	2	1	0	0	3	0	0
130	2018-07-16 18:55:49.570355+08	2018-07-16 18:55:49.570355+08	\N	130	Xherdan SHAQIRI	4	1	0	0	3	8	0
131	2018-07-16 18:55:49.572884+08	2018-07-16 18:55:49.572884+08	\N	131	Thomas MUELLER	3	1	0	0	3	1	0
132	2018-07-16 18:55:49.575314+08	2018-07-16 18:55:49.575314+08	\N	132	KIM Shinwook	1	1	0	0	3	0	0
133	2018-07-16 18:55:49.577072+08	2018-07-16 18:55:49.577072+08	\N	133	Karim ANSARIFARD	3	1	0	0	3	2	0
134	2018-07-16 18:55:49.579533+08	2018-07-16 18:55:49.579533+08	\N	134	Jordan HENDERSON	5	1	0	0	3	4	0
135	2018-07-16 18:55:49.582021+08	2018-07-16 18:55:49.582021+08	\N	135	Tom ROGIC	3	1	0	0	3	4	0
136	2018-07-16 18:55:49.584444+08	2018-07-16 18:55:49.584444+08	\N	136	Miguel LAYUN	4	1	0	0	3	3	0
137	2018-07-16 18:55:49.588743+08	2018-07-16 18:55:49.588743+08	\N	137	Renato TAPIA	2	1	0	0	3	1	0
138	2018-07-16 18:55:49.591023+08	2018-07-16 18:55:49.591023+08	\N	138	Johan MOJICA	4	1	0	0	3	2	0
139	2018-07-16 18:55:49.593268+08	2018-07-16 18:55:49.593268+08	\N	139	Denis ZAKARIA	2	1	0	0	3	1	1
140	2018-07-16 18:55:49.595536+08	2018-07-16 18:55:49.595536+08	\N	140	Jacek GORALSKI	2	1	0	0	3	3	0
141	2018-07-16 18:55:49.597548+08	2018-07-16 18:55:49.597548+08	\N	141	Leon BALOGUN	3	1	0	0	3	1	0
142	2018-07-16 18:55:49.599702+08	2018-07-16 18:55:49.599702+08	\N	142	Corentin TOLISSO	5	1	0	0	3	6	0
143	2018-07-16 18:55:49.601996+08	2018-07-16 18:55:49.601996+08	\N	143	Ruben LOFTUS-CHEEK	4	1	0	0	3	6	0
144	2018-07-16 18:55:49.604077+08	2018-07-16 18:55:49.604077+08	\N	144	Bryan IDOWU	3	1	0	0	3	2	0
145	2018-07-16 18:55:49.606272+08	2018-07-16 18:55:49.606272+08	\N	145	Branislav IVANOVIC	2	1	0	0	2	3	0
146	2018-07-16 18:55:49.608789+08	2018-07-16 18:55:49.608789+08	\N	146	Cristian RODRIGUEZ	5	1	0	0	2	2	0
147	2018-07-16 18:55:49.611025+08	2018-07-16 18:55:49.611025+08	\N	147	Andres GUARDADO	4	1	0	0	2	3	0
148	2018-07-16 18:55:49.613648+08	2018-07-16 18:55:49.613648+08	\N	148	Takashi INUI	4	1	0	0	2	9	0
149	2018-07-16 18:55:49.617722+08	2018-07-16 18:55:49.617722+08	\N	149	Manuel DA COSTA	3	1	0	0	2	0	0
150	2018-07-16 18:55:49.619925+08	2018-07-16 18:55:49.619925+08	\N	150	Domagoj VIDA	6	1	0	0	2	2	0
151	2018-07-16 18:55:49.62185+08	2018-07-16 18:55:49.62185+08	\N	151	PHILIPPE COUTINHO	5	1	0	0	2	7	0
152	2018-07-16 18:55:49.624052+08	2018-07-16 18:55:49.624052+08	\N	152	Marcos ROJO	3	1	0	0	2	3	1
153	2018-07-16 18:55:49.6262+08	2018-07-16 18:55:49.6262+08	\N	153	ADRIEN SILVA	3	1	0	0	2	1	0
154	2018-07-16 18:55:49.628161+08	2018-07-16 18:55:49.628161+08	\N	154	AHMED HEGAZY	3	1	0	0	2	1	0
155	2018-07-16 18:55:49.630285+08	2018-07-16 18:55:49.630285+08	\N	155	Paolo HURTADO	1	1	0	0	2	0	0
156	2018-07-16 18:55:49.632668+08	2018-07-16 18:55:49.632668+08	\N	156	Luka MILIVOJEVIC	2	1	0	0	2	3	0
157	2018-07-16 18:55:49.635619+08	2018-07-16 18:55:49.635619+08	\N	157	LEE Seungwoo	2	1	0	0	2	0	0
158	2018-07-16 18:55:49.637907+08	2018-07-16 18:55:49.637907+08	\N	158	William EKONG	3	1	0	0	2	1	1
159	2018-07-16 18:55:49.639963+08	2018-07-16 18:55:49.639963+08	\N	159	Achraf HAKIMI	3	1	0	0	2	0	0
160	2018-07-16 18:55:49.643016+08	2018-07-16 18:55:49.643016+08	\N	160	ALI GABR	3	1	0	0	2	1	1
161	2018-07-16 18:55:49.648131+08	2018-07-16 18:55:49.648131+08	\N	161	Leander DENDONCKER	1	1	0	0	2	1	0
162	2018-07-16 18:55:49.65118+08	2018-07-16 18:55:49.65118+08	\N	162	Jan BEDNAREK	3	1	0	0	2	2	0
163	2018-07-16 18:55:49.653513+08	2018-07-16 18:55:49.653513+08	\N	163	FILIPE LUIS	2	1	0	0	1	0	0
164	2018-07-16 18:55:49.655865+08	2018-07-16 18:55:49.655865+08	\N	164	Tomoaki MAKINO	1	1	0	0	1	0	0
165	2018-07-16 18:55:49.658157+08	2018-07-16 18:55:49.658157+08	\N	165	Birkir SAEVARSSON	3	1	0	0	1	1	0
166	2018-07-16 18:55:49.661634+08	2018-07-16 18:55:49.661634+08	\N	166	Adem LJAJIC	3	1	0	0	1	0	0
167	2018-07-16 18:55:49.66471+08	2018-07-16 18:55:49.66471+08	\N	167	Johnny ACOSTA	3	1	0	0	1	5	0
168	2018-07-16 18:55:49.667846+08	2018-07-16 18:55:49.667846+08	\N	168	Francisco CALVO	2	1	0	0	1	0	0
169	2018-07-16 18:55:49.670531+08	2018-07-16 18:55:49.670531+08	\N	169	Albin EKDAL	5	1	0	0	1	8	0
170	2018-07-16 18:55:49.6746+08	2018-07-16 18:55:49.6746+08	\N	170	Marko PJACA	3	1	0	0	1	4	0
171	2018-07-16 18:55:49.678814+08	2018-07-16 18:55:49.678814+08	\N	171	Salif SANE	3	1	0	0	1	0	0
172	2018-07-16 18:55:49.681531+08	2018-07-16 18:55:49.681531+08	\N	172	Tin JEDVAJ	1	1	0	0	1	0	0
173	2018-07-16 18:55:49.688598+08	2018-07-16 18:55:49.688598+08	\N	173	Daniel ARZANI	3	1	0	0	1	1	0
174	2018-07-16 18:55:49.690864+08	2018-07-16 18:55:49.690864+08	\N	174	BRUNO FERNANDES	2	1	0	0	1	0	0
175	2018-07-16 18:55:49.693693+08	2018-07-16 18:55:49.693693+08	\N	175	Cheikh NDOYE	2	1	0	0	1	1	0
176	2018-07-16 18:55:49.697384+08	2018-07-16 18:55:49.697384+08	\N	176	John GUIDETTI	2	1	0	0	1	1	0
177	2018-07-16 18:55:49.700067+08	2018-07-16 18:55:49.700067+08	\N	177	Marcos ACUNA	1	1	0	0	1	3	0
178	2018-07-16 18:55:49.702801+08	2018-07-16 18:55:49.702801+08	\N	178	SAM MORSY	1	1	0	0	1	0	0
179	2018-07-16 18:55:49.706783+08	2018-07-16 18:55:49.706783+08	\N	179	Eiji KAWASHIMA	4	1	0	0	0	0	0
180	2018-07-16 18:55:49.710353+08	2018-07-16 18:55:49.710353+08	\N	180	Kendall WASTON	1	1	0	0	0	1	0
181	2018-07-16 18:55:49.713156+08	2018-07-16 18:55:49.713156+08	\N	181	Ehsan HAJI SAFI	3	1	0	0	0	6	0
182	2018-07-16 18:55:49.716727+08	2018-07-16 18:55:49.716727+08	\N	182	Aleksandar PRIJOVIC	1	1	0	0	0	0	0
183	2018-07-16 18:55:49.719647+08	2018-07-16 18:55:49.719647+08	\N	183	Pione SISTO	4	1	0	0	0	6	0
184	2018-07-16 18:55:49.72238+08	2018-07-16 18:55:49.72238+08	\N	184	Monir EL KAJOUI	3	1	0	0	0	1	0
\.


--
-- Data for Name: players_statistic_with_goals_scoreds; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.players_statistic_with_goals_scoreds (id, created_at, updated_at, deleted_at, rank, player_name, goals_scored, assists, minutes_played, matches_played, penalties_scored, goals_scored_left, goals_scored_right, headed_goals) FROM stdin;
1	2018-07-20 09:14:38.052099+08	2018-07-20 09:14:38.052099+08	\N	1	Harry KANE	6	0	573	6	3	0	4	1
2	2018-07-20 09:14:38.060262+08	2018-07-20 09:14:38.060262+08	\N	2	Antoine GRIEZMANN	4	2	570	7	3	4	0	0
3	2018-07-20 09:14:38.06384+08	2018-07-20 09:14:38.06384+08	\N	3	Romelu LUKAKU	4	1	476	6	0	2	1	1
4	2018-07-20 09:14:38.06663+08	2018-07-20 09:14:38.06663+08	\N	4	Denis CHERYSHEV	4	0	304	5	0	4	0	0
5	2018-07-20 09:14:38.069932+08	2018-07-20 09:14:38.069932+08	\N	5	CRISTIANO RONALDO	4	0	360	4	1	1	2	1
6	2018-07-20 09:14:38.072824+08	2018-07-20 09:14:38.072824+08	\N	6	Kylian MBAPPE	4	0	534	7	0	1	3	0
7	2018-07-20 09:14:38.075926+08	2018-07-20 09:14:38.075926+08	\N	7	Artem DZYUBA	3	2	333	5	1	0	2	1
8	2018-07-20 09:14:38.07918+08	2018-07-20 09:14:38.07918+08	\N	8	Eden HAZARD	3	2	518	6	1	1	2	0
9	2018-07-20 09:14:38.082631+08	2018-07-20 09:14:38.082631+08	\N	9	Mario MANDZUKIC	3	1	608	6	0	1	2	0
10	2018-07-20 09:14:38.086133+08	2018-07-20 09:14:38.086133+08	\N	10	Ivan PERISIC	3	1	632	7	0	3	0	0
11	2018-07-20 09:14:38.089319+08	2018-07-20 09:14:38.089319+08	\N	11	Yerry MINA	3	0	300	3	0	0	0	3
12	2018-07-20 09:14:38.09251+08	2018-07-20 09:14:38.09251+08	\N	12	Diego COSTA	3	0	320	4	0	0	3	0
13	2018-07-20 09:14:38.095646+08	2018-07-20 09:14:38.095646+08	\N	13	Edinson CAVANI	3	0	343	4	0	1	1	1
14	2018-07-20 09:14:38.098773+08	2018-07-20 09:14:38.098773+08	\N	14	Wahbi KHAZRI	2	2	264	3	0	0	2	0
15	2018-07-20 09:14:38.102227+08	2018-07-20 09:14:38.102227+08	\N	15	PHILIPPE COUTINHO	2	2	436	5	0	0	2	0
16	2018-07-20 09:14:38.105415+08	2018-07-20 09:14:38.105415+08	\N	16	Takashi INUI	2	1	292	4	0	0	2	0
17	2018-07-20 09:14:38.10844+08	2018-07-20 09:14:38.10844+08	\N	17	Luis SUAREZ	2	1	450	5	0	1	1	0
18	2018-07-20 09:14:38.111481+08	2018-07-20 09:14:38.111481+08	\N	18	NEYMAR	2	1	450	5	0	1	1	0
19	2018-07-20 09:14:38.114717+08	2018-07-20 09:14:38.114717+08	\N	19	Luka MODRIC	2	1	694	7	1	0	2	0
20	2018-07-20 09:14:38.120754+08	2018-07-20 09:14:38.120754+08	\N	20	Sergio AGUERO	2	0	178	4	0	1	0	1
21	2018-07-20 09:14:38.127503+08	2018-07-20 09:14:38.127503+08	\N	21	MOHAMED SALAH	2	0	180	2	1	2	0	0
22	2018-07-20 09:14:38.130699+08	2018-07-20 09:14:38.130699+08	\N	22	Ahmed MUSA	2	0	207	3	0	0	2	0
23	2018-07-20 09:14:38.135219+08	2018-07-20 09:14:38.135219+08	\N	23	Mile JEDINAK	2	0	270	3	2	0	2	0
24	2018-07-20 09:14:38.13809+08	2018-07-20 09:14:38.13809+08	\N	24	SON Heungmin	2	0	270	3	0	2	0	0
25	2018-07-20 09:14:38.142509+08	2018-07-20 09:14:38.142509+08	\N	25	Andreas GRANQVIST	2	0	450	5	2	0	2	0
26	2018-07-20 09:14:38.145668+08	2018-07-20 09:14:38.145668+08	\N	26	John STONES	2	0	645	7	0	0	0	2
27	2018-07-20 09:14:38.149757+08	2018-07-20 09:14:38.149757+08	\N	27	Juan QUINTERO	1	2	310	4	0	1	0	0
28	2018-07-20 09:14:38.152668+08	2018-07-20 09:14:38.152668+08	\N	28	Lionel MESSI	1	2	360	4	0	0	1	0
29	2018-07-20 09:14:38.155121+08	2018-07-20 09:14:38.155121+08	\N	29	Aleksandr GOLOVIN	1	2	402	4	0	0	1	0
30	2018-07-20 09:14:38.159369+08	2018-07-20 09:14:38.159369+08	\N	30	Thomas MEUNIER	1	2	450	5	0	0	1	0
31	2018-07-20 09:14:38.162656+08	2018-07-20 09:14:38.162656+08	\N	31	Kevin DE BRUYNE	1	2	540	6	0	0	1	0
32	2018-07-20 09:14:38.166954+08	2018-07-20 09:14:38.166954+08	\N	32	Keisuke HONDA	1	1	47	3	0	1	0	0
33	2018-07-20 09:14:38.170571+08	2018-07-20 09:14:38.170571+08	\N	33	Milan BADELJ	1	1	103	3	0	0	1	0
34	2018-07-20 09:14:38.175794+08	2018-07-20 09:14:38.175794+08	\N	34	Paolo GUERRERO	1	1	208	3	0	1	0	0
35	2018-07-20 09:14:38.17917+08	2018-07-20 09:14:38.17917+08	\N	35	Marco REUS	1	1	210	3	0	1	0	0
36	2018-07-20 09:14:38.184192+08	2018-07-20 09:14:38.184192+08	\N	36	Marcos ROJO	1	1	225	3	0	0	1	0
37	2018-07-20 09:14:38.18852+08	2018-07-20 09:14:38.18852+08	\N	37	Shinji KAGAWA	1	1	232	3	1	0	1	0
38	2018-07-20 09:14:38.192242+08	2018-07-20 09:14:38.192242+08	\N	38	Mbaye NIANG	1	1	247	3	0	0	1	0
39	2018-07-20 09:14:38.196303+08	2018-07-20 09:14:38.196303+08	\N	39	Gabriel MERCADO	1	1	270	3	0	1	0	0
40	2018-07-20 09:14:38.199701+08	2018-07-20 09:14:38.199701+08	\N	40	Victor MOSES	1	1	270	3	1	0	1	0
41	2018-07-20 09:14:38.202869+08	2018-07-20 09:14:38.202869+08	\N	41	Dries MERTENS	1	1	298	6	0	0	1	0
42	2018-07-20 09:14:38.207268+08	2018-07-20 09:14:38.207268+08	\N	42	Hirving  LOZANO	1	1	317	4	0	0	1	0
43	2018-07-20 09:14:38.210673+08	2018-07-20 09:14:38.210673+08	\N	43	Nacer CHADLI	1	1	327	6	0	1	0	0
44	2018-07-20 09:14:38.215009+08	2018-07-20 09:14:38.215009+08	\N	44	Javier HERNANDEZ	1	1	330	4	0	0	1	0
45	2018-07-20 09:14:38.218155+08	2018-07-20 09:14:38.218155+08	\N	45	Juan CUADRADO	1	1	331	4	0	0	1	0
46	2018-07-20 09:14:38.225151+08	2018-07-20 09:14:38.225151+08	\N	46	Xherdan SHAQIRI	1	1	351	4	0	1	0	0
47	2018-07-20 09:14:38.228721+08	2018-07-20 09:14:38.228721+08	\N	47	Christian ERIKSEN	1	1	390	4	0	1	0	0
48	2018-07-20 09:14:38.231576+08	2018-07-20 09:14:38.231576+08	\N	48	Ola TOIVONEN	1	1	400	5	0	0	1	0
49	2018-07-20 09:14:38.234486+08	2018-07-20 09:14:38.234486+08	\N	49	MARIO FERNANDES	1	1	472	5	0	0	0	1
50	2018-07-20 09:14:38.238897+08	2018-07-20 09:14:38.238897+08	\N	50	Jesse  LINGARD	1	1	527	6	0	0	1	0
51	2018-07-20 09:14:38.242391+08	2018-07-20 09:14:38.242391+08	\N	51	Kieran TRIPPIER	1	1	580	6	0	0	1	0
52	2018-07-20 09:14:38.24685+08	2018-07-20 09:14:38.24685+08	\N	52	Domagoj VIDA	1	1	630	6	0	0	0	1
53	2018-07-20 09:14:38.25045+08	2018-07-20 09:14:38.25045+08	\N	53	Harry MAGUIRE	1	1	645	7	0	0	0	1
54	2018-07-20 09:14:38.255691+08	2018-07-20 09:14:38.255691+08	\N	54	Youssef EN NESYRI	1	0	18	1	0	0	0	1
55	2018-07-20 09:14:38.261614+08	2018-07-20 09:14:38.261614+08	\N	55	Felipe BALOY	1	0	21	1	0	0	1	0
56	2018-07-20 09:14:38.265755+08	2018-07-20 09:14:38.265755+08	\N	56	RENATO AUGUSTO	1	0	50	3	0	0	0	1
57	2018-07-20 09:14:38.282616+08	2018-07-20 09:14:38.282616+08	\N	57	Iago ASPAS	1	0	69	3	0	0	0	0
58	2018-07-20 09:14:38.289393+08	2018-07-20 09:14:38.289393+08	\N	58	ROBERTO FIRMINO	1	0	82	4	0	0	1	0
59	2018-07-20 09:14:38.295985+08	2018-07-20 09:14:38.295985+08	\N	59	Adnan JANUZAJ	1	0	86	1	0	1	0	0
60	2018-07-20 09:14:38.299522+08	2018-07-20 09:14:38.299522+08	\N	60	Kendall WASTON	1	0	90	1	0	0	0	1
61	2018-07-20 09:14:38.303564+08	2018-07-20 09:14:38.303564+08	\N	61	Josip DRMIC	1	0	112	3	0	0	1	0
62	2018-07-20 09:14:38.308232+08	2018-07-20 09:14:38.308232+08	\N	62	Michy BATSHUAYI	1	0	113	3	0	1	0	0
63	2018-07-20 09:14:38.313758+08	2018-07-20 09:14:38.313758+08	\N	63	Dylan BRONN	1	0	114	2	0	0	0	1
64	2018-07-20 09:14:38.317834+08	2018-07-20 09:14:38.317834+08	\N	64	RICARDO QUARESMA	1	0	116	3	0	0	1	0
65	2018-07-20 09:14:38.321004+08	2018-07-20 09:14:38.321004+08	\N	65	Khalid BOUTAIB	1	0	141	2	0	1	0	0
66	2018-07-20 09:14:38.327345+08	2018-07-20 09:14:38.327345+08	\N	66	NACHO	1	0	160	2	0	0	1	0
67	2018-07-20 09:14:38.333027+08	2018-07-20 09:14:38.333027+08	\N	67	Karim ANSARIFARD	1	0	178	3	1	0	1	0
68	2018-07-20 09:14:38.337081+08	2018-07-20 09:14:38.337081+08	\N	68	Ferjani SASSI	1	0	194	3	1	0	1	0
69	2018-07-20 09:14:38.344938+08	2018-07-20 09:14:38.344938+08	\N	69	Moussa WAGUE	1	0	196	3	0	0	1	0
70	2018-07-20 09:14:38.347946+08	2018-07-20 09:14:38.347946+08	\N	70	Mathias  JORGENSEN	1	0	219	3	0	1	0	0
71	2018-07-20 09:14:38.353751+08	2018-07-20 09:14:38.353751+08	\N	71	Jan BEDNAREK	1	0	225	3	0	0	1	0
72	2018-07-20 09:14:38.360221+08	2018-07-20 09:14:38.360221+08	\N	72	Angel DI MARIA	1	0	237	3	0	1	0	0
73	2018-07-20 09:14:38.368675+08	2018-07-20 09:14:38.368675+08	\N	73	Genki HARAGUCHI	1	0	246	3	0	0	1	0
74	2018-07-20 09:14:38.371816+08	2018-07-20 09:14:38.371816+08	\N	74	Steven ZUBER	1	0	252	3	0	0	0	1
75	2018-07-20 09:14:38.378862+08	2018-07-20 09:14:38.378862+08	\N	75	Andre CARRILLO	1	0	259	3	0	0	1	0
76	2018-07-20 09:14:38.384966+08	2018-07-20 09:14:38.384966+08	\N	76	Alfred FINNBOGASON	1	0	264	3	0	0	1	0
77	2018-07-20 09:14:38.392521+08	2018-07-20 09:14:38.392521+08	\N	77	Iury GAZINSKY	1	0	266	4	0	0	0	1
78	2018-07-20 09:14:38.397066+08	2018-07-20 09:14:38.397066+08	\N	78	Aleksandar MITROVIC	1	0	268	3	0	0	0	1
79	2018-07-20 09:14:38.401077+08	2018-07-20 09:14:38.401077+08	\N	79	Yussuf Yurary POULSEN	1	0	269	3	0	1	0	0
80	2018-07-20 09:14:38.404527+08	2018-07-20 09:14:38.404527+08	\N	80	Aleksandar KOLAROV	1	0	270	3	0	1	0	0
81	2018-07-20 09:14:38.409871+08	2018-07-20 09:14:38.409871+08	\N	81	Fakhreddine BEN YOUSSEF	1	0	270	3	0	0	1	0
82	2018-07-20 09:14:38.415997+08	2018-07-20 09:14:38.415997+08	\N	82	Grzegorz KRYCHOWIAK	1	0	270	3	0	0	0	1
83	2018-07-20 09:14:38.418892+08	2018-07-20 09:14:38.418892+08	\N	83	Gylfi SIGURDSSON	1	0	270	3	1	0	1	0
84	2018-07-20 09:14:38.422799+08	2018-07-20 09:14:38.422799+08	\N	84	KIM Younggwon	1	0	270	3	0	1	0	0
85	2018-07-20 09:14:38.427672+08	2018-07-20 09:14:38.427672+08	\N	85	Sadio MANE	1	0	270	3	0	0	1	0
86	2018-07-20 09:14:38.432006+08	2018-07-20 09:14:38.432006+08	\N	86	SALEM ALDAWSARI	1	0	270	3	0	0	1	0
87	2018-07-20 09:14:38.435387+08	2018-07-20 09:14:38.435387+08	\N	87	SALMAN ALFARAJ	1	0	270	3	1	1	0	0
88	2018-07-20 09:14:38.439946+08	2018-07-20 09:14:38.439946+08	\N	88	Toni KROOS	1	0	270	3	0	0	1	0
89	2018-07-20 09:14:38.443855+08	2018-07-20 09:14:38.443855+08	\N	89	Yuya OSAKO	1	0	308	4	0	0	0	1
90	2018-07-20 09:14:38.448372+08	2018-07-20 09:14:38.448372+08	\N	90	Carlos VELA	1	0	315	4	1	1	0	0
91	2018-07-20 09:14:38.452309+08	2018-07-20 09:14:38.452309+08	\N	91	Marouane FELLAINI	1	0	316	5	0	0	0	1
92	2018-07-20 09:14:38.45605+08	2018-07-20 09:14:38.45605+08	\N	92	Blerim DZEMAILI	1	0	326	4	0	0	1	0
93	2018-07-20 09:14:38.46113+08	2018-07-20 09:14:38.46113+08	\N	93	Andrej KRAMARIC	1	0	333	7	0	0	0	1
94	2018-07-20 09:14:38.464451+08	2018-07-20 09:14:38.464451+08	\N	94	PAULINHO	1	0	354	5	0	0	1	0
95	2018-07-20 09:14:38.468303+08	2018-07-20 09:14:38.468303+08	\N	95	Granit XHAKA	1	0	360	4	0	1	0	0
96	2018-07-20 09:14:38.474117+08	2018-07-20 09:14:38.474117+08	\N	96	Jose GIMENEZ	1	0	360	4	0	0	0	1
97	2018-07-20 09:14:38.478244+08	2018-07-20 09:14:38.478244+08	\N	97	PEPE	1	0	360	4	0	0	0	1
98	2018-07-20 09:14:38.481323+08	2018-07-20 09:14:38.481323+08	\N	98	Dele ALLI	1	0	364	5	0	0	0	1
99	2018-07-20 09:14:38.48687+08	2018-07-20 09:14:38.48687+08	\N	99	Radamel FALCAO	1	0	377	4	0	0	1	0
100	2018-07-20 09:14:38.492731+08	2018-07-20 09:14:38.492731+08	\N	100	ISCO	1	0	390	4	0	0	1	0
101	2018-07-20 09:14:38.496257+08	2018-07-20 09:14:38.496257+08	\N	101	Emil FORSBERG	1	0	417	5	0	0	1	0
102	2018-07-20 09:14:38.499372+08	2018-07-20 09:14:38.499372+08	\N	102	Ludwig AUGUSTINSSON	1	0	450	5	0	0	1	0
103	2018-07-20 09:14:38.505182+08	2018-07-20 09:14:38.505182+08	\N	103	THIAGO SILVA	1	0	450	5	0	0	0	1
104	2018-07-20 09:14:38.510065+08	2018-07-20 09:14:38.510065+08	\N	104	Paul POGBA	1	0	539	6	0	1	0	0
105	2018-07-20 09:14:38.513157+08	2018-07-20 09:14:38.513157+08	\N	105	Benjamin PAVARD	1	0	540	6	0	0	1	0
106	2018-07-20 09:14:38.517306+08	2018-07-20 09:14:38.517306+08	\N	106	Jan VERTONGHEN	1	0	540	6	0	0	0	1
107	2018-07-20 09:14:38.52027+08	2018-07-20 09:14:38.52027+08	\N	107	Samuel UMTITI	1	0	540	6	0	0	0	1
108	2018-07-20 09:14:38.525543+08	2018-07-20 09:14:38.525543+08	\N	108	Ante REBIC	1	0	547	6	0	0	1	0
109	2018-07-20 09:14:38.530165+08	2018-07-20 09:14:38.530165+08	\N	109	Raphael VARANE	1	0	630	7	0	0	0	1
110	2018-07-20 09:14:38.534497+08	2018-07-20 09:14:38.534497+08	\N	110	Ivan RAKITIC	1	0	639	7	0	0	1	0
\.


--
-- Data for Name: players_statistic_with_shots; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.players_statistic_with_shots (id, created_at, updated_at, deleted_at, rank, player_name, matches_played, minutes_played, shots_number, "attempts_On_target", attempts_off_target, shots_blocked) FROM stdin;
1	2018-07-16 18:55:45.997803+08	2018-07-16 18:55:45.997803+08	\N	1	NEYMAR	5	450	27	13	5	9
2	2018-07-16 18:55:46.000334+08	2018-07-16 18:55:46.000334+08	\N	2	PHILIPPE COUTINHO	5	436	22	7	6	9
3	2018-07-16 18:55:46.003077+08	2018-07-16 18:55:46.003077+08	\N	3	Ivan PERISIC	7	632	22	4	13	5
4	2018-07-16 18:55:46.005384+08	2018-07-16 18:55:46.005384+08	\N	4	Antoine GRIEZMANN	7	570	21	11	7	3
5	2018-07-16 18:55:46.012531+08	2018-07-16 18:55:46.012531+08	\N	5	CRISTIANO RONALDO	4	360	21	8	4	9
6	2018-07-16 18:55:46.016087+08	2018-07-16 18:55:46.016087+08	\N	6	Eden HAZARD	6	518	17	6	6	5
7	2018-07-16 18:55:46.020292+08	2018-07-16 18:55:46.020292+08	\N	7	Lionel MESSI	4	360	17	6	3	8
8	2018-07-16 18:55:46.022927+08	2018-07-16 18:55:46.022927+08	\N	8	Ivan RAKITIC	7	639	17	5	10	2
9	2018-07-16 18:55:46.025215+08	2018-07-16 18:55:46.025215+08	\N	9	Jesse  LINGARD	6	527	17	2	6	9
10	2018-07-16 18:55:46.027907+08	2018-07-16 18:55:46.027907+08	\N	10	Edinson CAVANI	4	343	16	6	6	4
11	2018-07-16 18:55:46.030035+08	2018-07-16 18:55:46.030035+08	\N	11	Ante REBIC	6	547	16	5	4	7
12	2018-07-16 18:55:46.032316+08	2018-07-16 18:55:46.032316+08	\N	12	Marcus BERG	5	426	15	8	4	3
13	2018-07-16 18:55:46.034727+08	2018-07-16 18:55:46.034727+08	\N	13	Toni KROOS	3	270	15	5	5	5
14	2018-07-16 18:55:46.036902+08	2018-07-16 18:55:46.036902+08	\N	14	Emil FORSBERG	5	417	15	3	6	6
15	2018-07-16 18:55:46.039038+08	2018-07-16 18:55:46.039038+08	\N	15	Olivier GIROUD	7	546	15	1	10	4
16	2018-07-16 18:55:46.041435+08	2018-07-16 18:55:46.041435+08	\N	16	Harry KANE	6	573	14	6	7	1
17	2018-07-16 18:55:46.043995+08	2018-07-16 18:55:46.043995+08	\N	17	Luis SUAREZ	5	450	14	5	5	4
18	2018-07-16 18:55:46.046433+08	2018-07-16 18:55:46.046433+08	\N	18	Aleksandar MITROVIC	3	268	14	5	6	3
19	2018-07-16 18:55:46.049641+08	2018-07-16 18:55:46.049641+08	\N	19	SON Heungmin	3	270	14	3	6	5
20	2018-07-16 18:55:46.052545+08	2018-07-16 18:55:46.052545+08	\N	20	Romelu LUKAKU	6	476	13	5	4	4
21	2018-07-16 18:55:46.054956+08	2018-07-16 18:55:46.054956+08	\N	21	Mario MANDZUKIC	6	608	13	5	6	2
22	2018-07-16 18:55:46.059549+08	2018-07-16 18:55:46.059549+08	\N	22	Kevin DE BRUYNE	6	540	13	4	5	4
23	2018-07-16 18:55:46.06167+08	2018-07-16 18:55:46.06167+08	\N	23	Hirving  LOZANO	4	317	13	2	5	6
24	2018-07-16 18:55:46.063907+08	2018-07-16 18:55:46.063907+08	\N	24	Xherdan SHAQIRI	4	351	13	1	5	7
25	2018-07-16 18:55:46.066419+08	2018-07-16 18:55:46.066419+08	\N	25	Denis CHERYSHEV	5	304	12	7	2	3
26	2018-07-16 18:55:46.068591+08	2018-07-16 18:55:46.068591+08	\N	26	Christian ERIKSEN	4	390	12	3	6	3
27	2018-07-16 18:55:46.07086+08	2018-07-16 18:55:46.07086+08	\N	27	Diego COSTA	4	320	11	5	6	0
28	2018-07-16 18:55:46.073278+08	2018-07-16 18:55:46.073278+08	\N	28	Harry MAGUIRE	7	645	11	3	8	0
29	2018-07-16 18:55:46.075718+08	2018-07-16 18:55:46.075718+08	\N	29	Gylfi SIGURDSSON	3	270	10	6	4	0
30	2018-07-16 18:55:46.077999+08	2018-07-16 18:55:46.077999+08	\N	30	Wahbi KHAZRI	3	264	10	5	2	3
31	2018-07-16 18:55:46.080143+08	2018-07-16 18:55:46.080143+08	\N	31	Luka MODRIC	7	694	10	4	5	1
32	2018-07-16 18:55:46.082399+08	2018-07-16 18:55:46.082399+08	\N	32	ISCO	4	390	10	3	3	4
33	2018-07-16 18:55:46.085255+08	2018-07-16 18:55:46.085255+08	\N	33	Carlos VELA	4	315	10	2	6	2
34	2018-07-16 18:55:46.087139+08	2018-07-16 18:55:46.087139+08	\N	34	Andrej KRAMARIC	7	333	10	2	5	3
35	2018-07-16 18:55:46.08942+08	2018-07-16 18:55:46.08942+08	\N	35	GABRIEL JESUS	5	406	10	1	5	4
36	2018-07-16 18:55:46.091709+08	2018-07-16 18:55:46.091709+08	\N	36	Raheem STERLING	6	454	10	1	3	6
37	2018-07-16 18:55:46.09417+08	2018-07-16 18:55:46.09417+08	\N	37	Robert LEWANDOWSKI	3	270	9	3	4	2
38	2018-07-16 18:55:46.096781+08	2018-07-16 18:55:46.096781+08	\N	38	Miguel LAYUN	4	314	9	3	5	1
39	2018-07-16 18:55:46.101187+08	2018-07-16 18:55:46.101187+08	\N	39	Mathew LECKIE	3	270	9	2	5	2
40	2018-07-16 18:55:46.103301+08	2018-07-16 18:55:46.103301+08	\N	40	David SILVA	4	327	9	1	3	5
41	2018-07-16 18:55:46.105597+08	2018-07-16 18:55:46.105597+08	\N	41	Kylian MBAPPE	7	534	8	7	1	0
42	2018-07-16 18:55:46.1077+08	2018-07-16 18:55:46.1077+08	\N	42	Mbaye NIANG	3	247	8	5	3	0
43	2018-07-16 18:55:46.110233+08	2018-07-16 18:55:46.110233+08	\N	43	Takashi INUI	4	292	8	4	2	2
44	2018-07-16 18:55:46.113478+08	2018-07-16 18:55:46.113478+08	\N	44	Michy BATSHUAYI	3	113	8	4	2	2
45	2018-07-16 18:55:46.115614+08	2018-07-16 18:55:46.115614+08	\N	45	Radamel FALCAO	4	377	8	4	4	0
46	2018-07-16 18:55:46.11811+08	2018-07-16 18:55:46.11811+08	\N	46	Artem DZYUBA	5	333	8	4	2	2
47	2018-07-16 18:55:46.120578+08	2018-07-16 18:55:46.120578+08	\N	47	Blerim DZEMAILI	4	326	8	3	4	1
48	2018-07-16 18:55:46.123154+08	2018-07-16 18:55:46.123154+08	\N	48	Juan QUINTERO	4	310	8	3	2	3
49	2018-07-16 18:55:46.125845+08	2018-07-16 18:55:46.125845+08	\N	49	Paul POGBA	6	539	8	2	4	2
50	2018-07-16 18:55:46.128346+08	2018-07-16 18:55:46.128346+08	\N	50	Hakim ZIYACH	3	265	8	2	2	4
51	2018-07-16 18:55:46.130904+08	2018-07-16 18:55:46.130904+08	\N	51	TREZIGUET	3	239	8	1	6	1
52	2018-07-16 18:55:46.133526+08	2018-07-16 18:55:46.133526+08	\N	52	Paolo GUERRERO	3	208	7	5	2	0
53	2018-07-16 18:55:46.136364+08	2018-07-16 18:55:46.136364+08	\N	53	Yuya OSAKO	4	308	7	4	2	1
54	2018-07-16 18:55:46.138997+08	2018-07-16 18:55:46.138997+08	\N	54	Dries MERTENS	6	298	7	4	3	0
55	2018-07-16 18:55:46.141455+08	2018-07-16 18:55:46.141455+08	\N	55	Gerard PIQUE	4	390	7	2	2	3
56	2018-07-16 18:55:46.1443+08	2018-07-16 18:55:46.1443+08	\N	56	Ricardo RODRIGUEZ	4	360	7	2	2	3
57	2018-07-16 18:55:46.149536+08	2018-07-16 18:55:46.149536+08	\N	57	SALEM ALDAWSARI	3	270	7	2	5	0
58	2018-07-16 18:55:46.151944+08	2018-07-16 18:55:46.151944+08	\N	58	ROBERTO FIRMINO	4	82	7	2	5	0
59	2018-07-16 18:55:46.154349+08	2018-07-16 18:55:46.154349+08	\N	59	Fakhreddine BEN YOUSSEF	3	270	7	2	4	1
60	2018-07-16 18:55:46.156971+08	2018-07-16 18:55:46.156971+08	\N	60	Roman ZOBNIN	5	510	7	2	3	2
61	2018-07-16 18:55:46.15947+08	2018-07-16 18:55:46.15947+08	\N	61	Victor MOSES	3	270	7	1	4	2
62	2018-07-16 18:55:46.161951+08	2018-07-16 18:55:46.161951+08	\N	62	Birkir BJARNASON	3	269	7	1	3	3
63	2018-07-16 18:55:46.164417+08	2018-07-16 18:55:46.164417+08	\N	63	Oghenekaro ETEBO	3	269	7	1	4	2
64	2018-07-16 18:55:46.16689+08	2018-07-16 18:55:46.16689+08	\N	64	Timo WERNER	3	266	7	1	5	1
65	2018-07-16 18:55:46.16922+08	2018-07-16 18:55:46.16922+08	\N	65	Yannick CARRASCO	4	239	6	4	2	0
66	2018-07-16 18:55:46.171854+08	2018-07-16 18:55:46.171854+08	\N	66	Mile JEDINAK	3	270	6	3	3	0
67	2018-07-16 18:55:46.174322+08	2018-07-16 18:55:46.174322+08	\N	67	Sergio AGUERO	4	178	6	3	0	3
68	2018-07-16 18:55:46.177086+08	2018-07-16 18:55:46.177086+08	\N	68	Thomas MEUNIER	5	450	6	3	3	0
69	2018-07-16 18:55:46.179896+08	2018-07-16 18:55:46.179896+08	\N	69	PAULINHO	5	354	6	3	1	2
70	2018-07-16 18:55:46.182314+08	2018-07-16 18:55:46.182314+08	\N	70	John STONES	7	645	6	3	2	1
71	2018-07-16 18:55:46.18497+08	2018-07-16 18:55:46.18497+08	\N	71	Mats HUMMELS	2	180	6	2	3	1
72	2018-07-16 18:55:46.187618+08	2018-07-16 18:55:46.187618+08	\N	72	HATAN BAHBRI	3	158	6	2	3	1
73	2018-07-16 18:55:46.190012+08	2018-07-16 18:55:46.190012+08	\N	73	MOHAMED SALAH	2	180	6	2	3	1
74	2018-07-16 18:55:46.192306+08	2018-07-16 18:55:46.192306+08	\N	74	Younes BELHANDA	3	228	6	2	2	2
75	2018-07-16 18:55:46.196746+08	2018-07-16 18:55:46.196746+08	\N	75	THIAGO SILVA	5	450	6	1	4	1
76	2018-07-16 18:55:46.199108+08	2018-07-16 18:55:46.199108+08	\N	76	Andres GUARDADO	4	307	6	1	2	3
154	2018-07-16 18:55:46.432122+08	2018-07-16 18:55:46.432122+08	\N	154	Yerry MINA	3	300	3	3	0	0
77	2018-07-16 18:55:46.201559+08	2018-07-16 18:55:46.201559+08	\N	77	Martin CACERES	5	450	6	1	4	1
78	2018-07-16 18:55:46.214205+08	2018-07-16 18:55:46.214205+08	\N	78	Axel WITSEL	6	539	6	1	2	3
79	2018-07-16 18:55:46.216592+08	2018-07-16 18:55:46.216592+08	\N	79	Juan CUADRADO	4	331	6	1	3	2
80	2018-07-16 18:55:46.219816+08	2018-07-16 18:55:46.219816+08	\N	80	Julian DRAXLER	2	135	6	1	0	5
81	2018-07-16 18:55:46.2219+08	2018-07-16 18:55:46.2219+08	\N	81	Naim SLITI	3	182	6	1	4	1
82	2018-07-16 18:55:46.224314+08	2018-07-16 18:55:46.224314+08	\N	82	Lucas HERNANDEZ	7	590	6	1	3	2
83	2018-07-16 18:55:46.226684+08	2018-07-16 18:55:46.226684+08	\N	83	Sime VRSALJKO	6	607	6	0	5	1
84	2018-07-16 18:55:46.228926+08	2018-07-16 18:55:46.228926+08	\N	84	Andreas GRANQVIST	5	450	5	4	0	1
85	2018-07-16 18:55:46.23391+08	2018-07-16 18:55:46.23391+08	\N	85	Ola TOIVONEN	5	400	5	3	2	0
86	2018-07-16 18:55:46.236045+08	2018-07-16 18:55:46.236045+08	\N	86	RICARDO QUARESMA	3	116	5	2	2	1
87	2018-07-16 18:55:46.238417+08	2018-07-16 18:55:46.238417+08	\N	87	WILLIAN	5	359	5	2	2	1
88	2018-07-16 18:55:46.240872+08	2018-07-16 18:55:46.240872+08	\N	88	Celso BORGES	3	270	5	2	2	1
89	2018-07-16 18:55:46.243192+08	2018-07-16 18:55:46.243192+08	\N	89	Mehdi BENATIA	2	180	5	2	3	0
90	2018-07-16 18:55:46.247203+08	2018-07-16 18:55:46.247203+08	\N	90	Odion IGHALO	3	122	5	2	1	2
91	2018-07-16 18:55:46.249703+08	2018-07-16 18:55:46.249703+08	\N	91	Hector HERRERA	4	360	5	2	1	2
92	2018-07-16 18:55:46.25465+08	2018-07-16 18:55:46.25465+08	\N	92	Alfred FINNBOGASON	3	264	5	2	3	0
93	2018-07-16 18:55:46.259629+08	2018-07-16 18:55:46.259629+08	\N	93	Tom ROGIC	3	226	5	2	1	2
94	2018-07-16 18:55:46.261772+08	2018-07-16 18:55:46.261772+08	\N	94	GONCALO GUEDES	4	245	5	2	0	3
95	2018-07-16 18:55:46.26408+08	2018-07-16 18:55:46.26408+08	\N	95	Edgar BARCENAS	3	222	5	2	3	0
96	2018-07-16 18:55:46.26651+08	2018-07-16 18:55:46.26651+08	\N	96	Dele ALLI	5	364	5	2	1	2
97	2018-07-16 18:55:46.268826+08	2018-07-16 18:55:46.268826+08	\N	97	Marcus RASHFORD	6	211	5	2	2	1
98	2018-07-16 18:55:46.274032+08	2018-07-16 18:55:46.274032+08	\N	98	Andres INIESTA	4	284	5	1	2	2
99	2018-07-16 18:55:46.27876+08	2018-07-16 18:55:46.27876+08	\N	99	Javier HERNANDEZ	4	330	5	1	3	1
100	2018-07-16 18:55:46.281768+08	2018-07-16 18:55:46.281768+08	\N	100	Kamil GROSICKI	3	213	5	1	3	1
101	2018-07-16 18:55:46.284633+08	2018-07-16 18:55:46.284633+08	\N	101	Toby ALDERWEIRELD	6	540	5	1	4	0
102	2018-07-16 18:55:46.288918+08	2018-07-16 18:55:46.288918+08	\N	102	Marouane FELLAINI	5	316	5	1	2	2
103	2018-07-16 18:55:46.292065+08	2018-07-16 18:55:46.292065+08	\N	103	Sergio BUSQUETS	4	390	5	1	3	1
104	2018-07-16 18:55:46.294858+08	2018-07-16 18:55:46.294858+08	\N	104	Granit XHAKA	4	360	5	1	3	1
105	2018-07-16 18:55:46.298338+08	2018-07-16 18:55:46.298338+08	\N	105	YASSER ALSHAHRANI	3	270	5	1	2	2
106	2018-07-16 18:55:46.300823+08	2018-07-16 18:55:46.300823+08	\N	106	Marco REUS	3	210	5	1	2	2
107	2018-07-16 18:55:46.303839+08	2018-07-16 18:55:46.303839+08	\N	107	Eric  DIER	6	248	5	1	2	2
108	2018-07-16 18:55:46.30629+08	2018-07-16 18:55:46.30629+08	\N	108	Ferjani SASSI	3	194	5	1	2	2
109	2018-07-16 18:55:46.314556+08	2018-07-16 18:55:46.314556+08	\N	109	HUSSAIN ALMOQAHWI	2	136	5	1	3	1
110	2018-07-16 18:55:46.317321+08	2018-07-16 18:55:46.317321+08	\N	110	Viktor CLAESSON	5	434	5	1	2	2
111	2018-07-16 18:55:46.319609+08	2018-07-16 18:55:46.319609+08	\N	111	Dejan LOVREN	7	650	5	0	3	2
112	2018-07-16 18:55:46.323515+08	2018-07-16 18:55:46.323515+08	\N	112	Sergej MILINKOVIC-SAVIC	3	270	5	0	4	1
113	2018-07-16 18:55:46.326483+08	2018-07-16 18:55:46.326483+08	\N	113	Mario GOMEZ	3	88	4	3	1	0
114	2018-07-16 18:55:46.329234+08	2018-07-16 18:55:46.329234+08	\N	114	Keisuke HONDA	3	47	4	3	0	1
115	2018-07-16 18:55:46.33238+08	2018-07-16 18:55:46.33238+08	\N	115	DOUGLAS COSTA	2	77	4	3	0	1
116	2018-07-16 18:55:46.335156+08	2018-07-16 18:55:46.335156+08	\N	116	Iago ASPAS	3	69	4	3	0	1
117	2018-07-16 18:55:46.337323+08	2018-07-16 18:55:46.337323+08	\N	117	Ahmed MUSA	3	207	4	2	2	0
118	2018-07-16 18:55:46.339502+08	2018-07-16 18:55:46.339502+08	\N	118	Cristian RODRIGUEZ	5	165	4	2	1	1
119	2018-07-16 18:55:46.341968+08	2018-07-16 18:55:46.341968+08	\N	119	MARCELO	4	280	4	2	2	0
120	2018-07-16 18:55:46.344743+08	2018-07-16 18:55:46.344743+08	\N	120	CASEMIRO	4	330	4	2	2	0
121	2018-07-16 18:55:46.347244+08	2018-07-16 18:55:46.347244+08	\N	121	RODRIGO	3	23	4	2	2	0
122	2018-07-16 18:55:46.349874+08	2018-07-16 18:55:46.349874+08	\N	122	Steven ZUBER	3	252	4	2	2	0
123	2018-07-16 18:55:46.352498+08	2018-07-16 18:55:46.352498+08	\N	123	Martin BRAITHWAITE	4	249	4	2	2	0
124	2018-07-16 18:55:46.355036+08	2018-07-16 18:55:46.355036+08	\N	124	Breel EMBOLO	4	134	4	2	1	1
125	2018-07-16 18:55:46.357648+08	2018-07-16 18:55:46.357648+08	\N	125	Nabil FEKIR	6	70	4	2	1	1
126	2018-07-16 18:55:46.362993+08	2018-07-16 18:55:46.362993+08	\N	126	Leon BALOGUN	3	270	4	2	1	1
127	2018-07-16 18:55:46.365211+08	2018-07-16 18:55:46.365211+08	\N	127	Benjamin PAVARD	6	540	4	2	2	0
128	2018-07-16 18:55:46.367769+08	2018-07-16 18:55:46.367769+08	\N	128	Julian BRANDT	3	19	4	1	2	1
129	2018-07-16 18:55:46.37023+08	2018-07-16 18:55:46.37023+08	\N	129	Josip DRMIC	3	112	4	1	1	2
130	2018-07-16 18:55:46.372611+08	2018-07-16 18:55:46.372611+08	\N	130	Jefferson FARFAN	2	130	4	1	1	2
131	2018-07-16 18:55:46.375032+08	2018-07-16 18:55:46.375032+08	\N	131	Vincent KOMPANY	5	376	4	1	3	0
132	2018-07-16 18:55:46.377456+08	2018-07-16 18:55:46.377456+08	\N	132	Nicolas OTAMENDI	4	360	4	1	3	0
133	2018-07-16 18:55:46.38004+08	2018-07-16 18:55:46.38004+08	\N	133	Lasse SCHONE	3	220	4	1	3	0
134	2018-07-16 18:55:46.382267+08	2018-07-16 18:55:46.382267+08	\N	134	MARWAN MOHSEN	3	209	4	1	2	1
135	2018-07-16 18:55:46.384569+08	2018-07-16 18:55:46.384569+08	\N	135	Mateo KOVACIC	5	183	4	1	1	2
136	2018-07-16 18:55:46.386871+08	2018-07-16 18:55:46.386871+08	\N	136	Sadio MANE	3	270	4	1	1	2
137	2018-07-16 18:55:46.389296+08	2018-07-16 18:55:46.389296+08	\N	137	Jordan HENDERSON	5	482	4	1	3	0
138	2018-07-16 18:55:46.392222+08	2018-07-16 18:55:46.392222+08	\N	138	Blaise MATUIDI	5	337	4	1	1	2
139	2018-07-16 18:55:46.394851+08	2018-07-16 18:55:46.394851+08	\N	139	Raphael VARANE	7	630	4	1	3	0
140	2018-07-16 18:55:46.397229+08	2018-07-16 18:55:46.397229+08	\N	140	Nicolai JORGENSEN	3	212	4	1	2	1
141	2018-07-16 18:55:46.399792+08	2018-07-16 18:55:46.399792+08	\N	141	Adnan JANUZAJ	1	86	4	1	0	3
142	2018-07-16 18:55:46.402168+08	2018-07-16 18:55:46.402168+08	\N	142	Marcelo BROZOVIC	6	458	4	1	2	1
143	2018-07-16 18:55:46.40633+08	2018-07-16 18:55:46.40633+08	\N	143	LEE Jaesung	3	270	4	1	0	3
144	2018-07-16 18:55:46.408661+08	2018-07-16 18:55:46.408661+08	\N	144	Edison FLORES	3	242	4	1	2	1
145	2018-07-16 18:55:46.410693+08	2018-07-16 18:55:46.410693+08	\N	145	Pione SISTO	4	232	4	1	3	0
146	2018-07-16 18:55:46.41272+08	2018-07-16 18:55:46.41272+08	\N	146	Carlos SALCEDO	4	360	4	1	1	2
147	2018-07-16 18:55:46.414919+08	2018-07-16 18:55:46.414919+08	\N	147	Roman TORRES	3	236	4	0	3	1
148	2018-07-16 18:55:46.416838+08	2018-07-16 18:55:46.416838+08	\N	148	Sergio RAMOS	4	390	4	0	2	2
149	2018-07-16 18:55:46.418899+08	2018-07-16 18:55:46.418899+08	\N	149	Salif SANE	3	270	4	0	3	1
150	2018-07-16 18:55:46.421242+08	2018-07-16 18:55:46.421242+08	\N	150	Thomas DELANEY	4	367	4	0	3	1
151	2018-07-16 18:55:46.423359+08	2018-07-16 18:55:46.423359+08	\N	151	RAPHAEL GUERREIRO	4	360	4	0	2	2
152	2018-07-16 18:55:46.425359+08	2018-07-16 18:55:46.425359+08	\N	152	Alex IWOBI	3	64	4	0	0	4
153	2018-07-16 18:55:46.429258+08	2018-07-16 18:55:46.429258+08	\N	153	JUNG Wooyoung	3	127	3	3	0	0
155	2018-07-16 18:55:46.43452+08	2018-07-16 18:55:46.43452+08	\N	155	KI Sungyueng	2	180	3	2	0	1
156	2018-07-16 18:55:46.436831+08	2018-07-16 18:55:46.436831+08	\N	156	Gonzalo HIGUAIN	3	132	3	2	1	0
157	2018-07-16 18:55:46.439051+08	2018-07-16 18:55:46.439051+08	\N	157	Cristian GAMBOA	3	254	3	2	1	0
158	2018-07-16 18:55:46.441426+08	2018-07-16 18:55:46.441426+08	\N	158	Andre CARRILLO	3	259	3	2	1	0
159	2018-07-16 18:55:46.444721+08	2018-07-16 18:55:46.444721+08	\N	159	Nacer CHADLI	6	327	3	2	1	0
160	2018-07-16 18:55:46.451184+08	2018-07-16 18:55:46.451184+08	\N	160	Jose GIMENEZ	4	360	3	2	1	0
161	2018-07-16 18:55:46.453157+08	2018-07-16 18:55:46.453157+08	\N	161	Khalid BOUTAIB	2	141	3	2	1	0
162	2018-07-16 18:55:46.455338+08	2018-07-16 18:55:46.455338+08	\N	162	Ismaila SARR	3	270	3	2	1	0
163	2018-07-16 18:55:46.457963+08	2018-07-16 18:55:46.457963+08	\N	163	Anice BADRI	3	225	3	2	0	1
164	2018-07-16 18:55:46.462482+08	2018-07-16 18:55:46.462482+08	\N	164	Sverrir INGASON	2	115	3	1	2	0
165	2018-07-16 18:55:46.465305+08	2018-07-16 18:55:46.465305+08	\N	165	Sami KHEDIRA	2	118	3	1	0	2
166	2018-07-16 18:55:46.47014+08	2018-07-16 18:55:46.47014+08	\N	166	RENATO AUGUSTO	3	50	3	1	1	1
167	2018-07-16 18:55:46.472763+08	2018-07-16 18:55:46.472763+08	\N	167	Diego GODIN	5	450	3	1	2	0
168	2018-07-16 18:55:46.475371+08	2018-07-16 18:55:46.475371+08	\N	168	Ever BANEGA	3	216	3	1	0	2
169	2018-07-16 18:55:46.479008+08	2018-07-16 18:55:46.479008+08	\N	169	Angel DI MARIA	3	237	3	1	1	1
170	2018-07-16 18:55:46.482145+08	2018-07-16 18:55:46.482145+08	\N	170	Shinji KAGAWA	3	232	3	1	1	1
171	2018-07-16 18:55:46.484702+08	2018-07-16 18:55:46.484702+08	\N	171	Bryan OVIEDO	2	180	3	1	2	0
172	2018-07-16 18:55:46.48779+08	2018-07-16 18:55:46.48779+08	\N	172	Dusan TADIC	3	263	3	1	2	0
173	2018-07-16 18:55:46.491158+08	2018-07-16 18:55:46.491158+08	\N	173	Jerome BOATENG	2	172	3	1	1	1
174	2018-07-16 18:55:46.493984+08	2018-07-16 18:55:46.493984+08	\N	174	Domagoj VIDA	6	630	3	1	2	0
175	2018-07-16 18:55:46.497367+08	2018-07-16 18:55:46.497367+08	\N	175	Johann GUDMUNDSSON	2	153	3	1	0	2
176	2018-07-16 18:55:46.500802+08	2018-07-16 18:55:46.500802+08	\N	176	Kieran TRIPPIER	6	580	3	1	2	0
177	2018-07-16 18:55:46.508319+08	2018-07-16 18:55:46.508319+08	\N	177	Fabian DELPH	4	220	3	1	1	1
178	2018-07-16 18:55:46.511206+08	2018-07-16 18:55:46.511206+08	\N	178	Joel CAMPBELL	2	114	3	1	1	1
179	2018-07-16 18:55:46.514838+08	2018-07-16 18:55:46.514838+08	\N	179	Takashi USAMI	2	68	3	1	0	2
180	2018-07-16 18:55:46.518063+08	2018-07-16 18:55:46.518063+08	\N	180	Mario GAVRANOVIC	2	114	3	1	1	1
181	2018-07-16 18:55:46.520731+08	2018-07-16 18:55:46.520731+08	\N	181	Karim ANSARIFARD	3	178	3	1	2	0
182	2018-07-16 18:55:46.523635+08	2018-07-16 18:55:46.523635+08	\N	182	Matias VECINO	5	416	3	1	2	0
183	2018-07-16 18:55:46.527006+08	2018-07-16 18:55:46.527006+08	\N	183	Genki HARAGUCHI	3	246	3	1	2	0
184	2018-07-16 18:55:46.530232+08	2018-07-16 18:55:46.530232+08	\N	184	Luis ADVINCULA	3	270	3	1	2	0
185	2018-07-16 18:55:46.533798+08	2018-07-16 18:55:46.533798+08	\N	185	Yoshimar YOTUN	3	180	3	1	2	0
186	2018-07-16 18:55:46.536745+08	2018-07-16 18:55:46.536745+08	\N	186	SALMAN ALFARAJ	3	270	3	1	1	1
187	2018-07-16 18:55:46.539915+08	2018-07-16 18:55:46.539915+08	\N	187	Wilfred NDIDI	3	270	3	1	1	1
188	2018-07-16 18:55:46.542267+08	2018-07-16 18:55:46.542267+08	\N	188	Aleksandr GOLOVIN	4	402	3	1	2	0
189	2018-07-16 18:55:46.544964+08	2018-07-16 18:55:46.544964+08	\N	189	Amine HARIT	1	82	3	1	2	0
190	2018-07-16 18:55:46.548189+08	2018-07-16 18:55:46.548189+08	\N	190	Sardar AZMOUN	3	270	3	1	2	0
191	2018-07-16 18:55:46.550911+08	2018-07-16 18:55:46.550911+08	\N	191	Rodrigo BENTANCUR	5	365	3	1	1	1
192	2018-07-16 18:55:46.553429+08	2018-07-16 18:55:46.553429+08	\N	192	Carlos SANCHEZ	3	123	3	1	1	1
193	2018-07-16 18:55:46.556656+08	2018-07-16 18:55:46.556656+08	\N	193	Ludwig AUGUSTINSSON	5	450	3	1	2	0
194	2018-07-16 18:55:46.562465+08	2018-07-16 18:55:46.562465+08	\N	194	Youri TIELEMANS	4	175	3	1	0	2
195	2018-07-16 18:55:46.564897+08	2018-07-16 18:55:46.564897+08	\N	195	Jose Luis RODRIGUEZ	3	243	3	1	2	0
196	2018-07-16 18:55:46.567414+08	2018-07-16 18:55:46.567414+08	\N	196	Ruben LOFTUS-CHEEK	4	274	3	1	1	1
197	2018-07-16 18:55:46.569968+08	2018-07-16 18:55:46.569968+08	\N	197	Maximiliano MEZA	4	207	3	1	0	2
198	2018-07-16 18:55:46.572568+08	2018-07-16 18:55:46.572568+08	\N	198	Daniel COLINDRES	2	98	3	0	2	1
199	2018-07-16 18:55:46.575102+08	2018-07-16 18:55:46.575102+08	\N	199	FERNANDINHO	5	155	3	0	1	2
200	2018-07-16 18:55:46.577676+08	2018-07-16 18:55:46.577676+08	\N	200	James RODRIGUEZ	3	152	3	0	1	2
201	2018-07-16 18:55:46.580188+08	2018-07-16 18:55:46.580188+08	\N	201	Nicolas TAGLIAFICO	4	350	3	0	3	0
202	2018-07-16 18:55:46.582466+08	2018-07-16 18:55:46.582466+08	\N	202	Nemanja MATIC	3	270	3	0	2	1
203	2018-07-16 18:55:46.585127+08	2018-07-16 18:55:46.585127+08	\N	203	Aaron MOOY	3	270	3	0	1	2
204	2018-07-16 18:55:46.587407+08	2018-07-16 18:55:46.587407+08	\N	204	Thomas MUELLER	3	207	3	0	2	1
205	2018-07-16 18:55:46.589698+08	2018-07-16 18:55:46.589698+08	\N	205	MOHAMED ELNENY	3	244	3	0	2	1
206	2018-07-16 18:55:46.592221+08	2018-07-16 18:55:46.592221+08	\N	206	Christian CUEVA	3	262	3	0	1	2
207	2018-07-16 18:55:46.59479+08	2018-07-16 18:55:46.59479+08	\N	207	Albin EKDAL	5	421	3	0	3	0
208	2018-07-16 18:55:46.597391+08	2018-07-16 18:55:46.597391+08	\N	208	Piotr ZIELINSKI	3	259	3	0	1	2
209	2018-07-16 18:55:46.600022+08	2018-07-16 18:55:46.600022+08	\N	209	Kelechi IHEANACHO	3	148	3	0	2	1
210	2018-07-16 18:55:46.602633+08	2018-07-16 18:55:46.602633+08	\N	210	Thorgan HAZARD	2	97	3	0	2	1
211	2018-07-16 18:55:46.608222+08	2018-07-16 18:55:46.608222+08	\N	211	Dani CARVAJAL	3	230	3	0	1	2
212	2018-07-16 18:55:46.61058+08	2018-07-16 18:55:46.61058+08	\N	212	Joshua KIMMICH	3	270	3	0	2	1
213	2018-07-16 18:55:46.612759+08	2018-07-16 18:55:46.612759+08	\N	213	Mehdi TAREMI	3	202	3	0	3	0
214	2018-07-16 18:55:46.614791+08	2018-07-16 18:55:46.614791+08	\N	214	BRUNO FERNANDES	2	88	3	0	3	0
215	2018-07-16 18:55:46.617054+08	2018-07-16 18:55:46.617054+08	\N	215	MOHAMMED ALBURAYK	3	270	3	0	1	2
216	2018-07-16 18:55:46.619271+08	2018-07-16 18:55:46.619271+08	\N	216	JOSE FONTE	4	360	3	0	2	1
217	2018-07-16 18:55:46.621295+08	2018-07-16 18:55:46.621295+08	\N	217	Ousmane DEMBELE	4	165	3	0	3	0
218	2018-07-16 18:55:46.623204+08	2018-07-16 18:55:46.623204+08	\N	218	Filip KOSTIC	3	166	3	0	1	2
219	2018-07-16 18:55:46.625312+08	2018-07-16 18:55:46.625312+08	\N	219	Jan VERTONGHEN	6	540	2	2	0	0
220	2018-07-16 18:55:46.62722+08	2018-07-16 18:55:46.62722+08	\N	220	Fidel ESCOBAR	3	270	2	2	0	0
221	2018-07-16 18:55:46.629102+08	2018-07-16 18:55:46.629102+08	\N	221	Michael MURILLO	2	180	2	2	0	0
222	2018-07-16 18:55:46.631227+08	2018-07-16 18:55:46.631227+08	\N	222	Milan BADELJ	3	103	2	1	1	0
223	2018-07-16 18:55:46.633409+08	2018-07-16 18:55:46.633409+08	\N	223	Sergey IGNASHEVICH	5	510	2	1	1	0
224	2018-07-16 18:55:46.635596+08	2018-07-16 18:55:46.635596+08	\N	224	MANUEL FERNANDES	1	6	2	1	1	0
225	2018-07-16 18:55:46.637723+08	2018-07-16 18:55:46.637723+08	\N	225	Giancarlo GONZALEZ	3	270	2	1	1	0
226	2018-07-16 18:55:46.640702+08	2018-07-16 18:55:46.640702+08	\N	226	Grzegorz KRYCHOWIAK	3	270	2	1	0	1
227	2018-07-16 18:55:46.642903+08	2018-07-16 18:55:46.642903+08	\N	227	Marcos URENA	2	120	2	1	1	0
228	2018-07-16 18:55:46.650151+08	2018-07-16 18:55:46.650151+08	\N	228	PEPE	4	360	2	1	1	0
229	2018-07-16 18:55:46.652659+08	2018-07-16 18:55:46.652659+08	\N	229	Aleksandar KOLAROV	3	270	2	1	1	0
230	2018-07-16 18:55:46.654907+08	2018-07-16 18:55:46.654907+08	\N	230	Ashley  YOUNG	5	462	2	1	1	0
231	2018-07-16 18:55:46.657258+08	2018-07-16 18:55:46.657258+08	\N	231	Aron GUNNARSSON	3	253	2	1	1	0
232	2018-07-16 18:55:46.661066+08	2018-07-16 18:55:46.661066+08	\N	232	Jordi ALBA	4	390	2	1	0	1
233	2018-07-16 18:55:46.664718+08	2018-07-16 18:55:46.664718+08	\N	233	Marcos ROJO	3	225	2	1	1	0
234	2018-07-16 18:55:46.666913+08	2018-07-16 18:55:46.666913+08	\N	234	Yussuf Yurary POULSEN	3	269	2	1	1	0
235	2018-07-16 18:55:46.669214+08	2018-07-16 18:55:46.669214+08	\N	235	FAHAD ALMUWALLAD	3	183	2	1	1	0
236	2018-07-16 18:55:46.671787+08	2018-07-16 18:55:46.671787+08	\N	236	Fedor SMOLOV	5	219	2	1	1	0
237	2018-07-16 18:55:46.674006+08	2018-07-16 18:55:46.674006+08	\N	237	Giorgian DE ARRASCAETA	2	86	2	1	1	0
238	2018-07-16 18:55:46.677352+08	2018-07-16 18:55:46.677352+08	\N	238	Samuel UMTITI	6	540	2	1	0	1
239	2018-07-16 18:55:46.679902+08	2018-07-16 18:55:46.679902+08	\N	239	Youssouf SABALY	3	254	2	1	1	0
240	2018-07-16 18:55:46.68218+08	2018-07-16 18:55:46.68218+08	\N	240	Alireza JAHANBAKHSH	3	172	2	1	1	0
241	2018-07-16 18:55:46.685241+08	2018-07-16 18:55:46.685241+08	\N	241	Leon GORETZKA	1	63	2	1	1	0
242	2018-07-16 18:55:46.689473+08	2018-07-16 18:55:46.689473+08	\N	242	Iury GAZINSKY	4	266	2	1	1	0
243	2018-07-16 18:55:46.692336+08	2018-07-16 18:55:46.692336+08	\N	243	Yoshinori MUTO	1	82	2	1	1	0
244	2018-07-16 18:55:46.696908+08	2018-07-16 18:55:46.696908+08	\N	244	Daniel ARZANI	3	60	2	1	1	0
245	2018-07-16 18:55:46.702859+08	2018-07-16 18:55:46.702859+08	\N	245	HWANG Heechan	3	203	2	1	1	0
246	2018-07-16 18:55:46.705307+08	2018-07-16 18:55:46.705307+08	\N	246	Jens Stryger LARSEN	3	270	2	1	1	0
247	2018-07-16 18:55:46.708534+08	2018-07-16 18:55:46.708534+08	\N	247	Mateus URIBE	3	182	2	1	0	1
248	2018-07-16 18:55:46.711235+08	2018-07-16 18:55:46.711235+08	\N	248	Marco ASENSIO	3	131	2	1	1	0
249	2018-07-16 18:55:46.714367+08	2018-07-16 18:55:46.714367+08	\N	249	Jonas HECTOR	2	165	2	1	0	1
250	2018-07-16 18:55:46.717252+08	2018-07-16 18:55:46.717252+08	\N	250	Corentin TOLISSO	5	194	2	1	1	0
251	2018-07-16 18:55:46.720965+08	2018-07-16 18:55:46.720965+08	\N	251	Daler KUZIAEV	5	304	2	1	1	0
252	2018-07-16 18:55:46.72323+08	2018-07-16 18:55:46.72323+08	\N	252	Bryan RUIZ	3	270	2	0	1	1
253	2018-07-16 18:55:46.726223+08	2018-07-16 18:55:46.726223+08	\N	253	Stephan LICHTSTEINER	3	267	2	0	0	2
254	2018-07-16 18:55:46.728854+08	2018-07-16 18:55:46.728854+08	\N	254	Lucas BIGLIA	1	54	2	0	2	0
255	2018-07-16 18:55:46.732662+08	2018-07-16 18:55:46.732662+08	\N	255	Alberto RODRIGUEZ	2	135	2	0	2	0
256	2018-07-16 18:55:46.735604+08	2018-07-16 18:55:46.735604+08	\N	256	Yury ZHIRKOV	3	221	2	0	0	2
257	2018-07-16 18:55:46.738579+08	2018-07-16 18:55:46.738579+08	\N	257	Alexander SAMEDOV	5	359	2	0	1	1
258	2018-07-16 18:55:46.742011+08	2018-07-16 18:55:46.742011+08	\N	258	ABDALLA SAID	3	224	2	0	2	0
259	2018-07-16 18:55:46.744625+08	2018-07-16 18:55:46.744625+08	\N	259	Tomoaki MAKINO	1	90	2	0	2	0
260	2018-07-16 18:55:46.747388+08	2018-07-16 18:55:46.747388+08	\N	260	Anibal GODOY	3	242	2	0	2	0
261	2018-07-16 18:55:46.749805+08	2018-07-16 18:55:46.749805+08	\N	261	Maya YOSHIDA	4	360	2	0	2	0
262	2018-07-16 18:55:46.754028+08	2018-07-16 18:55:46.754028+08	\N	262	Danny WELBECK	1	11	2	0	1	1
263	2018-07-16 18:55:46.756316+08	2018-07-16 18:55:46.756316+08	\N	263	Ehsan HAJI SAFI	3	215	2	0	1	1
264	2018-07-16 18:55:46.759131+08	2018-07-16 18:55:46.759131+08	\N	264	Yuto NAGATOMO	4	360	2	0	1	1
265	2018-07-16 18:55:46.764021+08	2018-07-16 18:55:46.764021+08	\N	265	Manuel DA COSTA	3	188	2	0	2	0
266	2018-07-16 18:55:46.766395+08	2018-07-16 18:55:46.766395+08	\N	266	Mesut OEZIL	2	180	2	0	0	2
267	2018-07-16 18:55:46.768598+08	2018-07-16 18:55:46.768598+08	\N	267	Oscar DUARTE	2	180	2	0	1	1
268	2018-07-16 18:55:46.770839+08	2018-07-16 18:55:46.770839+08	\N	268	MOON Seonmin	2	146	2	0	0	2
269	2018-07-16 18:55:46.773233+08	2018-07-16 18:55:46.773233+08	\N	269	Marco FABIAN	1	25	2	0	0	2
270	2018-07-16 18:55:46.776358+08	2018-07-16 18:55:46.776358+08	\N	270	ADRIEN SILVA	3	156	2	0	1	1
271	2018-07-16 18:55:46.778812+08	2018-07-16 18:55:46.778812+08	\N	271	Idrissa Gana GUEYE	3	270	2	0	1	1
272	2018-07-16 18:55:46.781032+08	2018-07-16 18:55:46.781032+08	\N	272	Trent SAINSBURY	3	270	2	0	2	0
273	2018-07-16 18:55:46.783205+08	2018-07-16 18:55:46.783205+08	\N	273	ABDULLAH OTAYF	3	244	2	0	0	2
274	2018-07-16 18:55:46.785389+08	2018-07-16 18:55:46.785389+08	\N	274	Aziz BEHICH	3	270	2	0	1	1
275	2018-07-16 18:55:46.787589+08	2018-07-16 18:55:46.787589+08	\N	275	Carlos BACCA	3	91	2	0	0	2
276	2018-07-16 18:55:46.789952+08	2018-07-16 18:55:46.789952+08	\N	276	Hiroki SAKAI	4	360	2	0	1	1
277	2018-07-16 18:55:46.792296+08	2018-07-16 18:55:46.792296+08	\N	277	AMR WARDA	3	154	2	0	1	1
278	2018-07-16 18:55:46.794912+08	2018-07-16 18:55:46.794912+08	\N	278	Josip PIVARIC	4	201	2	0	1	1
279	2018-07-16 18:55:46.801432+08	2018-07-16 18:55:46.801432+08	\N	279	THIAGO	2	94	2	0	2	0
280	2018-07-16 18:55:46.803727+08	2018-07-16 18:55:46.803727+08	\N	280	Vahid AMIRI	3	266	2	0	2	0
281	2018-07-16 18:55:46.805613+08	2018-07-16 18:55:46.805613+08	\N	281	Davinson SANCHEZ	4	390	2	0	2	0
282	2018-07-16 18:55:46.807678+08	2018-07-16 18:55:46.807678+08	\N	282	Trent ALEXANDER-ARNOLD	1	79	2	0	0	2
283	2018-07-16 18:55:46.809703+08	2018-07-16 18:55:46.809703+08	\N	283	BERNARDO SILVA	4	238	2	0	2	0
284	2018-07-16 18:55:46.812019+08	2018-07-16 18:55:46.812019+08	\N	284	William EKONG	3	270	2	0	1	1
285	2018-07-16 18:55:46.814304+08	2018-07-16 18:55:46.814304+08	\N	285	TAREK HAMED	3	230	2	0	0	2
286	2018-07-16 18:55:46.816457+08	2018-07-16 18:55:46.816457+08	\N	286	Jamie VARDY	4	157	2	0	1	1
287	2018-07-16 18:55:46.81865+08	2018-07-16 18:55:46.81865+08	\N	287	Hordur MAGNUSSON	3	270	2	0	2	0
288	2018-07-16 18:55:46.822453+08	2018-07-16 18:55:46.822453+08	\N	288	Aleksandr EROKHIN	2	89	2	0	2	0
289	2018-07-16 18:55:46.825258+08	2018-07-16 18:55:46.825258+08	\N	289	Manuel AKANJI	4	360	2	0	1	1
290	2018-07-16 18:55:46.827942+08	2018-07-16 18:55:46.827942+08	\N	290	Rafal KURZAWA	1	79	2	0	1	1
291	2018-07-16 18:55:46.830509+08	2018-07-16 18:55:46.830509+08	\N	291	Saman GHODDOS	3	29	2	0	1	1
292	2018-07-16 18:55:46.832859+08	2018-07-16 18:55:46.832859+08	\N	292	Saifeddine KHAOUI	1	90	2	0	1	1
293	2018-07-16 18:55:46.835001+08	2018-07-16 18:55:46.835001+08	\N	293	Javier MASCHERANO	4	360	1	1	0	0
294	2018-07-16 18:55:46.837291+08	2018-07-16 18:55:46.837291+08	\N	294	Felipe BALOY	1	21	1	1	0	0
295	2018-07-16 18:55:46.84398+08	2018-07-16 18:55:46.84398+08	\N	295	FILIPE LUIS	2	170	1	1	0	0
296	2018-07-16 18:55:46.846636+08	2018-07-16 18:55:46.846636+08	\N	296	Kendall WASTON	1	90	1	1	0	0
297	2018-07-16 18:55:46.849144+08	2018-07-16 18:55:46.849144+08	\N	297	Hector MORENO	3	270	1	1	0	0
298	2018-07-16 18:55:46.852219+08	2018-07-16 18:55:46.852219+08	\N	298	Gabriel MERCADO	3	270	1	1	0	0
299	2018-07-16 18:55:46.857227+08	2018-07-16 18:55:46.857227+08	\N	299	Rami BEDOUI	1	90	1	1	0	0
300	2018-07-16 18:55:46.85943+08	2018-07-16 18:55:46.85943+08	\N	300	Maciej RYBUS	2	180	1	1	0	0
301	2018-07-16 18:55:46.861878+08	2018-07-16 18:55:46.861878+08	\N	301	AHMED FATHI	3	270	1	1	0	0
302	2018-07-16 18:55:46.86425+08	2018-07-16 18:55:46.86425+08	\N	302	Marvin PLATTENHARDT	1	79	1	1	0	0
303	2018-07-16 18:55:46.866881+08	2018-07-16 18:55:46.866881+08	\N	303	Haris SEFEROVIC	3	142	1	1	0	0
304	2018-07-16 18:55:46.869189+08	2018-07-16 18:55:46.869189+08	\N	304	MARIO FERNANDES	5	472	1	1	0	0
305	2018-07-16 18:55:46.872943+08	2018-07-16 18:55:46.872943+08	\N	305	Mathias  JORGENSEN	3	219	1	1	0	0
306	2018-07-16 18:55:46.875027+08	2018-07-16 18:55:46.875027+08	\N	306	Gotoku SAKAI	1	90	1	1	0	0
307	2018-07-16 18:55:46.877181+08	2018-07-16 18:55:46.877181+08	\N	307	MUHANNAD ASIRI	2	31	1	1	0	0
308	2018-07-16 18:55:46.880063+08	2018-07-16 18:55:46.880063+08	\N	308	Moussa KONATE	2	25	1	1	0	0
309	2018-07-16 18:55:46.883784+08	2018-07-16 18:55:46.883784+08	\N	309	Ilkay GUENDOGAN	1	59	1	1	0	0
310	2018-07-16 18:55:46.886278+08	2018-07-16 18:55:46.886278+08	\N	310	Andreas CORNELIUS	3	163	1	1	0	0
311	2018-07-16 18:55:46.888785+08	2018-07-16 18:55:46.888785+08	\N	311	Saeid EZATOLAHI	2	166	1	1	0	0
312	2018-07-16 18:55:46.896473+08	2018-07-16 18:55:46.896473+08	\N	312	KIM Younggwon	3	270	1	1	0	0
313	2018-07-16 18:55:46.901198+08	2018-07-16 18:55:46.901198+08	\N	313	Moussa WAGUE	3	196	1	1	0	0
314	2018-07-16 18:55:46.903876+08	2018-07-16 18:55:46.903876+08	\N	314	Nahitan NANDEZ	5	293	1	1	0	0
315	2018-07-16 18:55:46.907052+08	2018-07-16 18:55:46.907052+08	\N	315	John GUIDETTI	2	37	1	1	0	0
316	2018-07-16 18:55:46.910513+08	2018-07-16 18:55:46.910513+08	\N	316	NACHO	2	160	1	1	0	0
317	2018-07-16 18:55:46.913723+08	2018-07-16 18:55:46.913723+08	\N	317	Youssef EN NESYRI	1	18	1	1	0	0
318	2018-07-16 18:55:46.918187+08	2018-07-16 18:55:46.918187+08	\N	318	Keita BALDE	1	80	1	1	0	0
319	2018-07-16 18:55:46.920883+08	2018-07-16 18:55:46.920883+08	\N	319	Jan BEDNAREK	3	225	1	1	0	0
320	2018-07-16 18:55:46.924936+08	2018-07-16 18:55:46.924936+08	\N	320	MOHAMED KANNO	1	15	1	1	0	0
321	2018-07-16 18:55:46.928143+08	2018-07-16 18:55:46.928143+08	\N	321	Dawid KOWNACKI	2	74	1	1	0	0
322	2018-07-16 18:55:46.930988+08	2018-07-16 18:55:46.930988+08	\N	322	Dylan BRONN	2	114	1	1	0	0
323	2018-07-16 18:55:46.938214+08	2018-07-16 18:55:46.938214+08	\N	323	Noureddine AMRABAT	3	256	1	0	1	0
324	2018-07-16 18:55:46.941223+08	2018-07-16 18:55:46.941223+08	\N	324	Pedro AQUINO	3	138	1	0	1	0
325	2018-07-16 18:55:46.944092+08	2018-07-16 18:55:46.944092+08	\N	325	Blas PEREZ	2	163	1	0	0	1
326	2018-07-16 18:55:46.948975+08	2018-07-16 18:55:46.948975+08	\N	326	Tim CAHILL	1	37	1	0	0	1
327	2018-07-16 18:55:46.952313+08	2018-07-16 18:55:46.952313+08	\N	327	Sebastian LARSSON	4	318	1	0	1	0
328	2018-07-16 18:55:46.955004+08	2018-07-16 18:55:46.955004+08	\N	328	Valon BEHRAMI	4	311	1	0	1	0
329	2018-07-16 18:55:46.960888+08	2018-07-16 18:55:46.960888+08	\N	329	Lukasz PISZCZEK	2	173	1	0	1	0
330	2018-07-16 18:55:46.966553+08	2018-07-16 18:55:46.966553+08	\N	330	Oscar MURILLO	1	90	1	0	1	0
331	2018-07-16 18:55:46.969199+08	2018-07-16 18:55:46.969199+08	\N	331	Christian RAMOS	3	270	1	0	0	1
332	2018-07-16 18:55:46.97435+08	2018-07-16 18:55:46.97435+08	\N	332	Robbie KRUSE	3	210	1	0	0	1
333	2018-07-16 18:55:46.976817+08	2018-07-16 18:55:46.976817+08	\N	333	Cristhian STUANI	2	75	1	0	1	0
334	2018-07-16 18:55:46.980122+08	2018-07-16 18:55:46.980122+08	\N	334	Karim EL AHMADI	3	266	1	0	1	0
335	2018-07-16 18:55:46.982786+08	2018-07-16 18:55:46.982786+08	\N	335	Gabriel TORRES	2	73	1	0	1	0
336	2018-07-16 18:55:46.985106+08	2018-07-16 18:55:46.985106+08	\N	336	Armando COOPER	2	180	1	0	1	0
337	2018-07-16 18:55:46.987758+08	2018-07-16 18:55:46.987758+08	\N	337	Eduardo SALVIO	2	146	1	0	0	1
338	2018-07-16 18:55:46.990599+08	2018-07-16 18:55:46.990599+08	\N	338	Kamil GLIK	2	100	1	0	1	0
339	2018-07-16 18:55:46.99292+08	2018-07-16 18:55:46.99292+08	\N	339	David GUZMAN	3	245	1	0	0	1
340	2018-07-16 18:55:46.995409+08	2018-07-16 18:55:46.995409+08	\N	340	Artur JEDRZEJCZYK	1	90	1	0	0	1
341	2018-07-16 18:55:46.998444+08	2018-07-16 18:55:46.998444+08	\N	341	Danny ROSE	5	203	1	0	1	0
342	2018-07-16 18:55:47.000993+08	2018-07-16 18:55:47.000993+08	\N	342	Alfred NDIAYE	2	152	1	0	0	1
343	2018-07-16 18:55:47.003719+08	2018-07-16 18:55:47.003719+08	\N	343	KIM Minwoo	2	146	1	0	0	1
344	2018-07-16 18:55:47.006635+08	2018-07-16 18:55:47.006635+08	\N	344	Shinji OKAZAKI	3	67	1	0	0	1
345	2018-07-16 18:55:47.010251+08	2018-07-16 18:55:47.010251+08	\N	345	MOHAMMED ALSAHLAWI	2	97	1	0	0	1
346	2018-07-16 18:55:47.016907+08	2018-07-16 18:55:47.016907+08	\N	346	Makoto HASEBE	4	279	1	0	0	1
347	2018-07-16 18:55:47.019284+08	2018-07-16 18:55:47.019284+08	\N	347	MIRANDA	5	450	1	0	1	0
348	2018-07-16 18:55:47.021838+08	2018-07-16 18:55:47.021838+08	\N	348	KOO Jacheol	2	129	1	0	1	0
349	2018-07-16 18:55:47.024058+08	2018-07-16 18:55:47.024058+08	\N	349	Nabil DIRAR	2	180	1	0	1	0
350	2018-07-16 18:55:47.026373+08	2018-07-16 18:55:47.026373+08	\N	350	Mbark BOUSSOUFA	3	270	1	0	1	0
351	2018-07-16 18:55:47.028667+08	2018-07-16 18:55:47.028667+08	\N	351	Mikael LUSTIG	4	352	1	0	1	0
352	2018-07-16 18:55:47.031186+08	2018-07-16 18:55:47.031186+08	\N	352	Emil HALLFREDSSON	2	180	1	0	1	0
353	2018-07-16 18:55:47.034219+08	2018-07-16 18:55:47.034219+08	\N	353	Rurik GISLASON	2	117	1	0	1	0
354	2018-07-16 18:55:47.036654+08	2018-07-16 18:55:47.036654+08	\N	354	Alan DZAGOEV	2	42	1	0	0	1
355	2018-07-16 18:55:47.03871+08	2018-07-16 18:55:47.03871+08	\N	355	Simon KJAER	4	390	1	0	1	0
356	2018-07-16 18:55:47.041356+08	2018-07-16 18:55:47.041356+08	\N	356	KOKE	3	229	1	0	1	0
357	2018-07-16 18:55:47.043707+08	2018-07-16 18:55:47.043707+08	\N	357	Santiago ARIAS	4	386	1	0	0	1
358	2018-07-16 18:55:47.046327+08	2018-07-16 18:55:47.046327+08	\N	358	Enzo PEREZ	3	195	1	0	1	0
359	2018-07-16 18:55:47.050999+08	2018-07-16 18:55:47.050999+08	\N	359	Adem LJAJIC	3	171	1	0	0	1
360	2018-07-16 18:55:47.053265+08	2018-07-16 18:55:47.053265+08	\N	360	Mame DIOUF	2	66	1	0	1	0
361	2018-07-16 18:55:47.055988+08	2018-07-16 18:55:47.055988+08	\N	361	Viktor FISCHER	1	30	1	0	0	1
362	2018-07-16 18:55:47.059236+08	2018-07-16 18:55:47.059236+08	\N	362	Luis MURIEL	2	91	1	0	0	1
363	2018-07-16 18:55:47.066818+08	2018-07-16 18:55:47.066818+08	\N	363	Francisco CALVO	2	105	1	0	1	0
364	2018-07-16 18:55:47.068996+08	2018-07-16 18:55:47.068996+08	\N	364	Pape Alioune NDIAYE	1	81	1	0	1	0
365	2018-07-16 18:55:47.072097+08	2018-07-16 18:55:47.072097+08	\N	365	Omid EBRAHIMI	3	261	1	0	1	0
366	2018-07-16 18:55:47.075336+08	2018-07-16 18:55:47.075336+08	\N	366	Michael LANG	3	102	1	0	0	1
367	2018-07-16 18:55:47.077753+08	2018-07-16 18:55:47.077753+08	\N	367	Fabian SCHAER	3	270	1	0	1	0
368	2018-07-16 18:55:47.081729+08	2018-07-16 18:55:47.081729+08	\N	368	Raul JIMENEZ	2	54	1	0	0	1
369	2018-07-16 18:55:47.086369+08	2018-07-16 18:55:47.086369+08	\N	369	Phil JONES	2	180	1	0	1	0
370	2018-07-16 18:55:47.089383+08	2018-07-16 18:55:47.089383+08	\N	370	Dedryck BOYATA	3	270	1	0	1	0
371	2018-07-16 18:55:47.092608+08	2018-07-16 18:55:47.092608+08	\N	371	Arkadiusz MILIK	1	73	1	0	1	0
372	2018-07-16 18:55:47.09466+08	2018-07-16 18:55:47.09466+08	\N	372	LEE Yong	3	270	1	0	1	0
373	2018-07-16 18:55:47.098066+08	2018-07-16 18:55:47.098066+08	\N	373	Lukasz TEODORCZYK	2	30	1	0	0	1
374	2018-07-16 18:55:47.100547+08	2018-07-16 18:55:47.100547+08	\N	374	Diego LAXALT	4	301	1	0	1	0
375	2018-07-16 18:55:47.104183+08	2018-07-16 18:55:47.104183+08	\N	375	JOAO MARIO	4	260	1	0	1	0
376	2018-07-16 18:55:47.106806+08	2018-07-16 18:55:47.106806+08	\N	376	Marko PJACA	3	83	1	0	0	1
377	2018-07-16 18:55:47.109398+08	2018-07-16 18:55:47.109398+08	\N	377	Lucas TORREIRA	5	304	1	0	0	1
378	2018-07-16 18:55:47.112145+08	2018-07-16 18:55:47.112145+08	\N	378	Cristian PAVON	4	153	1	0	0	1
379	2018-07-16 18:55:47.11585+08	2018-07-16 18:55:47.11585+08	\N	379	Pontus JANSSON	2	96	1	0	1	0
380	2018-07-16 18:55:47.124138+08	2018-07-16 18:55:47.124138+08	\N	380	Andrija ZIVKOVIC	1	15	1	0	1	0
381	2018-07-16 18:55:47.127431+08	2018-07-16 18:55:47.127431+08	\N	381	WILLIAM	4	360	1	0	0	1
382	2018-07-16 18:55:47.129508+08	2018-07-16 18:55:47.129508+08	\N	382	ANDRE SILVA	3	115	1	0	1	0
383	2018-07-16 18:55:47.133299+08	2018-07-16 18:55:47.133299+08	\N	383	Ramin REZAEIAN	3	270	1	0	1	0
384	2018-07-16 18:55:47.136132+08	2018-07-16 18:55:47.136132+08	\N	384	Gen SHOJI	3	270	1	0	1	0
385	2018-07-16 18:55:47.139683+08	2018-07-16 18:55:47.139683+08	\N	385	LEE Seungwoo	2	43	1	0	0	1
386	2018-07-16 18:55:47.141923+08	2018-07-16 18:55:47.141923+08	\N	386	Renato TAPIA	2	150	1	0	0	1
387	2018-07-16 18:55:47.144771+08	2018-07-16 18:55:47.144771+08	\N	387	Paulo DYBALA	1	22	1	0	1	0
388	2018-07-16 18:55:47.147302+08	2018-07-16 18:55:47.147302+08	\N	388	Johan MOJICA	4	390	1	0	1	0
389	2018-07-16 18:55:47.150808+08	2018-07-16 18:55:47.150808+08	\N	389	Jefferson  LERMA	4	175	1	0	0	1
390	2018-07-16 18:55:47.153747+08	2018-07-16 18:55:47.153747+08	\N	390	Cheikh NDOYE	2	37	1	0	1	0
391	2018-07-16 18:55:47.156934+08	2018-07-16 18:55:47.156934+08	\N	391	Joshua RISDON	3	270	1	0	0	1
392	2018-07-16 18:55:47.159573+08	2018-07-16 18:55:47.159573+08	\N	392	Ghanem SAISS	2	180	1	0	1	0
393	2018-07-16 18:55:47.162932+08	2018-07-16 18:55:47.162932+08	\N	393	Ngolo KANTE	7	595	1	0	0	1
394	2018-07-16 18:55:47.166036+08	2018-07-16 18:55:47.166036+08	\N	394	Achraf HAKIMI	3	270	1	0	0	1
395	2018-07-16 18:55:47.168534+08	2018-07-16 18:55:47.168534+08	\N	395	Jon BODVARSSON	1	71	1	0	1	0
396	2018-07-16 18:55:47.171069+08	2018-07-16 18:55:47.171069+08	\N	396	Arnor TRAUSTASON	1	1	1	0	1	0
397	2018-07-16 18:55:47.176988+08	2018-07-16 18:55:47.176988+08	\N	397	Marcos ACUNA	1	90	1	0	0	1
398	2018-07-16 18:55:47.179339+08	2018-07-16 18:55:47.179339+08	\N	398	ALI GABR	3	270	1	0	1	0
399	2018-07-16 18:55:47.181856+08	2018-07-16 18:55:47.181856+08	\N	399	Thomas LEMAR	1	90	1	0	0	1
400	2018-07-16 18:55:47.184335+08	2018-07-16 18:55:47.184335+08	\N	400	Jacek GORALSKI	2	180	1	0	1	0
401	2018-07-16 18:55:47.186599+08	2018-07-16 18:55:47.186599+08	\N	401	Jesus GALLARDO	4	335	1	0	1	0
402	2018-07-16 18:55:47.1887+08	2018-07-16 18:55:47.1887+08	\N	402	Roozbeh CHESHMI	1	90	1	0	1	0
403	2018-07-16 18:55:47.190967+08	2018-07-16 18:55:47.190967+08	\N	403	Ghaylen CHAALELI	1	90	1	0	0	1
404	2018-07-16 18:55:47.193419+08	2018-07-16 18:55:47.193419+08	\N	404	Ricardo AVILA	2	109	1	0	1	0
405	2018-07-16 18:55:47.19559+08	2018-07-16 18:55:47.19559+08	\N	405	Ayoub EL KAABI	2	99	1	0	1	0
\.


--
-- Data for Name: players_statistic_with_top_saves; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.players_statistic_with_top_saves (id, created_at, updated_at, deleted_at, rank, player_name, matched_played, minutes_played, saves_number, save_rate) FROM stdin;
1	2018-07-16 18:55:43.395722+08	2018-07-16 18:55:43.395722+08	\N	1	Thibaut COURTOIS	7	630	27	81.8%
2	2018-07-16 18:55:43.401822+08	2018-07-16 18:55:43.401822+08	\N	2	Guillermo OCHOA	4	360	25	80.6%
3	2018-07-16 18:55:43.405162+08	2018-07-16 18:55:43.405162+08	\N	3	Kasper  SCHMEICHEL	4	390	21	91.3%
4	2018-07-16 18:55:43.408381+08	2018-07-16 18:55:43.408381+08	\N	4	Jordan PICKFORD	7	690	17	68.0%
5	2018-07-16 18:55:43.411472+08	2018-07-16 18:55:43.411472+08	\N	5	Igor AKINFEEV	5	510	15	68.2%
6	2018-07-16 18:55:43.4146+08	2018-07-16 18:55:43.4146+08	\N	6	Danijel SUBASIC	6	630	15	65.2%
7	2018-07-16 18:55:43.417611+08	2018-07-16 18:55:43.417611+08	\N	7	Eiji KAWASHIMA	4	360	14	66.7%
8	2018-07-16 18:55:43.421009+08	2018-07-16 18:55:43.421009+08	\N	8	JO Hyeonwoo	3	270	13	81.2%
9	2018-07-16 18:55:43.4254+08	2018-07-16 18:55:43.4254+08	\N	9	Yann SOMMER	4	360	12	70.6%
10	2018-07-16 18:55:43.42865+08	2018-07-16 18:55:43.42865+08	\N	10	Hugo LLORIS	6	540	12	66.7%
11	2018-07-16 18:55:43.431773+08	2018-07-16 18:55:43.431773+08	\N	11	Fernando MUSLERA	5	450	11	78.6%
12	2018-07-16 18:55:43.434873+08	2018-07-16 18:55:43.434873+08	\N	12	Manuel NEUER	3	270	11	73.3%
13	2018-07-16 18:55:43.438356+08	2018-07-16 18:55:43.438356+08	\N	13	Robin OLSEN	5	450	11	73.3%
14	2018-07-16 18:55:43.441755+08	2018-07-16 18:55:43.441755+08	\N	14	David OSPINA	4	390	10	76.9%
15	2018-07-16 18:55:43.445098+08	2018-07-16 18:55:43.445098+08	\N	15	Vladimir STOJKOVIC	3	270	10	71.4%
16	2018-07-16 18:55:43.449837+08	2018-07-16 18:55:43.449837+08	\N	16	Keylor NAVAS	3	270	10	66.7%
17	2018-07-16 18:55:43.453243+08	2018-07-16 18:55:43.453243+08	\N	17	Mathew RYAN	3	270	10	66.7%
18	2018-07-16 18:55:43.457394+08	2018-07-16 18:55:43.457394+08	\N	18	Hannes HALLDORSSON	3	270	9	64.3%
19	2018-07-16 18:55:43.460485+08	2018-07-16 18:55:43.460485+08	\N	19	Farouk BEN MUSTAPHA	2	165	9	60.0%
20	2018-07-16 18:55:43.463577+08	2018-07-16 18:55:43.463577+08	\N	20	Jaime PENEDO	3	270	9	45.0%
21	2018-07-16 18:55:43.467829+08	2018-07-16 18:55:43.467829+08	\N	21	RUI PATRICIO	4	360	8	57.1%
22	2018-07-16 18:55:43.471046+08	2018-07-16 18:55:43.471046+08	\N	22	Pedro GALLESE	3	270	7	77.8%
23	2018-07-16 18:55:43.473871+08	2018-07-16 18:55:43.473871+08	\N	23	Ali BEIRANVAND	3	270	7	77.8%
24	2018-07-16 18:55:43.476815+08	2018-07-16 18:55:43.476815+08	\N	24	Francis UZOHO	3	270	6	60.0%
25	2018-07-16 18:55:43.47914+08	2018-07-16 18:55:43.47914+08	\N	25	Lovre KALINIC	1	90	5	83.3%
26	2018-07-16 18:55:43.481586+08	2018-07-16 18:55:43.481586+08	\N	26	ESSAM ELHADARY	1	90	5	71.4%
27	2018-07-16 18:55:43.483962+08	2018-07-16 18:55:43.483962+08	\N	27	ALISSON	5	450	5	62.5%
28	2018-07-16 18:55:43.486542+08	2018-07-16 18:55:43.486542+08	\N	28	Khadim NDIAYE	3	270	5	55.6%
29	2018-07-16 18:55:43.489205+08	2018-07-16 18:55:43.489205+08	\N	29	Aymen MATHLOUTHI	1	90	4	80.0%
30	2018-07-16 18:55:43.491852+08	2018-07-16 18:55:43.491852+08	\N	30	Wilfredo CABALLERO	2	180	4	50.0%
31	2018-07-16 18:55:43.494988+08	2018-07-16 18:55:43.494988+08	\N	31	Monir EL KAJOUI	3	270	4	50.0%
32	2018-07-16 18:55:43.497876+08	2018-07-16 18:55:43.497876+08	\N	32	MOHAMED ELSHENAWY	2	180	4	50.0%
33	2018-07-16 18:55:43.500799+08	2018-07-16 18:55:43.500799+08	\N	33	Lukasz FABIANSKI	1	90	3	100.0%
34	2018-07-16 18:55:43.50324+08	2018-07-16 18:55:43.50324+08	\N	34	MOHAMMED ALOWAIS	1	90	3	75.0%
35	2018-07-16 18:55:43.505914+08	2018-07-16 18:55:43.505914+08	\N	35	Mouez HASSEN	1	15	2	66.7%
36	2018-07-16 18:55:43.50836+08	2018-07-16 18:55:43.50836+08	\N	36	Franco ARMANI	2	180	2	28.6%
37	2018-07-16 18:55:43.510806+08	2018-07-16 18:55:43.510806+08	\N	37	ABDULLAH ALMUAIOUF	1	90	2	28.6%
38	2018-07-16 18:55:43.51337+08	2018-07-16 18:55:43.51337+08	\N	38	Steve MANDANDA	1	90	1	100.0%
39	2018-07-16 18:55:43.516075+08	2018-07-16 18:55:43.516075+08	\N	39	Wojciech SZCZESNY	2	180	1	16.7%
40	2018-07-16 18:55:43.518866+08	2018-07-16 18:55:43.518866+08	\N	40	David DE GEA	4	390	1	14.3%
\.


--
-- Data for Name: team_statistic_with_attempts; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.team_statistic_with_attempts (id, created_at, updated_at, deleted_at, rank, team_name, matches_payed, shots_number, attempts_on_target, attempts_off_target, shots_blocked_number) FROM stdin;
1	2018-07-21 08:25:27.19947+08	2018-07-21 08:25:27.19947+08	\N	1	Croatia	7	115	29	58	28
2	2018-07-21 08:25:27.202571+08	2018-07-21 08:25:27.202571+08	\N	2	Belgium	7	106	40	40	26
3	2018-07-21 08:25:27.205138+08	2018-07-21 08:25:27.205138+08	\N	3	Brazil	5	103	38	35	30
4	2018-07-21 08:25:27.207899+08	2018-07-21 08:25:27.207899+08	\N	4	England	7	96	25	43	28
5	2018-07-21 08:25:27.210393+08	2018-07-21 08:25:27.210393+08	\N	5	France	7	83	30	36	17
6	2018-07-21 08:25:27.212805+08	2018-07-21 08:25:27.212805+08	\N	6	Spain	4	70	21	28	21
7	2018-07-21 08:25:27.215656+08	2018-07-21 08:25:27.215656+08	\N	7	Germany	3	67	20	24	23
8	2018-07-21 08:25:27.218545+08	2018-07-21 08:25:27.218545+08	\N	8	Uruguay	5	61	22	26	13
9	2018-07-21 08:25:27.221137+08	2018-07-21 08:25:27.221137+08	\N	9	Mexico	4	57	13	24	20
10	2018-07-21 08:25:27.224047+08	2018-07-21 08:25:27.224047+08	\N	10	Switzerland	4	56	14	22	20
11	2018-07-21 08:25:27.226614+08	2018-07-21 08:25:27.226614+08	\N	11	Sweden	5	55	21	22	12
12	2018-07-21 08:25:27.229015+08	2018-07-21 08:25:27.229015+08	\N	12	Argentina	4	53	18	16	19
13	2018-07-21 08:25:27.231727+08	2018-07-21 08:25:27.231727+08	\N	13	Portugal	4	52	14	20	18
14	2018-07-21 08:25:27.234475+08	2018-07-21 08:25:27.234475+08	\N	14	Russia	5	46	19	16	11
15	2018-07-21 08:25:27.237036+08	2018-07-21 08:25:27.237036+08	\N	15	Japan	4	42	16	15	11
16	2018-07-21 08:25:27.239009+08	2018-07-21 08:25:27.239009+08	\N	16	Denmark	4	40	12	22	6
17	2018-07-21 08:25:27.241693+08	2018-07-21 08:25:27.241693+08	\N	17	Colombia	4	39	12	14	13
18	2018-07-21 08:25:27.243908+08	2018-07-21 08:25:27.243908+08	\N	18	Nigeria	3	39	9	16	14
19	2018-07-21 08:25:27.246461+08	2018-07-21 08:25:27.246461+08	\N	19	Tunisia	3	36	13	13	10
20	2018-07-21 08:25:27.249118+08	2018-07-21 08:25:27.249118+08	\N	20	Iceland	3	36	12	19	5
21	2018-07-21 08:25:27.251817+08	2018-07-21 08:25:27.251817+08	\N	21	Saudi Arabia	3	36	10	16	10
22	2018-07-21 08:25:27.254767+08	2018-07-21 08:25:27.254767+08	\N	22	Morocco	3	35	10	18	7
23	2018-07-21 08:25:27.25931+08	2018-07-21 08:25:27.25931+08	\N	24	Peru	3	32	11	14	7
24	2018-07-21 08:25:27.261985+08	2018-07-21 08:25:27.261985+08	\N	25	Australia	3	32	8	14	10
25	2018-07-21 08:25:27.266224+08	2018-07-21 08:25:27.266224+08	\N	26	Serbia	3	32	7	17	8
26	2018-07-21 08:25:27.269351+08	2018-07-21 08:25:27.269351+08	\N	27	Senegal	3	30	12	13	5
27	2018-07-21 08:25:27.271823+08	2018-07-21 08:25:27.271823+08	\N	28	Poland	3	30	8	13	9
28	2018-07-21 08:25:27.274644+08	2018-07-21 08:25:27.274644+08	\N	29	Egypt	3	29	5	17	7
29	2018-07-21 08:25:27.277236+08	2018-07-21 08:25:27.277236+08	\N	30	Costa Rica	3	28	9	13	6
30	2018-07-21 08:25:27.28009+08	2018-07-21 08:25:27.28009+08	\N	31	Panama	3	23	8	13	2
31	2018-07-21 08:25:27.282948+08	2018-07-21 08:25:27.282948+08	\N	32	IR Iran	3	21	4	15	2
\.


--
-- Data for Name: team_statistic_with_disciplinaries; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.team_statistic_with_disciplinaries (id, created_at, updated_at, deleted_at, rank, team_name, matches_payed, yellow_cards, second_yellow_cards, red_cards, fouls_committed, fouls_suffered, fouls_causing_penalty) FROM stdin;
1	2018-07-21 08:25:27.684814+08	2018-07-21 08:25:27.684814+08	\N	1	Colombia	4	9	0	1	63	52	2
2	2018-07-21 08:25:27.696522+08	2018-07-21 08:25:27.696522+08	\N	2	Switzerland	4	9	0	1	53	53	1
3	2018-07-21 08:25:27.700197+08	2018-07-21 08:25:27.700197+08	\N	3	Russia	5	6	1	0	95	56	1
4	2018-07-21 08:25:27.704278+08	2018-07-21 08:25:27.704278+08	\N	4	Germany	3	2	1	0	29	39	0
5	2018-07-21 08:25:27.708422+08	2018-07-21 08:25:27.708422+08	\N	5	Croatia	7	15	0	0	114	105	2
6	2018-07-21 08:25:27.712524+08	2018-07-21 08:25:27.712524+08	\N	6	France	7	12	0	0	93	103	1
7	2018-07-21 08:25:27.716092+08	2018-07-21 08:25:27.716092+08	\N	7	Belgium	7	11	0	0	99	75	0
8	2018-07-21 08:25:27.719508+08	2018-07-21 08:25:27.719508+08	\N	8	Argentina	4	11	0	0	55	75	2
9	2018-07-21 08:25:27.723883+08	2018-07-21 08:25:27.723883+08	\N	9	Panama	3	11	0	0	49	48	2
10	2018-07-21 08:25:27.729899+08	2018-07-21 08:25:27.729899+08	\N	11	Mexico	4	9	0	0	54	47	1
11	2018-07-21 08:25:27.732571+08	2018-07-21 08:25:27.732571+08	\N	12	Serbia	3	9	0	0	45	37	0
12	2018-07-21 08:25:27.734789+08	2018-07-21 08:25:27.734789+08	\N	13	England	7	8	0	0	72	100	1
13	2018-07-21 08:25:27.737678+08	2018-07-21 08:25:27.737678+08	\N	14	Sweden	5	8	0	0	65	64	0
14	2018-07-21 08:25:27.740305+08	2018-07-21 08:25:27.740305+08	\N	15	Morocco	3	8	0	0	62	36	0
15	2018-07-21 08:25:27.74322+08	2018-07-21 08:25:27.74322+08	\N	16	Portugal	4	7	0	0	55	59	1
16	2018-07-21 08:25:27.746232+08	2018-07-21 08:25:27.746232+08	\N	17	Brazil	5	7	0	0	50	73	0
17	2018-07-21 08:25:27.750156+08	2018-07-21 08:25:27.750156+08	\N	18	IR Iran	3	7	0	0	44	45	1
18	2018-07-21 08:25:27.752837+08	2018-07-21 08:25:27.752837+08	\N	19	Australia	3	7	0	0	37	30	1
19	2018-07-21 08:25:27.755684+08	2018-07-21 08:25:27.755684+08	\N	20	Denmark	4	6	0	0	54	28	3
20	2018-07-21 08:25:27.758548+08	2018-07-21 08:25:27.758548+08	\N	21	Senegal	3	6	0	0	44	30	0
21	2018-07-21 08:25:27.761067+08	2018-07-21 08:25:27.761067+08	\N	22	Costa Rica	3	6	0	0	43	35	0
22	2018-07-21 08:25:27.763809+08	2018-07-21 08:25:27.763809+08	\N	23	Egypt	3	5	0	0	38	21	2
23	2018-07-21 08:25:27.766496+08	2018-07-21 08:25:27.766496+08	\N	24	Japan	4	5	0	0	37	48	0
24	2018-07-21 08:25:27.769086+08	2018-07-21 08:25:27.769086+08	\N	25	Peru	3	5	0	0	37	38	0
25	2018-07-21 08:25:27.771798+08	2018-07-21 08:25:27.771798+08	\N	26	Tunisia	3	4	0	0	46	35	1
26	2018-07-21 08:25:27.774368+08	2018-07-21 08:25:27.774368+08	\N	27	Nigeria	3	4	0	0	45	44	2
27	2018-07-21 08:25:27.776702+08	2018-07-21 08:25:27.776702+08	\N	28	Uruguay	5	3	0	0	63	69	0
28	2018-07-21 08:25:27.778882+08	2018-07-21 08:25:27.778882+08	\N	29	Iceland	3	3	0	0	35	27	1
29	2018-07-21 08:25:27.781547+08	2018-07-21 08:25:27.781547+08	\N	30	Poland	3	3	0	0	31	33	0
30	2018-07-21 08:25:27.783964+08	2018-07-21 08:25:27.783964+08	\N	31	Spain	4	2	0	0	34	59	2
31	2018-07-21 08:25:27.786712+08	2018-07-21 08:25:27.786712+08	\N	32	Saudi Arabia	3	1	0	0	30	45	0
\.


--
-- Data for Name: team_statistic_with_top_goals; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.team_statistic_with_top_goals (id, created_at, updated_at, deleted_at, rank, team_name, matches_payed, goals_for, goals_scored, goals_against, penalty_goal, own_goals, open_play_goals, set_piece_goals) FROM stdin;
1	2018-07-21 08:25:26.714731+08	2018-07-21 08:25:26.714731+08	\N	1	Belgium	7	16	15	6	1	1	14	1
2	2018-07-21 08:25:26.719417+08	2018-07-21 08:25:26.719417+08	\N	2	France	7	14	12	6	3	2	9	3
3	2018-07-21 08:25:26.722111+08	2018-07-21 08:25:26.722111+08	\N	3	Croatia	7	14	13	9	1	1	12	1
4	2018-07-21 08:25:26.725217+08	2018-07-21 08:25:26.725217+08	\N	4	England	7	12	12	8	3	0	8	4
5	2018-07-21 08:25:26.72812+08	2018-07-21 08:25:26.72812+08	\N	5	Russia	5	11	10	7	1	1	8	2
6	2018-07-21 08:25:26.730719+08	2018-07-21 08:25:26.730719+08	\N	6	Brazil	5	8	8	3	0	0	8	0
7	2018-07-21 08:25:26.733292+08	2018-07-21 08:25:26.733292+08	\N	7	Uruguay	5	7	6	3	0	1	5	1
8	2018-07-21 08:25:26.736156+08	2018-07-21 08:25:26.736156+08	\N	8	Spain	4	7	6	6	0	1	6	0
9	2018-07-21 08:25:26.739115+08	2018-07-21 08:25:26.739115+08	\N	9	Colombia	4	6	6	3	0	0	5	1
10	2018-07-21 08:25:26.741661+08	2018-07-21 08:25:26.741661+08	\N	10	Sweden	5	6	5	4	2	1	3	2
11	2018-07-21 08:25:26.744331+08	2018-07-21 08:25:26.744331+08	\N	11	Portugal	4	6	6	6	1	0	4	2
12	2018-07-21 08:25:26.747403+08	2018-07-21 08:25:26.747403+08	\N	12	Japan	4	6	6	7	1	0	5	1
13	2018-07-21 08:25:26.750331+08	2018-07-21 08:25:26.750331+08	\N	13	Argentina	4	6	6	9	0	0	6	0
14	2018-07-21 08:25:26.752843+08	2018-07-21 08:25:26.752843+08	\N	14	Switzerland	4	5	5	5	0	0	5	0
15	2018-07-21 08:25:26.755916+08	2018-07-21 08:25:26.755916+08	\N	15	Tunisia	3	5	5	8	1	0	4	1
16	2018-07-21 08:25:26.758709+08	2018-07-21 08:25:26.758709+08	\N	16	Senegal	3	4	3	4	0	1	3	0
17	2018-07-21 08:25:26.761759+08	2018-07-21 08:25:26.761759+08	\N	17	Denmark	4	3	3	2	0	0	3	0
18	2018-07-21 08:25:26.768465+08	2018-07-21 08:25:26.768465+08	\N	19	Nigeria	3	3	3	4	1	0	2	1
19	2018-07-21 08:25:26.771376+08	2018-07-21 08:25:26.771376+08	\N	20	Mexico	4	3	3	6	1	0	2	1
20	2018-07-21 08:25:26.774879+08	2018-07-21 08:25:26.774879+08	\N	21	IR Iran	3	2	1	2	1	1	0	1
21	2018-07-21 08:25:26.777452+08	2018-07-21 08:25:26.777452+08	\N	22	Peru	3	2	2	2	0	0	2	0
22	2018-07-21 08:25:26.781942+08	2018-07-21 08:25:26.781942+08	\N	23	Morocco	3	2	2	4	0	0	2	0
23	2018-07-21 08:25:26.784904+08	2018-07-21 08:25:26.784904+08	\N	24	Germany	3	2	2	4	0	0	2	0
24	2018-07-21 08:25:26.788082+08	2018-07-21 08:25:26.788082+08	\N	25	Serbia	3	2	2	4	0	0	1	1
25	2018-07-21 08:25:26.790998+08	2018-07-21 08:25:26.790998+08	\N	26	Costa Rica	3	2	1	5	0	1	1	0
26	2018-07-21 08:25:26.79415+08	2018-07-21 08:25:26.79415+08	\N	27	Iceland	3	2	2	5	1	0	1	1
27	2018-07-21 08:25:26.797234+08	2018-07-21 08:25:26.797234+08	\N	28	Poland	3	2	2	5	0	0	2	0
28	2018-07-21 08:25:26.801039+08	2018-07-21 08:25:26.801039+08	\N	29	Australia	3	2	2	5	2	0	0	2
29	2018-07-21 08:25:26.804112+08	2018-07-21 08:25:26.804112+08	\N	30	Egypt	3	2	2	6	1	0	1	1
30	2018-07-21 08:25:26.806703+08	2018-07-21 08:25:26.806703+08	\N	31	Saudi Arabia	3	2	2	7	1	0	1	1
31	2018-07-21 08:25:26.81012+08	2018-07-21 08:25:26.81012+08	\N	32	Panama	3	2	1	11	0	1	1	0
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.teams (id, created_at, updated_at, deleted_at, flag_address, team_name) FROM stdin;
1	2018-07-16 18:55:31.630457+08	2018-07-16 18:55:31.630457+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/arg	Argentina
2	2018-07-16 18:55:31.633821+08	2018-07-16 18:55:31.633821+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/aus	Australia
3	2018-07-16 18:55:31.636135+08	2018-07-16 18:55:31.636135+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/bel	Belgium
4	2018-07-16 18:55:31.638721+08	2018-07-16 18:55:31.638721+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/bra	Brazil
5	2018-07-16 18:55:31.641307+08	2018-07-16 18:55:31.641307+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/col	Colombia
6	2018-07-16 18:55:31.643808+08	2018-07-16 18:55:31.643808+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/crc	Costa Rica
7	2018-07-16 18:55:31.646004+08	2018-07-16 18:55:31.646004+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/cro	Croatia
8	2018-07-16 18:55:31.648068+08	2018-07-16 18:55:31.648068+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/den	Denmark
9	2018-07-16 18:55:31.65031+08	2018-07-16 18:55:31.65031+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/egy	Egypt
10	2018-07-16 18:55:31.652267+08	2018-07-16 18:55:31.652267+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/eng	England
11	2018-07-16 18:55:31.654521+08	2018-07-16 18:55:31.654521+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/fra	France
12	2018-07-16 18:55:31.657276+08	2018-07-16 18:55:31.657276+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/ger	Germany
13	2018-07-16 18:55:31.661427+08	2018-07-16 18:55:31.661427+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/isl	Iceland
14	2018-07-16 18:55:31.663496+08	2018-07-16 18:55:31.663496+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/irn	IR Iran
15	2018-07-16 18:55:31.66562+08	2018-07-16 18:55:31.66562+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/jpn	Japan
16	2018-07-16 18:55:31.668173+08	2018-07-16 18:55:31.668173+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/kor	Korea Republic
17	2018-07-16 18:55:31.67005+08	2018-07-16 18:55:31.67005+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/mex	Mexico
18	2018-07-16 18:55:31.674561+08	2018-07-16 18:55:31.674561+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/mar	Morocco
19	2018-07-16 18:55:31.676594+08	2018-07-16 18:55:31.676594+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/nga	Nigeria
20	2018-07-16 18:55:31.678595+08	2018-07-16 18:55:31.678595+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/pan	Panama
21	2018-07-16 18:55:31.680742+08	2018-07-16 18:55:31.680742+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/per	Peru
22	2018-07-16 18:55:31.683+08	2018-07-16 18:55:31.683+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/pol	Poland
23	2018-07-16 18:55:31.685177+08	2018-07-16 18:55:31.685177+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/por	Portugal
24	2018-07-16 18:55:31.687694+08	2018-07-16 18:55:31.687694+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/rus	Russia
25	2018-07-16 18:55:31.690117+08	2018-07-16 18:55:31.690117+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/ksa	Saudi Arabia
26	2018-07-16 18:55:31.692738+08	2018-07-16 18:55:31.692738+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/sen	Senegal
27	2018-07-16 18:55:31.695201+08	2018-07-16 18:55:31.695201+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/srb	Serbia
28	2018-07-16 18:55:31.697443+08	2018-07-16 18:55:31.697443+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/esp	Spain
29	2018-07-16 18:55:31.699654+08	2018-07-16 18:55:31.699654+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/swe	Sweden
30	2018-07-16 18:55:31.701812+08	2018-07-16 18:55:31.701812+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/sui	Switzerland
31	2018-07-16 18:55:31.704141+08	2018-07-16 18:55:31.704141+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/tun	Tunisia
32	2018-07-16 18:55:31.706547+08	2018-07-16 18:55:31.706547+08	\N	https://api.fifa.com/api/v1/picture/flags-fwc2018-5/uru	Uruguay
\.


--
-- Data for Name: world_cup_archives; Type: TABLE DATA; Schema: public; Owner: xiewei
--

COPY public.world_cup_archives (id, created_at, updated_at, deleted_at, world_cup_url, country_name, year, winner_country, runners_up_name, third_name, fourth_name, final_result, title) FROM stdin;
1	2018-07-16 18:55:52.79912+08	2018-07-16 18:55:52.79912+08	\N	https://www.fifa.com/worldcup/archive/uruguay1930/index.html	Uruguay	1930	Uruguay	Argentina	USA	Yugoslavia	Uruguay vs Argentina : score : 4-2	1930 FIFA World Cup Uruguay ™13 July - 30 July
2	2018-07-16 18:55:54.426257+08	2018-07-16 18:55:54.426257+08	\N	https://www.fifa.com/worldcup/archive/italy1934/index.html	Italy	1934	Italy	Czechoslovakia	Germany	Austria	Italy vs Czechoslovakia : score : 2-1	1934 FIFA World Cup Italy ™27 May - 10 June
3	2018-07-16 18:55:56.145004+08	2018-07-16 18:55:56.145004+08	\N	https://www.fifa.com/worldcup/archive/france1938/index.html	France	1938	Italy	Hungary	Brazil	Sweden	Italy vs Hungary : score : 4-2	1938 FIFA World Cup France ™04 June - 19 June
4	2018-07-16 18:55:57.680854+08	2018-07-16 18:55:57.680854+08	\N	https://www.fifa.com/worldcup/archive/brazil1950/index.html	Brazil	1950	Uruguay	Brazil	Sweden	Spain	Uruguay vs Brazil : score : 2-1	1950 FIFA World Cup Brazil ™24 June - 16 July
5	2018-07-16 18:55:59.240568+08	2018-07-16 18:55:59.240568+08	\N	https://www.fifa.com/worldcup/archive/switzerland1954/index.html	Switzerland	1954	Germany FR	Hungary	Austria	Uruguay	Germany FR vs Hungary : score : 3-2	1954 FIFA World Cup Switzerland ™16 June - 04 July
6	2018-07-16 18:56:01.04829+08	2018-07-16 18:56:01.04829+08	\N	https://www.fifa.com/worldcup/archive/sweden1958/index.html	Sweden	1958	Brazil	Sweden	France	Germany FR	Brazil vs Sweden : score : 5-2	1958 FIFA World Cup Sweden ™08 June - 29 June
7	2018-07-16 18:56:03.246158+08	2018-07-16 18:56:03.246158+08	\N	https://www.fifa.com/worldcup/archive/chile1962/index.html	Chile	1962	Brazil	Czechoslovakia	Chile	Yugoslavia	Brazil vs Czechoslovakia : score : 3-1	1962 FIFA World Cup Chile ™30 May - 17 June
8	2018-07-16 18:56:05.415328+08	2018-07-16 18:56:05.415328+08	\N	https://www.fifa.com/worldcup/archive/england1966/index.html	England	1966	England	Germany FR	Portugal	Soviet Union	England vs Germany FR : score : 4-2	1966 FIFA World Cup England ™11 July - 30 July
9	2018-07-16 18:56:07.493418+08	2018-07-16 18:56:07.493418+08	\N	https://www.fifa.com/worldcup/archive/mexico1970/index.html	Mexico	1970	Brazil	Italy	Germany FR	Uruguay	Brazil vs Italy : score : 4-1	1970 FIFA World Cup Mexico ™31 May - 21 June
10	2018-07-16 18:56:09.416513+08	2018-07-16 18:56:09.416513+08	\N	https://www.fifa.com/worldcup/archive/germany1974/index.html	Germany	1974	Germany FR	Netherlands	Poland	Brazil	Netherlands vs Germany FR : score : 1-2	1974 FIFA World Cup Germany ™13 June - 07 July
11	2018-07-16 18:56:10.994166+08	2018-07-16 18:56:10.994166+08	\N	https://www.fifa.com/worldcup/archive/argentina1978/index.html	Argentina	1978	Argentina	Netherlands	Brazil	Italy	Argentina vs Netherlands : score : 3-1	1978 FIFA World Cup Argentina ™01 June - 25 June
12	2018-07-16 18:56:12.665553+08	2018-07-16 18:56:12.665553+08	\N	https://www.fifa.com/worldcup/archive/spain1982/index.html	Spain	1982	Italy	Germany FR	Poland	France	Italy vs Germany FR : score : 3-1	1982 FIFA World Cup Spain ™13 June - 11 July
13	2018-07-16 18:56:14.579655+08	2018-07-16 18:56:14.579655+08	\N	https://www.fifa.com/worldcup/archive/mexico1986/index.html	Mexico	1986	Argentina	Germany FR	France	Belgium	Argentina vs Germany FR : score : 3-2	1986 FIFA World Cup Mexico ™31 May - 29 June
14	2018-07-16 18:56:16.64091+08	2018-07-16 18:56:16.64091+08	\N	https://www.fifa.com/worldcup/archive/italy1990/index.html	Italy	1990	Germany FR	Argentina	Italy	England	Germany FR vs Argentina : score : 1-0	1990 FIFA World Cup Italy ™08 June - 08 July
15	2018-07-16 18:56:18.279867+08	2018-07-16 18:56:18.279867+08	\N	https://www.fifa.com/worldcup/archive/usa1994/index.html	USA	1994	Brazil	Italy	Sweden	Bulgaria	Brazil vs Italy : score : 0-0	1994 FIFA World Cup USA ™17 June - 17 July
16	2018-07-16 18:56:19.902631+08	2018-07-16 18:56:19.902631+08	\N	https://www.fifa.com/worldcup/archive/france1998/index.html	France	1998	France	Brazil	Croatia	Netherlands	Brazil vs France : score : 0-3	1998 FIFA World Cup France ™10 June - 12 July
17	2018-07-16 18:56:21.954705+08	2018-07-16 18:56:21.954705+08	\N	https://www.fifa.com/worldcup/archive/koreajapan2002/index.html	Korea/Japan	2002	Brazil	Germany	Turkey	Korea Republic	Germany vs Brazil : score : 0-2	2002 FIFA World Cup Korea/Japan ™31 May - 30 June
18	2018-07-16 18:56:24.013439+08	2018-07-16 18:56:24.013439+08	\N	https://www.fifa.com/worldcup/archive/germany2006/index.html	Germany	2006	Italy	France	Germany	Portugal	Italy vs France : score : 1-1	2006 FIFA World Cup Germany ™09 June - 09 July
19	2018-07-16 18:56:26.762616+08	2018-07-16 18:56:26.762616+08	\N	https://www.fifa.com/worldcup/archive/southafrica2010/index.html	South	Africa	Spain	Netherlands	Germany	Uruguay	Netherlands vs Spain : score : 0-1	2010 FIFA World Cup South Africa™11 June - 11 July
20	2018-07-16 18:56:29.63536+08	2018-07-16 18:56:29.63536+08	\N	https://www.fifa.com/worldcup/archive/brazil2014/index.html	Brazil	2014	Germany	Argentina	Netherlands	Brazil	Germany vs Argentina : score : 1-0	2014 FIFA World Cup Brazil™12 June - 13 July
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.admins_id_seq', 3, true);


--
-- Name: awards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.awards_id_seq', 34, true);


--
-- Name: coaches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.coaches_id_seq', 32, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.groups_id_seq', 32, true);


--
-- Name: matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.matches_id_seq', 64, true);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.players_id_seq', 736, true);


--
-- Name: players_statistic_with_disciplinaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.players_statistic_with_disciplinaries_id_seq', 184, true);


--
-- Name: players_statistic_with_goals_scoreds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.players_statistic_with_goals_scoreds_id_seq', 110, true);


--
-- Name: players_statistic_with_shots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.players_statistic_with_shots_id_seq', 405, true);


--
-- Name: players_statistic_with_top_saves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.players_statistic_with_top_saves_id_seq', 40, true);


--
-- Name: team_statistic_with_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.team_statistic_with_attempts_id_seq', 31, true);


--
-- Name: team_statistic_with_disciplinaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.team_statistic_with_disciplinaries_id_seq', 31, true);


--
-- Name: team_statistic_with_top_goals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.team_statistic_with_top_goals_id_seq', 31, true);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.teams_id_seq', 32, true);


--
-- Name: world_cup_archives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiewei
--

SELECT pg_catalog.setval('public.world_cup_archives_id_seq', 20, true);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: awards awards_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_pkey PRIMARY KEY (id);


--
-- Name: coaches coaches_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.coaches
    ADD CONSTRAINT coaches_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: matches matches_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: players_statistic_with_disciplinaries players_statistic_with_disciplinaries_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.players_statistic_with_disciplinaries
    ADD CONSTRAINT players_statistic_with_disciplinaries_pkey PRIMARY KEY (id);


--
-- Name: players_statistic_with_goals_scoreds players_statistic_with_goals_scoreds_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.players_statistic_with_goals_scoreds
    ADD CONSTRAINT players_statistic_with_goals_scoreds_pkey PRIMARY KEY (id);


--
-- Name: players_statistic_with_shots players_statistic_with_shots_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.players_statistic_with_shots
    ADD CONSTRAINT players_statistic_with_shots_pkey PRIMARY KEY (id);


--
-- Name: players_statistic_with_top_saves players_statistic_with_top_saves_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.players_statistic_with_top_saves
    ADD CONSTRAINT players_statistic_with_top_saves_pkey PRIMARY KEY (id);


--
-- Name: team_statistic_with_attempts team_statistic_with_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.team_statistic_with_attempts
    ADD CONSTRAINT team_statistic_with_attempts_pkey PRIMARY KEY (id);


--
-- Name: team_statistic_with_disciplinaries team_statistic_with_disciplinaries_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.team_statistic_with_disciplinaries
    ADD CONSTRAINT team_statistic_with_disciplinaries_pkey PRIMARY KEY (id);


--
-- Name: team_statistic_with_top_goals team_statistic_with_top_goals_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.team_statistic_with_top_goals
    ADD CONSTRAINT team_statistic_with_top_goals_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: world_cup_archives world_cup_archives_pkey; Type: CONSTRAINT; Schema: public; Owner: xiewei
--

ALTER TABLE ONLY public.world_cup_archives
    ADD CONSTRAINT world_cup_archives_pkey PRIMARY KEY (id);


--
-- Name: idx_admins_deleted_at; Type: INDEX; Schema: public; Owner: xiewei
--

CREATE INDEX idx_admins_deleted_at ON public.admins USING btree (deleted_at);


--
-- Name: idx_coaches_deleted_at; Type: INDEX; Schema: public; Owner: xiewei
--

CREATE INDEX idx_coaches_deleted_at ON public.coaches USING btree (deleted_at);


--
-- Name: idx_groups_deleted_at; Type: INDEX; Schema: public; Owner: xiewei
--

CREATE INDEX idx_groups_deleted_at ON public.groups USING btree (deleted_at);


--
-- Name: idx_matches_deleted_at; Type: INDEX; Schema: public; Owner: xiewei
--

CREATE INDEX idx_matches_deleted_at ON public.matches USING btree (deleted_at);


--
-- Name: idx_players_deleted_at; Type: INDEX; Schema: public; Owner: xiewei
--

CREATE INDEX idx_players_deleted_at ON public.players USING btree (deleted_at);


--
-- Name: idx_players_statistic_with_disciplinaries_deleted_at; Type: INDEX; Schema: public; Owner: xiewei
--

CREATE INDEX idx_players_statistic_with_disciplinaries_deleted_at ON public.players_statistic_with_disciplinaries USING btree (deleted_at);


--
-- Name: idx_players_statistic_with_goals_scoreds_deleted_at; Type: INDEX; Schema: public; Owner: xiewei
--

CREATE INDEX idx_players_statistic_with_goals_scoreds_deleted_at ON public.players_statistic_with_goals_scoreds USING btree (deleted_at);


--
-- Name: idx_players_statistic_with_shots_deleted_at; Type: INDEX; Schema: public; Owner: xiewei
--

CREATE INDEX idx_players_statistic_with_shots_deleted_at ON public.players_statistic_with_shots USING btree (deleted_at);


--
-- Name: idx_players_statistic_with_top_saves_deleted_at; Type: INDEX; Schema: public; Owner: xiewei
--

CREATE INDEX idx_players_statistic_with_top_saves_deleted_at ON public.players_statistic_with_top_saves USING btree (deleted_at);


--
-- Name: idx_team_statistic_with_attempts_deleted_at; Type: INDEX; Schema: public; Owner: xiewei
--

CREATE INDEX idx_team_statistic_with_attempts_deleted_at ON public.team_statistic_with_attempts USING btree (deleted_at);


--
-- Name: idx_team_statistic_with_disciplinaries_deleted_at; Type: INDEX; Schema: public; Owner: xiewei
--

CREATE INDEX idx_team_statistic_with_disciplinaries_deleted_at ON public.team_statistic_with_disciplinaries USING btree (deleted_at);


--
-- Name: idx_team_statistic_with_top_goals_deleted_at; Type: INDEX; Schema: public; Owner: xiewei
--

CREATE INDEX idx_team_statistic_with_top_goals_deleted_at ON public.team_statistic_with_top_goals USING btree (deleted_at);


--
-- Name: idx_teams_deleted_at; Type: INDEX; Schema: public; Owner: xiewei
--

CREATE INDEX idx_teams_deleted_at ON public.teams USING btree (deleted_at);


--
-- Name: idx_world_cup_archives_deleted_at; Type: INDEX; Schema: public; Owner: xiewei
--

CREATE INDEX idx_world_cup_archives_deleted_at ON public.world_cup_archives USING btree (deleted_at);


--
-- PostgreSQL database dump complete
--

