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
-- Name: players; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE players (
    id integer NOT NULL,
    surname character varying(255),
    given_name character varying(255),
    "position" character varying(255),
    at_bats integer,
    caught_stealing integer,
    doubles integer,
    errors integer,
    games integer,
    games_started integer,
    hit_by_pitch integer,
    hits integer,
    home_runs integer,
    pb integer,
    rbi integer,
    runs integer,
    sacrifice_flies integer,
    sacrifice_hits integer,
    steals integer,
    struck_out integer,
    triples integer,
    walks integer,
    ops double precision,
    batting_average double precision,
    stolen_bases integer,
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
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY players ALTER COLUMN id SET DEFAULT nextval('players_id_seq'::regclass);


--
-- Name: players_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: index_players_on_batting_average; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_players_on_batting_average ON players USING btree (batting_average);


--
-- Name: index_players_on_home_runs; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_players_on_home_runs ON players USING btree (home_runs);


--
-- Name: index_players_on_ops; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_players_on_ops ON players USING btree (ops);


--
-- Name: index_players_on_rbi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_players_on_rbi ON players USING btree (rbi);


--
-- Name: index_players_on_runs; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_players_on_runs ON players USING btree (runs);


--
-- Name: index_players_on_stolen_bases; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_players_on_stolen_bases ON players USING btree (stolen_bases);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130911015114');
