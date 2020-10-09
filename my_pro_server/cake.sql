#设置客户端连接服务器端的编码格式为utf8
SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS cake;
#创建数据库，设置编码为utf8
CREATE DATABASE cake CHARSET=UTF8;
#进入数据库
USE cake;

CREATE TABLE carousel (
  cid int(11) NOT NULL PRIMARY KEY,
  src varchar(128) DEFAULT NULL,
  title varchar(64) DEFAULT NULL,
  href varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO carousel(cid, src, title, href) VALUES
('1', 'img/index/carousel1.jpg', '轮播图片1', 'details/7'),
('2', 'img/index/carousel2.jpg', '轮播图片2', 'details/7');



CREATE TABLE list (
  lid int(11) NOT NULL PRIMARY KEY,
  src varchar(128) DEFAULT NULL,
  title varchar(64) DEFAULT NULL,
  details varchar(128) DEFAULT NULL,
  price decimal(10,2) DEFAULT NULL,
  time varchar(64) DEFAULT NULL,
  href varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--

INSERT INTO list (lid, src, title, details, price, time, href) VALUES
('1', 'img/list/list1.jpg', '<p class="p1">Bill of lading 1磅蛋糕提货卡套餐</p>', '<p class="p2">1磅蛋糕提货卡可购买价值168元任意蛋糕。</p> <p class="p2">如果购买大于168元蛋糕，需补差价</p>', '840', '查看配送时间',1),
('2', 'img/list/list2.jpg', '<p class="p1">Recharge Activity 充值套餐</p>', '<p class="p2">充值  500，赠送  50</p> <p class="p2">充值  1000，赠送  120</p> <p class="p2">充值  2000，赠送  300</p> <p class="p3">充值活动,配送日期仅限选择当天</p>', '500', '查看配送时间',2),
('3', 'img/list/list3.jpg', '<p class="p1">中秋节 月饼礼盒套餐</p>', '<p class="p2">月饼盒尺寸：38cm x 27cm<p> <p class="p2">团购业务请联系： 173-9155-1212  、400 - 968-3133</p>  <p class="p2">打开一个夜晚，让月亮升起</p>  <p class="p2">有满月，山川</p> <p class="p2">来自法式的经典</p> <p class="p2">饱含心意，耐得住细细品味</p>', '168', '查看配送时间',3),
('4', 'img/list/list4.jpg', '<p class="p1">Sweetheart 心上人</p>', '<p class="p2">Sweetheart 心上人 未来我的生活只 有十二个字</p> <p class="p2">晚前吻你，半夜抱你，醒来有你</p> <p class="p2">我的心上人</p> <p class="p2">You are my only</p>', '289', '查看配送时间',4),
('5', 'img/list/list5.jpg', '<p class="p1">Sweetheart -pink 心上人-粉</p>', '<p class="p3">原价：299 ，七夕活动价：268 2020年8月26日恢复原价</p> <p class="p2">未来我的生活只有十二个字</p> <p class="p2">晚前吻你，半夜抱你，醒来有你</p> <p class="p2">我的心上人</p> <p class="p2">You are my only</p2>', '299', '查看配送时间',5),
('6', 'img/list/list6.jpg', '<p class="p1">Simba forest kingdom 辛巴的森林王国</p>', '<p class="p2">蛋糕组成</p> <p class="p2">河流：波士蓝果冻</p> <p class="p2">陆地：巧克力乳脂力奶油</p> <p class="p2">草坪：抹茶乳脂奶油</p> <p class="p3">注:</p> <p class="p3">动物，树木装饰为玩具摆件，不可食用</p> <p class="p3">食用前请先取掉。</p> <p class="p3">本蛋糕需提前一天订购</p>', '1488', '查看配送时间',6),
('7', 'img/list/list7.jpg', '<p class="p1">Caffe Latte 那提（咖啡口味）</p>', '<p class="p2">/低温乳脂奶油冷萃泰国咖啡/</p> <p class="p2">/咖啡，浓香，芝士，绵绸/</p> <p class="p2">Cold cream, cream, cold extract, Thailand coffee</p> <p class="p2">Coffee， aroma, cheese， mellow</p>', '188', '查看配送时间',7),
('8', 'img/list/list8.jpg', '<p class="p1">Tiramisu 提拉米苏</p>', '<p class="p2">带我走。是Tiramisu意大利文的意思。</p><p class="p2">分享这幸福的味道。他，令人芳心暗许。</p>', '188', '查看配送时间',8),
('9', 'img/list/list9.jpg', '<p class="p1">Strawberry cheese 草莓芝士</p>', '<p class="p2">用低温，封存草莓的口感</p><p class="p2">这个季节，让草莓再一次绽放</p>', '178', '查看配送时间',9),
('10', 'img/list/list10.jpg', '<p class="p1">Rolling Panda 熊猫滚滚</p>', '<p class="p2">微风，带来竹林的气息</p> <p class="p2">这个夏天，与滚滚(熊猫)面对面<p class="p2">', '178', '查看配送时间',10);


CREATE TABLE recommend (
  rid int(11) NOT NULL PRIMARY KEY,
  src varchar(128) DEFAULT NULL,
  title varchar(64) DEFAULT NULL,
  details varchar(128) DEFAULT NULL,
  href varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO recommend (rid, src, title, details,href) VALUES
(1, 'img/index/latte.jpg', 'Caffe Latte', '那提（咖啡口味）',7),
(2, 'img/index/tiramisu.jpg', 'Tiramisu', '提拉米苏',8),
(3, 'img/index/cheese.jpg', 'Strawberry cheese', '草莓芝士',9),
(4, 'img/index/panda.jpg', 'Rolling Panda', '熊猫滚滚',10);


#表的结构 user
CREATE TABLE user (
  uid int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  uname varchar(32) DEFAULT NULL,
  upwd varchar(32) DEFAULT NULL,
  email varchar(64) DEFAULT NULL,
  phone varchar(16) DEFAULT NULL,
  user_name varchar(16) DEFAULT NULL,
  gender tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#转存表中的数据 user

INSERT INTO user (uid, uname, upwd, email, phone, user_name, gender) VALUES
(NULL, 'xiaoming', '11111111', '1111@163.com', '18355556666', '小明', 1);


#详情页图片列表details_img
CREATE TABLE details_img (
  did int(11) NOT NULL PRIMARY KEY,
  list_id int(11) DEFAULT NULL,
  src varchar(128) DEFAULT NULL
);
 INSERT INTO details_img VALUES("1","1","img/details/details1-1.jpg");
 INSERT INTO details_img VALUES("2","2","img/details/details2-1.jpg");
 INSERT INTO details_img VALUES("3","3","img/details/details3-1.jpg");
 INSERT INTO details_img VALUES("4","3","img/details/details3-2.jpg");
 INSERT INTO details_img VALUES("5","3","img/details/details3-3.jpg");
 INSERT INTO details_img VALUES("6","3","img/details/details3-4.jpg");
 INSERT INTO details_img VALUES("7","4","img/details/details4-1.jpg");
 INSERT INTO details_img VALUES("8","4","img/details/details4-2.jpg");
 INSERT INTO details_img VALUES("9","4","img/details/details4-3.jpg");
 INSERT INTO details_img VALUES("10","4","img/details/details4-4.jpg");
 INSERT INTO details_img VALUES("11","5","img/details/details5-1.jpg");
 INSERT INTO details_img VALUES("12","5","img/details/details5-2.jpg");
 INSERT INTO details_img VALUES("13","5","img/details/details5-3.jpg");
 INSERT INTO details_img VALUES("14","5","img/details/details5-4.jpg");
 INSERT INTO details_img VALUES("15","6","img/details/details6-1.jpg");
 INSERT INTO details_img VALUES("16","6","img/details/details6-2.jpg");
 INSERT INTO details_img VALUES("17","6","img/details/details6-3.jpg");
 INSERT INTO details_img VALUES("18","6","img/details/details6-4.jpg");
 INSERT INTO details_img VALUES("19","7","img/details/details7-1.jpg");
 INSERT INTO details_img VALUES("20","7","img/details/details7-2.jpg");
 INSERT INTO details_img VALUES("21","7","img/details/details7-3.jpg");
 INSERT INTO details_img VALUES("22","8","img/details/details8-1.jpg");
 INSERT INTO details_img VALUES("23","8","img/details/details8-2.jpg");
 INSERT INTO details_img VALUES("24","8","img/details/details8-3.jpg");
 INSERT INTO details_img VALUES("25","9","img/details/details9-1.jpg");
 INSERT INTO details_img VALUES("26","9","img/details/details9-2.jpg");
 INSERT INTO details_img VALUES("27","9","img/details/details9-3.jpg");
 INSERT INTO details_img VALUES("28","10","img/details/details10-1.jpg");
 INSERT INTO details_img VALUES("29","10","img/details/details10-2.jpg");
 INSERT INTO details_img VALUES("30","10","img/details/details10-3.jpg");
 INSERT INTO details_img VALUES("31","10","img/details/details10-4.jpg");


#详情页商品信息details_info
CREATE TABLE details_info (
  info_id int(11) NOT NULL PRIMARY KEY,
  lid int(11) NOT NULL,
  info_title varchar(64),
  info_price decimal(10,2),
  info_pound varchar(64),
  info_size varchar(64),
  info_share varchar(64),
  info_cutlery varchar(64),
  info_order varchar(64),
  info_compose varchar(128),
  info_remark varchar(128)
);
INSERT INTO details_info VALUES("1","1","Bill of lading 1磅蛋糕提货卡套餐","840",'<p class="p_1">1磅蛋糕提货卡</p><p class="p_2">3磅蛋糕提货卡</p><p class="p_3">5磅蛋糕提货卡</p><p class="p_4">10磅蛋糕提货卡</p>',"15X15cm","适合2-3人分享","配送五套餐具","提前五小时预订","","1磅蛋糕提货卡可购买价值168元任意蛋糕。如果购买大于168元蛋糕，需补差价。");
INSERT INTO details_info VALUES("2","2","Recharge Activity 充值套餐","500",'<p class="p_1">充值500送50</p> <p class="p_2">充值1000送120</p> <p class="p_3">充值2000送300</p>',NULL,NULL,NULL,NULL,"充值500，赠送50 充值1000，赠送120 充值2000，赠送300","充值活动，配送日期:仅限选择当天。");
INSERT INTO details_info VALUES("3","3","中秋节 月饼礼盒套餐","168",'<p class="p_1">1盒</p> <p class="p_2">3盒/每盒减28元</p> <p class="p_3">5盒/每盒减35元</p> <p class="p_4">10盒/每盒减50元</p>',NULL,NULL,NULL,NULL,"月饼盒尺寸：38.5cm x 28cm","团购业务请联系：173-9155-1212、400-968-3133 打开一个夜晚，让月亮升起 有满月，山川 来自法式的经典 饱含心意，耐得住细细品味");
INSERT INTO details_info VALUES("4","4","Sweetheart 心上人","289 ",'<p class="p_1">1.5磅</p>',"18*18cm","适合1-2人分享","含5套餐具","需提前5小时预定","未来我的生活只有十二个字晚前吻你，半夜抱你，醒来有你","我的心上人 You are my only");
INSERT INTO details_info VALUES("5","5","Sweetheart -pink 心上人-粉","299",'<p class="p_1">1.5磅</p>',"18*18cm","适合1-2人分享","标配5套餐具","提前4小时预订","原价：299 ，七夕活动价：268 2020年8月26日恢复原价","未来我的生活只有十二个字 晚前吻你，半夜抱你，醒来有你");
INSERT INTO details_info VALUES("6","6","Simba's forest kingdom 辛巴的森林王国",'1488','<p class="p_1">14磅</p',"55cm x 45cm","适合45-55人分享","标配55套餐具","提前1天订购","蛋糕组成 河流：波士蓝果冻 陆地：巧克力乳脂力奶油 草坪：抹茶乳脂奶油","注：*  动物，树木装饰为玩具摆件，不可食用 用前请先取掉。");
INSERT INTO details_info VALUES("7","7","Caffe Latte 那提（咖啡口味）","188",'<p class="p_1">1.0磅</p> <p class="p_2">2.0磅<p class="p_3">3.0磅  </p><p class="p_4">5.0磅</p>',"15*15cm","适合3-4人分享","含5套餐具","需提前4小时预定","/低温乳脂奶油冷萃泰国咖啡/ /咖啡，浓香，芝士，绵绸/ ","Cold cream, cream, cold extract, Thailand coffee Coffee， aroma, cheese， mellow");
INSERT INTO details_info VALUES("8","8","Tiramisu 提拉米苏","188",'<p class="p_1">1.0磅</p><p class="p_2">2.0磅</p><p class="p_3">3.0磅</p><p class="p_4">5.0磅</p>',"15*15cm","适合3-4人分享","标配5套餐具","提前5小时预订",NULL,"带我走。是Tiramisu意大利文的意思。分享这幸福的味道。他，令人芳心暗许");
INSERT INTO details_info VALUES("9","9","Strawberry cheese 草莓芝士","178",'<p class="p_1">1.0磅</p><p class="p_2">2.0磅</p><p class="p_3">3.0磅</p><p class="p_4">5.0磅</p>',"15*15cm","适合3-4人分享","标配5套餐具","提前5小时预订",NULL,"用低温，封存草莓的口感 这个季节，让草莓再一次绽放");
INSERT INTO details_info VALUES("10","10","Rolling Panda 熊猫滚滚","178",'<p class="p_1">1.0磅</p><p class="p_2">2.0磅</p><p class="p_3">3.0磅</p><p class="p_4">5.0磅</p>',"直径15.5cm","适合3-5人分享","标配5套餐具","提前5小时预订",NULL,"微风，带来竹林的气息 这个夏天，与滚滚(熊猫)面对面");

