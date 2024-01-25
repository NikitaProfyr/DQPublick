--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-01-25 21:14:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16532)
-- Name: Answer; Type: TABLE; Schema: public; Owner: dies_admin
--

CREATE TABLE public."Answer" (
    id integer NOT NULL,
    title character varying NOT NULL,
    "right" boolean NOT NULL,
    "questionId" integer
);


ALTER TABLE public."Answer" OWNER TO dies_admin;

--
-- TOC entry 220 (class 1259 OID 16531)
-- Name: Answer_id_seq; Type: SEQUENCE; Schema: public; Owner: dies_admin
--

CREATE SEQUENCE public."Answer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Answer_id_seq" OWNER TO dies_admin;

--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 220
-- Name: Answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dies_admin
--

ALTER SEQUENCE public."Answer_id_seq" OWNED BY public."Answer".id;


--
-- TOC entry 223 (class 1259 OID 16541)
-- Name: Question; Type: TABLE; Schema: public; Owner: dies_admin
--

CREATE TABLE public."Question" (
    id integer NOT NULL,
    title character varying NOT NULL,
    "quizId" integer
);


ALTER TABLE public."Question" OWNER TO dies_admin;

--
-- TOC entry 222 (class 1259 OID 16540)
-- Name: Question_id_seq; Type: SEQUENCE; Schema: public; Owner: dies_admin
--

CREATE SEQUENCE public."Question_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Question_id_seq" OWNER TO dies_admin;

--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 222
-- Name: Question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dies_admin
--

ALTER SEQUENCE public."Question_id_seq" OWNED BY public."Question".id;


--
-- TOC entry 225 (class 1259 OID 16555)
-- Name: Quiz; Type: TABLE; Schema: public; Owner: dies_admin
--

CREATE TABLE public."Quiz" (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    image character varying,
    "authorId" integer
);


ALTER TABLE public."Quiz" OWNER TO dies_admin;

--
-- TOC entry 227 (class 1259 OID 16590)
-- Name: QuizResults; Type: TABLE; Schema: public; Owner: dies_admin
--

CREATE TABLE public."QuizResults" (
    id integer NOT NULL,
    result integer,
    "userId" integer,
    "quizId" integer
);


ALTER TABLE public."QuizResults" OWNER TO dies_admin;

--
-- TOC entry 226 (class 1259 OID 16589)
-- Name: QuizResults_id_seq; Type: SEQUENCE; Schema: public; Owner: dies_admin
--

CREATE SEQUENCE public."QuizResults_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."QuizResults_id_seq" OWNER TO dies_admin;

--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 226
-- Name: QuizResults_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dies_admin
--

ALTER SEQUENCE public."QuizResults_id_seq" OWNED BY public."QuizResults".id;


--
-- TOC entry 224 (class 1259 OID 16554)
-- Name: Quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: dies_admin
--

CREATE SEQUENCE public."Quiz_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Quiz_id_seq" OWNER TO dies_admin;

--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 224
-- Name: Quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dies_admin
--

ALTER SEQUENCE public."Quiz_id_seq" OWNED BY public."Quiz".id;


--
-- TOC entry 219 (class 1259 OID 16514)
-- Name: Token; Type: TABLE; Schema: public; Owner: dies_admin
--

CREATE TABLE public."Token" (
    id integer NOT NULL,
    "userId" integer,
    "refreshToken" character varying
);


ALTER TABLE public."Token" OWNER TO dies_admin;

--
-- TOC entry 218 (class 1259 OID 16513)
-- Name: Token_id_seq; Type: SEQUENCE; Schema: public; Owner: dies_admin
--

CREATE SEQUENCE public."Token_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Token_id_seq" OWNER TO dies_admin;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 218
-- Name: Token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dies_admin
--

ALTER SEQUENCE public."Token_id_seq" OWNED BY public."Token".id;


--
-- TOC entry 217 (class 1259 OID 16503)
-- Name: User; Type: TABLE; Schema: public; Owner: dies_admin
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    email character varying,
    "hashedPassword" character varying,
    "userName" character varying
);


ALTER TABLE public."User" OWNER TO dies_admin;

--
-- TOC entry 216 (class 1259 OID 16502)
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: dies_admin
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_id_seq" OWNER TO dies_admin;

