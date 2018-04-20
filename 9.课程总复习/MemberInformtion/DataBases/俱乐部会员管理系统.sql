use master
if exists(select * from sysdatabases where name='Membersinfo')
drop database Membersinfo

create database Membersinfo
on
(
	name='Membersinfo',
	filename='F:\Learning\SQLServer\���ݿ��ļ�\Membersinfo.mdf',
	size=10MB,
	filegrowth=1%
)
LOG ON
(
   name='Membersinfo_log',
   filename='F:\Learning\SQLServer\���ݿ��ļ�\Membersinfo.ldf',
   size=3MB,
   filegrowth=1%,
   maxsize=20MB
)
go
use Membersinfo
create table Membersinfo
(
	mId int identity(1,1) primary key,--��Ա���
	mName nvarchar(30) not null,--��Ա����
	mGender char(2) not null,--��Ա�Ա�
	mAge int not null,--��Ա����
	mAdderss nvarchar(100),--��ͥסַ
	mEmail nvarchar(50),--�����ʼ�
)

insert into Membersinfo values('��˼��','��',36,'��̨�����Ŵ��55��','sidezhang@163.com')
insert into Membersinfo values('����','��',22,'����ʡ�Ͼ��к������±����1��','fengyu@qq.com')
insert into Membersinfo values('���','Ů',26,'�����г������»�԰6��','lihe@qq.com')
insert into Membersinfo values('ʩ����','��',20,'ɽ��ʡ������','473585505@qq.com')

select* from Membersinfo

