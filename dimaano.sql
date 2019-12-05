--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-05 08:19:45

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
-- TOC entry 12 (class 2615 OID 16766)
-- Name: msdimaano; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA msdimaano;


ALTER SCHEMA msdimaano OWNER TO datama2mi181;

SET default_tablespace = '';

--
-- TOC entry 405 (class 1259 OID 24909)
-- Name: chef; Type: TABLE; Schema: msdimaano; Owner: datama2mi181
--

CREATE TABLE msdimaano.chef (
    chef_id integer NOT NULL,
    chef_position character varying(45) NOT NULL,
    chef_lname character varying(45) NOT NULL,
    chef_fname character varying(45) NOT NULL
);


ALTER TABLE msdimaano.chef OWNER TO datama2mi181;

--
-- TOC entry 404 (class 1259 OID 24907)
-- Name: chef_chef_id_seq; Type: SEQUENCE; Schema: msdimaano; Owner: datama2mi181
--

CREATE SEQUENCE msdimaano.chef_chef_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE msdimaano.chef_chef_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 404
-- Name: chef_chef_id_seq; Type: SEQUENCE OWNED BY; Schema: msdimaano; Owner: datama2mi181
--

ALTER SEQUENCE msdimaano.chef_chef_id_seq OWNED BY msdimaano.chef.chef_id;


--
-- TOC entry 395 (class 1259 OID 24857)
-- Name: employee; Type: TABLE; Schema: msdimaano; Owner: datama2mi181
--

CREATE TABLE msdimaano.employee (
    emp_id integer NOT NULL,
    emp_fname character varying(45) NOT NULL,
    emp_lname character varying(45) NOT NULL,
    emp_dob date,
    emp_address character varying(45) DEFAULT NULL::character varying,
    emp_date_hired date
);


ALTER TABLE msdimaano.employee OWNER TO datama2mi181;

--
-- TOC entry 394 (class 1259 OID 24855)
-- Name: employee_emp_id_seq; Type: SEQUENCE; Schema: msdimaano; Owner: datama2mi181
--

CREATE SEQUENCE msdimaano.employee_emp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE msdimaano.employee_emp_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 394
-- Name: employee_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: msdimaano; Owner: datama2mi181
--

ALTER SEQUENCE msdimaano.employee_emp_id_seq OWNED BY msdimaano.employee.emp_id;


--
-- TOC entry 397 (class 1259 OID 24866)
-- Name: online_customer; Type: TABLE; Schema: msdimaano; Owner: datama2mi181
--

CREATE TABLE msdimaano.online_customer (
    onl_id integer NOT NULL,
    onl_fname character varying(45) DEFAULT NULL::character varying,
    onl_lname character varying(45) DEFAULT NULL::character varying,
    onl_dob date
);


ALTER TABLE msdimaano.online_customer OWNER TO datama2mi181;

--
-- TOC entry 396 (class 1259 OID 24864)
-- Name: online_customer_onl_id_seq; Type: SEQUENCE; Schema: msdimaano; Owner: datama2mi181
--

CREATE SEQUENCE msdimaano.online_customer_onl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE msdimaano.online_customer_onl_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 396
-- Name: online_customer_onl_id_seq; Type: SEQUENCE OWNED BY; Schema: msdimaano; Owner: datama2mi181
--

ALTER SEQUENCE msdimaano.online_customer_onl_id_seq OWNED BY msdimaano.online_customer.onl_id;


--
-- TOC entry 399 (class 1259 OID 24881)
-- Name: onsite_customer; Type: TABLE; Schema: msdimaano; Owner: datama2mi181
--

CREATE TABLE msdimaano.onsite_customer (
    ons_id integer NOT NULL,
    ons_fname character varying(45) DEFAULT NULL::character varying,
    ons_lname character varying(45) DEFAULT NULL::character varying,
    ons_dob date
);


ALTER TABLE msdimaano.onsite_customer OWNER TO datama2mi181;

--
-- TOC entry 398 (class 1259 OID 24879)
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
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 398
-- Name: onsite_customer_ons_id_seq; Type: SEQUENCE OWNED BY; Schema: msdimaano; Owner: datama2mi181
--

ALTER SEQUENCE msdimaano.onsite_customer_ons_id_seq OWNED BY msdimaano.onsite_customer.ons_id;


--
-- TOC entry 401 (class 1259 OID 24891)
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
-- TOC entry 408 (class 1259 OID 24955)
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
-- TOC entry 400 (class 1259 OID 24889)
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
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 400
-- Name: orders_ord_id_seq; Type: SEQUENCE OWNED BY; Schema: msdimaano; Owner: datama2mi181
--