--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 216
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dies_admin
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- TOC entry 215 (class 1259 OID 16497)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: dies_admin
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO dies_admin;

--
-- TOC entry 4719 (class 2604 OID 16535)
-- Name: Answer id; Type: DEFAULT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Answer" ALTER COLUMN id SET DEFAULT nextval('public."Answer_id_seq"'::regclass);


--
-- TOC entry 4720 (class 2604 OID 16544)
-- Name: Question id; Type: DEFAULT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Question" ALTER COLUMN id SET DEFAULT nextval('public."Question_id_seq"'::regclass);


--
-- TOC entry 4721 (class 2604 OID 16558)
-- Name: Quiz id; Type: DEFAULT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Quiz" ALTER COLUMN id SET DEFAULT nextval('public."Quiz_id_seq"'::regclass);


--
-- TOC entry 4722 (class 2604 OID 16593)
-- Name: QuizResults id; Type: DEFAULT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."QuizResults" ALTER COLUMN id SET DEFAULT nextval('public."QuizResults_id_seq"'::regclass);


--
-- TOC entry 4718 (class 2604 OID 16517)
-- Name: Token id; Type: DEFAULT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Token" ALTER COLUMN id SET DEFAULT nextval('public."Token_id_seq"'::regclass);


--
-- TOC entry 4717 (class 2604 OID 16506)
-- Name: User id; Type: DEFAULT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- TOC entry 4898 (class 0 OID 16532)
-- Dependencies: 221
-- Data for Name: Answer; Type: TABLE DATA; Schema: public; Owner: dies_admin
--

COPY public."Answer" (id, title, "right", "questionId") FROM stdin;
259	Apple	f	121
260	Google	t	121
261	Microsoft	f	121
262	Samsung	f	121
264	Bluetooth	t	122
269	Данные XL	f	123
271	Смартфон	f	124
274	Все вышеперечисленное	t	124
276	Microsoft	f	125
300	Юпитер	t	131
302	Сатурн	f	131
303	Voyager 1	f	132
305	Sputnik 1	f	132
308	Сириус	f	133
310	Джумна	f	133
311	Малая Магелланова Облака	f	134
313	Туманность Антарес	f	134
316	Юпитер	f	135
318	Уран	f	135
379	Лондон	f	151
381	Берлин	f	151
384	Янцзы	f	152
386	Миссисипи	f	152
387	Италия	t	153
389	Испания	f	153
392	Россия	t	154
394	США	f	154
395	Италия	t	155
397	Франция	f	155
219	 Олег	f	111
220	 Рюрик	t	111
221	Владимир 	f	111
222	Игорь	f	111
223	Крещение Владимира	t	112
224	Поход Олега на Царьград 	f	112
225	Крещение Олега	f	112
226	Принятие христианства князем Ярославом Мудрым	f	112
227	Москва	f	113
228	 Смоленск	f	113
229	Киев	t	113
230	Новгород 	f	113
231	Ярослав Мудрый	f	114
232	Владимир Мономах	t	114
233	Ярослав Володимирович	f	114
234	Святослав Игоревич	f	114
235	Куликовская битва 	t	115
238	Битва на Неве	f	115
236	Битва на реке Студеной	f	115
241	Византийская экспансия	f	116
243	Иван Грозный	f	117
246	Иван III	t	117
248	Новгород 	f	118
253	Алексей Михайлович	f	119
255	Романовы	f	120
258	Городецкие	f	120
263	NFC	f	122
266	LTE	f	122
268	Мегаданные	f	123
273	Ноутбук	f	124
275	IBM	t	125
278	Intel	f	125
339	Индия	f	141
341	Бразилия	t	141
344	Миссисипи	f	142
346	Янцзы	f	142
347	Россия	f	143
349	Индия	f	143
352	Атлантический	t	144
354	Северный Ледовитый	f	144
355	Гренландия	t	145
357	Мадагаскар	f	145
415	Кофеварка с таймером	f	160
417	Умная колонка с голосовым управлением	t	160
420	TikTok	f	161
422	MySpace	t	161
423	Artificial Intelligence (Искусственный интеллект)	f	162
425	Blockchain (Блокчейн)	t	162
428	Любая информация, хранящаяся в цифровом формате	f	163
430	Огромные объемы структурированных и неструктурированных данных, обработка которых требует специализированных подходов	t	163
237	Битва на Ильменском озере	f	115
239	Монгольское нашествие	t	116
242	Война с Польшей 	f	116
244	Дмитрий Донской 	f	117
249	Беларусь	f	118
251	Иван Грозный	t	119
254	Михаил Федорович	f	119
256	Рюриковичи	t	120
265	Wi-Fi	f	122
267	Бигдата	t	123
270	Гиперданные	f	123
272	Планшет	f	124
277	Apple	f	125
340	Эфиопия	f	141
342	Гватемала	f	141
343	Нил	f	142
345	Амазонка	t	142
348	Бразилия	f	143
350	Китай	t	143
351	Индийский	f	144
353	Тихий	f	144
356	Борнео	f	145
358	Калимантан	f	145
416	Персональный компьютер	f	160
418	Механические часы	f	160
419	LinkedIn	f	161
421	Instagram	f	161
424	Cloud Computing (Облачные вычисления)	f	162
426	Quantum Computing (Квантовые вычисления)	f	162
427	Данные, обрабатываемые на локальном компьютере	f	163
429	Большие базы данных	f	163
240	Московско-литовские войны	f	116
245	Александр Невский	f	117
247	Московия	t	118
250	Украина	f	118
252	Петр I	f	119
257	Гедиминовичи	f	120
299	Марс	f	131
301	Венера	f	131
304	Apollo 11	f	132
306	Vostok 1	t	132
307	Альфа Центавра	t	133
309	Процион	f	133
312	Андромеда	t	134
314	Туманность Ориона	f	134
315	Марс	f	135
317	Венера	t	135
380	Рим	f	151
382	Париж	t	151
383	Амазонка	t	152
385	Нил	f	152
388	Франция	f	153
390	Греция	f	153
391	Китай	f	154
393	Канада	f	154
396	Греция	f	155
398	Испания	f	155
\.


