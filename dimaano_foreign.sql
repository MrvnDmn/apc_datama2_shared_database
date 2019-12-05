--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-05 08:58:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 21 (class 2615 OID 16766)
-- Name: msdimaano; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA msdimaano;


ALTER SCHEMA msdimaano OWNER TO datama2mi181;

SET default_tablespace = '';

--
-- TOC entry 389 (class 1259 OID 24881)
-- Name: onsite_customer; Type: TABLE; Schema: msdimaano; Owner: datama2mi181
--

CREATE TABLE msdimaano.onsite_customer (
    ons_id integer NOT NULL,
    ons_fname character varying(45) DEFAULT NULL::character varying,
    ons_lname character varying(45) DEFAULT NULL::character varying,
    ons_dob date,
    ord_id integer
);


ALTER TABLE msdimaano.onsite_customer OWNER TO datama2mi181;

--
-- TOC entry 388 (class 1259 OID 24879)
-- Name: onsite_customer_ons_id_seq; Type: SEQUENCE; Schema: msdimaano; Owner: datama2mi181
--

CREATE SEQUENCE msdimaano.onsite_customer_ons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE msdimaano.onsite_customer_ons_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 388
-- Name: onsite_customer_ons_id_seq; Type: SEQUENCE OWNED BY; Schema: msdimaano; Owner: datama2mi181
--

ALTER SEQUENCE msdimaano.onsite_customer_ons_id_seq OWNED BY msdimaano.onsite_customer.ons_id;


--
-- TOC entry 391 (class 1259 OID 24891)
-- Name: orders; Type: TABLE; Schema: msdimaano; Owner: datama2mi181
--

CREATE TABLE msdimaano.orders (
    ord_id integer NOT NULL,
    ord_menu_name character varying(45) DEFAULT NULL::character varying,
    ord_amount integer,
    ord_date timestamp without time zone NOT NULL
);


ALTER TABLE msdimaano.orders OWNER TO datama2mi181;

--
-- TOC entry 394 (class 1259 OID 24955)
-- Name: onsitecustomer_order; Type: VIEW; Schema: msdimaano; Owner: datama2mi181
--

CREATE VIEW msdimaano.onsitecustomer_order AS
 SELECT onsite_customer.ons_id,
    onsite_customer.ons_lname,
    onsite_customer.ons_fname,
    orders.ord_id,
    orders.ord_menu_name,
    orders.ord_amount
   FROM msdimaano.onsite_customer,
    msdimaano.orders;


ALTER TABLE msdimaano.onsitecustomer_order OWNER TO datama2mi181;

--
-- TOC entry 390 (class 1259 OID 24889)
-- Name: orders_ord_id_seq; Type: SEQUENCE; Schema: msdimaano; Owner: datama2mi181
--

CREATE SEQUENCE msdimaano.orders_ord_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE msdimaano.orders_ord_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 390
-- Name: orders_ord_id_seq; Type: SEQUENCE OWNED BY; Schema: msdimaano; Owner: datama2mi181
--

ALTER SEQUENCE msdimaano.orders_ord_id_seq OWNED BY msdimaano.orders.ord_id;


--
-- TOC entry 3287 (class 2604 OID 24884)
-- Name: onsite_customer ons_id; Type: DEFAULT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.onsite_customer ALTER COLUMN ons_id SET DEFAULT nextval('msdimaano.onsite_customer_ons_id_seq'::regclass);


--
-- TOC entry 3290 (class 2604 OID 24894)
-- Name: orders ord_id; Type: DEFAULT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.orders ALTER COLUMN ord_id SET DEFAULT nextval('msdimaano.orders_ord_id_seq'::regclass);


--
-- TOC entry 3439 (class 0 OID 24881)
-- Dependencies: 389
-- Data for Name: onsite_customer; Type: TABLE DATA; Schema: msdimaano; Owner: datama2mi181
--

INSERT INTO msdimaano.onsite_customer VALUES (1, 'Tom', 'Tomson', '2019-10-17', NULL);
INSERT INTO msdimaano.onsite_customer VALUES (2, 'Jean', 'Garisson', '2018-10-25', NULL);


--
-- TOC entry 3441 (class 0 OID 24891)
-- Dependencies: 391
-- Data for Name: orders; Type: TABLE DATA; Schema: msdimaano; Owner: datama2mi181
--

INSERT INTO msdimaano.orders VALUES (1, 'pancake', 280, '1957-06-13 00:00:00');
INSERT INTO msdimaano.orders VALUES (2, 'shake', 190, '1957-06-13 00:00:00');


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 388
-- Name: onsite_customer_ons_id_seq; Type: SEQUENCE SET; Schema: msdimaano; Owner: datama2mi181
--

SELECT pg_catalog.setval('msdimaano.onsite_customer_ons_id_seq', 1, false);


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 390
-- Name: orders_ord_id_seq; Type: SEQUENCE SET; Schema: msdimaano; Owner: datama2mi181
--

SELECT pg_catalog.setval('msdimaano.orders_ord_id_seq', 1, false);


--
-- TOC entry 3293 (class 2606 OID 24888)
-- Name: onsite_customer onsite_customer_pkey; Type: CONSTRAINT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.onsite_customer
    ADD CONSTRAINT onsite_customer_pkey PRIMARY KEY (ons_id);


--
-- TOC entry 3295 (class 2606 OID 24897)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (ord_id);


--
-- TOC entry 3296 (class 2606 OID 25265)
-- Name: onsite_customer ord_id_fkey; Type: FK CONSTRAINT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.onsite_customer
    ADD CONSTRAINT ord_id_fkey FOREIGN KEY (ord_id) REFERENCES msdimaano.orders(ord_id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2019-12-05 08:58:39

--
-- PostgreSQL database dump complete
--

