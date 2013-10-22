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
INSERT INTO `adminkeys` VALUES ('test1','0��0\r	*�H��\r\0��\00����\0�E�}���=<5<�]�<G��՘�Rϻ����/Gi��������b6�)��)(���֛���2R$,)��+��9��1hhp�\\��.�N5~;\\�9����$���K�_kn�I�G���S7��Q��U�\ZGoxy|�~]Z\n���y���V��g��#.�7��b?f�/�R����Y.m\ZTw��m#��>>����(�,u��i���ؑ��S	����ӡ�|E��-j�sa�<O�\"ׇ��x���^��4��t���\0�=-AaZ�`�Խa��2�z�$����U�\n�ˢ�i�m�F�r���2M�HN�[��Y���[�C�����*ȹ-t94�+����XRxj�x�Q�Aw�����a\\{�	v�D�\0','0��\00\r	*�H��\r\0��0��\0��\0�E�}���=<5<�]�<G��՘�Rϻ����/Gi��������b6�)��)(���֛���2R$,)��+��9��1hhp�\\��.�N5~;\\�9����$���K�_kn�I�G���S7��Q��U�\ZGoxy|�~]Z\n���y���V��g��#.�7��b?f�/�R����Y.m\ZTw��m#��>>����(�,u��i���ؑ��S	����ӡ�|E��-j�sa�<O�\"ׇ��x���^��4��t���\0�=-AaZ�`�Խa��2�z�$����U�\n�ˢ�i�m�F�r���2M�HN�[��Y���[�C�����*ȹ-t94�+����XRxj�x�Q�Aw�����a\\{�	v�D�\0��8�X��\'_k��X�f]�(��\"�P}� �L1�\Z\Z���ʾL�X)��ǋ�����o\nn���ke��L�<�օ��� ]�s���p�_�&f�x1Ί\'_B�eT����yhx���d��(u�r0۴ϾD��\r4��)��Z*n���+���:u��[F8�/q���뛞\\�Ꞑ��$�8�B�r>��g��d��t��l0�x�́�t;�5:���{u����V�4�z�4��yR�~R,m��\0�}�\\�HC�$�����.>6���\\]}����l�@B5�.�������)㊔�2�r�<�!مi��ۋ#�VśG&�=�R�Y���\n>�G�����W噗`�R�*Ƙ�G5���&�!ϓ�*ru@�*�R�o����\0��v��)~�-[$�\n���)�F:�KTe۾	uq14x�2�������-A¹���Ȃ�R�F���uK��=Л�Je��&;#$�\'H���z7\Z��lPצ�	Y�\r�YVN`T��P?\0Z��HJ)z�ӳ��dQ�l�_|13!j�#��MJǲOg�ȣ�k��MNI[|G٫�nX�	�c9g�] ��C���\0��H�%�\n�rE>�27O���R�*�12O���j	v���GN���x���|D1���٧��q.�x��՘m�1):w�>��̖�Cn�\nǑ�3���c� @�\'�P����A�R��u{������S\"���L\'���� ��&T{����Ԭ�V�~��#�ōk�ҨZ4���� ]�`�D}ôxE=�A8���1�wIL�����eܙ�t��Kxy��a���V%S#�~�U+���92�S�:Q8�+�HY��Sk��d{�����id�5aM)* p��\Ze�ڄY7Tێ��C�*uA�L)��*X#�ʥ�Ar=��S\\Q��p���I[��K��uEX��H���G�z�8��Ճ�j��X���\'��u�c?]�^��\n(T�A�)��\0�@�ZR4RImf�f��T��omK��\0�1�POϞ��\r�B8i�<l[W�N�dk�yF��P�+����_o� -cG\r��w䧕ў/ʯ.>�W�LD����Đ~�i�헔ęP�\Z`�q�����Ճ��6|���_h��_6h�pQ��Q����90��h�{K_�����4�w��{a�BÂs�ȿ]sni��\0��ʌ��:T+���ʰ�\n�)Ow��\'�(�����w~�=@��euQ]V��,C5g1�C���\n�@^el`ߥm7�qO(/����������h	�4�$p.��O��U��<�����<��>!��2m4U���6ĝ��ń�h�6Md��/>fx�A�X4n��!�8g`�?E�\nhP!�I. �v��TS��MZn');
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
INSERT INTO `test1` VALUES ('sfrink','%���R�;sӅI�e�c#�9N>k_�2`�௝!_ܯ̢�[�iw1��R�u\r�|�2���Cv�j�ϟ��֬�$Jei���@T�`�v�ݭ�k*�5��Y�>ۇ7^§�;\r���	��FfY^O@��%�O��y�t�6���#4��\0e;����\"��\ZZ�A���d��@�[뗄\0a���:UTu�g�O��E�,f_�^�/�k�3]LGG��P����u�* �_~��ǯU�Q�&ȝ���K\Zg����9�Φ/v��%�+���lo\'ۮ,޳X\Zd_F�!Ѳ}�0��yL�R���k�Q���qt �������\nU�F�`��%Uv��@���U+y(�2��ǆ�c<j<��I','S{he�&�Q�w�x������-)���x�.�W�\\X;�E@|��	�oVN�+VUZ��~c�\'���C�[��J����AL�����	Ϟ�0�w��^\'�\n0(y�O���|%f��f3,�����*�v�a�߰���e��,\r�5ijw��럸u�zD1���*~�J�f�%�+[R�\n>���X	2�Bϒ�VA���6���f$��7g�y�%��W)���TI0�/D8��mW��tWP�M߽��vN\nP	�[)R$��c	�k!rR�{j��ߖx$O�?5qB}qӵ��LQ�4-[?�5˅����z`Q]���R.G_2�����^��O\Z����u�%���\0��ˉ��i����Dp�����P�d��0��>g�|@�~�n���');
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
INSERT INTO `test1votes` VALUES ('z=��\n���L2o�^�&8r�','Fi�w�@�q��M�F$','v���Ҥ�>�M;@��}������9�9�f�r�\0���0}�=sE0�u;��df�,�K����3m�R�Z͐��Ţ<C�wC�X��{Mc5n�hFl�k�h��ԥ�&#� ���´��Q7\0�\\m��)��5�����*�b���b�jk<}�?��*G�He���hY�� f��\\�\\��i��idGn�ƻ�+c.�7\r�Jp�E@�dq^�zε5E�xn�p:�bK��h�:Y_���B�m�M[�~ǵ�4�8�9����\\�-��ސ���Ift0��B=�p���!q�>ÃW���M?l��n�[2�jε�8����D��%�v>�z���\\b�]�-�3�.�t�6��C��~	n�FCb�@W��eĝ�\Z');
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
INSERT INTO `voterkeys` VALUES ('sfrink','0��0\r	*�H��\r\0��\00����\0�6����\r�����⪸M�̺���mG�fP-Q����^Gv�C������\n*��o��<b3#�;Xڌ~o�d�t�m��g�Á��w��0�I��ٵ��Ě�������w@��2�y���]��r�4�6n՜���3�Tڳ�FK�Ggu\Z���#���{ep��c�Q�����i�`�@���\n>�l�|�4B.�%��O?#���}9����T�4´���z��+����T >v!��0�(���,�y[,>_��G`Sucί�y<�����D\n}��*�z�39��ũOeYc^_�ՙ�����^;����\Z�\'�&�ŋ.����pϕ	/��ÉK��)����\'��$�=�օe�U��c���`��ue�z�ǒ3�\0��G\0','0��\00\r	*�H��\r\0��0��\0��\0�6����\r�����⪸M�̺���mG�fP-Q����^Gv�C������\n*��o��<b3#�;Xڌ~o�d�t�m��g�Á��w��0�I��ٵ��Ě�������w@��2�y���]��r�4�6n՜���3�Tڳ�FK�Ggu\Z���#���{ep��c�Q�����i�`�@���\n>�l�|�4B.�%��O?#���}9����T�4´���z��+����T >v!��0�(���,�y[,>_��G`Sucί�y<�����D\n}��*�z�39��ũOeYc^_�ՙ�����^;����\Z�\'�&�ŋ.����pϕ	/��ÉK��)����\'��$�=�օe�U��c���`��ue�z�ǒ3�\0��G\0��\0�^�]�p7��:���p)�\'�9h�o��;.�H��(<~�3\0u��L��[��q���n�٪�\r��1ǩ���O2�h�v>~��L;��DLhA�β�L\\X��JYͱZ�\'ʔ��=ܱ���;C����L�:���=@�����)�\0#l��2�eՑ�&��W~��s�O�v��*��A�����E�g�z>�����_\\>��U�䠄f��VJMŠs��W��C(��X���{X͵���t,R���\'��I�e���*�ʊn��#�ϫt��\'�b5��-���/8\\Z��+й�-(v�y��\Z�^�ܱ��\"\ZM�m<Q�fH�@�/7J#n.ǻ/��]3Q�kbz�p�*�0��v�M\\�������7]��\0NƝh�W����iA��\0ž��zs��\Z��\\b����7:���B,	�LK����nQ+\r�l|U�����Vo�cC�_��Yu��k����@7��A�2�(�x\0+Qγ4�����Ͼ�����	��ԙ��d=M��b����)(��+��\r��+w �uƕ���v��*�Gy6y��)|\"�7�o�/���mv�S����\0��\ZZ�!z����z��>�p�楻�}�#}W��H����O�I��$h!���[[~�Ǒi��t[N��2���\'[�������\'[\"{,\0�J�b�]�jbY���0��\"y��F?��\'��*ņs|3uUZj�U�4t��Ww>��b7�K�U{&Op$8�`9�\ZpbCl�cݎ+���Cv�(�Er�p.۫��\0�D8���\'�Fg_�0�\0yR�%L\n�jՍ�o�#&I�OEef͡\r���z؀ɫW���Ūb2����~\0�a���W1��G�a�:!�TL@@�|X�!�1���4Ղ���]~c�N�m}�P�F1�ՠA?�+G��8�SW��ʓ4�����ń�;�#[�o1w)��^ꪎ	�β�hk淜��1 �U�$� uxJ��\Z\Z	���kdjs�/�.�Λ�XK�܎���r�;�IW�N�5;�\'�=Gr	��v\"�2�m��FE]v\"s:����o:���6pB��\"Q��E6������}����e&�O�p��?ǭ�NS�p��\'��\04�Ez�*7^	�|��Ҝ��y�ֹ��cN���P������a�;ca�%�Vu��.�����[��e��\0�D�j���]g�v�i�k]�k�@y��.7+d���ܜ>(��R�S�+#n�bk)���p<��x���U�<��&��*���/0��DN�}��y�Π��71Uf�&7,*�yF&Àvn�c�����6T̎���q?/��9 Wѱ\nGg�k�b�(Z�Hx9����ܞ6`�5t�o��C>�LZ'),('calvin','0��0\r	*�H��\r\0��\00����\0��]1kA��S��{&�0�M@���&�l	�?�D_��Qs�&dD@3���~��VF���vMS���P��[C뮏i�:M����YO�ÉdSng�w�G�O��J��y!X��Ȇ\"6�(�|�z\"�����3y�KPT��C�ٞ�tQ�D�S�6�����m�Ž\'���|\n� \0�1��_~%j�����y��\nï�*�\r-\0.E[w��Yt�-9*�Yqe �\0�=|\0��ѥ5Z{|�3\r�>h;���m���f_��A��ס�}���7\nd�rk��h���P�ϟ�A���Vt����в�l�����tv[���1t0���~�1��f���Y����OK�7\"� �ي�3z;�����S[n��z�D#��\0','0��\00\r	*�H��\r\0��0��\0��\0��]1kA��S��{&�0�M@���&�l	�?�D_��Qs�&dD@3���~��VF���vMS���P��[C뮏i�:M����YO�ÉdSng�w�G�O��J��y!X��Ȇ\"6�(�|�z\"�����3y�KPT��C�ٞ�tQ�D�S�6�����m�Ž\'���|\n� \0�1��_~%j�����y��\nï�*�\r-\0.E[w��Yt�-9*�Yqe �\0�=|\0��ѥ5Z{|�3\r�>h;���m���f_��A��ס�}���7\nd�rk��h���P�ϟ�A���Vt����в�l�����tv[���1t0���~�1��f���Y����OK�7\"� �ي�3z;�����S[n��z�D#��\0��\0�#��E\\ڃ�R¦�_\Z�*ޏ�}�~��\r�V�\\Ld��M�ʜ���������O4�vF����\":u����cmKw�Q��R�j����;�������D��\nr[�\r���\Z2�+�����A\"c��#�z�;���\06O�5���;$P��W���*PO��\\��\"��(��h���+풳M�x/�<�8�o]>R(�K��(a�||&|��g��H�/!E�p	���%�#� @$���Bh��Sf<(���a�|3���P(ꏉ�\0%`��ZC��+��Y�zh�G�dq�H{�\\�v2��;�aqim�b�h���)8��t5��X=�F�NK�]9��)����V썐M�0	\\���}	��.n?j ��\0�Ay?����2��1�VB��>iwN�q�\0����/�PX��V+!Tв�wC���h�����p��h�?�Ѡ=BzS�=\'A�h�\0�#e�3�g���J�|��,�V��/bZ<@ܙ:o7��h��oX���Y��$�w���\Z4��|G����Q�]��vW�y��pX��u\"^�]�b��i��g�����ș(ڽ���\0�Ry\Z߾����K��l���:W�]6āǄY�hs9Y7�١S�N�G�k�n������^T�T]%x���/���_�˛x?�~~;/_N>�F�\\U\r� MF�D�[usi�\'n��,�f��9\Z_.@�\r�z,#a�\ZI�A��D�\'a,ڶ����o𘃦����͋:}\0�V�\'`T�N��L��T�>��r�œ_�)�4=�f�P9���c(\r�m�kx�4;�r[����\'��*\"�\r�Ɖ���GHJa`#[M\\��J��^N)P9<�a��dJ����\\�h� ��.��i\Z���d^t�Y�F|X]K�i\0\0*��x0̋�l~�~�T��z�]z��/��PQ,�kZ\Z����i�p���\Z��>ROt��a��VC:2ӂ�1��y�V��3����+��l�M=3z$�����4-�褐.+�Qr-��ht>���R�6O\0/��\0E 2�R�G��d���Ţ\0�����+��O�\r���n+,�\'~�v\'S�K�5���.����\r#�4��a�\Z�\r\Z������\n?��&�I�� gh���\n��i:�GZ.W�Nb�\r��b*��RUb��\0�\nNu�z����W��\'b�rhce���ݡB:%�Yg7����rnqɸ�\n�k�hz͢7���Y�y�\nk�#�¬�ׄ�kR�ҡ���C/QaD�an(N��mXs�l�C�c$��M�U�����u5�wU����I�+��9R�ٞ)ۢg��\"X:y؉6���\0I����0�,�L�x�'),('user','0��0\r	*�H��\r\0��\00����\0��=�ħQ���&�ko:a�$�r]v2��׸�����O{@�t~�:<a�YB��� ��^�5�GH��=-5�h8gEK.U\n����g��)�[��_R���@cE3�E�\\��=�ȸ���[�	�j�.����P�GK���P��4�p9�2%d})�� Op��aY�P���[�N����2���ML���Y.�<�$.G�l�e~ :n���.�os ��s�Ю\rfN��g���\Z�!���֟l�>[�03����r�ht����9���t�t�.��y6�C��S�\n ��aA��\n�q�ia^��o�\0�v\rӬ�iE��Q��2��n\'=�zX�j���vE����jO�W\"u����4L�A���+!����d��\0','0��\00\r	*�H��\r\0��0��\0��\0��=�ħQ���&�ko:a�$�r]v2��׸�����O{@�t~�:<a�YB��� ��^�5�GH��=-5�h8gEK.U\n����g��)�[��_R���@cE3�E�\\��=�ȸ���[�	�j�.����P�GK���P��4�p9�2%d})�� Op��aY�P���[�N����2���ML���Y.�<�$.G�l�e~ :n���.�os ��s�Ю\rfN��g���\Z�!���֟l�>[�03����r�ht����9���t�t�.��y6�C��S�\n ��aA��\n�q�ia^��o�\0�v\rӬ�iE��Q��2��n\'=�zX�j���vE����jO�W\"u����4L�A���+!����d��\0��\0��?�g�O�c�;BI5o����<�˚P\rO�!eF5c\'S��I����h�mݧ��C��-vJ���9m��>��8�u��<��{�9��4�GsK7����\\\\v���\'Td}	Oϣ�A�SP�!b6�=�D�,��i^��/�)��F\'h�Џ2g���yF��۔Z��}���ND\'p�ZT3Cn\\\0u\"w�pE�9v;�i�څ���cY�`z� ���/�eb����L��6\'�O�K:MF�(0͸��u\\��D�,1m�<�z����x9}�u^�\'�X�{\n�\r�|�.w�O�6�.Op��\Zb�yrr�t,�41��1�ES�N^]\'u�?{�� 9�#2���OL��\\�.�q\0E�\Zn��dç���«|��͡�\'f9�E�I��\0�L��j�������^�^�ʯy��ʵry���J��=,��d�	���<���!o\n�>�X�\\��t��#Knf���f��U�2:\Z%l�S�A���Q��d�)�%��Ʈ%O��sJ���F#��J>�\n��?�7_�<�������bI7����ʘ�� gnm��1�%H��pJ�\n����9MK���\0��zE�L�-�1}�� ��Ą]��\nB��i&K��EҮ��(�}q��������\"ɖ�,&�(�w��\r�%,�9cH	����HXBg^\Z	)�|�c�o��� \r�W��a�Ȟ�da5�4~!���iRw�P�2����\n��K0��Ȋ�s��~Łl4nΡ{�C�f1.\"C\Z�Vg��jV��������]���+�5\nt�3�eN��#>���C����\0%�1�n�����\n�Ɩ�,�f�+�V�:C�M�pS��������-fv\"$0�G�C��z�,:��ˈ��Q)�	E�s5��l��D`�����P��O�CGP,��e��]�C�6Y]Λ��P�;�\Z������7*|�k�d\Z��v�sGv�H/��\0۰M�U�k�BZ�}L�OV�5�YYpmu���%&b8�Pa�֥�E�5���n)�dp�7K���BD�W�9Zx?�1g���T�FQ�緾�XRA���*�a�z|�4D_���|)+���%T�\'�g���� <����o\"F9��Fέ||���7e߮�j��-����!�5g�Ӽ�wU��/G�W��(v6\ZI�ɏ��\0����*�}\Z��\nW1�K�ߞ���煎s�)�p\0C���\\�r�<}S���݈���.��*7��� ��Y����O��ܤ����橩ڝ��\rJlKPK2������!y��*����_�m$�B��/D�Ӏpm\0P���<��:��rj�[�t^�	c�?��\0jv1��O	`�H�g�0��v;');
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
