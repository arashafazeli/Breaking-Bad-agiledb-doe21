--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: category_table; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public.category_table (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    category_name character varying(50) NOT NULL
);


ALTER TABLE public.category_table OWNER TO bb;

--
-- Name: category_table_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.category_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_table_id_seq OWNER TO bb;

--
-- Name: category_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.category_table_id_seq OWNED BY public.category_table.id;


--
-- Name: community; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public.community (
    id integer NOT NULL,
    user_id integer NOT NULL,
    category_id integer NOT NULL,
    post character varying(50),
    chatt character varying(50)
);


ALTER TABLE public.community OWNER TO bb;

--
-- Name: community_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.community_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.community_id_seq OWNER TO bb;

--
-- Name: community_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.community_id_seq OWNED BY public.community.id;


--
-- Name: cs_ticket; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public.cs_ticket (
    id integer NOT NULL,
    order_id integer NOT NULL,
    customer_service_id integer NOT NULL,
    issue_open timestamp with time zone DEFAULT now(),
    issue_closed timestamp with time zone DEFAULT now()
);


ALTER TABLE public.cs_ticket OWNER TO bb;

--
-- Name: cs_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.cs_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cs_ticket_id_seq OWNER TO bb;

--
-- Name: cs_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.cs_ticket_id_seq OWNED BY public.cs_ticket.id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    user_id integer NOT NULL,
    category_id integer,
    receipt character varying(50),
    history character varying(100),
    chatt character varying(100),
    member_lvl character varying(50)
);


ALTER TABLE public.customer OWNER TO bb;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO bb;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- Name: customer_service_table; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public.customer_service_table (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message character varying(250) NOT NULL
);


ALTER TABLE public.customer_service_table OWNER TO bb;

--
-- Name: customer_service_table_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.customer_service_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_service_table_id_seq OWNER TO bb;

--
-- Name: customer_service_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.customer_service_table_id_seq OWNED BY public.customer_service_table.id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public.event (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    category_id integer NOT NULL,
    event_name character varying(50) NOT NULL
);


ALTER TABLE public.event OWNER TO bb;

--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO bb;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- Name: join_table; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public.join_table (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    customer_service_id integer
);


ALTER TABLE public.join_table OWNER TO bb;

--
-- Name: join_table_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.join_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.join_table_id_seq OWNER TO bb;

--
-- Name: join_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.join_table_id_seq OWNED BY public.join_table.id;


--
-- Name: memberBenefits_table; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public."memberBenefits_table" (
    id integer NOT NULL,
    event_id integer NOT NULL,
    customer_id integer NOT NULL,
    bonusladder integer NOT NULL,
    offers character varying(50) NOT NULL
);


ALTER TABLE public."memberBenefits_table" OWNER TO bb;

--
-- Name: memberBenefits_table_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public."memberBenefits_table_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."memberBenefits_table_id_seq" OWNER TO bb;

--
-- Name: memberBenefits_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public."memberBenefits_table_id_seq" OWNED BY public."memberBenefits_table".id;


--
-- Name: order; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    order_status_id integer,
    product_id integer NOT NULL,
    user_id integer NOT NULL,
    supplier_id integer NOT NULL,
    date timestamp with time zone DEFAULT now() NOT NULL,
    total_price character varying(50) NOT NULL
);


ALTER TABLE public."order" OWNER TO bb;

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_seq OWNER TO bb;

--
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;


--
-- Name: order_status; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public.order_status (
    id integer NOT NULL,
    order_id integer NOT NULL,
    received timestamp with time zone DEFAULT now(),
    packing timestamp with time zone DEFAULT now(),
    ready_to_ship timestamp with time zone DEFAULT now(),
    sent timestamp with time zone DEFAULT now(),
    canceled timestamp with time zone DEFAULT now(),
    delayed timestamp with time zone DEFAULT now()
);


ALTER TABLE public.order_status OWNER TO bb;

--
-- Name: order_status_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.order_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_status_id_seq OWNER TO bb;

--
-- Name: order_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.order_status_id_seq OWNED BY public.order_status.id;


--
-- Name: permission; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public.permission (
    id integer NOT NULL,
    permission_status character varying(50) NOT NULL,
    auth character varying(50) NOT NULL
);


