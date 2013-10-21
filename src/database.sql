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
INSERT INTO `adminkeys` VALUES ('test1','0‚¢0\r	*†H†÷\r\0‚\00‚Š‚\0±Ò§‹³\n]M®ñd¬ÀÛüZNA+¿jt^†Í¼U\"T«yíÑ†äÓ@Æegl}´ð÷]þÙ\\¸ƒ4éŸCcË™®¿ñú÷9”ÓJ_¿á&sYm\ZRwE%4rŽÈoÓ×´ºÏ°¥púÄŽCê	Ž9Ç.cW-t2783€“Ëõ}h€“bP›8Ñ/ã’Æj7U\"¸WAu€¨H”ù‡nSsiÓyC¥\0HªšÝ—.k²G½Vqv²åYO|ý\"U¶hÕsÒÒµ\"^m¼\Z\ngV!šgçü‰Øðiƒ|LºT™6ÏZz¹§è4\"·$SÎ\ZWä¾ß‚vŸ„æ‡¸•\0p£ÊðÞJñ?=¶å5·áÍ	Åæù¤F(é}9¢µ29lùîŽ•ºû51ôÉ¬¼@‹“:+x4N|\0–¿_‹Yv	¸=’Þ¡3_ÿó;¨q6âJ:åÐË§†¦@0õ$ãµüx„C%ÂÓòðo:oýW$Ë\0y\0','0‚ü\00\r	*†H†÷\r\0‚æ0‚â\0‚\0±Ò§‹³\n]M®ñd¬ÀÛüZNA+¿jt^†Í¼U\"T«yíÑ†äÓ@Æegl}´ð÷]þÙ\\¸ƒ4éŸCcË™®¿ñú÷9”ÓJ_¿á&sYm\ZRwE%4rŽÈoÓ×´ºÏ°¥púÄŽCê	Ž9Ç.cW-t2783€“Ëõ}h€“bP›8Ñ/ã’Æj7U\"¸WAu€¨H”ù‡nSsiÓyC¥\0HªšÝ—.k²G½Vqv²åYO|ý\"U¶hÕsÒÒµ\"^m¼\Z\ngV!šgçü‰Øðiƒ|LºT™6ÏZz¹§è4\"·$SÎ\ZWä¾ß‚vŸ„æ‡¸•\0p£ÊðÞJñ?=¶å5·áÍ	Åæù¤F(é}9¢µ29lùîŽ•ºû51ôÉ¬¼@‹“:+x4N|\0–¿_‹Yv	¸=’Þ¡3_ÿó;¨q6âJ:åÐË§†¦@0õ$ãµüx„C%ÂÓòðo:oýW$Ë\0y\0‚€T¶mE‚(ÚÉæµþ×è	W#Ó”±Ù¢5=ÝÆG¡Ž6³e\rhÈX;¾û/úÜ/Ÿ1V-K$é+-¹jŠ8Ã>9ñFÈÞÝÇJ…¹5`ìÅ\0«z^óÙ‚ƒ[}œ?^š™t\"t=K‡;á—­e¬þ.Üä»M\"<®í\0ô!üŸª¿ü\nCä^ÑÀã-{ó‘­½˜E6ZÖP32²\\.ác\r‘1&»_°9O÷A!-euóv‡HÒ ´7!0ÂÁæ…R¨v*¥S;\'ËCY\0|WðµQ‰˜&­oÕ=|£Ð{`4*ƒûèpD”&Èò€m×¯,¥³Û9~‰8„k^^,0¹)­ë°ýNžvgÂLArØîWœUè˜Ûž7éáHˆÉN§5±=¡JÀÏ„EKÐÀÔ¬Ø^RDÂÝ\0ïûôræ‹«´ä:ÒI>Í¢¨®úïâ5ëÀžÙLŽF}†‹^ÐÆo’\nXjºd¶tL&»ü¼ëgÚÄ!»}ÀxÄ–±Ëš2r²õÁ\0Ü–ÖÊ:N±8˜Rà’ðú…-^MšÉ­6í`k@\0ùÞáñf áä(Ö®‡‘¹ûmhTõÕÑÔ¯½¡¼k	Ô—Kêh[ã¨Ä®>È²i9H*^Fº×3Vl¦[+êxÄ`ö\r÷À<j9ó[õg‘¬[»äW?]°ôæf~¡’pú=HüƒZ7¨¬ñ{§•M©ûEâ ÷iÕ®Ö½†\'º~88E¬„ ³ÝkçJ)Åf±Ë¼¢\\:&²M\nô+Á\0Î^RÅ\noòÖ³?ü/©£\ZÉ+¡\"–Ù–È±ö«3Ç&VLžgáJÆ­6¯OJ÷}aÌ1É)\Z‹AÄ×žkâIÀtËxAQà¸WcÉ»°C÷æcêçg9÷Fl‡	8\ZAßN¦\n$¡4 KLbiµ9… %Úî\ZšIú6bµ¥W#Ùìöß34É\"ÌŽÌÀ‚F¶ÿ9Œ€l5ÃnÕKRÛÌ•§ÝMU„N)¹€\Zâg‘ô¨,Êâ0ïmëÀXÙT¨]µæò0§ç´)¶Ì HGÉeÀRú\\ŠŒ\ZM1­†ÂEÚ¡çèií%ræ}cƒ%,ð*Ý	±·üí÷ÀñÉÙ7ØŠ÷Q:jtgÏSSÜl,*U&¿YÍ f›¨QmCì6¤ðÓfå¨LTÛ£…<JX&þh[¬|-Ú;DL™\'”u—;(Ð1ÝSDA¡Dp§+Oaå2ŒûÏSº—0c\n`vîíøÀ™µå’$£Ê«¿q:@E—â›ÿ%PÃÀ!+œ;ÕYtnÏº+vcB	(:lrÐ•ãþÏ„E9á<ÐÜ\Z_]ÒZôhÜÝTD„,Ö^8bLeõ\0ÐE13ñCj°´Pb¼gõË~\"cxÑ†7ä„ Õág·\"ì´éu°Ñ,—|8ìàœÖ€û»²åçÂØYHž™á‘€¹\n¿±1WlU¡¶Ì6oÆÉ©à$)óÌ{Ÿé^˜fãWrÁézCgäá*å¬ímDR|å7=í|sÊ½ÀjÕ21?þZ²}acz­œÐ8Åd_ô3=_í7º¢,¼\"ÿÎ8ËSÑ‹Ë´×w½oÊØâØÉìZGôDœ¿r˜¿ûðèøCÚwè¦Í’KIp¸ð<óy“Ò7?lŽ¯”Zž…	)ó®È’ù„—SDcæ#˜qÅIsx›xt.ùN¶f4`Ý[wÏ¢‰`ƒ¸Ô¬pËCI²…êº÷“3Çß“¤Òd)4ÆSÏdo€Ì¬œ\'UŒOUH¤A^?4íNmV³!'),('test2','0‚¢0\r	*†H†÷\r\0‚\00‚Š‚\0ÉÎ£-z.Õg¿¦6ÒažEkvw7ŠŒê³ÐûÈ[\0p±Kc]ËZt_k°¤®;ö¾¸]XCµÿçîpf\Z\Z2`^ÿ£7+øö¢‹(FþU÷òŽ’\nà\"JZ€Óm#ç;nV¦Õ=žLóØj|ÅÏ¬\rÝü½…iˆŽƒ‡°²agNÛ˜ ‡çÜ­!ÂúhŠç7Òüå@Òr°ñßJ!íP¬‘×ë·ê$’Ò8EˆS‘$UˆuÁ:‰Ò”7LÄ€÷ÚÈY·¿ÙOtnäAHüÎœ¦žtÕ\0ÞùHŸ±•ÙX¤Ó¥ýl³û]ZÕ8oŽ‹+·ÏDÉqúœ«øOH§uÛóŠ=â§_S­€„?#ºØheí‰®ƒMá¿îÃõ\Z\rèÆçaØ¥ÙÓ˜XF¤:wíe‹œSä©*’ÍhL£ÛÎ6Ë)ç­]·^L¾“Û!)w¯U5àYé[dÙ9»\\«“ç5Ÿb1äwŠXUyk\nxvÕD6â1w\0þÁ‚÷¶v9ñß\0','0‚þ\00\r	*†H†÷\r\0‚è0‚ä\0‚\0ÉÎ£-z.Õg¿¦6ÒažEkvw7ŠŒê³ÐûÈ[\0p±Kc]ËZt_k°¤®;ö¾¸]XCµÿçîpf\Z\Z2`^ÿ£7+øö¢‹(FþU÷òŽ’\nà\"JZ€Óm#ç;nV¦Õ=žLóØj|ÅÏ¬\rÝü½…iˆŽƒ‡°²agNÛ˜ ‡çÜ­!ÂúhŠç7Òüå@Òr°ñßJ!íP¬‘×ë·ê$’Ò8EˆS‘$UˆuÁ:‰Ò”7LÄ€÷ÚÈY·¿ÙOtnäAHüÎœ¦žtÕ\0ÞùHŸ±•ÙX¤Ó¥ýl³û]ZÕ8oŽ‹+·ÏDÉqúœ«øOH§uÛóŠ=â§_S­€„?#ºØheí‰®ƒMá¿îÃõ\Z\rèÆçaØ¥ÙÓ˜XF¤:wíe‹œSä©*’ÍhL£ÛÎ6Ë)ç­]·^L¾“Û!)w¯U5àYé[dÙ9»\\«“ç5Ÿb1äwŠXUyk\nxvÕD6â1w\0þÁ‚÷¶v9ñß\0‚\0Ç?øÜÃÔËd¡Î8kgZß	-ýØÒ ã1úÊ==+Íÿ_í1p<´Ýh×$rÓÜ<x}‹nceÙ|›”õÜ¯´qcôp.¾ê±ðGHcØ½ô¢êøBw#H„ÄN÷WòŒc´\"7scÓc±â¢Ú™­/VçœÉ°¯f|<“EV§Q2Ñuž¢$ƒ [£É­Àš }Žš ø°HR¿šì@ƒ?ñQ\0]²¸÷X|ÛDçØózOÝÒ)jÂ5¤‹Õ§&™`7óQZ8~\07Ò¤µL·dUÍ¼KªNÁ:—S?!<Wì¨ºúÚoõx¦Ö§°˜Z04I²îàôW£ê¡µVý—Ö_#«Yé‹PÔÐ(ƒ×›%±z¤tððêR§SQHsÃ—\'Ô-ð]ä†-àÏð#[)Öugƒ\"FìŽtÎº§q	¾ZtŒñŠt™L²[¤6r»ÓŸÍg2ÝgdhÃË¸Ÿ‰Ûª‹a(	¦Ã0IÑ,¡¯B6qFiŸðAÁ\0þéòqRE¶dl¥t&?äÛf!’ú“E N¸ß#M1 §C‘zŽTŒÉ.Øƒª	£é@c	è™Tgè¥{ÄT\ríX÷‰P±ÛÉê®òtTì!m#Þ4Ä„J¤k^Ñ‚y5TÐ6’ÅÈ{íùùÆDz|+–KdöIÃ†Ÿ<bêÌž|fÛ¤×;7õ×ãJc•Ë\\Ý±\"ˆÑ€*a\nÉ‡ž‰€j›		äØÒ}-Og‰µÇhh%}Læí›tOæ8«qÁ\0ËVIÝé˜\\i4iE4l/@­‹ÿŽ=–‡aƒ€0Ð>	ò‚Âx^8Í·b†Ëi*‘3DÛkEg©tú‹‹Š ]ü“mºD„ã\n((ô\Zc´¥’™4ÄžÛK/ˆhWëÍ›ÛùkD]Î’xå¹‘b	O²çÞx{›û8­’ƒ“liìƒÐk†•-ÈU¨LŠ0PØw]œ2›â£68¼„öŒ©]LßM#&|sF­øx\Z:©ŽçMÍÅ·OÞ­%û¹OÀ[-°uH­nâ%7O2vÕ‹‚àc·$°û™`RÐa\\áãÖ®s«–à4VE°EùXdZIÉU‹ «Zz?kìthûã> Óš|‰mU¢%GdVæúë:Úžø\"!âh¸|\r:S–8’Q{»‹:nGJI4y³oÁ.2ŠBºQŒœ Pù8/(¢lBn\n›.c—ÅOxh.¥†Ã×Dë9å¤ŸPXY¾Ëó$Ônfb‘©.²‰½&‘Á\0Êù[Ë?næžã!ì,NƒSbËMS#UÂ=iíæ¬ÓrÚc&|ÃœX]ÓSD«¥=Ôbcvh¿¥gëÖdxNeGøfØ%E² 4ßYâ1å’*\0W†qœÞ4˜©ïúÇæÍBðüÑ×?G6«Â fC‡¸ßô$fÓ|ŒÜñ‰ÚúÉ¶L%æ	°×Ëo¶C=’	ó¦‚¢q^æéqö”gÜ+˜è™¦)6y;xhf»“Vù§ŠÒ-üNBÍ³©À^]Ë@ù<fô‘ÁÕã›1¹^tÅ)gC·Bîn»c¯µú|ýð÷—›1GQÛ¯2 Pr,È\nJåOøÏ2WéñÅ:°´$æ„À+³ÝÉvÆ\nK·5Ù&á*ä¦=ó\'&×€º¡X®{Íªø…õK«F•gÆ±æs¢]fAšYMÊsÙÂ”`¿â\rQfBTäöÏV¸ã§5ávE†òÿä†ûIšÌ¶Æ°ö¨¾H1š™Sñùç	rÔê&`OSR°…');
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
INSERT INTO `candidates` VALUES ('test1','a,b','1'),('test2','a,b,c','1');
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
  `test1` varchar(1) DEFAULT NULL,
  `test2` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elections`
--

LOCK TABLES `elections` WRITE;
/*!40000 ALTER TABLE `elections` DISABLE KEYS */;
INSERT INTO `elections` VALUES ('sfrink','1','1','1'),('test','0',NULL,NULL);
/*!40000 ALTER TABLE `elections` ENABLE KEYS */;
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
INSERT INTO `users` VALUES ('stevefrink','pw','sfrink'),('test','pw','test');
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
INSERT INTO `voterkeys` VALUES ('sfrink','0‚¢0\r	*†H†÷\r\0‚\00‚Š‚\06ž·æê\r´‘Ÿàë‡âª¸MÓÌº‘À×mG‚fP-QùªÑÐ^Gv¶Cš‘û‘Ôï\n*é¥oøí<b3#ú;XÚŒ~oÁdì·tÜmþ¢g‰Ã¶¥w÷£0ÌIÒïÙµ™îÄšŒ¼ÜÿÜw@ÛÜ2íyäëé]þürá4ÿ6nÕœúÁ3ÉTÚ³ûFK©Ggu\Z •–#õµÃ{epèæ¹cÚQ±²¿ËÒi½`À@ƒäÕ\n>Ùl¼|‹4B.°%¨ÔO?#¢™ç}9ÒâÎÅTá4Â´ü™æzÿž+±ÆÿÕT >v!ú—0³(Ž¦À,‡y[,>_ç¼×G`SucÎ¯Êy<°ŸßééD\n}™ˆ*zÓ39ˆ†Å©OeYc^_Õ™º¢·ð†^;Ž±ò•Ç\Zƒ\'“&ÞÅ‹.Ç¼þ¨pÏ•	/œì‚Ã‰K¸Õ)õ©ø´\'»â$·=³Ö…e‰U„®cº†Í`»®ue›z†Ç’3Ï\0³¢G\0','0‚ÿ\00\r	*†H†÷\r\0‚é0‚å\0‚\06ž·æê\r´‘Ÿàë‡âª¸MÓÌº‘À×mG‚fP-QùªÑÐ^Gv¶Cš‘û‘Ôï\n*é¥oøí<b3#ú;XÚŒ~oÁdì·tÜmþ¢g‰Ã¶¥w÷£0ÌIÒïÙµ™îÄšŒ¼ÜÿÜw@ÛÜ2íyäëé]þürá4ÿ6nÕœúÁ3ÉTÚ³ûFK©Ggu\Z •–#õµÃ{epèæ¹cÚQ±²¿ËÒi½`À@ƒäÕ\n>Ùl¼|‹4B.°%¨ÔO?#¢™ç}9ÒâÎÅTá4Â´ü™æzÿž+±ÆÿÕT >v!ú—0³(Ž¦À,‡y[,>_ç¼×G`SucÎ¯Êy<°ŸßééD\n}™ˆ*zÓ39ˆ†Å©OeYc^_Õ™º¢·ð†^;Ž±ò•Ç\Zƒ\'“&ÞÅ‹.Ç¼þ¨pÏ•	/œì‚Ã‰K¸Õ)õ©ø´\'»â$·=³Ö…e‰U„®cº†Í`»®ue›z†Ç’3Ï\0³¢G\0‚\0‡^¸]ûp7ð:³Ž“p)ë\'’9h©o™ª;.©H¿õ(<~¤3\0u½îL¨ô[¶äqÆÀ²näÙª…\r¥Á1Ç©“éüO2Öhév>~Š–L;£üDLhA¸Î²ùL\\X€äJYÍ±Zç\'Ê”äÉ=Ü±ÔÒî;CºÝßèLì:Šõõ=@‰„óÙÊ)÷\0#l”“2…eÕ‘è&ý›W~·®sºOv˜Î*žýAƒž€µ«Eg°z>‰™åúó_\\>äíUåä „fñþVJMÅ s¥ëW­¡C(°ÑX¶°•{XÍµ‰÷ãt,R­éŽ\'àï‹Ié¿e‰èÁ*ðÊŠn³´#ÎÏ«t™Ð\'„b5›ª-â•†/8\\Z¶à+Ð¹¶-(vÊy¥\ZÉ^¾Ü±‰ß\"\ZM¬m<Q•fHƒ@ä/7J#n.Ç»/ƒÄ]3Q‰kbzœpÉ*÷0ëÝv’M\\ïØ¹…ŠÆå7]›à¯\0NÆhÊW»ßiAÁ\0Å¾¾…zs‹Æ\Zçæ\\béÀ¨ú7:¨‰ûB,	¥LKˆñ²ò¶è´nQ+\r—l|U£«¢–ªVoÿcC–_ÆæYu©ëkœª‹î°­ @7“›A2Á(x\0+QÎ³4¡Þ÷£–Ï¾¼ž¢…à	““Ô™©€d=M‰b§¿ÚÙ)(Ÿ«+¿Œ\r’á+w ÄuÆ•”Òäv¹ÿ*–Gy6y•Ù)|\"»7–oô/à—æmvùS—ÕÁ\0¶Ñ\ZZ¤!zíæ€zÆí¨>Úp—æ¥»š}ò#}W‡¾Hð‹©èO´I°ä$h!«°Û[[~ðÇ‘iöœt[Nû†2áÆÍ\'[„Ÿ¦”åÁ¹\'[\"{,\0ßJb’]®jbYÓ£Û0ÉÖ\"yçƒF?‘ò\'°×*Å†s|3uUZjéUß4t„ÂWw>ö—b7çK¯U{&Op$8á`9À\ZpbCl”cÝŽ+‰ÎÎCvÉ(•Er³p.Û«Á\0ŒD8¿¬¿\'§Fg_ˆ0\0yRµ%L\n±jÕÎoÒ#&IÑOEefÍ¡\rÎ¦ÇzØ€É«Wðú­Åªb2­±’Ð~\0ßa«žÓW1÷ÎGÎaË:!îTL@@È|XÂ!ò1¤…º4Õ‚˜²ì]~cûNÇm}¹P²F1„Õ A?Ó+G°õ8ûSWÚçÊ“4§ðÊâÅ„û;í#[Ÿo1w)öÀ^êªŽ	êÎ²»hkæ·œÂ1 ÌU’$Œ uxJ¼Ò\Z\Z	áÀkdjs÷/Å.‰Î›´XKÏÜŽº¤™r°;¶IW´NÈ5;Ÿ\'‚=Gr	°Ûv\"—2m›ÐFE]v\"s:ý¢¥äo:ÿØÄ6pBï´Ô\"QÛþE6í£¢ÚÌÀ}§ÈÔe&ÔO…pŒ¯?Ç­NSç¹p¸Ä\'Íè\04ÙEz¨*7^	|£ïÒœˆ‹yþÖ¹¡cN•ûæ‘P™²÷æ­çaì;caŒ%®Vuæß.îž¹Žžéžó©[±»eÁ\0†DôjþºÍ]gñ¨v®iºk]Õkä@yŽê.7+dþìãÜœ>(ìÔR‚SÕ+#nõbk)öä½ÿp<û£xÀ¿ÝU€<Æ&üÌ*ÎøÎ/0èÓDNð˜”}éÜy½Î ªž71Ufü&7,*¢yF&Ã€vn™cçö†õé6TÌŽ”ˆ•q?/ðè9 WÑ±\nGg¥kÄbª(ZÌHx9»éæôÜž6`¿5tÄo´ˆC>LZ');
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

-- Dump completed on 2013-10-21 16:26:14
