#设置客户端连接服务器端编码
SET NAMES UTF8;
#丢弃数据库clock，如果存在的话
DROP DATABASE IF EXISTS clock;
#创建数据库clock，设置存储的编码
CREATE DATABASE clock CHARSET=UTF8;
#进入数据库
USE clock;

#轮播表
CREATE TABLE lunbo(
  lid TINYINT PRIMARY KEY AUTO_INCREMENT,
  herf varchar(128),
  img varchar(128),
  title varchar(64)
);

insert into lunbo values(null,'/details/2','img/lunbo1.jpg','lunbo1');
insert into lunbo values(null,'/details/3','img/lunbo2.jpg','lunbo2');
insert into lunbo values(null,'/details/4','img/lunbo5.jpg','lunbo3');

#商品信息表
CREATE TABLE products(
  pid TINYINT PRIMARY KEY AUTO_INCREMENT,
  produId varchar(8),
  img varchar(128),
  bgImg varchar(128),
  title varchar(64),
  subTitle varchar(64), #副标题
  family varchar(32),   #所属型号家族编号
  price DECIMAL(10,2), #价格
  style set("休闲","可爱","商务","复古","时尚","极简","运动"), #风格
  function set('双时区','年历','日期显示','星期显示','月份显示'),#功能
  waterproof enum('30M','50M','100M','200M','500M','500M以上'),#防水性能
  classification enum('女士机械表','女士石英表','男士机械表','男士石英表'), #商品类型
  material varchar(24),#表壳材料
  caseMaterial varchar(24)#表带材料
);

insert into products values(null,'00401','img/product/pro1.jpg',
'img/product/pro1-bg.jpg','女士机械表1',
'服务承诺：*30天无忧退货 *48小时快速退款','卡西欧（CASIO）','4800',
'商务,时尚,极简','日期显示,月份显示,年历',1,1,'金属','金属');

insert into products values(null,'00402','img/product/pro2.jpg',
'img/product/pro2-bg.jpg','女士石英表1',
'服务承诺：*30天无忧退货 *48小时快速退款','天梭（TISSOT）','9800',
'商务,时尚,极简','日期显示,月份显示,年历',5,2,'钛合金','牛皮');

insert into products values(null,'00403','img/product/pro3.jpg',
'img/product/pro3-bg.jpg','男士机械表1',
'服务承诺：*30天无忧退货 *48小时快速退款','天王（TIAN WANG）','5800',
'商务, 复古','',3,3,'钛合金','鳄鱼皮');

insert into products values(null,'00404','img/product/pro4.jpg',
'img/product/pro4-bg.jpg','男士机械表2',
'服务承诺：*30天无忧退货 *48小时快速退款','阿玛尼（ARMANI）','6800',
'休闲,运动','',4,3,'牛皮','精钢');

insert into products values(null,'00405','img/product/pro5.jpg',
'img/product/pro5-bg.jpg',
'男士石英表1','服务承诺：*30天无忧退货 *48小时快速退款',
'阿玛尼（ARMANI）','112800',
'运动,极简','日期显示,星期显示,双时区',6,4,'白金','鳄鱼皮');

insert into products values(null,'00406','img/product/pro6.jpg',
'img/product/pro6-bg.jpg',
'女士机械表3','服务承诺：*30天无忧退货 *48小时快速退款',
'齐博林（Zeppelin）','52800',
'时尚,可爱','星期显示,月份显示,年历',3,1,'钛合金','鳄鱼皮');

insert into products values(null,'00407','img/product/pro7.jpg',
'img/product/pro7-bg.jpg',
'女士石英表4','服务承诺：*30天无忧退货 *48小时快速退款',
'天王（TIAN WANG）','8800',
'商务,时尚','日期显示,星期显示,月份显示,年历,双时区',6,2,'精钢','鳄鱼皮');

insert into products values(null,'00408','img/product/pro8.jpg',
'img/product/pro8-bg.jpg','男士石英表2',
'服务承诺：*30天无忧退货 *48小时快速退款','天王（TIAN WANG）','4300',
'休闲,时尚,复古','星期显示,月份显示',4,4,'铂金','牛皮');

insert into products values(null,'00409','img/product/pro9.jpg',
'img/product/pro9-bg.jpg','女士石英表3',
'服务承诺：*30天无忧退货 *48小时快速退款','卡西欧（CASIO）','9800',
'商务,时尚,极简','日期显示,星期显示,双时区',5,2,'白金','牛皮');

