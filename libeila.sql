/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : libeila

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-09-14 17:44:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for zy_cartoon
-- ----------------------------
DROP TABLE IF EXISTS `zy_cartoon`;
CREATE TABLE `zy_cartoon` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cartoon_url` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `cartoon_desc` varchar(255) DEFAULT '' COMMENT '图片描述',
  `cartoon_sort` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zy_cartoon
-- ----------------------------
INSERT INTO `zy_cartoon` VALUES ('1', 'upload/201905/1557138120.jpg', '', '0');
INSERT INTO `zy_cartoon` VALUES ('2', 'upload/201905/1557138159.jpg', '', '1');
INSERT INTO `zy_cartoon` VALUES ('3', 'upload/201905/1557138229.jpg', '', '2');
INSERT INTO `zy_cartoon` VALUES ('4', 'upload/201905/1557138878.jpg', '', '3');

-- ----------------------------
-- Table structure for zy_category
-- ----------------------------
DROP TABLE IF EXISTS `zy_category`;
CREATE TABLE `zy_category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL COMMENT '分类名',
  `category_desc` varchar(255) DEFAULT '' COMMENT '描述',
  `category_img` varchar(255) DEFAULT NULL COMMENT '图片',
  `category_status` int(11) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zy_category
-- ----------------------------
INSERT INTO `zy_category` VALUES ('1', '婚纱', '就像期许一场和世界的柔情对话，我们将对细节的考究和对高品质的坚持，全部融入在每一件婚纱设计中，我们希望，在黎贝拉，您能像公主一样出嫁。', '../upload/thumb_src/500_500/1508482218.jpg', '0');
INSERT INTO `zy_category` VALUES ('2', '礼服', 'LIBELLA担任你的私人新娘形象顾问，为你打造属于个人的专属之美，人生中最重要的时刻呈现品味不凡的完美形象，留存最迷人瞬间，珍藏最动人的时刻，实现你的梦想，打造完美新娘。', 'upload/thumb_src/500_500/1557136535.jpg', '0');
INSERT INTO `zy_category` VALUES ('3', '龙凤褂', '', 'upload/thumb_src/500_500/1558924262.jpg', '0');
INSERT INTO `zy_category` VALUES ('4', '男装定制', '无需刻意表达，每个不经意的举止，都能赋予您绅士的品味与气度。', 'upload/thumb_src/500_500/1557136535.jpg', '0');

-- ----------------------------
-- Table structure for zy_link
-- ----------------------------
DROP TABLE IF EXISTS `zy_link`;
CREATE TABLE `zy_link` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `link_desc` varchar(255) DEFAULT NULL COMMENT '链接描述（显示文本）',
  `link_url` varchar(255) DEFAULT NULL COMMENT '链接',
  `link_status` int(11) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zy_link
-- ----------------------------
INSERT INTO `zy_link` VALUES ('1', '婚庆公司', '#', '1');
INSERT INTO `zy_link` VALUES ('2', '婚庆公司', '#', '0');
INSERT INTO `zy_link` VALUES ('3', '婚纱礼服', '#', '0');
INSERT INTO `zy_link` VALUES ('4', '女装加盟', '#', '0');
INSERT INTO `zy_link` VALUES ('5', '草坪婚礼', '#', '0');
INSERT INTO `zy_link` VALUES ('6', '犀牛云', '#', '0');
INSERT INTO `zy_link` VALUES ('7', '深圳结婚网', '#', '0');
INSERT INTO `zy_link` VALUES ('8', '中式婚礼', '#', '0');
INSERT INTO `zy_link` VALUES ('9', '广州婚博会', '#', '0');

-- ----------------------------
-- Table structure for zy_message
-- ----------------------------
DROP TABLE IF EXISTS `zy_message`;
CREATE TABLE `zy_message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `message_content` varchar(500) DEFAULT NULL COMMENT '留言内容',
  `message_name` varchar(255) DEFAULT NULL COMMENT '留言人',
  `message_phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `message_time` bigint(20) DEFAULT NULL COMMENT '留言时间戳',
  `message_is_read` int(11) DEFAULT '0' COMMENT '是否已读',
  `message_status` int(11) DEFAULT '0' COMMENT '留言状态',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zy_message
