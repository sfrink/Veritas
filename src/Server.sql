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
INSERT INTO `adminkeys` VALUES ('test','\0��}Q�/���E2@T�3��Ŏ4|qvӿޏ��Y$�e���A]O�0ͺf���6L����M�WuM�\"fh�Q�_�A���p�͢[�jrd�$�y@8S4c�`F9e;�T�H�pbi','|`�b���\\I�=Mk�Weh�q\"��S�8�qZ+&���.�6�9�ܤ��v���\\/�����^����Y�1��>������dV����\\J�>Ӽ#��/Y��\\v1؏{i	��l��3�ڈ�V*a3\"5','\0'),('test2','\0��\n��C��x��9?�U�k͇6�f)��[�X��$��u��.!ܟ���@2.���%��Z[�X\ZF���2���Ĺ�\\�N�����f赽rۇ}T�J$����8��O�~`n�s���F�*��u','�)�5\rS����z�m�f�+ܜ�@������y]T!�Y	�p�w2G�n��b�\\��t�ڌX����>��n��\\\0�?�-������av���nw\Z6�k;pZ�.�UY�6��>�D̆�w5�8�','\0'),('test3','\0���\",��g���/��G�#ĝJoGDٙ����j$���kR�)����s�ǛH/C۞��@0�5FqML{�Bh�(f9)�66w�E;���q�3�����-��8[�W�f���̼F���	��W�','*\0m�R�\n�[oD�U�b0~�B�+�Hh}sv\nbpx{�DG}���\Z&AX��_�����*��Ki����ܔ&��b���`��(�e�F�C�#e�~L�)���7y�Y7i�2��.��]���w ��W���Cy�','\0'),('test','\0�@<�R�R0:t�j� ��J��Ѷ��N�8��}�٩`b%kу��3�}Y�q�3���}���˾\r�\r�vrw�9�����JM=��$�>Hҷ����y�Y�d&�-+}�H{͢�s#�v�����c','RL�{_���D����\Z\r���:�Oźm�J��(�p�C\'����R\r���`U�Z��e��S��`��9���8J�����_��W^�ܯMb��A��%��;rX���;2[��{%����','\0'),('test','\0�a�^z��/\n��P���\Z�Prd�<ew�%Cǫ���B������f{z�Ny{��\'A�ݨ.�Je�H6��1��B2=�\'Z�Q�5�-��9���A~o�=X�.��j&Y���/�b������F�y','_����Ȕ�P3˘�=r\0��u}P?�`\0�h�$��ppVȞ�Bb��!��Wm\\|�ŕ�d�E7���d�[��j��^�rrN�B��=tk�t�CV3*LȾ	Κ[�}�)\n9�q�����S�9�','\0'),('test','\0������\0G\" �W����Uz��x:�w#��{��@u{a\'選�X�y���W0���h8m��6��r%�kP�\ni�����d��\\~A��#�棽�F��话ö�t.F���]�<Jg�h3G�_�','E!5@ƽ��vr�CI\0�A�*��JHD�۾���8I�)%5�8��-��P��z���9�R��-I����a�8�P-Z��sr�5���k�դ��up+[�*�\0�,�|/���\n�s��\\z	S�\n�\";�����[F�','\0'),('test','\0��0��՜��8��Cd��Be��e��.P��^�6���ajW���!B\n��\n�/Ժ<�o!���ꘇ<m����d�yl�}���D��f\r��4y�Z�o\nR�/���=pVݿor+�R+N�\" ��Ü��%','2Hb��L�IT��sp`�*k7����4���}}nS�NSon�FC͙{�<3�ǧ�ƹ�f����Ֆ.e�yU)�j�,Imx��n����.\r�d���v�봶�� W��f$����VG��Yn��i','\0'),('test1','\0��=��GQz�i�N�u�*�5!�PƢy�¶��%r&J�b�r�(M,r��o=�����;\"�`�;1�)yK�Y�*	�״��PI �$Jf����+�@�,���D�`�����)�JՐߒ>N��','(Xs�Ό������V9)��pV�s�)͆8Ml`�w�⺩Z�w-�9��/�\"\"����i�HsE����X^E�wj��dC�����;��\r<,{�v �f���W)�6%f^��~3��Ӑ%U�g�\\�}�%k͙','\0'),('s','\0�e!���ʾM��ܡ\\K^�ǃ�vo8��<�����՗WD��l+����0(4\0�\0�u�\\L��#1�?R7�����^i\Z1C��] ���޾E�nb�NQiΣ\n�[�\r��~#�\\7ۙj?','>��phl��ϻ��%��c�Ð]��J��6��gwO�e�s��Ư�����Χq�����xq��phDT��3�@Er��A\r�؛)>4��pzb)���ؤ�6!Ռ��v��OǘFu�☄���5�o','\0'),('test','\0�/̶a��a�f�|���J�_���Z\Z�j�&7S*c���5A9Y�X�]���MD\rր�ճ��[�:\rP�eB�{R;�t�\r�;\'b�?��lGAF-����9���Hy��j��*��CL�?-�D9�W�','\0�	\Z1�̙v��ɹ�yyD*��z�+X/�\0���$�F������Cub�o�+��3^���{�D�m�`�ܗ�K��J����7a������i]iL�3ڶW��Y���Q�G�J�t.#|��2��҃x�','\0'),('t','\0��F\0�\0�q>ޭ E�1�i��\0�Xq0�h�z-��Czn\Z���q\\�<θ��SQc�k�7\'Y2�U\0�֏$}�������z�3=��X��-.a�gy�s�f�S������l��eÊ`*��65{=','\"��h�h�Ͼ���� U�D���\Z�H���}񽬁��Pb!pR�]9��������Om�\r®��f���T7�SO��Q�W�����\\���l���\r]R���a�&��\'wE�J�c���!�>M�#��q','\0'),('a','\0�ţכZ�/U&��E�m#�a�)�BjL��Z�r��b��l4�m�E���A\r�Iƽ��]\'c��NW�\r��fg? ��$����3����d�/��	 �_��M�~\n����qA��̑I��%��\'�',' ���[N�t3���dB���צ�q�^T1��F�{%��	XG\\�������gf.�l�-�`e��Ho�(6*�\'VC$�S�3֭G����R,ɍ�A�^�oۊN{��:3\n�A�:������ |�F�','\0'),('test','\0�r�!�leO��[h,���?ώ�a2��%+����`Y���R����Y����;���SA�u�6l��dj����� R���Ԍƒ���^����㑋+B�\r)y�܎3?}c&�«kz�;�h	 �\\�Ԙsc','X=@�C�rYGB�X�5�sA\'��nF��e�@��B�g)���V����NgyU����1��`P)��Q�\'U���5�i[)i�j+i���\\Nv�9�:�Ӥ���l�\0\n=�b=t�Հ/&L@I,�E%\':�8d�A','\0'),('test','\0�O4��D��U�+�0Tk\'��B�f��Nu�������=���� ��w��=7�M1.�Jd�q��4>���\Z�������}��86����e�v���BC�=}B�Ł��#�~t��YuG','\0��i���#ꊔ!6���bv=/�@����i�i`.,eK���2wD��M�E~���M~י<,h��c,��	���[(��}��zZ�/�2(��b���KH�#�b1H���\'gR$[k=P�ȾP��h��YlA','\0'),('test','\0��\\?7y��F�\r�%�ŉ�I]K�߶ (�ݭ�x�<�ӎx$=���p�0�D�G1l��v��]���\0��>[)_~ �>�$T[,�\'��xe�~)�1.<���^A�G`�\"�j誠�͡q0�X-�p�ޕ','@�\0�\\z�W�����%:}�Z��z�)�g��R��ȯ��?w2��dN����Z~h�[`:\"0���,<88A&Ӡ�e{N�5�Y��iw�V\rr^J�\Z�*�T[lI�$J���i���wd��\0����','\0'),('test','\0���+�ֶ$W������҂���_ieb�N�ɾ�|цP��\"q0�� �G�ǚ/¹���-�����ݪk�o�Z�0U#_&�U���8y�i�B�-���-o2w����\ZR@�?�!�_kH>��R�','J{MYd�o�E�[�5hY�F��d�QvN��n\"G���jM��mf	̅�^4��h�v�_���!{�zÇ��Ict\"��K�XP��&��x`!0���O�d\0���W#\n�/����/��י��','\0'),('test','\0���l�s����6���}W0�E�`�XD��0�����^�lS夬b����P�`-\ncn�h�������|������Cav`�.?��9�aH�3}Tu��Ә�KTB.�L���)�k\r-�6��u��','\0��3���$��k�u1�e�_�&�Rz�\Z�a��v�S¢�И��՛v���R�	�71�7�HE��@�h���y�}�����^K�(����3h�(��@m��?���ɄD�\"�|���n7e�ͦ����eA','\0'),('test','\0�iۧ�mF�&��ѝT�dW���ӈ�N��������q8ni�Q�~֧�3���J��}j���e�7F� F\0� o� �xˍ@�q����[��ˌ�\0���l��\n�C�Sȍs�K8r�M�̖t1Q','!��KrJ�{*����f��*=�� ˡ:c���H�e��`52п[5�؅���G�O*�i^�!yO����ڽ8RP�F��rϤ��:��2�\r{�����G56���u7����Bc+��Մ�fm�9/q���','\0');
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

-- Dump completed on 2013-11-13 15:52:14
