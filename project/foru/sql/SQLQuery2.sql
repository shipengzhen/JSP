--�����������
insert into Post values('���Ǳ���','<p>��˭˯��˧</p>',10007,3,default,10000,8425,0)

insert into Post values('����˳��Ȼ�ʸ���','����˳��Ȼ�ʸ���<br/>������˳��Ȼ�ʸ���<br/>����˳��Ȼ�ʸ���<br/>','10001','1',GETDATE(),'100','400','20')

insert into Post values('��Թ������ڷ��������Ů������','<p>&nbsp;��Թ������ڷ��������Ů������ȴ������������˿���ľ������Į�Թ��������ֳ��ܲ��ͷ���������������ʵ���Ǹ��������ý��Ҳ�Ѿ���������������5��22�ճ�ɳ��������¼����ڵĶ���Ů��ͬ�������˿���������˾���ĳ����������ռ�����������г������ߡ���η����ڴ���������Ů��ѧ��������¼������ϵĳ˿Ͳ���û��ͦ������Ķ���Ӳ�����ƺ�����ĮΧ�۵����鶼û���ˣ������ż��ؼ��أ������Լ������Լ��³���������𡱡������������𣬸���һ�����ͺ����𡱡�����������ʱ�䡱-----������ֹ���ñ������Ů�������ķ�����������ÿһ�������������ŵ��˶���п���ˡ�<br/></p>','10001','1',GETDATE(),'100','400','20')



insert into Post values('cmd���������ȫ',' 1 dir �޲������鿴��ǰ����Ŀ¼���ļ����ļ��С� /s���鿴��ǰĿ¼�Ѿ���������Ŀ¼���ļ����ļ��С� /a���鿴���������ļ��������ļ��� /ah��ֻ��ʾ�������ļ��� /w���Խ��շ�ʽ��һ����ʾ5���ļ�����ʾ�ļ����ļ��С� /p���Է�ҳ��ʽ����ʾһҳ֮����Զ���ͣ����ʾ�� |more��ǰ���Ǹ������ǡ�\��������Ǹ��������ض�����ţ����ǰ�һ�� ����Ľ�����Ϊ����һ������Ĳ�����moreҲ��һ�����dir /w |more �õ��Ľ����dir /w /p�Ľ����һ���ġ� �����Ĳ�����ҿ����ã�dir/?�鿴�� 2 cd cd Ŀ¼���������ض���Ŀ¼����������и�Ŀ¼��ʾΪ��abcdef ghi �� ���룺cdabcdef.ghi�����Ŀ¼�� cd\ �˻ص���Ŀ¼�� cd..�˻ص���һ��Ŀ¼�� 3 md rd md Ŀ¼���������ض����ļ��С� ��dos����ϰ�߽�Ŀ¼��win����ϰ�߽��� ���С��Ǻǣ��� rd Ŀ¼����ɾ���ض����ļ��С� 4 cls �����Ļ�� 5 copy copy ·��\�ļ��� ·��\�ļ��� ����һ���ļ���������һ���ط��� 6 move move ·��\�ļ��� ·��\�ļ��� ����һ���ļ��ƶ������Ǽ���+���ƣ����� һ���ط��� 7 del del �ļ�����ɾ��һ���ļ��� del *.*��ɾ����ǰ�ļ����������ļ��� del����ɾ���ļ��С� 8 deltree ɾ���ļ��к���������������ļ��л����ļ���������������Ҫ���á� 9 format format x: ��x�����̷�����ʽ��һ����������dos������fat�ļ�ϵͳ��ʽ ���ģ���windows2000��װ��ʱ�������Ҫ��Ҫת��Ϊntfs�� 10 type type �ı��ļ�������ʾ���ı��ļ������ݡ� 11 edit ��ʵ���Ǹ�С���򣬱༭�ı��ļ��õġ� 12 ren ren ���ļ��� ���ļ��������ļ����� ','10001','1',GETDATE(),'120','300','10')


insert into Post values('��Թ������ڷ��������Ů������','<p>��������ͣ�ڲ�ԭ��<br/>�����Ӱ��Խ��Խ��<br/>��������������ϳ�</p>','10007','1',GETDATE(),'200','800','20')


insert into Post values('�Ϻ����뱱���Ŵ�ɺ�Լ','2001-1-1�Ϻ����뱱���Ŵ�ɺ�Լ<br/>2001-1-1�Ϻ����뱱���Ŵ�ɺ�Լ<br/>2001-1-1�Ϻ����뱱���Ŵ�ɺ�Լ<br/>','10002','1',GETDATE(),'100','400','20')


select * from Post
--��������
insert into Post values('���ǡ�����','��������','10001','1','2001-1-1','100','400','20')

--��ID����
select PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp
from Post inner join Usee on Post.UID=Usee.UID
where PID='1000'


--- ��ָ��-ҳ��С-��ǰҳ-��ָ������ID��ѯ�����б� 
select top 2 PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp
from Post inner join Usee on Post.UID=Usee.UID
where TID='1' and PID not in(select top ((1-1)*2) PID from Post where TID='1' order by PDate desc)
order by PDate desc

select top ҳ��С PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where TID='1' and PID not in(select top ((1-1)*2) PID from Post where TID='1')



--- ��ָ��-ҳ��С-��ǰҳ-��ָ������ID��ѯ�����б�----ָ��
select top 2 PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp
from Post inner join Usee on Post.UID=Usee.UID
where PID not in(select top ((1-1)*2) PID from Post order by PDate desc)
order by PDate desc


select top 10 PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where DateDiff(mm,PDate,getdate())=0 and PID not in(select top ((1-1)*10) PID from Post where DateDiff(mm,PDate,getdate())=0 order by PZan desc)  order by PZan desc


select * from CT
----ɾ��ָ������ID����
delete from CT where PID='1111'



--��Ƭ
select * from Photo

--���۱������
select * from CT

select top 11 CID,CText,PID,CT.UID,CDate,Cnum,UName,Uexp
from CT inner join Usee on CT.UID=Usee.UID
where PID='1000'
order by CDate desc


---�ȼ�������
select * from ULv

insert into ULv values('3000','����')


select * from Usee where UID='10001'


--ע���û�
insert into Usee values('������','123456',0,0,'��','','�ֻ���','',0)

----�޸��û�����
update Usee set
UName='һ���û���',
pwd='mima123',
Sex='Ů',
Uxy='�ҵĸ���ǩ��',
UPhone='13181553466',
UEmail='youxiang@qq.com'
where UID='10017'


---�ȼ����а�
select top 4 * from Usee
order by Uexp desc

select * from CT

select * from Post
select * from Usee
---���Ӿ���
update Usee set Uexp=Uexp+10 where UID='10017'

update CT set Cnum=Cnum+1 where CID='1'

update Post set pzan=pzan+1 where PID='1000'

insert into CT values('����',1000,10000,default,0)