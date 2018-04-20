-- 商品  大类型
USE shop

insert into SpType values('男士外套')
insert into SpType values('男生内搭')
insert into SpType values('男生裤装')
insert into SpType values('特色男装')
insert into SpType values('运动服')
insert into SpType values('男士品牌')
insert into SpType values('户外用品')
insert into SpType values('运动用品')


--商品 小类型		--商品小类型Id	--商品大类型 --商小品类型	


--1
insert into spXType values(1,'夹克')			--1
insert into spXType values(1,'单西')			--2
insert into spXType values(1,'棒球服')			--3
insert into spXType values(1,'棉衣')			--4
insert into spXType values(1,'大衣')
insert into spXType values(1,'西服套装')
insert into spXType values(1,'马甲')
insert into spXType values(1,'工装外套')
--2
insert into spXType values(2,'短袖T恤')
insert into spXType values(2,'POLO衫')
insert into spXType values(2,'长袖T恤')
insert into spXType values(2,'短袖衬衫')
insert into spXType values(2,'长袖衬衫')
insert into spXType values(2,'卫衣')
insert into spXType values(2,'针织衫')
insert into spXType values(2,'背心')
--3	
insert into spXType values(3,'休闲裤')
insert into spXType values(3,'牛仔裤')
insert into spXType values(3,'西裤')
insert into spXType values(3,'小脚裤')
insert into spXType values(3,'运动裤')
insert into spXType values(3,'针织裤')
insert into spXType values(3,'9分裤')
insert into spXType values(3,'背心')
insert into spXType values(3,'短裤')
--4
insert into spXType values(4,'潮牌')
insert into spXType values(4,'中老年')
insert into spXType values(4,'加大码')
insert into spXType values(4,'职场精英')
insert into spXType values(4,'中国风')
insert into spXType values(4,'情侣装')
--5
insert into spXType values(5,'短袖t恤')
insert into spXType values(5,'运动裤')
insert into spXType values(5,'运动内衣')
insert into spXType values(5,'速干t恤')
insert into spXType values(5,'运动Polo')
insert into spXType values(5,'运动套装')
insert into spXType values(5,'运动卫衣')
insert into spXType values(5,'运动短裤')
insert into spXType values(5,'健身服')
insert into spXType values(5,'运动茄克')
--6
insert into spXType values(6,'束脚裤')
insert into spXType values(6,'深吗')
insert into spXType values(6,'马克华菲')
insert into spXType values(6,'奥利啊')
insert into spXType values(6,'耐克')
insert into spXType values(6,'特不')
insert into spXType values(6,'GXG')
insert into spXType values(6,'AMH')
--7
insert into spXType values(7,'钓竿')
insert into spXType values(7,'双肩背包')
insert into spXType values(7,'防晒衣')
insert into spXType values(7,'户外包')
insert into spXType values(7,'帐篷')
--8
insert into spXType values(8,'跑步机')
insert into spXType values(8,'瑜伽垫')
insert into spXType values(8,'泳衣')
insert into spXType values(8,'瑜伽服')
insert into spXType values(8,'电动车')
insert into spXType values(8,'网球拍')



--商品
--商品id	--商品名字 --商品类型id	--商品员价格	--商品现价格	--商品描述	--商品编号	--获得积分		--季节
		--小类型id--尺寸--销量	--展示图片  --库存--

--图片：商品图片详情Id		--外键商品id --商品图片详情


insert into Sp values('夏季薄款小脚裤子男哈伦裤',3,90,70,'休闲百搭 款式新逸 ','x-1',3,'夏季',17,'L',132,'sp10.png',4000,'2017-7-6')   --1
insert into Spimgae values(1,'sp11.png')
insert into Spimgae values(1,'sp12.png')
insert into Spimgae values(1,'sp13.png')
insert into Spimgae values(1,'sp14.png')