ALTER TABLE public.permission OWNER TO bb;

--
-- Name: permission_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_id_seq OWNER TO bb;

--
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.permission_id_seq OWNED BY public.permission.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public.product (
    id integer NOT NULL,
    supplier_id integer NOT NULL,
    category_id integer NOT NULL,
    description character varying(100) NOT NULL,
    product_name character varying(50) NOT NULL,
    quantity integer NOT NULL,
    price character varying(50) NOT NULL
);


ALTER TABLE public.product OWNER TO bb;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO bb;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: recommendations_table; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public.recommendations_table (
    id integer NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL,
    review character varying(250) NOT NULL
);


ALTER TABLE public.recommendations_table OWNER TO bb;

--
-- Name: recommendations_table_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.recommendations_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recommendations_table_id_seq OWNER TO bb;

--
-- Name: recommendations_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.recommendations_table_id_seq OWNED BY public.recommendations_table.id;


--
-- Name: role_table; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public.role_table (
    id integer NOT NULL,
    permission_id integer NOT NULL,
    customer_id integer,
    role_name character varying(50) NOT NULL
);


ALTER TABLE public.role_table OWNER TO bb;

--
-- Name: role_table_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.role_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_table_id_seq OWNER TO bb;

--
-- Name: role_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.role_table_id_seq OWNED BY public.role_table.id;


--
-- Name: supplier_table; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public.supplier_table (
    id integer NOT NULL,
    product_id integer,
    adress character varying(50) NOT NULL,
    org_nummer character varying(11) NOT NULL,
    contact character varying(50) NOT NULL
);


ALTER TABLE public.supplier_table OWNER TO bb;

--
-- Name: supplier_table_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.supplier_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_table_id_seq OWNER TO bb;

--
-- Name: supplier_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.supplier_table_id_seq OWNED BY public.supplier_table.id;


--
-- Name: user_table; Type: TABLE; Schema: public; Owner: bb
--

CREATE TABLE public.user_table (
    id integer NOT NULL,
    role_id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    adress character varying(50) NOT NULL
);


ALTER TABLE public.user_table OWNER TO bb;

--
-- Name: user_table_id_seq; Type: SEQUENCE; Schema: public; Owner: bb
--

CREATE SEQUENCE public.user_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_table_id_seq OWNER TO bb;

--
-- Name: user_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bb
--

ALTER SEQUENCE public.user_table_id_seq OWNED BY public.user_table.id;


--
-- Name: category_table id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.category_table ALTER COLUMN id SET DEFAULT nextval('public.category_table_id_seq'::regclass);


--
-- Name: community id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.community ALTER COLUMN id SET DEFAULT nextval('public.community_id_seq'::regclass);


--
-- Name: cs_ticket id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.cs_ticket ALTER COLUMN id SET DEFAULT nextval('public.cs_ticket_id_seq'::regclass);


--
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- Name: customer_service_table id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.customer_service_table ALTER COLUMN id SET DEFAULT nextval('public.customer_service_table_id_seq'::regclass);


--
-- Name: event id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: join_table id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.join_table ALTER COLUMN id SET DEFAULT nextval('public.join_table_id_seq'::regclass);


--
-- Name: memberBenefits_table id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public."memberBenefits_table" ALTER COLUMN id SET DEFAULT nextval('public."memberBenefits_table_id_seq"'::regclass);


--
-- Name: order id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);


--
-- Name: order_status id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.order_status ALTER COLUMN id SET DEFAULT nextval('public.order_status_id_seq'::regclass);