-- ----------------------------

-- ----------------------------
-- Table structure for zy_news
-- ----------------------------
DROP TABLE IF EXISTS `zy_news`;
CREATE TABLE `zy_news` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(255) DEFAULT NULL COMMENT '新闻标题',
  `news_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `news_creater_user` int(11) DEFAULT NULL COMMENT '创建人',
  `news_count` int(11) DEFAULT NULL COMMENT '浏览人数',
  `news_content` varchar(2000) DEFAULT NULL COMMENT '新闻内容html代码',
  `news_status` int(11) DEFAULT '0' COMMENT '新闻状态',
  PRIMARY KEY (`nid`),
  KEY `news_creater_user` (`news_creater_user`),
  CONSTRAINT `zy_news_ibfk_1` FOREIGN KEY (`news_creater_user`) REFERENCES `zy_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zy_news
-- ----------------------------
INSERT INTO `zy_news` VALUES ('2', '【0元试纱】高定系列婚纱礼服免费试纱赠送精修试纱照', '2019-09-14 17:17:59', '1', '32', '<div class=\"met-editor lazyload clearfix\">\r\n						<div><p style=\"text-align: center;\"><img class=\"imgloading\" height=\"200\" data-original=\"http://www.libeila.cc/upload/201909/1567317698596433.jpg\" data-width=\"1200\" width=\"700\" data-height=\"1800\" height=\"1050\" title=\"1567317698596433.jpg\" alt=\"1567317698596433.jpg\" border=\"0\" vspace=\"0\" style=\"width: 700px; height: 1050px;\"/></p><p>无论是对于新郎新娘来说，还是对于双方家长来说，婚礼筹备都是一件费心、费力、费时间的事情。且不说男女双方家乡繁琐的婚嫁习俗，就是按现代简化的婚礼来说，前期要做的事情委实不少。除了布置新家之外，婚礼场地、新娘发型、戒指、婚礼点心以及请柬等等都是要准备的，具体有哪些呢？还是和“婚纱礼服出租”“深圳婚纱租赁”【黎贝拉】一起去看看吧！　　　</p><p>一、婚礼场地　　无论是现代中式婚礼还是西式婚礼仪式，首要的事情都挑选适合的婚礼场地。首先拟定婚礼预算，确定婚礼的主题或形式，然后根据婚礼风格挑选婚礼场地，并与负责人联系。这也关系到后续的一些事项的准备，要很谨慎哦！　　　</p><p style=\"text-align: center;\"><img class=\"imgloading\" height=\"200\" data-original=\"http://www.libeila.cc/upload/201909/1567317742740252.jpg\" data-width=\"7559\" width=\"700\" data-height=\"2362\" height=\"219\" title=\"1567317742740252.jpg\" alt=\"1567317742740252.jpg\" border=\"0\" vspace=\"0\" style=\"width: 700px; height: 219px;\"/>　</p><p>二、婚纱礼服　　作为新人的重要“门面”，婚纱与礼服自然是婚礼中需要重视的部分之一。不管是租赁，还是定做，新郎、新娘们都要提前准备好结婚当天的礼服婚纱，这样才能在婚礼当天美美的哦！　　　　</p><p>三、戒指珠宝　　作为见证新人结合的神圣之物，婚戒自然是婚礼中重要的物件之一。选择好婚戒，将你们的“故事”加进去，一点一点，见证者你们的酸甜苦辣咸，直到生命的尽头。　　　　</p><p>四、婚礼造型　　对于新人，尤其是新娘来说，婚礼当天，打扮得美美的，是非常重要的。在婚礼之前，护肤、美体、美甲等部分可以提前进行，妆容、发型等部分要提前挑选好哦！　　　　</p><p>五、花艺　　花艺可以说是婚礼场地布置中占有比例最大的一块，其次就是婚礼灯光的应用。这对婚礼摄影、婚礼现场氛围都有很大的影响。如果你选择田园风的婚礼，那花艺也会往这个方向靠拢。　　　　</p><p>六、摄影摄像　　摄影与摄像把婚礼中最重要与最幸福的瞬间用影像捕捉下来，成为一生珍藏的回忆。要请专业的摄影团队，不仅立足于整体的拍摄，也能把你幸福的小细节、小瞬间记录下来哦！　　　　</p><p>七、蛋糕甜点　　婚礼蛋糕不止是满足味觉的需要，更重要的是婚礼蛋糕有着浓厚的文化涵义，象征新人婚后的甜蜜与幸福生活。当然，这些也最好都与婚礼主题相符，也可以展示你们的故事哦！</p><p><br/></p><div id=\"metinfo_additional\"></div></div>\r\n						<div class=\"center-block met_tools_code\"></div>\r\n					</div>', '0');
INSERT INTO `zy_news` VALUES ('3', '黎贝拉高级婚纱礼服定制，深圳婚纱礼服', '2019-09-14 17:18:39', '1', '122', '<div class=\"met-editor lazyload clearfix\">\r\n						<div><p style=\"text-align: center;\"><img class=\"imgloading\" height=\"200\" data-original=\"http://www.libeila.cc/upload/201909/1567317698596433.jpg\" data-width=\"1200\" width=\"700\" data-height=\"1800\" height=\"1050\" title=\"1567317698596433.jpg\" alt=\"1567317698596433.jpg\" border=\"0\" vspace=\"0\" style=\"width: 700px; height: 1050px;\"/></p><p>无论是对于新郎新娘来说，还是对于双方家长来说，婚礼筹备都是一件费心、费力、费时间的事情。且不说男女双方家乡繁琐的婚嫁习俗，就是按现代简化的婚礼来说，前期要做的事情委实不少。除了布置新家之外，婚礼场地、新娘发型、戒指、婚礼点心以及请柬等等都是要准备的，具体有哪些呢？还是和“婚纱礼服出租”“深圳婚纱租赁”【黎贝拉】一起去看看吧！　　　</p><p>一、婚礼场地　　无论是现代中式婚礼还是西式婚礼仪式，首要的事情都挑选适合的婚礼场地。首先拟定婚礼预算，确定婚礼的主题或形式，然后根据婚礼风格挑选婚礼场地，并与负责人联系。这也关系到后续的一些事项的准备，要很谨慎哦！　　　</p><p style=\"text-align: center;\"><img class=\"imgloading\" height=\"200\" data-original=\"http://www.libeila.cc/upload/201909/1567317742740252.jpg\" data-width=\"7559\" width=\"700\" data-height=\"2362\" height=\"219\" title=\"1567317742740252.jpg\" alt=\"1567317742740252.jpg\" border=\"0\" vspace=\"0\" style=\"width: 700px; height: 219px;\"/>　</p><p>二、婚纱礼服　　作为新人的重要“门面”，婚纱与礼服自然是婚礼中需要重视的部分之一。不管是租赁，还是定做，新郎、新娘们都要提前准备好结婚当天的礼服婚纱，这样才能在婚礼当天美美的哦！　　　　</p><p>三、戒指珠宝　　作为见证新人结合的神圣之物，婚戒自然是婚礼中重要的物件之一。选择好婚戒，将你们的“故事”加进去，一点一点，见证者你们的酸甜苦辣咸，直到生命的尽头。　　　　</p><p>四、婚礼造型　　对于新人，尤其是新娘来说，婚礼当天，打扮得美美的，是非常重要的。在婚礼之前，护肤、美体、美甲等部分可以提前进行，妆容、发型等部分要提前挑选好哦！　　　　</p><p>五、花艺　　花艺可以说是婚礼场地布置中占有比例最大的一块，其次就是婚礼灯光的应用。这对婚礼摄影、婚礼现场氛围都有很大的影响。如果你选择田园风的婚礼，那花艺也会往这个方向靠拢。　　　　</p><p>六、摄影摄像　　摄影与摄像把婚礼中最重要与最幸福的瞬间用影像捕捉下来，成为一生珍藏的回忆。要请专业的摄影团队，不仅立足于整体的拍摄，也能把你幸福的小细节、小瞬间记录下来哦！　　　　</p><p>七、蛋糕甜点　　婚礼蛋糕不止是满足味觉的需要，更重要的是婚礼蛋糕有着浓厚的文化涵义，象征新人婚后的甜蜜与幸福生活。当然，这些也最好都与婚礼主题相符，也可以展示你们的故事哦！</p><p><br/></p><div id=\"metinfo_additional\"></div></div>\r\n						<div class=\"center-block met_tools_code\"></div>\r\n					</div>', '0');
INSERT INTO `zy_news` VALUES ('4', '新娘妆高级定制造型设计注意要点', '2019-09-14 17:18:58', '1', '18', '<div class=\"met-editor lazyload clearfix\">\r\n						<div><p style=\"text-align: center;\"><img class=\"imgloading\" height=\"200\" data-original=\"http://www.libeila.cc/upload/201909/1567317698596433.jpg\" data-width=\"1200\" width=\"700\" data-height=\"1800\" height=\"1050\" title=\"1567317698596433.jpg\" alt=\"1567317698596433.jpg\" border=\"0\" vspace=\"0\" style=\"width: 700px; height: 1050px;\"/></p><p>无论是对于新郎新娘来说，还是对于双方家长来说，婚礼筹备都是一件费心、费力、费时间的事情。且不说男女双方家乡繁琐的婚嫁习俗，就是按现代简化的婚礼来说，前期要做的事情委实不少。除了布置新家之外，婚礼场地、新娘发型、戒指、婚礼点心以及请柬等等都是要准备的，具体有哪些呢？还是和“婚纱礼服出租”“深圳婚纱租赁”【黎贝拉】一起去看看吧！　　　</p><p>一、婚礼场地　　无论是现代中式婚礼还是西式婚礼仪式，首要的事情都挑选适合的婚礼场地。首先拟定婚礼预算，确定婚礼的主题或形式，然后根据婚礼风格挑选婚礼场地，并与负责人联系。这也关系到后续的一些事项的准备，要很谨慎哦！　　　</p><p style=\"text-align: center;\"><img class=\"imgloading\" height=\"200\" data-original=\"http://www.libeila.cc/upload/201909/1567317742740252.jpg\" data-width=\"7559\" width=\"700\" data-height=\"2362\" height=\"219\" title=\"1567317742740252.jpg\" alt=\"1567317742740252.jpg\" border=\"0\" vspace=\"0\" style=\"width: 700px; height: 219px;\"/>　</p><p>二、婚纱礼服　　作为新人的重要“门面”，婚纱与礼服自然是婚礼中需要重视的部分之一。不管是租赁，还是定做，新郎、新娘们都要提前准备好结婚当天的礼服婚纱，这样才能在婚礼当天美美的哦！　　　　</p><p>三、戒指珠宝　　作为见证新人结合的神圣之物，婚戒自然是婚礼中重要的物件之一。选择好婚戒，将你们的“故事”加进去，一点一点，见证者你们的酸甜苦辣咸，直到生命的尽头。　　　　</p><p>四、婚礼造型　　对于新人，尤其是新娘来说，婚礼当天，打扮得美美的，是非常重要的。在婚礼之前，护肤、美体、美甲等部分可以提前进行，妆容、发型等部分要提前挑选好哦！　　　　</p><p>五、花艺　　花艺可以说是婚礼场地布置中占有比例最大的一块，其次就是婚礼灯光的应用。这对婚礼摄影、婚礼现场氛围都有很大的影响。如果你选择田园风的婚礼，那花艺也会往这个方向靠拢。　　　　</p><p>六、摄影摄像　　摄影与摄像把婚礼中最重要与最幸福的瞬间用影像捕捉下来，成为一生珍藏的回忆。要请专业的摄影团队，不仅立足于整体的拍摄，也能把你幸福的小细节、小瞬间记录下来哦！　　　　</p><p>七、蛋糕甜点　　婚礼蛋糕不止是满足味觉的需要，更重要的是婚礼蛋糕有着浓厚的文化涵义，象征新人婚后的甜蜜与幸福生活。当然，这些也最好都与婚礼主题相符，也可以展示你们的故事哦！</p><p><br/></p><div id=\"metinfo_additional\"></div></div>\r\n						<div class=\"center-block met_tools_code\"></div>\r\n					</div>', '0');

