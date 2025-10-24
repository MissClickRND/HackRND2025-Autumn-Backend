--
-- PostgreSQL database dump
--

\restrict XyHJmu7hyUUI35xaSdrrvaHJWIJ0T9JwX38WQjDinlMEh9moMB9wdZRGg2retry

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
-- Name: RefreshToken id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."RefreshToken" ALTER COLUMN id SET DEFAULT nextval('public."RefreshToken_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: RefreshToken; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."RefreshToken" (id, token, system, "userId", "createdAt", "expiresAt", revoked) FROM stdin;
1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMTYwNywiZXhwIjoxNzYxOTM2NDA3fQ.f0lmJDlHsbBGGbXgiyTjzuxMHfQIr2rQld0gHa4_N6E	Web	1	2025-10-24 18:46:47.503	2025-10-31 18:46:47.493	f
2	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMTg4NSwiZXhwIjoxNzYxOTM2Njg1fQ.hlcNy0OHW_b1aBjTj_E6_gomFMEsZetYhsDOXHTwr-U	Web	1	2025-10-24 18:51:25.833	2025-10-31 18:51:25.823	f
3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMjA3MCwiZXhwIjoxNzYxOTM2ODcwfQ.s3BC-BamNc2XOJ3MkXUtdp-yoxau1xrng6oYkjxRO1c	Web	1	2025-10-24 18:54:30.021	2025-10-31 18:54:30.019	f
4	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMjM4NiwiZXhwIjoxNzYxOTM3MTg2fQ.gTMZ2WwfqS4iz3kBk-v9-VGi_atjq3FwgD85Zk4IgOM	Web	1	2025-10-24 18:59:46.718	2025-10-31 18:59:46.714	f
5	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZsYWR0QG1haWwucnUiLCJzdWIiOjEsImlhdCI6MTc2MTMzMjU4NiwiZXhwIjoxNzYxOTM3Mzg2fQ.-YcmB9KLsG2MvTB0lAAbn9yPEioXddUY4lVooXhiNxU	Web	1	2025-10-24 19:03:06.08	2025-10-31 19:03:06.073	f
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."User" (id, email, password, name, role) FROM stdin;
1	vladt@mail.ru	$2b$10$UkAxLAIyobvXQ/krA9MgG./qlwAYu5FZjVRLqdtJA0kewDCweH9ga	Владик	NotVerify
\.


--
-- Name: RefreshToken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."RefreshToken_id_seq"', 5, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, true);


--
-- Name: RefreshToken RefreshToken_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."RefreshToken"
    ADD CONSTRAINT "RefreshToken_pkey" PRIMARY KEY (id);


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
-- Name: RefreshToken RefreshToken_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."RefreshToken"
    ADD CONSTRAINT "RefreshToken_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: user
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict XyHJmu7hyUUI35xaSdrrvaHJWIJ0T9JwX38WQjDinlMEh9moMB9wdZRGg2retry

