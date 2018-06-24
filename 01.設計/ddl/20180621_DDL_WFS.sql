-- Project Name : WonFesSys
-- Date/Time    : 2018/06/21 21:44:44
-- Author       : akihiro Iwata
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- ���[�U�[����
drop table if exists usr_role cascade;

create table usr_role (
  usr_id char(10) not null
  , role varchar(30)
  , constraint usr_role_PKC primary key (usr_id,role)
) ;

-- ���[�U�[�ڍׂ��C�ɓ���f�B�[��
drop table if exists usr_detail_fav_dealers cascade;

create table usr_detail_fav_dealers (
  usr_id integer not null
  , dealer_id integer
  , constraint usr_detail_fav_dealers_PKC primary key (usr_id,dealer_id)
) ;

-- ���[�U�[�ڍׂ��C�ɓ���
drop table if exists usr_detail_fav_products cascade;

create table usr_detail_fav_products (
  usr_id char(10) not null
  , dealer_id integer
  , product_id integer
  , constraint usr_detail_fav_products_PKC primary key (usr_id,dealer_id,product_id)
) ;

-- ���[�U�[
drop table if exists usr cascade;

create table usr (
  usr_id char(10)
  , passwd char(32)
  , user_name varchar(50)
  , constraint usr_PKC primary key (usr_id)
) ;

-- �J�Î���
drop table if exists event_dates cascade;

create table event_dates (
  event_date_id integer
  , event_aboutdate char(5)
  , event_date date
  , event_season char(1)
  , constraint event_dates_PKC primary key (event_date_id)
) ;

-- ��i����
drop table if exists categories cascade;

create table categories (
  category_id integer
  , category_name varchar(50)
  , constraint categories_PKC primary key (category_id)
) ;

-- �f�B�[���[�ڍ׍�i�摜
drop table if exists dealers_detail_products_imgs cascade;

create table dealers_detail_products_imgs (
  dealer_id integer not null
  , product_id integer
  , img_product_file varchar(50)
  , constraint dealers_detail_products_imgs_PKC primary key (dealer_id,product_id,img_product_file)
) ;

-- �f�B�[���[�ڍ׍�i
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

-- �f�B�[���[�ڍ׍�i�̔�����
drop table if exists dealers_detail_products_saledate cascade;

create table dealers_detail_products_saledate (
  dealer_id integer
  , product_id integer
  , event_date_id integer not null
  , constraint dealers_detail_products_saledate_PKC primary key (dealer_id,product_id,event_date_id)
) ;

-- �f�B�[���[�ڍ�
drop table if exists dealers_detail cascade;

create table dealers_detail (
  dealer_id int not null
  , category_id int not null
  , constraint dealers_detail_PKC primary key (dealer_id,category_id)
) ;

-- �f�B�[���[
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

comment on table usr_role is '���[�U�[����';
comment on column usr_role.usr_id is '���[�U�[ID';
comment on column usr_role.role is '����';

comment on table usr_detail_fav_dealers is '���[�U�[�ڍׂ��C�ɓ���f�B�[��';
comment on column usr_detail_fav_dealers.usr_id is '���[�U�[ID';
comment on column usr_detail_fav_dealers.dealer_id is '�f�B�[���[ID';

comment on table usr_detail_fav_products is '���[�U�[�ڍׂ��C�ɓ���';

comment on table usr is '���[�U�[';

comment on table event_dates is '�J�Î���';
comment on column event_dates.event_date_id is '�J�Î���ID';
comment on column event_dates.event_aboutdate is '�J�Ó��T�v:yyyyW,��F2018�~';
comment on column event_dates.event_date is '�J�Ó�';
comment on column event_dates.event_season is '�J�ËG��';

comment on table categories is '��i����';
comment on column categories.category_id is '��i����ID';
comment on column categories.category_name is '��i��';

comment on table dealers_detail_products_imgs is '�f�B�[���[�ڍ׍�i�摜';
comment on column dealers_detail_products_imgs.dealer_id is '�f�B�[���[ID';
comment on column dealers_detail_products_imgs.product_id is '��iID';
comment on column dealers_detail_products_imgs.img_product_file is '��i�摜�t�@�C��';

comment on table dealers_detail_products is '�f�B�[���[�ڍ׍�i';
comment on column dealers_detail_products.dealer_id is '�f�B�[���[ID';
comment on column dealers_detail_products.product_id is '��iID';
comment on column dealers_detail_products.product_name is '��i��';
comment on column dealers_detail_products.price is '�l�i';
comment on column dealers_detail_products.introduce is '�Љ';
comment on column dealers_detail_products.season_id is '�̔�����';

comment on table dealers_detail_products_saledate is '�f�B�[���[�ڍ׍�i�̔�����';
comment on column dealers_detail_products_saledate.dealer_id is '�f�B�[���[ID';
comment on column dealers_detail_products_saledate.product_id is '��iID';
comment on column dealers_detail_products_saledate.event_date_id is '�̔�����';

comment on table dealers_detail is '�f�B�[���[�ڍ�';
comment on column dealers_detail.dealer_id is '�f�B�[���[id';
comment on column dealers_detail.category_id is '��i����R�[�h';

comment on table dealers is '�f�B�[���[';
comment on column dealers.dealer_id is '�f�B�[���[id';
comment on column dealers.dealer_name is '�f�B�[���[��';
comment on column dealers.bussines_type is '���ƌ`��:0:�l�A1:�@�l';
comment on column dealers.takuban is '��ԍ�';
comment on column dealers.hp_link is 'HP�����N';
comment on column dealers.tw_link is 'TW�����N';
comment on column dealers.sort_key is '�\�[�g�L�[:�A�A�J�Ȃǁi�ǂ݉����j';
comment on column dealers.img_icon_file is '�A�C�R���摜�t�@�C��';

