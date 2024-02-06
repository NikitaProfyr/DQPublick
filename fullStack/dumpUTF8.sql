--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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
-- Name: Answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dies_admin
--

ALTER SEQUENCE public."Answer_id_seq" OWNED BY public."Answer".id;


--
-- Name: Question; Type: TABLE; Schema: public; Owner: dies_admin
--

CREATE TABLE public."Question" (
    id integer NOT NULL,
    title character varying NOT NULL,
    "quizId" integer
);


ALTER TABLE public."Question" OWNER TO dies_admin;

--
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
-- Name: Question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dies_admin
--

ALTER SEQUENCE public."Question_id_seq" OWNED BY public."Question".id;


--
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
-- Name: QuizResults_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dies_admin
--

ALTER SEQUENCE public."QuizResults_id_seq" OWNED BY public."QuizResults".id;


--
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
-- Name: Quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dies_admin
--

ALTER SEQUENCE public."Quiz_id_seq" OWNED BY public."Quiz".id;


--
-- Name: Token; Type: TABLE; Schema: public; Owner: dies_admin
--

CREATE TABLE public."Token" (
    id integer NOT NULL,
    "userId" integer,
    "refreshToken" character varying
);


ALTER TABLE public."Token" OWNER TO dies_admin;

--
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
-- Name: Token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dies_admin
--

ALTER SEQUENCE public."Token_id_seq" OWNED BY public."Token".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: dies_admin
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    email character varying,
    "hashedPassword" character varying,
    "userName" character varying,
    rndstr character varying,
    "isAdmin" boolean
);


ALTER TABLE public."User" OWNER TO dies_admin;

--
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
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dies_admin
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: dies_admin
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO dies_admin;

--
-- Name: Answer id; Type: DEFAULT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Answer" ALTER COLUMN id SET DEFAULT nextval('public."Answer_id_seq"'::regclass);


--
-- Name: Question id; Type: DEFAULT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Question" ALTER COLUMN id SET DEFAULT nextval('public."Question_id_seq"'::regclass);


--
-- Name: Quiz id; Type: DEFAULT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Quiz" ALTER COLUMN id SET DEFAULT nextval('public."Quiz_id_seq"'::regclass);


--
-- Name: QuizResults id; Type: DEFAULT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."QuizResults" ALTER COLUMN id SET DEFAULT nextval('public."QuizResults_id_seq"'::regclass);


--
-- Name: Token id; Type: DEFAULT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Token" ALTER COLUMN id SET DEFAULT nextval('public."Token_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
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
475	Юпитер	t	176
477	Марс	f	176
480	Apollo 11	f	177
482	Voyager 1	f	177
483	Сириус	f	178
485	Альфа Центавра	t	178
488	Андромеда	t	179
490	Малая Магелланова Облака	f	179
491	Юпитер	f	180
493	Марс	f	180
240	Московско-литовские войны	f	116
245	Александр Невский	f	117
247	Московия	t	118
250	Украина	f	118
252	Петр I	f	119
257	Гедиминовичи	f	120
476	Сатурн	f	176
478	Венера	f	176
479	Vostok 1	t	177
481	Sputnik 1	f	177
484	Джумна	f	178
486	Процион	f	178
487	Туманность Ориона	f	179
489	Туманность Антарес	f	179
492	Уран	f	180
494	Венера	t	180
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
176	Какая планета в Солнечной системе является самой большой по размерам?	61
177	Какой космический аппарат был первым в космосе с человеком?	61
178	Какая звезда является ближайшей к Земле помимо Солнца?	61
179	Что такое галактика, к которой принадлежит Млечный Путь?	61
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
180	Какая из этих планет не имеет естественных спутников?	61
141	Какая страна является крупнейшим производителем кофе в мире?	62
142	Какая река является самой длинной в мире?	62
143	Какая из перечисленных стран не входит в ПЯР?	62
144	Где находится самый глубокий океанский жёл?	62
145	Какой остров является самым крупным в мире?	62
\.


--
-- Data for Name: Quiz; Type: TABLE DATA; Schema: public; Owner: dies_admin
--

COPY public."Quiz" (id, title, description, image, "authorId") FROM stdin;
59	История древней Руси	На сколько хорошо ты знаешь историю древней руси	media/quizImage/AQAK7bcNtaQJ1LH0W7fP2EDfTPc7xenL4kNr_rZ0SUS_ZQKz5KJ39Y5TdcDOyT39uqmkTKqYiWa-6AEzSIPJe23nW9g.jpg	4
60	Технологии и будущее	 Этот опрос направлен на измерение ваших знаний о современных технологиях	media/quizImage/sovr-tekh.jpg	4
62	Викторина по географии мира	Пройдите тест и проверьте свои знания по географии мира.	media/quizImage/100023060002b0.webp	4
63	Путешествия по миру	Пройдите тест и проверьте свои знания о различных странах и городах в мире.	media/quizImage/AQAK3Lt33doDmrWNzPk2CsFSV1bPPd3Kd7dSoH2Nj5a6a5L8eVaaQyc7czjy_BDf5IALhqggleuV-UH8rZY6hSDzn_Q.jpg	4
64	Технологии и общество	Этот опрос создан для изучения восприятия обществом современных технологий. Он охватывает различные аспекты технологического прогресса, от воздействия на повседневную жизнь до влияния на глобальные процессы.	media/quizImage/scale_1200.jpg	4
61	Измерение знаний о космосе и астрономии.	Этот опрос направлен на измерение ваших знаний о космосе и астрономии.	media/quizImage/09fb999ee6a82ce084578375df0903c6.jpg	4
\.


