use
master
go
if exists(select * from sysdatabases where name='forum') --��ѯ�Ƿ�������ݿ�������ھ�ɾ��
drop database forum
go
create database forum --�������ݿ�
on
(name='forum_data', --�����ļ����߼���
filename='E:\forum\sql\forum_data.mdf',--���ݿ������ļ��������ݿ��ļ����ڵ�ַ
size=5mb,       --���ݿ��ʼ��С
filegrowth=10mb, --���ݿ�������
maxsize=1024mb) --���ݿ�����С
log on
(name='forum_log',--��־�ļ��߼���
filename='E:\forum\sql\forum_data.ldf', --��־�ļ�����������־�ļ���ַ
size=5mb,  --��־�ļ���ʼ��С
filegrowth=5mb, --��־�ļ�������
maxsize=500mb) --��־�ļ���С






