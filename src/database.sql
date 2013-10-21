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
INSERT INTO `adminkeys` VALUES ('test1','0��0\r	*�H��\r\0��\00����\0�ҧ��\n]M��d����ZNA+�jt^�ͼU\"T��y�ц��@�egl}���]��\\��4�Cc˙�����9��J_��&sYm\ZRwE%4r��o�״��ϰ�p�ĎC�	�9�.cW-t2783����}h���bP�8�/���j7U\"�WAu��H���nSsi�yC�\0H��ݗ.k�G�Vqv��YO|�\"U�h�s�ҵ\"^m�\Z\ngV�!�g�����i�|L�T�6�Zz���4\"�$S�\ZW�߂v������\0p�ʁ��J�?=��5���	����F(�}9��29l���51�ɬ�@��:+�x4N|\0��_�Yv	�=�ޡ3_��;�q6�J:��˧���@0�$��x�C%����o:o�W�$�\0y\0','0��\00\r	*�H��\r\0��0��\0��\0�ҧ��\n]M��d����ZNA+�jt^�ͼU\"T��y�ц��@�egl}���]��\\��4�Cc˙�����9��J_��&sYm\ZRwE%4r��o�״��ϰ�p�ĎC�	�9�.cW-t2783����}h���bP�8�/���j7U\"�WAu��H���nSsi�yC�\0H��ݗ.k�G�Vqv��YO|�\"U�h�s�ҵ\"^m�\Z\ngV�!�g�����i�|L�T�6�Zz���4\"�$S�\ZW�߂v������\0p�ʁ��J�?=��5���	����F(�}9��29l���51�ɬ�@��:+�x4N|\0��_�Yv	�=�ޡ3_��;�q6�J:��˧���@0�$��x�C%����o:o�W�$�\0y\0��T�mE�(��浐���	W#Ӕ�٢5=݁�G��6�e\rh�X;��/��/�1V-K$�+-�j�8�>9�F����J��5`��\0�z^�ق�[}�?^��t\"t=K�;ᗭe��.��M\"<��\0�!�����\nC�^����-{󑭽�E6Z�P32�\\.�c\r�1&�_�9O�A!-eu�v�HҠ�7!0���R�v*�S;\'�CY\0|W�Q��&�o�=|��{`4*���pD�&��mׯ,���9~�8�k^^,0�)���N�vg�LAr��W�U�۞7��H��N�5�=�J�τEK��Ԭ�^RD��\0���r拫��:�I>�������5����L�F}��^��o�\nXj�d�tL&����g���!�}�xĖ�˚2r����\0ܖ��:N�8�R�����-^M�ɭ6�`k@\0�ލ��f ��(֮����mhT���ԯ���k	ԗK�h[�Į>Ȳi9H�*^F��3Vl�[+�x�`�\r��<j9�[�g��[��W?]���f~��p�=H��Z7���{��M��E� �iծֽ�\'�~88�E�����k�J)�f�˼�\\:&�M�\n�+��\0�^R�\no�ֳ?�/��\Z�+�\"�ف�����3�&VL�g�Jƭ6�OJ�}a�1�)\Z�A�מk�I�t�xAQ�Wcɻ�C��c��g9�Fl�	8\ZA�N�\n$�4 KLbi�9��%��\Z�I��6b���W#����34�\"̎���F��9��l5�n�KR�̕��MU�N)��\Z�g���,��0�m���X�T�]���0���)�̠HG�e�R�\\��\ZM1���E����i�%r�}c�%,�*�	���������7���Q�:jtg�SS�l,*U&�Y�� f��QmC�6���f�LTۣ�<JX&�h[�|-�;DL�\'�u�;(�1�SDA�Dp�+Oa�2���S��0c\n`v�������$�ʫ�q:@E�⛍�%P���!+�;�Yt�n�Ϻ+vcB	(:lrЕ��τE9�<��\Z_]�Z�h��TD�,�^8bLe�\0�E13��Cj��Pb�g��~\"cxц7䄠��g�\"��u��,�|8���ր�������YH��ᑀ�\n��1WlU���6o�ɩ�$)��{��^�f��Wr��zCg��*���mDR|�7=�|sʽ��j�21?�Z�}acz���8�d_�3=_�7��,�\"��8�Sы˴׏w�o�������ZG�D��r�������C�w�͒KIp��<�y��7?l���Z��	)�Ȓ���SDc�#�q�Isx�xt.�N��f4`�[wϢ�`��Ԭp�CI�����3�ߓ��d)4�S�do�̬�\'U�OUH�A^?4�NmV�!'),('test2','0��0\r	*�H��\r\0��\00����\0�Σ-z.�g��6�a�Ekvw7������[\0p�Kc]�Zt_k���;���]XC����pf\Z\Z2`^��7+����(F�U�򏎒\n�\"JZ��m#�;nV��=�L��j|�Ϭ\r����i������agNۘ���ܭ!��h��7���@�r���J!�P�����$��8E�S�$U��u�:���7LĀ���Y���Otn�AH�Μ��t�\0��H����X�ӥ�l��]Z�8o��+��D�q����OH�u���=�_S���?#��he퉮�M����\Z\r���aإ�ӘXF�:w�e��S�*��hL���6�)�]�^L��ہ!)w�U5�Y�[d�9�\\���5�b1�w��XUyk\n�xv�D6�1w\0�����v�9��\0','0��\00\r	*�H��\r\0��0��\0��\0�Σ-z.�g��6�a�Ekvw7������[\0p�Kc]�Zt_k���;���]XC����pf\Z\Z2`^��7+����(F�U�򏎒\n�\"JZ��m#�;nV��=�L��j|�Ϭ\r����i������agNۘ���ܭ!��h��7���@�r���J!�P�����$��8E�S�$U��u�:���7LĀ���Y���Otn�AH�Μ��t�\0��H����X�ӥ�l��]Z�8o��+��D�q����OH�u���=�_S���?#��he퉮�M����\Z\r���aإ�ӘXF�:w�e��S�*��hL���6�)�]�^L��ہ!)w�U5�Y�[d�9�\\���5�b1�w��XUyk\n�xv�D6�1w\0�����v�9��\0��\0�?������d��8kgZ�	-��Ҡ�1��==+��_�1p<��h�$r��<x}�nce�|�������qc�p.���GHcؽ����Bw#H��N�W�c�\"7sc�c��ڙ�/V�ɰ��f|<�EV�Q2�u��$� [�ɭ���}�����HR���@�?�Q\0]���X|�D���zO��)j�5����&�`7�QZ8~\07Ҥ�L�dUͼK�N�:�S?!<W쨺��o�x�֧��Z04I����W�꡵V���_#�Y�P��(�כ%�z�t���R�SQHs×\'�-�]�-���#[)�ug�\"F�tκ�q	�Zt��t�L�[�6r�ӟ�g2�gdh�˸��۪�a(	��0I�,��B�6qFi��A��\0���qRE�dl�t&?��f!���E N��#M1 �C�z�T��.؃�	���@c	�Tg�{�T\r�X��P�����tT�!m#�4ĄJ�k^тy5T�6���{����Dz|+�Kd�IÆ��<�b�̞|fۤ�;7���Jc��\\ݱ\"�р*a\nɇ���j�		���}-Og���hh%}L��tO�8�q��\0�VI��\\i4iE4l/@����=��a��0�>	��x^8ͷb��i*�3D�kEg�t���� ]���m�D��\n((�\Zc����4���K/�hW�͛��kD]Βx���b	O���x{��8����li��k��-�U�L�0P�w]�2��68�����]L��M#&|sF��x\Z:���M�ŷOޭ%����O��[-�uH�n�%7O2vՋ��c��$���`R�a\\��֮s����4VE�E�XdZI�U� �Zz?k�th��>�Ӛ|�mU�%GdV���:����\"!�h�|\r:S�8�Q{��:nGJI4y��o��.2�B�Q�� P�8/(�lBn\n�.c��Oxh.����D�9��PXY���$�nfb����.���&���\0��[�?n杞�!�,N�Sb�MS#U�=i���r�c&|ÜX]�SD��=�bcvh��g��dx�NeG�f�%E� 4�Y�1卒*\0�W�q��4�������B����?G6� fC����$f�|�����ɶL%�	���o�C=�	󦂢q^��q��g�+�虦)6y;xhf��V����-�NBͳ���^]�@�<f�����1�^t�)gC�B�n�c���|�����1GQۯ2�Pr,�\nJ�O��2W���:��$搄�+���v�\nK�5�&�*�=�\'&׀��X�{ͪ���K�F�gƝ��s�]fA�YM�s�`��\rQfBT���V��5�vE�����I�̶�����H1��S���	r��&`OSR��');
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
INSERT INTO `voterkeys` VALUES ('sfrink','0��0\r	*�H��\r\0��\00����\0�6����\r�����⪸M�̺���mG�fP-Q����^Gv�C������\n*��o��<b3#�;Xڌ~o�d�t�m��g�Á��w��0�I��ٵ��Ě�������w@��2�y���]��r�4�6n՜���3�Tڳ�FK�Ggu\Z���#���{ep��c�Q�����i�`�@���\n>�l�|�4B.�%��O?#���}9����T�4´���z��+����T >v!��0�(���,�y[,>_��G`Sucί�y<�����D\n}��*�z�39��ũOeYc^_�ՙ�����^;����\Z�\'�&�ŋ.����pϕ	/��ÉK��)����\'��$�=�օe�U��c���`��ue�z�ǒ3�\0��G\0','0��\00\r	*�H��\r\0��0��\0��\0�6����\r�����⪸M�̺���mG�fP-Q����^Gv�C������\n*��o��<b3#�;Xڌ~o�d�t�m��g�Á��w��0�I��ٵ��Ě�������w@��2�y���]��r�4�6n՜���3�Tڳ�FK�Ggu\Z���#���{ep��c�Q�����i�`�@���\n>�l�|�4B.�%��O?#���}9����T�4´���z��+����T >v!��0�(���,�y[,>_��G`Sucί�y<�����D\n}��*�z�39��ũOeYc^_�ՙ�����^;����\Z�\'�&�ŋ.����pϕ	/��ÉK��)����\'��$�=�օe�U��c���`��ue�z�ǒ3�\0��G\0��\0�^�]�p7��:���p)�\'�9h�o��;.�H��(<~�3\0u��L��[��q���n�٪�\r��1ǩ���O2�h�v>~��L;��DLhA�β�L\\X��JYͱZ�\'ʔ��=ܱ���;C����L�:���=@�����)�\0#l��2�eՑ�&��W~��s�O�v��*��A�����E�g�z>�����_\\>��U�䠄f��VJMŠs��W��C(��X���{X͵���t,R���\'��I�e���*�ʊn��#�ϫt��\'�b5��-���/8\\Z��+й�-(v�y��\Z�^�ܱ��\"\ZM�m<Q�fH�@�/7J#n.ǻ/��]3Q�kbz�p�*�0��v�M\\�������7]��\0NƝh�W����iA��\0ž��zs��\Z��\\b����7:���B,	�LK����nQ+\r�l|U�����Vo�cC�_��Yu��k����@7��A�2�(�x\0+Qγ4�����Ͼ�����	��ԙ��d=M��b����)(��+��\r��+w �uƕ���v��*�Gy6y��)|\"�7�o�/���mv�S����\0��\ZZ�!z����z��>�p�楻�}�#}W��H����O�I��$h!���[[~�Ǒi��t[N��2���\'[�������\'[\"{,\0�J�b�]�jbY���0��\"y��F?��\'��*ņs|3uUZj�U�4t��Ww>��b7�K�U{&Op$8�`9�\ZpbCl�cݎ+���Cv�(�Er�p.۫��\0�D8���\'�Fg_�0�\0yR�%L\n�jՍ�o�#&I�OEef͡\r���z؀ɫW���Ūb2����~\0�a���W1��G�a�:!�TL@@�|X�!�1���4Ղ���]~c�N�m}�P�F1�ՠA?�+G��8�SW��ʓ4�����ń�;�#[�o1w)��^ꪎ	�β�hk淜��1 �U�$� uxJ��\Z\Z	���kdjs�/�.�Λ�XK�܎���r�;�IW�N�5;�\'�=Gr	��v\"�2�m��FE]v\"s:����o:���6pB��\"Q��E6������}����e&�O�p��?ǭ�NS�p��\'��\04�Ez�*7^	�|��Ҝ��y�ֹ��cN���P������a�;ca�%�Vu��.�����[��e��\0�D�j���]g�v�i�k]�k�@y��.7+d���ܜ>(��R�S�+#n�bk)���p<��x���U�<��&��*���/0��DN�}��y�Π��71Uf�&7,*�yF&Àvn�c�����6T̎���q?/��9 Wѱ\nGg�k�b�(Z�Hx9����ܞ6`�5t�o��C>�LZ');
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
