use
forum
go
if exists(select * from sysobjects where name='Usee')--�ж��û����Ƿ�����������ɾ��
drop table Usee
go
create table Usee  --�����û���
(UID int identity(10000,1) not null, --�û�ID����
UName varchar(30) not null, --�û�����
pwd varchar(32) not null, --�û�����
Uexp int default(1), --�û�����Ĭ��ֵΪ1 ����Ϊ��
Umoney int default(0), --�û����Ĭ��ֵΪ0 ����Ϊ��
Sex varchar(2) not null, --�û��Ա� 
Uxy varchar(100), --�û�ǩ������Ϊ��
UPhone varchar(11), --�û��绰����Ϊ��
UEmail varchar(50),--�û���������Ϊ��
UA int default(0) --��¼����Ĭ��ֵΪ0 1Ϊ����Ա
  )


  go
  if exists(select * from sysobjects where name='ULv')--�ж��û��ȼ����Ƿ�����������ɾ��
  drop table ULv
  go
  create table ULv
  ( LV int identity(1,1) not null, --�û��ȼ�����
    EXP int  not null,            -- �ȼ����辭��ֵ
	LTitle varchar(12) not null )  --�˵ȼ�����Ӧ��ͷ��



	go

	if exists(select * from sysobjects where name='Post')--�ж����ӱ��Ƿ�����������ɾ��
    drop table Post
    go
	create table Post --�������ӱ�
	(PID int identity(1000,1) not null, --����ID
	 Phh varchar(150),--���ӱ���
	 PText text not null,   --��������
	 UID int not null, --������ID�������
	 TID int not null, --������������ID�����
	 PDate datetime default(getdate()) not null, --��������Ĭ�ϵ�ǰ����
     PRend int default(0), --�����Ķ�����Ĭ��ֵΪ�㣬����Ϊ��
	 pzan int default(0),  --��������Ĭ��ֵΪ�㣬����Ϊ��
	 PCai int default(0))  -- ��������Ĭ��ֵΪ�㣬����Ϊ��

	 go

	 if exists(select * from sysobjects where name='CT')--�ж����۱��Ƿ�����������ɾ��
    drop table CT
    go
	create table CT --�������۱�
	(CID int identity(1,1) not null, --����id����
	 CText text not null, --��������
	 PID int not null, --��������ID
	 UID int not null,  --������ID
	 CDate datetime default(getdate()) not null, --��������Ĭ�ϵ�ǰ����
	 Cnum int default(0)) --������Ĭ��0

	 go
	  if exists(select * from sysobjects where name='Type')--�ж�����������Ƿ�����������ɾ��
    drop table Type
    go
	create table Type --�������������
	(TID int identity(1,1)not null, --��������ID
	TName varchar(20) not null)  --������������

	GO
	if exists(select * from sysobjects where name='Photo')--�ж��Ƿ����ͼƬ��
	drop table Photo 
	go

	create table Photo
	(PHID INT, --ͼƬ���к�
	UID INT)--�û�ID