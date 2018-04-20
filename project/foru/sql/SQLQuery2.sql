--插入测试数据
insert into Post values('这是标题','<p>爱谁睡真帅</p>',10007,3,default,10000,8425,0)

insert into Post values('孔永顺竟然剖腹产','孔永顺竟然剖腹产<br/>产孔永顺竟然剖腹产<br/>孔永顺竟然剖腹产<br/>','10001','1',GETDATE(),'100','400','20')

insert into Post values('面对公交车内发生的猥亵女孩案件','<p>&nbsp;面对公交车内发生的猥亵女孩案件却遭遇绝大多数乘客麻木不仁冷漠旁观甚至表现出很不耐烦的类似社会丑闻其实并非个案，最近媒体也已经报导过包括今年5月22日长沙公交猥亵事件在内的多起，女孩同样遭遇乘客冷眼甚至司机的嘲讽，而且最终几乎都让猥亵男趁乱逃走。这次发生在大连公交的女大学生遭猥亵事件，车上的乘客不但没有挺身而出的东北硬汉，似乎连冷漠围观的心情都没有了，“我着急回家呢，你们自己的事自己下车解决不行吗”、“至于这样吗，各退一步不就好了吗”、“别耽误我们时间”-----；这岂止是让被猥亵的女孩“伤心发抖”，恐怕每一个看到此类新闻的人都会感慨万端。<br/></p>','10001','1',GETDATE(),'100','400','20')



insert into Post values('cmd常用命令大全',' 1 dir 无参数：查看当前所在目录的文件和文件夹。 /s：查看当前目录已经其所有子目录的文件和文件夹。 /a：查看包括隐含文件的所有文件。 /ah：只显示出隐含文件。 /w：以紧凑方式（一行显示5个文件）显示文件和文件夹。 /p：以分页方式（显示一页之后会自动暂停）显示。 |more：前面那个符号是“\”上面的那个，叫做重定向符号，就是把一个 命令的结果输出为另外一个命令的参数。more也是一个命令，dir /w |more 得到的结果和dir /w /p的结果是一样的。 其他的参数大家可以用：dir/?查看。 2 cd cd 目录名：进入特定的目录。如果看到有个目录显示为：abcdef ghi 就 输入：cdabcdef.ghi进入该目录。 cd\ 退回到根目录。 cd..退回到上一级目录。 3 md rd md 目录名：建立特定的文件夹。 （dos下面习惯叫目录，win下面习惯叫文 件夹。呵呵！） rd 目录名：删除特定的文件夹。 4 cls 清除屏幕。 5 copy copy 路径\文件名 路径\文件名 ：把一个文件拷贝到另一个地方。 6 move move 路径\文件名 路径\文件名 ：把一个文件移动（就是剪切+复制）到另 一个地方。 7 del del 文件名：删除一个文件。 del *.*：删除当前文件夹下所有文件。 del不能删除文件夹。 8 deltree 删除文件夹和它下面的所有子文件夹还有文件，厉害。。。不要乱用。 9 format format x: ：x代表盘符，格式化一个分区。在dos下是用fat文件系统格式 化的，在windows2000安装的时候会问你要不要转换为ntfs。 10 type type 文本文件名：显示出文本文件的内容。 11 edit 其实这是个小程序，编辑文本文件用的。 12 ren ren 旧文件名 新文件名：改文件名。 ','10001','1',GETDATE(),'120','300','10')


insert into Post values('面对公交车内发生的猥亵女孩案件','<p>月亮依旧停在草原上<br/>你的身影被越拉越长<br/>是你让我想你想断肠</p>','10007','1',GETDATE(),'200','800','20')


insert into Post values('南洪门与北洪门达成合约','2001-1-1南洪门与北洪门达成合约<br/>2001-1-1南洪门与北洪门达成合约<br/>2001-1-1南洪门与北洪门达成合约<br/>','10002','1',GETDATE(),'100','400','20')


select * from Post
--插入帖子
insert into Post values('这是·标题','这是正文','10001','1','2001-1-1','100','400','20')

--差ID帖子
select PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp
from Post inner join Usee on Post.UID=Usee.UID
where PID='1000'


--- 按指定-页大小-当前页-的指定分类ID查询帖子列表 
select top 2 PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp
from Post inner join Usee on Post.UID=Usee.UID
where TID='1' and PID not in(select top ((1-1)*2) PID from Post where TID='1' order by PDate desc)
order by PDate desc

select top 页大小 PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where TID='1' and PID not in(select top ((1-1)*2) PID from Post where TID='1')



--- 按指定-页大小-当前页-的指定分类ID查询帖子列表----指定
select top 2 PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp
from Post inner join Usee on Post.UID=Usee.UID
where PID not in(select top ((1-1)*2) PID from Post order by PDate desc)
order by PDate desc


select top 10 PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where DateDiff(mm,PDate,getdate())=0 and PID not in(select top ((1-1)*10) PID from Post where DateDiff(mm,PDate,getdate())=0 order by PZan desc)  order by PZan desc


select * from CT
----删除指定帖子ID评论
delete from CT where PID='1111'



--照片
select * from Photo

--评论表的数据
select * from CT

select top 11 CID,CText,PID,CT.UID,CDate,Cnum,UName,Uexp
from CT inner join Usee on CT.UID=Usee.UID
where PID='1000'
order by CDate desc


---等级表数据
select * from ULv

insert into ULv values('3000','大仙')


select * from Usee where UID='10001'


--注册用户
insert into Usee values('好人呢','123456',0,0,'男','','手机号','',0)

----修改用户资料
update Usee set
UName='一个用户名',
pwd='mima123',
Sex='女',
Uxy='我的个性签名',
UPhone='13181553466',
UEmail='youxiang@qq.com'
where UID='10017'


---等级排行榜
select top 4 * from Usee
order by Uexp desc

select * from CT

select * from Post
select * from Usee
---增加经验
update Usee set Uexp=Uexp+10 where UID='10017'

update CT set Cnum=Cnum+1 where CID='1'

update Post set pzan=pzan+1 where PID='1000'

insert into CT values('好吗',1000,10000,default,0)