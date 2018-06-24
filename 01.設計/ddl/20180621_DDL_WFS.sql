-- Project Name : WonFesSys
-- Date/Time    : 2018/06/21 21:44:44
-- Author       : akihiro Iwata
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- ユーザー権限
drop table if exists usr_role cascade;

create table usr_role (
  usr_id char(10) not null
  , role varchar(30)
  , constraint usr_role_PKC primary key (usr_id,role)
) ;

-- ユーザー詳細お気に入りディーラ
drop table if exists usr_detail_fav_dealers cascade;

create table usr_detail_fav_dealers (
  usr_id integer not null
  , dealer_id integer
  , constraint usr_detail_fav_dealers_PKC primary key (usr_id,dealer_id)
) ;

-- ユーザー詳細お気に入り
drop table if exists usr_detail_fav_products cascade;

create table usr_detail_fav_products (
  usr_id char(10) not null
  , dealer_id integer
  , product_id integer
  , constraint usr_detail_fav_products_PKC primary key (usr_id,dealer_id,product_id)
) ;

-- ユーザー
drop table if exists usr cascade;

create table usr (
  usr_id char(10)
  , passwd char(32)
  , user_name varchar(50)
  , constraint usr_PKC primary key (usr_id)
) ;

-- 開催時期
drop table if exists event_dates cascade;

create table event_dates (
  event_date_id integer
  , event_aboutdate char(5)
  , event_date date
  , event_season char(1)
  , constraint event_dates_PKC primary key (event_date_id)
) ;

-- 作品分野
drop table if exists categories cascade;

create table categories (
  category_id integer
  , category_name varchar(50)
  , constraint categories_PKC primary key (category_id)
) ;

-- ディーラー詳細作品画像
drop table if exists dealers_detail_products_imgs cascade;

create table dealers_detail_products_imgs (
  dealer_id integer not null
  , product_id integer
  , img_product_file varchar(50)
  , constraint dealers_detail_products_imgs_PKC primary key (dealer_id,product_id,img_product_file)
) ;

-- ディーラー詳細作品
drop table if exists dealers_detail_products cascade;

create table dealers_detail_products (
  dealer_id integer not null
  , product_id integer
  , product_name varchar(50)
  , price integer
  , introduce text
  , season_id integer
  , constraint dealers_detail_products_PKC primary key (dealer_id,product_id)
) ;

-- ディーラー詳細作品販売時期
drop table if exists dealers_detail_products_saledate cascade;

create table dealers_detail_products_saledate (
  dealer_id integer
  , product_id integer
  , event_date_id integer not null
  , constraint dealers_detail_products_saledate_PKC primary key (dealer_id,product_id,event_date_id)
) ;

-- ディーラー詳細
drop table if exists dealers_detail cascade;

create table dealers_detail (
  dealer_id int not null
  , category_id int not null
  , constraint dealers_detail_PKC primary key (dealer_id,category_id)
) ;

-- ディーラー
drop table if exists dealers cascade;

create table dealers (
  dealer_id int
  , dealer_name varchar(20)
  , bussines_type char(1)
  , takuban char(6)
  , hp_link varchar(50)
  , tw_link varchar(50)
  , sort_key char(1)
  , img_icon_file varchar(50)
  , constraint dealers_PKC primary key (dealer_id)
) ;

alter table usr_role
  add constraint usr_role_FK1 foreign key (usr_id) references usr(usr_id);

alter table usr_detail_fav_dealers
  add constraint usr_detail_fav_dealers_FK1 foreign key (usr_id) references usr(usr_id);

alter table usr_detail_fav_products
  add constraint usr_detail_fav_products_FK1 foreign key (usr_id) references usr(usr_id);

alter table dealers_detail_products_saledate
  add constraint dealers_detail_products_saledate_FK1 foreign key (event_date_id) references event_dates(event_date_id);

alter table dealers_detail
  add constraint dealers_detail_FK1 foreign key (category_id) references categories(category_id);

alter table dealers_detail_products_saledate
  add constraint dealers_detail_products_saledate_FK2 foreign key (dealer_id,product_id) references dealers_detail_products(dealer_id,product_id);

alter table dealers_detail_products_imgs
  add constraint dealers_detail_products_imgs_FK1 foreign key (dealer_id,product_id) references dealers_detail_products(dealer_id,product_id);

alter table dealers_detail_products
  add constraint dealers_detail_products_FK1 foreign key (dealer_id) references dealers(dealer_id);

alter table dealers_detail
  add constraint dealers_detail_FK2 foreign key (dealer_id) references dealers(dealer_id);

comment on table usr_role is 'ユーザー権限';
comment on column usr_role.usr_id is 'ユーザーID';
comment on column usr_role.role is '役割';

comment on table usr_detail_fav_dealers is 'ユーザー詳細お気に入りディーラ';
comment on column usr_detail_fav_dealers.usr_id is 'ユーザーID';
comment on column usr_detail_fav_dealers.dealer_id is 'ディーラーID';

comment on table usr_detail_fav_products is 'ユーザー詳細お気に入り';

comment on table usr is 'ユーザー';

comment on table event_dates is '開催時期';
comment on column event_dates.event_date_id is '開催時期ID';
comment on column event_dates.event_aboutdate is '開催日概要:yyyyW,例：2018冬';
comment on column event_dates.event_date is '開催日';
comment on column event_dates.event_season is '開催季節';

comment on table categories is '作品分野';
comment on column categories.category_id is '作品分野ID';
comment on column categories.category_name is '作品名';

comment on table dealers_detail_products_imgs is 'ディーラー詳細作品画像';
comment on column dealers_detail_products_imgs.dealer_id is 'ディーラーID';
comment on column dealers_detail_products_imgs.product_id is '作品ID';
comment on column dealers_detail_products_imgs.img_product_file is '作品画像ファイル';

comment on table dealers_detail_products is 'ディーラー詳細作品';
comment on column dealers_detail_products.dealer_id is 'ディーラーID';
comment on column dealers_detail_products.product_id is '作品ID';
comment on column dealers_detail_products.product_name is '作品名';
comment on column dealers_detail_products.price is '値段';
comment on column dealers_detail_products.introduce is '紹介文';
comment on column dealers_detail_products.season_id is '販売時期';

comment on table dealers_detail_products_saledate is 'ディーラー詳細作品販売時期';
comment on column dealers_detail_products_saledate.dealer_id is 'ディーラーID';
comment on column dealers_detail_products_saledate.product_id is '作品ID';
comment on column dealers_detail_products_saledate.event_date_id is '販売時期';

comment on table dealers_detail is 'ディーラー詳細';
comment on column dealers_detail.dealer_id is 'ディーラーid';
comment on column dealers_detail.category_id is '作品分野コード';

comment on table dealers is 'ディーラー';
comment on column dealers.dealer_id is 'ディーラーid';
comment on column dealers.dealer_name is 'ディーラー名';
comment on column dealers.bussines_type is '事業形態:0:個人、1:法人';
comment on column dealers.takuban is '卓番号';
comment on column dealers.hp_link is 'HPリンク';
comment on column dealers.tw_link is 'TWリンク';
comment on column dealers.sort_key is 'ソートキー:ア、カなど（読み仮名）';
comment on column dealers.img_icon_file is 'アイコン画像ファイル';

