---------------------------------------------------------------------
use forum
go
---------------------------------------------------------------------
--�û���Լ��
alter table Usee
add constraint pk_Usee primary key (UID)--�û�������Լ��
go

alter table Usee
add constraint up_UName unique (UName) --�û���ΨһԼ��

go
alter table Usee
add constraint ck_UName check (len(UName)>=2 and len(UName)<=16) --�û������ȱ�����ڵ���2С�ڵ���16

go
alter table Usee
add constraint ck_pwd check (len(pwd)>=6 and len(pwd)<=16)--���볤�ȱ�����ڵ���6С�ڵ���16

go
alter table Usee
add constraint ck_UPhone check (len(UPhone)=11 or UPhone=null)--�ֻ��ű���Ϊ11λ

go
alter table Usee
add constraint ck_UEmail check (UEmail like '%@%' or UEmail='' )

go
alter table Usee
add constraint ck_sex check (Sex='��' or Sex='Ů')

go

-------------------------------------------------------------------------------
--�û��ȼ���Լ��
alter table ULv
add constraint pk_ULv primary key (LV)
go

---------------------------------------------------------------------------------
--���ӱ�Լ��
alter table Post
add constraint pk_Post primary key (PID)
go
-----------------------------------------------------
--���۱�Լ�� 
alter table CT
add constraint pk_CT primary key (CID)
go

------------------------------------------------------------
--���ӷ����
alter table Type
add constraint pk_Type primary key (TID)
go

-------------------------------------------------------------------
--�����Լ��
ALTER TABLE Post   --���Լ��������Usee�ʹӱ�Post������ϵ��
   ADD CONSTRAINT FK_UID          
      FOREIGN KEY (UID) REFERENCES Usee (UID)
GO


ALTER TABLE Post   --���Լ��������Type�ʹӱ�Post������ϵ��
   ADD CONSTRAINT FK_TID          
      FOREIGN KEY (TID) REFERENCES Type (TID)
GO

ALTER TABLE CT   --���Լ��������Post�ʹӱ�CT������ϵ��
   ADD CONSTRAINT FK_PID          
      FOREIGN KEY (PID) REFERENCES Post (PID)
GO
ALTER TABLE CT   --���Լ��������Usee�ʹӱ�CT������ϵ��
   ADD CONSTRAINT FK_UUID          
      FOREIGN KEY (UID) REFERENCES Usee (UID)
GO