insert into Sp values('七分裤男夏季薄修身男士',3,50,40,'任意搭配，送运费险','x-2',3,'夏季',20,'M',1322,'sp20.png',400,'2017-7-5');   --2
insert into Spimgae values(2,'sp21.png')
insert into Spimgae values(2,'sp22.png')
insert into Spimgae values(2,'sp23.png')
insert into Spimgae values(2,'sp24.png')

insert into Sp values('2017夏装男士短袖t恤 ',2,50,30,'送运费险','x-3',3,'夏',9,'M',133,'sp30.png',4040,'2017-7-5');   --3
insert into Spimgae values(3,'sp31.png')
insert into Spimgae values(3,'sp32.png')
insert into Spimgae values(3,'sp33.png')
insert into Spimgae values(3,'sp34.png')

insert into Sp values('休闲夹克薄款春秋男装外衣',1,100,99,'送运费险','x-33-4',4,'春季',1,'L',133,'sp40.png',440,'2017-7-4'); --4夹克
insert into Spimgae values(4,'sp41.png')
insert into Spimgae values(4,'sp42.png')
insert into Spimgae values(4,'sp43.png')
insert into Spimgae values(4,'sp44.png')

insert into Sp values('休闲衣服潮流薄款外套 ',1,100,97,'送运费险','x-33-5',4,'春季',1,'L',133,'sp50.png',440,'2017-7-4'); --5夹克
insert into Spimgae values(5,'sp51.png')
insert into Spimgae values(5,'sp52.png')
insert into Spimgae values(5,'sp53.png')
insert into Spimgae values(5,'sp54.png')

insert into Sp values('透气超薄男士防晒服夹克 ',1,66,175,'送运费险','x-33-6',4,'夏季',1,'L',1233,'sp60.png',440,'2017-7-3'); --6夹克
insert into Spimgae values(6,'sp61.png')
insert into Spimgae values(6,'sp62.png')
insert into Spimgae values(6,'sp63.png')
insert into Spimgae values(6,'sp64.png')


insert into Sp values('外套连帽刺孔超薄透气男外套 ',1,67,99,'送运费险','x-33-7',4,'夏季',1,'L',1223,'sp70.png',450,'2017-7-2'); --7夹克
insert into Spimgae values(7,'sp71.png')
insert into Spimgae values(7,'sp72.png')
insert into Spimgae values(7,'sp73.png')
insert into Spimgae values(7,'sp74.png')

insert into Sp values('战地吉普夏季男士防晒服2017新款',1,180,100,'送运费险','x-33-9',4,'夏季',1,'L',1253,'sp80.png',4520,'2017-6-1'); --8夹克
insert into Spimgae values(8,'sp81.png')
insert into Spimgae values(8,'sp82.png')


insert into Sp values('2017夏季新款连帽韩版男棒球',1,70,69,'送运费险','x-33-19',4,'夏季',1,'L',1253,'sp90.png',404,'2017-6-11'); --9夹克
insert into Spimgae values(9,'sp91.png')
insert into Spimgae values(9,'sp92.png')

insert into Sp values('防晒衣男韩版超薄透气夏季',1,110,109,'送运费险','x-33-19',4,'夏季',1,'L',1259,'sp100.png',420,'2017-6-12'); --10夹克
insert into Spimgae values(10,'sp101.png')
insert into Spimgae values(10,'sp102.png')

insert into Sp values('小清新时尚空调服大码装外套 ',1,110,103,'送运费险','x-33-29',4,'夏季',1,'L',1259,'sp103.png',401,'2017-6-12'); --11夹克
insert into Spimgae values(11,'sp104.png')

