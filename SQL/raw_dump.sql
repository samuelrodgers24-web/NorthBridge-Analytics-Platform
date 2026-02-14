--
-- PostgreSQL database dump
--

\restrict BphMQU20nwf1Htj7l8ZBDd3dlv3gh4brCNsvbYnn3Ex0TsODavgcN3mXwn97u6A

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: raw; Type: SCHEMA; Schema: -; Owner: alex_analytics
--

CREATE SCHEMA raw;


ALTER SCHEMA raw OWNER TO alex_analytics;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: fx_rate; Type: TABLE; Schema: raw; Owner: alex_analytics
--

CREATE TABLE raw.fx_rate (
    fx_rate_id uuid NOT NULL,
    base_cncy character varying(50) NOT NULL,
    quote_cncy character varying(50) NOT NULL,
    fx_timestamp timestamp with time zone NOT NULL,
    rate numeric(18,4) NOT NULL,
    ingestion_timestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE raw.fx_rate OWNER TO alex_analytics;

--
-- Name: transaction_event; Type: TABLE; Schema: raw; Owner: alex_analytics
--

CREATE TABLE raw.transaction_event (
    tx_id uuid CONSTRAINT transaction_tx_id_not_null NOT NULL,
    c_id character varying(50) CONSTRAINT transaction_c_id_not_null NOT NULL,
    cncy_code character varying(3) CONSTRAINT transaction_cncy_code_not_null NOT NULL,
    tx_timestamp timestamp with time zone CONSTRAINT transaction_tx_timestamp_not_null NOT NULL,
    amount numeric(18,4) CONSTRAINT transaction_amount_not_null NOT NULL,
    ingestion_timestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE raw.transaction_event OWNER TO alex_analytics;

--
-- Data for Name: fx_rate; Type: TABLE DATA; Schema: raw; Owner: alex_analytics
--

COPY raw.fx_rate (fx_rate_id, base_cncy, quote_cncy, fx_timestamp, rate, ingestion_timestamp) FROM stdin;
c3ab32d7-d68e-4103-960f-2dcd0a7d7c10	USD	AED	2026-02-13 20:52:26.211127-05	3.6700	2026-02-13 20:52:26.211127-05
\.


--
-- Data for Name: transaction_event; Type: TABLE DATA; Schema: raw; Owner: alex_analytics
--

COPY raw.transaction_event (tx_id, c_id, cncy_code, tx_timestamp, amount, ingestion_timestamp) FROM stdin;
dd57e117-518d-45d4-8860-d5dcf9df01d3	COMP123	USD	2026-02-13 20:34:51.168056-05	1000.5000	2026-02-13 20:34:51.168056-05
\.


--
-- Name: fx_rate fx_rate_pkey; Type: CONSTRAINT; Schema: raw; Owner: alex_analytics
--

ALTER TABLE ONLY raw.fx_rate
    ADD CONSTRAINT fx_rate_pkey PRIMARY KEY (fx_rate_id);


--
-- Name: fx_rate fx_unique_pair_time; Type: CONSTRAINT; Schema: raw; Owner: alex_analytics
--

ALTER TABLE ONLY raw.fx_rate
    ADD CONSTRAINT fx_unique_pair_time UNIQUE (base_cncy, quote_cncy, fx_timestamp);


--
-- Name: transaction_event transaction_pkey; Type: CONSTRAINT; Schema: raw; Owner: alex_analytics
--

ALTER TABLE ONLY raw.transaction_event
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (tx_id);


--
-- PostgreSQL database dump complete
--

\unrestrict BphMQU20nwf1Htj7l8ZBDd3dlv3gh4brCNsvbYnn3Ex0TsODavgcN3mXwn97u6A

