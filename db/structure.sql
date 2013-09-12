--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: contracts; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE contracts (
    id integer NOT NULL,
    player_id integer,
    team_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contracts_id_seq OWNED BY contracts.id;


--
-- Name: divisions; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE divisions (
    id integer NOT NULL,
    league_id integer,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: divisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE divisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: divisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE divisions_id_seq OWNED BY divisions.id;


--
-- Name: leagues; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE leagues (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: leagues_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE leagues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: leagues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE leagues_id_seq OWNED BY leagues.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE players (
    id integer NOT NULL,
    surname character varying(255),
    given_name character varying(255),
    "position" character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE players_id_seq OWNED BY players.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: stats; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE stats (
    id integer NOT NULL,
    player_id integer,
    year integer,
    batting_average double precision,
    ops double precision,
    at_bats integer,
    balk integer,
    batting_errors integer,
    caught_stealing integer,
    complete_games integer,
    doubles integer,
    earned_runs integer,
    era integer,
    games integer,
    games_started integer,
    hit_batter integer,
    hit_by_pitch integer,
    hits integer,
    home_runs integer,
    innings integer,
    losses integer,
    pb integer,
    rbi integer,
    runs integer,
    sacrifice_flies integer,
    sacrifice_hits integer,
    saves integer,
    shut_outs integer,
    steals integer,
    struck_out integer,
    struck_out_batter integer,
    throws integer,
    triples integer,
    walked_batter integer,
    walks integer,
    wild_pitches integer,
    wins integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stats_id_seq OWNED BY stats.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE teams (
    id integer NOT NULL,
    name character varying(255),
    city character varying(255),
    division_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE teams_id_seq OWNED BY teams.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contracts ALTER COLUMN id SET DEFAULT nextval('contracts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY divisions ALTER COLUMN id SET DEFAULT nextval('divisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY leagues ALTER COLUMN id SET DEFAULT nextval('leagues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY players ALTER COLUMN id SET DEFAULT nextval('players_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY stats ALTER COLUMN id SET DEFAULT nextval('stats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY teams ALTER COLUMN id SET DEFAULT nextval('teams_id_seq'::regclass);


--
-- Name: contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- Name: divisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY divisions
    ADD CONSTRAINT divisions_pkey PRIMARY KEY (id);


--
-- Name: leagues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY leagues
    ADD CONSTRAINT leagues_pkey PRIMARY KEY (id);


--
-- Name: players_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (id);


--
-- Name: teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: index_contracts_on_player_id_and_team_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_contracts_on_player_id_and_team_id ON contracts USING btree (player_id, team_id);


--
-- Name: index_divisions_on_league_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_divisions_on_league_id ON divisions USING btree (league_id);


--
-- Name: index_divisions_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_divisions_on_name ON divisions USING btree (name);


--
-- Name: index_leagues_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_leagues_on_name ON leagues USING btree (name);


--
-- Name: index_players_on_given_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_players_on_given_name ON players USING btree (given_name);


--
-- Name: index_players_on_position; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_players_on_position ON players USING btree ("position");


--
-- Name: index_players_on_surname; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_players_on_surname ON players USING btree (surname);


--
-- Name: index_stats_on_batting_average; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_stats_on_batting_average ON stats USING btree (batting_average);


--
-- Name: index_stats_on_home_runs; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_stats_on_home_runs ON stats USING btree (home_runs);


--
-- Name: index_stats_on_ops; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_stats_on_ops ON stats USING btree (ops);


--
-- Name: index_stats_on_player_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_stats_on_player_id ON stats USING btree (player_id);


--
-- Name: index_stats_on_rbi; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_stats_on_rbi ON stats USING btree (rbi);


--
-- Name: index_stats_on_runs; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_stats_on_runs ON stats USING btree (runs);


--
-- Name: index_stats_on_steals; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_stats_on_steals ON stats USING btree (steals);


--
-- Name: index_stats_on_year; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_stats_on_year ON stats USING btree (year);


--
-- Name: index_teams_on_city; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_teams_on_city ON teams USING btree (city);


--
-- Name: index_teams_on_division_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_teams_on_division_id ON teams USING btree (division_id);


--
-- Name: index_teams_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_teams_on_name ON teams USING btree (name);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130911015114');

INSERT INTO schema_migrations (version) VALUES ('20130911022113');

INSERT INTO schema_migrations (version) VALUES ('20130911022138');

INSERT INTO schema_migrations (version) VALUES ('20130911022149');

INSERT INTO schema_migrations (version) VALUES ('20130911022200');

INSERT INTO schema_migrations (version) VALUES ('20130911023343');