ALTER SEQUENCE msdimaano.orders_ord_id_seq OWNED BY msdimaano.orders.ord_id;


--
-- TOC entry 403 (class 1259 OID 24900)
-- Name: product; Type: TABLE; Schema: msdimaano; Owner: datama2mi181
--

CREATE TABLE msdimaano.product (
    prod_id integer NOT NULL,
    prod_type character varying(45) DEFAULT NULL::character varying,
    prod_date date,
    prod_date_expire date,
    prod_num_items integer
);


ALTER TABLE msdimaano.product OWNER TO datama2mi181;

--
-- TOC entry 402 (class 1259 OID 24898)
-- Name: product_prod_id_seq; Type: SEQUENCE; Schema: msdimaano; Owner: datama2mi181
--

CREATE SEQUENCE msdimaano.product_prod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE msdimaano.product_prod_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 402
-- Name: product_prod_id_seq; Type: SEQUENCE OWNED BY; Schema: msdimaano; Owner: datama2mi181
--

ALTER SEQUENCE msdimaano.product_prod_id_seq OWNED BY msdimaano.product.prod_id;


--
-- TOC entry 388 (class 1259 OID 24797)
-- Name: restaurant; Type: TABLE; Schema: msdimaano; Owner: datama2mi181
--

CREATE TABLE msdimaano.restaurant (
    res_id integer NOT NULL,
    res_loc character varying(45) DEFAULT NULL::character varying,
    res_employed_num integer
);


ALTER TABLE msdimaano.restaurant OWNER TO datama2mi181;

--
-- TOC entry 387 (class 1259 OID 24795)
-- Name: restaurant_res_id_seq; Type: SEQUENCE; Schema: msdimaano; Owner: datama2mi181
--

CREATE SEQUENCE msdimaano.restaurant_res_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE msdimaano.restaurant_res_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 387
-- Name: restaurant_res_id_seq; Type: SEQUENCE OWNED BY; Schema: msdimaano; Owner: datama2mi181
--

ALTER SEQUENCE msdimaano.restaurant_res_id_seq OWNED BY msdimaano.restaurant.res_id;


--
-- TOC entry 393 (class 1259 OID 24835)
-- Name: restaurant_supplier; Type: TABLE; Schema: msdimaano; Owner: datama2mi181
--

CREATE TABLE msdimaano.restaurant_supplier (
    res_id integer NOT NULL,
    supp_id integer NOT NULL,
    integ_date timestamp without time zone
);


ALTER TABLE msdimaano.restaurant_supplier OWNER TO datama2mi181;

--
-- TOC entry 390 (class 1259 OID 24806)
-- Name: supplier; Type: TABLE; Schema: msdimaano; Owner: datama2mi181
--

