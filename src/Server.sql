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
INSERT INTO `adminkeys` VALUES ('test','\0��}Q�/���E2@T�3��Ŏ4|qvӿޏ��Y$�e���A]O�0ͺf���6L����M�WuM�\"fh�Q�_�A���p�͢[�jrd�$�y@8S4c�`F9e;�T�H�pbi','|`�b���\\I�=Mk�Weh�q\"��S�8�qZ+&���.�6�9�ܤ��v���\\/�����^����Y�1��>������dV����\\J�>Ӽ#��/Y��\\v1؏{i	��l��3�ڈ�V*a3\"5','\0');
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
INSERT INTO `test` VALUES ('sfrink','W��9��={p������&A\n^N,	��鵶��&�\"�؋��}���o���T7�\r<�ӯ��~E�jJ�mK�Lz�*���i��}�9�*��oU�\\�9�Y0ϑ e]��>c~b�I��*���','�����4d�%N��;�O���s�Y�C�!�D�P�w5l���9���7��d7�9���|G\\�1�w��a�So6/���T/��<�Mm��hP��(}���i,������gl�=�)\'W��\0��4ssIƁf@�.�#������(E<�A�K(��=2����q�\Zڬq�w���s5�̠�\Z\r��}��P�#_�[��xeo��W���DR|��[����W%���}:�������$���=ꀄ���\'�G�Ju�H��Ǚ{l�$�Rޜ&�s�?��V�ڊ�9�#�3����@�t��k��lTZ�J��/\'X��g\0-z���n�,�~�-&S!��W��ei�qu*B�Ls��[e:c��i�C��<�.Ƿ�'),('','',''),('','',''),('sfrink','0��Zl��$��4�=Q\\w��PJ�;��U���:�0/-j���;�#ݤ�R��_����c��Z���YAB���ڀ%��\'a0���B����[�}1���4�����Ѱ����/��QXݧ�S�','/��xL��U���{Ld4�6#�|��T*�\\s��G�\n�5.�5I-.�]��+ː(�IQ�nZC��h������Q�6��h~�}!y�����OrTL2g�����֊J�{�Ƥ�\n�R靑Ҭ�í�x�²�$���~>\"b�E P4�تNV@�h�� `�U���a#�˴S[�}�i=��3\rz^�8��W]!�������iWD��J�1-��Ǝ�����4�,��(-����&z�S�z�|u�̼>=ȴ��i�\'O2�޴@b�2��LeM�ޏ. mue��e��[��n�1HIgu8C�P��|��I-*yn)�xve?(2�\'yM��Á�=�Nq%�l�.୓�?T�̣��k���jM&�&����gؤ�q\\��9'),('sfrink','ڗ_)�ٸ	�ΕJ��R�4kǚm:_�@P�#я�s�4/\"��,��LXϗ+7U}x԰�kF/���w7/�!z�P�Ec��5!�Ћ.��\n����StJ݊�r��O)��y��(]�\0z���T*�','J���x�}\0$^Lʝ2$���M�ZZ|����\"���Y=~���l!J�Z���b���A���GHa2���6�s^�N.�bHƴ��$tK���(Y�6���h�Q�ҍGcc&8 ����\n�\"�g:;�EK����w��{�/j��B��N5��y}]����2����o�J���Q��#P�=��Ì���$Z�T�ǝ�sQ�\0\"��Ln���n���[�jSw]5�IX�h�M�>^ԛsY�p�?K�8��re�>�d_x(P�C�G����X�\0)�G$�B�B�����`��A(�2��\Z��FRY��V�������Y�b�gn��A��	��I��įDm9�X�\rg\r�ߴ�^�\'���D���ο�`v/�6Y�ϓ�');
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
INSERT INTO `users` VALUES ('sfrink','gC]��.�7}��������ѣ�O�N���C�','�V�0'),('user1','���K-2�|�2(�r����f��\0I~#��','�h&'),('user2','�����qJ&`�<�\"9PF\Z(z�*�\'�ӊS��ߚ','���Q'),('super','���̪�p�Ih��Oq%�����1HY���e�','t��k');
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
