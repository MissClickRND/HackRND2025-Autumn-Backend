--
-- PostgreSQL database dump
--

\restrict I28LldlmJzgXC1Sb84JLT9o8Y1kMiNItcMAEi50hlqm8H1FUzMtuLGHb6STVxFc

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO "user";

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: user
--

COMMENT ON SCHEMA public IS '';


--
-- Name: Role; Type: TYPE; Schema: public; Owner: user
--

CREATE TYPE public."Role" AS ENUM (
    'Admin',
    'Analyst',
    'User',
    'NotVerify'
);


ALTER TYPE public."Role" OWNER TO "user";

--
-- Name: System; Type: TYPE; Schema: public; Owner: user
--

CREATE TYPE public."System" AS ENUM (
    'Mobile',
    'Web'
);


ALTER TYPE public."System" OWNER TO "user";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Cost; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Cost" (
    id integer NOT NULL,
    "projectId" integer NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    amount double precision NOT NULL,
    "typeId" integer NOT NULL,
    "statusId" integer NOT NULL
);


ALTER TABLE public."Cost" OWNER TO "user";

--
-- Name: Cost_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."Cost_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Cost_id_seq" OWNER TO "user";

--
-- Name: Cost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."Cost_id_seq" OWNED BY public."Cost".id;


--
-- Name: Expenses; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Expenses" (
    id integer NOT NULL,
    name text NOT NULL,
    "typeId" integer NOT NULL
);


ALTER TABLE public."Expenses" OWNER TO "user";

--
-- Name: Expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."Expenses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Expenses_id_seq" OWNER TO "user";

--
-- Name: Expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."Expenses_id_seq" OWNED BY public."Expenses".id;


--
-- Name: Indicator; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Indicator" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Indicator" OWNER TO "user";

--
-- Name: Indicator_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."Indicator_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Indicator_id_seq" OWNER TO "user";

--
-- Name: Indicator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."Indicator_id_seq" OWNED BY public."Indicator".id;


--
-- Name: PaymentType; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."PaymentType" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."PaymentType" OWNER TO "user";

--
-- Name: PaymentType_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."PaymentType_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PaymentType_id_seq" OWNER TO "user";

--
-- Name: PaymentType_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."PaymentType_id_seq" OWNED BY public."PaymentType".id;


--
-- Name: Probability; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Probability" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Probability" OWNER TO "user";

--
-- Name: Probability_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."Probability_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Probability_id_seq" OWNER TO "user";

--
-- Name: Probability_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."Probability_id_seq" OWNED BY public."Probability".id;


--
-- Name: Project; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Project" (
    id integer NOT NULL,
    organization_name text NOT NULL,
    inn text NOT NULL,
    project_name text NOT NULL,
    "serviceId" integer NOT NULL,
    "paymentTypeId" integer NOT NULL,
    "stageId" integer NOT NULL,
    probability double precision NOT NULL,
    manager text NOT NULL,
    "segmentId" integer NOT NULL,
    implementation_year integer NOT NULL,
    industry_solution boolean DEFAULT false NOT NULL,
    forecast_accepted boolean DEFAULT false NOT NULL,
    implemented_via_dzo boolean DEFAULT false NOT NULL,
    requires_executive_control boolean DEFAULT false NOT NULL,
    evaluation_status_id integer,
    industry_manager text,
    project_number text,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Project" OWNER TO "user";

--
-- Name: ProjectDetails; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."ProjectDetails" (
    id integer NOT NULL,
    "projectId" integer NOT NULL,
    "currentStatus" character varying(1000),
    done_this_period character varying(1000),
    plans_next_period character varying(1000)
);


ALTER TABLE public."ProjectDetails" OWNER TO "user";

--
-- Name: ProjectDetails_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."ProjectDetails_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ProjectDetails_id_seq" OWNER TO "user";

--
-- Name: ProjectDetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."ProjectDetails_id_seq" OWNED BY public."ProjectDetails".id;