--
-- TOC entry 4900 (class 0 OID 16541)
-- Dependencies: 223
-- Data for Name: Question; Type: TABLE DATA; Schema: public; Owner: dies_admin
--

COPY public."Question" (id, title, "quizId") FROM stdin;
151	Какая столица Франции?	63
152	Какая река является самой длинной в мире?	63
153	В какой стране находится Колизей?	63
154	Какая самая крупная страна в мире по территории?	63
155	Какая страна является родиной бальзамического уксуса?	63
160	Какое из нижеперечисленных устройств является примером Интернета вещей (IoT)?	64
161	Какая социальная сеть была одной из первых на мировом рынке?	64
162	Какая технология стоит за криптовалютами, такими как Биткойн?	64
163	Что представляет собой термин "Big Data"?	64
111	 Кто был первым князем Киевской Руси?	59
112	Какое событие стало началом христианизации Руси?	59
113	Какой город стал первой столицей Руси?	59
114	то был последним князем Киевской Руси?	59
115	Какая битва стала поворотным моментом в истории древнерусских земель? 	59
116	 Какое событие привело к распаду Киевской Руси?	59
117	Кто был первым царем Великого княжества Московского? 	59
118	Какая земля вошла в состав Великого княжества Литовского в XIV веке?	59
119	Кто считается основателем Московского царства? 	59
120	Какая княжеская династия правила в Киеве? 	59
121	 Какая компания разработала операционную систему Android для мобильных устройств?	60
122	Какая технология используется для беспроводной связи на короткие расстояния, такая как соединение между смартфоном и наушниками?	60
123	Какой термин используется для описания процесса анализа больших объемов данных для выявления закономерностей и тенденций?	60
124	 Какое из следующих устройств использует технологию распознавания отпечатков пальцев для аутентификации пользователя?	60
125	Какая компания разработала первый коммерчески успешный персональный компьютер?	60
131	Какая планета в Солнечной системе является самой большой по размерам?	61
132	Какой космический аппарат был первым в космосе с человеком?	61
133	Какая звезда является ближайшей к Земле помимо Солнца?	61
134	Что такое галактика, к которой принадлежит Млечный Путь?	61
135	Какая из этих планет не имеет естественных спутников?	61
141	Какая страна является крупнейшим производителем кофе в мире?	62
142	Какая река является самой длинной в мире?	62
143	Какая из перечисленных стран не входит в ПЯР?	62
144	Где находится самый глубокий океанский жёл?	62
145	Какой остров является самым крупным в мире?	62
\.


