-- MySQL dump 10.13  Distrib 5.6.14, for osx10.7 (x86_64)
--
-- Host: localhost    Database: elections
-- ------------------------------------------------------
-- Server version	5.6.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adminkeys`
--

DROP TABLE IF EXISTS `adminkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminkeys` (
  `election` varchar(50) DEFAULT NULL,
  `pk` varbinary(3072) DEFAULT NULL,
  `sk` varbinary(3072) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminkeys`
--

LOCK TABLES `adminkeys` WRITE;
/*!40000 ALTER TABLE `adminkeys` DISABLE KEYS */;
INSERT INTO `adminkeys` VALUES ('test1','0‚¢0\r	*†H†÷\r\0‚\00‚Š‚\0„Eñ}ŞÒÓ=<5<ú]›<GÅËÕ˜èRÏ»ÜôØù/Gi‚ŸªëÈÈÇb6£)Òó)(çÔöÖ›ÒÊÀ2R$,)ó‚ğ+¡„9êö1hhp­\\Ùé˜.—N5~;\\ä9±°‰Ë$åÆÛKã_kn°I²G€ËÑS7ï¤ÍQñÈUå²\ZGoxy|»~]Z\n–ü±y¥ª¼VœÈg†‰#.Ù7îŸb?fö/÷RÛÖÖY.m\ZTw§m#û›>>‰¦›¬(Ó,uø¢i¿†ÅØ‘ø³S	¢§½ÆÓ¡®|E€¯-jˆsaí¼…<Oã\"×‡±ßxü¤Œ^ÿ¤4ªŒtØ÷†\0í=-AaZĞ`ÛÔ½aº2£zÚ$šƒ‰Uü\nÇË¢ûiÿm²F×r…Äá2M„HN„[£ÏYğûú[ÖC€¤ı¬ò*È¹-t94§+°¿•£XRxjŞxŞQAwìĞæôæa\\{ì…	våD½\0','0‚ş\00\r	*†H†÷\r\0‚è0‚ä\0‚\0„Eñ}ŞÒÓ=<5<ú]›<GÅËÕ˜èRÏ»ÜôØù/Gi‚ŸªëÈÈÇb6£)Òó)(çÔöÖ›ÒÊÀ2R$,)ó‚ğ+¡„9êö1hhp­\\Ùé˜.—N5~;\\ä9±°‰Ë$åÆÛKã_kn°I²G€ËÑS7ï¤ÍQñÈUå²\ZGoxy|»~]Z\n–ü±y¥ª¼VœÈg†‰#.Ù7îŸb?fö/÷RÛÖÖY.m\ZTw§m#û›>>‰¦›¬(Ó,uø¢i¿†ÅØ‘ø³S	¢§½ÆÓ¡®|E€¯-jˆsaí¼…<Oã\"×‡±ßxü¤Œ^ÿ¤4ªŒtØ÷†\0í=-AaZĞ`ÛÔ½aº2£zÚ$šƒ‰Uü\nÇË¢ûiÿm²F×r…Äá2M„HN„[£ÏYğûú[ÖC€¤ı¬ò*È¹-t94§+°¿•£XRxjŞxŞQAwìĞæôæa\\{ì…	våD½\0‚€8·XîÎ\'_k¡X¢f]ˆ(üø\"úP}Œ ŒL1²\Z\Zö«åÊ¾LÂX)–†Ç‹«±èîöo\nnš¨•keçÇLÿ<ÜÖ…ÁÖÆ ]åsö¬pÍ_‹&fÀx1ÎŠ\'_BÜeT¨’ yhx•Ğôd¤Ç(u˜r0Û´Ï¾DÖù\r4¼İ)ºéZ*nŒø+ÊÜÒ:uÊè[F8‰/qÎñë›\\ÎêûÏ$Ë8ÚBÏr>òêgêÑdàÂt¨íl0´x«Íí¦t;ñ5:…¹Ë{uşøÙÒVí€4ñzç4´µyRô~R,mã°ó\0ö}Ø\\æHCÉ$‰’ëÉ.>6‚ ÿ\\]}Ğğ›l‘@B5¯.âŠ¬€¡Ã)ãŠ”¼2Ær¶<Ø!Ù…i¶íÛ‹#”VÅ›G&İ=òRïY˜¤Ş\n>ˆGèèÑØÉWå™—`R…*Æ˜õG5Ôóæ&ù!Ï“™*ru@Ê*ñR»o£áÁ\0ÉÈv¿ğ)~ÿ-[$®\nìİÏ)ÅF:ËKTeÛ¾	uq14x·2 µÅ‚´Ş‰-AÂ¹‘†ãÈ‚R¯Fø¢uK•»=Ğ›£Jeº¬&;#$«\'HõÄÖz7\Zº—lP×¦ó	Y¯\rªYVN`TëÚP?\0ZŒHJ)zâÓ³¡ŒdQ„lÙ_|13!j“#ÁòMJÇ²Ogí£È£¼kÛºMNI[|GÙ«ønXÑ	éÂ‚c9gá] óÙC…Á\0§ĞH%Ì\nÊrE>ì27OÊô€üR˜*§12OÍËÉj	v¦ÁÃGN¥¨Şx‰›|D1›•Ù§«Ëq.Çx‚êœÕ˜mÃ1):wò>°£Ì–ùCnç\nÇ‘°3ñòÑcä @û\'ÆP°¢†ÏA‘RÜæ¹u{œ‹®ç”×S\"æÓñL\'ÿ÷·˜ ®÷&T{¬¨—¨Ô¬ûV¶~­‹#ÍÅk´Ò¨Z4áâı® ]ñ«—`ÀD}Ã´xE=ÊA8ÙÀ1âwIL‰ò÷ù’eÜ™–t‚µKxy¿a™·øV%S#ï~ŞU+–õÓ92öS:Q8Â+éHYÃÖSk½d{ ÀòñidË5aM)* p¾\ZeüÚ„Y7TÛ¦Cû*uAœL)´Í*X#’Ê¥ÌAr=ñÉS\\Q¨åpÄõéI[ÅËK´¼uEX»ŠHÊÇæGØzÂ„£8âÆÕƒÄj¡¨Xú‡¢\'à…u¸c?]â»^©§\n(Tñ²—Aº)Á\0–@ÈZR4RImf¼fíİTÓıomKìû\0˜1¤POÏ›¢\r…B8iİ<l[W‘NÿdkÕyF£P‹+Ôáİá_oØ -cG\r’wä§•Ñ/Ê¯.>×WæLD‚’öÄ~ˆi½í—”Ä™P¿\Z`Õq›ªùÌÂÕƒ÷å6|À¦ø_h×Õ_6hÎpQ²Qÿ¹†»90‰¼hş{K_’íùÌ4åwîå{a–BÃ‚s“È¿]sniÁ\0œ•ÊŒ„Ì:T+ôŞÊ°¤\n–)OwÀŠ\'ó(íÁ°üíw~µ=@ÕëeuQ]V’¿,C5g1ãCôúé\n¬@^el`ß¥m7íqO(/®£šª—ƒ™Øæùh	µ4‹$p.»ßOíüU©<ÓÉéş¢<§é¯>!±Ç2m4U Åä6Ä¶ÏÅ„¾hÈ6MdÄÛ/>fxÒAæX4nÃ¯!Ğ8g`™?E¼\nhP!”I. ŸvûŸTSÅÒMZn');
/*!40000 ALTER TABLE `adminkeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidates` (
  `election` varchar(50) DEFAULT NULL,
  `candidateSet` varchar(200) DEFAULT NULL,
  `numVoters` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES ('test1','a,b,c','3'),('test2','a,b,c','3');
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elections`
--

DROP TABLE IF EXISTS `elections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elections` (
  `usernames` varchar(20) DEFAULT NULL,
  `usertype` varchar(1) DEFAULT NULL,
  `test1` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elections`
--

LOCK TABLES `elections` WRITE;
/*!40000 ALTER TABLE `elections` DISABLE KEYS */;
INSERT INTO `elections` VALUES ('sfrink','1','1'),('test','0',NULL),('calvin','1','1'),('user','1','1');
/*!40000 ALTER TABLE `elections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test1`
--

DROP TABLE IF EXISTS `test1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1` (
  `username` varchar(50) DEFAULT NULL,
  `encVote` varbinary(3072) DEFAULT NULL,
  `signedVote` varbinary(3072) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test1`
--

LOCK TABLES `test1` WRITE;
/*!40000 ALTER TABLE `test1` DISABLE KEYS */;
INSERT INTO `test1` VALUES ('sfrink','%„•¸Rê;sÓ…Iîe†c#Ø9N>k_½2`Ûà¯!_Ü¯Ì¢’[×iw1ÁÅRÛu\r„|ı2ÔÁßCvËjò•ÏŸÒàÖ¬™$JeiŠ°Õ@Tì`™vÌİ­Ğk*³5§¼Y´>Û‡7^Â§À;\rìâï	…ä¯FfY^O@ş·%”Oá©Öy²t”6»Šğ#4š‚\0e;÷«”\"¢³\ZZïAâíÄd¥î¤@ÿ[ë—„\0a£‹É:UTuñgŸOù‡E¹,f_¦^¹/¸k¾3]LGGö¢PãœûuÑ* İ_~ğÇ¯U±Q«&È¤ŸK\Zg°Ÿî9”Î¦/vÌÒ%©+€lo\'Û®,Ş³X\Zd_F™!Ñ²}ò0Ù…yL¡RäğkêQÂÌè qt ÕÑğƒ¾ü¿\nUšFñ`ÜÂ‹•%Uvœ¥@Åá™U+y(í¯‡2ÿİÇ†úc<j<‹…I','S{heá&ñQ‡wªxÄ×æìÏÑ-)‚ëîxÊ.âŠW•\\X;´E@|Ÿ±	‰oVNÆ+VUZµŒ~c±\'ÅèüCî[áë¨JÊ÷á²è²ALÿûÒø²	ÏñŒ0šw”µ^\'ˆ\n0(yóO”ØÀ|%f¤³f3,Ã¯½‚“*õv•aÎß°Úøæeëí,\ró5ijwûëŸ¸uÃzD1³Äÿ*~ØJúfè¤%€+[RĞ\n>õÇàX	2ßBÏ’ÉVAËùÎ6 şæf$±£7gy±%›ÏW)††¨TI0ñ/D8š±mWÑítWPãMß½¢¾vN\nP	æ[)R$´íc	Ìk!rR±{j•Àß–x$OÌ?5qB}qÓµ§LQÍ4-[?ô5Ë…²ÇÒz`Q]ü®R.G_2‹ª«õÛ^ÆïO\Zıì‹ãøuä%à€¤\0ï÷Ë‰½¦iØâíåDp–òüìëP¼d‚Ó0¢Ó>g£|@èˆ~£nƒ¬');
/*!40000 ALTER TABLE `test1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test1results`
--

DROP TABLE IF EXISTS `test1results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1results` (
  `vote` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test1results`
--

LOCK TABLES `test1results` WRITE;
/*!40000 ALTER TABLE `test1results` DISABLE KEYS */;
INSERT INTO `test1results` VALUES ('a');
/*!40000 ALTER TABLE `test1results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test1votes`
--

DROP TABLE IF EXISTS `test1votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1votes` (
  `nonce` varbinary(100) DEFAULT NULL,
  `encVote` varbinary(3072) DEFAULT NULL,
  `signedVote` varbinary(3072) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test1votes`
--

LOCK TABLES `test1votes` WRITE;
/*!40000 ALTER TABLE `test1votes` DISABLE KEYS */;
INSERT INTO `test1votes` VALUES ('z=°\n’ãåL2oÆ^å&8r¡','Fiìw—@qàÃMÙF$','v—ë€ë±Ò¤¡>¾M;@ŞÜ}¡¾¿üÅÚ9†9Ùf¼r\0Á¤‘0}Ã=sE0¸u;ä÷df×,’K·¾»â3mŒR»ZÍ†¥Å¢<C©wC½X‘ú{Mc5nÉhFl¬k´hèä…Ô¥ì&#» ÖäøÂ´­Q7\0Ë\\mø–)ÆÒ5ŠœÓâ¨ú*Èbç ÄËbçjk<}ÿ?èÅ*GËHeÉú¡hYìï fé¤ø\\­\\à˜iâÈidGnÜÆ»‘+c.Ä7\r³JpüE@³dq^ÛzÎµ5EÏxnäp:çbKŞÿh·:Y_ÚÊ˜BömäM[Ø~ÇµË4ã8ş9ñ÷”Ş\\î-­äŞ‡ÿ¾Ift0ñìB=øp‹Ûê!qø>ÃƒWÔ·çM?l³™n’[2ÎjÎµ8é‹‹¸D†%ßv> zƒ»‰\\bë‰]¡-Ø3­.tÚ6ÖÕC·‚~	nÔFCb·@WˆæeÄÿ\Z');
/*!40000 ALTER TABLE `test1votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('stevefrink','pw','sfrink'),('test','pw','test'),('spiff','hobbes','calvin'),('user','pw','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voterkeys`
--

DROP TABLE IF EXISTS `voterkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voterkeys` (
  `username` varchar(50) DEFAULT NULL,
  `pk` varbinary(3072) DEFAULT NULL,
  `sk` varbinary(3072) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voterkeys`
--

LOCK TABLES `voterkeys` WRITE;
/*!40000 ALTER TABLE `voterkeys` DISABLE KEYS */;
INSERT INTO `voterkeys` VALUES ('sfrink','0‚¢0\r	*†H†÷\r\0‚\00‚Š‚\06·æê\r´‘Ÿàë‡âª¸MÓÌº‘À×mG‚fP-QùªÑĞ^Gv¶Cš‘û‘Ôï\n*é¥oøí<b3#ú;XÚŒ~oÁdì·tÜmş¢g‰Ã¶¥w÷£0ÌIÒïÙµ™îÄšŒ¼ÜÿÜw@ÛÜ2íyäëé]şürá4ÿ6nÕœúÁ3ÉTÚ³ûFK©Ggu\Z •–#õµÃ{epèæ¹cÚQ±²¿ËÒi½`À@ƒäÕ\n>Ùl¼|‹4B.°%¨ÔO?#¢™ç}9ÒâÎÅTá4Â´ü™æzÿ+±ÆÿÕT >v!ú—0³(¦À,‡y[,>_ç¼×G`SucÎ¯Êy<°ŸßééD\n}™ˆ*zÓ39ˆ†Å©OeYc^_Õ™º¢·ğ†^;±ò•Ç\Zƒ\'“&ŞÅ‹.Ç¼ş¨pÏ•	/œì‚Ã‰K¸Õ)õ©ø´\'»â$·=³Ö…e‰U„®cº†Í`»®ue›z†Ç’3Ï\0³¢G\0','0‚ÿ\00\r	*†H†÷\r\0‚é0‚å\0‚\06·æê\r´‘Ÿàë‡âª¸MÓÌº‘À×mG‚fP-QùªÑĞ^Gv¶Cš‘û‘Ôï\n*é¥oøí<b3#ú;XÚŒ~oÁdì·tÜmş¢g‰Ã¶¥w÷£0ÌIÒïÙµ™îÄšŒ¼ÜÿÜw@ÛÜ2íyäëé]şürá4ÿ6nÕœúÁ3ÉTÚ³ûFK©Ggu\Z •–#õµÃ{epèæ¹cÚQ±²¿ËÒi½`À@ƒäÕ\n>Ùl¼|‹4B.°%¨ÔO?#¢™ç}9ÒâÎÅTá4Â´ü™æzÿ+±ÆÿÕT >v!ú—0³(¦À,‡y[,>_ç¼×G`SucÎ¯Êy<°ŸßééD\n}™ˆ*zÓ39ˆ†Å©OeYc^_Õ™º¢·ğ†^;±ò•Ç\Zƒ\'“&ŞÅ‹.Ç¼ş¨pÏ•	/œì‚Ã‰K¸Õ)õ©ø´\'»â$·=³Ö…e‰U„®cº†Í`»®ue›z†Ç’3Ï\0³¢G\0‚\0‡^¸]ûp7ğ:³“p)ë\'’9h©o™ª;.©H¿õ(<~¤3\0u½îL¨ô[¶äqÆÀ²näÙª…\r¥Á1Ç©“éüO2Öhév>~Š–L;£üDLhA¸Î²ùL\\X€äJYÍ±Zç\'Ê”äÉ=Ü±ÔÒî;CºİßèLì:Šõõ=@‰„óÙÊ)÷\0#l”“2…eÕ‘è&ı›W~·®sºOv˜Î*ıAƒ€µ«Eg°z>‰™åúó_\\>äíUåä „fñşVJMÅ s¥ëW­¡C(°ÑX¶°•{XÍµ‰÷ãt,R­é\'àï‹Ié¿e‰èÁ*ğÊŠn³´#ÎÏ«t™Ğ\'„b5›ª-â•†/8\\Z¶à+Ğ¹¶-(vÊy¥\ZÉ^¾Ü±‰ß\"\ZM¬m<Q•fHƒ@ä/7J#n.Ç»/ƒÄ]3Q‰kbzœpÉ*÷0ëİv’M\\ïØ¹…ŠÆå7]›à¯\0NÆhÊW»ßiAÁ\0Å¾¾…zs‹Æ\Zçæ\\béÀ¨ú7:¨‰ûB,	¥LKˆñ²ò¶è´nQ+\r—l|U£«¢–ªVoÿcC–_ÆæYu©ëkœª‹î°­ @7“›A2Á(x\0+QÎ³4¡Ş÷£–Ï¾¼¢…à	““Ô™©€d=M‰b§¿ÚÙ)(Ÿ«+¿Œ\r’á+w ÄuÆ•”Òäv¹ÿ*–Gy6y•Ù)|\"»7–oô/à—æmvùS—ÕÁ\0¶Ñ\ZZ¤!zíæ€zÆí¨>Úp—æ¥»š}ò#}W‡¾Hğ‹©èO´I°ä$h!«°Û[[~ğÇ‘iöœt[Nû†2áÆÍ\'[„Ÿ¦”åÁ¹\'[\"{,\0ßJb’]®jbYÓ£Û0ÉÖ\"yçƒF?‘ò\'°×*Å†s|3uUZjéUß4t„ÂWw>ö—b7çK¯U{&Op$8á`9À\ZpbCl”cİ+‰ÎÎCvÉ(•Er³p.Û«Á\0ŒD8¿¬¿\'§Fg_ˆ0\0yRµ%L\n±jÕÎoÒ#&IÑOEefÍ¡\rÎ¦ÇzØ€É«Wğú­Åªb2­±’Ğ~\0ßa«ÓW1÷ÎGÎaË:!îTL@@È|XÂ!ò1¤…º4Õ‚˜²ì]~cûNÇm}¹P²F1„Õ A?Ó+G°õ8ûSWÚçÊ“4§ğÊâÅ„û;í#[Ÿo1w)öÀ^êª	êÎ²»hkæ·œÂ1 ÌU’$Œ uxJ¼Ò\Z\Z	áÀkdjs÷/Å.‰Î›´XKÏÜº¤™r°;¶IW´NÈ5;Ÿ\'‚=Gr	°Ûv\"—2m›ĞFE]v\"s:ı¢¥äo:ÿØÄ6pBï´Ô\"QÛşE6í£¢ÚÌÀ}§ÈÔe&ÔO…pŒ¯?Ç­NSç¹p¸Ä\'Íè\04ÙEz¨*7^	|£ïÒœˆ‹yşÖ¹¡cN•ûæ‘P™²÷æ­çaì;caŒ%®Vuæß.î¹éó©[±»eÁ\0†DôjşºÍ]gñ¨v®iºk]Õkä@yê.7+dşìãÜœ>(ìÔR‚SÕ+#nõbk)öä½ÿp<û£xÀ¿İU€<Æ&üÌ*ÎøÎ/0èÓDNğ˜”}éÜy½Î ª71Ufü&7,*¢yF&Ã€vn™cçö†õé6TÌ”ˆ•q?/ğè9 WÑ±\nGg¥kÄbª(ZÌHx9»éæôÜ6`¿5tÄo´ˆC>LZ'),('calvin','0‚¢0\r	*†H†÷\r\0‚\00‚Š‚\0¥¤]1kA°ÃSÊı{&»0M@˜œ€&l	÷?¹D_ŞõQsğ&dD@3äğÆ~’¦VFµ£ŸvMSƒó×P„Ã[Cë®iÎ:MÖÁòÙYO–Ã‰dSngçw®GËOîãJ¼—y!X„ïÈ†\"6·(”|ªz\"¸öúŠ3yêKPTŸÑCúÙÃtQÙDªSÙ6ÅÁş¸ämŸÅ½\'½ƒË|\n® \0öî¸´1õè_~%j¼àóÒÔy‡ã\nÃ¯õ*ÿ\r-\0.E[wœóYt¡-9*ÔYqe ³\0Ë=|\0ŸŸÑ¥5Z{|ë3\r>h;÷º”m­¬Ñf_•òAË‡×¡î}€ƒº7\ndˆrk“Àh¦ØPÄÏŸèŒAµî²ì³Vt¶Ûï´Ğ²lü”Úõ‘tv[—¬†1t0ÆôÈ~³1ÇÒf½‘ŸYà›ÚëOK‘7\"ˆ ÷ÙŠèŒ3z;‰¬ŠS[n ¾z“D#›±\0','0‚ş\00\r	*†H†÷\r\0‚è0‚ä\0‚\0¥¤]1kA°ÃSÊı{&»0M@˜œ€&l	÷?¹D_ŞõQsğ&dD@3äğÆ~’¦VFµ£ŸvMSƒó×P„Ã[Cë®iÎ:MÖÁòÙYO–Ã‰dSngçw®GËOîãJ¼—y!X„ïÈ†\"6·(”|ªz\"¸öúŠ3yêKPTŸÑCúÙÃtQÙDªSÙ6ÅÁş¸ämŸÅ½\'½ƒË|\n® \0öî¸´1õè_~%j¼àóÒÔy‡ã\nÃ¯õ*ÿ\r-\0.E[wœóYt¡-9*ÔYqe ³\0Ë=|\0ŸŸÑ¥5Z{|ë3\r>h;÷º”m­¬Ñf_•òAË‡×¡î}€ƒº7\ndˆrk“Àh¦ØPÄÏŸèŒAµî²ì³Vt¶Ûï´Ğ²lü”Úõ‘tv[—¬†1t0ÆôÈ~³1ÇÒf½‘ŸYà›ÚëOK‘7\"ˆ ÷ÙŠèŒ3z;‰¬ŠS[n ¾z“D#›±\0‚\0#åE\\Úƒ¦RÂ¦À_\Zü*Ş˜}~ù\röV\\LdÒê—MáÊœ•Úâ‡ô—‚O4vF‡üñ\":uİ¹©cmKwÍQ©³Râj²öÔû;³¬‡³¤İ·D¡ú\nr[Ê\rÖÕğ\Z2…+™˜…³A\"cÚò#©zŠ;êÀî\06OĞ5éì;$P¤’W†ƒâ*POŒ‰\\ãÖ\"şÊ(íÒh¡ÑÄ+í’³MÑx/ù<“8ë¬o]>R(¡Kåõ(aã©||&|ìÛg–ÊH×/!Eöp	¨“²%ã#ı @$ËóÓBh…ŞSf<(½ßñŒˆaÒ|3şéøPÂ‚(ê‰…\0%`®ºZC¤Á+ ”YÛzhøG±dq³H{¬\\ôv2ï­;˜aqimb£hÓé±í)8½ƒt5ÎÆX=ºF°NKÀ]9¼«)£±¨’VìMƒ0	\\ÜÔŞ}	«©.n?j Á\0óAy?œµ“ü2€˜1ĞVBòÂ“š>iwN»qŞ\0ËöÏá/¢PX¨V+!TĞ²†wCœÉì¾hÓşü·‹pÀßh¡?÷Ñ =BzSÆ=\'AÄh¯\0ÿ#eÿ3Ãg§³ÌJ£|üì,‰V÷/bZ<@Ü™:o7ÂËh–İoXƒ¿€Y“êš$€wˆ›è\Z4ûé|G»ÀÊğQØ]•„vW“yû pXÕÈu\"^É]”bñöi¢•g•äøº³È™(Ú½±Á\0®Ry\Zß¾×öì¦Kå§×lÍò•:Wà]6ÄÇ„Yhs9Y7ÌÙ¡S¹N¢Gkún¥¦ı’¹^TøT]%x°Æô/ôæú_÷Ë›x?Ô~~;/_N>”Fæ\\U\rï MF¨Dû[usi¢\'n”İ,÷f‘µ9\Z_.@ï\r©z,#a¦\ZIªA„ˆD¯\'a,Ú¶õ—ò¯Óoğ˜ƒ¦øÖÄÉÍ‹:}\0ëVÿ\'`T¡N¦•LÊÅTØ>ÀrÅ“_ˆ)€4=¸fêP9×Äíc(\rùm„kx‹4;êr[£îÑË\'»‡*\"†\r»Æ‰¼ğ«GHJa`#[M\\è©JæË^N)P9<İañÏdJÃ±Í—\\¨h¦ õæ.èÏi\Z¢›ùd^tÕYÈF|X]K«i\0\0*Òêx0Ì‹§l~¸~¦T ìzè]zåµ/øÊPQ,ˆkZ\ZÄøö±iôp£ûÖ\Z”Ã>ROtÓaÀVC:2Ó‚Ñ1­°yåVÔş3ëü¤ü+Á¼låM=3z$ºÅÌÎï4-Éï© .+şQr-Şht>«¢¸RÖ6O\0/ƒ´\0E 2îR¢GØãdºÓÉÅ¢\0¨¨¡ ¿+°¤O”\r‰Œ•n+,™\'~»v\'SµK5ü¸.Õİş¶\r#ê4«Àa³\Z‡\r\Z÷ı˜ó¶á\n?…³&I£é gh¦Ä÷\n´Îi:GZ.WßNbü\r˜–b*ù°RUbÁ\0­\nNuÌzê‰ÖÅWßÛ\'bï·rhce‹ùÈİ¡B:%‘Yg7äªàÀrnqÉ¸‰\nÓkĞhzÍ¢7™ØÓYây§\nk#êˆÂ¬·×„’kR€Ò¡—´°C/QaD¢an(NÆ¬mXs÷læCùc$éòM¸U™éÁã›u5çwU—ïûïIä¢+ı¸9R±Ù)Û¢g£È\"X:yØ‰6ä¦ï\0IŒèîÕ0õ,L­xß'),('user','0‚¢0\r	*†H†÷\r\0‚\00‚Š‚\0ãŒ‚=ÂÄ§Q°²Ï&¸ko:aä¤$Àr]v2Œİ×¸«Ÿ…ôO{@¦t~ã:<a”YB¸öÆ ¤ÿ^Ä5–GHà‹=-5şh8gEK.U\nËú÷Õg·Ñ)œ[ÖØ_RÀ¦î@cE3ÛEÈ\\’ø=ÄÈ¸ÍÔà[Ø	Şjõ.¶…ßP¸GK«¥ìP‘²4®p92%d})¤û Op§ØaYPÂàé[NñÇÇÑ2óäæMLü¥ÒY.˜<Ø$.Gæ„lÈe~ :n“¾‘.©os ä×sâĞ®\rfN·Åg›ˆ\Zç!µı®ÖŸlì>[03üıËßr¡htø»‰ö9¹ÑÊtåt¡.¦ºy6ğ¤CŠèS±\n ‰ºaAşÁ\núq¤ia^·óoÒ\0êv\rÓ¬ŠiE¡ã‚Q¨õ2¼¨n\'=§zXûj¶¸vEÿ“ÅjOòW\"uú¨¶4LèA£+!´…‡¡dúõ\0','0‚ÿ\00\r	*†H†÷\r\0‚é0‚å\0‚\0ãŒ‚=ÂÄ§Q°²Ï&¸ko:aä¤$Àr]v2Œİ×¸«Ÿ…ôO{@¦t~ã:<a”YB¸öÆ ¤ÿ^Ä5–GHà‹=-5şh8gEK.U\nËú÷Õg·Ñ)œ[ÖØ_RÀ¦î@cE3ÛEÈ\\’ø=ÄÈ¸ÍÔà[Ø	Şjõ.¶…ßP¸GK«¥ìP‘²4®p92%d})¤û Op§ØaYPÂàé[NñÇÇÑ2óäæMLü¥ÒY.˜<Ø$.Gæ„lÈe~ :n“¾‘.©os ä×sâĞ®\rfN·Åg›ˆ\Zç!µı®ÖŸlì>[03üıËßr¡htø»‰ö9¹ÑÊtåt¡.¦ºy6ğ¤CŠèS±\n ‰ºaAşÁ\núq¤ia^·óoÒ\0êv\rÓ¬ŠiE¡ã‚Q¨õ2¼¨n\'=§zXûj¶¸vEÿ“ÅjOòW\"uú¨¶4LèA£+!´…‡¡dúõ\0‚\0¤Ê?¥g¶Oc¯;BI5o¿ò²Ì<ë¸ËšP\rOã!eF5c\'S«ÎIîŠ÷ş§hµmİ§¿àCÛî-vJÒğ¹ö9m×à>ÏÍ8u¹¤<ŸÏ{à9ÂŞ4õGsK7¿Š§\\\\v¯¨ğŸ\'Td}	OÏ£ôA–SP×!b6¼=ŠDÅ,“âƒi^øİ/Œ)ñÀF\'hØĞ2gÎÉyF´÷Û”Zƒè}®ÌáND\'pØZT3Cn\\\0u\"wöpEë9v;ÒiªÚ…êíËcYì`z“ Š¨‰/ìeb°¯Á÷LÒ¬6\'”OñK:MF˜(0Í¸İ×u\\¯D¨,1m”<Ñz¶½°†x9}Ëu^ª\'è·XÑ{\nÌ\r¿|Ø.wÊOã6.OpõÛ\Zb yrrÔt,Ü41ı1ÑES¾N^]\'u—?{»Ó 9›#2âÙÀOL©…\\¢.®q\0Eê\Zn¥ÎdÃ§ô—İÂ«|¦¼Í¡²\'f9˜E©IÁ\0üL¨®j‡’¬—èôå^Ğ^­Ê¯y¬÷Êµry±Œ»J…˜=,­·dğ	Åó¶•Æ<…ù”!o\n¿>ÕX¡\\ŞÜt¯‡#Knf‡²ó…fáõU‰2:\Z%l¢SÛA—ØQÔô„dß)³%­ûÆ®%OíÖsJãÔçF#õ×J>º\n‡¢?•7_ò<°„¼õáîŠñbI7º˜¡Ê˜„ã gnm È1¢%H¼İpJ»\n«â¿ğ³ş9MK‡Á\0æâzE’LĞ-1}ş° æºÛÄ„]¤í\nBË–i&KœçEÒ®…Â(ó}qâ¼¾¼‘Ä÷÷¢\"É–Š,&Ø(‹wäíš\rê¶%,Ø9cH	Éù‚°HXBg^\Z	)Ù|—cŸoÈõä \râ•Wôƒa·ÈÔda5Š4~!«ñiRwãPº2¨¹ÔÑ\n†ÍK0ƒÈŠ×sæšÂ~Ål4nÎ¡{ó³Cñ¡f1.\"C\Z¡VgªŞjV§¥èƒÃü£À]¼©‹+¿5\ntâ3ÜeN¨#>ğÉÃCˆ™«ô\0%­1ùnù¹ˆ\núÆ–Ç,±fò+ÙVì:CÁMåpSòˆßû£’†ü-fv\"$0¿GÎC³™z¥,:¢´Ëˆõ«Q)Š	Eìs5­çl•§D`Œ­¹ P«ÔO²CGP,–eÊÛ]€CÚ6Y]Î›Â¼PÆ;Ñ\Zïò¢õí“ù7*|×kÅd\Z‚¦v÷sGvä™H/Á\0Û°M¿UËkBZÆ}LÿOVä5YYpmu®şá%&b8úPaŒÖ¥Eâ›5Êûàn)ádp“7K•§ÓBDºWı9Zx?ˆ1g€›–TFQ²ç·¾»XRA€ö*“az|¬4D_·¶Œ|)+‚Éë%Tñ\'Ég±Á—Œ <¸†¥ào\"F9£ĞFÎ­||äùš7eß®ˆj¹-ËùÌ!³5g²Ó¼æwU¬’/GÿWÑÉ(v6\ZIØÉÁ\0¤şí¦Å*}\Z±ã\nW1ÖKã£ß‡Ñæç…sù)ôp\0Cëõ¿\\îµ¼úrÀ<}S½Œİˆ¡”.ˆ®*7ÉğÀ ‰ÚYôı£†O²™Ü¤´Œğ•Ïæ©©Ú®º\rJlKPK2µ¦©¤É!yÉã‡*ª¬æÊ_Ìm$B·Ó/DëÓ€pm\0Pš¡Ó<¹ô:°òrj£[¥t^å·	c£?ƒÌ\0jv1¾ûO	`ŸH·gà0óÊv;');
/*!40000 ALTER TABLE `voterkeys` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-22 18:14:16
