USE master
IF exists( select * from SYSDATABASES where name='shop')
drop database shop

create database shop
on
(
	NAME='shop',
	FileName='F:\Learning\SQLServer\���ݿ��ļ�\shop.mdf',
	SIZE=10MB,
	FILEGROWTH=20%
)
LOG ON
(
   NAME='shop_log',
	FileName='F:\Learning\SQLServer\���ݿ��ļ�\shop_log.ldf',
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
	uTx varchar(50) null, --�û�ͷ��
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



-- ��Ʒ  ������
USE shop

insert into SpType values('��ʿ����')
insert into SpType values('�����ڴ�')
insert into SpType values('������װ')
insert into SpType values('��ɫ��װ')
insert into SpType values('�˶���')
insert into SpType values('��ʿƷ��')
insert into SpType values('������Ʒ')
insert into SpType values('�˶���Ʒ')


--��Ʒ С����		--��ƷС����Id	--��Ʒ������ --��СƷ����	


--1
insert into spXType values(1,'�п�')			--1
insert into spXType values(1,'����')			--2
insert into spXType values(1,'�����')			--3
insert into spXType values(1,'����')			--4
insert into spXType values(1,'����')
insert into spXType values(1,'������װ')
insert into spXType values(1,'���')
insert into spXType values(1,'��װ����')
--2
insert into spXType values(2,'����T��')
insert into spXType values(2,'POLO��')
insert into spXType values(2,'����T��')
insert into spXType values(2,'�������')
insert into spXType values(2,'�������')
insert into spXType values(2,'����')
insert into spXType values(2,'��֯��')
insert into spXType values(2,'����')
--3	
insert into spXType values(3,'���п�')
insert into spXType values(3,'ţ�п�')
insert into spXType values(3,'����')
insert into spXType values(3,'С�ſ�')
insert into spXType values(3,'�˶���')
insert into spXType values(3,'��֯��')
insert into spXType values(3,'9�ֿ�')
insert into spXType values(3,'����')
insert into spXType values(3,'�̿�')
--4
insert into spXType values(4,'����')
insert into spXType values(4,'������')
insert into spXType values(4,'�Ӵ���')
insert into spXType values(4,'ְ����Ӣ')
insert into spXType values(4,'�й���')
insert into spXType values(4,'����װ')
--5
insert into spXType values(5,'����t��')
insert into spXType values(5,'�˶���')
insert into spXType values(5,'�˶�����')
insert into spXType values(5,'�ٸ�t��')
insert into spXType values(5,'�˶�Polo')
insert into spXType values(5,'�˶���װ')
insert into spXType values(5,'�˶�����')
insert into spXType values(5,'�˶��̿�')
insert into spXType values(5,'�����')
insert into spXType values(5,'�˶��ѿ�')
--6
insert into spXType values(6,'���ſ�')
insert into spXType values(6,'����')
insert into spXType values(6,'��˻���')
insert into spXType values(6,'������')
insert into spXType values(6,'�Ϳ�')
insert into spXType values(6,'�ز�')
insert into spXType values(6,'GXG')
insert into spXType values(6,'AMH')
--7
insert into spXType values(7,'����')
insert into spXType values(7,'˫�米��')
insert into spXType values(7,'��ɹ��')
insert into spXType values(7,'�����')
insert into spXType values(7,'����')
--8
insert into spXType values(8,'�ܲ���')
insert into spXType values(8,'�٤��')
insert into spXType values(8,'Ӿ��')
insert into spXType values(8,'�٤��')
insert into spXType values(8,'�綯��')
insert into spXType values(8,'������')



--��Ʒ
--��Ʒid	--��Ʒ���� --��Ʒ����id	--��ƷԱ�۸�	--��Ʒ�ּ۸�	--��Ʒ����	--��Ʒ���	--��û���		--����
		--С����id--�ߴ�--����	--չʾͼƬ  --���--

--ͼƬ����ƷͼƬ����Id		--�����Ʒid --��ƷͼƬ����


insert into Sp values('�ļ�����С�ſ����й��׿�',3,90,70,'���аٴ� ��ʽ���� ','x-1',3,'�ļ�',17,'L',132,'sp10.png',4000,'2017-7-6')   --1
insert into Spimgae values(1,'sp11.png')
insert into Spimgae values(1,'sp12.png')
insert into Spimgae values(1,'sp13.png')
insert into Spimgae values(1,'sp14.png')

insert into Sp values('�߷ֿ����ļ���������ʿ',3,50,40,'������䣬���˷���','x-2',3,'�ļ�',20,'M',1322,'sp20.png',400,'2017-7-5');   --2
insert into Spimgae values(2,'sp21.png')
insert into Spimgae values(2,'sp22.png')
insert into Spimgae values(2,'sp23.png')
insert into Spimgae values(2,'sp24.png')

insert into Sp values('2017��װ��ʿ����t�� ',2,50,30,'���˷���','x-3',3,'��',9,'M',133,'sp30.png',4040,'2017-7-5');   --3
insert into Spimgae values(3,'sp31.png')
insert into Spimgae values(3,'sp32.png')
insert into Spimgae values(3,'sp33.png')
insert into Spimgae values(3,'sp34.png')

insert into Sp values('���мп˱������װ����',1,100,99,'���˷���','x-33-4',4,'����',1,'L',133,'sp40.png',440,'2017-7-4'); --4�п�
insert into Spimgae values(4,'sp41.png')
insert into Spimgae values(4,'sp42.png')
insert into Spimgae values(4,'sp43.png')
insert into Spimgae values(4,'sp44.png')

insert into Sp values('�����·������������� ',1,100,97,'���˷���','x-33-5',4,'����',1,'L',133,'sp50.png',440,'2017-7-4'); --5�п�
insert into Spimgae values(5,'sp51.png')
insert into Spimgae values(5,'sp52.png')
insert into Spimgae values(5,'sp53.png')
insert into Spimgae values(5,'sp54.png')

insert into Sp values('͸��������ʿ��ɹ���п� ',1,66,175,'���˷���','x-33-6',4,'�ļ�',1,'L',1233,'sp60.png',440,'2017-7-3'); --6�п�
insert into Spimgae values(6,'sp61.png')
insert into Spimgae values(6,'sp62.png')
insert into Spimgae values(6,'sp63.png')
insert into Spimgae values(6,'sp64.png')


insert into Sp values('������ñ�̿׳���͸�������� ',1,67,99,'���˷���','x-33-7',4,'�ļ�',1,'L',1223,'sp70.png',450,'2017-7-2'); --7�п�
insert into Spimgae values(7,'sp71.png')
insert into Spimgae values(7,'sp72.png')
insert into Spimgae values(7,'sp73.png')
insert into Spimgae values(7,'sp74.png')

insert into Sp values('ս�ؼ����ļ���ʿ��ɹ��2017�¿�',1,180,100,'���˷���','x-33-9',4,'�ļ�',1,'L',1253,'sp80.png',4520,'2017-6-1'); --8�п�
insert into Spimgae values(8,'sp81.png')
insert into Spimgae values(8,'sp82.png')


insert into Sp values('2017�ļ��¿���ñ�����а���',1,70,69,'���˷���','x-33-19',4,'�ļ�',1,'L',1253,'sp90.png',404,'2017-6-11'); --9�п�
insert into Spimgae values(9,'sp91.png')
insert into Spimgae values(9,'sp92.png')

insert into Sp values('��ɹ���к��泬��͸���ļ�',1,110,109,'���˷���','x-33-19',4,'�ļ�',1,'L',1259,'sp100.png',420,'2017-6-12'); --10�п�
insert into Spimgae values(10,'sp101.png')
insert into Spimgae values(10,'sp102.png')

insert into Sp values('С����ʱ�пյ�������װ���� ',1,110,103,'���˷���','x-33-29',4,'�ļ�',1,'L',1259,'sp103.png',401,'2017-6-12'); --11�п�
insert into Spimgae values(11,'sp104.png')

--�п�
insert into Sp values('�＾��ʿ������������PUƤ�п���װ������������',1,183,128,'���з�������̬�ȵ���װ','x-10',5,'�ļ�',1,'L',120,'spj1.png',1000,'2016-9-18');
insert into Spimgae values(12,'spjs2.png');
insert into Spimgae values(12,'spjs1.png');
insert into Sp values('������װ���洺���¿�п�����ʱ�б�������',1,184,129,'�ڰ�ײɫ���� װ�οڴ� �����տ� ','x-11',5,'�＾',1,'L',1080,'spj2.png',2000,'2016-9-19');
insert into Spimgae values(13,'spjs3.png');
insert into Spimgae values(13,'spjs4.png');
insert into Sp values('��װ�¿ɫ��������',1,185,125,'��ʿ�г��ɫ������������','x-12',5,'�＾',1,'M',200,'spj3.png',1200,'2016-9-20');
insert into Spimgae values(14,'spjs5.png');
insert into Spimgae values(14,'spjs6.png');
insert into Sp values('��װ�¿����ʿţ������',1,184,128,'���аٴ����������п�','x-13',5,'����',1,'L',1900,'spj4.png',2200,'2016-9-29');
insert into Spimgae values(15,'spjs6.png');
insert into Spimgae values(15,'spjs7.png');

--T��
insert into Sp values('2017�ļ�����ײɫ����',2,85,59,'��������Բ�쳱�ж���T����','t-8',5,'�ļ�',9,'L',1200,'spt1.png',1000,'2016-9-20');
insert into Spimgae values(16,'spts1.png');
insert into Spimgae values(16,'spts2.png');
insert into Sp values('��װ��ʿ����t����װ',2,70,48,'����䳱���·����޴����','x-9',5,'�ļ�',9,'M',1100,'spt2.png',900,'2017-6-18');
insert into Spimgae values(17,'spts3.png');
insert into Spimgae values(17,'spts4.png');
insert into Sp values('�ļ���װ���������������',2,56,39,'��ʿ����Բ�����T�������·�','x-10',5,'�ļ�',9,'L',3000,'spt3.png',1000,'2016-6-28');
insert into Spimgae values(18,'spts5.png');
insert into Spimgae values(18,'spts6.png');
insert into Sp values('�ļ���ʿ���享��t����',2,70,49,'����������װ�����·�V��','x-11',5,'�ļ�',9,'L',1200,'spt4.png',1000,'2016-7-28');
insert into Spimgae values(19,'spts7.png');
insert into Spimgae values(19,'spts8.png');
insert into Sp values('2017�ļ�������װ���䴿������',2,55,39,'��ʿ��������Բ��T��','x-12',5,'�ļ�',9,'L',180,'spt5.png',1000,'2016-7-29');
insert into Spimgae values(20,'spts9.png');
insert into Spimgae values(20,'spts10.png');
insert into Sp values('2017�ļ��¿��Լ�ٴ�V�����T��',1,83,58,'�����Լ�ٴ�V�����T��','x-13',5,'�ļ�',9,'L',1300,'spt6.png',2100,'2016-7-18');
insert into Spimgae values(21,'spts11.png');
insert into Spimgae values(21,'spts12.png');
insert into Sp values('��ʿ����T���������������·�',1,70,49,'��������Բ��ٴ�7��װ','x-14',5,'�ļ�',9,'L',500,'spt7.png',1000,'2017-7-1');
insert into Spimgae values(22,'spts13.png');
insert into Spimgae values(22,'spts14.png');
insert into Sp values('2017�ļ��¿���ʿT��������',1,70,49,'����ʱ����������T��','x-15',5,'�ļ�',9,'L',1300,'spt8.png',1000,'2017-7-28');
insert into Spimgae values(23,'spts15.png');
insert into Spimgae values(23,'spts16.png');

--����
insert into Sp values('������ͬ���ʿ���³��ưٴ��ī��̫����',4,40,28,'��������gentle monster��ī��','c-1',5,'�ļ�',26,'',1000,'spc1.png',1000,'2017-1-2');
insert into Spimgae values(24,'spcs1.png');
insert into Spimgae values(24,'spcs2.png');
insert into Sp values('2017���г����¿��ƶ��廨С��',4,40,28,'��ʿ����ٴ�ŷ�ţ�п�','c-2',5,'�ļ�',26,'L',1300,'spc2.png',1000,'2017-6-29');
insert into Spimgae values(25,'spcs3.png');
insert into Spimgae values(25,'spcs4.png');
insert into Sp values('����ԭ��ŷ����ͷ������Ů��',4,29,20,'ulzzangԭ�޿���bf���¶���','c-3',5,'�ļ�',26,'M',1000,'spc3.png',1000,'2017-6-15');
insert into Spimgae values(26,'spcs5.png');
insert into Spimgae values(26,'spcs6.png');
insert into Sp values('2017���ļ���������èצ���Գ���С��ţ�п�',4,78,76,'èצ���Գ���С��ţ�п�','c-4',5,'�ļ�',26,'L',800,'spc4.png',1000,'2017-6-2');
insert into Spimgae values(27,'spcs7.png');
insert into Spimgae values(27,'spcs8.png');
insert into Sp values('GENANX���糱��ֱͲ�˷ֿ�',4,301,298,'��ɫƮ����ƽ�ͷ������������','c-5',5,'�ļ�',26,'L',100,'spc5.png',1000,'2017-6-5');
insert into Spimgae values(28,'spcs9.png');
insert into Spimgae values(28,'spcs10.png');
insert into Sp values('GRINCH��ϵ���ƹ��׾ŷ�С�ŵ�����',4,170,168,'�ŷ�С�ŵ���������������ȿ���','c-6',5,'�ļ�',26,'XL',50,'spc6.png',1000,'2017-7-2');
insert into Spimgae values(29,'spcs11.png');
insert into Spimgae values(29,'spcs12.png');
insert into Sp values('ŷ������ƴ�ӿ���֯�����ް�������',4,97,67,'����ҡ�����ɴ��ް�������','c-7',5,'�ļ�',26,'L',1000,'spc8.png',1000,'2017-7-21');
insert into Spimgae values(30,'spcs13.png');
insert into Spimgae values(30,'spcs14.png');
insert into Sp values('�ﶬ����ʿ������ñ���ɼ������³�',4,112,78,'EXO¹�����ෲ����ͬ���·�','c-8',5,'����',26,'L',3000,'spc7.png',1000,'2016-1-2');
insert into Spimgae values(31,'spcs15.png');
insert into Spimgae values(31,'spcs16.png');

--���п�
insert into Sp values('�ļ���װ�ŷֿ������п�',3,99,69,'��ʿС�ſ�����װ���뺫���п���','x-1',5,'�ļ�',17,'L',2008,'spx1.png',200,'2017-5-29');
insert into Spimgae values(32,'spxs1.png');
insert into Spimgae values(32,'spxs2.png');
insert into Sp values('�ļ��������п�ٴ�С�žŷֿ�',3,84,59,'�ٴ�����С�žŷֿ㺫�泱��','x-2',5,'�ļ�',17,'L',1080,'spx2.png',600,'2017-5-29');
insert into Spimgae values(33,'spxs3.png');
insert into Spimgae values(33,'spxs4.png');
insert into Sp values('���İٴ�ŷֿ���',3,113,79,'�˷�����С�Ź�����������','x-3',5,'����',17,'L',2008,'spx3.png',980,'2017-3-29');
insert into Spimgae values(34,'spxs5.png');
insert into Spimgae values(34,'spxs6.png');
--insert into Sp values('��ʿ�̿㴿ɫѧ���˶���㱡�',3,99,69,'����ʱ���ļ��������п�','x-4',5,'�ļ�',17,'L',2070,'spx4.png',2090,'2017-7-19');
--insert into Spimgae values(35,'spxs7.png');
--insert into Spimgae values(35,'spxs8.png');
insert into Sp values('2017�ļ��¿��ŷֿ�',3,112,79,'��ʿ���п�����ٴ�С�ſ�','x-5',5,'�ļ�',17,'L',2008,'spx5.png',600,'2017-5-29');
insert into Spimgae values(35,'spxs9.png');
insert into Spimgae values(35,'spxs10.png');
insert into Sp values('��ʿ���ļ�С�ſ��п㳱����',3,112,78,'�й����������ߴ���ŷֿ�','x-6',5,'����',17,'L',2008,'spx6.png',200,'2017-5-29');
insert into Spimgae values(36,'spxs11.png');
insert into Spimgae values(36,'spxs12.png');
insert into Sp values('2017�¿�������ʿ���п�',3,142,99,'��ʿ���п�ٴ�����С�ſ�','x-7',5,'�ļ�',17,'L',209,'spx7.png',200,'2017-5-29');
insert into Spimgae values(37,'spxs13.png');
insert into Spimgae values(37,'spxs14.png');
insert into Sp values('2017�����¿���װ���г���',3,85,59,'��������ٴ���װ���г���','x-8',5,'�ļ�',17,'L',2008,'spx8.png',200,'2017-5-29');
insert into Spimgae values(38,'spxs15.png');
insert into Spimgae values(38,'spxs16.png');

--��Ʒ
--��Ʒid	--��Ʒ���� --��Ʒ����id	--��ƷԱ�۸�	--��Ʒ�ּ۸�	--��Ʒ����	--��Ʒ���	--��û���		--����
		--С����id--�ߴ�--����	--չʾͼƬ  --���--

--���� ��
--TѪ
insert into Sp values('��������װ����T��',2,85,59,'��������װ������ѧ����','x-5-8',5,'�ļ�',9,'L',208,'lz1.png',220,'2017-7-1');
insert into Spimgae values(39,'lxz1.png');
insert into Spimgae values(39,'lxz2.png');

insert into Sp values('����˹��������T��',2,85,66,'����˹��������T��','x-5-9',3,'�ļ�',9,'L',208,'lz2.png',210,'2017-7-2');
insert into Spimgae values(40,'lxz3.png');
insert into Spimgae values(40,'lxz4.png');
--����



insert into Sp values('HIPANDA ��Ƴ���T��',4,105,76,'HIPANDA','x-6',3,'�ļ�',26,'L',208,'lz3.png',210,'2017-7-2');
insert into Spimgae values(41,'lxz5.png');
insert into Spimgae values(41,'lxz6.png')



insert into Sp values('����ţ�����������꺫��ѧ',1,105,76,'HIPANDA','x-6',3,'�ļ�',1,'L',208,'ss1.png',210,'2017-7-2');
insert into Spimgae values(42,'ss2.png');
insert into Spimgae values(42,'ss3.png')





--�û���
insert into Users values('΢Ц��','shipengzhen1997','ʩ����','��','15315112033','ɽ����ѧ',20,'spz.png',300);
insert into Users values('����','123','','��','13876627637','ɽ����ѧ',20,'tx1.png',300);
insert into Users values('����','345','','��','18267636722','ɽ��ʡ������ɽ��·³�ܿƼ�����',30,'tx2.png',800);
insert into Users values('����','678','','��','82273874783','ɽ��ʡ��Ӫ����',40,'tx3.png',900);
insert into Users values('����','111','','��','18374636722','ɽ��ʡ������ɽ����ѧ',30,'tx4.png',700);
insert into Users values('����','678','','��','82273874783','�Ϻ���������',50,'tx5.png',1000);
select * from Users

--���۱�
insert into Pl values('�·���Ư����������������','2017-6-28','����',2,1);
insert into Pl values('�·��ܺ�������Ҳ����','2017-6-28','����',2,2);
insert into Pl values('�·������ˣ���Ԥ���һ��������Ҳ����','2017-7-2','����',1,2);
insert into Pl values('��Ԥ���һ��������Ҳ����','2017-7-2','����',1,1);
insert into Pl values('�������Ϻܺ���������������','2017-7-15','����',3,3);
select * from Pl

--������
insert into Dd values(1,'������',1,1,GETDATE())
insert into Dd values(1,'������',1,1,GETDATE())
insert into Dd values(1,'���ջ�',1,1,GETDATE())
insert into Dd values(1,'������',1,1,GETDATE())
insert into Dd values(1,'�����',1,1,GETDATE())
--�ղر�


select * from Dd