--
-- TOC entry 4902 (class 0 OID 16555)
-- Dependencies: 225
-- Data for Name: Quiz; Type: TABLE DATA; Schema: public; Owner: dies_admin
--

COPY public."Quiz" (id, title, description, image, "authorId") FROM stdin;
59	История древней Руси	На сколько хорошо ты знаешь историю древней руси	media/quizImage/AQAK7bcNtaQJ1LH0W7fP2EDfTPc7xenL4kNr_rZ0SUS_ZQKz5KJ39Y5TdcDOyT39uqmkTKqYiWa-6AEzSIPJe23nW9g.jpg	4
60	Технологии и будущее	 Этот опрос направлен на измерение ваших знаний о современных технологиях	media/quizImage/sovr-tekh.jpg	4
61	Измерение знаний о космосе и астрономии	Этот опрос направлен на измерение ваших знаний о космосе и астрономии.	media/quizImage/09fb999ee6a82ce084578375df0903c6.jpg	4
62	Викторина по географии мира	Пройдите тест и проверьте свои знания по географии мира.	media/quizImage/100023060002b0.webp	4
63	Путешествия по миру	Пройдите тест и проверьте свои знания о различных странах и городах в мире.	media/quizImage/AQAK3Lt33doDmrWNzPk2CsFSV1bPPd3Kd7dSoH2Nj5a6a5L8eVaaQyc7czjy_BDf5IALhqggleuV-UH8rZY6hSDzn_Q.jpg	4
64	Технологии и общество	Этот опрос создан для изучения восприятия обществом современных технологий. Он охватывает различные аспекты технологического прогресса, от воздействия на повседневную жизнь до влияния на глобальные процессы.	media/quizImage/scale_1200.jpg	4
\.


--
-- TOC entry 4904 (class 0 OID 16590)
-- Dependencies: 227
-- Data for Name: QuizResults; Type: TABLE DATA; Schema: public; Owner: dies_admin
--

COPY public."QuizResults" (id, result, "userId", "quizId") FROM stdin;
15	10	4	59
16	5	4	60
\.


--
-- TOC entry 4896 (class 0 OID 16514)
-- Dependencies: 219
-- Data for Name: Token; Type: TABLE DATA; Schema: public; Owner: dies_admin
--

COPY public."Token" (id, "userId", "refreshToken") FROM stdin;
190	4	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6ImF4ZW00biIsImV4cCI6MTcwODc5ODA1OH0.lp4eEwdhjtHLNwVPxVxFXLgkIJAvi5V_EP8w9XkgHcs
\.


--
-- TOC entry 4894 (class 0 OID 16503)
-- Dependencies: 217
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: dies_admin
--

COPY public."User" (id, email, "hashedPassword", "userName") FROM stdin;
3	\N	$2b$12$cq5Ozyrb8N9sZfVoAFRenOovv1Vov0yNom3h.EDf4Ttg3W/fdLjSO	dies
36	\N	$2b$12$5.YEmhb5kpu4l2urNHcBue7fz6kNDplWu8XzneZbeqT90l/yxBOme	axe123
40	\N	$2b$12$g.OhnyGyfwV2qA7iGYa0JOdCkGA6xIGSGMUuVcqzsC.1lRUmPy0YS	axe
42	\N	$2b$12$caI72J5KtA.XDyXGJBrjgelUrFTqj40gW1k7xwxtUEpLfpao5c/K6	axe123321
43	\N	$2b$12$a3VMrMkPYFAqKkeL4bFD1.Bk2zkMvZz7lQYjt7XTUV.uRh3nDkgMi	Den
44	\N	$2b$12$lYlbv2nrvg/LQxGHBvKPi.U0Nl9FqVM3HRCr2HAIsvpIF3LT0DAvO	test
4	toporov.den2@list.ru	$2b$12$AVu5J9X4ACgvu.zsqcy8heq57jVAXCdrMXmdgNK4a.3J.qLEAS/BO	axem4n
\.


--
-- TOC entry 4892 (class 0 OID 16497)
-- Dependencies: 215
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: dies_admin
--

