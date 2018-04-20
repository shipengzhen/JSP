use
master
go
if exists(select * from sysdatabases where name='forum') --查询是否存在数据库如果存在就删除
drop database forum
go
create database forum --创建数据库
on
(name='forum_data', --数据文件的逻辑名
filename='E:\forum\sql\forum_data.mdf',--数据库物理文件名、数据库文件所在地址
size=5mb,       --数据库初始大小
filegrowth=10mb, --数据库增长量
maxsize=1024mb) --数据库最大大小
log on
(name='forum_log',--日志文件逻辑名
filename='E:\forum\sql\forum_data.ldf', --日志文件物理名、日志文件地址
size=5mb,  --日志文件初始大小
filegrowth=5mb, --日志文件增长量
maxsize=500mb) --日志文件大小






