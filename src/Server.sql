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
INSERT INTO `adminkeys` VALUES ('test','\0 ı}Qå/ôîèE2@Tè—3İÅÅ4|qvÓ¿Ş©ÜY$Çe­ÔÌA]OÙ0Íºfş¶‘6Lş¥ÌMäWuMç\"fh£Qº_Aå×ÜpùÍ¢[’jrd°$ëy@8S4cÆ`F9e;ßT«Hâpbi','|`¯bÈúè\\I–=Mk”Weh‘q\"¨ŸSì8ÙqZ+&†ı.À6„9°Ü¤–ÅvèëÕ\\/ÖÊ÷§^èœêõ­Yø1…‡>Øö¨¾àdVÀ§Š‘\\Jƒ>Ó¼#Òæ›/Y±¯\\v1Ø{i	ü£l–Ö3èÚˆV*a3\"5','\0');
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
INSERT INTO `candidates` VALUES ('test','a,b,c','3');
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
  `test` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elections`
--

LOCK TABLES `elections` WRITE;
/*!40000 ALTER TABLE `elections` DISABLE KEYS */;
INSERT INTO `elections` VALUES ('sfrink','1','1'),('user1','1','1'),('user2','1','1'),('super','0',NULL);
/*!40000 ALTER TABLE `elections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `username` varchar(50) DEFAULT NULL,
  `encVote` varbinary(3072) DEFAULT NULL,
  `signedVote` varbinary(3072) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES ('sfrink','Wš 9¯é={pö‰Òïû¦&A\n^N,	°ÿéµ¶·–&Š\"ØØ‹’Æ}„Ñõo©ÌàT7ë\r<ÎÓ¯°¼~EòjJÊmKŒLz°*Ç×Ïiç†Ú}³9Õ*ĞÀoUœ\\‡9¸Y0Ï‘ e]„ì>c~bèIŞÈ*²÷ú','‡¦µ×ï4d%NÜÏ;îOãÂÍsãYøCÎ!ÛDîPéw5låôì9¨ñË7ÃŸd7å9´¤|G\\1°wÛúaêSo6/ô¦áT/½Ü<ãMm„ä“hPÊŒ(}¨¤i,´óÈ×glò=—)\'WöÂ\0”ÿ4ssIÆf@±.ø#ÖÊÉâŒğ(E<°A‘K(ÂÑ=2µïâîq¯\ZÚ¬qØw†›ás5ÏÌ †\Z\råè}˜óPá¤#_¿[¡xeo—İWÁõõDR|Ú[ùº©—W%ó¬É}:ş™Àõ˜õ$ˆËî=ê€„ª¸ö\'ÃGñJuëHµÿÇ™{lË$åRŞœ&Äs„?¤¯VÚŠÚ9å#Ï3çÉÌÚ@ûtÖ¨k¼½lTZ¡J –/\'Xø¤g\0-z¬÷Ûn¤,“~´-&S!ŒñW­¾eiá®qu*B§Ls–Ù[e:c„ì¢i¶Cõ¶<º.Ç·Ü'),('','',''),('','',''),('sfrink','0–å‘Zl Š$ìË4=Q\\wŒòPJó;‡ëU—õ:—0/-j–˜‰;ƒ#İ¤½Rª—_‘ßÏc¤õZ’¨ÊYABŠ¢œÚ€%”ç\'a0‰áøB¾×øú[®}1ôµ‘4‰­æ¸Ñ°ÖßÊ/‚ÒQXİ§¾S³','/ëÑxLŒîUï÷Ú{Ld4­6#|¯ÓT*²\\s¢˜Gó¸\nÀ5.Ç5I-.ò]¸+Ë(ã™IQ›nZCÑ·h°ÿ¥Çö†Që6ÂÛh~Ô}!y«ŠœŒáOrTL2güöùã¯ÖŠJè{ßÆ¤³\nŞRé‘Ò¬ûÃ­çx©Â²£$×æê~>\"b¦E P4ÎØªNV@¡hç× `îUíë“Ğa#Ë´S[Ñ}Çi=‘£3\rz^ü8àËW]!²¡î´çıæİiWD’£J1-‘ŠÆ‚©Øíà4ö,Ëä(-Ïù¥«&zÎSíz‚|u½Ì¼>=È´ÊÌi¤\'O2œŞ´@bË2ÂËLeMõŞ. mueƒ¸e±Ä[Íön´1HIgu8CéPÄ¬|ƒÀI-*yn)¯xve?(2¯\'yMƒûÃ¬=ÑNq%¸lµ.à­“ä?T¾Ì£ÀÎkÆæ«ì±jM&ö&³º•ÜgØ¤£q\\ùÜ9'),('sfrink','Ú—_)¡Ù¸	™Î•J¥œR³4kÇšm:_û@P¹#Ñåså¹4/\"‹˜,ˆñLXÏ—+7U}xÔ°ŒkF/ù®w7/Æ!zï»PŒEc¶ı5!üĞ‹.µì\n¸ˆÆËStJİŠ©r—öO)¶«y¶ø(]û\0zÌúÊT*¨','J»õÕx´}\0$^LÊ2$·ˆ‚MšZZ|â†Á÷¤\"µ–ÂY=~ıäâl!J¥Zúµöb“ªÜAâËæGHa2áÀ¼6Ôs^N.ğbHÆ´ÖË$tK÷ãá(Y…6óßÖhÇQÒÒGcc&8 ×Òõ\nŠ\"…g:;ÒEK±ğÅw»˜{ü/j­ÑBşâN5¢y}]œ¥íû2ÏÃşŸoÆJŸ¹¢QØÎ#Pì=‘ŒÃŒøòÖ$ZùTóÇÌsQË\0\"°æLn®ŸÏnºáÂ[îjSw]5¨IX¯hâŸM”>^Ô›sY¤pù?Kã8äÚre“>›d_x(PéCğGÊå£áåXå\0)§G$×B‹B¼“‹Âê`ÀºA(ñ´2„¥\ZŸˆFRYüëVùŠ¼–¬ıY²bîgnÿ£A÷Æ	Š‘IºÈÄ¯Dm9ÆXì\rg\r¿ß´´^š\'›´¼DâÁ™Î¿‹`v/Š6YãÏ“ê');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testresults`
--

DROP TABLE IF EXISTS `testresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testresults` (
  `vote` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testresults`
--

LOCK TABLES `testresults` WRITE;
/*!40000 ALTER TABLE `testresults` DISABLE KEYS */;
/*!40000 ALTER TABLE `testresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testvotes`
--

DROP TABLE IF EXISTS `testvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testvotes` (
  `nonce` varbinary(100) DEFAULT NULL,
  `encVote` varbinary(3072) DEFAULT NULL,
  `signedVote` varbinary(3072) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testvotes`
--

LOCK TABLES `testvotes` WRITE;
/*!40000 ALTER TABLE `testvotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `testvotes` ENABLE KEYS */;
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

-- Dump completed on 2013-11-13  2:57:41
