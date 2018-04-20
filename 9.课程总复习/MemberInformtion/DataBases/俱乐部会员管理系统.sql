use master
if exists(select * from sysdatabases where name='Membersinfo')
drop database Membersinfo

create database Membersinfo
on
(
	name='Membersinfo',
	filename='F:\Learning\SQLServer\数据库文件\Membersinfo.mdf',
	size=10MB,
	filegrowth=1%
)
LOG ON
(
   name='Membersinfo_log',
   filename='F:\Learning\SQLServer\数据库文件\Membersinfo.ldf',
   size=3MB,
   filegrowth=1%,
   maxsize=20MB
)
go
use Membersinfo
create table Membersinfo
(
	mId int identity(1,1) primary key,--会员编号
	mName nvarchar(30) not null,--会员姓名
	mGender char(2) not null,--会员性别
	mAge int not null,--会员年龄
	mAdderss nvarchar(100),--家庭住址
	mEmail nvarchar(50),--电子邮件
)

insert into Membersinfo values('张思德','男',36,'丰台区安门大街55号','sidezhang@163.com')
insert into Membersinfo values('冯宇','男',22,'江苏省南京市河西区新北大街1号','fengyu@qq.com')
insert into Membersinfo values('李和','女',26,'北京市崇文区新华园6号','lihe@qq.com')
insert into Membersinfo values('施鹏振','男',20,'山东省滕州市','473585505@qq.com')

select* from Membersinfo