--夹克
insert into Sp values('秋季男士韩版修身立领PU皮夹克男装春季潮流外套',1,183,128,'潮男范，做有态度的男装','x-10',5,'夏季',1,'L',120,'spj1.png',1000,'2016-9-18');
insert into Spimgae values(12,'spjs2.png');
insert into Spimgae values(12,'spjs1.png');
insert into Sp values('凡兔男装韩版春秋新款夹克修身时尚薄外套男',1,184,129,'黑白撞色车线 装饰口袋 罗纹收口 ','x-11',5,'秋季',1,'L',1080,'spj2.png',2000,'2016-9-19');
insert into Spimgae values(13,'spjs3.png');
insert into Spimgae values(13,'spjs4.png');
insert into Sp values('秋装新款纯色风衣外套',1,185,125,'男士中长款纯色宽松休闲上衣','x-12',5,'秋季',1,'M',200,'spj3.png',1200,'2016-9-20');
insert into Spimgae values(14,'spjs5.png');
insert into Spimgae values(14,'spjs6.png');
insert into Sp values('春装新款韩版男士牛仔外套',1,184,128,'休闲百搭青少年棒球夹克','x-13',5,'春季',1,'L',1900,'spj4.png',2200,'2016-9-29');
insert into Spimgae values(15,'spjs6.png');
insert into Spimgae values(15,'spjs7.png');

--T恤
insert into Sp values('2017夏季个性撞色短袖',2,85,59,'韩版修身圆领潮男短袖T恤衫','t-8',5,'夏季',9,'L',1200,'spt1.png',1000,'2016-9-20');
insert into Spimgae values(16,'spts1.png');
insert into Spimgae values(16,'spts2.png');
insert into Sp values('夏装男士短袖t恤男装',2,70,48,'半截袖潮流衣服纯棉打底衫','x-9',5,'夏季',9,'M',1100,'spt2.png',900,'2017-6-18');
insert into Spimgae values(17,'spts3.png');
insert into Spimgae values(17,'spts4.png');
insert into Sp values('夏季男装潮流韩版修身短袖',2,56,39,'男士纯棉圆领短袖T恤男生衣服','x-10',5,'夏季',9,'L',3000,'spt3.png',1000,'2016-6-28');
insert into Spimgae values(18,'spts5.png');
insert into Spimgae values(18,'spts6.png');
insert into Sp values('夏季男士短袖韩版t恤男',2,70,49,'潮流个性夏装修身衣服V领','x-11',5,'夏季',9,'L',1200,'spt4.png',1000,'2016-7-28');
insert into Spimgae values(19,'spts7.png');
insert into Spimgae values(19,'spts8.png');
insert into Sp values('2017夏季潮流男装短袖纯棉体恤',2,55,39,'男士韩版修身圆领T恤','x-12',5,'夏季',9,'L',180,'spt5.png',1000,'2016-7-29');
insert into Spimgae values(20,'spts9.png');
insert into Spimgae values(20,'spts10.png');
insert into Sp values('2017夏季新款潮简约百搭V领短袖T恤',1,83,58,'修身简约百搭V领短袖T恤','x-13',5,'夏季',9,'L',1300,'spt6.png',2100,'2016-7-18');
insert into Spimgae values(21,'spts11.png');
insert into Spimgae values(21,'spts12.png');
insert into Sp values('男士短袖T恤潮流男生修身衣服',1,70,49,'青年体恤圆领百搭7字装','x-14',5,'夏季',9,'L',500,'spt7.png',1000,'2017-7-1');
insert into Spimgae values(22,'spts13.png');
insert into Spimgae values(22,'spts14.png');
insert into Sp values('2017夏季新款男士T恤假两件',1,70,49,'潮流时尚男生半袖T恤','x-15',5,'夏季',9,'L',1300,'spt8.png',1000,'2017-7-28');
insert into Spimgae values(23,'spts15.png');
insert into Spimgae values(23,'spts16.png');