--
-- Name: Project_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."Project_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Project_id_seq" OWNER TO "user";

--
-- Name: Project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."Project_id_seq" OWNED BY public."Project".id;


--
-- Name: RefreshToken; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."RefreshToken" (
    id integer NOT NULL,
    token text NOT NULL,
    system public."System" NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    revoked boolean DEFAULT false NOT NULL
);


ALTER TABLE public."RefreshToken" OWNER TO "user";

--
-- Name: RefreshToken_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."RefreshToken_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RefreshToken_id_seq" OWNER TO "user";

--
-- Name: RefreshToken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."RefreshToken_id_seq" OWNED BY public."RefreshToken".id;


--
-- Name: Revenue; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Revenue" (
    id integer NOT NULL,
    "projectId" integer NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    amount double precision NOT NULL,
    "statusId" integer NOT NULL
);


ALTER TABLE public."Revenue" OWNER TO "user";

--
-- Name: Revenue_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."Revenue_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Revenue_id_seq" OWNER TO "user";

--
-- Name: Revenue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."Revenue_id_seq" OWNED BY public."Revenue".id;


--
-- Name: Segment; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Segment" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Segment" OWNER TO "user";

--
-- Name: Segment_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."Segment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Segment_id_seq" OWNER TO "user";

--
-- Name: Segment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."Segment_id_seq" OWNED BY public."Segment".id;


--
-- Name: Services; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Services" (
    id integer NOT NULL,
    name text NOT NULL,
    "typeId" integer NOT NULL
);


ALTER TABLE public."Services" OWNER TO "user";

--
-- Name: Services_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."Services_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Services_id_seq" OWNER TO "user";

--
-- Name: Services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."Services_id_seq" OWNED BY public."Services".id;


--
-- Name: Stage; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Stage" (
    id integer NOT NULL,
    name text NOT NULL,
    "probabilityId" integer NOT NULL
);


ALTER TABLE public."Stage" OWNER TO "user";

--
-- Name: Stage_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."Stage_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Stage_id_seq" OWNER TO "user";

--
-- Name: Stage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."Stage_id_seq" OWNED BY public."Stage".id;


--
-- Name: StatusExpenses; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."StatusExpenses" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."StatusExpenses" OWNER TO "user";

--
-- Name: StatusExpenses_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."StatusExpenses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."StatusExpenses_id_seq" OWNER TO "user";

--
-- Name: StatusExpenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."StatusExpenses_id_seq" OWNED BY public."StatusExpenses".id;


--
-- Name: StatusRevenue; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."StatusRevenue" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."StatusRevenue" OWNER TO "user";

--
-- Name: StatusRevenue_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."StatusRevenue_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."StatusRevenue_id_seq" OWNER TO "user";

--
-- Name: StatusRevenue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."StatusRevenue_id_seq" OWNED BY public."StatusRevenue".id;


--
-- Name: TypeExpenses; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."TypeExpenses" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."TypeExpenses" OWNER TO "user";

--
-- Name: TypeExpenses_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."TypeExpenses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."TypeExpenses_id_seq" OWNER TO "user";

--
-- Name: TypeExpenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."TypeExpenses_id_seq" OWNED BY public."TypeExpenses".id;


--
-- Name: TypeService; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."TypeService" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."TypeService" OWNER TO "user";

--
-- Name: TypeService_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."TypeService_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."TypeService_id_seq" OWNER TO "user";

--
-- Name: TypeService_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."TypeService_id_seq" OWNED BY public."TypeService".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    name text NOT NULL,
    role public."Role" DEFAULT 'NotVerify'::public."Role" NOT NULL
);


ALTER TABLE public."User" OWNER TO "user";

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_id_seq" OWNER TO "user";

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: Cost id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Cost" ALTER COLUMN id SET DEFAULT nextval('public."Cost_id_seq"'::regclass);


