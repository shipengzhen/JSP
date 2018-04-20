use
forum
go
if exists(select * from sysobjects where name='Usee')--判断用户表是否存在如果存在删除
drop table Usee
go
create table Usee  --创建用户表
(UID int identity(10000,1) not null, --用户ID自增
UName varchar(30) not null, --用户名称
pwd varchar(32) not null, --用户密码
Uexp int default(1), --用户经验默认值为1 允许为空
Umoney int default(0), --用户金币默认值为0 允许为空
Sex varchar(2) not null, --用户性别 
Uxy varchar(100), --用户签名允许为空
UPhone varchar(11), --用户电话允许为空
UEmail varchar(50),--用户邮箱允许为空
UA int default(0) --登录类型默认值为0 1为管理员
  )


  go
  if exists(select * from sysobjects where name='ULv')--判断用户等级表是否存在如果存在删除
  drop table ULv
  go
  create table ULv
  ( LV int identity(1,1) not null, --用户等级自增
    EXP int  not null,            -- 等级所需经验值
	LTitle varchar(12) not null )  --此等级所对应的头衔



	go

	if exists(select * from sysobjects where name='Post')--判断帖子表是否存在如果存在删除
    drop table Post
    go
	create table Post --创建帖子表
	(PID int identity(1000,1) not null, --帖子ID
	 Phh varchar(150),--帖子标题
	 PText text not null,   --帖子内容
	 UID int not null, --发帖人ID，外键，
	 TID int not null, --帖子所属分类ID，外键
	 PDate datetime default(getdate()) not null, --发帖日期默认当前日期
     PRend int default(0), --帖子阅读量，默认值为零，允许为空
	 pzan int default(0),  --点赞数，默认值为零，允许为空
	 PCai int default(0))  -- 点赞数，默认值为零，允许为空

	 go

	 if exists(select * from sysobjects where name='CT')--判断评论表是否存在如果存在删除
    drop table CT
    go
	create table CT --创建评论表
	(CID int identity(1,1) not null, --评论id自增
	 CText text not null, --评论内容
	 PID int not null, --所属帖子ID
	 UID int not null,  --评论者ID
	 CDate datetime default(getdate()) not null, --评论日期默认当前日期
	 Cnum int default(0)) --点赞数默认0

	 go
	  if exists(select * from sysobjects where name='Type')--判断帖子种类表是否存在如果存在删除
    drop table Type
    go
	create table Type --创建帖子种类表
	(TID int identity(1,1)not null, --帖子种类ID
	TName varchar(20) not null)  --帖子种类名称

	GO
	if exists(select * from sysobjects where name='Photo')--判断是否存在图片表
	drop table Photo 
	go

	create table Photo
	(PHID INT, --图片序列号
	UID INT)--用户ID