--潮牌
insert into Sp values('【明星同款】男士情侣潮牌百搭方框墨镜太阳镜',4,40,28,'韩国潮牌gentle monster的墨镜','c-1',5,'夏季',26,'',1000,'spc1.png',1000,'2017-1-2');
insert into Spimgae values(24,'spcs1.png');
insert into Spimgae values(24,'spcs2.png');
insert into Sp values('2017港仔潮牌新款破洞绣花小脚',4,40,28,'男士修身百搭九分牛仔裤','c-2',5,'夏季',26,'L',1300,'spc2.png',1000,'2017-6-29');
insert into Spimgae values(25,'spcs3.png');
insert into Spimgae values(25,'spcs4.png');
insert into Sp values('自制原创欧美街头潮牌男女款',4,29,20,'ulzzang原宿宽松bf情侣短袖','c-3',5,'夏季',26,'M',1000,'spc3.png',1000,'2017-6-15');
insert into Spimgae values(26,'spcs5.png');
insert into Spimgae values(26,'spcs6.png');
insert into Sp values('2017春夏季潮男修身猫爪个性潮牌小脚牛仔裤',4,78,76,'猫爪个性潮牌小脚牛仔裤','c-4',5,'夏季',26,'L',800,'spc4.png',1000,'2017-6-2');
insert into Spimgae values(27,'spcs7.png');
insert into Spimgae values(27,'spcs8.png');
insert into Sp values('GENANX闪电潮牌直筒八分裤',4,301,298,'黄色飘带设计街头潮流个性男生','c-5',5,'夏季',26,'L',100,'spc5.png',1000,'2017-6-5');
insert into Spimgae values(28,'spcs9.png');
insert into Spimgae values(28,'spcs10.png');
insert into Sp values('GRINCH日系潮牌哈伦九分小脚灯笼裤',4,170,168,'九分小脚灯笼裤宽松休闲阔腿裤男','c-6',5,'夏季',26,'XL',50,'spc6.png',1000,'2017-7-2');
insert into Spimgae values(29,'spcs11.png');
insert into Spimgae values(29,'spcs12.png');
insert into Sp values('欧美潮牌拼接宽松织带纯棉半袖上衣',4,97,67,'嘻哈摇滚宽松纯棉半袖上衣','c-7',5,'夏季',26,'L',1000,'spc8.png',1000,'2017-7-21');
insert into Spimgae values(30,'spcs13.png');
insert into Spimgae values(30,'spcs14.png');
insert into Sp values('秋冬季男士潮牌连帽宽松加绒卫衣潮',4,112,78,'EXO鹿晗吴亦凡明星同款衣服','c-8',5,'冬季',26,'L',3000,'spc7.png',1000,'2016-1-2');
insert into Spimgae values(31,'spcs15.png');
insert into Spimgae values(31,'spcs16.png');

--休闲裤
insert into Sp values('夏季男装九分裤男休闲裤',3,99,69,'男士小脚裤男夏装大码韩版男裤子','x-1',5,'夏季',17,'L',2008,'spx1.png',200,'2017-5-29');
insert into Spimgae values(32,'spxs1.png');
insert into Spimgae values(32,'spxs2.png');
insert into Sp values('夏季薄款休闲裤百搭小脚九分裤',3,84,59,'百搭修身小脚九分裤韩版潮流','x-2',5,'夏季',17,'L',1080,'spx2.png',600,'2017-5-29');
insert into Spimgae values(33,'spxs3.png');
insert into Spimgae values(33,'spxs4.png');
insert into Sp values('春夏百搭九分裤男',3,113,79,'八分休闲小脚哈伦修身西裤','x-3',5,'春季',17,'L',2008,'spx3.png',980,'2017-3-29');
insert into Spimgae values(34,'spxs5.png');
insert into Spimgae values(34,'spxs6.png');
--insert into Sp values('男士短裤纯色学生运动半裤薄款潮',3,99,69,'休闲时尚夏季宽松休闲裤','x-4',5,'夏季',17,'L',2070,'spx4.png',2090,'2017-7-19');
--insert into Spimgae values(35,'spxs7.png');
--insert into Spimgae values(35,'spxs8.png');
insert into Sp values('2017夏季新款薄款九分裤',3,112,79,'男士休闲裤修身百搭小脚裤','x-5',5,'夏季',17,'L',2008,'spx5.png',600,'2017-5-29');
insert into Spimgae values(35,'spxs9.png');
insert into Spimgae values(35,'spxs10.png');
insert into Sp values('男士春夏季小脚裤男裤潮大码',3,112,78,'中国风龙袍两边刺绣九分裤','x-6',5,'春季',17,'L',2008,'spx6.png',200,'2017-5-29');
insert into Spimgae values(36,'spxs11.png');
insert into Spimgae values(36,'spxs12.png');
insert into Sp values('2017新款韩版刺绣男士休闲裤',3,142,99,'男士休闲裤百搭修身小脚裤','x-7',5,'夏季',17,'L',209,'spx7.png',200,'2017-5-29');
insert into Spimgae values(37,'spxs13.png');
insert into Spimgae values(37,'spxs14.png');
insert into Sp values('2017春季新款男装休闲长裤',3,85,59,'修身青年百搭男装休闲长裤','x-8',5,'夏季',17,'L',2008,'spx8.png',200,'2017-5-29');
insert into Spimgae values(38,'spxs15.png');
insert into Spimgae values(38,'spxs16.png');

