--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 9.5.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY public.dealer_detail DROP CONSTRAINT IF EXISTS dealer_detail_fk2;
ALTER TABLE IF EXISTS ONLY public.dealer_detail DROP CONSTRAINT IF EXISTS dealer_detail_fk1;
ALTER TABLE IF EXISTS ONLY public.usr_role DROP CONSTRAINT IF EXISTS usr_role_pkey;
ALTER TABLE IF EXISTS ONLY public.usr DROP CONSTRAINT IF EXISTS usr_pkey;
ALTER TABLE IF EXISTS ONLY public.prd_field_master DROP CONSTRAINT IF EXISTS prd_field_master_pkc;
ALTER TABLE IF EXISTS ONLY public.dealer DROP CONSTRAINT IF EXISTS dealer_pkc;
ALTER TABLE IF EXISTS ONLY public.dealer_detail DROP CONSTRAINT IF EXISTS dealer_detail_pkc;
DROP TABLE IF EXISTS public.usr_role;
DROP TABLE IF EXISTS public.usr;
DROP TABLE IF EXISTS public.prd_field_master;
DROP TABLE IF EXISTS public.dealer_detail;
DROP TABLE IF EXISTS public.dealer;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: dealer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dealer (
    dealer_id integer NOT NULL,
    name character varying(20) NOT NULL,
    takuban character(6) NOT NULL,
    dealer_icon_cd character varying(10) NOT NULL,
    hp_link character varying(50) NOT NULL,
    tw_link character varying(50) NOT NULL
);


ALTER TABLE dealer OWNER TO postgres;

--
-- Name: TABLE dealer; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE dealer IS 'ディーラー';


--
-- Name: COLUMN dealer.dealer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN dealer.dealer_id IS 'ディーラーid';


--
-- Name: COLUMN dealer.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN dealer.name IS 'ディーラー名';


--
-- Name: COLUMN dealer.takuban; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN dealer.takuban IS '卓番号';


--
-- Name: COLUMN dealer.dealer_icon_cd; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN dealer.dealer_icon_cd IS 'ディーラーアイコンコード';


--
-- Name: COLUMN dealer.hp_link; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN dealer.hp_link IS 'HPリンク';


--
-- Name: COLUMN dealer.tw_link; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN dealer.tw_link IS 'TWリンク';


--
-- Name: dealer_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dealer_detail (
    dealer_id integer NOT NULL,
    product_name character varying(20) NOT NULL,
    product_filed_cd character(4) NOT NULL,
    price integer NOT NULL
);


ALTER TABLE dealer_detail OWNER TO postgres;

--
-- Name: TABLE dealer_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE dealer_detail IS 'ディーラー詳細';


--
-- Name: COLUMN dealer_detail.dealer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN dealer_detail.dealer_id IS 'ディーラーid';


--
-- Name: COLUMN dealer_detail.product_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN dealer_detail.product_name IS '商品名';


--
-- Name: COLUMN dealer_detail.product_filed_cd; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN dealer_detail.product_filed_cd IS '作品分野コード';


--
-- Name: COLUMN dealer_detail.price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN dealer_detail.price IS '値段';


--
-- Name: prd_field_master; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE prd_field_master (
    product_filed_cd character(4) NOT NULL,
    product_filed_name character varying(20) NOT NULL
);


ALTER TABLE prd_field_master OWNER TO postgres;

--
-- Name: TABLE prd_field_master; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE prd_field_master IS '作品分野マスタ';


--
-- Name: COLUMN prd_field_master.product_filed_cd; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN prd_field_master.product_filed_cd IS '作品分野コード';


--
-- Name: COLUMN prd_field_master.product_filed_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN prd_field_master.product_filed_name IS '作品分野名';


--
-- Name: usr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usr (
    uid character(10) NOT NULL,
    passwd character(32),
    unam character varying(50)
);


ALTER TABLE usr OWNER TO postgres;

--
-- Name: usr_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usr_role (
    uid character(10) NOT NULL,
    role character varying(30) NOT NULL
);


ALTER TABLE usr_role OWNER TO postgres;

--
-- Data for Name: dealer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dealer (dealer_id, name, takuban, dealer_icon_cd, hp_link, tw_link) FROM stdin;
6	いぬやま	23458 	456	http://yurucamp.jp/character/	https://twitter.com/
10	いぬやま	234586	XXX	http://yurucamp.jp/character/	https://twitter.com/
8	いぬやま	123409	XXX	http://yurucamp.jp/character/	https://twitter.com/
7	雛鶴あい！	019233	XXX	http://www.ryuoh-anime.com/	http://www.ryuoh-anime.com/
1	かがみはら	012302	123	htttp://www.iwatakhr69.net.jp	sample:
3	0000000003	000003	0000000003	0000000003	0000000003
4	0000000004	000004	0000000004	0000000004	0000000004
5	0000000005	000005	0000000005	0000000005	0000000005
11		      	XXX		
\.


--
-- Data for Name: dealer_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dealer_detail (dealer_id, product_name, product_filed_cd, price) FROM stdin;
1	みほりん　水着	0001	12000
1	ジャンヌオルタ	0002	8000
6	妙高　ドレス	0003	9000
6	かがみはらなでこ　胸像	0099	4000
\.


--
-- Data for Name: prd_field_master; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY prd_field_master (product_filed_cd, product_filed_name) FROM stdin;
0001	ガルパン
0002	FGO
0003	艦これ
0099	その他
\.


--
-- Data for Name: usr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usr (uid, passwd, unam) FROM stdin;
hinatsuru 	5f4dcc3b5aa765d61d8327deb882cf99	雛鶴あい
iwatakhr  	5f4dcc3b5aa765d61d8327deb882cf99	いわた
yashajin  	5f4dcc3b5aa765d61d8327deb882cf99	夜叉神天衣
\.


--
-- Data for Name: usr_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usr_role (uid, role) FROM stdin;
iwatakhr  	admin-gui
iwatakhr  	manager-gui
hinatsuru 	manager-gui
\.


--
-- Name: dealer_detail_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dealer_detail
    ADD CONSTRAINT dealer_detail_pkc PRIMARY KEY (dealer_id, product_name);


--
-- Name: dealer_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dealer
    ADD CONSTRAINT dealer_pkc PRIMARY KEY (dealer_id);


--
-- Name: prd_field_master_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prd_field_master
    ADD CONSTRAINT prd_field_master_pkc PRIMARY KEY (product_filed_cd);


--
-- Name: usr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usr
    ADD CONSTRAINT usr_pkey PRIMARY KEY (uid);


--
-- Name: usr_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usr_role
    ADD CONSTRAINT usr_role_pkey PRIMARY KEY (uid, role);


--
-- Name: dealer_detail_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dealer_detail
    ADD CONSTRAINT dealer_detail_fk1 FOREIGN KEY (product_filed_cd) REFERENCES prd_field_master(product_filed_cd);


--
-- Name: dealer_detail_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dealer_detail
    ADD CONSTRAINT dealer_detail_fk2 FOREIGN KEY (dealer_id) REFERENCES dealer(dealer_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