-- ----------------------------
-- Table structure for zy_page
-- ----------------------------
DROP TABLE IF EXISTS `zy_page`;
CREATE TABLE `zy_page` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) DEFAULT NULL COMMENT '页面名称',
  `page_content` varchar(5000) DEFAULT NULL COMMENT '页面html代码',
  `page_img` varchar(255) DEFAULT NULL COMMENT '页面主图',
  `page_desc` varchar(2000) DEFAULT NULL COMMENT '页面文字描述',
  `page_status` int(11) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zy_page
-- ----------------------------
INSERT INTO `zy_page` VALUES ('1', '关于我们', '<div class=\"met-show-top\">\r\n      <p><span>深圳市黎贝拉服饰有限公司，</span>成立于2010年，我们既是一家国际品牌的集合店，又拥台湾独立设计师原创设计。</p>\r\n      <p>拥有世界一线品牌婚纱，<span> Pronovias、Atelier Pronovias、Viktor & Rolf、Armani、Lazaro、Ysa Makino、Helena Kolan、Crystal Design、Tarik Ediz、Saiid Kobeisy、Oksana Mukha 、Dany Tabet、Chic Nostalgia、Luisa Sposa、Casablanca bridal</span>等国际奢侈品牌。</p>\r\n      <p><span> 台湾独立设计师Anny作为婚纱设计师二代，</span>对时尚潮流有与生俱来的敏锐触觉和独到眼光，设计以清新唯美、浪漫的风格为主，Anny 设计使用高品质的面料，优质的制作工艺为基础。2011年3月正式登陆英国高端市场最前线，2014年4月进军美国，成功晋升为美国高端婚纱之一。</p>\r\n      <span>  LIBELLA     担任你的私人新娘形象顾问，为你打造属于个人的专属之美，人生中最重要的时刻呈现品味不凡的完美形象，留存最迷人瞬间，珍藏最动人的时刻，实现你的梦想，打造完美新娘。</span>\r\n      <span>LIBELLA、一婚纱、一辈子</span>\r\n    </div>\r\n    <div class=\"met-show-img\">\r\n      <img src=\"../upload/201710/1507799972106982.jpg\" alt=\"\">\r\n    </div>\r\n    <div class=\"met-show-bottom\">\r\n      <p>答应我</p>\r\n      <p>Promise me</p>\r\n      <p>在婚纱这件事上，不要委屈自己好吗！</p>\r\n      <p>In the wedding dress on this thing, do not wronged yourself!</p>\r\n      <p>因为，你们和别人不一样！</p>\r\n      <p>Because, you and others are not the same!</p>\r\n      <p>我们也和别人不一样！</p>\r\n      <p>We are not the same as others!</p>\r\n    </div>', '../upload/201905/1557139184.jpg', '<div class=\"px-5\">\r\n			<p> <span>深圳市黎贝拉服饰有限公司，</span>\r\n					成立于2010年，我们既是一家国际品牌的集合店，又拥台湾独立设计师原创设计。\r\n			</p>\r\n			<p>\r\n				<span>&nbsp;&nbsp;&nbsp;拥有世界一线品牌婚纱，\r\n					<strong>Pronovias、Atelier Pronovias、Viktor & Rolf、Armani、Lazaro、Ysa Makino、Helena Kolan、Crystal Design、Tarik Ediz、Saiid Kobeisy、Oksana Mukha、Dany Tabet、Chic Nostalgia、Luisa Sposa、Casablanca bridal\r\n					</strong>等国际奢侈品牌。\r\n				</span>\r\n			</p>\r\n			<p>&nbsp;&nbsp;&nbsp;台湾独立设计师Anny\r\n				<span>作为婚纱设计师二代，对时尚潮流有与生俱来的敏锐触觉和独到眼光，设计以清新唯美、浪漫的风格为主，Anny 设计使用高品质的面料，优质的制作工艺为基础。2011年3月正式登陆英国高端市场最前线，2014年4月进军美国，成功晋升为美国高端婚纱之一。</span>\r\n			</p>\r\n			<p><span>&nbsp;&nbsp;&nbsp;LIBELLA&nbsp;&nbsp;&nbsp;担任你的私人新娘形象顾问，为你打造属于个人的专属之美，人生中最重要的时刻呈现品味不凡的完美形象，留存最迷人瞬间，珍藏最动人的时刻，实现你的梦想，打造完美新娘。</span></p>\r\n			</div>', '0');