--
-- Name: Expenses id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Expenses" ALTER COLUMN id SET DEFAULT nextval('public."Expenses_id_seq"'::regclass);


--
-- Name: Indicator id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Indicator" ALTER COLUMN id SET DEFAULT nextval('public."Indicator_id_seq"'::regclass);


--
-- Name: PaymentType id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."PaymentType" ALTER COLUMN id SET DEFAULT nextval('public."PaymentType_id_seq"'::regclass);


--
-- Name: Probability id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Probability" ALTER COLUMN id SET DEFAULT nextval('public."Probability_id_seq"'::regclass);


--
-- Name: Project id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Project" ALTER COLUMN id SET DEFAULT nextval('public."Project_id_seq"'::regclass);


--
-- Name: ProjectDetails id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."ProjectDetails" ALTER COLUMN id SET DEFAULT nextval('public."ProjectDetails_id_seq"'::regclass);


--
-- Name: RefreshToken id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."RefreshToken" ALTER COLUMN id SET DEFAULT nextval('public."RefreshToken_id_seq"'::regclass);


--
-- Name: Revenue id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Revenue" ALTER COLUMN id SET DEFAULT nextval('public."Revenue_id_seq"'::regclass);


--
-- Name: Segment id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Segment" ALTER COLUMN id SET DEFAULT nextval('public."Segment_id_seq"'::regclass);


--
-- Name: Services id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Services" ALTER COLUMN id SET DEFAULT nextval('public."Services_id_seq"'::regclass);


--
-- Name: Stage id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Stage" ALTER COLUMN id SET DEFAULT nextval('public."Stage_id_seq"'::regclass);


--
-- Name: StatusExpenses id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."StatusExpenses" ALTER COLUMN id SET DEFAULT nextval('public."StatusExpenses_id_seq"'::regclass);


--
-- Name: StatusRevenue id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."StatusRevenue" ALTER COLUMN id SET DEFAULT nextval('public."StatusRevenue_id_seq"'::regclass);


--
-- Name: TypeExpenses id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."TypeExpenses" ALTER COLUMN id SET DEFAULT nextval('public."TypeExpenses_id_seq"'::regclass);