--
-- Data for Name: QuizResults; Type: TABLE DATA; Schema: public; Owner: dies_admin
--

COPY public."QuizResults" (id, result, "userId", "quizId") FROM stdin;
16	5	4	60
15	0	4	59
\.


--
-- Data for Name: Token; Type: TABLE DATA; Schema: public; Owner: dies_admin
--

COPY public."Token" (id, "userId", "refreshToken") FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: dies_admin
--

COPY public."User" (id, email, "hashedPassword", "userName", rndstr, "isAdmin") FROM stdin;
3	neicker44536@gmail.com	$2b$12$P1kmM4Hy9GjOJyEiT5yWg.7E.usCWezdv1q/YDTTbibn5nFLiEAKq	dies	\N	\N
4	email@email.ru	$2b$12$AVu5J9X4ACgvu.zsqcy8heq57jVAXCdrMXmdgNK4a.3J.qLEAS/BO	user	\N	t
43	toporov.axeman@gmail.com	$2b$12$iCN84st8XGP.0UP4vo0BWuTRYPUZJxhR42JACpaSRb0TgA3bYNaUy	axem4n	LzvxkbzgOzeHhlsTwFVCGrxzCGcbF6a	t
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: dies_admin
--

COPY public.alembic_version (version_num) FROM stdin;
bc9af4e8ef48
\.


--
-- Name: Answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dies_admin
--

SELECT pg_catalog.setval('public."Answer_id_seq"', 502, true);


--
-- Name: Question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dies_admin
--

SELECT pg_catalog.setval('public."Question_id_seq"', 184, true);


--
-- Name: QuizResults_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dies_admin
--

SELECT pg_catalog.setval('public."QuizResults_id_seq"', 16, true);


--
-- Name: Quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dies_admin
--

SELECT pg_catalog.setval('public."Quiz_id_seq"', 70, true);


--
-- Name: Token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dies_admin
--

SELECT pg_catalog.setval('public."Token_id_seq"', 210, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dies_admin
--

SELECT pg_catalog.setval('public."User_id_seq"', 45, true);


--
-- Name: Answer Answer_pkey; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Answer"
    ADD CONSTRAINT "Answer_pkey" PRIMARY KEY (id);


--
-- Name: Question Question_pkey; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "Question_pkey" PRIMARY KEY (id);


--
-- Name: QuizResults QuizResults_pkey; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."QuizResults"
    ADD CONSTRAINT "QuizResults_pkey" PRIMARY KEY (id);


--
-- Name: Quiz Quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Quiz"
    ADD CONSTRAINT "Quiz_pkey" PRIMARY KEY (id);


--
-- Name: Token Token_pkey; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Token"
    ADD CONSTRAINT "Token_pkey" PRIMARY KEY (id);


--
-- Name: User User_email_key; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_email_key" UNIQUE (email);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: User User_rndstr_key; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_rndstr_key" UNIQUE (rndstr);


--
-- Name: User User_userName_key; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_userName_key" UNIQUE ("userName");


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: ix_Token_id; Type: INDEX; Schema: public; Owner: dies_admin
--

CREATE INDEX "ix_Token_id" ON public."Token" USING btree (id);


--
-- Name: ix_Token_refreshToken; Type: INDEX; Schema: public; Owner: dies_admin
--

CREATE UNIQUE INDEX "ix_Token_refreshToken" ON public."Token" USING btree ("refreshToken");


--
-- Name: Answer Answer_questionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Answer"
    ADD CONSTRAINT "Answer_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES public."Question"(id) ON DELETE CASCADE;


--
-- Name: Question Question_quizId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "Question_quizId_fkey" FOREIGN KEY ("quizId") REFERENCES public."Quiz"(id) ON DELETE CASCADE;


--
-- Name: QuizResults QuizResults_quizId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."QuizResults"
    ADD CONSTRAINT "QuizResults_quizId_fkey" FOREIGN KEY ("quizId") REFERENCES public."Quiz"(id) ON DELETE CASCADE;


--
-- Name: QuizResults QuizResults_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."QuizResults"
    ADD CONSTRAINT "QuizResults_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON DELETE CASCADE;


--
-- Name: Quiz Quiz_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Quiz"
    ADD CONSTRAINT "Quiz_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."User"(id) ON DELETE CASCADE;


--
-- Name: Token Token_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dies_admin
--

ALTER TABLE ONLY public."Token"
    ADD CONSTRAINT "Token_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

