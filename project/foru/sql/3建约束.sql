---------------------------------------------------------------------
use forum
go
---------------------------------------------------------------------
--用户表约束
alter table Usee
add constraint pk_Usee primary key (UID)--用户表主键约束
go

alter table Usee
add constraint up_UName unique (UName) --用户名唯一约束

go
alter table Usee
add constraint ck_UName check (len(UName)>=2 and len(UName)<=16) --用户名长度必须大于等于2小于等于16

go
alter table Usee
add constraint ck_pwd check (len(pwd)>=6 and len(pwd)<=16)--密码长度必须大于等于6小于等于16

go
alter table Usee
add constraint ck_UPhone check (len(UPhone)=11 or UPhone=null)--手机号必须为11位

go
alter table Usee
add constraint ck_UEmail check (UEmail like '%@%' or UEmail='' )

go
alter table Usee
add constraint ck_sex check (Sex='男' or Sex='女')

go

-------------------------------------------------------------------------------
--用户等级表约束
alter table ULv
add constraint pk_ULv primary key (LV)
go

---------------------------------------------------------------------------------
--帖子表约束
alter table Post
add constraint pk_Post primary key (PID)
go
-----------------------------------------------------
--评论表约束 
alter table CT
add constraint pk_CT primary key (CID)
go

------------------------------------------------------------
--帖子分类表
alter table Type
add constraint pk_Type primary key (TID)
go

-------------------------------------------------------------------
--主外键约束
ALTER TABLE Post   --外键约束（主表Usee和从表Post建立关系）
   ADD CONSTRAINT FK_UID          
      FOREIGN KEY (UID) REFERENCES Usee (UID)
GO


ALTER TABLE Post   --外键约束（主表Type和从表Post建立关系）
   ADD CONSTRAINT FK_TID          
      FOREIGN KEY (TID) REFERENCES Type (TID)
GO

ALTER TABLE CT   --外键约束（主表Post和从表CT建立关系）
   ADD CONSTRAINT FK_PID          
      FOREIGN KEY (PID) REFERENCES Post (PID)
GO
ALTER TABLE CT   --外键约束（主表Usee和从表CT建立关系）
   ADD CONSTRAINT FK_UUID          
      FOREIGN KEY (UID) REFERENCES Usee (UID)
GO