--
-- Name: TypeService id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."TypeService" ALTER COLUMN id SET DEFAULT nextval('public."TypeService_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: Cost; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Cost" (id, "projectId", year, month, amount, "typeId", "statusId") FROM stdin;
1	1	2025	11	300000	1	3
2	1	2025	11	50000	2	1
\.


--
-- Data for Name: Expenses; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Expenses" (id, name, "typeId") FROM stdin;
1	Продажа товаров	1
2	Прочие прямые	1
3	Субподряд	2
4	Аренда каналов	1
5	ГПХ	2
6	СВ по ГПХ	2
7	ПиПТ	1
8	Контент	1
9	Доставка счетов	1
10	Реклама	2
11	Комиссионные	2
12	РУО	1
13	РСД	3
14	Штрафы	4
\.


--
-- Data for Name: Indicator; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Indicator" (id, name) FROM stdin;
1	Снят
2	Новый
3	Перенос
4	Увеличен
5	Снижен
6	Принят в оценку
7	Исключен из оценки
8	Реализован
\.


--
-- Data for Name: PaymentType; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."PaymentType" (id, name) FROM stdin;
1	Инсталляции
2	Сервисная
3	Оборудование
4	Разовые
5	Интеграционные проекты
\.


--
-- Data for Name: Probability; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Probability" (id, name) FROM stdin;
1	10%
2	30%
3	40%
4	50%
5	70%
6	80%
7	90%
8	100%
\.


--
-- Data for Name: Project; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Project" (id, organization_name, inn, project_name, "serviceId", "paymentTypeId", "stageId", probability, manager, "segmentId", implementation_year, industry_solution, forecast_accepted, implemented_via_dzo, requires_executive_control, evaluation_status_id, industry_manager, project_number, created_at, updated_at) FROM stdin;
1	ООО «Телеком-Сервис»	7701234567	Внедрение облачной АТС для госучреждения	2	1	7	70	Иванов А.С.	2	2025	t	t	f	t	6	Петров В.В.	PRJ-2025-GOV-001	2025-10-25 14:05:53.609	2025-10-25 14:05:53.609
\.


--
-- Data for Name: ProjectDetails; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."ProjectDetails" (id, "projectId", "currentStatus", done_this_period, plans_next_period) FROM stdin;
1	1	На стадии подписания договора поставки. Согласованы технические требования.	Проведена презентация решения, согласован бюджет, подготовлен проект ДД.	Подписание ДД, запуск пилотной зоны, начало миграции номеров.
\.


--
-- Data for Name: RefreshToken; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."RefreshToken" (id, token, system, "userId", "createdAt", "expiresAt", revoked) FROM stdin;
1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMTYwNywiZXhwIjoxNzYxOTM2NDA3fQ.f0lmJDlHsbBGGbXgiyTjzuxMHfQIr2rQld0gHa4_N6E	Web	1	2025-10-24 18:46:47.503	2025-10-31 18:46:47.493	f
2	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMTg4NSwiZXhwIjoxNzYxOTM2Njg1fQ.hlcNy0OHW_b1aBjTj_E6_gomFMEsZetYhsDOXHTwr-U	Web	1	2025-10-24 18:51:25.833	2025-10-31 18:51:25.823	f
3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMjA3MCwiZXhwIjoxNzYxOTM2ODcwfQ.s3BC-BamNc2XOJ3MkXUtdp-yoxau1xrng6oYkjxRO1c	Web	1	2025-10-24 18:54:30.021	2025-10-31 18:54:30.019	f
4	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMjM4NiwiZXhwIjoxNzYxOTM3MTg2fQ.gTMZ2WwfqS4iz3kBk-v9-VGi_atjq3FwgD85Zk4IgOM	Web	1	2025-10-24 18:59:46.718	2025-10-31 18:59:46.714	f
5	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMjU4NiwiZXhwIjoxNzYxOTM3Mzg2fQ.-YcmB9KLsG2MvTB0lAAbn9yPEioXddUY4lVooXhiNxU	Web	1	2025-10-24 19:03:06.08	2025-10-31 19:03:06.073	f
6	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjEzNDM1MjYsImV4cCI6MTc2MTk0ODMyNn0.LFllcvnMCGW5fkfow3Y7GPlBLRoj-IqBZ5GFcDLp4JM	Web	2	2025-10-24 22:05:26.691	2025-10-31 22:05:26.67	f
7	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RAZXhhbXBsZTQuY29tIiwic3ViIjozLCJpYXQiOjE3NjEzODMzNDUsImV4cCI6MTc2MTk4ODE0NX0.lwNw9ZSqKxCQTD9szgx9M_C-ckgHDN7ayCk9FM7Q9mQ	Mobile	3	2025-10-25 09:09:05.903	2025-11-01 09:09:05.9	f
8	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RAZXhhbXBsZTMuY29tIiwic3ViIjo0LCJpYXQiOjE3NjEzODM2MjUsImV4cCI6MTc2MTk4ODQyNX0.Rmt87NwpFiOoSC_iVaT0qFhSLl8cu7QpQ6zDZ7-XqNU	Mobile	4	2025-10-25 09:13:45.524	2025-11-01 09:13:45.52	f
9	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjEzODU3MDYsImV4cCI6MTc2MTk5MDUwNn0.uBUl7P3dUZg5eLXvf5KKgWHWJY5cdOHvW8NKzLdumXc	Mobile	2	2025-10-25 09:48:26.033	2025-11-01 09:48:26.031	f
10	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjEzOTA1NDMsImV4cCI6MTc2MTk5NTM0M30.U8phDlXjHvvjdC33FYh63xfJMdhFMpGBeBQpd6FdXQU	Web	2	2025-10-25 11:09:03.426	2025-11-01 11:09:03.422	f
11	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjEzOTA1NjcsImV4cCI6MTc2MTk5NTM2N30.DneSMzgIcp-SDfMdXkD6MY6lAMT1BvnrimP_Yaxcyg8	Web	2	2025-10-25 11:09:27.442	2025-11-01 11:09:27.44	f
12	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjEzOTA1NzEsImV4cCI6MTc2MTk5NTM3MX0.tmgZ5ED_etV1mBWfNBhwv8Ad2aPlkBl9eAT71kv5mIw	Web	2	2025-10-25 11:09:31.646	2025-11-01 11:09:31.644	f
13	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RANDJleGFtcGxlLmNvbSIsInN1YiI6NSwiaWF0IjoxNzYxMzkwNjYzLCJleHAiOjE3NjE5OTU0NjN9.g5EJ-KFCIXHVvo23wK7Iv3S-YQJK9NI0bZNq21BIOVQ	Mobile	5	2025-10-25 11:11:03.9	2025-11-01 11:11:03.897	f
14	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RANDJleGFtcGxlLmNvbSIsInN1YiI6NSwiaWF0IjoxNzYxMzkwNzIzLCJleHAiOjE3NjE5OTU1MjN9._V0zMKHka8iMMTOr-TE-wIopbmG0f7U2SS2zW9kcx2U	Mobile	5	2025-10-25 11:12:03.653	2025-11-01 11:12:03.651	f
15	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RANDJleGFtcGxlLmNvbSIsInN1YiI6NSwiaWF0IjoxNzYxMzkxODA4LCJleHAiOjE3NjE5OTY2MDh9.0CdBsqy18uEng_3YY-yN3HqSedZBnwrDftq2tP9aKsg	Mobile	5	2025-10-25 11:30:08.929	2025-11-01 11:30:08.926	f
16	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RANDJleGFtcGxlLmNvbSIsInN1YiI6NSwiaWF0IjoxNzYxMzkyNTEwLCJleHAiOjE3NjE5OTczMTB9.uuD8_Ui-caSZvOMsjQ3vTOQHPY7WEQSfOC8UqHIh14k	Mobile	5	2025-10-25 11:41:50.398	2025-11-01 11:41:50.397	f
17	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RANDJleGFtcGxlLmNvbSIsInN1YiI6NSwiaWF0IjoxNzYxMzkzMTA5LCJleHAiOjE3NjE5OTc5MDl9.yIXsMKJeYR1YLhm5e8elLVEsJo1k_4BApWeqt_A4aCM	Mobile	5	2025-10-25 11:51:49.619	2025-11-01 11:51:49.614	f
18	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RANDJleGFtcGxlLmNvbSIsInN1YiI6NSwiaWF0IjoxNzYxMzk1OTk2LCJleHAiOjE3NjIwMDA3OTZ9.1t9Dt93IXoekk2tW3MBaDEk-YAg7DbfBlxiK4gccR7M	Mobile	5	2025-10-25 12:39:56.057	2025-11-01 12:39:56.05	f
19	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RANDJleGFtcGxlLmNvbSIsInN1YiI6NSwiaWF0IjoxNzYxMzk2MTk5LCJleHAiOjE3NjIwMDA5OTl9.XOaok-XJnxQ5CIYxCNHtbvJRDCfHXD9QUnunQIoItXA	Mobile	5	2025-10-25 12:43:19.674	2025-11-01 12:43:19.666	f
20	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjEzOTYyNjIsImV4cCI6MTc2MjAwMTA2Mn0.4TfYTiwSBLK0R3XxcNBVimHzhxn6y4v6v-VvQ3G7Evk	Mobile	2	2025-10-25 12:44:22.281	2025-11-01 12:44:22.28	f
21	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjE0MDE4MjksImV4cCI6MTc2MjAwNjYyOX0.f-SmpvQHlFab9JVEK-S7hWieX5rneNq0eVCEx_jiwys	Mobile	2	2025-10-25 14:17:09.143	2025-11-01 14:17:09.14	f
22	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjE0MDE4NjksImV4cCI6MTc2MjAwNjY2OX0.8a35blrvaPl4MqmaFNuVU5Pd56ycRIFLP74JdNTYx6k	Mobile	2	2025-10-25 14:17:49.319	2025-11-01 14:17:49.317	f
23	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjE0MDI2NDgsImV4cCI6MTc2MjAwNzQ0OH0.OQJtsjevB1w-7Z_WMXPIO7393CWjajg5BdhiHz69bg8	Mobile	2	2025-10-25 14:30:48.58	2025-11-01 14:30:48.574	f
24	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjE0MDM5OTcsImV4cCI6MTc2MjAwODc5N30.b5oN2AKqRB7GFhZBuqW4uiiG96qXV5peePOJXyfkgO0	Mobile	2	2025-10-25 14:53:17.894	2025-11-01 14:53:17.891	f
25	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjE0MDQxOTUsImV4cCI6MTc2MjAwODk5NX0.Yi4afswFYn4VDwcLgEbdLcO4mTX0f7W84BFLSJ3ryDc	Mobile	2	2025-10-25 14:56:35.567	2025-11-01 14:56:35.563	f
26	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjE0MDU1MDksImV4cCI6MTc2MjAxMDMwOX0.NNckn2rDoNz59s2uWA8kEz6qochtK0oOx4IXCeGvAig	Mobile	2	2025-10-25 15:18:29.699	2025-11-01 15:18:29.695	f
27	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjE0MDY1MzcsImV4cCI6MTc2MjAxMTMzN30.raMNyvu9enDaOvGzeefJThy_DdK2_V14nvJzvWCS1zE	Mobile	2	2025-10-25 15:35:37.737	2025-11-01 15:35:37.732	f
28	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RAMWhtYWlsLmNvbSIsInN1YiI6NiwiaWF0IjoxNzYxNDA2NjI1LCJleHAiOjE3NjIwMTE0MjV9.CSC0Vx1AMhTI55i5BR4eMY7KZNpLEGB58KyeMD1VS-Y	Mobile	6	2025-10-25 15:37:05.754	2025-11-01 15:37:05.751	f
29	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjE0MDY2OTAsImV4cCI6MTc2MjAxMTQ5MH0.cbfi0v__UzxcLc7Tsdc8Patl4Sn19jsbPGn7ZfVldUI	Mobile	2	2025-10-25 15:38:10.014	2025-11-01 15:38:10.012	f
30	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjE0MDcwNTUsImV4cCI6MTc2MjAxMTg1NX0.29Xh2Z_EseUBtmQyTB-7HiVtPIVcj4XJ4CznU272evs	Mobile	2	2025-10-25 15:44:15.913	2025-11-01 15:44:15.909	f
\.


--
-- Data for Name: Revenue; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Revenue" (id, "projectId", year, month, amount, "statusId") FROM stdin;
1	1	2025	11	1500000	2
2	1	2025	12	2000000	3
\.


--
-- Data for Name: Segment; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Segment" (id, name) FROM stdin;
1	Крупный сектор
2	Госсектор
3	Средний сегмент
4	Малые предприятия
\.


--
-- Data for Name: Services; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Services" (id, name, "typeId") FROM stdin;
1	Интернет	1
2	Телефония	1
3	Инфобез	2
4	Цифровые сервисы	3
5	Облачные сервисы	3
6	Отраслевые решения	4
\.


--
-- Data for Name: Stage; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Stage" (id, name, "probabilityId") FROM stdin;
1	1.Лид	1
2	2.Проработка лида	1
3	3.КП	2
4	4.Пилот	3
5	5.Выделение финансирования	3
6	6.Закупка/Торги	4
7	7.Заключение ДД	5
8	8.Заключение РД	6
9	9.Реализация	7
10	10.Успех	8
\.


--
-- Data for Name: StatusExpenses; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."StatusExpenses" (id, name) FROM stdin;
1	Начислено
2	Созданы Резервы
3	Планируется
\.


--
-- Data for Name: StatusRevenue; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."StatusRevenue" (id, name) FROM stdin;
1	Начислено
2	Прогнозное начисление
3	Планируется
\.


--
-- Data for Name: TypeExpenses; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."TypeExpenses" (id, name) FROM stdin;
1	Прямые
2	Коммерческие
3	РСД
4	Штрафы
\.


--
-- Data for Name: TypeService; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."TypeService" (id, name) FROM stdin;
1	Традиционный бизнес
2	КиберБез
3	Новый телеком
4	Проектная деятельность
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."User" (id, email, password, name, role) FROM stdin;
1	vladt@mail.ru	$2b$10$UkAxLAIyobvXQ/krA9MgG./qlwAYu5FZjVRLqdtJA0kewDCweH9ga	Владик	NotVerify
2	vladt2017@mail.ru	$2b$10$ZxB0vPvgfurj9ifUBYxmKOoNNv0i4SuUTK8uPTS7oGDhvp3TMti8a	Владик	Admin
3	test@example4.com	$2b$10$SXAbFQb6YflGsjVuKJaLN.MYsnwGjv50aFDYzZCCfb56DIsMAkete	string	NotVerify
4	test@example3.com	$2b$10$B6PI.58cV/c3g9ZvsDCJZOqskwI5.woo2Ncmxe4Viotk4wPI5.d3u	string	NotVerify
5	test@42example.com	$2b$10$4mcdL4i5VK5Y6Aiw6UAs..PTnbXRwemqFijU9ZTFgbXi.AwX9B84S	bob	NotVerify
6	test@1hmail.com	$2b$10$GEypHxX6sBUEMvn8UzPORuAb3TrkTb./7kZ3aAVioAgBGMgGItfOa	string	User
\.


--
-- Name: Cost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Cost_id_seq"', 2, true);


--
-- Name: Expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Expenses_id_seq"', 1, false);


--
-- Name: Indicator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Indicator_id_seq"', 1, true);


--
-- Name: PaymentType_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."PaymentType_id_seq"', 1, false);


--
-- Name: Probability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Probability_id_seq"', 1, false);


--
-- Name: ProjectDetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."ProjectDetails_id_seq"', 1, true);


--
-- Name: Project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Project_id_seq"', 1, true);


--
-- Name: RefreshToken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."RefreshToken_id_seq"', 30, true);


--
-- Name: Revenue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Revenue_id_seq"', 2, true);


--
-- Name: Segment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Segment_id_seq"', 1, false);


--
-- Name: Services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Services_id_seq"', 1, false);


--
-- Name: Stage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Stage_id_seq"', 1, false);


--
-- Name: StatusExpenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."StatusExpenses_id_seq"', 1, false);


--
-- Name: StatusRevenue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."StatusRevenue_id_seq"', 1, false);


--
-- Name: TypeExpenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."TypeExpenses_id_seq"', 1, false);


--
-- Name: TypeService_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."TypeService_id_seq"', 1, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."User_id_seq"', 6, true);


