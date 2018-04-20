USE master
IF exists( select * from SYSDATABASES where name='shop')
drop database shop

create database shop
on
(
	NAME='shop',
	FileName='C:\ѧϰ�ļ�\Java\JSP\��Ŀ\cz\DataBase\shop.mdf',
	SIZE=10MB,
	FILEGROWTH=20%
)
LOG ON
(
   NAME='shop_log',
	FileName='C:\ѧϰ�ļ�\Java\JSP\��Ŀ\cz\DataBase\shop_log.ldf',
	SIZE=3MB,
	FILEGROWTH=1%,
	MAXSIZE=20MB
)
go
use shop 
--1  ����Ա��
if exists ( select * from sysobjects where  name='Admin' )
drop table Admin
create table Admin
(
	adName	Varchar(10) not null,--��������
	adPwd	Varchar(16) not null --��������
)
go
Alter table Admin
add constraint PK_adName primary key(adName)--�������Լ��


go
--2  ��Ʒ����
if exists ( select * from sysobjects where  name='SpType' )
drop table SpType
create table SpType
(
	spTypeId int not null identity(1,1),--��Ʒ����Id
	spTypeName	Varchar(10) not null --��Ʒ����
)
go
Alter table SpType
add constraint PK_spTypeId primary key(spTypeId)--�������Լ��
go
---------------------------------------------------------------
-- ��ƷС����
if exists ( select * from sysobjects where  name='spXType' )
drop table spXType
create table spXType
(
	spxTypeId int not null identity(1,1),--��ƷС����Id
	spTypeId int,						--��Ʒ������
	spxTypeName	Varchar(10) not null --��СƷ����
)
go
Alter table spXType
add constraint PK_spTsfyId primary key(spxTypeId)--�������Լ��

Alter table spXType	
add Constraint FKfspTyafId foreign key(spTypeid) references SpType(spTypeId)--������ ���
---------------------------------------------------------



--3  ��Ʒ��
if exists ( select * from sysobjects where  name='Sp' )
drop table Sp
create table Sp
(
	spId Int not null identity(1,1),--��Ʒid
	spName Varchar(50) not null,	--��Ʒ����
	spTypeId Int not null,	--��Ʒ����id
	spyMoney money not null,	--��ƷԱ�۸�
	spxMoney money not null,	--��Ʒ�ּ۸�
	spMs Varchar(30) null,	--��Ʒ����
	spBh Varchar(30) null,	--��Ʒ���
	jf Int not null,	--��û���
	jj	Varchar(10) not null,	--����
	spXTypeid int not null,	--С����id
	cc	Varchar(10) not null,--�ߴ�
	xl	Int not null,	--����
	--color varchar(10) null,	--color	Varchar(10) not null,	--��ɫ
	spTp	Varchar(50)	not null,  --չʾͼƬ
	kc int	not null,--���
	sptime	DateTime null,	--�ϼ�ʱ��
)

go
Alter table Sp
add constraint PK_spId primary key(spId)--�������Լ����Ʒid
Alter table Sp	
add Constraint FK_spTypeId foreign key(spTypeId) references SpType(spTypeId)--���Լ����Ʒ����id
Alter table Sp
add Constraint DF_spyMoney Default(0) for spyMoney--���Ĭ��Լ����Ʒԭ�۸�
Alter table Sp
add Constraint DF_spxMoney Default(0) for spxMoney--���Ĭ��Լ����Ʒԭ�۸�
Alter table Sp
add Constraint DF_jf Default(0) for jf--���Ĭ��Լ����Ʒ�۸�
Alter table Sp
add Constraint DF_cc Default('L') for cc--���Ĭ��Լ����Ʒ�ߴ�
Alter table Sp
add Constraint DF_xl Default(0) for xl--���Ĭ��Լ����Ʒ����
Alter table Sp
add Constraint DF_kc Default(0) for kc--���Ĭ��Լ����Ʒ���
Alter table Sp
add Constraint DF_sptime Default(getdate()) for sptime--���Ĭ��Լ����Ʒ�ϼ�ʱ��

-----
Alter table Sp	
add Constraint FK_spTyafId foreign key(spXTypeid) references spXType(spXTypeid)--С�������
go				
----------------------------------
-- ��ƷͼƬ����
if exists ( select * from sysobjects where  name='Spimgae' )
drop table Spimgae
create table Spimgae
(
	Spimgaeid int not null identity(1,1),--��ƷͼƬ����Id
	spId int,			--�����Ʒid
	imageurl varchar(100),	--��ƷͼƬ����
)
go
Alter table Spimgae	
add constraint PK_spTssfyIdf primary key(Spimgaeid)--�������Լ��

Alter table Spimgae
add Constraint FK_spTyafIdddd foreign key(spId) references Sp(spId)--С�������


-----------------------------

go
--4  �û���
if exists ( select * from sysobjects where  name='Users' )
drop table Users
create table Users
(
	uId	Int identity(1,1) not null,	--�û�id ���� 
	uName Varchar(10) not null, 	--�û���
	uPwd Varchar(16) not null,	--����
	name Varchar(8) null,	--��ʵ����
	sex	Varchar(10) null,	--�Ա�
	phone Varchar(11) null,	--��ϵ�绰
	address	Varchar(50) null,	--�ջ���ַ
	jf Int  null,	--����
	uTx varchar(10) null, --�û�ͷ��
	uMoney money not null --�˻����
)
go
Alter table Users
add constraint PK_uId primary key(uId)--�������Լ���û�Id
alter table Users
add constraint up_uName unique(uName)--ΨһԼ���û���
alter table Users
add constraint ck_sex check(Sex='��'or Sex='Ů')--checkԼ���Ա�
alter table Users
add constraint df_uMoney default(0) for uMoney




go
--6  ������
if exists ( select * from sysobjects where  name='Dd' )
drop table Dd
create table Dd
(
	ddId Int not null identity(1,1),	--����id
	spNum Int not null,	--��Ʒ����
	ddType varchar(30) not null,	--��������
	spId Int not null,	--��Ʒid  ���
	uId	Int not null,	--�û�id ���
	ddTime datetime not null --����ʱ��
)
go
Alter table Dd
add constraint PK_ddId primary key(ddId)--�������Լ������ID
Alter table Dd
add Constraint DF_spNum Default(1) for spNum--���Ĭ��Լ����Ʒ����
Alter table Dd
add Constraint DF_ddTime Default(getdate()) for ddTime--���Ĭ��Լ������ʱ��
Alter table Dd
add Constraint FK_spId foreign key(spId) references Sp(spId)--���Լ����Ʒ����id
Alter table Dd
add Constraint FK_uId foreign key(uId) references Users(uId)--���Լ���û�����id
go


go
--8   ���۱�
if exists ( select * from sysobjects where  name='Pl' )
drop table Pl
create table Pl
(
	plId Int identity(1,1) not null,	--����id
	plString Varchar(200) null, 	--��������
	plTime Datetime not null,	--����ʱ��
	plType varchar(30) not null,	--��������
	spId int not null,      --��ƷId���
	uId int not null        --�û�Id���

)
go
Alter table Pl
add constraint PK_plId primary key(plId)--��������Id
Alter table Pl
add Constraint FK_plspId foreign key(spId) references Sp(spId)--���Լ����Ʒ����id
Alter table Pl
add Constraint FK_pluId foreign key(uId) references Users(uId)--���Լ���û�����id
Alter table pl
add Constraint DF_plTime Default(getdate()) for plTime--���Ĭ��Լ������ʱ��

go
--9   �Ѳر�
if exists ( select * from sysobjects where  name='Sc' )
drop table Sc
create table Sc
(
	scId  int not null identity(1,1),--�ղ�Id
	uId int not null,--�û�id���
	spId int not null,--��Ʒid���
)
go
Alter table Sc
add constraint PK_scId primary key(scId)--�����ղ�Id
Alter table Sc
add Constraint FK_scspId foreign key(spId) references Sp(spId)--���Լ����Ʒ����id
Alter table Sc
add Constraint FK_scuId foreign key(uId) references Users(uId)--���Լ���û�����id













