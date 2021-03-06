-- Adminer 4.2.2fx MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `option` text NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `config` (`option`, `value`) VALUES
('withdrawals',	'on'),
('maitenance',	'on'),
('escrow_address',	'msNFtuLvtCC1w86a8ewzzZTAvXYn69YzBt'),
('dos_protection',	'on'),
('commision_percentage',	'4.5'),
('profit_address',	'mq93bSvvMr8c9TrqVJqPRjoRu1zzKf9UYH'),
('market_name',	'XXX');

DROP TABLE IF EXISTS `disputes`;
CREATE TABLE `disputes` (
  `message` text NOT NULL,
  `autor` text NOT NULL,
  `order` int(10) NOT NULL,
  `timestamp` int(25) NOT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `disputes` (`message`, `autor`, `order`, `timestamp`, `id`) VALUES
('das',	'',	34,	0,	1),
('dfsdffs',	'',	1,	0,	2),
('fsdfsd',	'',	2,	0,	3),
('ghhg',	'',	34,	0,	4),
('vxc',	'',	34,	0,	5),
('df',	'',	34,	0,	6),
('fsdfsd',	'',	2,	0,	7),
('df',	'',	47,	0,	8),
('xcv',	'',	47,	0,	9),
('cyx',	'',	47,	1461921348,	10),
('gfdgfd',	'',	47,	1461922849,	11),
('nyní',	'',	47,	1461922857,	12),
('sdcs',	'test6',	47,	1461923150,	13),
('cv',	'test6',	47,	1461923172,	14),
('dsa',	'test6',	47,	1461924652,	15),
('dsa',	'test6',	47,	1462477140,	16),
('ok',	'test6',	47,	1462499424,	17),
('z',	'test6',	47,	1462981832,	18),
('y',	'test6',	48,	1463076427,	19);

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `order_id` int(11) NOT NULL,
  `listing_id` int(4) NOT NULL,
  `type` text NOT NULL,
  `buyer` text NOT NULL,
  `feedback_text` longtext NOT NULL,
  `postage` text NOT NULL,
  `stealth` text NOT NULL,
  `quality` text NOT NULL,
  `time` int(25) NOT NULL,
  `changed` int(25) NOT NULL,
  KEY `listing_id` (`listing_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `feedback` (`order_id`, `listing_id`, `type`, `buyer`, `feedback_text`, `postage`, `stealth`, `quality`, `time`, `changed`) VALUES
(0,	0,	'',	'',	'',	'0',	'0',	'0',	1462720439,	0),
(0,	0,	'',	'',	'',	'',	'',	'',	1462720746,	0),
(30,	627,	'negative',	'',	'Uživatel nezanechal žádný komentá?',	'5/5',	'5/5',	'5/5',	1462721253,	0),
(30,	627,	'negative',	'',	'Uživatel nezanechal žádný komentá?',	'5/5',	'5/5',	'5/5',	1462721254,	0),
(88,	692,	'positive',	'',	'Uživatel nezanechal žádný komentá?',	'5/5',	'5/5',	'5/5',	1462722880,	0),
(89,	692,	'neutral',	'test6',	'1',	'5/5',	'5/5',	'5/5',	1462725263,	0),
(89,	692,	'negative',	'test6',	'Uživatel nezanechal žádný komentá?',	'5/5',	'5/5',	'5/5',	1462726283,	0),
(88,	692,	'positive',	'test6',	'Uživatel nezanechal žádný komentá?',	'5/5',	'5/5',	'5/5',	1462726899,	0),
(93,	692,	'negative',	'test6',	'sa',	'5/5',	'5/5',	'5/5',	1462732936,	0),
(95,	692,	'neutral',	'test6',	'Finalize Early dummy Feedback',	'5/5',	'5/5',	'5/5',	1462733730,	0),
(96,	692,	'neutral',	'test6',	'Suxxito',	'5/5',	'5/5',	'5/5',	1462733730,	0),
(96,	692,	'negative',	'test6',	'WTF',	'5/5',	'5/5',	'5/5',	1462805152,	0),
(103,	692,	'negative',	'test6',	'WTF',	'5/5',	'5/5',	'5/5',	1462806111,	1),
(104,	692,	'positive',	'test6',	'Ja siba placho ?ustvu',	'5/5',	'3/5',	'5/5',	1462806733,	1),
(105,	692,	'neutral',	'test6',	'Na zdarovje!x',	'5/5',	'5/5',	'5/5',	1462806994,	1),
(100,	692,	'neutral',	'test6',	'Finalize Early dummy Feedback',	'1/5',	'2/5',	'1/5',	1462982204,	1),
(118,	692,	'negative',	'test6',	'Finalize Early dummy Feedback',	'5/5',	'5/5',	'5/5',	1462982256,	1),
(119,	692,	'neutral',	'test6',	'Finalize Early dummy Feedback',	'5/5',	'5/5',	'5/5',	1462983500,	0),
(124,	692,	'positive',	'test6',	'ass',	'5/5',	'5/5',	'5/5',	1462992500,	0),
(125,	692,	'positive',	'test6',	'as',	'5/5',	'5/5',	'5/5',	1462992566,	0),
(132,	684,	'positive',	'test6',	'jhbj',	'5/5',	'3/5',	'5/5',	1463132265,	1);

DROP TABLE IF EXISTS `listings`;
CREATE TABLE `listings` (
  `author` char(11) NOT NULL,
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(20) NOT NULL,
  `product_desc` varchar(256) NOT NULL,
  `price` decimal(4,0) NOT NULL,
  `ships_to` varchar(4) NOT NULL,
  `ships_from` varchar(4) NOT NULL,
  `product_type` varchar(4) NOT NULL,
  `product_images` longtext NOT NULL,
  `main_image` int(11) NOT NULL,
  `quantity_sold` int(11) NOT NULL,
  `status` char(10) NOT NULL DEFAULT '',
  `FE` char(10) DEFAULT NULL,
  `MS` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `listings` (`author`, `id`, `product_name`, `product_desc`, `price`, `ships_to`, `ships_from`, `product_type`, `product_images`, `main_image`, `quantity_sold`, `status`, `FE`, `MS`) VALUES
('test1234',	53,	'sdadasdsa',	'dsadsasad',	12,	'0',	'0',	'0',	'a:2:{i:0;s:49:\"/var/www/html/www/userfiles/test1234/64bf2c71.png\";i:1;s:50:\"/var/www/html/www/userfiles/test1234/59851622c.png\";}',	0,	0,	'disabled',	'',	''),
('test1234',	54,	'sdadsa',	'asddsa',	11,	'0',	'0',	'0',	'a:1:{i:0;s:1:\"/\";}',	0,	0,	'disabled',	'',	''),
('test1234',	55,	'csdvdsvvsd',	'cssdsdsd',	1,	'0',	'0',	'0',	'a:1:{i:0;s:33:\"userfiles/test1234/3b552901cc.png\";}',	0,	0,	'disabled',	'',	''),
('test1234',	56,	'Testovaci listing',	'xsyycyxcxy',	1,	'0',	'0',	'0',	'a:1:{i:2;s:33:\"userfiles/test1234/4d5c0b7a67.png\";}',	0,	0,	'disabled',	'',	''),
('jojo32',	69,	'TestListing',	'fagalik',	2,	'0',	'0',	'0',	'a:3:{i:0;s:31:\"userfiles/jojo32/37c78dc0f6.jpg\";i:1;s:31:\"userfiles/jojo32/23fbd96049.jpg\";i:2;s:28:\"userfiles/jojo32/1a80609.png\";}',	0,	0,	'active',	'',	''),
('jojo32',	73,	'TEST',	'funkcnosti',	100,	'0',	'0',	'0',	'a:4:{i:0;s:31:\"userfiles/jojo32/5ce1727bea.png\";i:1;s:31:\"userfiles/jojo32/a70c72e520.png\";i:2;s:31:\"userfiles/jojo32/65bbad79d8.png\";i:3;s:31:\"userfiles/jojo32/c2cdcba13b.png\";}',	1,	0,	'disabled',	'',	''),
('jojo32',	74,	'Testeroke321',	'dads',	1,	'0',	'0',	'0',	'a:3:{i:0;s:31:\"userfiles/jojo32/7c3da22966.png\";i:1;s:31:\"userfiles/jojo32/fa7b0b8879.png\";i:2;s:31:\"userfiles/jojo32/67ed6a5cf5.png\";}',	0,	0,	'disabled',	'',	''),
('jojo32',	75,	'Test listing',	'XXX',	1,	'0',	'0',	'0',	'a:1:{i:0;s:21:\"userfiles/jojo32/.png\";}',	0,	0,	'disabled',	'',	''),
('fagan23',	626,	'LIZATKO',	'ads',	100,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'',	'',	''),
('fagan23',	639,	'dsa',	'sda',	1,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'',	'',	'yes'),
('fagan23',	640,	'dsasa',	'sda',	1,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'',	'yes',	'yes'),
('fagan23',	641,	'dsa',	'sad',	0,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'',	'',	''),
('fagan23',	642,	'dsared',	'sad',	0,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'',	NULL,	NULL),
('fagan23',	643,	'dsared',	'sad',	0,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'',	NULL,	'yes'),
('fagan23',	644,	'Testik',	'asd',	1,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'',	NULL,	'yes'),
('fagan23',	645,	'sdf',	'fsd',	0,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'',	NULL,	'yes'),
('fagan23',	646,	'sad',	'asd',	1,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'disabled',	'yes',	'yes'),
('fagan23',	647,	'dsa',	'sad',	1,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'disabled',	'no',	'no'),
('fagan23',	648,	'sda',	'dsa',	1,	'0',	'0',	'0',	'a:12:{i:0;s:32:\"userfiles/fagan23/333d1f0bde.png\";i:1;s:32:\"userfiles/fagan23/2e633120b9.png\";i:2;s:32:\"userfiles/fagan23/c6c63c4d54.png\";i:3;s:32:\"userfiles/fagan23/e86ecaa71d.png\";i:4;s:32:\"userfiles/fagan23/d9b9b6be81.png\";i:5;s:32:\"userfiles/fagan23/2094bd9a5e.png\";i:6;s:32:\"userfiles/fagan23/2fd321d8c3.png\";i:7;s:32:\"userfiles/fagan23/e5a9b69224.png\";i:8;s:28:\"userfiles/fagan23/7ba531.png\";i:9;s:32:\"userfiles/fagan23/fee9ec806e.png\";i:10;s:31:\"userfiles/fagan23/ee7d85534.png\";i:11;s:32:\"userfiles/fagan23/b5541a4e8b.png\";}',	0,	0,	'disabled',	'yes',	'yes'),
('fagan23',	649,	'dsa',	'dsa',	1,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'disabled',	'yes',	'yes'),
('fagan23',	650,	'finally',	'dsa',	1,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'disabled',	NULL,	'yes'),
('fagan23',	651,	'fbggdbfg',	'fds',	1,	'0',	'0',	'0',	'a:1:{i:0;s:32:\"userfiles/fagan23/1371ddc4ee.png\";}',	0,	0,	'disabled',	'yes',	'yes'),
('fagan23',	684,	'xxycxy',	'xycxy',	1,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'active',	'no',	'no'),
('test6',	691,	'ads',	'ads',	1,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'active',	'no',	'no'),
('fagan23',	692,	'TEST',	'asdasd',	100,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'active',	'no',	'no'),
('test6',	693,	'dsfds',	'sfds',	1,	'0',	'0',	'0',	'a:0:{}',	0,	0,	'disabled',	'no',	'no'),
('test6',	694,	'sadas',	'dasdsa',	11,	'0',	'0',	'0',	'a:1:{i:0;s:30:\"userfiles/test6/bded279a09.png\";}',	0,	0,	'disabled',	'no',	'no'),
('test6',	695,	'tzhjdfh',	'gh',	1,	'0',	'1',	'0',	'a:1:{i:0;s:30:\"userfiles/test6/276bdcdb63.png\";}',	0,	0,	'active',	'no',	'no'),
('test6',	696,	'fsdf',	'sdf',	1,	'0',	'0',	'0',	'a:2:{i:0;s:30:\"userfiles/test6/f02394405d.png\";i:1;s:30:\"userfiles/test6/b6f9d45bb5.png\";}',	3,	0,	'disabled',	'no',	'no');

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL,
  `id2` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `user1` int(11) NOT NULL,
  `user2` int(11) NOT NULL,
  `message` text NOT NULL,
  `timestamp` int(25) NOT NULL,
  `msg_read1` varchar(3) NOT NULL,
  `msg_read2` varchar(3) NOT NULL,
  `sender_deleted` char(3) DEFAULT NULL,
  `receiver_deleted` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `messages` (`id`, `id2`, `title`, `user1`, `user2`, `message`, `timestamp`, `msg_read1`, `msg_read2`, `sender_deleted`, `receiver_deleted`) VALUES
(1,	1,	'fds',	81,	12,	'ds',	1451750820,	'yes',	'yes',	'yes',	'yes'),
(2,	1,	'ds',	81,	12,	'ds',	1451750874,	'yes',	'yes',	'yes',	'yes'),
(3,	1,	'BUG',	81,	12,	'd',	1451750939,	'yes',	'yes',	'yes',	'yes'),
(4,	1,	'fd',	12,	81,	'sdf',	1451751506,	'yes',	'yes',	'yes',	'yes'),
(5,	1,	'dsadsa',	12,	81,	'dsa',	1451751642,	'yes',	'yes',	'yes',	'yes'),
(6,	1,	'sda',	12,	81,	'dsa',	1451751658,	'yes',	'yes',	'yes',	'yes'),
(7,	1,	'fassaf',	12,	81,	'fafas',	1451751728,	'yes',	'yes',	'yes',	'yes'),
(8,	1,	'dsds',	81,	12,	'sdsd',	1451751789,	'yes',	'yes',	'yes',	'yes'),
(9,	1,	'bgfggfb',	12,	81,	'dsa',	1451751878,	'yes',	'yes',	'yes',	'yes'),
(10,	1,	'kaljužny',	81,	12,	'dsa',	1451752074,	'yes',	'yes',	'yes',	'yes'),
(11,	1,	'dsa',	12,	81,	'asd',	1451752099,	'yes',	'yes',	'yes',	'yes'),
(12,	1,	'sa',	12,	81,	'sa',	1451752183,	'yes',	'yes',	'yes',	'yes'),
(13,	1,	'smelo',	81,	71,	'dsds',	1451752317,	'yes',	'no',	'yes',	'no'),
(14,	1,	'testoko',	12,	81,	'ds',	1451753001,	'yes',	'yes',	'yes',	'yes'),
(15,	1,	'bamboocha',	12,	81,	'dsadsa',	1451753935,	'yes',	'yes',	'yes',	'yes'),
(16,	1,	'dsadsa',	12,	81,	'dsadsa',	1451754168,	'yes',	'yes',	'yes',	'yes'),
(17,	1,	'sdfds',	12,	81,	'dsfdsf',	1451754283,	'yes',	'yes',	'yes',	'yes'),
(18,	1,	'sda',	81,	12,	'dsa',	1451754381,	'yes',	'yes',	'yes',	'yes'),
(19,	1,	'dsa',	12,	81,	'sda',	1451754551,	'yes',	'yes',	'yes',	'yes'),
(20,	1,	'dsadsa',	81,	12,	'dsadas',	1451754583,	'yes',	'yes',	'yes',	'yes'),
(21,	1,	'sdf',	81,	12,	'fs',	1451754689,	'yes',	'yes',	'yes',	'yes'),
(22,	1,	'dsds',	81,	12,	'dsds',	1451754999,	'yes',	'yes',	'yes',	'yes'),
(23,	1,	'ssddsds',	81,	12,	'dsds',	1451755110,	'yes',	'yes',	'yes',	'yes'),
(24,	1,	'dssda',	12,	81,	'sdasda',	1451755230,	'yes',	'yes',	'yes',	'no'),
(25,	1,	'lala',	12,	81,	'as',	1451841220,	'yes',	'yes',	'no',	'no'),
(26,	1,	'as',	81,	12,	'sa',	1451842316,	'yes',	'yes',	'no',	'yes'),
(27,	1,	'dsaddsa',	12,	81,	'dsadsa',	1451844369,	'yes',	'yes',	'no',	'no'),
(28,	1,	'Re: as',	12,	81,	'sa',	1451854382,	'yes',	'yes',	'no',	'no'),
(29,	1,	'Re: as',	12,	81,	'fuck you',	1451905630,	'yes',	'yes',	'no',	'no'),
(30,	1,	'faggot',	12,	81,	'lalaalal',	1451905697,	'yes',	'yes',	'no',	'no'),
(31,	1,	'wqewq',	142,	12,	'1',	1462499650,	'yes',	'no',	'no',	'no');

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `author` varchar(15) NOT NULL,
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(2) NOT NULL,
  `postage` char(15) NOT NULL,
  `buyer_notes` longtext NOT NULL,
  `seller_notes` varchar(50) NOT NULL DEFAULT 'No note was left by the seller.',
  `listing_id` int(11) NOT NULL,
  `product_name` text NOT NULL,
  `date_ordered` text NOT NULL,
  `buyer` text NOT NULL,
  `status` text NOT NULL,
  `shipped` text,
  `FE` text NOT NULL,
  `finalized` text NOT NULL,
  `final_price` float NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `id` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `orders` (`author`, `order_id`, `quantity`, `postage`, `buyer_notes`, `seller_notes`, `listing_id`, `product_name`, `date_ordered`, `buyer`, `status`, `shipped`, `FE`, `finalized`, `final_price`) VALUES
('100',	9,	0,	'0',	'xyxy',	'',	73,	'TEST',	'2. 4. 2016',	'',	'',	NULL,	'',	'',	0),
('12',	10,	1,	'0',	'e',	'',	73,	'TEST',	'2. 4. 2016',	'',	'',	NULL,	'',	'',	0),
('100',	11,	1,	'0',	'Y',	'',	74,	'Testeroke321',	'3. 4. 2016',	'',	'',	NULL,	'',	'',	0),
('142',	12,	10,	'Ceska posta',	'xxxx',	'das',	74,	'Testeroke321',	'5. 4. 2016',	'',	'Decline',	NULL,	'',	'',	0),
('142',	13,	10,	'Ceska posta',	'xxxx',	'das',	74,	'Testeroke321',	'5. 4. 2016',	'',	'Decline',	NULL,	'',	'',	0),
('142',	14,	77,	'DPD Postage',	'xxx',	'das',	74,	'Testeroke321',	'5. 4. 2016',	'',	'Decline',	NULL,	'',	'',	0),
('142',	15,	1,	'fds',	's',	'das',	593,	'dsf',	'6. 4. 2016',	'',	'Decline',	NULL,	'',	'',	0),
('142',	16,	54,	'\'',	'dfdf',	'das',	593,	'dsf',	'6. 4. 2016',	'',	'Decline',	NULL,	'',	'',	0),
('142',	17,	1,	'BURANOJ',	'',	'das',	596,	'as',	'7. 4. 2016',	'',	'Decline',	NULL,	'',	'',	0),
('142',	18,	10,	'BEKElE+111K?',	'sx',	'das',	625,	'efe',	'10. 4. 2016',	'test6',	'Decline',	NULL,	'',	'',	0),
('12',	19,	11,	'xa+1K?',	'xa',	'No note was left by the seller.',	615,	'Testing',	'13. 4. 2016',	'admin',	'pending',	NULL,	'',	'',	0),
('test6',	21,	11,	'xa+1K?',	'asd',	'gt',	615,	'Testing',	'13. 4. 2016',	'admin',	'pending',	NULL,	'',	'',	0),
('test6',	22,	11,	'xa+1K?',	'wq',	'fb',	615,	'Testing',	'13. 4. 2016',	'admin',	'Decline',	NULL,	'',	'',	0),
('test6',	23,	11,	'xa+1K?',	'ds',	'',	615,	'Testing',	'13. 4. 2016',	'admin',	'Decline',	NULL,	'',	'',	0),
('test6',	24,	1,	'xa+1K?',	's',	'sq',	615,	'Testing',	'13. 4. 2016',	'test6',	'pending',	NULL,	'',	'',	0),
('test6',	25,	1,	'xa+1K?',	'sa',	'y',	615,	'Testing',	'14. 4. 2016',	'admin',	'Decline',	NULL,	'',	'',	0),
('test6',	26,	11,	'xa+1K?',	'as',	'',	615,	'Testing',	'14. 4. 2016',	'fagan23',	'Decline',	NULL,	'',	'',	0),
('test6',	27,	1,	'xa+1K?',	'asd',	'',	615,	'Testing',	'14. 4. 2016',	'admin',	'Decline',	NULL,	'',	'',	0),
('test6',	28,	1,	'xa+1K?',	'w',	'',	615,	'Testing',	'14. 4. 2016',	'admin',	'Decline',	NULL,	'',	'',	0),
('test6',	29,	1,	'xa+1K?',	'wqe',	'',	615,	'Testing',	'14. 4. 2016',	'admin',	'dispute',	NULL,	'',	'',	0),
('fagan23',	30,	1,	'LECHUZA+100K?',	'Q',	'sa',	627,	'ALIEn',	'14. 4. 2016',	'test6',	'pending',	NULL,	'',	'yes',	0),
('test6',	31,	1,	'xa+1K?',	'sa',	'',	615,	'Testing',	'18. 4. 2016',	'admin',	'Decline',	NULL,	'',	'',	0),
('fagan23',	32,	1,	'LECHUZA+100K?',	'asd',	'',	627,	'ALIEn',	'18. 4. 2016',	'test6',	'Decline',	NULL,	'',	'',	0),
('fagan23',	33,	11,	'LECHUZA+100K?',	'dfs',	'',	627,	'ALIEn',	'18. 4. 2016',	'test6',	'Decline',	NULL,	'',	'',	0),
('fagan23',	34,	11,	'LECHUZA+100K?',	'Qq',	'No note was left by the seller.',	627,	'ALIEn',	'22. 4. 2016',	'test6',	'closed',	NULL,	'',	'',	0),
('test6',	35,	11,	'xa+1K?',	'dsa',	'tg',	615,	'Testing',	'22. 4. 2016',	'admin',	'pending',	NULL,	'',	'',	0),
('test6',	36,	1,	'xa+1K?',	'sfd',	'b',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'pending',	NULL,	'',	'',	0),
('test6',	37,	1,	'xa+1K?',	'sfd',	'',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'Decline',	NULL,	'',	'',	0),
('test6',	38,	1,	'xa+1K?',	'sfd',	'ui',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'Decline',	NULL,	'',	'',	0),
('test6',	39,	1,	'xa+1K?',	'sfd',	'No note was left by the seller.',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'closed',	NULL,	'',	'',	0),
('test6',	40,	1,	'xa+1K?',	'sfd',	'No note was left by the seller.',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'closed',	NULL,	'',	'',	0),
('test6',	41,	1,	'xa+1K?',	'sfd',	'No note was left by the seller.',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'closed',	NULL,	'',	'',	0),
('test6',	42,	1,	'xa+1K?',	'sfd',	'No note was left by the seller.',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'closed',	NULL,	'',	'',	0),
('fagan23',	43,	11,	'LECHUZA+100K?',	'Qq',	'No note was left by the seller.',	627,	'ALIEn',	'22. 4. 2016',	'test6',	'closed',	NULL,	'',	'',	0),
('fagan23',	44,	11,	'LECHUZA+100K?',	'Qq',	'No note was left by the seller.',	627,	'ALIEn',	'22. 4. 2016',	'test6',	'closed',	NULL,	'',	'',	0),
('fagan23',	45,	11,	'LECHUZA+100K?',	'Qq',	'No note was left by the seller.',	627,	'ALIEn',	'22. 4. 2016',	'test6',	'closed',	NULL,	'',	'',	0),
('fagan23',	46,	11,	'LECHUZA+100K?',	'Qq',	'No note was left by the seller.',	627,	'ALIEn',	'22. 4. 2016',	'test6',	'closed',	NULL,	'',	'',	0),
('fagan23',	47,	11,	'LECHUZA+100K?',	'Qq',	'No note was left by the seller.',	627,	'ALIEn',	'22. 4. 2016',	'test6',	'dispute',	NULL,	'',	'',	0),
('fagan23',	48,	11,	'LECHUZA+100K?',	'Qq',	'No note was left by the seller.',	627,	'ALIEn',	'22. 4. 2016',	'test6',	'dispute',	NULL,	'',	'',	0),
('test6',	49,	1,	'xa +1K?',	'A',	'ewr',	615,	'Testing',	'2. 5. 2016',	'fagan23',	'pending',	NULL,	'',	'',	0.000188598),
('fagan23',	50,	1,	'sa +1K?',	'sa',	'xy',	684,	'xxycxy',	'7. 5. 2016',	'test6',	'Decline',	NULL,	'',	'',	0.000184032),
('fagan23',	51,	1,	'sa +1K?',	'sa',	'xy',	684,	'xxycxy',	'7. 5. 2016',	'test6',	'Decline',	NULL,	'',	'',	0.000184032),
('fagan23',	52,	1,	'sa +1K?',	'sa',	'No note was left by the seller.',	684,	'xxycxy',	'7. 5. 2016',	'test6',	'pending',	NULL,	'',	'',	0.000184032),
('fagan23',	53,	1,	'sa +1K?',	'sa',	'No note was left by the seller.',	684,	'xxycxy',	'7. 5. 2016',	'test6',	'pending',	NULL,	'',	'',	0.000184032),
('fagan23',	54,	1,	'sa +1K?',	'sa',	'No note was left by the seller.',	684,	'xxycxy',	'7. 5. 2016',	'test6',	'pending',	NULL,	'',	'',	0.000184032),
('fagan23',	55,	1,	'sa +1K?',	'sa',	'No note was left by the seller.',	684,	'xxycxy',	'7. 5. 2016',	'test6',	'pending',	NULL,	'',	'',	0.000184032),
('fagan23',	56,	1,	'sa +1K?',	'sa',	'No note was left by the seller.',	684,	'xxycxy',	'7. 5. 2016',	'test6',	'pending',	NULL,	'',	'',	0.000184032),
('fagan23',	57,	1,	'sa +1K?',	'sa',	'No note was left by the seller.',	684,	'xxycxy',	'7. 5. 2016',	'test6',	'pending',	NULL,	'',	'',	0.000184032),
('fagan23',	58,	1,	'sa +1K?',	'sa',	'No note was left by the seller.',	684,	'xxycxy',	'7. 5. 2016',	'test6',	'pending',	NULL,	'',	'',	0.000184032),
('fagan23',	59,	1,	'sa +1K?',	'sa',	'No note was left by the seller.',	684,	'xxycxy',	'7. 5. 2016',	'test6',	'pending',	NULL,	'',	'',	0.000184032),
('fagan23',	88,	1,	'Doprava +100K?',	'DA',	'No note was left by the seller.',	692,	'TEST',	'8. 5. 2016',	'test6',	'pending',	NULL,	'',	'yes',	0.0183988),
('fagan23',	89,	1,	'Doprava +100K?',	'a',	'No note was left by the seller.',	692,	'TEST',	'8. 5. 2016',	'test6',	'pending',	NULL,	'',	'yes',	0.0184137),
('fagan23',	90,	11,	'Doprava +100K?',	'2',	'No note was left by the seller.',	692,	'TEST',	'8. 5. 2016',	'test6',	'pending',	NULL,	'',	'',	0.0184193),
('fagan23',	91,	22,	'Doprava +100K?',	'asd',	'No note was left by the seller.',	692,	'TEST',	'8. 5. 2016',	'test6',	'pending',	NULL,	'no',	'',	0.0184048),
('fagan23',	92,	11,	'Doprava +100K?',	'w',	'No note was left by the seller.',	692,	'TEST',	'8. 5. 2016',	'test6',	'pending',	NULL,	'no',	'',	0.0184088),
('fagan23',	93,	1,	'Doprava +100K?',	'da',	'No note was left by the seller.',	692,	'TEST',	'8. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0184076),
('fagan23',	94,	1,	'Doprava +100K?',	'a',	'No note was left by the seller.',	692,	'TEST',	'8. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0184088),
('fagan23',	95,	1,	'Doprava +100K?',	'yxc',	'No note was left by the seller.',	692,	'TEST',	'8. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0184097),
('fagan23',	96,	3,	'Doprava +100K?',	'XYy',	'No note was left by the seller.',	692,	'TEST',	'8. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0552253),
('fagan23',	97,	1,	'Doprava +100K?',	'yx',	'No note was left by the seller.',	692,	'TEST',	'8. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0184169),
('fagan23',	98,	1,	'Doprava +100K?',	'1',	'No note was left by the seller.',	692,	'TEST',	'9. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0184113),
('fagan23',	99,	1,	'Doprava +100K?',	'ads',	'No note was left by the seller.',	692,	'TEST',	'9. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0184088),
('fagan23',	100,	1,	'Doprava +100K?',	'sa',	'No note was left by the seller.',	692,	'TEST',	'9. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0184145),
('fagan23',	101,	1,	'Doprava +100K?',	'y',	'No note was left by the seller.',	692,	'TEST',	'9. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0184133),
('fagan23',	102,	1,	'Doprava +100K?',	'sad',	'No note was left by the seller.',	692,	'TEST',	'9. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0183776),
('fagan23',	103,	1,	'Doprava +100K?',	'sd',	'No note was left by the seller.',	692,	'TEST',	'9. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0183832),
('fagan23',	104,	1,	'Doprava +100K?',	'Ja',	'No note was left by the seller.',	692,	'TEST',	'9. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0183912),
('fagan23',	105,	1,	'Doprava +100K?',	'a',	'No note was left by the seller.',	692,	'TEST',	'9. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0183904),
('test6',	106,	1,	'xa+1K?',	'sfd',	'No note was left by the seller.',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'closed',	NULL,	'',	'',	0),
('test6',	107,	1,	'xa+1K?',	'sfd',	'No note was left by the seller.',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'closed',	NULL,	'',	'',	0),
('test6',	108,	1,	'xa+1K?',	'sfd',	'',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'pending',	NULL,	'',	'',	0),
('12',	109,	11,	'xa+1K?',	'xa',	'No note was left by the seller.',	615,	'Testing',	'13. 4. 2016',	'admin',	'pending',	NULL,	'',	'',	0),
('test6',	110,	1,	'xa+1K?',	'sfd',	'r',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'Decline',	NULL,	'',	'',	0),
('test6',	111,	1,	'xa+1K?',	'sfd',	'qw',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'Decline',	NULL,	'',	'',	0),
('test6',	112,	1,	'xa+1K?',	'sfd',	'',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'pending',	NULL,	'',	'',	0),
('test6',	113,	1,	'xa+1K?',	'sfd',	'',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'pending',	NULL,	'',	'',	0),
('test6',	114,	1,	'xa+1K?',	'sfd',	'',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'Decline',	NULL,	'',	'',	0),
('test6',	115,	1,	'xa+1K?',	'sfd',	'qw',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'Decline',	NULL,	'',	'',	0),
('test6',	116,	1,	'xa+1K?',	'sfd',	'',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'pending',	NULL,	'',	'',	0),
('test6',	117,	1,	'xa+1K?',	'sfd',	'eq',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'Decline',	NULL,	'',	'',	0),
('fagan23',	118,	1,	'Doprava +100K?',	'hzžhu',	'No note was left by the seller.',	692,	'TEST',	'11. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0185822),
('fagan23',	119,	1,	'Doprava +100K?',	'a',	'No note was left by the seller.',	692,	'TEST',	'11. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0185822),
('fagan23',	120,	1,	'Doprava +100K?',	'1',	'No note was left by the seller.',	692,	'TEST',	'11. 5. 2016',	'test6',	'pending',	NULL,	'yes',	'yes',	0.0186055),
('fagan23',	121,	1,	'Doprava +100K?',	'1',	'No note was left by the seller.',	692,	'TEST',	'11. 5. 2016',	'test6',	'pending',	NULL,	'1',	'yes',	0.0186055),
('fagan23',	122,	1,	'Doprava +100K?',	'1',	'No note was left by the seller.',	692,	'TEST',	'11. 5. 2016',	'test6',	'pending',	NULL,	'1',	'yes',	0.0186055),
('fagan23',	123,	1,	'Doprava +100K?',	'1',	'No note was left by the seller.',	692,	'TEST',	'11. 5. 2016',	'test6',	'pending',	NULL,	'1',	'yes',	0.0186055),
('fagan23',	124,	1,	'Doprava +100K?',	'brokolo',	'No note was left by the seller.',	692,	'TEST',	'11. 5. 2016',	'test6',	'pending',	NULL,	'1',	'yes',	0.0186055),
('fagan23',	125,	1,	'Doprava +100K?',	'aads',	'No note was left by the seller.',	692,	'TEST',	'11. 5. 2016',	'test6',	'pending',	'yes',	'1',	'no',	0.0186516),
('test6',	126,	1,	'xa+1K?',	'sfd',	'',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'pending',	NULL,	'',	'',	0),
('test6',	127,	1,	'xa+1K?',	'sfd',	'',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'pending',	NULL,	'',	'',	0),
('test6',	128,	1,	'xa+1K?',	'sfd',	'',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'pending',	NULL,	'',	'',	0),
('test6',	129,	1,	'xa+1K?',	'sfd',	'',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'pending',	NULL,	'',	'',	0),
('test6',	130,	1,	'xa+1K?',	'sfd',	'',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'pending',	NULL,	'',	'',	0),
('test6',	131,	1,	'xa+1K?',	'sfd',	'',	615,	'Testing',	'22. 4. 2016',	'fagan23',	'pending',	NULL,	'',	'',	0),
('fagan23',	132,	1,	'sa +1K?',	'sc',	'sddfs',	684,	'xxycxy',	'13. 5. 2016',	'test6',	'pending',	'yes',	'yes',	'yes',	0.000185952);

DROP TABLE IF EXISTS `postage`;
CREATE TABLE `postage` (
  `postage_id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_id` int(4) NOT NULL,
  `option` char(15) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`postage_id`),
  KEY `listing_id` (`listing_id`),
  CONSTRAINT `postage_ibfk_5` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `postage_ibfk_6` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `postage` (`postage_id`, `listing_id`, `option`, `price`) VALUES
(1,	74,	'DPD Postage',	0),
(2,	74,	'Ceska posta',	0),
(199,	626,	'CSFD',	11),
(237,	684,	'sa',	1),
(238,	692,	'Doprava',	100),
(239,	693,	'dsads',	111),
(240,	695,	'gh',	1),
(242,	691,	'fdsfd',	1),
(244,	696,	'ads',	1);

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `type` text NOT NULL,
  `origin` text NOT NULL,
  `receiver` text NOT NULL,
  `donetime` int(25) NOT NULL,
  `ammount` double NOT NULL,
  `p_released` text,
  `escrow` text,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `transactions` (`id`, `order_id`, `type`, `origin`, `receiver`, `donetime`, `ammount`, `p_released`, `escrow`, `status`) VALUES
(1,	0,	'pay',	'',	'',	1462644504,	0.0001840323,	NULL,	'yes',	''),
(2,	0,	'pay',	'',	'',	1462644508,	0.0001840323,	NULL,	'yes',	''),
(3,	0,	'pay',	'',	'',	1462644522,	0.0001840323,	NULL,	'yes',	''),
(4,	69,	'saveprofit',	'',	'',	1462650796,	0.0001751127,	NULL,	'no',	''),
(5,	69,	'pay',	'',	'',	1462650796,	0.0001751127,	NULL,	'yes',	''),
(6,	73,	'saveprofit',	'',	'',	1462651215,	0.0001750784,	NULL,	NULL,	''),
(7,	73,	'pay',	'',	'',	1462651215,	0.0001750784,	NULL,	'yes',	''),
(8,	74,	'saveprofit',	'',	'',	1462651255,	0.0001750784,	NULL,	NULL,	''),
(9,	74,	'pay',	'',	'',	1462651255,	0.0001750784,	NULL,	'yes',	''),
(10,	75,	'saveprofit',	'',	'',	1462651714,	0.0000082498,	NULL,	NULL,	'finished'),
(11,	75,	'pay',	'',	'',	1462651714,	0.0001750784,	NULL,	'yes',	'waiting'),
(12,	76,	'saveprofit',	'',	'',	1462651886,	0.0008247081,	NULL,	NULL,	'finished'),
(13,	76,	'pay',	'',	'',	1462651886,	0.0175021376,	NULL,	'yes',	'waiting'),
(14,	91,	'saveprofit',	'',	'',	1462732512,	0.0008282175,	NULL,	NULL,	'finished'),
(15,	91,	'pay',	'',	'',	1462732512,	0.0175766148,	NULL,	'yes',	'waiting'),
(16,	92,	'saveprofit',	'',	'',	1462732626,	0.0008283982,	NULL,	NULL,	'finished'),
(17,	92,	'pay',	'',	'',	1462732626,	0.0175804512,	NULL,	'yes',	'waiting'),
(18,	93,	'saveprofit',	'',	'',	1462732731,	0.000828344,	NULL,	NULL,	'finished'),
(19,	93,	'pay',	'',	'',	1462732732,	0.0175793001,	NULL,	'no',	'finished'),
(20,	94,	'saveprofit',	'',	'',	1462733309,	0.0008283982,	NULL,	NULL,	'finished'),
(21,	94,	'pay',	'',	'',	1462733309,	0.0175804512,	NULL,	'no',	'finished'),
(22,	95,	'saveprofit',	'',	'',	1462733718,	0.0008284344,	NULL,	NULL,	'finished'),
(23,	95,	'pay',	'',	'',	1462733718,	0.0175812187,	NULL,	'no',	'finished'),
(24,	96,	'saveprofit',	'',	'',	1462735130,	0.0024851404,	NULL,	NULL,	'finished'),
(25,	96,	'pay',	'',	'',	1462735130,	0.0527402025,	NULL,	'no',	'finished'),
(26,	97,	'saveprofit',	'',	'',	1462741161,	0.00082876,	NULL,	NULL,	'finished'),
(27,	97,	'pay',	'',	'',	1462741162,	0.0175881291,	NULL,	'no',	'finished'),
(28,	98,	'saveprofit',	'',	'',	1462755485,	0.0008285067,	NULL,	NULL,	'finished'),
(29,	98,	'pay',	'',	'',	1462755486,	0.0175827539,	NULL,	'no',	'finished'),
(30,	99,	'saveprofit',	'',	'',	1462755631,	0.0008283982,	NULL,	NULL,	'finished'),
(31,	99,	'pay',	'',	'',	1462755631,	0.0175804512,	NULL,	'no',	'finished'),
(32,	100,	'saveprofit',	'',	'',	1462756007,	0.0008286514,	NULL,	NULL,	'finished'),
(33,	100,	'pay',	'',	'',	1462756007,	0.0175858251,	NULL,	'no',	'finished'),
(34,	101,	'saveprofit',	'',	'',	1462756128,	0.0008285972,	NULL,	NULL,	'finished'),
(35,	101,	'pay',	'',	'',	1462756128,	0.0175846732,	NULL,	'no',	'finished'),
(36,	102,	'saveprofit',	'',	'',	1462804180,	0.0008269903,	NULL,	NULL,	'finished'),
(37,	102,	'pay',	'',	'',	1462804180,	0.0175505714,	NULL,	'no',	'finished'),
(38,	103,	'saveprofit',	'',	'',	1462804329,	0.0008272426,	NULL,	NULL,	'finished'),
(39,	103,	'pay',	'',	'',	1462804329,	0.017555927,	NULL,	'no',	'finished'),
(40,	104,	'saveprofit',	'',	'',	1462806720,	0.0008276034,	NULL,	NULL,	'finished'),
(41,	104,	'pay',	'',	'',	1462806720,	0.0175635834,	NULL,	'no',	'finished'),
(42,	105,	'saveprofit',	'',	'',	1462806935,	0.0008275673,	NULL,	NULL,	'finished'),
(43,	105,	'pay',	'',	'',	1462806935,	0.0175628175,	NULL,	'no',	'finished'),
(44,	118,	'saveprofit',	'',	'',	1462982249,	0.0008361997,	NULL,	NULL,	'finished'),
(45,	118,	'pay',	'',	'',	1462982249,	0.0177460169,	NULL,	'no',	'finished'),
(46,	119,	'saveprofit',	'',	'',	1462983496,	0.0008361997,	NULL,	NULL,	'finished'),
(47,	119,	'pay',	'',	'',	1462983497,	0.0177460169,	NULL,	'no',	'finished'),
(48,	120,	'saveprofit',	'',	'',	1462991176,	0.0008372469,	NULL,	NULL,	'finished'),
(49,	120,	'pay',	'',	'',	1462991176,	0.0177682397,	NULL,	'no',	'finished'),
(50,	121,	'saveprofit',	'',	'',	1462992244,	0.0008372469,	NULL,	NULL,	'finished'),
(51,	121,	'pay',	'',	'',	1462992244,	0.0177682397,	NULL,	'no',	'finished'),
(52,	122,	'saveprofit',	'',	'',	1462992405,	0.0008372469,	NULL,	NULL,	'finished'),
(53,	122,	'pay',	'',	'',	1462992406,	0.0177682397,	NULL,	'no',	'finished'),
(54,	123,	'saveprofit',	'',	'',	1462992408,	0.0008372469,	NULL,	NULL,	'finished'),
(55,	123,	'pay',	'',	'',	1462992409,	0.0177682397,	NULL,	'no',	'finished'),
(56,	124,	'saveprofit',	'',	'',	1462992497,	0.0008372469,	NULL,	NULL,	'finished'),
(57,	124,	'pay',	'',	'',	1462992497,	0.0177682397,	NULL,	'no',	'finished'),
(58,	125,	'saveprofit',	'',	'',	1462992562,	0.000839321,	NULL,	NULL,	'finished'),
(59,	125,	'pay',	'',	'',	1462992563,	0.0178122575,	NULL,	'no',	'finished'),
(60,	132,	'saveprofit',	'',	'',	1463132228,	0.0000083678,	NULL,	NULL,	'finished'),
(61,	132,	'pay',	'',	'',	1463132228,	0.0001775842,	NULL,	'no',	'finished');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `login` char(15) NOT NULL,
  `password` char(100) NOT NULL,
  `pin` int(6) NOT NULL,
  `access_level` char(10) NOT NULL,
  `referal` char(15) DEFAULT NULL,
  `pubkey` text,
  `jabber` char(30) DEFAULT NULL,
  `btcaddress` char(35) NOT NULL,
  `address_request_time` datetime NOT NULL,
  `created` datetime NOT NULL,
  `fe_allowed` char(3) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` (`id`, `login`, `password`, `pin`, `access_level`, `referal`, `pubkey`, `jabber`, `btcaddress`, `address_request_time`, `created`, `fe_allowed`, `level`) VALUES
(12,	'admin',	'$2y$10$ZEoxtyYTUoW56uTD8iGwhOkrlRFfQvKhTYF2RKb0HSos4cMb8xbky',	123456,	'admin',	NULL,	'curak',	'jahoda@seznam.cz',	'mwPrijES3Nq2Nwq1qgN8x8BXs8qKNiW89a',	'2016-05-03 15:00:48',	'0000-00-00 00:00:00',	NULL,	NULL),
(80,	'alejandro',	'$2y$10$ub2lHNk0HtFtuoSP7sk.xOl4Tl08iA3pN4xKZUd5wjmK5M8Nq3WFy',	81808,	'registered',	'šámoT',	NULL,	NULL,	'1ASkNDLYbqR6Du2bc91H63npUJ3j7gWiwo',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	NULL,	NULL),
(81,	'test',	'$2y$10$gTYCdXQ08jeG7llHi1x3a.FSC2cTNvqZnlDKx6EiKAjypLiLVKShK',	98767,	'registered',	'xak',	NULL,	NULL,	'1FfD7Qdut4fd6KjaxppXZ5LxByuyfXU3zd',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	NULL,	NULL),
(82,	'fagan23',	'$2y$10$KxijGwEwutSZxbiRKTB5weVrIx3YCPDri25OkCYt5B/4gxgPdHm9O',	123456,	'vendor',	'fegit',	NULL,	NULL,	'mxKo1JDYpNa3rrU6ihYjDUYzUQDYE8VTDD',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'yes',	NULL),
(100,	'jojo32',	'$2y$10$HsY3pWxmZzHIcF.Sgiqs/uGfGFN4.w5uIoQ.lQvyE9u2SnptgXcJu',	123456,	'vendor',	'x',	NULL,	NULL,	'',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	NULL,	NULL),
(138,	'btcClient',	'$2y$10$Oo3oOAUzSd/ozAjACNUPVODv29B0g5E5sSL0GVRFe/zaTHBWk6K2a',	123456,	'registered',	'x',	NULL,	NULL,	'mnEGKGymVv1cPDcZPUkQEkEisU8ehyEtwW',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	NULL,	NULL),
(139,	'test1',	'$2y$10$FCjugQio/M/1oCpC6ot51OLpiCQ9rrQNxt4lf4WhCXebkSyFuEeOe',	123456,	'registered',	'x',	NULL,	NULL,	'mfeH2skYYMpPa4Y647yiUSSEXfa5im7pC8',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	NULL,	NULL),
(140,	'test2',	'$2y$10$Q9u1rUCEBQtIqp1VnsxuG.fZYQYFbM2WmZijxdL/X3LWUi/fvHTy6',	123456,	'registered',	'x',	NULL,	NULL,	'moVMPmBSKorDP3Sx1M8LXrQDWcQE4TAgnn',	'2016-04-04 10:22:15',	'0000-00-00 00:00:00',	NULL,	NULL),
(141,	'test3',	'$2y$10$hEeJmXpgLcRrYB.TrXueV.eQE7Ap2K6g77tnfpn0XUrL/z5rLGVnu',	123456,	'registered',	'x',	NULL,	NULL,	'msaqbE1upS4hFaGTzLdTCCfUwJ5na7ryXL',	'2016-04-04 10:28:52',	'0000-00-00 00:00:00',	NULL,	NULL),
(142,	'test6',	'$2y$10$cuqxvhjWoESZDiZx0CiWl.hj4vt730oR1vMTx6Kf.gw/S2z1KFbiu',	123456,	'vendor',	'x',	NULL,	NULL,	'mtddXvFA56KSvi9p7G9RQMCcNamos3Fpej',	'2016-05-05 21:38:27',	'0000-00-00 00:00:00',	NULL,	NULL);

-- 2016-05-13 11:00:52