--
-- Name: Cost Cost_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Cost"
    ADD CONSTRAINT "Cost_pkey" PRIMARY KEY (id);


--
-- Name: Expenses Expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Expenses"
    ADD CONSTRAINT "Expenses_pkey" PRIMARY KEY (id);


--
-- Name: Indicator Indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Indicator"
    ADD CONSTRAINT "Indicator_pkey" PRIMARY KEY (id);


--
-- Name: PaymentType PaymentType_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."PaymentType"
    ADD CONSTRAINT "PaymentType_pkey" PRIMARY KEY (id);


--
-- Name: Probability Probability_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Probability"
    ADD CONSTRAINT "Probability_pkey" PRIMARY KEY (id);


--
-- Name: ProjectDetails ProjectDetails_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."ProjectDetails"
    ADD CONSTRAINT "ProjectDetails_pkey" PRIMARY KEY (id);


--
-- Name: Project Project_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY (id);


--
-- Name: RefreshToken RefreshToken_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."RefreshToken"
    ADD CONSTRAINT "RefreshToken_pkey" PRIMARY KEY (id);


--
-- Name: Revenue Revenue_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Revenue"
    ADD CONSTRAINT "Revenue_pkey" PRIMARY KEY (id);


--
-- Name: Segment Segment_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Segment"
    ADD CONSTRAINT "Segment_pkey" PRIMARY KEY (id);


