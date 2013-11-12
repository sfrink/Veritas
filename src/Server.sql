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
  `pk` varbinary(3072) DEFAULT NULL,
  `sk` varbinary(3072) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminkeys`
--

LOCK TABLES `adminkeys` WRITE;
/*!40000 ALTER TABLE `adminkeys` DISABLE KEYS */;
INSERT INTO `adminkeys` VALUES ('test1','0Ç¢0\r	*ÜHÜ˜\r\0Çè\00ÇäÇÅ\0ÑEÒ}ﬁ“”=<5<˙]õ<G≈À’òËRœª‹Ùÿ˘/GiÇü™Î»»è«b6£)“Û)(Á‘ˆ÷õ“ ¿2R$,)ÛÇ+°Ñ9Íˆ1hhp≠\\ŸÈò.óN5~;\\‰9±∞âÀ$Â∆€K„_kn∞I≤GÄÀ—S7Ô§ÕQÒ»UÂ≤\ZGoxy|ª~]Z\nñ¸±y•™ºVú»gÜâ#.Ÿ7Óüb?fˆ/˜R€÷÷ùY.m\ZTwùßm#˚õ>>â¶õ¨(”,u¯¢iøÜ≈ÿë¯≥S	¢ßΩ∆”°Æ|EÄØ-jàsaÌºÖ<O„\"◊á±ﬂx¸§å^ˇ§4™åtÿ˜Ü\0Ì=-AaZ–`€‘Ωaç∫2£z⁄$öÉèâU¸\n«À¢˚iˇm≤F◊rÖƒ·2MÑHNÑ[£œY˚˙[÷CÄ§˝¨Ú*»π-t94ß+∞øï£XRxjﬁxﬁQéAwÏ–ÊÙÊa\\{ÏÖ	vÂDΩ\0','0Ç˛\00\r	*ÜHÜ˜\r\0ÇË0Ç‰\0ÇÅ\0ÑEÒ}ﬁ“”=<5<˙]õ<G≈À’òËRœª‹Ùÿ˘/GiÇü™Î»»è«b6£)“Û)(Á‘ˆ÷õ“ ¿2R$,)ÛÇ+°Ñ9Íˆ1hhp≠\\ŸÈò.óN5~;\\‰9±∞âÀ$Â∆€K„_kn∞I≤GÄÀ—S7Ô§ÕQÒ»UÂ≤\ZGoxy|ª~]Z\nñ¸±y•™ºVú»gÜâ#.Ÿ7Óüb?fˆ/˜R€÷÷ùY.m\ZTwùßm#˚õ>>â¶õ¨(”,u¯¢iøÜ≈ÿë¯≥S	¢ßΩ∆”°Æ|EÄØ-jàsaÌºÖ<O„\"◊á±ﬂx¸§å^ˇ§4™åtÿ˜Ü\0Ì=-AaZ–`€‘Ωaç∫2£z⁄$öÉèâU¸\n«À¢˚iˇm≤F◊rÖƒ·2MÑHNÑ[£œY˚˙[÷CÄ§˝¨Ú*»π-t94ß+∞øï£XRxjﬁxﬁQéAwÏ–ÊÙÊa\\{ÏÖ	vÂDΩ\0ÇÄ8∑XÓŒ\'_kù°X¢f]à(¸¯\"˙P}å åL1≤\Z\Zˆ´Âê æL¬X)ñÜ«ã´±ËçÓˆo\nnö®ïkeÁ«Lˇ<‹÷Ö¡÷∆ ]Âsèˆ¨pÕ_ã&f¿x1Œä\'_B‹eT®íè†yhxï–Ùd§«(uòr0€¥œæD÷˘\r4º›)∫ÈZ*nå¯ê+ ‹“:u Ë[F8â/qÅŒÒÎõû\\ŒÍûê˚œ$À8⁄Bœr>ÚÍgÍ—d‡¬t®Ìùl0¥x´ÕÅÌ¶t;Ò5:ÖπÀ{u˛¯Ÿ“VÌÄ4ÒzÁ4¥µyRÙ~R,m„∞Û\0ˆ}ÿ\\ÊHC…$éâíÎû….>6Ç†ˇ\\]}–çõlë@B5Ø.‚ûä¨Ä°√)„äîº2∆r∂<ÿ!ŸÖi∂Ì€ã#îV≈õG&›=ÚRÔYò§ﬁ\n>àGËË—ÿ…WÂôó`ùRÖ*∆òıG5‘ÛÊ&˘!œìô*ru@ *ÒRªo£·Å¡\0…»vø)~ˇ-[$Æ\nÏ›œ)≈F:ÀKTe€æ	uq14x∑2†µ≈Ç¥ﬁâ-A¬πëÜ„»ÇêRØF¯¢çuKïª=–õ£Je∫¨&;#$´\'Hıƒ÷z7\Z∫ólP◊¶Û	YØ\r™YVN`TÎ⁄P?\0ZéåHJ)z‚”≥°ådQÑlŸ_|13!jì#¡ÚMJ«≤OgÌ£»£ºk€∫MNI[|GŸ´¯nX—	È¬Çc9g·] ÛŸCÖÅ¡\0ß–HÅ%Ã\n rE>Ï27O ÙÄ¸Rò*ß12OÕÀ…j	v¶¡√GN•®ﬁxÅâõ|D1õèïŸß´Àq.«xÇÍú’òm√1):wÚ>∞£Ãñ˘CnÁ\n«ë∞3ÒÚ—c‰ @˚\'∆P∞¢ÜœAëR‹Êπu{ûúãÆÁî◊S\"Ê”ÒL\'ˇ˜∑ò Æ˜&T{¨®ó®‘¨˚V∂~≠ã#Õ≈çk¥“®Z4·‚˝Æ ]Ò´ó`¿D}√¥xE= A8ŸÅ¿1‚wILâÚ˜˘íe‹ôñtÇµKxyçøaô∑¯V%S#Ô~ﬁU+ñı”92ˆSù:Q8¬+ÈHY√÷SkΩùd{†é¿ÚÒidÀ5aM)* pùæ\Ze¸⁄ÑY7T€é¶çC˚*uAúL)¥Õ*X#í •ÃAr=Ò…S\\Q®ÂpƒıÈI[≈ÀK¥ºuEXªäH «ÊGÿz¬Ñ£8‚∆’Éƒj°®X˙á¢\'‡Öu∏c?]‚ª^©ß\n(TÒ≤óA∫)Å¡\0ñ@»ZR4RImfºfÌ›T”˝omKÏ˚\0ò1§POœûõ¢\rÖB8i›<l[WëNˇdk’yF£ûPã+‘·›·_oÿ -cG\rÅíw‰ßï—û/ Ø.>◊WÊèLDùÇíˆƒê~àiΩÌóîƒôPø\Z`’qõ™˘Ã¬’É˜Â6|¿¶¯_h◊’_6hŒpQç≤QˇπÜª90âºh˛{K_êíÌ˘Ã4ÂwÓÂ{añB√Çsì»ø]sniÅ¡\0úï åÑÃ:T+Ùêﬁ ∞§\nñ)Ow¿ä\'Û(Ì¡∞¸Ìw~µ=@’ÎeuQ]Víø,C5g1„CÙ˙È\n¨@^el`ﬂ•m7ÌqO(/Æ£ö™óÉôÿÊ˘h	µ4ã$p.ªﬂOÌ¸U©ù<”…È˛¢<ßÈØ>!±«2m4U†≈‰6ƒù∂œ≈Ñæh»6Mdƒ€/>fx“AÊX4n√Ø!–8g`ô?Eº\nhP!îI. üv˚üTS≈“MZn');
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
INSERT INTO `users` VALUES ('','��:�&+���a�W��YO�;\0�1�Q�?�','NÒ7'),('ssfrink','�8Ny��ێ�D�\r�M��j��f2��z��0�','�5�V'),('sfrink','�-	+\n�i�>.k��G�n�&���3����O','�tݗ'),('test','�� GIE2,6;Qߠ�o`�~��Ek����N%','��AK'),('','�$�l�zߥ(@�%���]6h`�4��j�S�','�'),('','G�s��<s�˶Q��j�C�_�.y*������!','S���');
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

-- Dump completed on 2013-11-12 14:21:08
