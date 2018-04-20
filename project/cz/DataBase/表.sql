USE master
IF exists( select * from SYSDATABASES where name='shop')
drop database shop

create database shop
on
(
	NAME='shop',
	FileName='C:\学习文件\Java\JSP\项目\cz\DataBase\shop.mdf',
	SIZE=10MB,
	FILEGROWTH=20%
)
LOG ON
(
   NAME='shop_log',
	FileName='C:\学习文件\Java\JSP\项目\cz\DataBase\shop_log.ldf',
	SIZE=3MB,
	FILEGROWTH=1%,
	MAXSIZE=20MB
)
go
use shop 
--1  管理员表
if exists ( select * from sysobjects where  name='Admin' )
drop table Admin
create table Admin
(
	adName	Varchar(10) not null,--管理名称
	adPwd	Varchar(16) not null --管理密码
)
go
Alter table Admin
add constraint PK_adName primary key(adName)--添加主键约束


go
--2  商品类型
if exists ( select * from sysobjects where  name='SpType' )
drop table SpType
create table SpType
(
	spTypeId int not null identity(1,1),--商品类型Id
	spTypeName	Varchar(10) not null --商品类型
)
go
Alter table SpType
add constraint PK_spTypeId primary key(spTypeId)--添加主键约束
go
---------------------------------------------------------------
-- 商品小类型
if exists ( select * from sysobjects where  name='spXType' )
drop table spXType
create table spXType
(
	spxTypeId int not null identity(1,1),--商品小类型Id
	spTypeId int,						--商品大类型
	spxTypeName	Varchar(10) not null --商小品类型
)
go
Alter table spXType
add constraint PK_spTsfyId primary key(spxTypeId)--添加主键约束

Alter table spXType	
add Constraint FKfspTyafId foreign key(spTypeid) references SpType(spTypeId)--大类型 外键
---------------------------------------------------------



--3  商品表
if exists ( select * from sysobjects where  name='Sp' )
drop table Sp
create table Sp
(
	spId Int not null identity(1,1),--商品id
	spName Varchar(50) not null,	--商品名字
	spTypeId Int not null,	--商品类型id
	spyMoney money not null,	--商品员价格
	spxMoney money not null,	--商品现价格
	spMs Varchar(30) null,	--商品描述
	spBh Varchar(30) null,	--商品编号
	jf Int not null,	--获得积分
	jj	Varchar(10) not null,	--季节
	spXTypeid int not null,	--小类型id
	cc	Varchar(10) not null,--尺寸
	xl	Int not null,	--销量
	--color varchar(10) null,	--color	Varchar(10) not null,	--颜色
	spTp	Varchar(50)	not null,  --展示图片
	kc int	not null,--库存
	sptime	DateTime null,	--上架时间
)

go
Alter table Sp
add constraint PK_spId primary key(spId)--添加主键约束商品id
Alter table Sp	
add Constraint FK_spTypeId foreign key(spTypeId) references SpType(spTypeId)--外键约束商品类型id
Alter table Sp
add Constraint DF_spyMoney Default(0) for spyMoney--添加默认约束商品原价格
Alter table Sp
add Constraint DF_spxMoney Default(0) for spxMoney--添加默认约束商品原价格
Alter table Sp
add Constraint DF_jf Default(0) for jf--添加默认约束商品价格
Alter table Sp
add Constraint DF_cc Default('L') for cc--添加默认约束商品尺寸
Alter table Sp
add Constraint DF_xl Default(0) for xl--添加默认约束商品销量
Alter table Sp
add Constraint DF_kc Default(0) for kc--添加默认约束商品库存
Alter table Sp
add Constraint DF_sptime Default(getdate()) for sptime--添加默认约束商品上架时间

-----
Alter table Sp	
add Constraint FK_spTyafId foreign key(spXTypeid) references spXType(spXTypeid)--小类型外键
go				
----------------------------------
-- 商品图片详情
if exists ( select * from sysobjects where  name='Spimgae' )
drop table Spimgae
create table Spimgae
(
	Spimgaeid int not null identity(1,1),--商品图片详情Id
	spId int,			--外键商品id
	imageurl varchar(100),	--商品图片详情
)
go
Alter table Spimgae	
add constraint PK_spTssfyIdf primary key(Spimgaeid)--添加主键约束

Alter table Spimgae
add Constraint FK_spTyafIdddd foreign key(spId) references Sp(spId)--小类型外键


-----------------------------

go
--4  用户表
if exists ( select * from sysobjects where  name='Users' )
drop table Users
create table Users
(
	uId	Int identity(1,1) not null,	--用户id 主键 
	uName Varchar(10) not null, 	--用户名
	uPwd Varchar(16) not null,	--密码
	name Varchar(8) null,	--真实姓名
	sex	Varchar(10) null,	--性别
	phone Varchar(11) null,	--联系电话
	address	Varchar(50) null,	--收货地址
	jf Int  null,	--积分
	uTx varchar(10) null, --用户头像
	uMoney money not null --账户金额
)
go
Alter table Users
add constraint PK_uId primary key(uId)--添加主键约束用户Id
alter table Users
add constraint up_uName unique(uName)--唯一约束用户名
alter table Users
add constraint ck_sex check(Sex='男'or Sex='女')--check约束性别
alter table Users
add constraint df_uMoney default(0) for uMoney




go
--6  订单表
if exists ( select * from sysobjects where  name='Dd' )
drop table Dd
create table Dd
(
	ddId Int not null identity(1,1),	--订单id
	spNum Int not null,	--商品数量
	ddType varchar(30) not null,	--订单类型
	spId Int not null,	--商品id  外键
	uId	Int not null,	--用户id 外键
	ddTime datetime not null --订单时间
)
go
Alter table Dd
add constraint PK_ddId primary key(ddId)--添加主键约束订单ID
Alter table Dd
add Constraint DF_spNum Default(1) for spNum--添加默认约束商品数量
Alter table Dd
add Constraint DF_ddTime Default(getdate()) for ddTime--添加默认约束订单时间
Alter table Dd
add Constraint FK_spId foreign key(spId) references Sp(spId)--外键约束商品类型id
Alter table Dd
add Constraint FK_uId foreign key(uId) references Users(uId)--外键约束用户类型id
go


go
--8   评论表
if exists ( select * from sysobjects where  name='Pl' )
drop table Pl
create table Pl
(
	plId Int identity(1,1) not null,	--评论id
	plString Varchar(200) null, 	--评论内容
	plTime Datetime not null,	--评论时间
	plType varchar(30) not null,	--评论类型
	spId int not null,      --商品Id外键
	uId int not null        --用户Id外键

)
go
Alter table Pl
add constraint PK_plId primary key(plId)--主键评论Id
Alter table Pl
add Constraint FK_plspId foreign key(spId) references Sp(spId)--外键约束商品类型id
Alter table Pl
add Constraint FK_pluId foreign key(uId) references Users(uId)--外键约束用户类型id
Alter table pl
add Constraint DF_plTime Default(getdate()) for plTime--添加默认约束评论时间

go
--9   搜藏表
if exists ( select * from sysobjects where  name='Sc' )
drop table Sc
create table Sc
(
	scId  int not null identity(1,1),--收藏Id
	uId int not null,--用户id外键
	spId int not null,--商品id外键
)
go
Alter table Sc
add constraint PK_scId primary key(scId)--主键收藏Id
Alter table Sc
add Constraint FK_scspId foreign key(spId) references Sp(spId)--外键约束商品类型id
Alter table Sc
add Constraint FK_scuId foreign key(uId) references Users(uId)--外键约束用户类型id