--
-- Name: permission id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.permission ALTER COLUMN id SET DEFAULT nextval('public.permission_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: recommendations_table id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.recommendations_table ALTER COLUMN id SET DEFAULT nextval('public.recommendations_table_id_seq'::regclass);


--
-- Name: role_table id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.role_table ALTER COLUMN id SET DEFAULT nextval('public.role_table_id_seq'::regclass);


--
-- Name: supplier_table id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.supplier_table ALTER COLUMN id SET DEFAULT nextval('public.supplier_table_id_seq'::regclass);


--
-- Name: user_table id; Type: DEFAULT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.user_table ALTER COLUMN id SET DEFAULT nextval('public.user_table_id_seq'::regclass);


--
-- Data for Name: category_table; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public.category_table (id, customer_id, category_name) FROM stdin;
1	1	Dog
\.


--
-- Data for Name: community; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public.community (id, user_id, category_id, post, chatt) FROM stdin;
1	1	1	Wow, what a nice dog	chatt with yac
\.


--
-- Data for Name: cs_ticket; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public.cs_ticket (id, order_id, customer_service_id, issue_open, issue_closed) FROM stdin;
1	2	1	2022-02-09 15:09:39.019628+01	\N
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public.customer (id, user_id, category_id, receipt, history, chatt, member_lvl) FROM stdin;
1	1	\N	no receipt	empty	empty	gold_member
\.


--
-- Data for Name: customer_service_table; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public.customer_service_table (id, user_id, message) FROM stdin;
1	1	super nice service
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public.event (id, customer_id, category_id, event_name) FROM stdin;
1	1	1	Fråga vetrinären
\.


--
-- Data for Name: join_table; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public.join_table (id, customer_id, customer_service_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: memberBenefits_table; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public."memberBenefits_table" (id, event_id, customer_id, bonusladder, offers) FROM stdin;
1	1	1	1	none
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public."order" (id, order_status_id, product_id, user_id, supplier_id, date, total_price) FROM stdin;
2	\N	1	1	1	2022-02-09 14:50:51.157243+01	300kr
\.


--
-- Data for Name: order_status; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public.order_status (id, order_id, received, packing, ready_to_ship, sent, canceled, delayed) FROM stdin;
2	2	\N	\N	2022-02-09 15:02:58.819561+01	2022-02-09 15:02:58.819561+01	\N	\N
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public.permission (id, permission_status, auth) FROM stdin;
1	root	full permission
2	b2c	guest
3	customer	guest
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public.product (id, supplier_id, category_id, description, product_name, quantity, price) FROM stdin;
1	1	1	dog_food	Royal_canin	2	150kr
\.


--
-- Data for Name: recommendations_table; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public.recommendations_table (id, product_id, user_id, review) FROM stdin;
1	1	1	Bästa shoppen ever
\.


--
-- Data for Name: role_table; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public.role_table (id, permission_id, customer_id, role_name) FROM stdin;
1	3	\N	customer
\.


--
-- Data for Name: supplier_table; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public.supplier_table (id, product_id, adress, org_nummer, contact) FROM stdin;
1	\N	Liding�	324364_5677	0704065759
\.


--
-- Data for Name: user_table; Type: TABLE DATA; Schema: public; Owner: bb
--

COPY public.user_table (id, role_id, username, email, password, adress) FROM stdin;
1	1	yac	yac@atg.se	1234	Lidingö
\.


--
-- Name: category_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.category_table_id_seq', 1, true);


--
-- Name: community_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.community_id_seq', 1, true);


--
-- Name: cs_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.cs_ticket_id_seq', 1, true);


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.customer_id_seq', 1, true);


--
-- Name: customer_service_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.customer_service_table_id_seq', 2, true);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.event_id_seq', 1, true);


--
-- Name: join_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.join_table_id_seq', 1, true);


--
-- Name: memberBenefits_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public."memberBenefits_table_id_seq"', 1, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.order_id_seq', 2, true);


--
-- Name: order_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.order_status_id_seq', 2, true);


--
-- Name: permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.permission_id_seq', 3, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.product_id_seq', 1, true);


--
-- Name: recommendations_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.recommendations_table_id_seq', 1, true);


--
-- Name: role_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.role_table_id_seq', 2, true);


--
-- Name: supplier_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.supplier_table_id_seq', 1, true);


--
-- Name: user_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bb
--

SELECT pg_catalog.setval('public.user_table_id_seq', 2, true);


--
-- Name: category_table category_table_category_name_key; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.category_table
    ADD CONSTRAINT category_table_category_name_key UNIQUE (category_name);


--
-- Name: category_table category_table_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.category_table
    ADD CONSTRAINT category_table_pkey PRIMARY KEY (id);


--
-- Name: community community_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.community
    ADD CONSTRAINT community_pkey PRIMARY KEY (id);


