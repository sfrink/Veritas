-- MySQL dump 10.13  Distrib 5.6.14, for osx10.7 (x86_64)
--
-- Host: localhost    Database: Server
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
  `modulus` varbinary(40000) DEFAULT NULL,
  `sk` varbinary(10000) DEFAULT NULL,
  `pk` varbinary(10000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminkeys`
--

LOCK TABLES `adminkeys` WRITE;
/*!40000 ALTER TABLE `adminkeys` DISABLE KEYS */;
INSERT INTO `adminkeys` VALUES ('test','\0 ı}Qå/ôîèE2@Tè—3İÅÅ4|qvÓ¿Ş©ÜY$Çe­ÔÌA]OÙ0Íºfş¶‘6Lş¥ÌMäWuMç\"fh£Qº_Aå×ÜpùÍ¢[’jrd°$ëy@8S4cÆ`F9e;ßT«Hâpbi','|`¯bÈúè\\I–=Mk”Weh‘q\"¨ŸSì8ÙqZ+&†ı.À6„9°Ü¤–ÅvèëÕ\\/ÖÊ÷§^èœêõ­Yø1…‡>Øö¨¾àdVÀ§Š‘\\Jƒ>Ó¼#Òæ›/Y±¯\\v1Ø{i	ü£l–Ö3èÚˆV*a3\"5','\0'),('test2','\0¸Ñ\n†°C³œx¸ä9?²UËkÍ‡6˜f)ñ“¢[‹XÑÄ$§±u¢Û.!ÜŸ«áĞ@2.–‰Œ%©¶Z[˜X\ZF†Ãó2ÎïòÄ¹‚\\´Nš„½Ø¨fèµ½rÛ‡}TÆJ$Œ‰8÷±OÅ~`n‚sˆ¡”FÕ*®’u','÷)ğ5\rSŸŞ½Ñzöm‘fË+ÜœÎ@¸Åßü‰¸y]T!îY	‘pŠw2Gèn½»b©\\¢‹tä‘ÚŒX×”ˆ>“Şn¾Ÿ\\\0«?ñ-‘úÃÁ§avªŞınw\Z6k;pZÀ.çUY‰6½¢>¢DÌ†¨w5ü8Á','\0'),('test3','\0›¶ß\",•ŠgßèÂ/´‘GåŒ#ÄJoGDÙ™´±‰äj$ÿŒøkR±)ÌíÇÁsËÇ›H/CÛüë@0¼5FqML{ÌBh¾(f9)Âó66wE;ÁŒ¼q¶3ÆÕü··-‹Ğ8[õWïf”İíÌ¼FĞäà	…Wí','*\0m‚Rî\n—[oD¢UÄb0~ÜB©+¤Hh}sv\nbpx{ñDG}±ŸÙ\Z&AX¨ğ_İÆ¶…±*òÖKióúÇÓÜ”&‹Ëb®Ö`€µ(®eÑFÒCÒ#eÑ~L¥)ÙùÊ7yëY7i…2¸ƒ.•ç]óÅíw ùW÷üCyá','\0'),('test','\0¯@<âRŒR0:tıj• Š—J™™Ñ¶åÊN8Ğè•}«Ù©`b%kÑƒïî3 }Yİqô3éÑË}çÍúË¾\r™\r—vrwÏ9—¼«Á—JM=ö²$½>HÒ·‡•ÂíyËYæƒd&…-+}ÁH{Í¢ës#…v¢ÀØ–œc','RL”{_‹‘ÄD÷í¼ö\Z\r®ŠÒ:ºOÅºmıJı®(špÀC\'®¥æR\r™Œğ`UóZ€®eŠÁSÁÑ`‘ 9ü•×8JÚèíÂ”ê¶Ğ_ÕÃW^”Ü¯Mbïí¦A™%Šç;rX¤ÿî;2[áİ{%›ÑöÑ','\0'),('test','\0›añ^z‡ù/\nóèPÚøÍ\Z¤Prd¬<ewµ%CÇ«ôÑêB¹œı³…ˆf{zNy{ó¦È\'A®İ¨.¡Je¿H6¹Í1–ÌB2=‹\'ZªQ£5š-½9¯Öí»A~oô=Xû.îùj&Y½Œ¾/ÕbÇùˆÙÕé¢F²y','_ôãŞÈ”õP3Ë˜=r\0¿u}P?ö`\0Òhë$¹ÄppVÈƒBb¾ş!‡ôWm\\|®Å•¾dûE7úÿ¿dš[ğj¾¦^‚rrN”Bô=tkòtµCV3*LÈ¾	Îš[ñ}Ï)\n9±q¨¬˜„òS9ı','\0'),('test','\0©ş–µÄ\0G\" ĞWìäÑÙUz“x:Ûw#¹î{åÿ@u{a\'é¸î³Xøy‘›¸W0õ´Äh8m·›6­şr%İkP†\ni£ç ÒÀÆdêï€\\~Aíü#¢æ£½ĞFûçè¯Ã¶„t.FÕØÕ]ç<Jgüh3GÔ_õ','E!5@Æ½ÉóvrŸCI\0üA*µ¼JHDºÛ¾´ıŠ8IÁ)%58åË-¸PÏşz¶ô«9ûRºÃ-Iˆô”•aò¨8¹P-Z¬Æsr¥5—òôkãÕ¤Ôñup+[–*Ø\0Ğ,Ã|/ØÉì\ns’Õ\\z	S„\nÓ\";èÛë‘¦[FÁ','\0'),('test','\0Û0ÂÁÕœ¼Œ8ÀÈCd’ÏBe©e°ô.PûÓ^ˆ6š²¥ajW‡øù!B\nô\nÆ/Ôº<Ïo!»èñê˜‡<m••›«d¤yl™}ŸñÓD¯›f\r°Í4yúZúo\nR¹/±‡Å=pVİ¿or+‡R+Nª\" çŞÃœæÄ%','2Hb½‹LÍIT“çsp`ÿ*k7€÷·€4Ñâ©}}nSÔNSon»FCÍ™{º<3Ç§ƒÆ¹¢f“ûÈíÕ–.e¡yU)íjÃ,Imx‚„núéàŞ.\rİdÁŠŒvë¹ë´¶¨¯ W•Îf$æ‘ú¡VG·™Yn¨åi','\0'),('test1','\0Åæ=²ÏGQzâiNæué*’5!ò®PÆ¢y¼Â¶°ê%r&Jébîrú(M,r°äo=§ğÂşÈ;\"û`Â;1‰)yK¶YÉ*	½×´çÇPI ä„$JfçÎİÂ+¡@¶,ÆñÿD‚`ü½íÚë)«JÕß’>Nøÿ','(Xs”ÎŒ…œ­ñÔØV9)ÖÄpVüsß)Í†8Ml`ô†wåâº©Zãw-å9²”/®\"\"Çééì­i¿HsE…‘ÂX^Ewj¶÷dCŠÕ×Öö;À«\r<,{òv Ëfú•ìW)Í6%f^°ÿ~3ŸæÓ%UÇg¼\\…}î%kÍ™','\0'),('s','\0€e!ˆµ¶Ê¾MÁşÜ¡\\K^ÄÇƒ±vo8ê½<Øª©¡ğÕ—WD´†l+—­ø”0(4\0’\0„u¿\\L ¯#1Ü?R7®îĞß^i\Z1C»] –”Ş¾E¾nb€NQiÎ£\n¾[­\rúÃ~#ó\\7ÂÛ™j?','>õphl¯ØÏ»‚ş%ªŞcƒÃ]‚¼J‡6¼‚gwOîe®sâÖÆ¯´Œ´¹ºÎ§q—±¢ªxq®ÿphDTÁÎ3Å@Er×ïA\rÿØ›)>4Œ˜pzb)ŸóØ¤×6!ÕŒñËvüëOÇ˜FuÏâ˜„”ü“5o','\0'),('test','\0Ñ/Ì¶aëİaÔf¯|ª¤ôJ°_€ºZ\Z˜jï&7S*c€Õı5A9Yì“X¥]ı–ÍMD\rÖ€¾Õ³‡Í[å:\rPeBóš{R;öt\rÈ;\'b¥?û‚lGAF-‹ ’ß9öòHyë¤jõ½*öîCLš?-ıD9•Wƒ','\0­	\Z1‡Ì™v·²É¹ÑyyD*şızØ+X/²\0€…³$ŒFÀ³ó×ÈìŠCub×o—+İé3^²ßÎ{±Dım®`àÜ—½KÒÉJòô§±7aÄøâœÿüi]iL²3Ú¶W‘®Y’úåQÙG—J™t.#|âĞ2½ÄÒƒxÑ','\0'),('t','\0œ—F\0”\0Ğq>Ş­ E—1Üi°‡\0ÔXq0hêz-‹éCzn\ZéÙßq\\ÿ<Î¸½SQc¢kø7\'Y2‰U\0ÒÖ$}£˜Á¥™Âz…3=îˆÉXÊç-.a†gyûsñf™S†ü ¸®l‹÷eÃŠ`*‘ø65{=','\"¸ØhàhÏ¾¥²í´æ U½D¦šâ\ZèHŠÍî}ñ½¬ÔøPb!pR¥]9ÅÎñ÷¼ğ÷¹Om™\rÂ®³×fıá â“T7²SOÙÅQÀW²Ì®Š\\˜™ÅlŒàÇ\r]R¡©˜a‡&è×\'wE¬J¬cˆøÙ!¶>Mœ#“²q','\0'),('a','\0·Å£×›ZÙ/U&şEÓm#Üa )£BjLÉZĞr¶øb–§l4ëmŸE±ƒ–A\rå¿IÆ½â¨ñ‘¾]\'cı‹NWÕ\rÒıfg? ×õ$…™ ˜3¸»–dà/àË	 ø_¦úMì~\nÍ£íqA½²Ì‘I×Å%ñÔ\'±',' €õ[NŸt3øèÄdB¶»×¦ïq»^T1£ÿF¨{%¾Æ	XG\\Ì‡¦¯Ìøgf.­l…-œ`eãİHoĞ(6*Û\'VC$¯S3Ö­Gµ°®R,Éà»AÔ^ßoÛŠN{¢¿:3\n·Añ:Úşçø–Ì |äFñ','\0'),('test','\0­r¾!åleOšå[h,ı½ş?Ïêa2ç‡ï%+ƒ»–ø`Y„—æRºËí¿¾†Yıø½;³ßßSAéuâ6lõÆdj›˜—Á¾ RŞÙşÔŒÆ’°À^ş·„µã‘‹+Bè\r)y©Ü3?}c&•Â«kzŒ;Èh	 €\\ËÔ˜sc','X=@§CírYGBÊX¤5î»sA\'ÆënFÀeƒ@ÙÙB‘g)ÀºÑV®îğNgyU¿©â1œ¦`P)ü›Q¢\'Uö‚õ5ä•i[)ij+i§¾»\\Nvò9ã:¬Ó¤Æòİlÿ\0\n=œb=tÂÕ€/&L@I,†E%\': 8d‡A','\0'),('test','\0“O4ŸßD¹¢U‰+è0Tk\'ù©B³f‚³Nu¶àú‚ê¾=¸®‘â ô¯w¶=7ÙM1.ÑJd’q¬4>Ø¢Â\ZßØ²ëÂşÕ}ğƒ86÷şˆï„e¡v‹õóBCÄ=}B—Å€Ù#ä~töí†YuG','\0‹³iìÔ‘#êŠ”!6½ôÉbv=/æ@ÌÎÖÍi­i`.,eKÉîŠ×2wD¹ÈMİE~ş¿ M~×™<,hˆ€c,©Ó	Üõ[(¶ï}‡³zZä/2(™îb™­¿KHë#Õb1HÛóö\'gR$[k=P”È¾P—Šhş€YlA','\0'),('test','\0“\\?7yÀãF…\rĞ%ƒÅ‰üI]K€ß¶ (¯İ­€xÓ<ŠÓx$=…ı’p®0šDG1lÂ¥vÄş]ô¼µ\0èÜ>[)_~ “>‡$T[,Ù\'–ìxeú~)ã¼1.<°’’^A«G`ì\"‚jèª ßÍ¡q0°X-²pÌŞ•','@û\0ï\\zW÷¯µ²%:}ûZ’¸zÜ)ğgÀÒRèÈÈ¯ÿŸ?w2 ÖdN©ˆ½è­Z~h‚[`:\"0³êÍ,î¨š<88A&Ó ê—e{N„5ÁYÀËiw¬V\rr^J¼\Zñ*êT[lI‘$J‡ÿŒi¥°Ÿwd±Ç\0ù‹µ¡','\0'),('test','\0 ¹®+¯Ö¶$W¢‘…†ùÒ‚êÃí‘_ieb’N£É¾¬|Ñ†P…Æ\"q0ıÉ ó»G‚Çš/Â¹‚ìç¡-ï¯Äà«¬İªkëoºZ”0U#_&İUúÀÆ8yíiÃBó-şùœ-o2w¥º¶³\ZR@¤?œ!º_kH>’ˆRå','J{MYdäoõEÿ[·5hY¦Fğäd³QvNæó¼šn\"G©ôjMèmf	Ì…­^4¦¤h—v”_¶Ë!{÷zÃ‡Ûä‰Ict\"¸ğK°XP­ë&ñÊx`!0ûš§OÑd\0¯ÄéW#\n/°‰Àã/¶°×™õÙ','\0'),('test','\0¸ê­Æl½sÅ¢©Ÿ6…òÜ}W0åE `°XDéÄ0òš×^lSå¤¬b“¤¸ÆP—`-\ncn£häÁñşÎÕ|¾©áîõØCav`ëš.?“®9”aH¦3}Tu³ÙÓ˜“KTB.L¬²ß)Ök\r-†6ãá‰uŸß','\0´É3Öïå$‚œkªu1åe“_ğ&ÑRzÿ\ZÉa®v¹SÂ¢ÓĞ˜Ôä“Õ›v±õ˜R¾	71ß7ÙHEµ»@›h†—†yæ}×Àô£“^K…(£Øÿ÷3hï(ĞÃ@mª?¸øÌÉ„D€\"Ç|ğ×Æn7eøÍ¦çÀúŞeA','\0'),('test','\0iÛ§“mFˆ&¢ÑTÕdW¬ìÓˆÄNéÀ¾½ñüŸğq8ni÷Q¤~Ö§¦3ãšôæ­J½–}j¹ŞÍeÌ7FÄ F\0Ë oî øxË@ qöˆÔû[ÿ±ËŒÉ\0¯•´lµî\n©CÈSÈsˆK8r½M¼Ì–t1Q','!·ÈKrJÃ{*µş„»f¦Ö*=ŸÔ Ë¡:c­«©H¤e½Ú`52Ğ¿[5¾Ø…¼°ìG•O*ûi^Ø!yO»€´¤Ú½8RPæF›¯rÏ¤‡¦:ü2¼\r{“ñÿëG56ØĞËu7ĞçæòBc+¾¦Õ„Æfmî9/q•ÂÙ','\0');
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
  `usertype` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elections`
--

LOCK TABLES `elections` WRITE;
/*!40000 ALTER TABLE `elections` DISABLE KEYS */;
INSERT INTO `elections` VALUES ('sfrink','1'),('user1','1'),('user2','1'),('super','0');
/*!40000 ALTER TABLE `elections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpk`
--

DROP TABLE IF EXISTS `userpk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpk` (
  `username` varchar(50) DEFAULT NULL,
  `pk` varbinary(3072) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpk`
--

LOCK TABLES `userpk` WRITE;
/*!40000 ALTER TABLE `userpk` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) DEFAULT NULL,
  `password` varbinary(256) DEFAULT NULL,
  `salt` varbinary(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('sfrink','gC]¼ä.Ì7}¥÷Ïø´ô˜øÑ£ë®OòNÿ°ùCá','óVÚ0'),('user1','¼§•K-2ğ¯Ÿ|Å2(r´ı¯í­™f¿™\0I~#Éø','øh&'),('user2','¦ª«ïqJ&`<ß\"9PF\Z(zÑ*æ\'¹ÓŠS¾¥ßš','şÀ×Q'),('super','ˆ£Ìª–pIh·ïOq%¸–™¨™1HYò÷ÆeÂ','tŒûk');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-13 15:52:14
