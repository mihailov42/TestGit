--
-- PostgreSQL database dump
--

-- Dumped from database version 10.23
-- Dumped by pg_dump version 10.23

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_cart_id_seq OWNER TO postgres;

--
-- Name: product_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;


--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: product_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Телевизоры');
INSERT INTO public.category (id, name) VALUES (2, 'Техника для дома');
INSERT INTO public.category (id, name) VALUES (3, 'Техника для кухни');


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (11, 'b6ed4076-01f5-461f-b61d-e512bb5f7632.1.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, 'b572caba-2286-4893-a496-aa8e25b0f0d5.4.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, 'f6380a11-b7c6-4b57-b642-e22e1095f4fc.2.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, '3f569152-a767-43de-b207-204dc409d269.5.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, '0ab4bcc2-17b8-463a-ae19-a9c7ac458cda.3.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, 'bed3b007-0e26-428d-abc2-6bbcef9da2fe.1.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, 'e759f99b-9278-4429-9d25-d2cd7cc3c8bf.2.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, 'f85eeddb-2fcc-41c6-91cc-648c46b8d519.3.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, 'c2e5b03c-1bb7-4ad2-a1da-369e35b9f77f.4.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, '4f7256cd-ce12-4294-a8ca-652d72307eb3.5.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, 'bfdb5504-607c-432c-8621-77629411de4b.1.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, 'f558058e-0941-4f35-baaf-32cd2df0cc62.2.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, 'e3059806-f986-4986-b33a-067a3601a226.3.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, '0991391f-9dda-4784-bc0e-3d0e577f1ae6.4.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '03b3375b-a56c-4a1a-9c92-9d19bba1a966.5.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, '6f956d31-bce6-4498-aa55-f9644702af05.1.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, '9d3c21a2-bf3d-4972-9bb0-6e40489645ca.2.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, '3d1215eb-72d1-4cd6-9a82-1526f1af6b4d.3.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, 'a0fafade-5e02-45ed-a412-f463f7ee98a2.4.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, 'd52d008c-a497-4a54-bc4b-84371b5b6cdc.5.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, '77ad366f-306d-471f-a2b9-a73fb9e9a99a.1.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, 'ebeb4947-3f10-482f-86fe-3fe4c892c1c7.2.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, '2318f88a-32fa-44f4-9d65-a4151b76df18.3.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, 'c2ff3ecf-9d2e-479b-81d8-ce73fbee3de5.4.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, '3f043c73-5dea-4864-8634-b7c4b94e66cb.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, '0c49bb1a-fdaf-47a7-a21e-1fabe588d98d.1.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, '25803dae-93e4-445c-9f58-13484e75c06b.2.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, '866c488b-00a6-4fe1-8682-225e735a86fa.3.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, 'b2aa2efb-1f6f-4c8a-9fa5-82ef4b99d096.4.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, '5860e089-76b6-4962-a394-faa53fe23bf7.5.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, '6c079fb3-3271-429f-af69-5b1b91a5aa3a.1.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, '55f8531b-b09e-4c72-944a-75c6019d6e49.2.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, 'a20976f5-c6be-43bc-a4a8-9f9ea7102b76.3.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, '61e30a00-ac2b-47e4-aaeb-2ebd5116574d.4.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, '4294c35e-0489-438b-a3bf-9291777f4500.5.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (46, '71131f00-664f-46c8-9c9e-df0a9c3459bc.1.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (47, '8e0f793a-d4fa-48f3-9d07-e1c48cd5c43e.2.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (48, '770c5b0e-e2a2-4ee2-8e5d-448ea82d1f99.3.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (49, 'c5bda21e-3b72-41a9-8b14-54c76b7d572e.4.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (50, '685607b9-a9f7-4755-9e92-019716f5c982.5.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (51, 'adba840a-4e65-4871-b62d-1d85346c1cef.1.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (52, '95121d06-e483-47c0-9993-9a254e2c2425.2.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (53, '411e4054-9518-4bd2-8a8b-7549ad6297e0.3.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (54, '98ffcef7-b037-4855-b188-caf7e0bdd3b6.4.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (55, '69cb0932-0716-4711-a81b-6fa50efc364e.5.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (56, 'f6629956-128a-42c9-a5c3-61bec375f9f1.1.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (57, 'ac41a12c-a321-4a61-8b66-86f07562a891.2.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (58, 'faf94adf-a029-4298-8926-d53c64e94a73.3.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (59, '0e165914-27a9-4a2a-b6ed-fd53807b710f.4.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (60, '9ccbcbd9-005f-4d68-ac94-62d22455f493.5.jpg', 12);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2023-05-21 21:45:37.457003', '0128f01d-e2e0-46c2-ba4a-4eb0243967ee', 2107, 1, 2, 6);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 1, '2023-05-21 21:45:37.478004', '0128f01d-e2e0-46c2-ba4a-4eb0243967ee', 36793, 1, 2, 12);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (2, 'user1', '$2a$10$aoQQxBSv6UV7y8MiqCZ7aeAMntAzsfvmKRGGvEeF6RO50u/6G56nq', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (1, 'admin', '$2a$10$6RTRUuOGRSreGftfY90E4OABKrhv83RGrhqSunaxf5OR2fM8iLFNC', 'ROLE_ADMIN');


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (4, '2023-05-21 20:52:41.282336', 'Откройте для себя преимущества Smart ТВ с разрешением 4К. Изображение с улучшенной цветопередачей. Благодаря технологии PurColor, зритель ощущает себя участником событий, происходящих на экране. Эта технология обеспечивает вывод на экран богатую палитру цветовых оттенков, в результате чего зритель испытывает эффект полного погружения в действие на экране. Процессор Crystal 4K. Интеллектуальный апскейлинг до 4K, позволит вам смотреть ваш любимый контент с более низким разрешением в сверхчетком разрешении 4К. Кроме того, благодаря улучшенной технологии обработки цвета, вы получите удовольствие от реалистичной цветопередачи. Функция Motion Xcelerator.Оцените четкость изображения и высокое качество. Телевизор автоматически анализирует каждый кадр и оптимизирует его. Экран 4K UHD телевизора содержит в 4 раза больше пикселей по сравнению с экраном FHD телевизора, благодаря чему вы видите исключительно четкое изображение с превосходной передачей мельчайших деталей.', 36891, 'ООО ВАЙЛДБЕРРИЗ', 'Samsung Телевизор UE43AU7100UXCE/43"/4K UHD/Smart TV/Wi-Fi/Bluetooth', 'Коледино', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (5, '2023-05-21 20:54:00.747881', 'Телевизоры LG UHD дарят вам новые впечатления от просмотра. Наслаждайтесь яркими цветами и невероятной детализацией телевизоров Real 4K. Смотрите свой любимый контент крупным планом на сверхбольшом телевизоре UHD с разрешением 4K. Телевизор LG UHD теперь имеет более тонкий дизайн и тонкую рамку, которые гармонично сочетаются с вашим интерьером. Интеллектуальный процессор a5 Gen5 телевизора LG UHD дает эффект полного погружения.', 77592, 'ООО ВАЙЛДБЕРРИЗ', 'LG Телевизор 65UQ81009LC/65"/4K UHD/Smart TV/Wi-Fi/Bluetooth', 'Внуково', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (6, '2023-05-21 20:55:52.369266', 'Маслонаполненные радиаторы серии SOLAR предназначены для обогрева жилых и офисных помещений. Три ступени регулировки мощности позволят подобрать идеальный режим для разных погодных условий и сэкономить электроэнергию.Компактный ULTRA SLIM дизайн. 3 ступени мощности нагрева. Встроенный регулируемый термостат. Технология STEEL SAFETY исключает проблему утечки масла и гарантирует высочайшую надежность маслонаполненных радиаторов. Дополнительная обработка сварных швов. Простота и удобство в использовании. Габариты секций 110х580 мм. Наличие ручки и колёсиков для перемещения. Устройство для намотки сетевого шнура. Механизм защиты от перегрева и замерзания.', 2107, ' ООО ВАЙЛДБЕРРИЗ', 'Timberk Масляный электрический радиатор TOR 21.2211 DC', 'Электросталь', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (7, '2023-05-21 20:57:31.545938', 'Вентилятор напольный создаст в комнате комфортные условия в жаркие летние дни. Регулировка высоты и угла наклона винта позволяет установить устройство в любых помещениях. В модели предусмотрен ночник и 3 скорости вращения лопастей, что позволит избавиться от изнывающей жары даже в ночное время и создать оптимальные климатические условия. Прибор обладает низким уровнем шума, поэтому не будет раздражать вас во время работы или отдыха.Регулировка высоты прибора.Регулировка наклона моторного блока в вертикальной плоскости.Автоматический поворот в горизонтальной плоскости 0-90 3 режима скорости. 3 лопасти / вращение на 90 гр.', 2125, 'RUTIMS', 'Вентилятор напольный бытовой для дома', 'Коледино', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (8, '2023-05-21 20:58:59.842989', 'Сухая и влажная уборка. Время работы от аккумулятора: до 200 минут. Уборка по расписанию. Фильтр HEPA 12. Кнопка включения на корпусе. Автоматическое возвращение на базу. Инфракрасные датчики для ориентации в помещении. Стеклянная верхняя панель. Электрощетка. Боковые щетки для эффективной уборки. Плоский корпус для удобства уборки под мебелью. Объем контейнера для пыли 0,5 л. Объем контейнера для влажной уборки 0,3 л (вода) + 0,2 л (пыль). Максимальная мощность прибора: 25 Вт.**Будьте внимательны!В пылесос установлен контейнер для влажной уборки с микрофиброй. Для уборки добавьте воды в отсек контейнера.Контейнер для сухой уборки упакован отдельно внутри основной коробки. Для сухой уборки вставьте его в робот-пылесос.', 11479, 'ООО “ЭйДжиАй Электроникс” (Polaris)', 'Polaris  Робот пылесос PVCR0926W (POLARIS)', 'Коледино', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (9, '2023-05-21 21:00:45.187014', 'Стиральная машина Gorenje WHE60SFS белый корпус, белый с черной накладкой люк, фронтальная загрузка до 6кг, максимальная скорость отжима 1000об/мин. Программы: Антиаллергия, Детская одежда, Темное белье, Пуховые вещи, Спортивная одежда, Деликатная, Самоочистка, Отжим, Хлопок белое, Цветное, Синтетика, Микс, Шерсть, Быстрая 15 мин.. Полоскание + Отжим.', 25990, 'ООО "РЕНТСОФТ"', 'Gorenje Стиральная машина Gorenje WHE60SFS макс.:6кг белый', 'Cклад продавца', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (10, '2023-05-21 21:02:19.033382', 'Классическая микроволновая печь Comfee CMW207M02W белого цвета с механическим управлением. Объем 20 л. Максимальная мощность микроволн 700 В. Две ручки для максимально простого управления: одна для выставления времени приготовления или веса продуктов, другая для регулировки мощности (5 уровней), можно выбрать нужную мощность и режим приготовления именно под Ваше блюдо . Внутреннее покрытие эмаль - легко очищается, дверца открывается при помощи ручки, в наличии таймер на 35 мин, есть функция размораживания по весу.Классика у вас дома - легко, просто, функционально.', 4360, 'ООО ВАЙЛДБЕРРИЗ', 'Comfee Микроволновая печь Comfee CMW207M02W, 20л, 700Вт', 'Коледино', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (11, '2023-05-21 21:04:11.577819', 'Электрический чайник REDMOND RK-М153 - новая практичная и вместительная модель из высококачественной нержавеющей стали с оригинальной крышкой, которая позволит наблюдать за процессом подогрева воды. Технологичное устройство оснащено полезной функцией автоотключения, мгновенно срабатывающей при закипании, при отсутствии воды и при снятии прибора с подставки. Чайник М153 имеет скрытый нагревательный элемент и современную контактную группу Strix, обеспечивающую абсолютную безопасность аппарата и его долговечность. Благодаря удобной и эргономичной ручке держать устройство одно удовольствие. Для того, чтобы вода была более чистой в модели предусмотрен съёмный фильтр от накипи, который очень просто мыть. М153 с большим носиком, градуированной шкалой уровня воды и возможностью вращения на 360 станет незаменимым помощником на любой кухне. Вы будете наслаждаться им каждый день! Британская компания Strix зарекомендовала себя во всем мире как производитель безопасных контроллеров и контактных групп для электрических чайников различных брендов. Качество деталей Strix подтверждено международными сертификатами и тестами. Благодаря контроллерам Strix Электрочайник REDMOND могут автоматически выключаться при закипании воды, перегреве, а также - если в колбе отсутствует вода или прибор был снят с подставки во время работы. Согласно внутренним тестам компании Strix, контроллеры обеспечивают минимум до 12000 циклов закипания. Подставки с расположенной по центру контактной группой Strix позволяют пользователям легко устанавливать чайник и вращать его на 360. А значит, чайником с одинаковым комфортом могут пользоваться как правши, так и левши. Кроме того, контактная группа Strix последней версии позволила реализовать в некоторых чайниках REDMOND возможность выбора температурного режима. Подробную информацию обо всех функциях своего чайника вы можете найти в руководстве по эксплуатации. Сталь марки AISI 304 используется для изготовления высококачественной посуды и кухонной техники. AISI 304 отличается пониженным содержанием углерода. Такой состав делает сталь 304 очень прочной и стойкой к воздействию коррозии и окислению даже в агрессивных средах. Изделия из стали AISI 304 долговечны: они не боятся резких перепадов температур, воздействия соленой и пресной воды, кислотно-щелочных растворов, а также отлично противостоят механическим повреждениям и появлению ржавчины. Чайники REDMOND. Для горячо любимых!', 3072, 'ООО "ТРЕЙД-СТАРТ"', 'REDMOND Электрический чайник REDMOND RK-M153', 'Пушкино', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (12, '2023-05-21 21:05:30.26432', 'Насладитесь новым уровнем организации полезного пространства в холодильниках серии RB3000A. Технология All-Around cooling позволяет равномерно охлаждать уголки рабочей камеры. Охлажденный воздух циркулирует через вентиляционные отверстия, имеющие выходы на каждую полку, благодаря чему в холодильнике поддерживается постоянная температура и продукты остаются свежими. Выдвижная полка позволяет эффективнее использовать пространство и организовать доступ к самым необходимым сейчас продуктам. Съёмные дверные полки позволяют легко приспособить их для хранения емкостей самых разных размеров. Возможность регулировать их по высоте позволяет использовать пространство по максимуму. Цифровой инверторный компрессор автоматически регулирует скорость работы в зависимости от выбора одного из семи уровней мощности охлаждения. В результате холодильник потребляет меньше электроэнергии, работает тихо и служит долго.', 36793, 'ООО ВАЙЛДБЕРРИЗ', 'Samsung Холодильник RB30A30N0SA/WT', 'Внуково', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (3, NULL, 'Смарт телевизор KIVI 32F750NB - это реалистичное и контрастное изображение, четкий звук с калибровкой от JVC, гибкая операционная система Google TV 11 и современный безрамочный дизайн, гармонично дополняющий любой интерьер. Больше контента – лучше: - Операционная система Google TV открывает новый опыт взаимодействия с телевизором – Google Assistant , Netflix, Google Chromecast - Порт USB и HDMI - для просмотра контента с внешних носителей - Установленное приложение KIVI Media предоставляет доступ к фильмам, фитнес тренировкам, играм и бесплатным ТВ каналам. - Доступ к цифровому телевидению со встроенным тюнером Т2 Особенности и технологии: - Low Blue Light – уменьшает количество синего излучения, снимая напряжение с ваших глаз - Предусмотрена установка на комплектную подставку или на стену с помощью стандартного крепления VESA 200x100 (продается отдельно) - Удобный пульт - 3 года гарантии на дисплей', 18500, 'ООО "КИВИСМАРТРУ"', 'Телевизор KIVI 32F750NB', 'Коледино', 1);


--
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 60, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 2, true);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 2, true);


--
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 4, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 12, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- PostgreSQL database dump complete
--

