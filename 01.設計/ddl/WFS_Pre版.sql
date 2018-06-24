-- Project Name : WonFesSys
-- Date/Time    : 2018/04/01 15:47:19
-- Author       : akihiro Iwata
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- 作品分野マスタ
drop table if exists prd_field_master cascade;

create table prd_field_master (
  product_filed_cd char(4) not null
  , product_filed_name varchar(20) not null
  , constraint prd_field_master_PKC primary key (product_filed_cd)
) ;

-- ディーラー詳細
drop table if exists DEALER_DETAIL cascade;

create table DEALER_DETAIL (
  dealer_id int not null
  , product_name varchar(20) not null
  , product_filed_cd char(4) not null
  , price integer not null
  , constraint DEALER_DETAIL_PKC primary key (dealer_id,product_name)
) ;

-- ディーラー
drop table if exists DEALER cascade;

create table DEALER (
  dealer_id int not null
  , name varchar(20) not null
  , takuban char(6) not null
  , dealer_icon_cd varchar(10) not null
  , hp_link varchar(50) not null
  , tw_link varchar(50) not null
  , constraint DEALER_PKC primary key (dealer_id)
) ;

alter table DEALER_DETAIL
  add constraint DEALER_DETAIL_FK1 foreign key (product_filed_cd) references prd_field_master(product_filed_cd);

alter table DEALER_DETAIL
  add constraint DEALER_DETAIL_FK2 foreign key (dealer_id) references DEALER(dealer_id);

comment on table prd_field_master is '作品分野マスタ';
comment on column prd_field_master.product_filed_cd is '作品分野コード';
comment on column prd_field_master.product_filed_name is '作品分野名';

comment on table DEALER_DETAIL is 'ディーラー詳細';
comment on column DEALER_DETAIL.dealer_id is 'ディーラーid';
comment on column DEALER_DETAIL.product_name is '商品名';
comment on column DEALER_DETAIL.product_filed_cd is '作品分野コード';
comment on column DEALER_DETAIL.price is '値段';

comment on table DEALER is 'ディーラー';
comment on column DEALER.dealer_id is 'ディーラーid';
comment on column DEALER.name is 'ディーラー名';
comment on column DEALER.takuban is '卓番号';
comment on column DEALER.dealer_icon_cd is 'ディーラーアイコンコード';
comment on column DEALER.hp_link is 'HPリンク';
comment on column DEALER.tw_link is 'TWリンク';