insert into products values(null,'00410','img/product/pro10.jpg',
'img/product/pro10-bg.jpg','女士石英表2',
'服务承诺：*30天无忧退货 *48小时快速退款','卡西欧（CASIO）','6800',
'时尚,休闲','日期显示,星期显示,月份显示,年历',4,2,'钛合金','牛皮');

insert into products values(null,'00411','img/product/pro11.jpg',
'img/product/pro11-bg.jpg','男士石英表3',
'服务承诺：*30天无忧退货 *48小时快速退款','罗西尼（ROSSINI）','8700',
'休闲,运动','日期显示,月份显示,年历',4,4,'精钢','牛皮');

insert into products values(null,'00412','img/product/pro12.jpg',
'img/product/pro12-bg.jpg','女士机械表2',
'服务承诺：*30天无忧退货 *48小时快速退款','天梭（TISSOT）','5600',
'复古,可爱','日期显示,年历',3,1,'精钢','不锈钢');

#博文信息表
CREATE TABLE news(
  nid TINYINT PRIMARY KEY AUTO_INCREMENT,
  img varchar(128),
  title varchar(64),
  time  datetime,
  autuor varchar(12),
  content longtext,
  type set('全部资讯','店铺动态','店长博客')
);

insert into news values(null,'img/news/news1.jpg',
'艾媒发布新零售行业白皮书 万表打造手表零售新业态',
'2019-01-05 19:20','hui',
'<p style="font-family: 宋体, " arial="" narrow",="" sans-serif;"="">新零售是以互联网为基础、以大数据为支撑，将线上平台、线下实体店和物流配置紧密结合的新型零售模式。马云于2016年10月提出新零售的概念：在互联网发展的基础上，新零售、新制造、新金融、新技术和新能源将成为今后的五大变革。2017年11月24日，全球领先的新经济行业数据挖掘和分析机构iiMedia Research(艾媒咨询)权威发布《2017年中国新零售行业白皮书》。报告显示，2017年无人零售商店交易额预计达389.4亿元，未来五年无人零售商店将会迎来发展红利期。</p>
<p style="font-family: 宋体, " arial="" narrow",="" sans-serif;"=""><strong>各电商巨头竞相发力新零售 技术与信用体系推动发展</strong></p>
<p style="font-family: 宋体, " arial="" narrow",="" sans-serif;"="">2017年，各电商巨头相继布局新零售，阿里通过入股三江购物、新华都，私有化银泰商业、联手百联集团等方式加码布局线下，推动线上线下加速融合。京东则通过入股永辉超市，与沃尔玛战略合作，开线下便利店等方式进军新零售领域。艾媒咨询分析师认为，在大数据、云计算和3D等技术支持下，加之消费者个性化需求增加，融合线上、线下、物流的新零售模式成为激活零售市场的下一步。</p>
<p style="font-family: 宋体, " arial="" narrow",="" sans-serif;"="">同时，中国新零售业支持性设施的逐渐成熟有利于新零售业的发展。除了市场上较大的物流公司，目前还有新公司涌现，如同城物流、干线物流。同时，新型建仓物流、冷链物流等专业性物流实现当日配送，使市场愈显精细化。多样支付方式增进购物便利性，而且为线上线下的融合一体化消除了支付转换的阻碍，将成为新零售基础之一。新零售将依托大数据和云计算来优化商品的生产、销售、服务的全渠道，进一步提高消费者体验，改进物流系统加速产品流通。</p>'
,7)

