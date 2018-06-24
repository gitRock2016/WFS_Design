-- Project Name : WonFesSys
-- Date/Time    : 2018/04/01 15:47:19
-- Author       : akihiro Iwata
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- ��i����}�X�^
drop table if exists prd_field_master cascade;

create table prd_field_master (
  product_filed_cd char(4) not null
  , product_filed_name varchar(20) not null
  , constraint prd_field_master_PKC primary key (product_filed_cd)
) ;

-- �f�B�[���[�ڍ�
drop table if exists DEALER_DETAIL cascade;

create table DEALER_DETAIL (
  dealer_id int not null
  , product_name varchar(20) not null
  , product_filed_cd char(4) not null
  , price integer not null
  , constraint DEALER_DETAIL_PKC primary key (dealer_id,product_name)
) ;

-- �f�B�[���[
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

comment on table prd_field_master is '��i����}�X�^';
comment on column prd_field_master.product_filed_cd is '��i����R�[�h';
comment on column prd_field_master.product_filed_name is '��i���얼';

comment on table DEALER_DETAIL is '�f�B�[���[�ڍ�';
comment on column DEALER_DETAIL.dealer_id is '�f�B�[���[id';
comment on column DEALER_DETAIL.product_name is '���i��';
comment on column DEALER_DETAIL.product_filed_cd is '��i����R�[�h';
comment on column DEALER_DETAIL.price is '�l�i';

comment on table DEALER is '�f�B�[���[';
comment on column DEALER.dealer_id is '�f�B�[���[id';
comment on column DEALER.name is '�f�B�[���[��';
comment on column DEALER.takuban is '��ԍ�';
comment on column DEALER.dealer_icon_cd is '�f�B�[���[�A�C�R���R�[�h';
comment on column DEALER.hp_link is 'HP�����N';
comment on column DEALER.tw_link is 'TW�����N';

