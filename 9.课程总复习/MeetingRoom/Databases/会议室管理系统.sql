USE master
IF exists( select * from SYSDATABASES where name='Meeting')
drop database Meeting
create database Meeting
on
(
	NAME='Meeting',
	FileName='F:\Learning\SQLServer\���ݿ��ļ�\Meeting.mdf',
	SIZE=10MB,
	FILEGROWTH=20%
)
LOG ON
(
   NAME='Meeting_log',
	FileName='F:\Learning\SQLServer\���ݿ��ļ�\Meeting.ldf',
	SIZE=3MB,
	FILEGROWTH=1%,
	MAXSIZE=20MB
)
go
use Meeting
if exists(select * from sysobjects where name='MeetingCroom')
drop table MeetingCroom

create table MeetingCroom
(
	id int NOT NULL Identity(1,1),--���
	meeting_name nvarchar(30) not NULL,--����������
	meeting_order datetime not NULL,--Ԥ������
	advance_name nvarchar(20) not NULL--Ԥ����
)
alter table MeetingCroom add constraint PK_id primary key(id)--�������Լ��


select * from MeetingCroom