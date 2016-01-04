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
-- Table structure for table `R_ATTENDEES_RAS`
--
USE `iam_bcom`;

DROP TABLE IF EXISTS `R_ATTENDEES_RAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_ATTENDEES_RAS` (
  `RAS_START_DATE` date NOT NULL,
  `RAS_END_DATE` date DEFAULT NULL,
  `TCT_ID` int(11) NOT NULL,
  `PRS_ID` int(11) NOT NULL,
  `TIN_ID` int(11) NOT NULL,
  `TPE_ID` int(11) NOT NULL,
  PRIMARY KEY (`TCT_ID`,`PRS_ID`,`TIN_ID`,`TPE_ID`),
  KEY `FK_R_ATTENDEES_RAS_PRS_ID` (`PRS_ID`),
  KEY `FK_R_ATTENDEES_RAS_TIN_ID` (`TIN_ID`),
  KEY `FK_R_ATTENDEES_RAS_TPE_ID` (`TPE_ID`),
  CONSTRAINT `FK_R_ATTENDEES_RAS_TPE_ID` FOREIGN KEY (`TPE_ID`) REFERENCES `T_PURPOSE_TPE` (`TPE_ID`),
  CONSTRAINT `FK_R_ATTENDEES_RAS_PRS_ID` FOREIGN KEY (`PRS_ID`) REFERENCES `T_PERSON_PRS` (`PRS_ID`),
  CONSTRAINT `FK_R_ATTENDEES_RAS_TCT_ID` FOREIGN KEY (`TCT_ID`) REFERENCES `T_CONCRETE_EVENT_TCT` (`TCT_ID`),
  CONSTRAINT `FK_R_ATTENDEES_RAS_TIN_ID` FOREIGN KEY (`TIN_ID`) REFERENCES `T_INVOLVEMENT_NATURE_TIN` (`TIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `R_INVOLVED_ROLES`
--

DROP TABLE IF EXISTS `R_INVOLVED_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_INVOLVED_ROLES`(
        `RIR_ID`  int(11) NOT NULL AUTO_INCREMENT,
        `INVOLVED_ROLES_INFO`  Bool ,
        `INVOLVED_ROLES_VALID` Bool ,
        `TTY_ID`               int(11) DEFAULT NULL ,
        `TES_ID`               int(11) DEFAULT NULL ,
        `TPE_ID`               int(11) DEFAULT NULL ,
         TIN_ID                int(11) DEFAULT NULL ,
        `TRG_ID`               int(11) NOT NULL ,
        PRIMARY KEY (`RIR_ID` ),
	KEY `FK_R_INVOLVED_ROLES_TTY_ID` (`TTY_ID`),
	KEY `FK_R_INVOLVED_ROLES_TES_ID` (`TES_ID`),
	KEY `FK_R_INVOLVED_ROLES_TPE_ID` (`TPE_ID`),
	KEY `FK_R_INVOLVED_ROLES_TIN_ID` (`TIN_ID`),
	KEY `FK_R_INVOLVED_ROLES_TRG_ID` (`TRG_ID`),
	CONSTRAINT `FK_R_INVOLVED_ROLES_TTY_ID` FOREIGN KEY (`TTY_ID`) REFERENCES `T_EVENT_TYPE_TTY` (`TTY_ID`),
	CONSTRAINT `FK_R_INVOLVED_ROLES_TES_ID` FOREIGN KEY (`TES_ID`) REFERENCES `T_EVENT_SCOPE_TES` (`TES_ID`),
	CONSTRAINT `FK_R_INVOLVED_ROLES_TPE_ID` FOREIGN KEY (`TPE_ID`) REFERENCES `T_PURPOSE_TPE` (`TPE_ID`),
	CONSTRAINT `FK_R_INVOLVED_ROLES_TIN_ID` FOREIGN KEY (`TIN_ID`) REFERENCES `T_INVOLVEMENT_NATURE_TIN` (`TIN_ID`),
	CONSTRAINT `FK_R_INVOLVED_ROLES_TRG_ID` FOREIGN KEY (`TRG_ID`) REFERENCES `TRG_FUNCTIONAL_TFL` (`TRG_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `R_PRS_THL_TMN`
--

DROP TABLE IF EXISTS `R_PRS_THL_TMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_PRS_THL_TMN` (
  `PRS_THL_TMN_START_DATE` date DEFAULT NULL,
  `PRS_THL_TMN_END_DATE` date DEFAULT NULL,
  `PRS_THL_TMN_COST` float DEFAULT NULL,
  `PRS_ID` int(11) NOT NULL,
  `TAS_ID` int(11) NOT NULL,
  `TMN_ID` int(11) NOT NULL,
  PRIMARY KEY (`PRS_ID`,`TAS_ID`,`TMN_ID`,`PRS_THL_TMN_START_DATE`),
  KEY `FK_R_PRS_THL_TMN_TAS_ID` (`TAS_ID`),
  KEY `FK_R_PRS_THL_TMN_TMN_ID` (`TMN_ID`),
  CONSTRAINT `FK_R_PRS_THL_TMN_TMN_ID` FOREIGN KEY (`TMN_ID`) REFERENCES `T_MISSION_TMN` (`TMN_ID`),
  CONSTRAINT `FK_R_PRS_THL_TMN_PRS_ID` FOREIGN KEY (`PRS_ID`) REFERENCES `T_PERSON_PRS` (`PRS_ID`),
  CONSTRAINT `FK_R_PRS_THL_TMN_TAS_ID` FOREIGN KEY (`TAS_ID`) REFERENCES `T_ADDRESS_TAS` (`TAS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `R_PRS_TRT_TST`
--

DROP TABLE IF EXISTS `R_PRS_TRT_TST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_PRS_TRT_TST` (
  `TRT_ID` int(11) NOT NULL,
  `TST_ID` int(11) NOT NULL,
  `PRS_ID` int(11) NOT NULL,
  PRIMARY KEY (`TRT_ID`,`TST_ID`,`PRS_ID`),
  KEY `FK_R_PRS_TRT_TST_TST_ID` (`TST_ID`),
  KEY `FK_R_PRS_TRT_TST_PRS_ID` (`PRS_ID`),
  CONSTRAINT `FK_R_PRS_TRT_TST_PRS_ID` FOREIGN KEY (`PRS_ID`) REFERENCES `T_PERSON_PRS` (`PRS_ID`),
  CONSTRAINT `FK_R_PRS_TRT_TST_TRT_ID` FOREIGN KEY (`TRT_ID`) REFERENCES `T_REPORT_TRT` (`TRT_ID`),
  CONSTRAINT `FK_R_PRS_TRT_TST_TST_ID` FOREIGN KEY (`TST_ID`) REFERENCES `T_STATUS_TST` (`TST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `R_TET_TEA`
--

DROP TABLE IF EXISTS `R_TET_TEA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_TET_TEA` (
  `TAS_ID` int(11) NOT NULL,
  `TET_ID` int(11) NOT NULL,
  PRIMARY KEY (`TAS_ID`,`TET_ID`),
  KEY `FK_R_TET_TEA_TET_ID` (`TET_ID`),
  CONSTRAINT `FK_R_TET_TEA_TET_ID` FOREIGN KEY (`TET_ID`) REFERENCES `T_EVENT_TET` (`TET_ID`),
  CONSTRAINT `FK_R_TET_TEA_TAS_ID` FOREIGN KEY (`TAS_ID`) REFERENCES `T_ADDRESS_TAS` (`TAS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `R_THG_TLC`
--

DROP TABLE IF EXISTS `R_THG_TLC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_THG_TLC` (
  `THG_ID` int(11) NOT NULL,
  `TLC_ID` int(11) NOT NULL,
  PRIMARY KEY (`THG_ID`,`TLC_ID`),
  KEY `FK_R_THG_TLC_TLC_ID` (`TLC_ID`),
  CONSTRAINT `FK_R_THG_TLC_TLC_ID` FOREIGN KEY (`TLC_ID`) REFERENCES `T_LOYALTY_CARD_TLC` (`TLC_ID`),
  CONSTRAINT `FK_R_THG_TLC_THG_ID` FOREIGN KEY (`THG_ID`) REFERENCES `T_HOSTING_THG` (`THG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `R_TMN_TET`
--

DROP TABLE IF EXISTS `R_TMN_TET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_TMN_TET` (
  `TMN_ID` int(11) NOT NULL,
  `TCT_ID` int(11) NOT NULL,
  PRIMARY KEY (`TMN_ID`,`TCT_ID`),
  KEY `FK_R_TMN_TET_TCT_ID` (`TCT_ID`),
  CONSTRAINT `FK_R_TMN_TET_TCT_ID` FOREIGN KEY (`TCT_ID`) REFERENCES `T_CONCRETE_EVENT_TCT` (`TCT_ID`),
  CONSTRAINT `FK_R_TMN_TET_TMN_ID` FOREIGN KEY (`TMN_ID`) REFERENCES `T_MISSION_TMN` (`TMN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `R_TMN_TTP_TAS_TTN`
--

DROP TABLE IF EXISTS `R_TMN_TTP_TTN_TTL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_TMN_TTP_TTN_TTL` (
  `TMN_TTP_TTN_TTL_DATE` date NOT NULL,
  `TMN_TTP_TTN_TTL_COST` float DEFAULT NULL,
  `TMN_ID` int(11) NOT NULL,
  `TTP_ID` int(11) NOT NULL,
  `TTN_ID` int(11) NOT NULL,
  `TTL_ID_START_LOCATION` int(11) NOT NULL,
  `TTL_ID_END_LOCATION` int(11) NOT NULL,
  PRIMARY KEY (`TMN_ID`,`TTP_ID`,`TTN_ID`,`TTL_ID_START_LOCATION`,`TTL_ID_END_LOCATION`),
  KEY `FK_R_TMN_TTP_TAS_TTN_TTP_ID` (`TTP_ID`),
  KEY `FK_R_TMN_TTP_TAS_TTN_TTN_ID` (`TTN_ID`),
  KEY `FK_R_TMN_TTP_TAS_TTN_TTL_ID_START_LOCATION` (`TTL_ID_START_LOCATION`),
  KEY `FK_R_TMN_TTP_TAS_TTN_TTL_ID_END_LOCATION` (`TTL_ID_END_LOCATION`),
  CONSTRAINT `FK_R_TMN_TTP_TAS_TTN_TTL_ID_END_LOCATION` FOREIGN KEY (`TTL_ID_END_LOCATION`) REFERENCES `T_ADDRESS_TAS` (`TAS_ID`),
  CONSTRAINT `FK_R_TMN_TTP_TAS_TTN_TTL_ID_START_LOCATION` FOREIGN KEY (`TTL_ID_START_LOCATION`) REFERENCES `T_ADDRESS_TAS` (`TAS_ID`),
  CONSTRAINT `FK_R_TMN_TTP_TAS_TTN_TMN_ID` FOREIGN KEY (`TMN_ID`) REFERENCES `T_MISSION_TMN` (`TMN_ID`),
  CONSTRAINT `FK_R_TMN_TTP_TAS_TTN_TTN_ID` FOREIGN KEY (`TTN_ID`) REFERENCES `T_TRANSPORT_NATURE_TTN` (`TTN_ID`),
  CONSTRAINT `FK_R_TMN_TTP_TAS_TTN_TTP_ID` FOREIGN KEY (`TTP_ID`) REFERENCES `T_TRIP_TTP` (`TTP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `R_TRT_TFC_TCS`
--

DROP TABLE IF EXISTS `R_TRT_TFC_TCS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE R_TRT_TFC_TCS(
        `TRT_ID`            int NOT NULL ,
        `TFC_ID`            int NOT NULL ,
        `TCS_ID`            int NOT NULL ,
        PRIMARY KEY (`TRT_ID` ,`TFC_ID` ,`TCS_ID` ),
	KEY `FK_R_TRT_TFC_TCS_TRT_ID` (`TRT_ID`),
	KEY `FK_R_TRT_TFC_TCS_TFC_ID` (`TFC_ID`),
	KEY `FK_R_TRT_TFC_TCS_TCS_ID` (`TCS_ID`),
	CONSTRAINT `FK_R_TRT_TFC_TCS_TRT_ID` FOREIGN KEY (`TRT_ID`) REFERENCES `T_REPORT_TRT`(`TRT_ID`),
	CONSTRAINT `FK_R_TRT_TFC_TCS_TFC_ID` FOREIGN KEY (`TFC_ID`) REFERENCES `T_FILTERED_CHOICES_TFC`(`TFC_ID`),
	CONSTRAINT `FK_R_TRT_TFC_TCS_TCS_ID` FOREIGN KEY (`TCS_ID`) REFERENCES `T_CHOICE_TYPES_TCS`(`TCS_ID`)
)ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `R_TST_TMN`
--
 
DROP TABLE IF EXISTS `R_TST_TMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_TST_TMN` (
  `TST_TMN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TST_TMN_DATE` datetime NOT NULL,
  `TST_TMN_COMMENT` text,
  `TST_ID` int(11) NOT NULL,
  `TMN_ID` int(11) NOT NULL,
  `PRS_ID` int(11) NOT NULL,
  PRIMARY KEY (`TST_TMN_ID`,`TST_ID`,`TMN_ID`,`PRS_ID`),
  KEY `FK_R_TST_TMN_TST_ID` (`TST_ID`),
  KEY `FK_R_TST_TMN_TMN_ID` (`TMN_ID`),
  KEY `FK_R_TST_TMN_PRS_ID` (`PRS_ID`),
  CONSTRAINT `FK_R_TST_TMN_PRS_ID` FOREIGN KEY (`PRS_ID`) REFERENCES `T_PERSON_PRS` (`PRS_ID`),
  CONSTRAINT `FK_R_TST_TMN_TMN_ID` FOREIGN KEY (`TMN_ID`) REFERENCES `T_MISSION_TMN` (`TMN_ID`),
  CONSTRAINT `FK_R_TST_TMN_TST_ID` FOREIGN KEY (`TST_ID`) REFERENCES `T_STATUS_TST` (`TST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `R_TTN_TLC`
--

DROP TABLE IF EXISTS `R_TTN_TLC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_TTN_TLC` (
  `TTN_ID` int(11) NOT NULL,
  `TLC_ID` int(11) NOT NULL,
  PRIMARY KEY (`TTN_ID`,`TLC_ID`),
  KEY `FK_R_TTN_TLC_TLC_ID` (`TLC_ID`),
  CONSTRAINT `FK_R_TTN_TLC_TLC_ID` FOREIGN KEY (`TLC_ID`) REFERENCES `T_LOYALTY_CARD_TLC` (`TLC_ID`),
  CONSTRAINT `FK_R_TTN_TLC_TTN_ID` FOREIGN KEY (`TTN_ID`) REFERENCES `T_TRANSPORT_NATURE_TTN` (`TTN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `R_TTO_TLC`
--

DROP TABLE IF EXISTS `R_TTO_TLC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_TTO_TLC` (
  `TTO_TLC_NUMBER` varchar(255) NOT NULL,
  `TTO_TLC_START_DATE` date DEFAULT NULL,
  `TTO_TLC_END_DATE` date DEFAULT NULL,
  `TLC_ID` int(11) NOT NULL,
  `TTO_ID` int(11) NOT NULL,
  PRIMARY KEY (`TLC_ID`,`TTO_ID`),
  KEY `FK_R_TTO_TLC_TTO_ID` (`TTO_ID`),
  CONSTRAINT `FK_R_TTO_TLC_TTO_ID` FOREIGN KEY (`TTO_ID`) REFERENCES `T_PRS_TRAVEL_INFO_TTO` (`TTO_ID`),
  CONSTRAINT `FK_R_TTO_TLC_TLC_ID` FOREIGN KEY (`TLC_ID`) REFERENCES `T_LOYALTY_CARD_TLC` (`TLC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `R_TTY_TES_CONSTRAINT`
--

DROP TABLE IF EXISTS `R_TTY_TES_CONSTRAINT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_TTY_TES_CONSTRAINT` (
  `TTY_ID` int(11) NOT NULL,
  `TES_ID` int(11) NOT NULL,
  PRIMARY KEY (`TTY_ID`,`TES_ID`),
  KEY `FK_R_TTY_TES_CONSTRAINT_TES_ID` (`TES_ID`),
  CONSTRAINT `FK_R_TTY_TES_CONSTRAINT_TES_ID` FOREIGN KEY (`TES_ID`) REFERENCES `T_EVENT_SCOPE_TES` (`TES_ID`),
  CONSTRAINT `FK_R_TTY_TES_CONSTRAINT_TTY_ID` FOREIGN KEY (`TTY_ID`) REFERENCES `T_EVENT_TYPE_TTY` (`TTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_ADDRESS_TAS`
--

DROP TABLE IF EXISTS `T_ADDRESS_TAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_ADDRESS_TAS` (
  `TAS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TAS_NAME` varchar(255) NOT NULL,
  `TAS_ADDR1` varchar(255) DEFAULT NULL,
  `TAS_ADDR2` varchar(255) DEFAULT NULL,
  `TAS_ADDR3` varchar(255) DEFAULT NULL,
  `TAS_STATE` varchar(255) DEFAULT NULL,
  `TAS_ZIPCODE` varchar(255) DEFAULT NULL,
  `TAS_PHONENUMBER` varchar(25) DEFAULT NULL,
  `TAS_TOWN` varchar(255) DEFAULT NULL,
  `TCY_ID` int(11) NOT NULL,
  PRIMARY KEY (`TAS_ID`),
  KEY `FK_T_ADDRESS_TAS_TCY_ID` (`TCY_ID`),
  CONSTRAINT `FK_T_ADDRESS_TAS_TCY_ID` FOREIGN KEY (`TCY_ID`) REFERENCES `T_COUNTRY_TCY` (`TCY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_CONCRETE_EVENT_TCT`
--

DROP TABLE IF EXISTS `T_CONCRETE_EVENT_TCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_CONCRETE_EVENT_TCT` (
  `TCT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TCT_CREATE_DATE` date NOT NULL,
  `TCT_START_DATE` date DEFAULT NULL,
  `TCT_DURATION` smallint(6) NOT NULL,
  `TCT_COMMENT` text,
  `TCT_URL` varchar(1048) DEFAULT NULL,
  `TCT_COST` float DEFAULT NULL,
  `PRS_ID_AUTHOR` int(11) NOT NULL,
  `TRT_ID` int(11) DEFAULT NULL,
  `PRS_ID_LEADER` int(11) DEFAULT NULL,
  `TAS_ID` int(11) DEFAULT NULL,
  `TET_ID` int(11) NOT NULL,
  PRIMARY KEY (`TCT_ID`),
  KEY `FK_T_CONCRETE_EVENT_TCT_PRS_ID_AUTHOR` (`PRS_ID_AUTHOR`),
  KEY `FK_T_CONCRETE_EVENT_TCT_TRT_ID` (`TRT_ID`),
  KEY `FK_T_CONCRETE_EVENT_TCT_PRS_ID_LEADER` (`PRS_ID_LEADER`),
  KEY `FK_T_CONCRETE_EVENT_TCT_TAS_ID` (`TAS_ID`),
  KEY `FK_T_CONCRETE_EVENT_TCT_TET_ID` (`TET_ID`),
  CONSTRAINT `FK_T_CONCRETE_EVENT_TCT_TET_ID` FOREIGN KEY (`TET_ID`) REFERENCES `T_EVENT_TET` (`TET_ID`),
  CONSTRAINT `FK_T_CONCRETE_EVENT_TCT_PRS_ID_AUTHOR` FOREIGN KEY (`PRS_ID_AUTHOR`) REFERENCES `T_PERSON_PRS` (`PRS_ID`),
  CONSTRAINT `FK_T_CONCRETE_EVENT_TCT_PRS_ID_LEADER` FOREIGN KEY (`PRS_ID_LEADER`) REFERENCES `T_PERSON_PRS` (`PRS_ID`),
  CONSTRAINT `FK_T_CONCRETE_EVENT_TCT_TAS_ID` FOREIGN KEY (`TAS_ID`) REFERENCES `T_ADDRESS_TAS` (`TAS_ID`),
  CONSTRAINT `FK_T_CONCRETE_EVENT_TCT_TRT_ID` FOREIGN KEY (`TRT_ID`) REFERENCES `T_REPORT_TRT` (`TRT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_CONTINENT_CTT`
--

DROP TABLE IF EXISTS `T_CONTINENT_CTT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_CONTINENT_CTT` (
  `CTT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CTT_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CTT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_COUNTRY_TCY`
--

DROP TABLE IF EXISTS `T_COUNTRY_TCY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_COUNTRY_TCY` (
  `TCY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TCY_CODE` int(11) NOT NULL,
  `TCY_ALPHA2` varchar(2) NOT NULL,
  `TCY_ALPHA3` varchar(3) NOT NULL,
  `TCY_EN_GB_NAME` varchar(45) NOT NULL,
  `TCY_FR_FR_NAME` varchar(45) NOT NULL,
  `CTT_ID` int(11) NOT NULL,
  PRIMARY KEY (`TCY_ID`),
  UNIQUE KEY `TCY_CODE` (`TCY_CODE`,`TCY_ALPHA2`,`TCY_ALPHA3`),
  KEY `FK_T_COUNTRY_TCY_CTT_ID` (`CTT_ID`),
  CONSTRAINT `FK_T_COUNTRY_TCY_CTT_ID` FOREIGN KEY (`CTT_ID`) REFERENCES `T_CONTINENT_CTT` (`CTT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_EVENT_ADDRESS_TEA`
--

DROP TABLE IF EXISTS `T_EVENT_ADDRESS_TEA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_EVENT_ADDRESS_TEA` (
  `TAS_ID` int(11) NOT NULL,
  PRIMARY KEY (`TAS_ID`),
  CONSTRAINT `FK_T_EVENT_ADDRESS_TEA_TAS_ID` FOREIGN KEY (`TAS_ID`) REFERENCES `T_ADDRESS_TAS` (`TAS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_EVENT_SCOPE_TES`
--

DROP TABLE IF EXISTS `T_EVENT_SCOPE_TES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_EVENT_SCOPE_TES` (
  `TES_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TES_NAME` varchar(255) NOT NULL,
  `TES_ABBREV` varchar(25) NOT NULL,
  PRIMARY KEY (`TES_ID`),
  UNIQUE KEY `TES_ABBREV` (`TES_ABBREV`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_EVENT_TET`
--

DROP TABLE IF EXISTS `T_EVENT_TET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_EVENT_TET` (
  `TET_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TET_NAME` varchar(255) NOT NULL,
  `TET_URL` varchar(1048) NOT NULL,
  `TET_COMMENT` text,
  `TET_ISPRIVATE` tinyint(1) DEFAULT NULL,
  `TET_ISTEMPLATE` tinyint(1) NOT NULL,
  `TET_DURATION` int(11) DEFAULT NULL,
  `TET_AVERAGE_COST` float DEFAULT NULL,
  `TTY_ID` int(11) NOT NULL,
  `TES_ID` int(11) NOT NULL,
  PRIMARY KEY (`TET_ID`),
  KEY `FK_T_EVENT_TET_TTY_ID` (`TTY_ID`),
  KEY `FK_T_EVENT_TET_TES_ID` (`TES_ID`),
  CONSTRAINT `FK_T_EVENT_TET_TES_ID` FOREIGN KEY (`TES_ID`) REFERENCES `T_EVENT_SCOPE_TES` (`TES_ID`),
  CONSTRAINT `FK_T_EVENT_TET_TTY_ID` FOREIGN KEY (`TTY_ID`) REFERENCES `T_EVENT_TYPE_TTY` (`TTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_EVENT_TYPE_TTY`
--

DROP TABLE IF EXISTS `T_EVENT_TYPE_TTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_EVENT_TYPE_TTY` (
  `TTY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TTY_NAME` varchar(255) DEFAULT NULL,
  `TTY_ABBREV` varchar(25) NOT NULL,
  PRIMARY KEY (`TTY_ID`),
  UNIQUE KEY `TTY_ABBREV` (`TTY_ABBREV`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_HOSTING_LOCATION_THL`
--

DROP TABLE IF EXISTS `T_HOSTING_LOCATION_THL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_HOSTING_LOCATION_THL` (
  `THL_AVERAGE_COST` float DEFAULT NULL,
  `TAS_ID` int(11) NOT NULL,
  `THG_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TAS_ID`),
  KEY `FK_T_HOSTING_LOCATION_THL_THG_ID` (`THG_ID`),
  CONSTRAINT `FK_T_HOSTING_LOCATION_THL_THG_ID` FOREIGN KEY (`THG_ID`) REFERENCES `T_HOSTING_THG` (`THG_ID`),
  CONSTRAINT `FK_T_HOSTING_LOCATION_THL_TAS_ID` FOREIGN KEY (`TAS_ID`) REFERENCES `T_ADDRESS_TAS` (`TAS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_HOSTING_THG`
--

DROP TABLE IF EXISTS `T_HOSTING_THG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_HOSTING_THG` (
  `THG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `THG_NAME` varchar(255) DEFAULT NULL,
  `THG_URL` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`THG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_INVOLVEMENT_NATURE_TIN`
--

DROP TABLE IF EXISTS `T_INVOLVEMENT_NATURE_TIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_INVOLVEMENT_NATURE_TIN` (
  `TIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIN_NAME` varchar(255) NOT NULL,
  `TIN_ABBREV` varchar(25) NOT NULL,
  PRIMARY KEY (`TIN_ID`),
  UNIQUE KEY `TIN_ABBREV` (`TIN_ABBREV`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_LOYALTY_CARD_TLC`
--

DROP TABLE IF EXISTS `T_LOYALTY_CARD_TLC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_LOYALTY_CARD_TLC` (
  `TLC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TLC_TYPE_TITLE` varchar(255) NOT NULL,
  PRIMARY KEY (`TLC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_MISSION_TMN`
--

DROP TABLE IF EXISTS `T_MISSION_TMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_MISSION_TMN` (
  `TMN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TMN_WORKFLOW_ID` varchar(255) DEFAULT NULL,
  `TMN_CREATE_DATE` date DEFAULT NULL,
  `TMN_ESTIMATED_COST` float DEFAULT NULL,
  `TMN_ID_ROOT` int(11) DEFAULT NULL,
  `PRS_ID` int(11) NOT NULL,
  PRIMARY KEY (`TMN_ID`),
  KEY `FK_T_MISSION_TMN_TMN_ID_ROOT` (`TMN_ID_ROOT`),
  KEY `FK_T_MISSION_TMN_PRS_ID` (`PRS_ID`),
  CONSTRAINT `FK_T_MISSION_TMN_TMN_ID_ROOT` FOREIGN KEY (`TMN_ID_ROOT`) REFERENCES `T_MISSION_TMN` (`TMN_ID`),
  CONSTRAINT `FK_T_MISSION_TMN_PRS_ID` FOREIGN KEY (`PRS_ID`) REFERENCES `T_PERSON_PRS` (`PRS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `T_NETWORKING_CONTACT_TNC`
--

DROP TABLE IF EXISTS `T_NETWORKING_CONTACT_TNC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_NETWORKING_CONTACT_TNC`(
        `TNC_ID`         int (11) NOT NULL AUTO_INCREMENT,
        `TNC_NAME`       varchar (255) ,
        `TNC_TITLE`      varchar (255) ,
        `TNC_STRUCTURE`  varchar (255) ,
        `TNC_DISCUSSION` varchar (255) ,
        `TNC_FOLLOWUP`   varchar (255) ,
        `TRT_ID`         int NOT NULL ,
        PRIMARY KEY (`TNC_ID` ),
	KEY `FK_T_NETWORKING_CONTACT_TNC_TRT_ID` (`TRT_ID`),
	CONSTRAINT `FK_T_NETWORKING_CONTACT_TNC_TRT_ID` FOREIGN KEY (`TRT_ID`) REFERENCES `T_REPORT_TRT`(`TRT_ID`)
)ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_PRS_TRAVEL_INFO_TTO`
--

DROP TABLE IF EXISTS `T_PRS_TRAVEL_INFO_TTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_PRS_TRAVEL_INFO_TTO` (
  `TTO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TTO_BIRTHDATE` date DEFAULT NULL,
  `TTO_CELLNUMBER` varchar(25) DEFAULT NULL,
  `TTO_PASSPORTNUMBER` varchar(25) DEFAULT NULL,
  `TTO_PASSPORTEXPDATE` date DEFAULT NULL,
  PRIMARY KEY (`TTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table update for table `T_PERSON_PRS`
--
ALTER TABLE `T_PERSON_PRS` ADD `TTO_ID` int(11) DEFAULT NULL;
ALTER TABLE `T_PERSON_PRS` ADD CONSTRAINT `FK_T_PERSON_PRS_TTO_ID` FOREIGN KEY (`TTO_ID`) REFERENCES `T_PRS_TRAVEL_INFO_TTO` (`TTO_ID`);


--
-- Table structure for table `T_PURPOSE_TPE`
--

DROP TABLE IF EXISTS `T_PURPOSE_TPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_PURPOSE_TPE` (
  `TPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TPE_ABBREV` varchar(25) NOT NULL,
  `TPE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TPE_ID`),
  UNIQUE KEY `TPE_ABBREV` (`TPE_ABBREV`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `T_FILTERED_CHOICES_TFC`
--

DROP TABLE IF EXISTS `T_FILTERED_CHOICES_TFC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE T_FILTERED_CHOICES_TFC(
        `TFC_ID`     int (11) Auto_increment  NOT NULL ,
        `TFC_ABBREV` varchar (25) NOT NULL ,
        `TFC_NAME`   varchar (255) NOT NULL ,
        PRIMARY KEY (`TFC_ID` ) ,
        UNIQUE (`TFC_ABBREV` )
)ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_CHOICE_TYPES_TCS`
--

DROP TABLE IF EXISTS `T_CHOICE_TYPES_TCS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE T_CHOICE_TYPES_TCS(
        `TCS_ID`     int (11) Auto_increment  NOT NULL ,
        `TCS_NAME`   varchar (255) ,
        `TCS_VALUE`  int ,
        `TFC_ID`     int NOT NULL ,
        PRIMARY KEY (`TCS_ID`),
        KEY `FK_T_CHOICE_TYPES_TCS_TFC_ID` (`TFC_ID`),
        CONSTRAINT `FK_T_CHOICE_TYPES_TCS_TFC_ID` FOREIGN KEY (`TFC_ID`) REFERENCES `T_FILTERED_CHOICES_TFC` (`TFC_ID`)
)ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_REPORT_TRT`
--

DROP TABLE IF EXISTS `T_REPORT_TRT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_REPORT_TRT` (
  `TRT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRT_WORKFLOW_ID`       varchar (255) ,
  `TRT_OTHER_CONTENT_TYPE`      varchar (255) ,
  `TRT_VISITORS_NB`       int ,
  `TRT_OTHER_VIS_TYPE`    text ,
  `TRT_COUNTRY_DETAIL`    text ,
  `TRT_PARTNER_NB`        int ,
  `TRT_PARTNER_LIST`      text ,
  `TRT_NEWSPAPER_LIST`    text ,
  `TRT_JOURNALIST_LIST`         text ,
  `TRT_ARTICLE_PRESS_LINKS`     text ,
  `TRT_TREND_1`           text ,
  `TRT_TREND_2`           text ,
  `TRT_TREND_3`           text ,
  `TRT_KEYNOTES`          text ,
  `TRT_STANDS_DEMOS`      text ,
  `TRT_POSITIVE_POINTS`         text ,
  `TRT_NEGATIVE_POINTS`         text ,
  `TRT_BCOM_ACTIONS`      text ,
  `TRT_CONTENTS`          text ,
  `TRT_KEYWORDS`          text ,
  `TRT_DIFFUSION_EMAIL_LIST`    text ,
  `TRT_QUALITY_NOTE`      varchar (2) NOT NULL ,
  `TRT_QUALITY_COMMENT`         text NOT NULL ,
  `TRT_RENOWN_COMMENT`    text NOT NULL ,
  `TRT_DYN_PREVIOUS_SESSION_COMMENT`  text NOT NULL ,
  `TRT_DYN_PREVIOUS_SESSION_NOTE`     varchar (2) NOT NULL ,
  `TRT_STRATEGIC_COVER_NOTE`    varchar (2) NOT NULL ,
  `TRT_STRATEGIC_COVER_COMMENT`       varchar (2) NOT NULL ,
  `TRT_LOBBY_CONTACT_QUAL_NOTE`       varchar (2) NOT NULL ,
  `TRT_LOBBY_CONTACT_QUAL_COMMENT`    varchar (2) NOT NULL ,
  `TRT_BUSINESS_CONTACT_QUAL_NOTE`    varchar (2) NOT NULL ,
  `TRT_BUSINESS_CONTACT_QUAL_COMMENT` varchar (2) NOT NULL ,
  `TRT_BCOM_SPREAD_VALUE_COMMENT`     text NOT NULL ,
  `TRT_QUAL_PRICE_RATIO_NOTE`   varchar (2) NOT NULL ,
  `TRT_QUAL_PRICE_RATIO_COMMENT`      text NOT NULL ,
  PRIMARY KEY (`TRT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_STATUS_TST`
--

DROP TABLE IF EXISTS `T_STATUS_TST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_STATUS_TST` (
  `TST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TST_ABBREV` varchar(25) NOT NULL,
  `TST_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`TST_ID`),
  UNIQUE KEY `TST_NAME` (`TST_NAME`),
  UNIQUE KEY `TST_ABBREV` (`TST_ABBREV`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TRANSPORT_NATURE_TTN`
--

DROP TABLE IF EXISTS `T_TRANSPORT_NATURE_TTN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TRANSPORT_NATURE_TTN` (
  `TTN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TTN_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`TTN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TRAVEL_LOCATION_TTL`
--

DROP TABLE IF EXISTS `T_TRAVEL_LOCATION_TTL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TRAVEL_LOCATION_TTL` (
  `TAS_ID` int(11) NOT NULL,
  PRIMARY KEY (`TAS_ID`),
  CONSTRAINT `FK_T_TRAVEL_LOCATION_TTL_TAS_ID` FOREIGN KEY (`TAS_ID`) REFERENCES `T_ADDRESS_TAS` (`TAS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TRIP_TTP`
--

DROP TABLE IF EXISTS `T_TRIP_TTP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TRIP_TTP` (
  `TTP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TTP_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`TTP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Temporary view structure for view `travel_event`
--

DROP TABLE IF EXISTS `travel_event`;
/*!50001 DROP VIEW IF EXISTS `travel_event`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `travel_event` AS SELECT 
 1 AS `TET_ID`,
 1 AS `TET_NAME`,
 1 AS `TET_URL`,
 1 AS `TET_COMMENT`,
 1 AS `TET_ISPRIVATE`,
 1 AS `TET_ISTEMPLATE`,
 1 AS `TET_DURATION`,
 1 AS `TET_AVERAGE_COST`,
 1 AS `fkTTY_ID`,
 1 AS `fkTES_ID`,
 1 AS `fkTCT_ID`,
 1 AS `TCT_CREATE_DATE`,
 1 AS `TCT_START_DATE`,
 1 AS `TCT_DURATION`,
 1 AS `TCT_COMMENT`,
 1 AS `TCT_URL`,
 1 AS `fkPRS_ID_AUTHOR`,
 1 AS `fkTRT_ID`,
 1 AS `fkPRS_ID_LEADER`,
 1 AS `fkTAS_ID`,
 1 AS `fkTET_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `travel_event`
--

/*!50001 DROP VIEW IF EXISTS `travel_event`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `travel_event` AS select `tet`.`TET_ID` AS `TET_ID`,`tet`.`TET_NAME` AS `TET_NAME`,`tet`.`TET_URL` AS `TET_URL`,`tet`.`TET_COMMENT` AS `TET_COMMENT`,`tet`.`TET_ISPRIVATE` AS `TET_ISPRIVATE`,`tet`.`TET_ISTEMPLATE` AS `TET_ISTEMPLATE`,`tet`.`TET_DURATION` AS `TET_DURATION`,`tet`.`TET_AVERAGE_COST` AS `TET_AVERAGE_COST`,`tet`.`TTY_ID` AS `fkTTY_ID`,`tet`.`TES_ID` AS `fkTES_ID`,`tct`.`TCT_ID` AS `fkTCT_ID`,`tct`.`TCT_CREATE_DATE` AS `TCT_CREATE_DATE`,`tct`.`TCT_START_DATE` AS `TCT_START_DATE`,`tct`.`TCT_DURATION` AS `TCT_DURATION`,`tct`.`TCT_COMMENT` AS `TCT_COMMENT`,`tct`.`TCT_URL` AS `TCT_URL`,`tct`.`PRS_ID_AUTHOR` AS `fkPRS_ID_AUTHOR`,`tct`.`TRT_ID` AS `fkTRT_ID`,`tct`.`PRS_ID_LEADER` AS `fkPRS_ID_LEADER`,`tct`.`TAS_ID` AS `fkTAS_ID`,`tct`.`TET_ID` AS `fkTET_ID` from (`T_EVENT_TET` `tet` join `T_CONCRETE_EVENT_TCT` `tct` on((`tet`.`TET_ID` = `tct`.`TET_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'iam_bcom_mission'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_country` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_country`(in countryCode int(11),in alpha2Code varchar(2), in alpha3Code varchar(3), in nameEN_GB varchar(45), in nameFR_FR varchar(45), in continentName varchar(255))
BEGIN
DECLARE cttID int(11);
SELECT CTT_ID INTO cttID FROM T_CONTINENT_CTT WHERE CTT_NAME=continentName;
IF (cttID IS NOT NULL)
THEN
INSERT INTO T_COUNTRY_TCY (TCY_CODE, TCY_ALPHA2, TCY_ALPHA3, TCY_EN_GB_NAME, TCY_FR_FR_NAME, CTT_ID) VALUES (countryCode,alpha2Code,alpha3Code,nameEN_GB,nameFR_FR,cttID);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bind_event_type_2_scope` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bind_event_type_2_scope`(in eventTypeAbbrev varchar(25),in scopeAbbrev varchar(25))
BEGIN
DECLARE ttyID int(11);
DECLARE tesID int(11);

SELECT TTY_ID INTO ttyID FROM T_EVENT_TYPE_TTY WHERE TTY_ABBREV=eventTypeAbbrev;
SELECT TES_ID INTO tesID FROM T_EVENT_SCOPE_TES WHERE TES_ABBREV=scopeAbbrev;
IF (ttyID IS NOT NULL AND tesID IS NOT NULL)
THEN
INSERT INTO R_TTY_TES_CONSTRAINT (TTY_ID,TES_ID) VALUES (ttyID,tesID);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_scopes_for_event_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_scopes_for_event_type`(in eventTypeAbbrev varchar(25))
BEGIN
SELECT TES_ABBREV,TES_NAME FROM T_EVENT_SCOPE_TES tes
INNER JOIN R_TTY_TES_CONSTRAINT r_tty_tes on r_tty_tes.TES_ID = tes.TES_ID
INNER JOIN T_EVENT_TYPE_TTY tty on tty.TTY_ID = r_tty_tes.TTY_ID
WHERE tty.TTY_ABBREV = eventTypeAbbrev;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_travel_wf_role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_travel_wf_role`(in scopeAbbrev varchar(25),in evtTypeAbbrev varchar(25),in purposeAbbrev varchar(25),in involvAbbrev varchar(25),in bInfo bool, in bValid bool, in trgIDAD varchar(255))
BEGIN
DECLARE scopeID int(11);
DECLARE evtTypeID int(11);
DECLARE purposeID int(11);
DECLARE involvID int(11);
DECLARE trgID int(11);

SET trgID = roleGroupADToID(trgIDAD);

SELECT TES_ID INTO scopeID FROM T_EVENT_SCOPE_TES WHERE TES_ABBREV = scopeAbbrev;
SELECT TTY_ID INTO evtTypeID FROM T_EVENT_TYPE_TTY WHERE TTY_ABBREV = evtTypeAbbrev;
SELECT TPE_ID  INTO purposeID FROM T_PURPOSE_TPE WHERE TPE_ABBREV = purposeAbbrev;
SELECT TIN_ID  INTO involvID FROM T_INVOLVEMENT_NATURE_TIN WHERE TIN_ABBREV = involvAbbrev;


IF ((trgID IS NOT NULL) AND ((scopeID IS NOT NULL) OR (evtTypeID IS NOT NULL) OR (purposeID IS NOT NULL) OR (involvID IS NOT NULL)))
THEN
INSERT INTO R_INVOLVED_ROLES (TTY_ID,TES_ID,TPE_ID,TIN_ID,TRG_ID,INVOLVED_ROLES_INFO,INVOLVED_ROLES_VALID) VALUES (evtTypeID,scopeID,purposeID,involvID,trgID,bInfo,bValid);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_travel_validation_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_travel_validation_roles`()
BEGIN
SELECT GROUP_CONCAT(trg.TRG_ID_AD SEPARATOR ', ') as ValidationRoles from R_INVOLVED_ROLES roles
inner join T_ROLE_GROUPS_TRG trg on trg.TRG_ID = roles.TRG_ID
inner join TRG_FUNCTIONAL_TFL tfl on tfl.TRG_ID = trg.TRG_ID
WHERE roles.INVOLVED_ROLES_VALID = 1
group BY tfl.DIR_ID;
END;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_travel_notified_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_travel_notified_roles`()
BEGIN
SELECT GROUP_CONCAT(trg.TRG_ID_AD SEPARATOR ', ') as ValidationRoles from R_INVOLVED_ROLES roles
inner join T_ROLE_GROUPS_TRG trg on trg.TRG_ID = roles.TRG_ID
inner join TRG_FUNCTIONAL_TFL tfl on tfl.TRG_ID = trg.TRG_ID
WHERE roles.INVOLVED_ROLES_VALID = 0 AND  roles.INVOLVED_ROLES_INFO = 1
group BY tfl.DIR_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_directors_except` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_directors_except`(in directorGGRF varchar(255))
BEGIN
DECLARE roleID int(11);
SELECT ROL_ID INTO roleID FROM T_ROLE_ROL WHERE ROL_ABBREV = 'DIR' LIMIT 1;

SELECT TRG_ID_AD FROM T_ROLE_GROUPS_TRG trg
INNER JOIN TRG_FUNCTIONAL_TFL tfl on tfl.TRG_ID = trg.TRG_ID
WHERE tfl.ROL_ID = roleID AND tfl.DIR_ID NOT IN (
SELECT dir.DIR_ID FROM T_DIRECTION_DIR dir
INNER JOIN TRG_FUNCTIONAL_TFL tfl2 on tfl2.DIR_ID = dir.DIR_ID
INNER JOIN T_ROLE_GROUPS_TRG trg2 on tfl2.TRG_ID = trg2.TRG_ID
WHERE trg2.TRG_ID_AD = directorGGRF);

END;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_template_event` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_template_event`(in eventName varchar(255), in url varchar(1048), in remark text, in isPrivate bool, in duration smallint(6), in cost float, in scopeAbbrev varchar(25), in evtTypeAbbrev varchar(25))
BEGIN
DECLARE eventID int(11);
DECLARE scopeID int(11); 
DECLARE evtTypeID int(11);


SELECT TES_ID INTO scopeID FROM T_EVENT_SCOPE_TES WHERE TES_ABBREV = scopeAbbrev;
SELECT TTY_ID INTO evtTypeID FROM T_EVENT_TYPE_TTY WHERE TTY_ABBREV = evtTypeAbbrev;

IF (scopeID IS NOT NULL AND evtTypeID IS NOT NULL AND eventName IS NOT NULL AND url IS NOT NULL)
THEN
INSERT INTO T_EVENT_TET (TET_NAME,TET_URL,TET_COMMENT,TET_ISPRIVATE,TET_ISTEMPLATE,TET_DURATION,TET_AVERAGE_COST,TTY_ID,TES_ID) VALUES(eventName,url,remark,isPrivate,1,duration,cost,evtTypeID,scopeID);
SELECT LAST_INSERT_ID() AS 'EventID';
ELSE 
SELECT 0  AS 'EventID';
END IF; 

END;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_concrete_event` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_concrete_event`(in eventID int(11),in startDate date, in duration smallint(6),in remark text, in url varchar(1048),in cost float,in prsLogin varchar(255), in addressID int(11))
BEGIN
DECLARE eventName varchar(255);
DECLARE creDate date;
DECLARE prsID int(11);
DECLARE adrID int(11);
DECLARE concreteExistingEvtID int(11);

SELECT TET_NAME INTO eventName FROM T_EVENT_TET WHERE TET_ID = eventID;
SELECT PRS_ID INTO prsID FROM T_PERSON_PRS WHERE PRS_LOGIN = prsLogin;
SELECT TCT_ID INTO concreteExistingEvtID FROM T_CONCRETE_EVENT_TCT WHERE TET_ID = eventID AND TCT_START_DATE = startDate;
SET creDate = CURDATE();

IF (concreteExistingEvtID IS NOT NULL)
THEN 
SELECT 0  AS 'ConcreteEventID';
END IF;

IF (eventName IS NOT NULL AND duration IS NOT NULL AND prsID IS NOT NULL AND concreteExistingEvtID IS NULL)
THEN
INSERT INTO T_CONCRETE_EVENT_TCT (TET_ID,TCT_CREATE_DATE,TCT_START_DATE,TCT_DURATION,TCT_COMMENT,TCT_URL,TCT_COST,PRS_ID_AUTHOR,TAS_ID) VALUES(eventID,creDate,startDate,duration,remark,url,cost,prsID,addressID);
SELECT LAST_INSERT_ID() INTO concreteExistingEvtID;

IF (cost <> 0)
THEN 
UPDATE T_EVENT_TET SET TET_AVERAGE_COST = cost WHERE TET_ID = eventID; 
END IF;

IF (addressID IS NOT NULL)
THEN 
SELECT TAS_ID INTO adrID FROM R_TET_TEA WHERE TAS_ID = addressID AND TET_ID = eventID;

IF (adrID IS NULL)
THEN
INSERT INTO R_TET_TEA (TAS_ID,TET_ID) VALUES (addressID,eventID);
END IF;

END IF;

SELECT concreteExistingEvtID  AS 'ConcreteEventID';
END IF; 

END;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_event` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_event`(in eventName varchar(255), in url varchar(1048), in remark text, in isPrivate bool, in isTemplate bool, in duration smallint(6), in cost float, in scopeAbbrev varchar(25), in evtTypeAbbrev varchar(25), in startDate date, in prsLogin varchar(255), in addressID int(11))
BEGIN
DECLARE eventID int(11);
DECLARE scopeID int(11); 
DECLARE evtTypeID int(11);


SELECT TES_ID INTO scopeID FROM T_EVENT_SCOPE_TES WHERE TES_ABBREV = scopeAbbrev;
SELECT TTY_ID INTO evtTypeID FROM T_EVENT_TYPE_TTY WHERE TTY_ABBREV = evtTypeAbbrev;

IF (scopeID IS NOT NULL AND evtTypeID IS NOT NULL AND prsLogin IS NOT NULL AND eventName IS NOT NULL AND url IS NOT NULL AND isTemplate IS NOT NULL)
THEN
INSERT INTO T_EVENT_TET (TET_NAME,TET_URL,TET_COMMENT,TET_ISPRIVATE,TET_ISTEMPLATE,TET_DURATION,TET_AVERAGE_COST,TTY_ID,TES_ID) VALUES(eventName,url,remark,isPrivate,isTemplate,duration,cost,evtTypeID,scopeID);
SELECT LAST_INSERT_ID() INTO eventID;
call add_concrete_event(eventID, startDate, duration, remark, url, cost, prsLogin, addressID);
ELSE 
SELECT 0  AS 'ConcreteEventID';
END IF; 

END;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_mission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_mission`(in estimatedCost float, in ownerID int, in rootID int)
BEGIN
DECLARE missionID int(11);

INSERT INTO T_MISSION_TMN (TMN_CREATE_DATE,TMN_ESTIMATED_COST,PRS_ID) VALUES (CURDATE(),estimatedCost,ownerID);
SELECT LAST_INSERT_ID() INTO missionID;
IF (rootID IS NOT NULL)
THEN
INSERT INTO R_SIBLING_TMN(TMN_ID_ROOT,TMN_ID_SIBLING) VALUES (rootID,missionID);
END IF;
SELECT missionID;
END;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_report_choices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_report_choices`(in choiceName varchar(255), in choiceValue int, in filterAbbrev varchar(25))
BEGIN
DECLARE filterID int(11);
SELECT TFC_ID INTO filterID FROM T_FILTERED_CHOICES_TFC WHERE TFC_ABBREV = filterAbbrev;
IF (filterID IS NOT NULL)
THEN
INSERT INTO T_CHOICE_TYPES_TCS (TCS_NAME,TCS_VALUE,TFC_ID) VALUES (choiceName,choiceValue,filterID);
END IF;
END;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `addAddress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `addAddress`(adrName varchar(255), state varchar(255), zipcode varchar(255), phoneNumber varchar(25), town varchar(255), addr1 varchar(255), addr2 varchar(255), addr3 varchar(255), countryID int(11)) RETURNS int(11)
BEGIN
INSERT INTO T_ADDRESS_TAS (TAS_NAME,TAS_STATE,TAS_ZIPCODE,TAS_PHONENUMBER,TAS_TOWN,TAS_ADDR1,TAS_ADDR2,TAS_ADDR3,TCY_ID) VALUES (adrName,state,zipcode,phoneNumber,town,addr1,addr2,addr3,countryID);
RETURN LAST_INSERT_ID();
END;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_address` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_address`(in addrType varchar(25),in adrName varchar(255), in addr1 varchar(255), in addr2 varchar(255), in addr3 varchar(255), in zipcode varchar(255), in town varchar(255), in state varchar(255), in countryAlpha3 varchar(3), in phoneNumber varchar(25))
BEGIN
DECLARE addrID int(11);
DECLARE countryID int(11);

SET addrID = 0;
SELECT TCY_ID INTO countryID FROM T_COUNTRY_TCY WHERE TCY_ALPHA3=countryAlpha3;

IF (countryID IS NOT NULL AND (addrType = 'T_EVENT_ADDRESS_TEA' OR addrType = 'T_HOSTING_LOCATION_THL' OR addrType = 'T_TRAVEL_LOCATION_TTL'))
THEN           
START TRANSACTION;                                                                               
SET addrID = addAddress(adrName, state, zipcode, phoneNumber, town, addr1, addr2, addr3, countryID);

IF (addrType = 'T_EVENT_ADDRESS_TEA')
THEN
INSERT INTO T_EVENT_ADDRESS_TEA VALUES(addrID);
END IF;

IF (addrType = 'T_HOSTING_LOCATION_THL')
THEN
INSERT INTO T_HOSTING_LOCATION_THL VALUES(addrID);
END IF;

IF (addrType = 'T_TRAVEL_LOCATION_TTL')
THEN
INSERT INTO T_TRAVEL_LOCATION_TTL VALUES(addrID);
END IF;

COMMIT;

END IF;
SELECT addrID;
END;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