-- ----------------------------
-- Table structure for zy_parameter
-- ----------------------------
DROP TABLE IF EXISTS `zy_parameter`;
CREATE TABLE `zy_parameter` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `parameter_desc` varchar(255) DEFAULT NULL COMMENT '参数描述',
  `parameter_content` varchar(500) DEFAULT NULL COMMENT '参数内容',
  `parameter_status` int(11) NOT NULL DEFAULT '0' COMMENT '参数状态',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zy_parameter
-- ----------------------------
INSERT INTO `zy_parameter` VALUES ('1', '公司名称', '深圳市黎贝拉服饰有限公司', '0');
INSERT INTO `zy_parameter` VALUES ('2', '手机', '17688780911', '0');
INSERT INTO `zy_parameter` VALUES ('3', '邮箱', 'hbn_hr1@126.com', '0');
INSERT INTO `zy_parameter` VALUES ('4', '电话', '0755-83205639', '0');
INSERT INTO `zy_parameter` VALUES ('5', '邮编', '518000', '0');
INSERT INTO `zy_parameter` VALUES ('6', '地址', '深圳南山华侨城方大城2#楼805-806（龙珠四路与北环大道交汇处）', '0');

-- ----------------------------
-- Table structure for zy_product
-- ----------------------------
DROP TABLE IF EXISTS `zy_product`;
CREATE TABLE `zy_product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `product_show_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `category_id` int(11) DEFAULT NULL,
  `product_brand` varchar(255) DEFAULT '' COMMENT '品牌',
  `product_place` varchar(255) DEFAULT '' COMMENT '产地',
  `product_style` varchar(255) DEFAULT '' COMMENT '风格',
  `product_material` varchar(255) DEFAULT '' COMMENT '材质',
  `product_color` varchar(255) DEFAULT '' COMMENT '颜色',
  `product_customized` varchar(255) DEFAULT '' COMMENT '定制/租赁',
  `product_content_img` varchar(1000) DEFAULT NULL COMMENT '详情图',
  `product_content_text` varchar(2000) DEFAULT '' COMMENT '详情文字描述',
  `product_status` int(11) DEFAULT '0',
  `product_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  PRIMARY KEY (`pid`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `zy_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `zy_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zy_product
-- ----------------------------
INSERT INTO `zy_product` VALUES ('1', '046', 'http://www.libeila.cc/upload/201712/1513923926498165.jpg,http://www.libeila.cc/upload/201712/1513923927653361.jpg', '1', 'vera wang', '美国', '时尚前卫', '缎', '白色', '定制', 'http://www.libeila.cc/upload/201712/1513923926498165.jpg,http://www.libeila.cc/upload/201712/1513923927653361.jpg', '', '0', '2019-09-14 17:34:14');
INSERT INTO `zy_product` VALUES ('2', 'Pronovias-SUNDROP', 'http://www.libeila.cc/upload/201908/1565953076488963.jpg,http://www.libeila.cc/upload/201908/1565953076133128.jpg', '1', 'Pronovias', '西班牙', '修身', '', '', '定制', 'http://www.libeila.cc/upload/201908/1565953076488963.jpg,http://www.libeila.cc/upload/201908/1565953076133128.jpg', '欧美婚纱皇家品牌pronovias是推崇婚纱极简主义设计风格的楷模，旗下拥有valentino等世界顶级设计师，是西班牙巴塞罗那的pronovias目前为全球第1大婚纱礼服品牌，市占率5%，在伦敦、巴黎、纽约、伊斯坦堡、开罗及东京等都有据点，在全球60国家共有158个店面及3,800个销售店。西班牙市场占40%，平均售价在600欧元至1万2,000欧元之间.\r\n\r\n　　1964 年 Pronovias 企业推出了第一系列的现成婚纱精选，结合创新的现成婚纱概念，为奠定其 21 世纪品牌影响力迈出了重要的一步 。1968 年后的几年，Pronovias 开设了西班牙境内首家婚纱专卖店，让新娘能够在此找到她的理想婚纱和所需的一切配饰。在接下来的十年里，Pronovias 在西班牙增开了 80 家店，并开始在欧洲拓展，作为国际化的起步。到了九零年代，企业进入了美国和亚洲市场。目前在全球 75 个国家共设有 3800 销售点。\r\n\r\n　　多年的丰富经验充分反映在企业的所有决策，这项传统源自于 1922 年在巴塞罗那创立的 \"El Suizo” 新娘蕾丝、丝绸和花边店铺。我们今日的技术和知识来自于将近 100 年来为满足新娘心愿和需求所累积的经验，见证了无数的潮流变化，经得起时间的考验，成为象征这个家族和企业的精神。', '0', '2019-09-14 17:35:56');
INSERT INTO `zy_product` VALUES ('4', '马来褂', 'http://www.libeila.cc/upload/thumb_src/400_500/1547435406.jpg', '3', '马来褂', '', '中式礼服', '', '粉色', '定制/租赁', 'http://www.libeila.cc/upload/201901/1547435001211230.jpg,http://www.libeila.cc/upload/201901/1547435001757099.jpg,http://www.libeila.cc/upload/201901/1547435001528750.jpg,http://www.libeila.cc/upload/201901/1547435001977330.jpg,http://www.libeila.cc/upload/201901/1547435001390365.jpg,http://www.libeila.cc/upload/201901/1547435001942203.jpg', '', '0', '2019-09-14 17:41:08');
INSERT INTO `zy_product` VALUES ('5', 'Pronovias-SPACEGIRL', 'http://www.libeila.cc/upload/thumb_src/400_500/1565953283.jpg,http://www.libeila.cc/upload/thumb_src/400_500/1565952962.jpg,http://www.libeila.cc/upload/thumb_src/400_500/1565953529.jpg', '1', 'Pronovias', '西班牙', '修身，公主裙', '', '', '定制', 'http://www.libeila.cc/upload/201908/1565952781652333.jpg,http://www.libeila.cc/upload/201908/1565952781266373.jpg,http://www.libeila.cc/upload/201908/1565952781653786.jpg', '欧美婚纱皇家品牌pronovias是推崇婚纱极简主义设计风格的楷模，旗下拥有valentino等世界顶级设计师，是西班牙巴塞罗那的pronovias目前为全球第1大婚纱礼服品牌，市占率5%，在伦敦、巴黎、纽约、伊斯坦堡、开罗及东京等都有据点，在全球60国家共有158个店面及3,800个销售店。西班牙市场占40%，平均售价在600欧元至1万2,000欧元之间.\r\n\r\n　　1964 年 Pronovias 企业推出了第一系列的现成婚纱精选，结合创新的现成婚纱概念，为奠定其 21 世纪品牌影响力迈出了重要的一步 。1968 年后的几年，Pronovias 开设了西班牙境内首家婚纱专卖店，让新娘能够在此找到她的理想婚纱和所需的一切配饰。在接下来的十年里，Pronovias 在西班牙增开了 80 家店，并开始在欧洲拓展，作为国际化的起步。到了九零年代，企业进入了美国和亚洲市场。目前在全球 75 个国家共设有 3800 销售点。\r\n\r\n　　多年的丰富经验充分反映在企业的所有决策，这项传统源自于 1922 年在巴塞罗那创立的 \"El Suizo” 新娘蕾丝、丝绸和花边店铺。我们今日的技术和知识来自于将近 100 年来为满足新娘心愿和需求所累积的经验，见证了无数的潮流变化，经得起时间的考验，成为象征这个家族和企业的精神。', '0', '2019-09-14 17:43:53');

-- ----------------------------
-- Table structure for zy_user
-- ----------------------------
DROP TABLE IF EXISTS `zy_user`;
CREATE TABLE `zy_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `user_password` varchar(255) DEFAULT NULL COMMENT '密码',
  `user_desc` varchar(255) DEFAULT NULL COMMENT '用户描述',
  `user_level` int(11) DEFAULT '0' COMMENT '级别',
  `user_status` int(11) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zy_user
-- ----------------------------
INSERT INTO `zy_user` VALUES ('1', 'szlbl', '123456', 'admin', '0', '0');