COPY public.alembic_version (version_num) FROM stdin;
75a26848d1f9
\.


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 220
-- Name: Answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dies_admin
--

SELECT pg_catalog.setval('public."Answer_id_seq"', 432, true);


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 222
-- Name: Question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dies_admin
--

SELECT pg_catalog.setval('public."Question_id_seq"', 164, true);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 226
-- Name: QuizResults_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dies_admin
--

SELECT pg_catalog.setval('public."QuizResults_id_seq"', 16, true);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 224
-- Name: Quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dies_admin
--

SELECT pg_catalog.setval('public."Quiz_id_seq"', 65, true);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 218
-- Name: Token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dies_admin
--

SELECT pg_catalog.setval('public."Token_id_seq"', 190, true);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 216
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dies_admin
--

SELECT pg_catalog.setval('public."User_id_seq"', 45, true);


--
-- TOC entry 4736 (class 2606 OID 16539)
-- Name: Answer Answer_pkey; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Answer"
    ADD CONSTRAINT "Answer_pkey" PRIMARY KEY (id);


--
-- TOC entry 4738 (class 2606 OID 16548)
-- Name: Question Question_pkey; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "Question_pkey" PRIMARY KEY (id);


--
-- TOC entry 4742 (class 2606 OID 16595)
-- Name: QuizResults QuizResults_pkey; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."QuizResults"
    ADD CONSTRAINT "QuizResults_pkey" PRIMARY KEY (id);


--
-- TOC entry 4740 (class 2606 OID 16562)
-- Name: Quiz Quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Quiz"
    ADD CONSTRAINT "Quiz_pkey" PRIMARY KEY (id);


--
-- TOC entry 4732 (class 2606 OID 16521)
-- Name: Token Token_pkey; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Token"
    ADD CONSTRAINT "Token_pkey" PRIMARY KEY (id);


--
-- TOC entry 4726 (class 2606 OID 16512)
-- Name: User User_email_key; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_email_key" UNIQUE (email);


--
-- TOC entry 4728 (class 2606 OID 16510)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- TOC entry 4730 (class 2606 OID 16530)
-- Name: User User_userName_key; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_userName_key" UNIQUE ("userName");


--
-- TOC entry 4724 (class 2606 OID 16501)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 4733 (class 1259 OID 16528)
-- Name: ix_Token_id; Type: INDEX; Schema: public; Owner: dies_admin
--

CREATE INDEX "ix_Token_id" ON public."Token" USING btree (id);


--
-- TOC entry 4734 (class 1259 OID 16621)
-- Name: ix_Token_refreshToken; Type: INDEX; Schema: public; Owner: dies_admin
--

CREATE UNIQUE INDEX "ix_Token_refreshToken" ON public."Token" USING btree ("refreshToken");


--
-- TOC entry 4744 (class 2606 OID 16578)
-- Name: Answer Answer_questionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Answer"
    ADD CONSTRAINT "Answer_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES public."Question"(id) ON DELETE CASCADE;


--
-- TOC entry 4745 (class 2606 OID 16573)
-- Name: Question Question_quizId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "Question_quizId_fkey" FOREIGN KEY ("quizId") REFERENCES public."Quiz"(id) ON DELETE CASCADE;


--
-- TOC entry 4747 (class 2606 OID 16611)
-- Name: QuizResults QuizResults_quizId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."QuizResults"
    ADD CONSTRAINT "QuizResults_quizId_fkey" FOREIGN KEY ("quizId") REFERENCES public."Quiz"(id) ON DELETE CASCADE;


--
-- TOC entry 4748 (class 2606 OID 16616)
-- Name: QuizResults QuizResults_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."QuizResults"
    ADD CONSTRAINT "QuizResults_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON DELETE CASCADE;


--
-- TOC entry 4746 (class 2606 OID 16583)
-- Name: Quiz Quiz_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Quiz"
    ADD CONSTRAINT "Quiz_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."User"(id) ON DELETE CASCADE;


--
-- TOC entry 4743 (class 2606 OID 16622)
-- Name: Token Token_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Token"
    ADD CONSTRAINT "Token_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON DELETE CASCADE;


-- Completed on 2024-01-25 21:14:38

--
-- PostgreSQL database dump complete
--

