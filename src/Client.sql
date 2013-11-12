-- MySQL dump 10.13  Distrib 5.6.14, for osx10.7 (x86_64)
--
-- Host: localhost    Database: Client
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
-- Table structure for table `voterkey`
--

DROP TABLE IF EXISTS `voterkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voterkey` (
  `username` varchar(50) DEFAULT NULL,
  `pk` varbinary(3072) DEFAULT NULL,
  `sk` varbinary(3072) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voterkey`
--

LOCK TABLES `voterkey` WRITE;
/*!40000 ALTER TABLE `voterkey` DISABLE KEYS */;
INSERT INTO `voterkey` VALUES ('sfrink','0‚¢0\r	*†H†÷\r\0‚\00‚Š‚\0¨cý²Œ‰JÖyP[U:­v1ÐV©«6lvêæH*X$t žpÑÝ7Ó°T³Ð“w\ZÇbÆØH‹\"EBjÍ\ZöI£Ù©ðjp–}«Ývµ\rÂL™Ï±²9­í²ÿÛÌø_!š3`0§xäìÜÏÒÏaaü™½,!O–—ªM#;§w–Y•ž˜£Tˆ\rÇFJc¯¦4ºÐó0…ëBµ(Fr­Ñ¦ÄIûþ´ù¤qµZ©|šjÒ«¢ê\'­èÆÂKŸvMxöòcû@5#q£œì°böŒ\n¹do­N­©ñ<\n$’ä§–Ó©\\­	{¼¹wp±(;Þ7‰µñçv§—Æ$3pÙæ/Öi}žéRZmx1¿(Èã\'	¬ðA84wâ÷”.›×gâ&ÖÈv´\'Œ$Cü1†åD¿ƒýÿ†šxõR“íTçÑe¦R¢l3ÃtwðbàO\\ïo™Ä›JñcÑèÒ’\'Ý€±Ëý7ÎÑ÷6Œÿ_\0','0‚ý\00\r	*†H†÷\r\0‚ç0‚ã\0‚\0¨cý²Œ‰JÖyP[U:­v1ÐV©«6lvêæH*X$t žpÑÝ7Ó°T³Ð“w\ZÇbÆØH‹\"EBjÍ\ZöI£Ù©ðjp–}«Ývµ\rÂL™Ï±²9­í²ÿÛÌø_!š3`0§xäìÜÏÒÏaaü™½,!O–—ªM#;§w–Y•ž˜£Tˆ\rÇFJc¯¦4ºÐó0…ëBµ(Fr­Ñ¦ÄIûþ´ù¤qµZ©|šjÒ«¢ê\'­èÆÂKŸvMxöòcû@5#q£œì°böŒ\n¹do­N­©ñ<\n$’ä§–Ó©\\­	{¼¹wp±(;Þ7‰µñçv§—Æ$3pÙæ/Öi}žéRZmx1¿(Èã\'	¬ðA84wâ÷”.›×gâ&ÖÈv´\'Œ$Cü1†åD¿ƒýÿ†šxõR“íTçÑe¦R¢l3ÃtwðbàO\\ïo™Ä›JñcÑèÒ’\'Ý€±Ëý7ÎÑ÷6Œÿ_\0‚€tƒ\'¥ä×sgËn…)jSp²Âø÷ÂþËY²5QÙ]°™ò†¨fX)\r¢‰²qÈcÈÃz¦B¶8]Fü3ÞôÐˆ”\n¯†JAòŸ’,â°iØ¼Ø?Õ}‚¢Ëhrn;0=);\\/ˆ³áë”ÆJ&Øð~‘ŠŽ*äxAŒ£¾wœË^”«0ïæpëläz¦‘Kåüvò\"í-­ô)î$|è13„+£ž[T¡¶_+k@•–iGf@6¯–·C\Z\r¦Ç{^g3ù)Á‘–®G›GD”5\Zº|ã€¹|N•°üzâ\n\r§Ç,\"5K\r—xœJ£BÎ¸~÷°¨j™÷\'|íŸv±Ù…ÁÎ!çC„“\nr±#Äéx\rLX]ŽU¯®¦£¤Á¥5Õ9ÒOasïÐ|<šêóÎå=Ó“0i°J?Æ;µ†_ˆÒ\Z:º—)Œ|kKã¸……]ÏžÿŽÈì5ƒxÿzå©ÔN\'ë‘­øéÁ\0ßl_† ]ÙEKü{I–’ƒƒî-ÍÎ)“mA}¥¸wÊ¦ÏŽt{”¥^n½òÆV%rÆ­ŠÀà+çÃAaïý ZKÃgÑ~ç0²6n2ç°%ç€!Ã€«‡ôt¨Ó²üÌqÐØ	0ûÄÕÎŒ–n%B¦6¹ÞsëãÜóQûÃAZ$0cÁLjOÊè9×xóñq°]Ü¯‰Õ+M— ÜÎ\0ÕEÛ)Kuá¡Õ8ØÉ…ÿtäfö\nª\rŸkÿ‡£Û%Á\0ÀñošW>‹$Œ\naðê}Š2è¨Ö{Ü½ZJÂVe^\r_”‡kÌˆ ôü\rÊu1øª¬áéIÖÃ¹ä·¼[XñˆŸ)ÐÖÝ±9VÏÓèòn½þPØÒ¥+uËÌÍKý ‡4W/õ\n£0b«BÐ\0gÃ»Ï¥`íJ¥ÇµËy?Î¥É~-½Ahß4•Ìž4vñ¨£óvqÏ«$`uL…F`61&O5I6ÙÛâÆÁëð£cº—;ÏÍc|ýªj5‘LajÏ@úË3Á\0“ƒ3Ã§O^gCo†ÈrWÍé_jr\'[¼´^f˜\0þÝï\n	4oÆqzT>KFr_fØÇ†¨û”À±oŸÄ¾]À³îä¡åz ¶\"µà”ùŠ_f€W¯^o¼ÕÌ±Ù¿³ýöÄfâ3ZúGÑ¾*93DîÈ»W`øŸÒ]A4ì!u	\\ì°~5aæT1Ä±Ii«+8—D(Elúc\"îBÚSÜË°ºÁcmdº ˜¶5ÌÄÃCor¨æÙÀ^ak´C;žà¿ÍS¬¼Ý:{\"Ú‚¸/³¾Õû²ÎiÿÑŠQ9ãø6*„n¸¬Mu{<\\ò¬sO¸´ F<:*,ÛÄ±xÌ\\4ç`@:m{u6:’=¾G$—Ýgã°Ï´_osbØ?pþ1ú‹â¬l‚ç‹ò2°¸²†^ÂFƒû3TÁGâÁ7<¦“Œ°Ñ‰òEÄÒÌ„Š¡D¾~Ò¯©¦}+ià^®þ\'5öZ™uÚtóý\"3%À&/dÊ`1¡¿û~aó$¦×nœ\"ÎEóK°’Cƒ_A>…ýh+·ÉÈÀÍXVï´øtŽu°LÊÝ©I¿!k.…r100ZJÀ‰mÝiZÉ¬´m(Íµr„ «6ÐêŽNýÒjZDãÕHþÕz&®p7›ù²cÊÄÎC“Šã±‰á(¦ëä¡4t.Z&k¨64Pybn‘°Q!j&X3I•¼¶$ÚˆÌ*,OTŒ^^6oÀÿ’m±k'),('test','0‚¢0\r	*†H†÷\r\0‚\00‚Š‚\0ŒúNü\0T†Ø¢_u–‘êÐƒeœEJÁX_jêÀØ”™’WÒZc$ýê8e$F«”¼“U\0$k(oU©§o{…7T|ãˆlÌ²|#c„·s‰ÜPeÆB¬¹€^÷`@ñ3„°ø&T²êeM@~F#RH¬a³ƒÃÃ¨gŒ¡‘ÑB-t	/\rz:ëÃi­äÐ´:`x+YÀh}BÐ½`è\nATéZNÛŽûü:N\\/3“w>îËÁ$VuO¡š?”U·ð<;EÏ*¯`Y7=‰¢Þ•{“8qú\'•Íê*>\0ÉC­ø(àBŸ¥7h´¸ÿ£rXÂ@i\0Ã1örÚFiÊàChÚ‡ø@±è\r¼0¥øš„·žÁCŠýè„1yÏ~^_q†KñåöãéÖA¡ËÑº«Š£\\Âˆ›ÝqD7r^^]FýIù–@3:äÙOOô¿’:&úÿ.ð*Y@âölliü¶F6Iî1º4Õ`ðTk{–‹\0','0‚ý\00\r	*†H†÷\r\0‚ç0‚ã\0‚\0ŒúNü\0T†Ø¢_u–‘êÐƒeœEJÁX_jêÀØ”™’WÒZc$ýê8e$F«”¼“U\0$k(oU©§o{…7T|ãˆlÌ²|#c„·s‰ÜPeÆB¬¹€^÷`@ñ3„°ø&T²êeM@~F#RH¬a³ƒÃÃ¨gŒ¡‘ÑB-t	/\rz:ëÃi­äÐ´:`x+YÀh}BÐ½`è\nATéZNÛŽûü:N\\/3“w>îËÁ$VuO¡š?”U·ð<;EÏ*¯`Y7=‰¢Þ•{“8qú\'•Íê*>\0ÉC­ø(àBŸ¥7h´¸ÿ£rXÂ@i\0Ã1örÚFiÊàChÚ‡ø@±è\r¼0¥øš„·žÁCŠýè„1yÏ~^_q†KñåöãéÖA¡ËÑº«Š£\\Âˆ›ÝqD7r^^]FýIù–@3:äÙOOô¿’:&úÿ.ð*Y@âölliü¶F6Iî1º4Õ`ðTk{–‹\0‚€¢YŠ¨Ø~)<š_Ô+`ïý€%&#üòe[_à{3‰ŽOéŒ÷š5¼¹ù^’Ù	6¥ËÙïùÐ³,K!Åµ &1d†Ó?þ:µ˜ó3\\šK~gÕ¿Gn›ÿ µPlrª–‰ã(¹\r\'\'rN¼£›)Ãù7ñX!tmmsòwé‡‡›Z^ýˆ.›èh¯w0¾É@ÿ2ìÇßú\nWåûdl\'âÔJ€\"vpp¼~ð–ŸD€ð{…ïhXm-—˜¢¦ùÿè¢8LÛ­0.>YÉWôÉš0š=.S¼tr>VÓ®<ýS¦±Ý²Ÿ¥$:¸2¦ÂX;ˆG;¬…9Ç‡¡Ö„µüod*Õ«ê\ZyŸCWÐs¤¼á… ù\\_„	j±ÑlÃ¿9Ã/¦»ŒÿÛ÷4ìŠAðªÕU>ï|ãÃ›¥˜wþ‚†P»Õ^ò“6XåÆ2UýôN¼Z/\"Œf›Ë	…¥ÓmÍýú³æ Y&#Å{×pq8Þ¼>ÜÁ\0Ú0ú•Žë§>K7_`¹Èk%lBõAÄ!æ×\rnÓ©Û¼î¥‘í±?,§è{Ee–åþS°£”à\'ÅvÂs-ð—°ŸÉ©Yëf‡•˜QH¨á\nU4MÀû¤Ì€K‡(a0Äw\0ÈÓë0~[:l\")Y°v-h–¬j1«KO‰xH/b‰wUˆpýé5»‡ee<’åxÙ$ªàÓ©²âÙmÑÓ	W=5õ	;v:×â’\niñÛdñçãÙº“Á\0¥~µë½j<¼°»~ôv@H;S}ªçw•=%ì•‡!¯š–r¬µþAûn»ê~%«Àf/#`FWÁ\'Š2ïLÌ3uqZ0`nóŒõ\r^V¦uº1Qÿõkæ`nqÚG°Æ[>4\r=çvh}A~Ý0X\"Yåw®Ç÷ruÄåq³zn×lÍ3)=ï~5ºIÊ@$bÑ´a«…¯çÖ½;ê¸‰9&ÈÏê×†\ZÔj€	Ûö¢l²\rß?F´W¥qmq;ý‡0—)Á\0›Äq‹Ì V;Çî9v½¢«u—QlO×8ÐtUàõY‹ºLµ»®‹~2$a¨ä3°üÄŸÞxŒÔ[»Ä‘9æ™wSë[È\ZÙ§É0æQšÍ\"§E’¿,«ÖHªqñZ@;0˜BLFK;&³î‚ÒÉ´Ì¯\Z±å]Ä½­\r7o¬IÏ@–ëy²†uB	_Z{ ù@¾ì~´	P9\\(îºÁÏ®‹sb÷çwY‡9œûŠt‚&ˆÄü±FýxG!yÀ~Ÿ¢>·Í«´4(fÚFøúdgP0ÂAÎT*Ø½#n¨s·›cN ¡­¨$?ý¨7:^·^Ž@Ê\0Xå}}5 _&•Úce² ·WÒ¤®p­þ9èD·þôdB5€5Ùžk\'ê_¿ÁRƒo6ËP§%…èE‹3XmêÝçï ŠDðœ³°±j™ð†“3Þá¥ðQ‰„3)|] »;èØdXnSÛA%ÿX+£ë15ýÉ“ÿŸ®#IË¢–šdÜ. òÀf\"…¾õ#œŠœ–m3%‹‚0ˆA³k*äž\nƒåßm2¨\"“úJÇPQlæŸRëŠÊj9ïThÂ–·-19Pµ†a¥ºðÐŸt§<CB¡à4£Oj¼¬ÿà×R¯Q¨ö7F¦Éåš€Ò0Eþ$™ÅÔÀ|ä:ïC¸7«¦0#ë<!§“óKr3w9RËï™†V‚w‚j/é)÷÷[ó‘Sq&.ýz!\\eÜÍgêè	®ÞfêÒvÿµ');
/*!40000 ALTER TABLE `voterkey` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-12 14:21:18
