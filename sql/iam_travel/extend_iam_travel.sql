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
-- Table structure for table `R_INIT`
--

DROP TABLE IF EXISTS `R_INIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_INIT` (
  `TMN_ID` int(11) NOT NULL,
  `TMN_ID_T_MISSION_TMN` int(11) NOT NULL,
  PRIMARY KEY (`TMN_ID`,`TMN_ID_T_MISSION_TMN`),
  KEY `FK_R_INIT_TMN_ID_T_MISSION_TMN` (`TMN_ID_T_MISSION_TMN`),
  CONSTRAINT `FK_R_INIT_TMN_ID_T_MISSION_TMN` FOREIGN KEY (`TMN_ID_T_MISSION_TMN`) REFERENCES `T_MISSION_TMN` (`TMN_ID`),
  CONSTRAINT `FK_R_INIT_TMN_ID` FOREIGN KEY (`TMN_ID`) REFERENCES `T_MISSION_TMN` (`TMN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `R_INVOLVED_ROLES`
--

DROP TABLE IF EXISTS `R_INVOLVED_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_INVOLVED_ROLES`(
        `INVOLVED_ROLES_INFO`  Bool ,
        `INVOLVED_ROLES_VALID` Bool ,
        `TTY_ID`               Int NOT NULL ,
        `TES_ID`               Int NOT NULL ,
        `TPE_ID`               Int NOT NULL ,
        `TRG_ID`               Int NOT NULL ,
        PRIMARY KEY (`TTY_ID` ,`TES_ID` ,`TPE_ID` ,`TRG_ID` ),
	KEY `FK_R_INVOLVED_ROLES_TTY_ID` (`TTY_ID`),
	KEY `FK_R_INVOLVED_ROLES_TES_ID` (`TES_ID`),
	KEY `FK_R_INVOLVED_ROLES_TPE_ID` (`TPE_ID`),
	KEY `FK_R_INVOLVED_ROLES_TRG_ID` (`TRG_ID`),
	CONSTRAINT `FK_R_INVOLVED_ROLES_TTY_ID` FOREIGN KEY (`TTY_ID`) REFERENCES `T_EVENT_TYPE_TTY` (`TTY_ID`),
	CONSTRAINT `FK_R_INVOLVED_ROLES_TES_ID` FOREIGN KEY (`TES_ID`) REFERENCES `T_EVENT_SCOPE_TES` (`TES_ID`),
	CONSTRAINT `FK_R_INVOLVED_ROLES_TPE_ID` FOREIGN KEY (`TPE_ID`) REFERENCES `T_PURPOSE_TPE` (`TPE_ID`),
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
  CONSTRAINT `FK_R_PRS_THL_TMN_TAS_ID` FOREIGN KEY (`TAS_ID`) REFERENCES `T_ADRESS_TAS` (`TAS_ID`)
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
  CONSTRAINT `FK_R_TET_TEA_TAS_ID` FOREIGN KEY (`TAS_ID`) REFERENCES `T_ADRESS_TAS` (`TAS_ID`)
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
  CONSTRAINT `FK_R_TMN_TTP_TAS_TTN_TTL_ID_END_LOCATION` FOREIGN KEY (`TTL_ID_END_LOCATION`) REFERENCES `T_ADRESS_TAS` (`TAS_ID`),
  CONSTRAINT `FK_R_TMN_TTP_TAS_TTN_TTL_ID_START_LOCATION` FOREIGN KEY (`TTL_ID_START_LOCATION`) REFERENCES `T_ADRESS_TAS` (`TAS_ID`),
  CONSTRAINT `FK_R_TMN_TTP_TAS_TTN_TMN_ID` FOREIGN KEY (`TMN_ID`) REFERENCES `T_MISSION_TMN` (`TMN_ID`),
  CONSTRAINT `FK_R_TMN_TTP_TAS_TTN_TTN_ID` FOREIGN KEY (`TTN_ID`) REFERENCES `T_TRANSPORT_NATURE_TTN` (`TTN_ID`),
  CONSTRAINT `FK_R_TMN_TTP_TAS_TTN_TTP_ID` FOREIGN KEY (`TTP_ID`) REFERENCES `T_TRIP_TTP` (`TTP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `R_TST_TMN`
--

DROP TABLE IF EXISTS `R_TST_TMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_TST_TMN` (
  `TST_TMN_DATE` date NOT NULL,
  `TST_TMN_COMMENT` text,
  `TST_ID` int(11) NOT NULL,
  `TMN_ID` int(11) NOT NULL,
  `PRS_ID` int(11) NOT NULL,
  PRIMARY KEY (`TST_ID`,`TMN_ID`,`PRS_ID`),
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
-- Table structure for table `T_ADRESS_TAS`
--

DROP TABLE IF EXISTS `T_ADRESS_TAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_ADRESS_TAS` (
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
  KEY `FK_T_ADRESS_TAS_TCY_ID` (`TCY_ID`),
  CONSTRAINT `FK_T_ADRESS_TAS_TCY_ID` FOREIGN KEY (`TCY_ID`) REFERENCES `T_COUNTRY_TCY` (`TCY_ID`)
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
  CONSTRAINT `FK_T_CONCRETE_EVENT_TCT_TAS_ID` FOREIGN KEY (`TAS_ID`) REFERENCES `T_ADRESS_TAS` (`TAS_ID`),
  CONSTRAINT `FK_T_CONCRETE_EVENT_TCT_TRT_ID` FOREIGN KEY (`TRT_ID`) REFERENCES `T_REPORT_TRT` (`TRT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_CONTINENT_TCT`
--

DROP TABLE IF EXISTS `T_CONTINENT_TCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_CONTINENT_TCT` (
  `TCT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TCT_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`TCT_ID`)
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
  `TCT_ID` int(11) NOT NULL,
  PRIMARY KEY (`TCY_ID`),
  UNIQUE KEY `TCY_CODE` (`TCY_CODE`,`TCY_ALPHA2`,`TCY_ALPHA3`),
  KEY `FK_T_COUNTRY_TCY_TCT_ID` (`TCT_ID`),
  CONSTRAINT `FK_T_COUNTRY_TCY_TCT_ID` FOREIGN KEY (`TCT_ID`) REFERENCES `T_CONTINENT_TCT` (`TCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_EVENT_ADRESS_TEA`
--

DROP TABLE IF EXISTS `T_EVENT_ADRESS_TEA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_EVENT_ADRESS_TEA` (
  `TAS_ID` int(11) NOT NULL,
  PRIMARY KEY (`TAS_ID`),
  CONSTRAINT `FK_T_EVENT_ADRESS_TEA_TAS_ID` FOREIGN KEY (`TAS_ID`) REFERENCES `T_ADRESS_TAS` (`TAS_ID`)
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
  CONSTRAINT `FK_T_HOSTING_LOCATION_THL_TAS_ID` FOREIGN KEY (`TAS_ID`) REFERENCES `T_ADRESS_TAS` (`TAS_ID`)
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
  PRIMARY KEY (`TIN_ID`)
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
  `TML_CREATE_DATE` date DEFAULT NULL,
  `TMN_ESTIMATED_COST` float DEFAULT NULL,
  `PRS_ID` int(11) NOT NULL,
  PRIMARY KEY (`TMN_ID`),
  KEY `FK_T_MISSION_TMN_PRS_ID` (`PRS_ID`),
  CONSTRAINT `FK_T_MISSION_TMN_PRS_ID` FOREIGN KEY (`PRS_ID`) REFERENCES `T_PERSON_PRS` (`PRS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `TPE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_REPORT_TRT`
--

DROP TABLE IF EXISTS `T_REPORT_TRT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_REPORT_TRT` (
  `TRT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRT_WORKFLOW_ID` varchar(255) DEFAULT NULL,
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
  UNIQUE KEY `TST_NAME` (`TST_NAME`)
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
  CONSTRAINT `FK_T_TRAVEL_LOCATION_TTL_TAS_ID` FOREIGN KEY (`TAS_ID`) REFERENCES `T_ADRESS_TAS` (`TAS_ID`)
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
DECLARE tctID int(11);
SELECT TCT_ID INTO tctID FROM T_CONTINENT_TCT WHERE TCT_NAME=continentName;
IF (tctID IS NOT NULL)
THEN
INSERT INTO T_COUNTRY_TCY (TCY_CODE, TCY_ALPHA2, TCY_ALPHA3, TCY_EN_GB_NAME, TCY_FR_FR_NAME, TCT_ID) VALUES (countryCode,alpha2Code,alpha3Code,nameEN_GB,nameFR_FR,tctID);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