CREATE TABLE msdimaano.supplier (
    supp_id integer NOT NULL,
    supp_name character varying(45) NOT NULL,
    supp_contact integer,
    supp_address character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE msdimaano.supplier OWNER TO datama2mi181;

--
-- TOC entry 389 (class 1259 OID 24804)
-- Name: supplier_supp_id_seq; Type: SEQUENCE; Schema: msdimaano; Owner: datama2mi181
--

CREATE SEQUENCE msdimaano.supplier_supp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE msdimaano.supplier_supp_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 389
-- Name: supplier_supp_id_seq; Type: SEQUENCE OWNED BY; Schema: msdimaano; Owner: datama2mi181
--

ALTER SEQUENCE msdimaano.supplier_supp_id_seq OWNED BY msdimaano.supplier.supp_id;


--
-- TOC entry 3296 (class 2604 OID 24912)
-- Name: chef chef_id; Type: DEFAULT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.chef ALTER COLUMN chef_id SET DEFAULT nextval('msdimaano.chef_chef_id_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 24860)
-- Name: employee emp_id; Type: DEFAULT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.employee ALTER COLUMN emp_id SET DEFAULT nextval('msdimaano.employee_emp_id_seq'::regclass);


--
-- TOC entry 3286 (class 2604 OID 24869)
-- Name: online_customer onl_id; Type: DEFAULT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.online_customer ALTER COLUMN onl_id SET DEFAULT nextval('msdimaano.online_customer_onl_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 24884)
-- Name: onsite_customer ons_id; Type: DEFAULT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.onsite_customer ALTER COLUMN ons_id SET DEFAULT nextval('msdimaano.onsite_customer_ons_id_seq'::regclass);


--
-- TOC entry 3292 (class 2604 OID 24894)
-- Name: orders ord_id; Type: DEFAULT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.orders ALTER COLUMN ord_id SET DEFAULT nextval('msdimaano.orders_ord_id_seq'::regclass);


--
-- TOC entry 3294 (class 2604 OID 24903)
-- Name: product prod_id; Type: DEFAULT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.product ALTER COLUMN prod_id SET DEFAULT nextval('msdimaano.product_prod_id_seq'::regclass);


--
-- TOC entry 3280 (class 2604 OID 24800)
-- Name: restaurant res_id; Type: DEFAULT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.restaurant ALTER COLUMN res_id SET DEFAULT nextval('msdimaano.restaurant_res_id_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 24809)
-- Name: supplier supp_id; Type: DEFAULT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.supplier ALTER COLUMN supp_id SET DEFAULT nextval('msdimaano.supplier_supp_id_seq'::regclass);


--
-- TOC entry 3474 (class 0 OID 24909)
-- Dependencies: 405
-- Data for Name: chef; Type: TABLE DATA; Schema: msdimaano; Owner: datama2mi181
--

INSERT INTO msdimaano.chef VALUES (1, 'head chef', 'Bernardo', 'Herrick');
INSERT INTO msdimaano.chef VALUES (2, 'sous chef', 'Jeremy', 'Carmack');


--
-- TOC entry 3464 (class 0 OID 24857)
-- Dependencies: 395
-- Data for Name: employee; Type: TABLE DATA; Schema: msdimaano; Owner: datama2mi181
--



--
-- TOC entry 3466 (class 0 OID 24866)
-- Dependencies: 397
-- Data for Name: online_customer; Type: TABLE DATA; Schema: msdimaano; Owner: datama2mi181
--

INSERT INTO msdimaano.online_customer VALUES (1, 'Ramsay', 'Karena', '1998-07-09');
INSERT INTO msdimaano.online_customer VALUES (2, 'Carney', 'Daniele', '1990-10-04');
INSERT INTO msdimaano.online_customer VALUES (3, 'Bryce', 'Harper', '1985-10-02');
INSERT INTO msdimaano.online_customer VALUES (4, 'Jose', 'Altuve', '1988-04-08');
INSERT INTO msdimaano.online_customer VALUES (5, 'Trae', 'Young', '1999-09-03');
INSERT INTO msdimaano.online_customer VALUES (6, 'Jaren', 'Jackson', '1997-12-06');


--
-- TOC entry 3468 (class 0 OID 24881)
-- Dependencies: 399
-- Data for Name: onsite_customer; Type: TABLE DATA; Schema: msdimaano; Owner: datama2mi181
--

INSERT INTO msdimaano.onsite_customer VALUES (1, 'Tom', 'Tomson', '2019-10-17');
INSERT INTO msdimaano.onsite_customer VALUES (2, 'Jean', 'Garisson', '2018-10-25');


--
-- TOC entry 3470 (class 0 OID 24891)
-- Dependencies: 401
-- Data for Name: orders; Type: TABLE DATA; Schema: msdimaano; Owner: datama2mi181
--

INSERT INTO msdimaano.orders VALUES (1, 'pancake', 280, '1957-06-13 00:00:00');
INSERT INTO msdimaano.orders VALUES (2, 'shake', 190, '1957-06-13 00:00:00');


--
-- TOC entry 3472 (class 0 OID 24900)
-- Dependencies: 403
-- Data for Name: product; Type: TABLE DATA; Schema: msdimaano; Owner: datama2mi181
--

INSERT INTO msdimaano.product VALUES (1, 'perishable', '2019-10-17', '2019-10-11', 23);
INSERT INTO msdimaano.product VALUES (2, 'perishable', '2019-10-31', '2020-02-13', 522);


--
-- TOC entry 3459 (class 0 OID 24797)
-- Dependencies: 388
-- Data for Name: restaurant; Type: TABLE DATA; Schema: msdimaano; Owner: datama2mi181
--

INSERT INTO msdimaano.restaurant VALUES (1, 'Chambersburg City', 32);
INSERT INTO msdimaano.restaurant VALUES (2, 'Jefferson City', 32);


--
-- TOC entry 3462 (class 0 OID 24835)
-- Dependencies: 393
-- Data for Name: restaurant_supplier; Type: TABLE DATA; Schema: msdimaano; Owner: datama2mi181
--



--
-- TOC entry 3461 (class 0 OID 24806)
-- Dependencies: 390
-- Data for Name: supplier; Type: TABLE DATA; Schema: msdimaano; Owner: datama2mi181
--

INSERT INTO msdimaano.supplier VALUES (1, 'meat.ly', 922222, '1019  Cambridge Court');
INSERT INTO msdimaano.supplier VALUES (2, 'Foodure', 71763487, '1335  Lincoln Drive');


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 404
-- Name: chef_chef_id_seq; Type: SEQUENCE SET; Schema: msdimaano; Owner: datama2mi181
--

SELECT pg_catalog.setval('msdimaano.chef_chef_id_seq', 1, false);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 394
-- Name: employee_emp_id_seq; Type: SEQUENCE SET; Schema: msdimaano; Owner: datama2mi181
--

SELECT pg_catalog.setval('msdimaano.employee_emp_id_seq', 1, false);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 396
-- Name: online_customer_onl_id_seq; Type: SEQUENCE SET; Schema: msdimaano; Owner: datama2mi181
--

SELECT pg_catalog.setval('msdimaano.online_customer_onl_id_seq', 1, false);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 398
-- Name: onsite_customer_ons_id_seq; Type: SEQUENCE SET; Schema: msdimaano; Owner: datama2mi181
--

SELECT pg_catalog.setval('msdimaano.onsite_customer_ons_id_seq', 1, false);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 400
-- Name: orders_ord_id_seq; Type: SEQUENCE SET; Schema: msdimaano; Owner: datama2mi181
--

SELECT pg_catalog.setval('msdimaano.orders_ord_id_seq', 1, false);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 402
-- Name: product_prod_id_seq; Type: SEQUENCE SET; Schema: msdimaano; Owner: datama2mi181
--

SELECT pg_catalog.setval('msdimaano.product_prod_id_seq', 1, false);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 387
-- Name: restaurant_res_id_seq; Type: SEQUENCE SET; Schema: msdimaano; Owner: datama2mi181
--

SELECT pg_catalog.setval('msdimaano.restaurant_res_id_seq', 1, false);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 389
-- Name: supplier_supp_id_seq; Type: SEQUENCE SET; Schema: msdimaano; Owner: datama2mi181
--

SELECT pg_catalog.setval('msdimaano.supplier_supp_id_seq', 1, false);


--
-- TOC entry 3314 (class 2606 OID 24914)
-- Name: chef chef_pkey; Type: CONSTRAINT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.chef
    ADD CONSTRAINT chef_pkey PRIMARY KEY (chef_id);


--
-- TOC entry 3304 (class 2606 OID 24863)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);


--
-- TOC entry 3306 (class 2606 OID 24873)
-- Name: online_customer online_customer_pkey; Type: CONSTRAINT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.online_customer
    ADD CONSTRAINT online_customer_pkey PRIMARY KEY (onl_id);


--
-- TOC entry 3308 (class 2606 OID 24888)
-- Name: onsite_customer onsite_customer_pkey; Type: CONSTRAINT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.onsite_customer
    ADD CONSTRAINT onsite_customer_pkey PRIMARY KEY (ons_id);


--
-- TOC entry 3310 (class 2606 OID 24897)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (ord_id);


--
-- TOC entry 3312 (class 2606 OID 24906)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (prod_id);


--
-- TOC entry 3298 (class 2606 OID 24803)
-- Name: restaurant restaurant_pkey; Type: CONSTRAINT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.restaurant
    ADD CONSTRAINT restaurant_pkey PRIMARY KEY (res_id);


--
-- TOC entry 3302 (class 2606 OID 24839)
-- Name: restaurant_supplier restaurant_supplier_id; Type: CONSTRAINT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.restaurant_supplier
    ADD CONSTRAINT restaurant_supplier_id PRIMARY KEY (res_id, supp_id);


--
-- TOC entry 3300 (class 2606 OID 24812)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supp_id);


--
-- TOC entry 3315 (class 2606 OID 24840)
-- Name: restaurant_supplier restaurant_supplier_res_id_fkey; Type: FK CONSTRAINT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.restaurant_supplier
    ADD CONSTRAINT restaurant_supplier_res_id_fkey FOREIGN KEY (res_id) REFERENCES msdimaano.restaurant(res_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3316 (class 2606 OID 24845)
-- Name: restaurant_supplier restaurant_supplier_supp_id_fkey; Type: FK CONSTRAINT; Schema: msdimaano; Owner: datama2mi181
--

ALTER TABLE ONLY msdimaano.restaurant_supplier
    ADD CONSTRAINT restaurant_supplier_supp_id_fkey FOREIGN KEY (supp_id) REFERENCES msdimaano.supplier(supp_id) ON UPDATE CASCADE;


-- Completed on 2019-12-05 08:19:46

--
-- PostgreSQL database dump complete
--