--
-- Name: Services Services_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_pkey" PRIMARY KEY (id);


--
-- Name: Stage Stage_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Stage"
    ADD CONSTRAINT "Stage_pkey" PRIMARY KEY (id);


--
-- Name: StatusExpenses StatusExpenses_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."StatusExpenses"
    ADD CONSTRAINT "StatusExpenses_pkey" PRIMARY KEY (id);


--
-- Name: StatusRevenue StatusRevenue_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."StatusRevenue"
    ADD CONSTRAINT "StatusRevenue_pkey" PRIMARY KEY (id);


--
-- Name: TypeExpenses TypeExpenses_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."TypeExpenses"
    ADD CONSTRAINT "TypeExpenses_pkey" PRIMARY KEY (id);


--
-- Name: TypeService TypeService_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."TypeService"
    ADD CONSTRAINT "TypeService_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: ProjectDetails_projectId_key; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX "ProjectDetails_projectId_key" ON public."ProjectDetails" USING btree ("projectId");


--
-- Name: RefreshToken_token_key; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX "RefreshToken_token_key" ON public."RefreshToken" USING btree (token);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: Cost Cost_projectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Cost"
    ADD CONSTRAINT "Cost_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES public."Project"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Cost Cost_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Cost"
    ADD CONSTRAINT "Cost_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."StatusExpenses"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Cost Cost_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Cost"
    ADD CONSTRAINT "Cost_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public."TypeExpenses"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Expenses Expenses_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Expenses"
    ADD CONSTRAINT "Expenses_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public."TypeExpenses"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ProjectDetails ProjectDetails_projectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."ProjectDetails"
    ADD CONSTRAINT "ProjectDetails_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES public."Project"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Project Project_evaluation_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_evaluation_status_id_fkey" FOREIGN KEY (evaluation_status_id) REFERENCES public."Indicator"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Project Project_paymentTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_paymentTypeId_fkey" FOREIGN KEY ("paymentTypeId") REFERENCES public."PaymentType"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Project Project_segmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_segmentId_fkey" FOREIGN KEY ("segmentId") REFERENCES public."Segment"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Project Project_serviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES public."Services"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Project Project_stageId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_stageId_fkey" FOREIGN KEY ("stageId") REFERENCES public."Stage"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: RefreshToken RefreshToken_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."RefreshToken"
    ADD CONSTRAINT "RefreshToken_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Revenue Revenue_projectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Revenue"
    ADD CONSTRAINT "Revenue_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES public."Project"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Revenue Revenue_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Revenue"
    ADD CONSTRAINT "Revenue_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."StatusRevenue"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Services Services_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public."TypeService"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Stage Stage_probabilityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Stage"
    ADD CONSTRAINT "Stage_probabilityId_fkey" FOREIGN KEY ("probabilityId") REFERENCES public."Probability"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: user
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict I28LldlmJzgXC1Sb84JLT9o8Y1kMiNItcMAEi50hlqm8H1FUzMtuLGHb6STVxFc

