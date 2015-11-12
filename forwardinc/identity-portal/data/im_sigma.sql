-- MySQL dump 10.13  Distrib 5.5.43, for linux2.6 (x86_64)
--
-- Host: localhost    Database: sigma
-- ------------------------------------------------------
-- Server version       5.5.43

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
-- Table structure for table `account_attrs`
--

DROP TABLE IF EXISTS `account_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_attrs` (
  `endpoint_id` int(11) NOT NULL,
  `backend_name` varchar(255) DEFAULT NULL,
  `sigma_name` varchar(255) NOT NULL,
  PRIMARY KEY (`endpoint_id`,`sigma_name`),
  CONSTRAINT `FK_mrdb7ot1kflpfbj3rf7243omr` FOREIGN KEY (`endpoint_id`) REFERENCES `endpoint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_attrs`
--

LOCK TABLES `account_attrs` WRITE;
/*!40000 ALTER TABLE `account_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `applicationGroup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_oi4ytn418w5ujyaael8dd9h0g` (`tag`),
  UNIQUE KEY `tagIndex` (`tag`),
  KEY `FK_o8w5tch0sv9tex6d5vdkwiwdp` (`applicationGroup_id`),
  CONSTRAINT `FK_o8w5tch0sv9tex6d5vdkwiwdp` FOREIGN KEY (`applicationGroup_id`) REFERENCES `sigmagroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicationproperties`
--

DROP TABLE IF EXISTS `applicationproperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applicationproperties` (
  `application_id` int(11) NOT NULL,
  `value` varchar(2048) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`application_id`,`name`),
  CONSTRAINT `FK_texfm2atvkjxv8p06mx1g3pio` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicationproperties`
--

LOCK TABLES `applicationproperties` WRITE;
/*!40000 ALTER TABLE `applicationproperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `applicationproperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval`
--

DROP TABLE IF EXISTS `approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actionName` varchar(255) DEFAULT NULL,
  `activityName` varchar(255) DEFAULT NULL,
  `adapterId` int(11) DEFAULT NULL,
  `approvalDate` datetime DEFAULT NULL,
  `approvalType` varchar(255) DEFAULT NULL,
  `approverId` varchar(255) DEFAULT NULL,
  `comments` varchar(3000) DEFAULT NULL,
  `specificRequestId` int(11) DEFAULT NULL,
  `taskId` varchar(255) DEFAULT NULL,
  `requestFormEntity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4yatngtlrf1p7sb5h7xce1923` (`requestFormEntity_id`),
  CONSTRAINT `FK_4yatngtlrf1p7sb5h7xce1923` FOREIGN KEY (`requestFormEntity_id`) REFERENCES `requestform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval`
--

LOCK TABLES `approval` WRITE;
/*!40000 ALTER TABLE `approval` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_reqaccountop`
--

DROP TABLE IF EXISTS `approval_reqaccountop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval_reqaccountop` (
  `Approval_id` int(11) NOT NULL,
  `requestAccountOperations_id` int(11) NOT NULL,
  PRIMARY KEY (`Approval_id`,`requestAccountOperations_id`),
  KEY `FK_df4qts69ki3fut3j8u918xdeh` (`requestAccountOperations_id`),
  CONSTRAINT `FK_29i46jj6k2st5rqgp5m9shfld` FOREIGN KEY (`Approval_id`) REFERENCES `approval` (`id`),
  CONSTRAINT `FK_df4qts69ki3fut3j8u918xdeh` FOREIGN KEY (`requestAccountOperations_id`) REFERENCES `request_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_reqaccountop`
--

LOCK TABLES `approval_reqaccountop` WRITE;
/*!40000 ALTER TABLE `approval_reqaccountop` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_reqaccountop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_reqinvocoperation`
--

DROP TABLE IF EXISTS `approval_reqinvocoperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval_reqinvocoperation` (
  `reqInvocationOperation_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jojlwekd3on60hlhassgtpkd1` (`reqInvocationOperation_id`),
  CONSTRAINT `FK_dnjjwb696qa4mxqyf8aq2tgax` FOREIGN KEY (`id`) REFERENCES `approval` (`id`),
  CONSTRAINT `FK_jojlwekd3on60hlhassgtpkd1` FOREIGN KEY (`reqInvocationOperation_id`) REFERENCES `requestinvocationoperation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_reqinvocoperation`
--

LOCK TABLES `approval_reqinvocoperation` WRITE;
/*!40000 ALTER TABLE `approval_reqinvocoperation` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_reqinvocoperation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_reqtargetperm`
--

DROP TABLE IF EXISTS `approval_reqtargetperm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval_reqtargetperm` (
  `Approval_id` int(11) NOT NULL,
  `reqTargetPermission_id` int(11) NOT NULL,
  KEY `FK_gtmikdoojhj0n1d1y0f6p3d9q` (`reqTargetPermission_id`),
  KEY `FK_mc4rp01e9ln6r3rejidirnuvn` (`Approval_id`),
  CONSTRAINT `FK_mc4rp01e9ln6r3rejidirnuvn` FOREIGN KEY (`Approval_id`) REFERENCES `approval` (`id`),
  CONSTRAINT `FK_gtmikdoojhj0n1d1y0f6p3d9q` FOREIGN KEY (`reqTargetPermission_id`) REFERENCES `requesttargetpermission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_reqtargetperm`
--

LOCK TABLES `approval_reqtargetperm` WRITE;
/*!40000 ALTER TABLE `approval_reqtargetperm` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_reqtargetperm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentType` varchar(120) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `originalFilename` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `requester` varchar(150) DEFAULT NULL,
  `uploadTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `backendAuthenticatorName` varchar(255) NOT NULL,
  `requiredSecondFactor` bit(1) DEFAULT NULL,
  `tag` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `connector_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4ddlgopdliws8hhht1qkwnnuv` (`tag`),
  KEY `FK_s8vel4n3eu0263f7ptve2vwdw` (`connector_id`),
  CONSTRAINT `FK_s8vel4n3eu0263f7ptve2vwdw` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket` (
  `requestMode` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_4j2mimtbnm92cxuydlpssjg8e` FOREIGN KEY (`id`) REFERENCES `request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_user`
--

DROP TABLE IF EXISTS `basket_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_user` (
  `basket_id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  KEY `FK_8epgsuw7ey8pnhu3206c60xm` (`basket_id`),
  CONSTRAINT `FK_8epgsuw7ey8pnhu3206c60xm` FOREIGN KEY (`basket_id`) REFERENCES `basket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_user`
--

LOCK TABLES `basket_user` WRITE;
/*!40000 ALTER TABLE `basket_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approvalId` varchar(50) DEFAULT NULL,
  `campaignId` varchar(50) DEFAULT NULL,
  `campaignType` varchar(255) DEFAULT NULL,
  `connectorId` int(11) NOT NULL,
  `dueDate` date DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_l77oapl3ok23tcnd90kfqoen8` (`campaignId`,`approvalId`,`connectorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigntask`
--

DROP TABLE IF EXISTS `campaigntask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigntask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errorMessage` varchar(2048) DEFAULT NULL,
  `leftObject` varchar(256) DEFAULT NULL,
  `leftObjectDisplay` varchar(256) DEFAULT NULL,
  `leftObjectType` varchar(255) DEFAULT NULL,
  `requestId` varchar(100) DEFAULT NULL,
  `rightObject` varchar(256) DEFAULT NULL,
  `rightObjectDisplay` varchar(256) DEFAULT NULL,
  `rightObjectType` varchar(255) DEFAULT NULL,
  `taskId` varchar(50) DEFAULT NULL,
  `taskSubmitTime` datetime DEFAULT NULL,
  `taskType` varchar(255) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bnxbxx3l7c2h4yt6l7y24q778` (`campaign_id`),
  CONSTRAINT `FK_bnxbxx3l7c2h4yt6l7y24q778` FOREIGN KEY (`campaign_id`) REFERENCES `campaign` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigntask`
--

LOCK TABLES `campaigntask` WRITE;
/*!40000 ALTER TABLE `campaigntask` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigntask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigntasktemp`
--

DROP TABLE IF EXISTS `campaigntasktemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigntasktemp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approvalType` varchar(255) DEFAULT NULL,
  `comments` varchar(3000) DEFAULT NULL,
  `taskId` varchar(50) DEFAULT NULL,
  `users` varchar(2024) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_15ycbrx9dg4y60w552nwsq5gt` (`campaign_id`),
  CONSTRAINT `FK_15ycbrx9dg4y60w552nwsq5gt` FOREIGN KEY (`campaign_id`) REFERENCES `campaign` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigntasktemp`
--

LOCK TABLES `campaigntasktemp` WRITE;
/*!40000 ALTER TABLE `campaigntasktemp` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigntasktemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientdata`
--

DROP TABLE IF EXISTS `clientdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_co1hefj2tfte7d75vv10elo15` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientdata`
--

LOCK TABLES `clientdata` WRITE;
/*!40000 ALTER TABLE `clientdata` DISABLE KEYS */;
INSERT INTO `clientdata` VALUES (1,'guiconf','{\"groupLineMap\":{\"group_displayname\":\"{Group Name}\",\"approval_table\":\"{Group Name}\",\"approval_details\":\"{Group Name}\"},\"userLineMap\":{\"search_result_bottom\":\"{Email}, UserID:{UserId}\",\"approval_details\":\"{FirstName} {LastName}\",\"approval_table\":\"{FirstName} {LastName}\",\"user_selector_displayname\":\"{FirstName} {LastName}\",\"dashboard_approvals\":\"{FirstName} {LastName}\",\"user_dialog_info1\":\"{Phone}\",\"user_dialog_info2\":\"{City}\",\"user_dialog_info3\":\"{Email}\",\"user_email\":\"{Email}\",\"approval_details_user\":\"{FirstName} {LastName}\",\"user_displayname\":\"{FirstName} {LastName}\",\"user_title\":\"{Title}\",\"approval_details_requester\":\"{FirstName} {LastName} ({UserId})\",\"user_phone\":\"{Phone}\",\"penders_display\":\"{FirstName} {LastName}\",\"user_manager\":\"{Manager}\",\"search_result\":\"{FirstName} {LastName} --- Title: {Title}\",\"bulk_upload_attributes\":\"UserId,Email\",\"namedquery_<subordinates>\":\"UserId,UserId\",\"strict_cart_mode\":\"false\",\"risk_max_level\":\"1000\",\"hide_non_scoped_current_perms\":\"false\"},\"userTableMap\":{\"similar_user_table\":{\"headers\":[\"Name\",\"City\",\"User ID\"],\"cells\":[\"{FirstName} {LastName}\",\"{City}\",\"{UserId}\"]},\"user_info_table\":{\"headers\":[\"Name\",\"City\",\"User ID\"],\"cells\":[\"{FirstName} {LastName}\",\"{City}\",\"{UserId}\"]},\"user_full_info_table\":{\"headers\":[\"Name\",\"City\",\"User ID\"],\"cells\":[\"{FirstName} {LastName}\",\"{City}\",\"{UserId}\"]}},\"groupTableMap\":{\"group_info_table\":{\"headers\":[\"Name\"],\"cells\":[\"{Group Name}\"]}},\"defaultUserLine\":\"{FirstName} {LastName}\"}');
/*!40000 ALTER TABLE `clientdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliances`
--

DROP TABLE IF EXISTS `compliances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compliances` (
  `TargetPermission_id` int(11) NOT NULL,
  `complianceTargetPermissions_id` int(11) NOT NULL,
  PRIMARY KEY (`TargetPermission_id`,`complianceTargetPermissions_id`),
  KEY `FK_53kddq6tdjwkrx6048kc6mox4` (`complianceTargetPermissions_id`),
  CONSTRAINT `FK_84ywfi8mekbitus5nenn2pips` FOREIGN KEY (`TargetPermission_id`) REFERENCES `targetpermission` (`id`),
  CONSTRAINT `FK_53kddq6tdjwkrx6048kc6mox4` FOREIGN KEY (`complianceTargetPermissions_id`) REFERENCES `targetpermission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliances`
--

LOCK TABLES `compliances` WRITE;
/*!40000 ALTER TABLE `compliances` DISABLE KEYS */;
/*!40000 ALTER TABLE `compliances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `entryValue` varchar(255) DEFAULT NULL,
  `entrykey` varchar(255) DEFAULT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_k2o82slyyea7r7i0mmrrb0xff` (`tag`),
  UNIQUE KEY `tagIndex` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'2015-09-16 07:42:55','sm_user','SSO User ID header','SSO User ID header'),(2,'2015-09-16 07:42:57','false','Enable SSO','Enable SSO'),(3,'2015-09-16 07:42:57','../app/','Logout URL','Logout URL'),(4,'2015-09-16 07:42:57','c:\\temp\\plugin','PluginDir','PluginDir'),(5,'2015-09-16 07:42:57','4','logging level','logging level'),(6,'2015-09-16 07:42:57','false','Enable Risk','Enable Risk'),(7,'2015-09-16 07:42:57','','FileUpload Root','FileUpload Root'),(8,'2015-09-16 07:42:57','No Risk, Low RIsk, Medium Risk, High Risk, Very High Risk','Risk Rule Thresholds Names','Risk Rule Thresholds Names'),(9,'2015-09-16 07:42:58','(24)kS5Zu5MwHUo/yTiGOIu4MQ==HRiEoTlSJrV1TkS9cvMg6w==','IM USER Password','IM USER Password'),(10,'2015-09-16 07:42:58','10','logging interval','logging interval'),(11,'2015-09-16 07:42:58','false','Debug Mode','Debug Mode'),(12,'2015-09-16 07:42:58','5000000','MaxUploadSize','MaxUploadSize'),(13,'2015-09-16 07:42:58','false','Require Second Factor On Login','Require Second Factor On Login'),(14,'2015-09-16 07:42:58','200','MAX REQUESTS TO FETCH','MAX REQUESTS TO FETCH'),(15,'2015-09-16 07:42:58','0,20,40,60,80,100','Risk Rule Thresholds','Risk Rule Thresholds'),(16,'2015-09-16 07:42:58','false','Second Factor Enabled','Second Factor Enabled'),(17,'2015-09-16 07:42:58','sigma','IM USER','IM USER'),(18,'2015-09-16 07:42:58','None','logging users','logging users'),(19,'2015-09-16 07:42:58','0','Temp file lifetime','Temp file lifetime');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connector`
--

DROP TABLE IF EXISTS `connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `className` varchar(255) DEFAULT NULL,
  `debug` bit(1) DEFAULT NULL,
  `isMain` bit(1) DEFAULT NULL,
  `loginAttributeSource` varchar(255) DEFAULT NULL,
  `userIdMatchingAttribute_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagIndex` (`tag`),
  KEY `FK_cyt3w0bkn76v21s0h3jw2sx0n` (`userIdMatchingAttribute_id`),
  CONSTRAINT `FK_cyt3w0bkn76v21s0h3jw2sx0n` FOREIGN KEY (`userIdMatchingAttribute_id`) REFERENCES `userattr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connector`
--

LOCK TABLES `connector` WRITE;
/*!40000 ALTER TABLE `connector` DISABLE KEYS */;
INSERT INTO `connector` VALUES (1,'2015-09-17 09:20:15','IDM','CONNECTOR_IDM','com.idmlogic.sigma.connector.ca.CaimAdapter',NULL,0x01,NULL,NULL);
/*!40000 ALTER TABLE `connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connector_properties`
--

DROP TABLE IF EXISTS `connector_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connector_properties` (
  `connector_id` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`connector_id`,`name`),
  CONSTRAINT `FK_b4yurnp7ly98jb8w86iukfjij` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connector_properties`
--

LOCK TABLES `connector_properties` WRITE;
/*!40000 ALTER TABLE `connector_properties` DISABLE KEYS */;
INSERT INTO `connector_properties` VALUES (1,'(24)+yBWNkIgn0syvcNssctwpg==KkvxDOtGNjHKH7plGiquCw==','caim.admin.password'),(1,'superuser','caim.admin.user'),(1,'%GROUP_NAME%','caim.attributes.group_id'),(1,'%ENABLED_STATE%','caim.attributes.userstate'),(1,'%USER_ID%','caim.attributes.user_id'),(1,'com.idmlogic.caim.Converter1262','caim.environment.converter.class'),(1,'1','caim.environment.id'),(1,'(24)a99PeOCIc6mgqi3wkGFQFg==PIMqgWC6+HfXSXg6I7Dupw==','caim.environment.managementconsole.password'),(1,'http://ui/iam/immanage/','caim.environment.managementconsole.url'),(1,'','caim.environment.managementconsole.username'),(1,'ForwardInc','caim.environment.name'),(1,'/solution/forwardinc/identity-portal/ime/forwardinc/forwardinc_roles.xml','caim.environment.rolestasks_file'),(1,'|VerifyAnswer|','caim.forgottenpassword.answer.attr'),(1,'|passwordConfirm|','caim.forgottenpassword.confirmpassword.attr'),(1,'%PASSWORD%','caim.forgottenpassword.password.attr'),(1,'|VerifyQuestion|','caim.forgottenpassword.question.attr'),(1,'|passwordConfirm|','caim.resetpassword.another.confirmpassword.attr'),(1,'%PASSWORD%','caim.resetpassword.another.password.attr'),(1,'ResetUserPassword','caim.resetpassword.another.task.tag'),(1,'|passwordConfirm|','caim.resetpassword.confirmpassword.attr'),(1,'%PASSWORD%','caim.resetpassword.password.attr'),(1,'SigmaChangeMyPassword','caim.resetpassword.task.tag'),(1,'SigmaViewAdminTask','caim.tasks.admin_tasks.task'),(1,'SigmaResolveApprovalTask','caim.tasks.approval.search.task'),(1,'false','caim.tasks.client.url.fix'),(1,'SigmaCurrentAccess','caim.tasks.current_access_task'),(1,'SigmaViewUser','caim.tasks.default_modify.task'),(1,'ForgottenPassword','caim.tasks.forgottenpassword.task.tag'),(1,'SigmaViewGroup','caim.tasks.group.task'),(1,'SigmaLogin','caim.tasks.login.task'),(1,'ViewSubmittedTasks,ViewMySubmittedTasks,ViewSubmittedTasksQuery','caim.tasks.nocompile.list'),(1,'SigmaAdminScope','caim.tasks.scope.task'),(1,'|adminOfGroups|','caim.tasks.scope.task.groups_field'),(1,'|provisioningRoles|','caim.tasks.scope.task.roles_field'),(1,'|adminTasks|','caim.tasks.scope.task.tasks_field'),(1,'TaskStatus','caim.tasks.task_status.task'),(1,'20','caim.tasks.task_statuses.batch.size'),(1,'SigmaTaskStatuses','caim.tasks.task_statuses.task'),(1,'EEE MMM d HH:m:s z yyyy','caim.tasks.worklist.date_format'),(1,'SigmaViewMyWorkList','caim.tasks.worklist.task'),(1,'false','caim.tasks.wsdl.fix'),(1,'/tmp','caim.tews.client.dir'),(1,'file:///solution/forwardinc/identity-portal/ime/forwardinc/forwardinc_wsdl.xml','caim.tews.url'),(1,'JBOSS6','caim.workpoint.appserver'),(1,'/opt/sigma/workpoint','caim.workpoint.client.dir'),(1,'100','caim.workpoint.client.limit'),(1,'WPDS','caim.workpoint.db'),(1,'TEWS ONLY','caim.workpoint.featch.strategy'),(1,'false','caim.workpoint.isolationmode'),(1,'(24)Gu2i1l5qZWhqUvkO2XlhCg==bKSCsJf/ifSmOyMlEzVwTw==','caim.workpoint.password'),(1,'org.jnp.interfaces.NamingContextFactory','caim.workpoint.service.context_class'),(1,'XML','caim.workpoint.service.method'),(1,'(24)D18HuLsZEaMUwYbpbDNewA==C1YH0lH7dDMEP9TGmRlGrg==','caim.workpoint.service.password'),(1,'http://ui/iam/im/wpClientServlet','caim.workpoint.service.url'),(1,'','caim.workpoint.service.user'),(1,'','caim.workpoint.user');
/*!40000 ALTER TABLE `connector_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endpoint`
--

DROP TABLE IF EXISTS `endpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endpoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `allInstances` bit(1) DEFAULT NULL,
  `tag` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `accountDataTask_id` int(11) NOT NULL,
  `connector_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_frkegwiguboyq1jiqrht3fqhn` (`tag`),
  UNIQUE KEY `tagIndex` (`tag`),
  KEY `FK_pi42qesqn9lmn9bkq2uo3nfhb` (`accountDataTask_id`),
  KEY `FK_j4liw93y9he33218p7dcscx88` (`connector_id`),
  CONSTRAINT `FK_j4liw93y9he33218p7dcscx88` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`),
  CONSTRAINT `FK_pi42qesqn9lmn9bkq2uo3nfhb` FOREIGN KEY (`accountDataTask_id`) REFERENCES `taskdef` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endpoint`
--

LOCK TABLES `endpoint` WRITE;
/*!40000 ALTER TABLE `endpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `endpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endpoint_actions`
--

DROP TABLE IF EXISTS `endpoint_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endpoint_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `endpoint_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_52ni7mm510tu26yxdooeo3ati` (`endpoint_id`),
  KEY `FK_eljrctrvb7b2ktfk3l7vo1si9` (`form_id`),
  CONSTRAINT `FK_eljrctrvb7b2ktfk3l7vo1si9` FOREIGN KEY (`form_id`) REFERENCES `formdef` (`id`),
  CONSTRAINT `FK_52ni7mm510tu26yxdooeo3ati` FOREIGN KEY (`endpoint_id`) REFERENCES `endpoint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endpoint_actions`
--

LOCK TABLES `endpoint_actions` WRITE;
/*!40000 ALTER TABLE `endpoint_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `endpoint_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endpoint_entitle_rules`
--

DROP TABLE IF EXISTS `endpoint_entitle_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endpoint_entitle_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `conditionStr` longtext NOT NULL,
  `expression` varchar(4000) NOT NULL,
  `priority` int(11) NOT NULL,
  `entitlement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8wgs05s0ng00nq4k4jn2moepl` (`entitlement_id`),
  CONSTRAINT `FK_8wgs05s0ng00nq4k4jn2moepl` FOREIGN KEY (`entitlement_id`) REFERENCES `endpoint_entitlement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endpoint_entitle_rules`
--

LOCK TABLES `endpoint_entitle_rules` WRITE;
/*!40000 ALTER TABLE `endpoint_entitle_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `endpoint_entitle_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endpoint_entitlement`
--

DROP TABLE IF EXISTS `endpoint_entitlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endpoint_entitlement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `backendName` varchar(255) NOT NULL,
  `addForm_id` int(11) DEFAULT NULL,
  `fetchEntitlementsTask_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `removeForm_id` int(11) DEFAULT NULL,
  `violationConnector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_at47kxh0ixk15monxv0yial5e` (`addForm_id`),
  KEY `FK_ankw1crjdvev7y7fg2d1hvn14` (`fetchEntitlementsTask_id`),
  KEY `FK_6snw63u05ybkyne2klu09dkfm` (`parent_id`),
  KEY `FK_ohi0jrvy9u6btnqtfryt6ci31` (`removeForm_id`),
  KEY `FK_oayfwbgsqmvuynssmc3h5x068` (`violationConnector_id`),
  CONSTRAINT `FK_oayfwbgsqmvuynssmc3h5x068` FOREIGN KEY (`violationConnector_id`) REFERENCES `connector` (`id`),
  CONSTRAINT `FK_6snw63u05ybkyne2klu09dkfm` FOREIGN KEY (`parent_id`) REFERENCES `endpoint` (`id`),
  CONSTRAINT `FK_ankw1crjdvev7y7fg2d1hvn14` FOREIGN KEY (`fetchEntitlementsTask_id`) REFERENCES `taskdef` (`id`),
  CONSTRAINT `FK_at47kxh0ixk15monxv0yial5e` FOREIGN KEY (`addForm_id`) REFERENCES `formdef` (`id`),
  CONSTRAINT `FK_ohi0jrvy9u6btnqtfryt6ci31` FOREIGN KEY (`removeForm_id`) REFERENCES `formdef` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endpoint_entitlement`
--

LOCK TABLES `endpoint_entitlement` WRITE;
/*!40000 ALTER TABLE `endpoint_entitlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `endpoint_entitlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endpoint_instances`
--

DROP TABLE IF EXISTS `endpoint_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endpoint_instances` (
  `endpoint_id` int(11) NOT NULL,
  `instance_name` varchar(255) DEFAULT NULL,
  `sigma_name` varchar(255) NOT NULL,
  PRIMARY KEY (`endpoint_id`,`sigma_name`),
  CONSTRAINT `FK_8v7m2aofg0wwm065efd09cvop` FOREIGN KEY (`endpoint_id`) REFERENCES `endpoint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endpoint_instances`
--

LOCK TABLES `endpoint_instances` WRITE;
/*!40000 ALTER TABLE `endpoint_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `endpoint_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `favoritesXML` longtext,
  `requester` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formdef`
--

DROP TABLE IF EXISTS `formdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formdef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `layout` longtext,
  `tag` varchar(255) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o9mcbsy4kpqlygbpjtebaw7e1` (`tag`),
  UNIQUE KEY `tagIndex` (`tag`),
  KEY `FK_iiipa2tk6f2veopwiqjdkybkx` (`task_id`),
  CONSTRAINT `FK_iiipa2tk6f2veopwiqjdkybkx` FOREIGN KEY (`task_id`) REFERENCES `taskdef` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formdef`
--

LOCK TABLES `formdef` WRITE;
/*!40000 ALTER TABLE `formdef` DISABLE KEYS */;
/*!40000 ALTER TABLE `formdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formpropertydef`
--

DROP TABLE IF EXISTS `formpropertydef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formpropertydef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `backendName` varchar(255) DEFAULT NULL,
  `defaultValue` varchar(255) DEFAULT NULL,
  `mandatory` bit(1) DEFAULT NULL,
  `propLayoutName` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `formDef_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_odx7k8org5k3atyvl9jpl3826` (`formDef_id`),
  CONSTRAINT `FK_odx7k8org5k3atyvl9jpl3826` FOREIGN KEY (`formDef_id`) REFERENCES `formdef` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formpropertydef`
--

LOCK TABLES `formpropertydef` WRITE;
/*!40000 ALTER TABLE `formpropertydef` DISABLE KEYS */;
/*!40000 ALTER TABLE `formpropertydef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupattr`
--

DROP TABLE IF EXISTS `groupattr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupattr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `backendName` varchar(255) DEFAULT NULL,
  `isSearchable` bit(1) DEFAULT NULL,
  `connector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fiancid98onfwtpm5dlj6j3cv` (`connector_id`),
  CONSTRAINT `FK_fiancid98onfwtpm5dlj6j3cv` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupattr`
--

LOCK TABLES `groupattr` WRITE;
/*!40000 ALTER TABLE `groupattr` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupattr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guiconfiguration`
--

DROP TABLE IF EXISTS `guiconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guiconfiguration` (
  `DTYPE` varchar(31) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `line` varchar(512) NOT NULL,
  `heads` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guiconfiguration`
--

LOCK TABLES `guiconfiguration` WRITE;
/*!40000 ALTER TABLE `guiconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `guiconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invocation_strongauth_link`
--

DROP TABLE IF EXISTS `invocation_strongauth_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invocation_strongauth_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invocation_id` int(11) NOT NULL,
  `strongAuth_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5buitdhvrls9htusgdqu25lhn` (`invocation_id`),
  KEY `FK_79tu08jextj2xxof40jhthi3f` (`strongAuth_id`),
  CONSTRAINT `FK_79tu08jextj2xxof40jhthi3f` FOREIGN KEY (`strongAuth_id`) REFERENCES `strong_auth` (`id`),
  CONSTRAINT `FK_5buitdhvrls9htusgdqu25lhn` FOREIGN KEY (`invocation_id`) REFERENCES `invocationoperation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invocation_strongauth_link`
--

LOCK TABLES `invocation_strongauth_link` WRITE;
/*!40000 ALTER TABLE `invocation_strongauth_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `invocation_strongauth_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invocationoperation`
--

DROP TABLE IF EXISTS `invocationoperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invocationoperation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `managedObjectType` varchar(255) DEFAULT NULL,
  `requestMode` varchar(255) DEFAULT NULL,
  `tag` varchar(255) NOT NULL,
  `formDef_id` int(11) NOT NULL,
  `sigmaModule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_dbxejjkrb5yifhf3cbk3xlxhi` (`tag`),
  UNIQUE KEY `tagIndex` (`tag`),
  KEY `FK_ccv10o71nljsi6ang3275tg7m` (`formDef_id`),
  KEY `FK_pdom6e7vnh1t2thpv79ub0w8g` (`sigmaModule_id`),
  CONSTRAINT `FK_pdom6e7vnh1t2thpv79ub0w8g` FOREIGN KEY (`sigmaModule_id`) REFERENCES `sigmamodule` (`id`),
  CONSTRAINT `FK_ccv10o71nljsi6ang3275tg7m` FOREIGN KEY (`formDef_id`) REFERENCES `formdef` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invocationoperation`
--

LOCK TABLES `invocationoperation` WRITE;
/*!40000 ALTER TABLE `invocationoperation` DISABLE KEYS */;
/*!40000 ALTER TABLE `invocationoperation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `backendId` varchar(255) DEFAULT NULL,
  `backendName` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `iconPath` varchar(255) DEFAULT NULL,
  `tag` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `connector_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_b0l1h1d50v5d4mitn7giehh4x` (`tag`),
  UNIQUE KEY `tagIndex` (`tag`),
  KEY `FK_7rfjvs9wnfs5boncoufd7069t` (`connector_id`),
  KEY `FK_kwgb6ryxjvqg7jv580y81cmnr` (`permission_id`),
  KEY `FK_bapeaanjm5e57pmwp04j9dfyp` (`profile_id`),
  CONSTRAINT `FK_bapeaanjm5e57pmwp04j9dfyp` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`),
  CONSTRAINT `FK_7rfjvs9wnfs5boncoufd7069t` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`),
  CONSTRAINT `FK_kwgb6ryxjvqg7jv580y81cmnr` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logindata`
--

DROP TABLE IF EXISTS `logindata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logindata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `counter` int(11) DEFAULT NULL,
  `loginData` longtext,
  `requester` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_g95jhy3tgx62ggmgbcmcj3ngr` (`requester`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logindata`
--

LOCK TABLES `logindata` WRITE;
/*!40000 ALTER TABLE `logindata` DISABLE KEYS */;
INSERT INTO `logindata` VALUES (1,0,NULL,NULL);
/*!40000 ALTER TABLE `logindata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onboardaccessrightsrequest`
--

DROP TABLE IF EXISTS `onboardaccessrightsrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onboardaccessrightsrequest` (
  `id` int(11) NOT NULL,
  `requestBasket_id` int(11) DEFAULT NULL,
  `requestInvocationOperation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fynqrbar8bfq1vfgmo2vnke63` (`requestBasket_id`),
  KEY `FK_1y6kx8v1v6fnp1dq5oxy7x8ji` (`requestInvocationOperation_id`),
  CONSTRAINT `FK_1hanbwmm0ugwqhnhn3p6wd79n` FOREIGN KEY (`id`) REFERENCES `request` (`id`),
  CONSTRAINT `FK_1y6kx8v1v6fnp1dq5oxy7x8ji` FOREIGN KEY (`requestInvocationOperation_id`) REFERENCES `requestinvocationoperation` (`id`),
  CONSTRAINT `FK_fynqrbar8bfq1vfgmo2vnke63` FOREIGN KEY (`requestBasket_id`) REFERENCES `basket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onboardaccessrightsrequest`
--

LOCK TABLES `onboardaccessrightsrequest` WRITE;
/*!40000 ALTER TABLE `onboardaccessrightsrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `onboardaccessrightsrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `application_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `permissionGroup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_q3ehhqixebk1en4lyt90rj09q` (`tag`),
  UNIQUE KEY `tagIndex` (`tag`),
  KEY `FK_cuajh80l7l40hxnvqqeua8xmg` (`application_id`),
  KEY `FK_8r34a902myomut7r155nlkej1` (`parent_id`),
  KEY `FK_gu4sgjq84yw5v1nkst8n0ogp2` (`permissionGroup_id`),
  CONSTRAINT `FK_gu4sgjq84yw5v1nkst8n0ogp2` FOREIGN KEY (`permissionGroup_id`) REFERENCES `sigmagroup` (`id`),
  CONSTRAINT `FK_8r34a902myomut7r155nlkej1` FOREIGN KEY (`parent_id`) REFERENCES `permission` (`id`),
  CONSTRAINT `FK_cuajh80l7l40hxnvqqeua8xmg` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_links`
--

DROP TABLE IF EXISTS `permission_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_links` (
  `PermissionEntity_id` int(11) NOT NULL,
  `link` varchar(4000) DEFAULT NULL,
  KEY `FK_5ago6hlcn3wyfvwj2r44vdbj6` (`PermissionEntity_id`),
  CONSTRAINT `FK_5ago6hlcn3wyfvwj2r44vdbj6` FOREIGN KEY (`PermissionEntity_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_links`
--

LOCK TABLES `permission_links` WRITE;
/*!40000 ALTER TABLE `permission_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_strongauth_link`
--

DROP TABLE IF EXISTS `permission_strongauth_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_strongauth_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `strongAuth_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rf06hh0j5w5quyxl371v4r13e` (`permission_id`),
  KEY `FK_1cyb1nn9flp4voykyu8dw1myn` (`strongAuth_id`),
  CONSTRAINT `FK_1cyb1nn9flp4voykyu8dw1myn` FOREIGN KEY (`strongAuth_id`) REFERENCES `strong_auth` (`id`),
  CONSTRAINT `FK_rf06hh0j5w5quyxl371v4r13e` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_strongauth_link`
--

LOCK TABLES `permission_strongauth_link` WRITE;
/*!40000 ALTER TABLE `permission_strongauth_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_strongauth_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_targetpermission`
--

DROP TABLE IF EXISTS `permission_targetpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_targetpermission` (
  `permission_id` int(11) NOT NULL,
  `targetpermission_id` int(11) NOT NULL,
  PRIMARY KEY (`permission_id`,`targetpermission_id`),
  KEY `FK_ju4i8elh652owmgr4nbs05i1w` (`targetpermission_id`),
  CONSTRAINT `FK_rety6v0x6peodtgkv9wd2fqpn` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`),
  CONSTRAINT `FK_ju4i8elh652owmgr4nbs05i1w` FOREIGN KEY (`targetpermission_id`) REFERENCES `targetpermission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_targetpermission`
--

LOCK TABLES `permission_targetpermission` WRITE;
/*!40000 ALTER TABLE `permission_targetpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_targetpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissionproperties`
--

DROP TABLE IF EXISTS `permissionproperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissionproperties` (
  `permission_id` int(11) NOT NULL,
  `value` varchar(2048) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`permission_id`,`name`),
  CONSTRAINT `FK_hri52o0yoetg4jyivs8et5oj7` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissionproperties`
--

LOCK TABLES `permissionproperties` WRITE;
/*!40000 ALTER TABLE `permissionproperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissionproperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `PluginExecutionType` varchar(31) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `pluginType` varchar(255) DEFAULT NULL,
  `serializedPluginInitParams` longtext,
  `tag` varchar(255) NOT NULL,
  `methodFQN` varchar(2048) DEFAULT NULL,
  `script` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qx0k2yv2w0xbifaei75v89ned` (`name`),
  UNIQUE KEY `UK_6r8epmjl6gl8daqc8nl8u8o0u` (`tag`),
  UNIQUE KEY `tagIndex` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pluginlinks`
--

DROP TABLE IF EXISTS `pluginlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginlinks` (
  `plugin_id` int(11) NOT NULL,
  `entityClassName` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  KEY `FK_g5n9m4v679wrmqv7js517s16l` (`plugin_id`),
  CONSTRAINT `FK_g5n9m4v679wrmqv7js517s16l` FOREIGN KEY (`plugin_id`) REFERENCES `plugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pluginlinks`
--

LOCK TABLES `pluginlinks` WRITE;
/*!40000 ALTER TABLE `pluginlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `pluginlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processinformation`
--

DROP TABLE IF EXISTS `processinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext,
  `ownerId` int(11) DEFAULT NULL,
  `processInforamtionEntityType` varchar(255) DEFAULT NULL,
  `protectedValue` bit(1) DEFAULT NULL,
  `submittedTime` datetime DEFAULT NULL,
  `userId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processinformation`
--

LOCK TABLES `processinformation` WRITE;
/*!40000 ALTER TABLE `processinformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `processinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `alwaysValid` bit(1) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `uiData` longtext,
  `profileScope_id` int(11) DEFAULT NULL,
  `requestScope_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_h0misxfxi90txd9e2cf1owm8j` (`name`),
  UNIQUE KEY `UK_psrpkag8mhbo0bu93ny83ny8m` (`tag`),
  UNIQUE KEY `tagIndex` (`tag`),
  KEY `FK_lgbkle7hcu13h20jmc9b1ls6` (`profileScope_id`),
  KEY `FK_5yjs9jpmafl6l8hehu0bloesy` (`requestScope_id`),
  CONSTRAINT `FK_5yjs9jpmafl6l8hehu0bloesy` FOREIGN KEY (`requestScope_id`) REFERENCES `req_cond` (`id`),
  CONSTRAINT `FK_lgbkle7hcu13h20jmc9b1ls6` FOREIGN KEY (`profileScope_id`) REFERENCES `rule_cond` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'2015-09-17 09:01:51','test',0x01,'PROFILE_test','{\"modules\":{\"dashboard\":true,\"tasks\":true,\"approvals\":true,\"implementations\":true,\"certificationCampaigns\":true,\"access\":true,\"myRequests\":true},\"features\":{\"favorites\":false,\"locale\":true,\"links\":true,\"scrollingAnimations\":true,\"commentsInRequestSummary\":true,\"showRequestHistory\":true,\"drafts\":true}}',NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_module_link`
--

DROP TABLE IF EXISTS `profile_module_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_module_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `sigmaModule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_55n9lbdtw2w1pq6f1vm3lxhw0` (`profile_id`),
  KEY `FK_av5ndklhserhsdpmiiq73fxje` (`sigmaModule_id`),
  CONSTRAINT `FK_av5ndklhserhsdpmiiq73fxje` FOREIGN KEY (`sigmaModule_id`) REFERENCES `sigmamodule` (`id`),
  CONSTRAINT `FK_55n9lbdtw2w1pq6f1vm3lxhw0` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_module_link`
--

LOCK TABLES `profile_module_link` WRITE;
/*!40000 ALTER TABLE `profile_module_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_module_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_account_messages`
--

DROP TABLE IF EXISTS `req_account_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_account_messages` (
  `req_account_id` int(11) NOT NULL,
  `messages` varchar(255) DEFAULT NULL,
  KEY `FK_tifr9ytpwk9s4xwju4hv4xh82` (`req_account_id`),
  CONSTRAINT `FK_tifr9ytpwk9s4xwju4hv4xh82` FOREIGN KEY (`req_account_id`) REFERENCES `request_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_account_messages`
--

LOCK TABLES `req_account_messages` WRITE;
/*!40000 ALTER TABLE `req_account_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_account_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_cond`
--

DROP TABLE IF EXISTS `req_cond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_cond` (
  `condition_type` varchar(31) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `conditionType` int(11) DEFAULT NULL,
  `objectOperator` int(11) DEFAULT NULL,
  `objectType` int(11) DEFAULT NULL,
  `fieldOperator` int(11) DEFAULT NULL,
  `complexOperator` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `fromTime` datetime DEFAULT NULL,
  `toTime` datetime DEFAULT NULL,
  `loggedinUser` bit(1) DEFAULT NULL,
  `targetUser` varchar(255) DEFAULT NULL,
  `lastAmount` int(11) DEFAULT NULL,
  `timeUnit` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jf3qnul6447pksvgj79vi08so` (`parent_id`),
  CONSTRAINT `FK_jf3qnul6447pksvgj79vi08so` FOREIGN KEY (`parent_id`) REFERENCES `req_cond` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_cond`
--

LOCK TABLES `req_cond` WRITE;
/*!40000 ALTER TABLE `req_cond` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_cond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_cond_app_link`
--

DROP TABLE IF EXISTS `req_cond_app_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_cond_app_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `requestCondition_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ehf6byh6t81pwshqqk3o5h43t` (`application_id`),
  KEY `FK_g46h3vhobtbitr0sy7j7jfrs5` (`requestCondition_id`),
  CONSTRAINT `FK_g46h3vhobtbitr0sy7j7jfrs5` FOREIGN KEY (`requestCondition_id`) REFERENCES `req_cond` (`id`),
  CONSTRAINT `FK_ehf6byh6t81pwshqqk3o5h43t` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_cond_app_link`
--

LOCK TABLES `req_cond_app_link` WRITE;
/*!40000 ALTER TABLE `req_cond_app_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_cond_app_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_cond_inop_link`
--

DROP TABLE IF EXISTS `req_cond_inop_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_cond_inop_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invocationOperation_id` int(11) NOT NULL,
  `requestCondition_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bi7a7anrg3wca6sjqnm20h5if` (`invocationOperation_id`),
  KEY `FK_opmoy3l7a4iw521e1sowsxosm` (`requestCondition_id`),
  CONSTRAINT `FK_opmoy3l7a4iw521e1sowsxosm` FOREIGN KEY (`requestCondition_id`) REFERENCES `req_cond` (`id`),
  CONSTRAINT `FK_bi7a7anrg3wca6sjqnm20h5if` FOREIGN KEY (`invocationOperation_id`) REFERENCES `invocationoperation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_cond_inop_link`
--

LOCK TABLES `req_cond_inop_link` WRITE;
/*!40000 ALTER TABLE `req_cond_inop_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_cond_inop_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_cond_perm_link`
--

DROP TABLE IF EXISTS `req_cond_perm_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_cond_perm_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `requestCondition_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fu6s59yik4mbasootgakgd7vc` (`permission_id`),
  KEY `FK_gys4dfex88enpeioudxbgewxj` (`requestCondition_id`),
  CONSTRAINT `FK_gys4dfex88enpeioudxbgewxj` FOREIGN KEY (`requestCondition_id`) REFERENCES `req_cond` (`id`),
  CONSTRAINT `FK_fu6s59yik4mbasootgakgd7vc` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_cond_perm_link`
--

LOCK TABLES `req_cond_perm_link` WRITE;
/*!40000 ALTER TABLE `req_cond_perm_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_cond_perm_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_cond_statuses`
--

DROP TABLE IF EXISTS `req_cond_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_cond_statuses` (
  `req_condition_id` int(11) NOT NULL,
  `statuses` int(11) DEFAULT NULL,
  KEY `FK_od0ro6s8go388jl2a09xy8eyp` (`req_condition_id`),
  CONSTRAINT `FK_od0ro6s8go388jl2a09xy8eyp` FOREIGN KEY (`req_condition_id`) REFERENCES `req_cond` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_cond_statuses`
--

LOCK TABLES `req_cond_statuses` WRITE;
/*!40000 ALTER TABLE `req_cond_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_cond_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_cond_tp_link`
--

DROP TABLE IF EXISTS `req_cond_tp_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_cond_tp_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requestCondition_id` int(11) NOT NULL,
  `targetPermission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_212w8arf2yiwryastl2fk5hb8` (`requestCondition_id`),
  KEY `FK_q4nusa2fo4umprn8htdk92qkb` (`targetPermission_id`),
  CONSTRAINT `FK_q4nusa2fo4umprn8htdk92qkb` FOREIGN KEY (`targetPermission_id`) REFERENCES `targetpermission` (`id`),
  CONSTRAINT `FK_212w8arf2yiwryastl2fk5hb8` FOREIGN KEY (`requestCondition_id`) REFERENCES `req_cond` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_cond_tp_link`
--

LOCK TABLES `req_cond_tp_link` WRITE;
/*!40000 ALTER TABLE `req_cond_tp_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_cond_tp_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reqform_reqformpropval`
--

DROP TABLE IF EXISTS `reqform_reqformpropval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reqform_reqformpropval` (
  `RequestForm_id` int(11) NOT NULL,
  `formPropertyValues_id` int(11) NOT NULL,
  PRIMARY KEY (`RequestForm_id`,`formPropertyValues_id`),
  UNIQUE KEY `UK_gmagmhyt2cyq2v1k9wdh0x38b` (`formPropertyValues_id`),
  CONSTRAINT `FK_mlh3longalkku5evakghwxce6` FOREIGN KEY (`RequestForm_id`) REFERENCES `requestform` (`id`),
  CONSTRAINT `FK_gmagmhyt2cyq2v1k9wdh0x38b` FOREIGN KEY (`formPropertyValues_id`) REFERENCES `requestformpropertyvalues` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reqform_reqformpropval`
--

LOCK TABLES `reqform_reqformpropval` WRITE;
/*!40000 ALTER TABLE `reqform_reqformpropval` DISABLE KEYS */;
/*!40000 ALTER TABLE `reqform_reqformpropval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(3000) DEFAULT NULL,
  `hasParent` bit(1) NOT NULL,
  `objects` varchar(3999) DEFAULT NULL,
  `requestTime` datetime DEFAULT NULL,
  `requester` varchar(100) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_account`
--

DROP TABLE IF EXISTS `request_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_account` (
  `request_type` varchar(31) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `endpointdef_clone` longtext,
  `account_id` varchar(255) DEFAULT NULL,
  `instance_name` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `backendRequestId` varchar(255) DEFAULT NULL,
  `req_comment` varchar(255) DEFAULT NULL,
  `lastUpdate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entitlement_type_clone` longtext,
  `entitlement_id` varchar(255) DEFAULT NULL,
  `entitlement_name` varchar(255) DEFAULT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `requestForm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e9rrhgya70ecjobla8muna6u1` (`basket_id`),
  KEY `FK_me20lyroxfxul3w0myd9buvha` (`requestForm_id`),
  CONSTRAINT `FK_me20lyroxfxul3w0myd9buvha` FOREIGN KEY (`requestForm_id`) REFERENCES `requestform` (`id`),
  CONSTRAINT `FK_e9rrhgya70ecjobla8muna6u1` FOREIGN KEY (`basket_id`) REFERENCES `basket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_account`
--

LOCK TABLES `request_account` WRITE;
/*!40000 ALTER TABLE `request_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestdraft`
--

DROP TABLE IF EXISTS `requestdraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestdraft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftPayload` longtext,
  `name` varchar(255) DEFAULT NULL,
  `requestType` varchar(255) DEFAULT NULL,
  `requestURL` varchar(2048) DEFAULT NULL,
  `requester` varchar(255) DEFAULT NULL,
  `savedTime` datetime DEFAULT NULL,
  `serializedRequest` longtext,
  `sigmaModule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r4qibecu05nyx2whln1qxfmlm` (`sigmaModule_id`),
  CONSTRAINT `FK_r4qibecu05nyx2whln1qxfmlm` FOREIGN KEY (`sigmaModule_id`) REFERENCES `sigmamodule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestdraft`
--

LOCK TABLES `requestdraft` WRITE;
/*!40000 ALTER TABLE `requestdraft` DISABLE KEYS */;
/*!40000 ALTER TABLE `requestdraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestform`
--

DROP TABLE IF EXISTS `requestform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formDefEntitySerializedClone` longtext,
  `layout` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestform`
--

LOCK TABLES `requestform` WRITE;
/*!40000 ALTER TABLE `requestform` DISABLE KEYS */;
/*!40000 ALTER TABLE `requestform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestformpropertyvalues`
--

DROP TABLE IF EXISTS `requestformpropertyvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestformpropertyvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formPropDefSerializedClone` longtext,
  `formPropertyValues` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestformpropertyvalues`
--

LOCK TABLES `requestformpropertyvalues` WRITE;
/*!40000 ALTER TABLE `requestformpropertyvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `requestformpropertyvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestinvocationoperation`
--

DROP TABLE IF EXISTS `requestinvocationoperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestinvocationoperation` (
  `attachment` varchar(30) DEFAULT NULL,
  `errorMessage` varchar(2024) DEFAULT NULL,
  `invocation_clone` longtext NOT NULL,
  `objectId` varchar(100) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `requestId` varchar(100) DEFAULT NULL,
  `statusUpdate` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `requestForm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6xi17ym928tx115ujhcf6yxl1` (`requestForm_id`),
  CONSTRAINT `FK_jdb5vjh6vypst43shcqxe34o6` FOREIGN KEY (`id`) REFERENCES `request` (`id`),
  CONSTRAINT `FK_6xi17ym928tx115ujhcf6yxl1` FOREIGN KEY (`requestForm_id`) REFERENCES `requestform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestinvocationoperation`
--

LOCK TABLES `requestinvocationoperation` WRITE;
/*!40000 ALTER TABLE `requestinvocationoperation` DISABLE KEYS */;
/*!40000 ALTER TABLE `requestinvocationoperation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestpermission`
--

DROP TABLE IF EXISTS `requestpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestpermission` (
  `DTYPE` varchar(31) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(3000) DEFAULT NULL,
  `lastUpdate` datetime DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `sigmarole_clone` longtext,
  `permission_clone` longtext,
  `basket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ev5p6aysip7futt92uqt940ak` (`basket_id`),
  CONSTRAINT `FK_ev5p6aysip7futt92uqt940ak` FOREIGN KEY (`basket_id`) REFERENCES `basket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestpermission`
--

LOCK TABLES `requestpermission` WRITE;
/*!40000 ALTER TABLE `requestpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `requestpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestrole_requestpermission`
--

DROP TABLE IF EXISTS `requestrole_requestpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestrole_requestpermission` (
  `ROLE_ID` int(11) NOT NULL,
  `PERMISSION_ID` int(11) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`PERMISSION_ID`),
  UNIQUE KEY `UK_nobf2d7bobh893k8fjsniovvg` (`PERMISSION_ID`),
  CONSTRAINT `FK_ktu600qysyinql332gpby7uhm` FOREIGN KEY (`ROLE_ID`) REFERENCES `requestpermission` (`id`),
  CONSTRAINT `FK_nobf2d7bobh893k8fjsniovvg` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `requestpermission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestrole_requestpermission`
--

LOCK TABLES `requestrole_requestpermission` WRITE;
/*!40000 ALTER TABLE `requestrole_requestpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `requestrole_requestpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requesttargetpermission`
--

DROP TABLE IF EXISTS `requesttargetpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requesttargetpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `backendRequestId` varchar(100) DEFAULT NULL,
  `errorMessage` varchar(2048) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `statusUpdate` datetime DEFAULT NULL,
  `targetpermission_clone` longtext,
  `taskDefEntitySerializedClone` longtext,
  `taskErrorMessage` varchar(2048) DEFAULT NULL,
  `taskRequestId` varchar(100) DEFAULT NULL,
  `taskRequestStatus` varchar(255) DEFAULT NULL,
  `requestFrom_id` int(11) DEFAULT NULL,
  `requestPermission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9w4mv1xu7evo1i6j30wpe9ugd` (`requestFrom_id`),
  KEY `FK_l9k8dg3mw4omo3fpcuu9iut54` (`requestPermission_id`),
  CONSTRAINT `FK_l9k8dg3mw4omo3fpcuu9iut54` FOREIGN KEY (`requestPermission_id`) REFERENCES `requestpermission` (`id`),
  CONSTRAINT `FK_9w4mv1xu7evo1i6j30wpe9ugd` FOREIGN KEY (`requestFrom_id`) REFERENCES `requestform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requesttargetpermission`
--

LOCK TABLES `requesttargetpermission` WRITE;
/*!40000 ALTER TABLE `requesttargetpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `requesttargetpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestuserviolation`
--

DROP TABLE IF EXISTS `requestuserviolation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestuserviolation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `justification` longtext,
  `message` longtext,
  `score` int(11) DEFAULT NULL,
  `violationEffect` varchar(255) DEFAULT NULL,
  `violationLevel` varchar(20) DEFAULT NULL,
  `parentViolation_id` int(11) DEFAULT NULL,
  `requestBasket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_747f4b90h6svh4rsvfq21v2pc` (`parentViolation_id`),
  KEY `FK_mlxh63lsrs1t3gelmuqxih54y` (`requestBasket_id`),
  CONSTRAINT `FK_mlxh63lsrs1t3gelmuqxih54y` FOREIGN KEY (`requestBasket_id`) REFERENCES `basket` (`id`),
  CONSTRAINT `FK_747f4b90h6svh4rsvfq21v2pc` FOREIGN KEY (`parentViolation_id`) REFERENCES `requestuserviolation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestuserviolation`
--

LOCK TABLES `requestuserviolation` WRITE;
/*!40000 ALTER TABLE `requestuserviolation` DISABLE KEYS */;
/*!40000 ALTER TABLE `requestuserviolation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requserviolationobjentity`
--

DROP TABLE IF EXISTS `requserviolationobjentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requserviolationobjentity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectType` varchar(255) DEFAULT NULL,
  `serializedObjectClone` longtext,
  `serializedValues` longtext,
  `requestUserViolation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_q6foe5n17oj4li44fjg7lsx57` (`requestUserViolation_id`),
  CONSTRAINT `FK_q6foe5n17oj4li44fjg7lsx57` FOREIGN KEY (`requestUserViolation_id`) REFERENCES `requestuserviolation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requserviolationobjentity`
--

LOCK TABLES `requserviolationobjentity` WRITE;
/*!40000 ALTER TABLE `requserviolationobjentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `requserviolationobjentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk`
--

DROP TABLE IF EXISTS `risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk` (
  `risk_type` varchar(31) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `algorithm` int(11) DEFAULT NULL,
  `isBase` bit(1) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `userAttr_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m0ejiqlci3a2kcgo942uqf1su` (`parent_id`),
  KEY `FK_h9hdh0xx6pls9wv7sr3ynp538` (`userAttr_id`),
  KEY `FK_8153jsm3qe18jcf2vucr4oyam` (`permission_id`),
  CONSTRAINT `FK_8153jsm3qe18jcf2vucr4oyam` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`),
  CONSTRAINT `FK_h9hdh0xx6pls9wv7sr3ynp538` FOREIGN KEY (`userAttr_id`) REFERENCES `userattr` (`id`),
  CONSTRAINT `FK_m0ejiqlci3a2kcgo942uqf1su` FOREIGN KEY (`parent_id`) REFERENCES `risk` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk`
--

LOCK TABLES `risk` WRITE;
/*!40000 ALTER TABLE `risk` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_rule`
--

DROP TABLE IF EXISTS `risk_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_rule` (
  `riskRuleType` varchar(31) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `message` varchar(2048) DEFAULT NULL,
  `riskEffect` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `tag` varchar(255) NOT NULL,
  `rule_type` int(11) NOT NULL,
  `numOfRules` int(11) DEFAULT NULL,
  `riskRuleThresholdSegmentName` varchar(255) DEFAULT NULL,
  `condition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_h33pq5042s3vhbtsmuaoyc6si` (`tag`),
  UNIQUE KEY `tagIndex` (`tag`),
  KEY `FK_adnigsqe3g6lun1y3smbs5yyr` (`condition_id`),
  CONSTRAINT `FK_adnigsqe3g6lun1y3smbs5yyr` FOREIGN KEY (`condition_id`) REFERENCES `rule_cond` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_rule`
--

LOCK TABLES `risk_rule` WRITE;
/*!40000 ALTER TABLE `risk_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskuserattrvalues`
--

DROP TABLE IF EXISTS `riskuserattrvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskuserattrvalues` (
  `risk_id` int(11) NOT NULL,
  `userAttrValues` varchar(255) DEFAULT NULL,
  KEY `FK_8xl6jkvl41xr5s3srurebugbc` (`risk_id`),
  CONSTRAINT `FK_8xl6jkvl41xr5s3srurebugbc` FOREIGN KEY (`risk_id`) REFERENCES `risk` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskuserattrvalues`
--

LOCK TABLES `riskuserattrvalues` WRITE;
/*!40000 ALTER TABLE `riskuserattrvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `riskuserattrvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule_cond`
--

DROP TABLE IF EXISTS `rule_cond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_cond` (
  `rule_type` varchar(31) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `excludeExternal` bit(1) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `permissionOperator` int(11) DEFAULT NULL,
  `complexOperator` int(11) DEFAULT NULL,
  `userAttributeOperator` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `userAttribute_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cx9uc4opqiot12iyt6qw9bkl8` (`parent_id`),
  KEY `FK_1pucaxq6d9y25nfn58u2ylx8n` (`userAttribute_id`),
  CONSTRAINT `FK_1pucaxq6d9y25nfn58u2ylx8n` FOREIGN KEY (`userAttribute_id`) REFERENCES `userattr` (`id`),
  CONSTRAINT `FK_cx9uc4opqiot12iyt6qw9bkl8` FOREIGN KEY (`parent_id`) REFERENCES `rule_cond` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule_cond`
--

LOCK TABLES `rule_cond` WRITE;
/*!40000 ALTER TABLE `rule_cond` DISABLE KEYS */;
/*!40000 ALTER TABLE `rule_cond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule_cond_perm_link`
--

DROP TABLE IF EXISTS `rule_cond_perm_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_cond_perm_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `ruleCondition_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jkusbor1qiarxwek6bdxxbp2l` (`permission_id`),
  KEY `FK_t6uro9uoso4jw7icdljqwwhu4` (`ruleCondition_id`),
  CONSTRAINT `FK_t6uro9uoso4jw7icdljqwwhu4` FOREIGN KEY (`ruleCondition_id`) REFERENCES `rule_cond` (`id`),
  CONSTRAINT `FK_jkusbor1qiarxwek6bdxxbp2l` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule_cond_perm_link`
--

LOCK TABLES `rule_cond_perm_link` WRITE;
/*!40000 ALTER TABLE `rule_cond_perm_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `rule_cond_perm_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule_cond_tp_link`
--

DROP TABLE IF EXISTS `rule_cond_tp_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_cond_tp_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruleCondition_id` int(11) NOT NULL,
  `targetPermission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_evun0hc08c7kfbe9d0pniomgf` (`ruleCondition_id`),
  KEY `FK_5p0464ryc9rh48bjtefq8fcc8` (`targetPermission_id`),
  CONSTRAINT `FK_5p0464ryc9rh48bjtefq8fcc8` FOREIGN KEY (`targetPermission_id`) REFERENCES `targetpermission` (`id`),
  CONSTRAINT `FK_evun0hc08c7kfbe9d0pniomgf` FOREIGN KEY (`ruleCondition_id`) REFERENCES `rule_cond` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule_cond_tp_link`
--

LOCK TABLES `rule_cond_tp_link` WRITE;
/*!40000 ALTER TABLE `rule_cond_tp_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `rule_cond_tp_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule_cond_userattr_val`
--

DROP TABLE IF EXISTS `rule_cond_userattr_val`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_cond_userattr_val` (
  `rule_cond_id` int(11) NOT NULL,
  `attrValues` varchar(255) DEFAULT NULL,
  KEY `FK_ou8p8fr3nkvh2jk7tkc91yekv` (`rule_cond_id`),
  CONSTRAINT `FK_ou8p8fr3nkvh2jk7tkc91yekv` FOREIGN KEY (`rule_cond_id`) REFERENCES `rule_cond` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule_cond_userattr_val`
--

LOCK TABLES `rule_cond_userattr_val` WRITE;
/*!40000 ALTER TABLE `rule_cond_userattr_val` DISABLE KEYS */;
/*!40000 ALTER TABLE `rule_cond_userattr_val` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruleextcond_trgtperm_link`
--

DROP TABLE IF EXISTS `ruleextcond_trgtperm_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruleextcond_trgtperm_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_id` int(11) NOT NULL,
  `targetPermission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pna87v2bc7ixkf80x9ss9dfjh` (`condition_id`),
  KEY `FK_nrxnvryjrvathib9n5g47dfk2` (`targetPermission_id`),
  CONSTRAINT `FK_nrxnvryjrvathib9n5g47dfk2` FOREIGN KEY (`targetPermission_id`) REFERENCES `targetpermission` (`id`),
  CONSTRAINT `FK_pna87v2bc7ixkf80x9ss9dfjh` FOREIGN KEY (`condition_id`) REFERENCES `rule_cond` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruleextcond_trgtperm_link`
--

LOCK TABLES `ruleextcond_trgtperm_link` WRITE;
/*!40000 ALTER TABLE `ruleextcond_trgtperm_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruleextcond_trgtperm_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruleexternalcond_perm_link`
--

DROP TABLE IF EXISTS `ruleexternalcond_perm_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruleexternalcond_perm_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9pw2aq6fx9nd0aa0r9diitbnx` (`condition_id`),
  KEY `FK_kkgneh4ohsp9iqrq63bypcs1d` (`permission_id`),
  CONSTRAINT `FK_kkgneh4ohsp9iqrq63bypcs1d` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`),
  CONSTRAINT `FK_9pw2aq6fx9nd0aa0r9diitbnx` FOREIGN KEY (`condition_id`) REFERENCES `rule_cond` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruleexternalcond_perm_link`
--

LOCK TABLES `ruleexternalcond_perm_link` WRITE;
/*!40000 ALTER TABLE `ruleexternalcond_perm_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruleexternalcond_perm_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigmagroup`
--

DROP TABLE IF EXISTS `sigmagroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sigmagroup` (
  `Type` varchar(31) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7yqb1dta9tyt1purlumvgmgw3` (`tag`),
  UNIQUE KEY `tagIndex` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigmagroup`
--

LOCK TABLES `sigmagroup` WRITE;
/*!40000 ALTER TABLE `sigmagroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigmagroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigmamodule`
--

DROP TABLE IF EXISTS `sigmamodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sigmamodule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `uiData` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigmamodule`
--

LOCK TABLES `sigmamodule` WRITE;
/*!40000 ALTER TABLE `sigmamodule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigmamodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigmarole`
--

DROP TABLE IF EXISTS `sigmarole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sigmarole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sigmaRoleGroup_id` int(11) DEFAULT NULL,
  `targetPermission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mkg44atrnfbfdm85ggbx974w7` (`tag`),
  UNIQUE KEY `tagIndex` (`tag`),
  KEY `FK_s7vwec56t8cxj1hol78n0yk4n` (`parent_id`),
  KEY `FK_alkqdvjj4caie1l3gxoivpesp` (`sigmaRoleGroup_id`),
  KEY `FK_n7ua5dj8s45nbyxayt8w1qjp0` (`targetPermission_id`),
  CONSTRAINT `FK_n7ua5dj8s45nbyxayt8w1qjp0` FOREIGN KEY (`targetPermission_id`) REFERENCES `targetpermission` (`id`),
  CONSTRAINT `FK_alkqdvjj4caie1l3gxoivpesp` FOREIGN KEY (`sigmaRoleGroup_id`) REFERENCES `sigmagroup` (`id`),
  CONSTRAINT `FK_s7vwec56t8cxj1hol78n0yk4n` FOREIGN KEY (`parent_id`) REFERENCES `sigmarole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigmarole`
--

LOCK TABLES `sigmarole` WRITE;
/*!40000 ALTER TABLE `sigmarole` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigmarole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigmarole_permission`
--

DROP TABLE IF EXISTS `sigmarole_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sigmarole_permission` (
  `SigmaRole_id` int(11) NOT NULL,
  `permissions_id` int(11) NOT NULL,
  PRIMARY KEY (`SigmaRole_id`,`permissions_id`),
  KEY `FK_9ehsmbtquctlgnsg09lhhv6io` (`permissions_id`),
  CONSTRAINT `FK_a5mgnpugceo1huxc79tfigjdk` FOREIGN KEY (`SigmaRole_id`) REFERENCES `sigmarole` (`id`),
  CONSTRAINT `FK_9ehsmbtquctlgnsg09lhhv6io` FOREIGN KEY (`permissions_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigmarole_permission`
--

LOCK TABLES `sigmarole_permission` WRITE;
/*!40000 ALTER TABLE `sigmarole_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigmarole_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strong_auth`
--

DROP TABLE IF EXISTS `strong_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strong_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `condition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_knr288f4rexakpto0lgei1mv8` (`tag`),
  UNIQUE KEY `tagIndex` (`tag`),
  KEY `FK_37mc2m5kpn67n4xr28h8icvrg` (`condition_id`),
  CONSTRAINT `FK_37mc2m5kpn67n4xr28h8icvrg` FOREIGN KEY (`condition_id`) REFERENCES `rule_cond` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strong_auth`
--

LOCK TABLES `strong_auth` WRITE;
/*!40000 ALTER TABLE `strong_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `strong_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targetpermission`
--

DROP TABLE IF EXISTS `targetpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targetpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `modType` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `connector_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qyr9y4bpcgs80tdtiirpufx90` (`tag`),
  KEY `FK_4rh2vn3e86586sbw6wjdf9ibq` (`connector_id`),
  CONSTRAINT `FK_4rh2vn3e86586sbw6wjdf9ibq` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targetpermission`
--

LOCK TABLES `targetpermission` WRITE;
/*!40000 ALTER TABLE `targetpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `targetpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskdef`
--

DROP TABLE IF EXISTS `taskdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskdef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `tag` varchar(255) NOT NULL,
  `connector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mmr7omufv183rv19i0h2ucw4x` (`tag`),
  UNIQUE KEY `tagIndex` (`tag`),
  KEY `FK_bxltocni0d4nbm2brk36ph43f` (`connector_id`),
  CONSTRAINT `FK_bxltocni0d4nbm2brk36ph43f` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskdef`
--

LOCK TABLES `taskdef` WRITE;
/*!40000 ALTER TABLE `taskdef` DISABLE KEYS */;
/*!40000 ALTER TABLE `taskdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskdefconfiguration`
--

DROP TABLE IF EXISTS `taskdefconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskdefconfiguration` (
  `taskdef_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` longtext,
  UNIQUE KEY `uniquePropertyKeyConstraint` (`taskdef_id`,`name`),
  CONSTRAINT `FK_2gdkeub6jbxvf4mnr2been0xf` FOREIGN KEY (`taskdef_id`) REFERENCES `taskdef` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskdefconfiguration`
--

LOCK TABLES `taskdefconfiguration` WRITE;
/*!40000 ALTER TABLE `taskdefconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `taskdefconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskrule`
--

DROP TABLE IF EXISTS `taskrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskrule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `expression` varchar(512) NOT NULL,
  `isAddSupported` bit(1) NOT NULL,
  `isModifySupported` bit(1) NOT NULL,
  `isRemoveSupported` bit(1) NOT NULL,
  `priority` int(11) NOT NULL,
  `requestMode` varchar(255) DEFAULT NULL,
  `addForm_id` int(11) DEFAULT NULL,
  `modifyForm_id` int(11) DEFAULT NULL,
  `removeForm_id` int(11) DEFAULT NULL,
  `targetPermission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_l6hb0nberb3hhw2ptfqywh17y` (`addForm_id`),
  KEY `FK_o4sy9g88b5ra2jy5kkfx2m8ho` (`modifyForm_id`),
  KEY `FK_1effhk0fqlyxj5v9fqs69xri6` (`removeForm_id`),
  KEY `FK_6at14b9geta7vej2thfmvo03w` (`targetPermission_id`),
  CONSTRAINT `FK_6at14b9geta7vej2thfmvo03w` FOREIGN KEY (`targetPermission_id`) REFERENCES `targetpermission` (`id`),
  CONSTRAINT `FK_1effhk0fqlyxj5v9fqs69xri6` FOREIGN KEY (`removeForm_id`) REFERENCES `formdef` (`id`),
  CONSTRAINT `FK_l6hb0nberb3hhw2ptfqywh17y` FOREIGN KEY (`addForm_id`) REFERENCES `formdef` (`id`),
  CONSTRAINT `FK_o4sy9g88b5ra2jy5kkfx2m8ho` FOREIGN KEY (`modifyForm_id`) REFERENCES `formdef` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskrule`
--

LOCK TABLES `taskrule` WRITE;
/*!40000 ALTER TABLE `taskrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `taskrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userattr`
--

DROP TABLE IF EXISTS `userattr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userattr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `backendName` varchar(255) DEFAULT NULL,
  `isSearchable` bit(1) DEFAULT NULL,
  `connector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_klbyxupbapw1v1dhakcmpy6xv` (`connector_id`),
  CONSTRAINT `FK_klbyxupbapw1v1dhakcmpy6xv` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userattr`
--

LOCK TABLES `userattr` WRITE;
/*!40000 ALTER TABLE `userattr` DISABLE KEYS */;
INSERT INTO `userattr` VALUES (1,'2015-09-17 09:01:51','UserId','%USER_ID%',0x01,1),(2,'2015-09-17 09:01:51','FirstName','%FIRST_NAME%',0x01,1),(3,'2015-09-17 09:01:51','LastName','%LAST_NAME%',0x01,1);
/*!40000 ALTER TABLE `userattr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermessagecontentstracture`
--

DROP TABLE IF EXISTS `usermessagecontentstracture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermessagecontentstracture` (
  `UserMessageTemplate_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` longtext,
  UNIQUE KEY `uniquePropertyKeyConstraint` (`UserMessageTemplate_id`,`name`),
  CONSTRAINT `FK_h590x6k7rkmstk1tlko2j7iaw` FOREIGN KEY (`UserMessageTemplate_id`) REFERENCES `usermessagetemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermessagecontentstracture`
--

LOCK TABLES `usermessagecontentstracture` WRITE;
/*!40000 ALTER TABLE `usermessagecontentstracture` DISABLE KEYS */;
/*!40000 ALTER TABLE `usermessagecontentstracture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermessagetemplate`
--

DROP TABLE IF EXISTS `usermessagetemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermessagetemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdate` datetime DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `connectorTemplateName` varchar(255) DEFAULT NULL,
  `tag` varchar(255) NOT NULL,
  `userMessageSenderClass` varchar(255) DEFAULT NULL,
  `connector_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_l79hv5uxnw4kyfg796dlp4s6x` (`tag`),
  KEY `FK_7gdwneenthpvusv8rvt7bgi3v` (`connector_id`),
  CONSTRAINT `FK_7gdwneenthpvusv8rvt7bgi3v` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermessagetemplate`
--

LOCK TABLES `usermessagetemplate` WRITE;
/*!40000 ALTER TABLE `usermessagetemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `usermessagetemplate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-17  9:23:22

