--
-- PostgreSQL database dump
--

\restrict AZgk2lKxTXPvazeiSYlcDHzX8Ft7QxuyGJm0TtrRRlxBiXkLuYBsbOeouJRVRtz

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
-- Name: StatusExpences; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."StatusExpences" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."StatusExpences" OWNER TO "user";

--
-- Name: StatusExpences_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."StatusExpences_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."StatusExpences_id_seq" OWNER TO "user";

--
-- Name: StatusExpences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."StatusExpences_id_seq" OWNED BY public."StatusExpences".id;


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
-- Name: RefreshToken id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."RefreshToken" ALTER COLUMN id SET DEFAULT nextval('public."RefreshToken_id_seq"'::regclass);


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
-- Name: StatusExpences id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."StatusExpences" ALTER COLUMN id SET DEFAULT nextval('public."StatusExpences_id_seq"'::regclass);


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
-- Data for Name: RefreshToken; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."RefreshToken" (id, token, system, "userId", "createdAt", "expiresAt", revoked) FROM stdin;
1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMTYwNywiZXhwIjoxNzYxOTM2NDA3fQ.f0lmJDlHsbBGGbXgiyTjzuxMHfQIr2rQld0gHa4_N6E	Web	1	2025-10-24 18:46:47.503	2025-10-31 18:46:47.493	f
2	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMTg4NSwiZXhwIjoxNzYxOTM2Njg1fQ.hlcNy0OHW_b1aBjTj_E6_gomFMEsZetYhsDOXHTwr-U	Web	1	2025-10-24 18:51:25.833	2025-10-31 18:51:25.823	f
3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMjA3MCwiZXhwIjoxNzYxOTM2ODcwfQ.s3BC-BamNc2XOJ3MkXUtdp-yoxau1xrng6oYkjxRO1c	Web	1	2025-10-24 18:54:30.021	2025-10-31 18:54:30.019	f
4	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMjM4NiwiZXhwIjoxNzYxOTM3MTg2fQ.gTMZ2WwfqS4iz3kBk-v9-VGi_atjq3FwgD85Zk4IgOM	Web	1	2025-10-24 18:59:46.718	2025-10-31 18:59:46.714	f
5	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMjU4NiwiZXhwIjoxNzYxOTM3Mzg2fQ.-YcmB9KLsG2MvTB0lAAbn9yPEioXddUY4lVooXhiNxU	Web	1	2025-10-24 19:03:06.08	2025-10-31 19:03:06.073	f
6	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0MjAxN0BtYWlsLnJ1Iiwic3ViIjoyLCJpYXQiOjE3NjEzNDM1MjYsImV4cCI6MTc2MTk0ODMyNn0.LFllcvnMCGW5fkfow3Y7GPlBLRoj-IqBZ5GFcDLp4JM	Web	2	2025-10-24 22:05:26.691	2025-10-31 22:05:26.67	f
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
-- Data for Name: StatusExpences; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."StatusExpences" (id, name) FROM stdin;
1	Начислено
2	Создан резерв
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
3	vladt1@mail.ru	$2b$10$UkAxLAIyobvXQ/krA9MgG./qlwAYu5FZjVRLqdtJA0kewDCweH9ga	Владик	NotVerify
4	vladt2@mail.ru	$2b$10$ZxB0vPvgfurj9ifUBYxmKOoNNv0i4SuUTK8uPTS7oGDhvp3TMti8a	Владик	User
5	vladt3@mail.ru	$2b$10$UkAxLAIyobvXQ/krA9MgG./qlwAYu5FZjVRLqdtJA0kewDCweH9ga	Владик	NotVerify
6	vladt4@mail.ru	$2b$10$ZxB0vPvgfurj9ifUBYxmKOoNNv0i4SuUTK8uPTS7oGDhvp3TMti8a	Владик	User
7	vladt5@mail.ru	$2b$10$UkAxLAIyobvXQ/krA9MgG./qlwAYu5FZjVRLqdtJA0kewDCweH9ga	Владик	NotVerify
8	vladt6@mail.ru	$2b$10$ZxB0vPvgfurj9ifUBYxmKOoNNv0i4SuUTK8uPTS7oGDhvp3TMti8a	Владик	User
9	vladt7@mail.ru	$2b$10$UkAxLAIyobvXQ/krA9MgG./qlwAYu5FZjVRLqdtJA0kewDCweH9ga	Владик	NotVerify
10	vladt8@mail.ru	$2b$10$ZxB0vPvgfurj9ifUBYxmKOoNNv0i4SuUTK8uPTS7oGDhvp3TMti8a	Владик	Admin
\.


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
-- Name: RefreshToken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."RefreshToken_id_seq"', 6, true);


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
-- Name: StatusExpences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."StatusExpences_id_seq"', 1, false);


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

SELECT pg_catalog.setval('public."User_id_seq"', 2, true);


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
-- Name: RefreshToken RefreshToken_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."RefreshToken"
    ADD CONSTRAINT "RefreshToken_pkey" PRIMARY KEY (id);


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
-- Name: StatusExpences StatusExpences_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."StatusExpences"
    ADD CONSTRAINT "StatusExpences_pkey" PRIMARY KEY (id);


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
-- Name: RefreshToken_token_key; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX "RefreshToken_token_key" ON public."RefreshToken" USING btree (token);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: Expenses Expenses_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Expenses"
    ADD CONSTRAINT "Expenses_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public."TypeExpenses"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: RefreshToken RefreshToken_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."RefreshToken"
    ADD CONSTRAINT "RefreshToken_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


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

\unrestrict AZgk2lKxTXPvazeiSYlcDHzX8Ft7QxuyGJm0TtrRRlxBiXkLuYBsbOeouJRVRtz