--
-- Name: cs_ticket cs_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.cs_ticket
    ADD CONSTRAINT cs_ticket_pkey PRIMARY KEY (id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: customer_service_table customer_service_table_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.customer_service_table
    ADD CONSTRAINT customer_service_table_pkey PRIMARY KEY (id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: join_table join_table_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.join_table
    ADD CONSTRAINT join_table_pkey PRIMARY KEY (id);


--
-- Name: memberBenefits_table memberBenefits_table_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public."memberBenefits_table"
    ADD CONSTRAINT "memberBenefits_table_pkey" PRIMARY KEY (id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: order_status order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (id);


--
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: recommendations_table recommendations_table_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.recommendations_table
    ADD CONSTRAINT recommendations_table_pkey PRIMARY KEY (id);


--
-- Name: role_table role_table_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.role_table
    ADD CONSTRAINT role_table_pkey PRIMARY KEY (id);


--
-- Name: role_table role_table_role_name_key; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.role_table
    ADD CONSTRAINT role_table_role_name_key UNIQUE (role_name);


--
-- Name: supplier_table supplier_table_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.supplier_table
    ADD CONSTRAINT supplier_table_pkey PRIMARY KEY (id);


--
-- Name: user_table user_table_email_key; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_email_key UNIQUE (email);


--
-- Name: user_table user_table_password_key; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_password_key UNIQUE (password);


--
-- Name: user_table user_table_pkey; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (id);


--
-- Name: user_table user_table_username_key; Type: CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_username_key UNIQUE (username);


--
-- Name: community community_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.community
    ADD CONSTRAINT community_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category_table(id) ON DELETE SET NULL;


--
-- Name: community community_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.community
    ADD CONSTRAINT community_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_table(id) ON DELETE CASCADE;


--
-- Name: cs_ticket cs_ticket_customer_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.cs_ticket
    ADD CONSTRAINT cs_ticket_customer_service_id_fkey FOREIGN KEY (customer_service_id) REFERENCES public.customer_service_table(id) ON DELETE SET NULL;


--
-- Name: cs_ticket cs_ticket_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.cs_ticket
    ADD CONSTRAINT cs_ticket_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: customer customer_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category_table(id) ON DELETE SET NULL;


--
-- Name: customer_service_table customer_service_table_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.customer_service_table
    ADD CONSTRAINT customer_service_table_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_table(id) ON DELETE CASCADE;


--
-- Name: customer customer_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_table(id) ON DELETE CASCADE;


--
-- Name: event event_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category_table(id) ON DELETE SET NULL;


--
-- Name: event event_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON DELETE SET NULL;


--
-- Name: join_table join_table_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.join_table
    ADD CONSTRAINT join_table_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- Name: join_table join_table_customer_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.join_table
    ADD CONSTRAINT join_table_customer_service_id_fkey FOREIGN KEY (customer_service_id) REFERENCES public.customer_service_table(id) ON DELETE CASCADE;


--
-- Name: memberBenefits_table memberBenefits_table_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public."memberBenefits_table"
    ADD CONSTRAINT "memberBenefits_table_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- Name: memberBenefits_table memberBenefits_table_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public."memberBenefits_table"
    ADD CONSTRAINT "memberBenefits_table_event_id_fkey" FOREIGN KEY (event_id) REFERENCES public.event(id) ON DELETE SET NULL;


--
-- Name: order order_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE SET NULL;


--
-- Name: order_status order_status_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: order order_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier_table(id) ON DELETE SET NULL;


--
-- Name: order order_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_table(id) ON DELETE CASCADE;


--
-- Name: product product_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category_table(id) ON DELETE SET NULL;


--
-- Name: product product_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier_table(id) ON DELETE SET NULL;


--
-- Name: recommendations_table recommendations_table_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.recommendations_table
    ADD CONSTRAINT recommendations_table_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE SET NULL;


--
-- Name: recommendations_table recommendations_table_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.recommendations_table
    ADD CONSTRAINT recommendations_table_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_table(id) ON DELETE CASCADE;


--
-- Name: role_table role_table_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bb
--

ALTER TABLE ONLY public.role_table
    ADD CONSTRAINT role_table_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permission(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

