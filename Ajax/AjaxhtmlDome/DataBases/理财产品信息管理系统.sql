use master
if exists(select * from sysdatabases where name='Financing')
drop database Financing

create database Financing
on
(
	name='Financing',
	filename='F:\Learning\SQLServer\数据库文件\Financing.mdf',
	size=10MB,
	filegrowth=1%
)
LOG ON
(
   name='Financing_log',
   filename='F:\Learning\SQLServer\数据库文件\Financing.ldf',
   size=3MB,
   filegrowth=1%,
   maxsize=20MB
)
go
use Financing
create table FinancingProduct
(
	id nvarchar(10) primary key,--产品编号
	risk int not null,--风险评级
	income nvarchar(10) not null,--预期收益
	saleStaring datetime not null,--发售起始日
	saleEnd datetime not null,--发售截止日
	[end] datetime not null--产品到期日
)

insert into FinancingProduct values('310898','2','5.60%','2014-07-12','2014-07-15','2014-09-10')
insert into FinancingProduct values('310176','2','5.80%','2014-07-10','2014-07-14','2014-08-21')
insert into FinancingProduct values('310869','2','5.70%','2014-07-09','2014-07-13','2014-10-14')
insert into FinancingProduct values('310816','2','5.55%','2014-07-08','2014-07-14','2014-09-18')
insert into FinancingProduct values('104448','3','7.10%','2014-07-04','2014-07-09','2014-08-11')

select* from FinancingProduct