insert into news values(null,'img/news/news2.jpg',
'传统与智能的完美结合&nbsp;mVoice&nbsp;G2智能手表发布',
'2018-03-01 15:20','hui',
'<p style="text-align: left;">Martian Watches称，mVoice G2的传统自动表针独立于智能系统，可单独提供60天的动力走时，在mVoice系列中用户可以使用三大语音助手提供各类功能，比如询问天气，添加购物列表，创建闹钟提醒等等，直接进行Lyft约车等等，而且其OLED区域能够显示三方应用的提醒等消息，并且能够定制震动类型和LED颜色。</p>
<p style="text-align: left;">mVoice G2混合智能腕表目前已经正在Kickstarter上进行众筹，早鸟支持价为129美元，预计零售价为245美元预期在2018年5月正式发售。</p>
',5)

insert into news values(null,'img/news/news3.jpg',
'Apple Watch份额略微下滑受LET型号影响',
'2018-11-03 13:09','hui',
'<p>根据市场研究公司&nbsp;IDC&nbsp;提供的数据，上个季度，Apple&nbsp;Watch&nbsp;是世界上最受欢迎的智能手表，但其市场份额在今年夏天有所下降。<br><br>　　尽管&nbsp;Apple&nbsp;Watch&nbsp;在第二季度的智能手表出货量中所占份额接近一半，市场份额为&nbsp;49.6%，但该设备在第三季度的市场份额估计为&nbsp;41%。换句话说，上个季度，每&nbsp;10&nbsp;个智能手表中就有&nbsp;4&nbsp;个是&nbsp;Apple&nbsp;watch。<br><br>　　在&nbsp;7-9&nbsp;月期间，苹果手表的出货量估计为&nbsp;270&nbsp;万块，低于上一季度的&nbsp;340&nbsp;万块。<br><br>　　Apple&nbsp;Watch&nbsp;的出货量很可能受到季节性因素的影响，因为在传统上，夏季是苹果销售放缓的时期。此外，一些用户可能已经推迟了购买苹果手表的计划，原因是苹果在今年&nbsp;9&nbsp;月推出了带有蜂窝功能的&nbsp;Apple&nbsp;Watch&nbsp;Series&nbsp;3。<br><br>　　三星以&nbsp;70&nbsp;万的出货量成为了仅次于苹果手表的亚军，与前一个季度相比也是略有下降。<br><br>　　Garmin&nbsp;的出货量为&nbsp;60&nbsp;万，与前一季度持平。在中国生产儿童智能手表的&nbsp;Fossil&nbsp;和&nbsp;Continental&nbsp;Wireless，同时以&nbsp;50&nbsp;万块智能手表的出货量并列第四。其他所有智能手表制造商本季度共售出&nbsp;170&nbsp;万块智能手表。<br><br></p>
',3)

insert into news values(null,'img/news/news4.jpg',
'2022年可穿戴设备市场超过一半都是智能手表',
'2017-11-30 07:35','hui',
'<p class="text" style="TEXT-INDENT:2em">腾讯数码讯（米可）在过去的一年里，我们看到很多公司都已经推出过智能手表类的产品。就算是那些之前只专注于销售运动健康追踪类设备的公司，比如Fitbit和佳明，也都调整了产品策略，推出了智能手表。</p>
<p class="text" style="TEXT-INDENT:2em">现在，Forrester发布了一份最新的数据，很好的解释了为什么像Fitbit和佳明这样的公司也会纷纷推出Ionic和Vivoactive 3这样的智能手表。根据Forrester的数据显示，到2022年，智能手表将占据可穿戴设备市场55%的份额，而在去年这个数字仅为21%。</p>
<p class="text" style="TEXT-INDENT:2em">目前智能手表类产品正在迅速吞噬可穿戴设备市场的份额，主要有几个原因。根据Forrester的数据显示，第一个原因就是价格不断下降。随着组件成本的不断下降，越来越多的公司能够生产出价格便宜的智能手表。同时用户群开始向普通消费者转移也是一个主要原因。越来越多的用户想要一个可穿戴设备，主要是因为需求健康追踪、通知、移动支付和旅行相关的活动。</p>
',7)

insert into news values(null,'img/news/news5.jpg',
'低调隽永的绅士腕表精选 给你的魅力加分',
'2018-05-10 17:20','hui',
'<p>在斑驳时光里，用心的男人最有魅力。男生的着装，细节上都体现着个人的气质和品位。考究的着装，文雅的举止，举手投足间便让人赏心悦目。穿梭在商务、日常、运动、休闲各种场合的你，是否还缺一款称心如意的手表，为你的魅力“锦上添花”!</p>
<p><strong>沉稳内敛的瑞美IV系列</strong></p>
<p>掌控人生，由我尽显。瑞士罗马表瑞美IV系列，为你显露精准时间。简约的条字刻度搭配经典圆形表盘，配以3时位星期与日历窗显示，时间判读清晰入目，举手投足间尽显深邃魅力。</p>
',3)

insert into news values(null,'img/news/news3.jpg',
'欧米茄这是要硬刚大金劳？',
'2019-03-18 10:05:49','hui',
'<p style="margin:0px;padding:0px;box-sizing:border-box;">几天前，欧米茄推出了一款重磅复刻作品——<span style="color:rgb(164,0,0);box-sizing:border-box;"><strong style="box-sizing:border-box;">超霸“阿波罗11号”50周年纪念限量版，</strong></span>以纪念阿波罗11号登月<strong style="box-sizing:border-box;"><span style="color:rgb(164,0,0);box-sizing:border-box;">50周年。</span></strong></p>
<img  src="http://img0.wbiao.com.cn/article/201903/18/1552873915008179964.jpg" style="vertical-align:middle;box-sizing:border-box;width:30%;display: block;margin: 0 auto;">
<p style="margin:0px;padding:0px;box-sizing:border-box;">这只表其实是复刻自50年前欧米茄出的一款超霸纪念版腕表<strong style="box-sizing:border-box;"><span style="color:rgb(164,0,0);box-sizing:border-box;">（BA145.022）。</span></strong>当时是1969年，阿波罗11号的宇航员也正是在那年佩戴欧米茄超霸成功登月。同年的11月25日，休斯顿举办了一场宇航员的庆功宴，宴会期间，欧米茄宣布推出一款纪念版腕表<strong style="box-sizing:border-box;"><span style="color:rgb(164,0,0);box-sizing:border-box;">（BA145.022），</span></strong>采用<strong style="box-sizing:border-box;"><span style="color:rgb(164,0,0);box-sizing:border-box;">18K金表壳，</span></strong>并配备了少见的<strong style="box-sizing:border-box;"><span style="color:rgb(164,0,0);box-sizing:border-box;">勃艮第红色表圈。</span></strong></p>

',5)

insert into news values(null,'img/news/news2.jpg',
'极简主义的手表品牌，简洁而不简单？',
'2019-02-11 08:02:55','hui',
'
<p>" 极简主义 " 这个词源于第二次世界大战之后的艺术派系，意思是追求简单到极致。本期介绍的五个手表品牌，一直以极简的设计闻名业内，没有花哨的设计以及复杂的机械功能，但仍然以自己独特的简约风格在手表行业占领一席之地，深受时尚人士的喜爱。</p>
<p>来自新加坡的手表品牌 HyperGrand 是这五个极简手表品牌中最年轻的一个。2013 年，新加坡工程师 Leroy Xavire Zhong 在担任本职工作多年后，不知道 " 抽了什么风 "，跑去成立了自己的手表品牌 HyperGrand，并从此成为众多时尚人士用来作为点睛之笔的不凡配件。</p>
<p>Uniform Wares 的中文是：统一洁具（不知道的还以为是洗涤液），是一家总部设在伦敦的钟表公司。</p>
<p>每款 UW 的手表都经过了审慎平衡工程学、设计美学、材料选择以及功能性而制造，并且一直坚持化繁为简的设计理念，某些款式表甚至省去了表耳，让整体看起来更加流畅精简。</p>
',7)

insert into news values(null,'img/news/news2.jpg',
'复古腕表怎么样_好不好_复古手表的意义是什么？',
'2019-02-11 08:02:55','hui',
'<div>这里是<a href="https://www.wbiao.cn/" target="_blank"><strong>手表</strong></a>答疑栏目，为广大表友解决困惑！小编会定期选取有代表性的问题，进行作答发布。</div>
<div></div>
<div>问：最近迷上了复古风，说说复古腕表的意义吧！</div>
<div>答：复古风一直是潮流<br></div>
<div></div>
<div style="text-align:center;"><img alt="" src="https://image2.wbiao.co/upload/article/201712/25/1514185208086105382.jpg" style="width:500px;height:625px;"></div>
<div></div>
<div>几乎每个有历史的品牌都喜欢回溯历史，每年会出一些自家经典腕表的复刻款，既然你那么喜欢复古风，不妨多去留意一些，往往每一款腕表都伴随着一段动人的历史。</div>
<div></div>
<div>腕表本就是“从那个年代”的上流社会流传下来，绅士气质和社会发展浓缩其中，无论如今的腕表市场如何丰富多样，腕表的基础设计依然保留最原始的绅士记号。复古腕表不单单是时尚潮流的形象追求，其中更大的意义是品牌摸索历史的原路，重新把曾经轰动一时，充满悠久历史文化和价值的手表设计带给爱表之人。</div>
<div></div>
<div>总的来说，复古腕表有很多经典元素，比如<a href="https://www.wbiao.cn/breguet-watches/" target="_blank"><strong>宝玑</strong></a>针、轨道式刻度、玫瑰金、扭索纹等等，不过每个品牌都有自己的复古元素，也不能一概而论。下面这些复古风腕表你可以好好挑挑。</div>
,7)