--商品
--商品id	--商品名字 --商品类型id	--商品员价格	--商品现价格	--商品描述	--商品编号	--获得积分		--季节
		--小类型id--尺寸--销量	--展示图片  --库存--

--李振 加
--T血
insert into Sp values('棉麻料夏装短袖T恤',2,85,59,'棉麻料夏装短袖身学生半','x-5-8',5,'夏季',9,'L',208,'lz1.png',220,'2017-7-1');
insert into Spimgae values(39,'lxz1.png');
insert into Spimgae values(39,'lxz2.png');

insert into Sp values('美特斯邦威短袖T恤',2,85,66,'美特斯邦威短袖T恤','x-5-9',3,'夏季',9,'L',208,'lz2.png',210,'2017-7-2');
insert into Spimgae values(40,'lxz3.png');
insert into Spimgae values(40,'lxz4.png');
--潮牌



insert into Sp values('HIPANDA 设计潮牌T恤',4,105,76,'HIPANDA','x-6',3,'夏季',26,'L',208,'lz3.png',210,'2017-7-2');
insert into Spimgae values(41,'lxz5.png');
insert into Spimgae values(41,'lxz6.png')



insert into Sp values('春季牛仔外套男青年韩版学',1,105,76,'HIPANDA','x-6',3,'夏季',1,'L',208,'ss1.png',210,'2017-7-2');
insert into Spimgae values(42,'ss2.png');
insert into Spimgae values(42,'ss3.png')





--用户表
insert into Users values('张三','123','','男','13876627637','山东大学',20,'tx1.png',300);
insert into Users values('李四','345','','男','18267636722','山东省济南市山大路鲁能科技大厦',30,'tx2.png',800);
insert into Users values('吕布','678','','男','82273874783','山东省古营集镇',40,'tx3.png',900);
insert into Users values('李青','111','','男','18374636722','山东省济南市山东大学',30,'tx4.png',700);
insert into Users values('李腾','678','','男','82273874783','上海东方明珠',50,'tx5.png',1000);
select * from Users

--评论表
insert into Pl values('衣服很漂亮，穿起来很有型','2017-6-28','好评',2,1);
insert into Pl values('衣服很合身，物流也跟快','2017-6-28','好评',2,2);
insert into Pl values('衣服到货了，跟预想的一样，物流也跟快','2017-7-2','好评',1,2);
insert into Pl values('跟预想的一样，物流也跟快','2017-7-2','好评',1,1);
insert into Pl values('穿在身上很合身，穿起来很凉快','2017-7-15','好评',3,3);
select * from Pl

--订单表
insert into Dd values(1,'待付款',1,1,GETDATE())
insert into Dd values(1,'待发货',1,1,GETDATE())
insert into Dd values(1,'待收货',1,1,GETDATE())
insert into Dd values(1,'待评价',1,1,GETDATE())
insert into Dd values(1,'已完成',1,1,GETDATE())
--收藏表

