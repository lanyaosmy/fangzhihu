/*
Navicat MySQL Data Transfer

Source Server         : apple
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : zhihu

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2017-07-28 14:04:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `a_c`
-- ----------------------------
DROP TABLE IF EXISTS `a_c`;
CREATE TABLE `a_c` (
  `AnswerID` varchar(15) NOT NULL COMMENT '回答ID',
  `questionID` varchar(15) NOT NULL COMMENT '问题或文章ID',
  `userID` varchar(15) NOT NULL COMMENT '回答者或评论者ID',
  `answer` varchar(5000) DEFAULT NULL COMMENT '回答Answer或评论Comment内容，限200字',
  `answDate` date DEFAULT NULL,
  PRIMARY KEY (`AnswerID`),
  KEY `ownerID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_c
-- ----------------------------
INSERT INTO `a_c` VALUES ('A1', 'Q1', '13576669548', '<p>“奉天承运皇帝诏曰”</p><p>永远都被没文化的导演和太监断错句。</p><p>“奉天承运皇帝”是“天子”的一个高大上的花名，</p><p>“奉天承运皇帝诏曰”的意思就是“咱们奉天命统治四海的皇帝大佬发话了~”</p><p>请问“奉天承运，皇帝诏曰”是什么意思？</p><p>“走了狗屎运，今儿皇帝说了句话”？</p><p>敢情朕一直是哑巴。</p>', '2017-07-04');
INSERT INTO `a_c` VALUES ('A2', 'Q3', '13713628064', '<b>不错</b>', '2017-07-06');
INSERT INTO `a_c` VALUES ('A3', 'Q4', '13813481135', '火锅，串串，冒菜，烤脑花，钵钵鸡', '2017-07-09');
INSERT INTO `a_c` VALUES ('A4', 'Q1', '15528036619', '<p>演员表现心脏病发作时常常是突然手捂胸部倒地，表情异常痛苦，但是现实并非如此。英国每年约有25万人突发心脏病，其中三分之一由于未能及时送入医院救治而死亡。在心脏病发作后1小时内进行救治最有效，但是，人们通常在心脏病发作后1个半小时才叫救护车，因为之前他们一直在等待疼痛自然消失。人们需要知道，现实生活中心脏病发作的症状通常比较缓和，并不像电影中表现得那么剧烈，电影情节可能会误导观众，以致观众忽略心脏病发作症状，影响救治。</p>', '2017-05-25');
INSERT INTO `a_c` VALUES ('A5', 'Q2', '13813481135', '呵呵呵呵', '2017-07-12');
INSERT INTO `a_c` VALUES ('A6', 'Q2', '13713628064', '<p>《猪猪侠》有一部是讲和反派比各种体育比赛的，每次要输了的时候主角拿出“超级棒棒糖”一舔，马上领悟了一套神功，逆转获胜。</p>后来想想这不特么就是磕了兴奋剂吗！', '2017-07-26');
INSERT INTO `a_c` VALUES ('A7', 'Q4', '13813481135', '饿了', '2017-07-28');
INSERT INTO `a_c` VALUES ('A8', 'Q1', '15528036619', '<p>其实，从医学角度来讲，“直系亲属不能相互输血”是一个再简单不过的常识，因为直系亲属之间输血，容易引发移植物抗宿主疾病，而这种病的死亡率高达90%以上。一般来说供血者体内的淋巴细胞会在受血者体内迁移，进而攻击受血者的免疫系统，受血者的免疫系统会将这种淋巴细胞识别成“异体”加以排斥，但是直系亲属间有部分相似的遗传基因，所以在受血者免疫系统低下的情况下极难识别供血者的淋巴细胞，便会导致供血者的淋巴细胞在受血者体内增殖。</p>', '2017-07-18');
INSERT INTO `a_c` VALUES ('A9', 'Q2', '13576669548', '<p>海绵宝宝和派大星玩水摔到了动物园水坑里。</p><p>一个鱼宝宝看到后问鱼妈妈，“那些是什么动物啊”</p><p>鱼妈妈答，“<b>那些都是废物，他们都不是正常人！</b>”</p><br><p>原来，不符合正常人价值观的人都被当做废物，这不正是社会上对于怪人的理解？</p><p>直到有一天自己变成自己讨厌的那种正常人人，我才知道为了得到这人们口中的正常，失去的东西也很多。</p><p>小时候看不懂只是觉得好笑，觉得海绵宝宝傻得可爱，长大后却觉得眼睛发酸越看越可怕。</p><p>“<b>我想把我自己的个性变得很圆滑，结果全身也都圆滑了，现在我超正常了！</b>”海绵宝宝这样说。</p><p>当一天天自己磨去棱角，自己变得世故圆滑，学会见人说人话，见鬼说鬼话，学会装模作样，学会机械地进行社交，学会那些自己为是的套路，发现自己就这样平平淡淡地长大了！却又惊心动魄地错失了很多很多！</p><br><p>情节来自第105集上半部分 我不正常</p><p>海绵宝宝想要变一个正常人 于是变成这样</p><p>这还是海绵宝宝吗？</p>', '2017-07-28');

-- ----------------------------
-- Table structure for `guanzhu`
-- ----------------------------
DROP TABLE IF EXISTS `guanzhu`;
CREATE TABLE `guanzhu` (
  `date` date DEFAULT NULL,
  `userID` varchar(15) NOT NULL COMMENT '关注人的ID',
  `beigzID` varchar(15) NOT NULL COMMENT '被关注（文章/问题/人/话题）ID，由ID号首字母区分类别',
  PRIMARY KEY (`userID`,`beigzID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guanzhu
-- ----------------------------
INSERT INTO `guanzhu` VALUES (null, '13576669548', '13713628064');
INSERT INTO `guanzhu` VALUES (null, '13576669548', '13813481135');
INSERT INTO `guanzhu` VALUES ('2017-07-28', '13576669548', 'T1');
INSERT INTO `guanzhu` VALUES ('2017-06-13', '13576669548', 'T2');
INSERT INTO `guanzhu` VALUES ('2017-07-28', '13576669548', 'T4');
INSERT INTO `guanzhu` VALUES ('2017-07-28', '13713628064', '15528036619');
INSERT INTO `guanzhu` VALUES ('2017-07-23', '15528036619', '13576669548');
INSERT INTO `guanzhu` VALUES ('2017-07-05', '15528036619', '13813481135');
INSERT INTO `guanzhu` VALUES ('2017-07-25', '15528036619', 'A1');
INSERT INTO `guanzhu` VALUES ('2017-07-25', '15528036619', 'A2');
INSERT INTO `guanzhu` VALUES ('2017-07-25', '15528036619', 'A3');
INSERT INTO `guanzhu` VALUES ('2017-07-27', '15528036619', 'Q1');
INSERT INTO `guanzhu` VALUES ('2017-07-28', '15528036619', 'Q2');
INSERT INTO `guanzhu` VALUES ('2017-07-28', '15528036619', 'Q3');
INSERT INTO `guanzhu` VALUES ('2017-07-28', '15528036619', 'Q4');
INSERT INTO `guanzhu` VALUES ('2017-07-19', '15528036619', 'T1');
INSERT INTO `guanzhu` VALUES ('2017-07-06', '15528036619', 'T2');
INSERT INTO `guanzhu` VALUES ('2017-07-15', '15528036619', 'T3');
INSERT INTO `guanzhu` VALUES ('2017-07-08', '15528036619', 'T4');

-- ----------------------------
-- Table structure for `q_p`
-- ----------------------------
DROP TABLE IF EXISTS `q_p`;
CREATE TABLE `q_p` (
  `q_pID` varchar(10) NOT NULL COMMENT '问题或文章ID：问题编码以Q开头，文章编码以P开头',
  `userID` varchar(15) DEFAULT NULL COMMENT '问题或文章的提问者或发布者ID',
  `title` varchar(100) DEFAULT NULL COMMENT '问题或文章标题',
  `content` varchar(10000) DEFAULT NULL COMMENT '问题或文章内容',
  `topicID` varchar(10) DEFAULT NULL COMMENT '问题或文章所属话题，只能属于一个话题',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`q_pID`),
  KEY `ownerID` (`userID`),
  KEY `topicID` (`topicID`),
  CONSTRAINT `fk1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`topicID`) REFERENCES `topic` (`topicID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_p
-- ----------------------------
INSERT INTO `q_p` VALUES ('P1', '13576669548', '有一种道德绑架，叫“年轻你就多干点“', '<p>小D辞职了，直到离开的那一刻，他依旧很困惑，还是很委屈。</p><p>小D是一名90后男生，广告学本科毕业后，就通过校招进入家乡的一家大型化工企业上班。这家企业是本地的龙头企业，也是上市公司，有员工3000多人，年纳税数亿元，大老板是当地的政协委员，经常在电视上亮相。</p><p>小D的工作岗位在企宣部，具体负责企业文化建设和企业对外形象宣传。这个部门有20多号人，经理是老板的小舅子，基本不过问具体事务，主要的负责人的企宣部的主管。这是一个40多岁的中年男人，为人严厉、不苟言笑。</p><p>1</p><p>上班第二天，小D就挨骂了。</p><p>那天早上，小D正专心致志地在电脑前写方案，主管不动声色地走到他身后，重重地敲了敲桌子。</p><p>小D一脸茫然地抬起头，看到主管板着个脸，严厉地盯着他。</p><p>小D战战兢兢地说了声，“主管早上好。”</p><p>主管没回话，直接问他，“你为什么不帮我把茶杯里的水换掉？还有，我桌边的垃圾桶，为什么没有清理过？”</p><p>这下小D更茫然了，他表示自己不知道这个规矩。</p><p>主管很不开心，却也什么也没说，转身就走，还边走边喃喃自语，“现在的年轻人，越来越不懂事了，个个都跟大爷一样... ...”</p><p>过了几天，小D在工作上遇到了一些疑问，主动跑去找主管请教。主管当时正在打电话，小D就在一旁静静地等着。过了一会，主管电话打完了，还没等小D说话，他就很生气地说，“你怎么回事，别人打电话的时候，不知道要回避下吗？还在旁边听着？”</p><p>小D心想：都在同一个办公室，你说话声音这么大，我在自己位置上都能听到了，还有什么好回避的。</p><p>不过他没有当场反驳，还是低下了头表示歉意。</p><p>然后主管说，“找我有事吗？”</p><p>小D说，“我现在在做新项目的品牌宣传方案，想找去年的方案来参考下，几名同事都说没有，所以想问下您，这个方案您这里有吗？”</p><p>主管说，“干嘛要看过去的方案？我让你看了吗？什么都套过去的工作，那还招你进来干嘛？我不给你这个，就是怕你被过去的情况束缚住思维。别总想着偷懒，要根据现在的实际情况，有针对性地重新写一个。”</p><p>小D才刚刚上班不久，就被这样批了一顿，心理很不是滋味。不过他也早听别人说过，这个主管的旧式师徒观念很重，对待新人都是这么劈头盖脸地骂。所以他只得说一句，“那好吧，我回去再思考一下。”说完就准备回到自己的位置上。</p><p>主管显然还没说够，没等小D走掉，他接着又说，“年轻人工作要认真，态度也得端正。像扫地、倒水、擦桌子这些事情，都要主动去做。我刚来这里的时候，办公室里所有的杂活都是我干的，当时我师傅的衣服我都会帮忙去洗。你想想，你什么都不做，别人干嘛要教你呢？”</p><p>小D心想：我晕，我就是想知道工作的基本流程，又不是要偷学你家祖传的武林秘籍，至于这么藏着掖着吗？</p><p>当然，虽然心里这么想，嘴上他还是说，“好的好的，以后一定注意。”</p><p>于是接下来的一段时间，小D每天都很早到办公室，扫地拖地，端茶倒水。主管烟瘾很大，小D常常还得跑出去帮他买烟。就这样，主管依旧在工作上没有教他什么东西，只是把过往的材料丢给小D自己去看。小D学习能力很强，学了十多天就学会了这个岗位所需掌握的各方面能力。</p><p>2</p><p>小D所在的企宣部，并非公司的核心部门，里面的20多号人，很多都跟企业的各级领导沾亲带故，这是一家本地企业，老板和各级高管都是本地人，人情世故比较复杂。小D听说这家企业的效益其实并不好，只是作为龙头企业，作为该地唯一一家上市公司，政府必须得托着他们。</p><p>企宣部虽然有各种考核制度，每个人的岗位职责也都已经明确，但实际工作中却常常是搞“大锅饭”，做“糊涂账”。一有工作任务，谁有空就给谁干，谁能干就给谁干，谁最小就给谁干。</p><p>有一天，主管让小D着手起草一个营销策略推广的方案。</p><p>小D对主管说，“我是弄品牌文案策划，营销这块好像是另一个同事的工作吧，我不太懂啊。”</p><p>主管面露不悦地说，“哪有人天生就懂的，干多了自然就会了。年轻人各方面工作都得接触，不能老守着自己那份“责任田”，一定要全方位发展，做综合型人才。”接着，又噼里啪啦地说了一堆大道理。</p><p>没办法，小D只能接了这个活。后来他才知道，原来负责这一块工作的同事小E，平时不求上进，业务能力很差。这个营销策略推广方案，在宣传费用的管控和广告效果的监控上要求很高，小E想着小D是广告学专业的高材生，希望他能帮忙做一下这个方案。小E跟主管关系很好，所以就把这块工作推给了小D。</p><p>小D接过任务后，查了很多方案，加了几天班，还打一堆电话，向自己在广告公司一些同学请教，搞了好几天，终于拿出了一份漂亮的营销策略推广方案。</p><p>方案做完后，小D根据主管的要求，把方案发给了小E。接着就小E连改都没改，直接就报给了企宣部的经理，就是那个不管具体事务的、大老板的小舅子，而且他提都没提是小D写的。经理看完方案后，大加赞赏，认为这是这些年来企宣部写过最好的方案，还在部门会议上表扬了小E。</p><p>那天会议小D也在，看着自己的劳动成果被别人赤裸裸地窃取，心里很不是滋味，却又无可奈何。</p><p>3</p><p>很快，小D这个年轻人能力强、素质高的美名就人人皆知了。可这个美名，还真不一定是好事。</p><p>一次，企宣部有个品牌合作方案要跟广告公司对接洽谈，双方约定的时间是晚上8点。这家广告公司特别难缠，原先负责这项工作的同事不想去，于是他找了个借口，跟主管请假，希望能让别人去对接这项工作。</p><p>主管想都没想就同意了，因为他早已习惯周围这些人的作风。接着，他立马把小D叫来，让他晚上去跟广告公司对接，理由依旧是多岗位锻炼，全方位提升个人能力之类的。</p><p>小D那天晚上正巧也有事，有个追了1个多月的女孩终于同意跟他约会了。所以他面露难色地跟主管说，“能不能换个人，我晚上也有事... ...”。</p><p>主管盯着小D，冷冷地说，“你晚上能有什么事，连个对象也没有，不工作还能干嘛去？别人都有家有室的，走不开可以理解。你有什么理由偷懒呢。我问过了，其他人都很忙，就你去，具体要求已经发你邮箱了。”</p><p>小D特别委屈，但又不知道说什么，只能同意了。</p><p>接到这项任务时，已经是下午4点多，给他准备的时间很短，而且这方面工作他也不太熟悉。</p><p>他要洽谈的公司，是当地最大的一家广告公司，这家公司其实并不难缠，只是他们的谈判策略很厉害，而小D的公司没有这方面的人才。</p><p>小D由于对业务不太熟悉，洽谈的时候三下两下就被对方转晕了，期间他也多次给主管打电话征求意见，都被主管以各种理由推掉了，让他自己做主。后来谈了两个多小时，小D就稀里糊涂地就同意了对方提出了系列方案，然后双方约定第二天早上在公司签合同。</p><p>第二天，广告公司的人来到小D的公司，准备签合同。负责签字的是企宣部的经理，他看完合同后，勃然大怒，认为对方这是在坑自己，根本没法修改，只能推翻重头再来。广告公司则说这是之前双方约定过的事。</p><p>后来经理一路追查下来，发现是小D在谈这件事，于是狠狠地批了小D一顿，认为他的无知和愚蠢，损坏了公司的形象。还说这种事情再发生一次，就要小D滚蛋。</p><p>小D试图辩解，可看着主管和原先负责洽谈的同事也在旁边，担心激化矛盾，更怕自己有理也说不清，所以不得不吞下这一苦水。而主管和原先负责洽谈的同事则很有默契，两人秉持着沉默是金的原则，静静地在一旁看着，一言不发。</p><p>4</p><p>接二连三地受到打击后，小D变得闷闷不乐，工作时也一副愁眉苦脸的样子。主管发现后，专门找小D谈了一次话。</p><p>主管说，“小D，年轻人在刚参加工作的时候，受点委屈是好事，都说吃亏是福嘛，这也可以磨砺你的内心。多干点活也是好事，干的多就学的多啊，眼光要放长远，这些经历都是宝贵的财富... ...（此处省略5000字）”。</p><p>听完主管的敦敦教诲后，小D表示自己听懂了，然后就回到位置上继续工作。</p><p>过了一会，一名老同事笑眯眯地过来，朝小D打了声招呼。小D也礼貌性地回了一句。一番寒暄后，这名老同事说，“小D啊，听说你文笔不错，我们企宣部的半年度工作计划得上报了，我老头子哪会这些，你看看，能不能帮忙写一下啊？”</p><p>小D说，“可是我现在手头还有很多事情诶，您看能不能跟主管说一下，让别的同事来写啊。”</p><p>老同事嘿嘿一笑，说，“我已经跟主管说过了，他让我直接找你就行。”</p><p>听完这个，小D无奈地点了点头。后来小D才知道，这名老同事是这个部门的“老油条”，任何工作都会推给别人做，然后自己一天到晚跟部门经理吃喝玩乐。</p><p>久而久之，企宣部的人都知道小D“乐于助人”“精力充沛”，所以纷纷前来“锻炼”小D。有人请他帮忙写方案，有人请他帮忙搞活动，甚至到后来，有些人连自己的私事，都找小D代劳。</p><p>小D被弄得困扰不堪，但也不好拒绝，因为好多人都是打着主管的旗号，来让小D干活。后来小D忍无可忍，跑去向主管诉苦。主管依旧把他之前的那一套大道理，又讲了一遍。似乎给人一种感觉：小D要是不做这些事，就是年轻气盛，就是不够成熟，就是不求上进。</p><p>工作的第一年，小D就一直处在这种环境中，受尽“折磨”，苦不堪言。</p><p>很快，年底到了，公司要求每个部门都要留一个人负责值班，大年初一到初三3天就行。主管想都没想，甚至没有征求过小D的意见，就把他的名字报了上去。</p><p>后来小D知道后，想了想自己这一年的经历，又翻了翻自己的工资单，实在忍无可忍，考虑了一个晚上，第二天就打了辞职报告。</p><p>主管象征性地挽留了一下，随后便痛快地签上了自己的名字。</p><p>小D就此离开这个令他烦不胜烦，又无可奈何的是非之地。</p><p>小D的故事，每时每刻都在中国的职场里上演着。“年轻你就多干点”这一理论，更是如同紧箍咒一般，紧紧地束缚着所有职场上的所有新人。年轻人在职场上多干点确实没问题，毕竟年轻的时候，精力充沛，学习能力强，多一份努力，就有多一份提升，多一点付出，就有多一点收获。</p><p>然而现在有一种很不好的风气，有些人所谓的过来人，动不动就把工作推给年轻人做，并美其名曰加强锻炼，然后工作做出成绩后就自己揣兜里，出了事情就推给年轻人，致使有些年轻人在职场上学会的第一件事，就是如何推卸本职外的工作。那么等他们成长后，也很自然地会继续延续这一“奇葩传统”，形成凡事都由年轻人干的“职场怪圈”。还有一些不干事的职场“老油条”，将“年轻你就多干点”这一观点，作为自己工作中推诿塞责、得过且过的借口，凡事能推就推，能不干就不干，带动形成了一种扭曲的职场氛围。</p><p>年轻人多干事确实是正确的理论，然而再正确的理论，也需要有正确的环境去践行，否则就容易成为一种“道德绑架”。当前，更有不少人利用这种正确，来宣扬旧式的师徒传统，来掩盖部门的管理乱象，来满足个人的种种私利，致使年轻人频频成为莫名的“苦行僧”、无辜的“背锅侠”，委屈了青春，折翼了年华。</p><p>不要以正确的理论为名，让老实人总吃亏，让年轻人老心累。</p><p><b>PS：我的微信公众号：百越水木，每天一篇公务员日记，欢迎围观。</b></p>', null, '2017-07-22');
INSERT INTO `q_p` VALUES ('P2', '13713628064', '三百个职场人用生命来试错，换来一份经验总结报告', '<p>最近在忙着做三百多个人的职场个人发展问题总结。为了保持数据和问题的真实和精准性，每个人的人均问题跟进和解决持续时间为五个月。</p><p>结果发现人在职场遇到的重大问题，本质上其实就是两类问题。</p><p>1</p><p>第一类问题是一部分人因某种不足而被拖累，而往往这种不足因为个人的认知、素质技能或职场经验不够。</p><p>这类问题的发生主要是因为从步入职场开始，每个人的素质技能还达不到足够应对职场的所需，几乎每个人都是从零开始学习和适应职场规则， </p><p>职场掉坑的问题到底对一个人的影响有多大？ 其实每个从职场坑中爬出来的人，都会觉得掉坑这事好傻逼，一个坑要爬一年甚至几年，但是身在坑中的时候，却茫然不知，一个劲儿的徘徊。</p><p>职场掉这种坑的概率有多大？数据结果显示，初入职场五年，掉坑后需要一年以上才爬出来的概率超过80%，也就是说八成以上的人都经历过这种时间损耗。</p><p>举几个例子。</p><p>比如个人素质技能坑。在职场想要积累高质量的人脉，个人的行为方式是否符合高质量人脉认同的成人游戏规则就显得无比重要，因为不符合规则的人都会立刻被暗中边缘化，表面上根本看不出来，只能用以后漫长的时间来验证。</p><p>例如在职场获得别人的帮助，就一定要给别人回报。这里的回报不是指口头上“谢谢”两句就好了，是更具体的有价值的回报。每个人的时间和精力都是有价值价格的，别人的帮忙就是付出，给予回报就是对别人付出的尊重，应该的、免费的帮忙在成人世界的游戏里面是一个巨大无比的坑，虽然大家都在嘴上很赞成。</p><p>比如认知坑。在职场要升职或加薪，不仅仅是做好业务即可，往往需要满足两道三个优势积累，就好比一张桌子需要一块板和四条腿的最基本组成。期待做好业务就能加薪或升职只是单线思维，职场是更为立体的现实，由多个因素来决定。</p><p>比如个人经验坑。在自己个人积累还不够的时候，对自己的直属领导有威胁性权威行为，自己看起来没多大事，但是实际上问题很大，没人愿意自己的地位会动摇，往往被领导欺负的很惨很惨，甚至生活不能自理。</p><p>这类问题的解决靠的是经验、认知宽度和格局，尽可能的找老司机带带，减少试错成本。</p><p>2</p><p>第二类问题是属于机会、机遇类问题，能否找到机会和机遇，并把握好，将直接影响个人职业发展的重要环节。</p><p>知乎有个热门提问，问印度能否在本实际超过中国。好些担心的人会列举很多相对中国而言有利印度的因素，比如英语是通用语言的一种，获取西方信息效率高，跟西方的沟通成本低；中国发展依赖的人口因素将会被印度超越；因素的软件产业发展优势明显等等。</p><p>这些人的担心其实都没有看到问题的根本，没看到机会和机遇的重要性，因为即使是全球市场，市场容量也不是无限大，是一个有限的市场，每块市场都会对应一定的占位。当有人抢占了某块市场蛋糕的位置，做大做强，比如像淘宝，别人就很难再抢到相同的位置，只能找下一个市场发展机遇下的位置。</p><p>国际上也是同样的道理，在全球化的机遇下，中国抢占到了工业化发展的有利位置，成为全世界的制造工厂，目前的工业生产总值比美国都高，从以前的中低端制造业向高端制造业迈进，把高铁、造船都干了成了白菜价。这个时候中国已经占据了全球化的重要位置，其实印度要再想从这个位置把中国挤下去，就已经不可能了。从买家的角度来说，都有好的了，没人会忍受差的，不信你看还有谁会用以前的砖头快诺基亚。</p><p>同样的道理也试用于市场和职场，抢占机会和机遇同样重要。</p><p>3</p><p>抢占机会和机遇虽然重要，但是难点却在于发现和发掘机会和机遇。</p><p>比如特斯拉的创始人埃隆马克思谈及当初为什么要搞电动汽车的思路，他是这么思考的：电动汽车目前竞争不过汽柴油发动机汽车的主要原因是汽车电池组太贵，达到了每千瓦时600美元。但是电池组为什么会这么贵？制造电池组的元素是钴、铝等厂简单、常见工业材料，长期以来没可能被垄断，最终拼的将会是技术层面的上的东西。通过技术的发展提高效率，降低成本，甚至能把成本降到每千瓦时80美元，将轻易的打败汽柴油车。</p><p>这种“终极思考”的方法，同样也适用于职场。</p><p>比如通过分析公司的商业逻辑和岗位架构，就可以分析自己目前是否处于公司的核心岗位上，核心岗位和非核心岗位的发展就是高速路和乡间小道的区别，车子跑在上面速度肯定差距很大。</p><p>比如看清公司的晋升规则、领导的价值规则和周围的竞争对手情况，就可以对个人的提升空间有直接的预计，有空间就赶紧找点突破，没空间就赶紧换地方，找个适合自己的公司，不然都是浪费时间。</p><p>对于机会和机遇的错误判断，会影响一个人一年甚至几年的发展，职场真的是随处可见用生命在试错。</p><p>4</p><p>发掘机会和机遇之后就是抓住这些好东西，这个时候才是最关键的时候，因为玩的是效率，高效跟低效就是千差地别，就像《射雕英雄传》里面论物攻的话，洪七公跟江南七怪，甚至普通士兵的区别。</p><p>职场高阶抢占机会和机遇的玩法，就是职场战略。</p><p>职场战略是综合公司商业逻辑、竞争环境、发展环境以及个人优势等等综合聚焦突破，效率极高。</p><p>最有意思的案例就是，这三百个人的案例中，有几个人因为战略选择的精准外加机会好，做着做着，自动升职和加薪，躺着就赢了。</p><p>具体职场战略玩法鉴于文章篇幅的关系和下一期《价值一百万的职业发展开挂攻略》的需求，下一次详细讲述。</p>', null, '2017-07-06');
INSERT INTO `q_p` VALUES ('P3', '15528036619', '一份迟到的告白', '<p>【声明：本文请勿在任何地方转载，谢谢】</p><p>昨天晚上，我看到知乎一个问题下面，有人转了一个很老的段子，然后票数蹭蹭地往上涨，于是我写了评论说，这个段子以前在知乎就已经被转过了，而且拿了几千票，没必要再转一次，博上几百票，有什么意义呢。我的出发点，是希望知乎上的段子尤其是传滥的段子能够少一点，让知乎的风气能够变好一些。答主的态度倒是很好，说他也觉得不是很妥当，准备稍后筛除。没想到，后面跳出来几位知友，却开启了嘲讽模式，有人说“上面某位名人的评论让我看了感到恶心”，又有人说“本来我是他的粉，这次一看真是太装了”，甚至还有人说我表现出了“以前看过这个段子的优越感”。天，我真的不至于，因为以前看过这个段子，就会生发出“优越感”来，我真的没有这么廉价的优越感。然后我拉黑了这三位。然后我哭了。</p><p>我觉得很委屈，我不是仅仅因为这件事情感到委屈，而是因为一直以来，我在知乎上受到的误解、非议和攻击一起累加起来，所形成的委屈。</p><p>It‘s NOT fair.</p><p>我不是什么“名人”、”大V“、“大神”，在知乎上，我只是一个“分享者”，一个毫无保留的分享者。我在”采铜是谁？“的答案里说过，我“只是一个心怀梦想的小角色”，我没有显赫的背景、光鲜的职位、高端的生活、丰广的人脉，我也并非见多识广，我阅历贫乏到连国都没有出过。但是我可以保证的是，我在知乎上写下的所有东西都是我真实思考和情感的流露。从一开始到现在，我都是真诚的，我没有说谎，没有接受过任何营销合作的邀请，我总是一遍遍地读我写下的答案以便改掉任何可能的错别字、不够适切的标点符号以及文句不够通顺的地方，我真诚地回复了大多数的私信个人咨询，即便在发出拒绝私信咨询的声明之后。确实，我的某些答案，很容易被人当成鸡汤，可是你们是否想过，这些答案的背后，到底有过多少的彷徨、愤懑、痛苦和挣扎？在这些答案的背后，是什么样的人生？更何况，我写下了那么多有关方法论的答案，那些你很难在书本上找到的方法论的答案。</p><p>You don’t know who I am，and you will never know.</p><p>我觉得颇好笑的是，对于一个你不了解的人，为什么有些人就会这么轻易地做出评判，为什么有人会如此轻率地叫我”鸡汤铜“、”知乎陆X“？甚至有人，在”采铜是谁？“这个问题下面用图文并茂的方式对我进行赤裸裸地攻击和嘲讽。<b>这些我都忍了</b>。我一直很自信地以为我可以挺得住，以为我可以一直排除干扰，一心一意地去做我认为对的事，但是没想到，昨天，成了压垮我的最后一根稻草。</p><p>………………</p><br><p>我从小就不是一个幸运儿，到现在依然不是。去年12月，我曾在知乎上写下了一个答案：，里面有这么一段话：</p><blockquote>今年下半年，和以往不同的是，我开始不得不去思考有关死亡的问题。我发现，一个人的生命，真的只有放在一个更大的「格局」下，放在整个星球、放在整个历史中，才能真正去看清它的价值和使命。看完《地心引力》，让我久久不能释怀的，不是那个活下来的桑德拉·布莱克的角色，而是死去的乔治·克鲁尼的角色。我完全震惊于，在那样一种危险的情势下，他竟可以如何淡定如此平静地说话、聊天、开玩笑，最后，非常理性地，选择放弃自己最后一点求生的机会，挽救了自己的同伴。当乔治·克鲁尼往宇宙深处漂移而去之时，他的经度和维度消失了，他的时间消失了，唯有剩下他的灵魂，自由地漂移着，带着一个无法被打破的纪录，直至永生。他这个消逝的身影，既是科学的，也是道德的，更是美的，但归根结底，是哲学的。</blockquote><p>我不知道，有多少人，在看过这个答案以后，会发现一点点小小的异样：为什么我会说”今年下半年，和以往不同的是，我开始<b>不得不</b>去思考有关死亡的问题“？以及，为什么，我会为《地心引力》写下这么一段观感，为什么会对男主角的死有这么多的感叹？</p><p><b>因为，我是一名脑瘤患者，并且我已经接受了可能的最坏的结局。</b></p><p>在写下那个答案的几乎同时，我把我的签名档改成了”至关重要的事情是完成推进世界一点点的使命“，这是那个时候，我最想对自己说的话。老师不愧是一位优秀的心理咨询师，他看到我这个签名后问我发生了什么事情，很抱歉，我没有袒露实情，因为我不想让太多善良的朋友为我担心，对不起，动机老师。不过，在今天之前，已经有极少几位知友知道了我的病情，我感谢他们一直以来对我的安慰和帮助。</p><br><br><p>事情得回溯到去年国庆节期间，我因为过敏性鼻炎复发，鼻子堵得厉害，在老家的医院五官科就诊。五官科医生看了以后觉得比较严重，可能是鼻窦炎，建议我做一个头颅CT检查一下。结果照完以后发现鼻子倒是没有大碍，但是我的右小脑处有”囊性占位性病变“。真是”祸从天降“。随后我回杭州，去浙江大学附属第二医院，当时医生一看CT肯定地说是个”瘤“，让我马上住院。于是我住了进去，只有老婆陪着我，我瞒着家里其他所有人。我做完了所有的术前检查，核磁共振增强的检查结果也出来了，医生之间的看法有分歧，有人觉得是个囊肿，有人觉得是个瘤，但是科系主任的判断是：”70%的可能性是胶质瘤“。胶质瘤！我在手机上查了半天，了解到胶质瘤几乎是不治之症，因为即便手术切除之后极易复发，如果一个人得了胶质瘤，就几乎等于是迈上了不归路。</p><p>医生连手术的日期都排好了，就是四天以后，那个时候我很害怕，又显得很”勇敢“，我已经准备接受医生的建议，进行手术，跟命运进行殊死一搏，但是我真的不知道，这对我到底意味着什么。我做着各种想象，术前、术中、术后会发生什么事情；我想象着，电转是如何在我的脑壳上凿好多个洞，然后取下一块头骨……那几天我正与兄弟私信交流公益方面的事情，我在茫然无助之时把我的情况告诉了他，博闻是医学世家出生，他帮我咨询了家里长辈，然后建议我不用这么急着手术，应该去北京、上海的大医院看看，确诊一下，即便是做手术，也要找把握最大的医院去做。这对我是一个至关重要的建议，也许它改变了我的一生。我和老婆商量后决定出院，去上海华山医院。</p><br><noscript></noscript>“北天坛、南华山”，在国内神经外科界人尽皆知。到了华山，我们找到了一位国内知名的专家。专家看了浙二的片子后，说”可能是个瘤，但是偏良性，可以先回去三个月，三个月后复查“。我的心立马落了下来，好像是自己多赚了三个月一样。我对老婆说：”专家说了，我可以至少毫无风险地多活三个月，太好了！我又可以上知乎了！“</p><p>在知乎上我继续“肆无忌惮”地答题，我牺牲了很多休息的时间和绝大部分的娱乐时间，我写下了一篇又一篇“鸡汤”，我把签名档改成了”至关重要的事情是完成推进世界一点点的使命“。我跟</p><br><p>三个多月后，也就是今年一月份，老婆陪着又去了华山，做了核磁共振增强，片子中的阴影并没有增大，但是医生给的检查报告却写着”胶质瘤可能性大“。那位专家建议我们立即住院做术前检查，春节后施行手术……</p><p>在华山医院浦东分院的病房里，我是四名病人中年纪最大的一个，有两个男孩子20出头，还有一个在读高中……我不知道，为什么命运，会击中这么年轻的生命，为什么？？</p><p>病房里常常静的出奇，家属们偶尔会有一些交流，但都说得很轻，他们的脸上既没有抱怨，也没有笑容，然后就是沉默，沉默之后还是沉默。我经常走出病房，在走廊上不断地来回踱步，我不知道在这样一个环境里，我应该想些什么，可以想些什么，我应该放声大笑，还是大声哭号？一次我不知不觉走到一个手术室的门口，看到一个小男孩，剃光了头，被推进手术室，门口站满了大人。</p><p>”你家孩子几岁啊？“</p><p>”七岁。“</p><br><br><p>今年的春节好特殊，我终于把我的情况告诉了家里人，但与此同时我在知乎上给大家推荐了一款牛轧糖。</p><p>春节过完了，我没有回华山。这是我第二次做完术前检查之后临阵脱逃。我要继续”观察“。我不知道上帝还留给了我多少时间，但是我更害怕不受自己掌控的时间，我怕术后的复发，我怕术后的后遗症让我再也无法阅读和写作。于是不久前我写下了，最后我写道：</p><blockquote>所以，什么行为浪费时间？这是一个太好回答的问题。而只有等到你问自己「怎样才会感到来不及？」的时候，也许你的「时间」才真正开始。<br><br>而对我来说，我的「来不及」就是洞察和理解这个鬼魅的世界。</blockquote><p><br>真的，我怕”来不及“。我给自己开列了一份好几页的待读书单，我有一个庞大的写作计划，我相信我要写的东西没有人可以替代，我要”完成推进世界一点点的使命“，但是我怕来不及……</p><p>不过，这个“改进世界”的梦想我还是带着一点私心的，那就是，有可能我无法看着我的孩子长大了，但是我希望当他长大以后，能为他的父亲感到骄傲。</p><br><p>纳博科夫说：”我们的存在只是一道短暂的光缝，介于两片黑暗的永恒之间。” 这两片黑暗的永恒就是生前和死后的世界。<br></p><p>作为一道光缝，也许我不能让它更长久，但我一定要让它更灿烂。</p><br><p>所以还没有到说“再见”的时候呢，知乎。</p><p>——————————————————————————————————</p><p>六小时后的更新：</p><p>请大家不要担心，说出来就感觉好多了。我突然感到，每个人的生命都不是孤零零的，而是像大地上的无数条河流一样，有壮阔的汇聚，也有无可挽回的分流。今天收到的很多祝福，让我感到又和很多的生命汇聚到了一起。感谢所有关注我、理解我、支持我的朋友，感谢所有曾经给我善意批评的朋友。我在知乎的近三年收获了太多东西，知乎，以及知乎上的你们永远地改变了我。</p><p>我流着眼泪看完了这里的每一条留言，恕我不能一一回复，但我已经带着你们给我的能量，准备去过好接下来的每一天。我有信心。</p>', null, '2017-07-06');
INSERT INTO `q_p` VALUES ('P4', '13576669548', '如何评价电影《战狼2》？', '<p><b>这是一部很接近好莱坞工业水准的国产电影。</b></p><p><br></p><p>看完《战狼2》，给我最直接的观感体验，就是吴京老哥的这部《战狼2》极有可能是国产格斗战争片齐头并进、快步跟上国际动作类型电影工业水准的一个标志性代表作。</p><p><br></p><p>大学时代在课堂上，传播学教授跟我们讲起「主流文化传播趋势」时，就说到「主流文化」具有被强制扩散性，但是受众反馈度低。而小众文化（也就是我们说的「亚文化」）则具有极佳的传播效果，受众黏性高。想到这件事是因为，在《战狼1》上映的时候，在我曾经玩过的很小众才几百人这样的军迷圈子受到很热烈的讨论（正面反面都有），甚至两拨人就某国产枪械型号是否能与某国媲美这件事争吵了整整两天，以致我当时每次打开这个群都是999+条消息。</p><p><br></p><img src=\"https://pic2.zhimg.com/v2-919d327b9c973776918cf3e0568865e5_b.png\" data-rawwidth=\"1729\" data-rawheight=\"740\" class=\"origin_image zh-lightbox-thumb\" data-original=\"https://pic2.zhimg.com/v2-919d327b9c973776918cf3e0568865e5_r.png\" width=\"1729\"><p><br></p><p>不可否认，在调动自然流露爱国情愫上，《战狼2》是成功的，它在我不知不觉的情感代入里推揉了我的泪腺。当舰长青筋怒暴将憋在心中已久的爱国情感汇成一句“开火”时，男主冷锋独自潜入暴乱的非洲国家拼尽全力解救侨胞、身处险境孤立无援的那种英雄悲凉绝望感，瞬间倾倒而出。</p><p>叫一声「祖国」，在这一刻，有了最真切感受。</p><img src=\"https://pic4.zhimg.com/v2-2e0c7cd73857b516f2db097813bd8677_b.png\" data-rawwidth=\"1329\" data-rawheight=\"565\" class=\"origin_image zh-lightbox-thumb\" data-original=\"https://pic4.zhimg.com/v2-2e0c7cd73857b516f2db097813bd8677_r.png\" width=\"1329\"><p><br></p><p>以下有轻微剧透。</p><p><br></p><p><br></p><p><i><u>《战狼2》讲了一个怎样的故事？</u></i></p><p><br></p><p><br></p><p>在讲故事方面，《战狼2》的确有可圈可点的地方。</p><p><br></p><p><b>在故事完整性基础上继而挑破故事内核，直抵观众内心地升华主题，说白了就是让观众知道讲了个什么，并且能感受到点什么。</b></p><p><b>这很不容易。</b></p><p><br></p><p>故事开始，男主冷锋得知自己的爱人意外失踪只剩下一颗带花纹的子弹，得知这枚子弹来源于非洲某国，因此他开始踏上复仇之路。</p><p><br></p><img src=\"https://pic4.zhimg.com/v2-52a00b91efc2ff469ab7987593048c37_b.png\" data-rawwidth=\"1404\" data-rawheight=\"584\" class=\"origin_image zh-lightbox-thumb\" data-original=\"https://pic4.zhimg.com/v2-52a00b91efc2ff469ab7987593048c37_r.png\" width=\"1404\"><p><br></p><p>但我们知道，属于国家体制内的PLA尚且不能擅自出国，更别说属于特种作战小队的冷锋了。剧情在这里一个倒叙，原来是冷锋因为违反军队纪律而被开除军籍。</p><p><br></p><p>拥有自由身的冷锋才会在关键时刻，以前特种作战小队队员的身份进行潜入解救华侨。这个设定从前到后是逻辑自洽的，既可以解释冷锋独身潜入救援的动机，又可以解释故事中，为什么冷锋在遭遇来自欧洲雇佣军团全面压制的惨烈下，我方为什么不能做出救援行动。</p><p><br></p><img src=\"https://pic1.zhimg.com/v2-f1c01a0599e85a40b3cb249ece9b0c0c_b.png\" data-rawwidth=\"1729\" data-rawheight=\"720\" class=\"origin_image zh-lightbox-thumb\" data-original=\"https://pic1.zhimg.com/v2-f1c01a0599e85a40b3cb249ece9b0c0c_r.png\" width=\"1729\"><p><br></p><p><b>《战狼2》作为一部国产电影，具有很高的完整性。</b></p><p><br></p><p>完整性首先体现在故事上，逻辑自洽，观众知道在打什么，为什么打，其次体现在<b>故事内容展开</b>上。</p><p><br></p><p>故事内容的展开主要靠这么几个特点：  </p><p>1． 演技</p><p>2． 真实场景细节到位</p><p>3． 拍摄</p><p><br></p><p>看似简单的几个字，要真正同时做到很难。</p><p>比如说演技，吴京老哥真的是豁出命的认真——电影开头便是镜头随着吴京入海在水下打斗戏，到解决掉敌方自下而上浮出水面，整串镜头没有丝毫拖泥带水，连贯性在上—下、下—弧形围绕（围绕吴京打斗戏镜头）—上的双线依次展开下完整体现出来，也能看出来吴京式电影说干就干no bb的拍摄风格。</p><img src=\"https://pic2.zhimg.com/v2-0dba63438a5262d349a47ba2bfc015f5_b.png\" data-rawwidth=\"1729\" data-rawheight=\"720\" class=\"origin_image zh-lightbox-thumb\" data-original=\"https://pic2.zhimg.com/v2-0dba63438a5262d349a47ba2bfc015f5_r.png\" width=\"1729\"><p>而《战狼2》的制作场面用两个字可以概括：</p><p><b>大胆。</b></p><p><br></p><p>举个例子，欧洲雇佣军团头子Big Daddy展示自己武装力量时，打开仓库铁门是5-6辆坦克、7－8辆越野机动车以及多辆载有转轮机关枪的皮卡。我以为这里的坦克依旧像以往国产战争片一样是摆出来撑撑台面……</p><p><br></p><img src=\"https://pic3.zhimg.com/v2-41b59bedb9407ca438465a9037ba0a86_b.png\" data-rawwidth=\"1254\" data-rawheight=\"627\" class=\"origin_image zh-lightbox-thumb\" data-original=\"https://pic3.zhimg.com/v2-41b59bedb9407ca438465a9037ba0a86_r.png\" width=\"1254\"><p><b>没想到有真的坦克大战。</b></p><p><br></p><p>太tm惊喜了。</p><p>爆炸效果也毫不含糊，该猛炸的地方到位，到后面我都有些心疼那些被炸掉的汽车坦克</p><img src=\"https://pic4.zhimg.com/v2-590fd4d06bae98016cdc7fce691a0783_b.png\" data-rawwidth=\"1291\" data-rawheight=\"538\" class=\"origin_image zh-lightbox-thumb\" data-original=\"https://pic4.zhimg.com/v2-590fd4d06bae98016cdc7fce691a0783_r.png\" width=\"1291\"><p><br></p><p><br></p><p>且同样可圈可点的是，片子不是从头到尾的简单的打打打炸炸炸。不像某著名汽车人大片里人物对白与特效打斗完全割裂，人物对白又臭又长让人昏昏欲睡，打斗起来又毫无台词（或者台词real弱智）。《战狼2》剧情贯穿的情感戏起到了缓解紧张气氛，调节电影节奏的作用。</p><p><br></p><img src=\"https://pic4.zhimg.com/v2-ce1df7bce154d608deb06cddfb3fa4df_b.png\" data-rawwidth=\"1216\" data-rawheight=\"505\" class=\"origin_image zh-lightbox-thumb\" data-original=\"https://pic4.zhimg.com/v2-ce1df7bce154d608deb06cddfb3fa4df_r.png\" width=\"1216\"><p>吴京自己还亲自在某剧情处的BGM自己倾情歌唱了一首你敢信！</p><p><br></p><p>再叨叨几句。</p><p><br></p><p><i><u>《战狼2》为什么有「大片感」？</u></i></p><p><br></p><p>前面论证的演技、特效、拍摄都是组成大片感的一部分，对我而言，《战狼2》大片感最大来源于<b>「电影元素」。</b></p><p><br></p><p>《战狼2》不是一部纯粹的战争电影，也不仅仅是动作武打片，<b>而是一部多个电影元素交叉补充的类型片。</b></p><p><br></p><p>我本身就是战争片、动作片、剧情片爱好者，《战狼2》中很多元素的表达对我们这些类型片爱好者G点打得很准。</p><p><br></p><p>比如男主冷锋掩护几个中国人费劲千辛万苦撤到中国大使馆，尾随的反叛军在中立大使馆区的威慑下撤离的悻悻感，和《Hotel Rwanda》里费劲千辛万苦保护同胞的卢旺达大饭店里的经理保罗，有异曲同工之妙。</p><p><br></p><img src=\"https://pic3.zhimg.com/v2-10c1f1ddd27896438af3082cbb8af142_b.png\" data-rawwidth=\"1005\" data-rawheight=\"565\" class=\"origin_image zh-lightbox-thumb\" data-original=\"https://pic3.zhimg.com/v2-10c1f1ddd27896438af3082cbb8af142_r.png\" width=\"1005\"><p><br></p><p>非洲大陆上原始自然与战争交织的节奏感，想到了《战争之王》里男主尤瑞的安-12</p><p>被非洲原住民搬空的桥段（我恨影帝秃头凯奇一直演烂片，但是这部他主演的《战争之王》却是我最喜欢的没有之一）</p><p><br></p><img src=\"https://pic4.zhimg.com/v2-758f6d61c9adcd7ab86f3e24f62c5497_b.png\" data-rawwidth=\"954\" data-rawheight=\"634\" class=\"origin_image zh-lightbox-thumb\" data-original=\"https://pic4.zhimg.com/v2-758f6d61c9adcd7ab86f3e24f62c5497_r.png\" width=\"954\"><p><br></p><p>最后救援直升机被RPG从空中击落，也没有在国产电影中看到过，上一次看到是在《黑鹰坠落》。</p><img src=\"https://pic4.zhimg.com/v2-9e7d8a98295d7200d23a812190f6e9fb_b.png\" data-rawwidth=\"1216\" data-rawheight=\"683\" class=\"origin_image zh-lightbox-thumb\" data-original=\"https://pic4.zhimg.com/v2-9e7d8a98295d7200d23a812190f6e9fb_r.png\" width=\"1216\"><p><br></p><p>其实是我脑补太多，毕竟这样的场面、这样的故事设定，只有在好莱坞大片中看到过！</p><p><br></p><p>《战狼2》能感受到的是多种包括战争、动作、剧情等元素在内的流畅交织，元素与元素融合在一起，共同在中国题材下集中展现。</p><p><br></p><p>btw，这种感觉对我们这些爱脑补的人来说，也算是一点小小的福音。</p><p><br></p><p>作为06年就在网上冲浪偶然间看到《黑鹰坠落》便一发不可收的我来说，中二年纪希望的是，有朝一日能看到属于我们自己的军事战争动作片。</p><p>如果能拍好这样一部戏，让中国的大国气度在海外也能站得住脚，该是多么令人骄傲的一件事。</p><p><br></p><p>《战狼2》也许不是一部完美的片子，但一定会是国产电影走出国门，接轨世界的开始。</p><p><br></p><p>我很看好它。</p>', 'T4', '2017-07-28');
INSERT INTO `q_p` VALUES ('Q1', '13713628064', '电影或电视剧中有哪些常识错误？', '电视电影现在是日常生活很重要的一部分，但通常有不少常识错误出来误导观众，比如以前最常见的主角需要输血父母兄弟姐妹挽起袖子就上的医学错误，保大还是保小等', 'T1', '2017-07-05');
INSERT INTO `q_p` VALUES ('Q2', '13576669548', '有哪些小时候看不以为意，长大以后细思恐极的电影/电视剧/动画情节？', '<p>老版的《封神榜》</p><p>当时都快恨死里面那个祸害忠良的坏妲己了。</p><br><p>然而现在发现————<br>狐狸分明是个老实人呸！老实狐狸啊！！！</p><p>本来自在逍遥。</p><p>为了大领导一句升职加薪的口头许诺，就乖乖地去做凡间的麻烦差事了。</p><p>去了之后一直绞尽脑汁，致力于搞垮殷商的大业，时刻不忘自己的任务。</p><p>同去的同事耽于人间享乐时，她还提醒：“我们不是来快活的，是来做正事的。”</p><p>最终圆满完成了工作时————<br>大领导居然翻脸不认，把锅全甩到了她头上。</p><p>wtf ？！</p><p>什么叫“我只是为了满足自己的私欲，才去残害忠良？”<br>讲点道理好不好？！殷商气数未尽，朝堂上人才济济，朝野上下能人异士遍地。<br>我不去残害忠良，我怎么完成任务？！就这么干等着么？！</p><p>当然老实狐狸知道自己对耍流氓的大领导说什么都没用，只能乖乖认罪伏法了。</p>然后她就变成了祸国殃民的一代妖姬。<br>惨不惨？！冤不冤？！', 'T1', '2017-07-14');
INSERT INTO `q_p` VALUES ('Q3', '15528036619', '如何评价电影《建军大业》？', '今天看了建军大业的预告片感觉还不错，很多网友说演员都是小鲜肉无法用演技支撑起这部电影。所以应该如何评价这部电影？', 'T2', '2017-07-04');
INSERT INTO `q_p` VALUES ('Q4', '13713628064', '四川有什么好吃哒？', '推荐一下呗', 'T3', '2017-07-02');

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `topicID` varchar(15) NOT NULL COMMENT '话题ID',
  `topicname` varchar(100) DEFAULT NULL COMMENT '话题内容',
  PRIMARY KEY (`topicID`),
  KEY `topicID` (`topicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('T1', '互联网');
INSERT INTO `topic` VALUES ('T2', '金融');
INSERT INTO `topic` VALUES ('T3', '美食');
INSERT INTO `topic` VALUES ('T4', '其他');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` varchar(15) NOT NULL COMMENT '使用手机号做用户ID，一个手机号只能注册一个账户',
  `username` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `password` varchar(10) DEFAULT NULL COMMENT '登录密码',
  `touxiang` varchar(100) DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('13576669548', '陈可瑞', '123aaa', 'pic/touxiang1.jpg');
INSERT INTO `user` VALUES ('13713628064', '咳咳', '123aaa', 'pic/touxiang4.jpg');
INSERT INTO `user` VALUES ('13813481135', '哇啊啊', '123', 'pic/touxiang5.jpg');
INSERT INTO `user` VALUES ('15528036619', '岚爻', '123aaa', 'pic/touxiang7.jpg');

-- ----------------------------
-- Table structure for `visit`
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit` (
  `visitID` varchar(15) NOT NULL COMMENT '问题/文章/回答/评论ID',
  `zanNum` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `caiNum` int(11) NOT NULL DEFAULT '0' COMMENT '踩数',
  `hitNum` int(11) DEFAULT '0' COMMENT '点击量',
  PRIMARY KEY (`visitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visit
-- ----------------------------
INSERT INTO `visit` VALUES ('A1', '7', '6', '0');
INSERT INTO `visit` VALUES ('A2', '5', '4', '0');
INSERT INTO `visit` VALUES ('A3', '2', '2', '0');
INSERT INTO `visit` VALUES ('A4', '0', '0', '0');
INSERT INTO `visit` VALUES ('A5', '1', '1', '0');
INSERT INTO `visit` VALUES ('A6', '0', '0', '0');
INSERT INTO `visit` VALUES ('A7', '0', '0', '0');
INSERT INTO `visit` VALUES ('A9', '0', '0', '0');