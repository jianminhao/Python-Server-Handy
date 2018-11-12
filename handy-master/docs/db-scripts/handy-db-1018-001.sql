CREATE DATABASE  IF NOT EXISTS `handy_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `handy_db`;
-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: handy_db
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Bid`
--

DROP TABLE IF EXISTS `Bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Bid` (
  `BID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bid ID, Primary Key',
  `TID` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Ticket ID, Foreign Key of Table Ticket, Mandatory',
  `BPrice` int(11) NOT NULL DEFAULT '0' COMMENT 'Bid price, Optional',
  `BDesc` varchar(255) NOT NULL DEFAULT '' COMMENT 'Bid description, Optional',
  `BTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bid start time, Optional',
  `BStatus` int(11) NOT NULL DEFAULT '0' COMMENT 'Bid status, 0: Submitted, 1: Negotiating, 2: Accepted, 3: Start to work, 4: Ready for pay etc, Optional',
  `ProposeTime` varchar(255) NOT NULL DEFAULT '' COMMENT 'Proposed time slot, Optional',
  PRIMARY KEY (`BID`),
  KEY `TID_idx` (`TID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customer` (
  `CID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Customer ID, Primary Key',
  `CName` varchar(100) NOT NULL DEFAULT '' COMMENT 'Customer Name. Mandatory',
  `CAvatar` varchar(512) NOT NULL DEFAULT '' COMMENT 'Customer Avatar, Photo. Optional   ',
  `CLocation` varchar(200) NOT NULL DEFAULT '' COMMENT 'Customer location, rough location for contractor estimate. Mandatory',
  `CAddress` varchar(200) NOT NULL DEFAULT '' COMMENT 'Customer Detail Address(Detail address, only release to finalized contractor), Optional',
  `CEmail` varchar(100) NOT NULL DEFAULT '' COMMENT 'Customer Email, Optional',
  `CPhone` varchar(20) NOT NULL DEFAULT '0' COMMENT 'Customer phone, Optional ',
  `LoginID` varchar(100) NOT NULL DEFAULT '' COMMENT 'Login ID, Mandatory',
  `Password` varchar(50) NOT NULL DEFAULT '' COMMENT 'Encrypted password, Mandatory',
  `LoginMethod` varchar(10) NOT NULL DEFAULT '' COMMENT 'Google / Facebook / Email / etc, Mandatory',
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Message` (
  `MID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Message ID, Primary Key',
  `TID` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Ticket ID, Foreign Key of Table Ticket, Optional',
  `VID` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vendor ID, foreign key of table vendor, Mandatory',
  `MSequence` varchar(255) NOT NULL DEFAULT '' COMMENT 'Message Sequence, Optional',
  `MDetail` varchar(255) NOT NULL DEFAULT '' COMMENT 'Message Detail, Optional',
  `MType` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Message Type, 1: Request for bid, 2: Response 3: Negotiation etc.',
  PRIMARY KEY (`MID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Payment` (
  `PID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment ID, Primary Key',
  `WID` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Work order ID, Foreign Key of Table Work order, Optional',
  `PStatus` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Pay status, Optional',
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Review` (
  `RID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review ID, Primary Key',
  `WID` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Work order ID, Foreign Key of Table WorkOrder, Mandatory',
  `TID` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Ticket ID, Foreign Key Of Table Ticket, Optional',
  `VID` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vendor ID, Foreign Key of Table Vendor, Mandatory',
  `RDetail` varchar(255) NOT NULL DEFAULT '' COMMENT 'Review Detail, Optional',
  `RResponse` varchar(255) NOT NULL DEFAULT '' COMMENT 'Review response, Optional',
  PRIMARY KEY (`RID`),
  KEY `WID_idx` (`WID`),
  KEY `TID_idx` (`TID`),
  CONSTRAINT `WID` FOREIGN KEY (`WID`) REFERENCES `WorkOrder` (`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Ticket` (
  `TID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ticket ID, Primary Key',
  `CID` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID, Foreign Key of Table Customer, Mandatory',
  `TDesc` varchar(2555) NOT NULL DEFAULT '' COMMENT 'Ticket Description, Mandatory',
  `TPhoto` blob NOT NULL COMMENT 'Main Photo of the ticket, multiple photo will be saved in separate place, Optional',
  `TLocation` varchar(2555) NOT NULL DEFAULT '' COMMENT 'Ticket location, may be same of customer Location, might not be same, rough location for contractor estimate, Mandatory',
  `TAddress` varchar(255) NOT NULL DEFAULT '' COMMENT 'Ticket detail address ( only release to finalized contractor ), Optional',
  `TOpenTime` datetime NOT NULL COMMENT 'Ticket open time, Mandatory',
  `TStatus` int(11) NOT NULL DEFAULT '0' COMMENT '0: Open, 1: Bid started, 2: Negotiation started, 3: Work in progress, 4. cancelled, 5: Finished, 6: Paid, 7: Review done. ',
  `BID` int(11) NOT NULL DEFAULT '0' COMMENT 'Accepted Bid. After one bid is selected, the bid ID will be saved here. Optional',
  `AvailableTime` varchar(255) NOT NULL DEFAULT '' COMMENT 'Available time slot, Optional',
  `TKword` varchar(255) NOT NULL DEFAULT '' COMMENT 'Ticket Keyword to feed contractor, Optional',
  `TimeScheduled` varchar(255) NOT NULL DEFAULT '' COMMENT 'Scheduled time, Optional',
  PRIMARY KEY (`TID`),
  KEY `CID_idx` (`CID`),
  CONSTRAINT `CID` FOREIGN KEY (`CID`) REFERENCES `Customer` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Vendor` (
  `VID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vendor ID, Primary Key',
  `VName` varchar(255) NOT NULL DEFAULT '' COMMENT 'Vendor Name, Mandatory',
  `VPhoto` blob NOT NULL COMMENT 'Vendor photo icon or avatar, Optional',
  `VLocation` varchar(255) NOT NULL DEFAULT '' COMMENT 'Vendor Location, Optional',
  `VAddress` varchar(255) NOT NULL DEFAULT '' COMMENT 'Vendor Address, Optional',
  `VEmail` varchar(255) NOT NULL DEFAULT '' COMMENT 'Vendor Email, Optional',
  `VPhone` varchar(20) NOT NULL DEFAULT '' COMMENT 'Vendor Phone, Optional',
  `LoginID` varchar(255) NOT NULL DEFAULT '' COMMENT 'Login ID, Mandatory',
  `Password` varchar(50) NOT NULL DEFAULT '' COMMENT 'Encrypted password, Mandatory',
  `LoginType` varchar(50) NOT NULL DEFAULT '' COMMENT 'LoginType Google/Facebook/Email, ',
  `Website` varchar(255) NOT NULL DEFAULT '' COMMENT 'Website URL, Optional',
  `YelpLink` varchar(255) NOT NULL DEFAULT '' COMMENT 'Yelp Link, Optional',
  `ServeAreaKword` varchar(255) NOT NULL DEFAULT '' COMMENT 'Area Keyword Served, Mandatory',
  `ServiceKword` varchar(2555) NOT NULL DEFAULT '' COMMENT 'Service Keyword, Mandatory',
  `Star` float NOT NULL DEFAULT '0' COMMENT 'Contractor star, to give customer see how good/bad this contractor is, Optional',
  `TopReview` varchar(255) NOT NULL DEFAULT '' COMMENT 'Top review of this contractor, Optional',
  `JobCount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Jobs that had done through Handy, Optional ',
  PRIMARY KEY (`VID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WorkOrder`
--

DROP TABLE IF EXISTS `WorkOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WorkOrder` (
  `WID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Work order ID, Primary Key',
  `TID` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Ticket ID, Foreign Key of Table Ticket, Mandatory',
  `WPrice` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Work price, Optional',
  `WDesc` varchar(255) NOT NULL DEFAULT '' COMMENT 'Work description, Optional',
  `WTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Work start time, Optional',
  `WStatus` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Work status, 0: Customer paid, 1: Paid contractor, 2: Canceled, refunded and etc, Optional',
  `WPicture` blob NOT NULL COMMENT 'Main picture, Before, WIP, Finish pictures save in separate table. Optional',
  `WStar` float NOT NULL DEFAULT '0' COMMENT 'Review star, Optional',
  `WComment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Comment on this work',
  PRIMARY KEY (`WID`),
  KEY `TID_idx` (`TID`),
  CONSTRAINT `TID` FOREIGN KEY (`TID`) REFERENCES `Ticket` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-18  0:16:13
