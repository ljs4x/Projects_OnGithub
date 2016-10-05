-- MySQL Script generated by MySQL Workbench
-- Sat Aug 13 09:47:09 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

/***************************
-- I left the automatic INDEX created 
-- on foreign keys just cause it seems
-- like a reasonable thing to do.
***************************/
CREATE SCHEMA IF NOT EXISTS `ND_Practice` DEFAULT CHARACTER SET utf8 ;
USE `ND_Practice` ;

-- -----------------------------------------------------
-- Table `ND_Practice`.`Patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ND_Practice`.`Patient` ;


CREATE TABLE IF NOT EXISTS `ND_Practice`.`Patient` (
	`Patient_ID` 		INT 			NOT NULL AUTO_INCREMENT,
	`Patient_FName` 	VARCHAR(45) 	NOT NULL,
	`Patient_LName` 	VARCHAR(45) 	NOT NULL,
	`Patient_Phone` 	CHAR(10) 		NOT NULL,
	`Patient_Email` 	VARCHAR(60) 	NULL,
	`Patient_Age` 		TINYINT 		UNSIGNED NOT NULL,
	`Patient_Gender` 	VARCHAR(15) 	NOT NULL COMMENT 'Left as VARCHAR in the interests of including all people of all communities.',
	PRIMARY KEY (`Patient_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ND_Practice`.`Invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ND_Practice`.`Invoice` ;

CREATE TABLE IF NOT EXISTS `ND_Practice`.`Invoice` (
	`Invoice_ID` 		INT 			NOT NULL AUTO_INCREMENT,
	`Invoice_DueDate` 	DATE 			NOT NULL,
	`Invoice_Balance` 	DECIMAL(5,2) 	NOT NULL,
	`Patient_ID` 		INT 			NOT NULL,
	PRIMARY KEY (`Invoice_ID`),
	INDEX `fk_Invoice_Patient1_idx` (`Patient_ID` ASC),
  CONSTRAINT `fk_Invoice_Patient1`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `ND_Practice`.`Patient` (`Patient_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ND_Practice`.`Complaint`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ND_Practice`.`Complaint` ;

CREATE TABLE IF NOT EXISTS `ND_Practice`.`Complaint` (
	`Complaint_ID` 		INT 			NOT NULL AUTO_INCREMENT,
	`Complaint_Name` 	VARCHAR(45) 	NOT NULL,
	PRIMARY KEY (`Complaint_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ND_Practice`.`Visit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ND_Practice`.`Visit` ;

CREATE TABLE IF NOT EXISTS `ND_Practice`.`Visit` (
	`Visit_ID` 			INT 			NOT NULL AUTO_INCREMENT,
	`Visit_Date` 		DATETIME 		NULL,
	`Patient_ID` 		INT 			NOT NULL,
	PRIMARY KEY (`Visit_ID`),
	INDEX `fk_Visit_Patient1_idx` (`Patient_ID` ASC),
  CONSTRAINT `fk_Visit_Patient1`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `ND_Practice`.`Patient` (`Patient_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ND_Practice`.`Insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ND_Practice`.`Insurance` ;

CREATE TABLE IF NOT EXISTS `ND_Practice`.`Insurance` (
	`Insurance_ID` 				INT 			NOT NULL AUTO_INCREMENT,
	`Insurance_Name` 			VARCHAR(45) 	NOT NULL,
	`Insurance_Plan` 			VARCHAR(45) 	NOT NULL,
	`Insurance_Covers_ND` 		ENUM('Y', 'N') 	NULL,
	`Insurance_Covers_L.A.C.` 	ENUM('Y', 'N') 	NULL,
	PRIMARY KEY (`Insurance_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ND_Practice`.`Payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ND_Practice`.`Payment` ;

CREATE TABLE IF NOT EXISTS `ND_Practice`.`Payment` (
	`Payment_ID` 		INT 						NOT NULL AUTO_INCREMENT,
	`Payment_Type` 		ENUM('CASH', 'INSURANCE') 	NOT NULL,
	`Payment_Amount` 	DECIMAL(5,2) 				NOT NULL,
	`Payment_Date` 		DATE 						NOT NULL,
	`Insurance_ID` 		INT 						NULL,
	PRIMARY KEY (`Payment_ID`),
	INDEX `fk_Payment_Insurance1_idx` (`Insurance_ID` ASC),
  CONSTRAINT `fk_Payment_Insurance1`
    FOREIGN KEY (`Insurance_ID`)
    REFERENCES `ND_Practice`.`Insurance` (`Insurance_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ND_Practice`.`VisitComplaints`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ND_Practice`.`VisitComplaints` ;

CREATE TABLE IF NOT EXISTS `ND_Practice`.`VisitComplaints` (
	`Visit_ID`				INT		 	NOT NULL,
	`Complaint_ID` 			INT 		NOT NULL,
	`Complaint_Severity` 	TINYINT 	NULL,
	PRIMARY KEY (`Visit_ID`, `Complaint_ID`),
	INDEX `fk_VisitComplaints_Complaint1_idx` (`Complaint_ID` ASC),
  CONSTRAINT `fk_VisitComplaints_Complaint1`
    FOREIGN KEY (`Complaint_ID`)
    REFERENCES `ND_Practice`.`Complaint` (`Complaint_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_VisitComplaints_Visit1`
    FOREIGN KEY (`Visit_ID`)
    REFERENCES `ND_Practice`.`Visit` (`Visit_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ND_Practice`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ND_Practice`.`Address` ;

CREATE TABLE IF NOT EXISTS `ND_Practice`.`Address` (
	`Address_ID` 			INT 			NOT NULL AUTO_INCREMENT,
	`Address_StreetAddress` VARCHAR(60) 	NOT NULL COMMENT 'VARCHAR 60 for those long street addresses',
	`Address_Address2` 		VARCHAR(45) 	NULL COMMENT 'Address Line 2',
	`Address_City` 			VARCHAR(45) 	NOT NULL,
	`Address_State` 		CHAR(2) 		NOT NULL,
	`Address_ZIp` 			VARCHAR(10) 	NOT NULL,
	PRIMARY KEY (`Address_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ND_Practice`.`PatentAddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ND_Practice`.`PatientAddress` ;

CREATE TABLE IF NOT EXISTS `ND_Practice`.`PatientAddress` (
	`Address_ID` 			INT 			NOT NULL,
	`Patient_ID` 			INT 			NOT NULL,
	PRIMARY KEY (`Address_ID`, `Patient_ID`),
	INDEX `fk_PatientAddress_Patient1_idx` (`Patient_ID` ASC),
  CONSTRAINT `fk_PatientAddress_Address1`
    FOREIGN KEY (`Address_ID`)
    REFERENCES `ND_Practice`.`Address` (`Address_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_PatientAddress_Patient1`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `ND_Practice`.`Patient` (`Patient_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ND_Practice`.`InvoicePayment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ND_Practice`.`InvoicePayment` ;

CREATE TABLE IF NOT EXISTS `ND_Practice`.`InvoicePayment` (
	`Invoice_ID` 			INT 			NOT NULL,
	`Payment_ID` 			INT 			NOT NULL,
	`InvoicePayment_Amount` DECIMAL(5,2) 	NOT NULL,
	PRIMARY KEY (`Invoice_ID`, `Payment_ID`),
	INDEX `fk_InvoicePayment_Payment1_idx` (`Payment_ID` ASC),
  CONSTRAINT `fk_InvoicePayment_Invoice1`
    FOREIGN KEY (`Invoice_ID`)
    REFERENCES `ND_Practice`.`Invoice` (`Invoice_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_InvoicePayment_Payment1`
    FOREIGN KEY (`Payment_ID`)
    REFERENCES `ND_Practice`.`Payment` (`Payment_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ND_Practice`.`Patient_Insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ND_Practice`.`Patient_Insurance` ;

CREATE TABLE IF NOT EXISTS `ND_Practice`.`PatientInsurance` (
	`Patient_ID` 			INT 			NOT NULL,
	`Insurance_ID` 			INT 			NOT NULL,
	`Insurance_CoPay` 		DECIMAL(5,2) 	NOT NULL,
	`Insurance_Expiration` 	DATE 			NULL,
	PRIMARY KEY (`Patient_ID`, `Insurance_ID`),
	INDEX `fk_PatientInsurance_Insurance1_idx` (`Insurance_ID` ASC),
	INDEX `fk_PatientInsurance_Patient1_idx` (`Patient_ID` ASC),
  CONSTRAINT `fk_PatientInsurance_Patient1`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `ND_Practice`.`Patient` (`Patient_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_PatientInsurance_Insurance1`
    FOREIGN KEY (`Insurance_ID`)
    REFERENCES `ND_Practice`.`Insurance` (`Insurance_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ND_Practice`.`Visit_has_Invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ND_Practice`.`VisitInvoice` ;

CREATE TABLE IF NOT EXISTS `ND_Practice`.`VisitInvoice` (
	`Visit_ID` 		INT 		NOT NULL,
	`Invoice_ID` 	INT 		NOT NULL,
	PRIMARY KEY (`Visit_ID`, `Invoice_ID`),
	INDEX `fk_VisitInvoice_Invoice1_idx` (`Invoice_ID` ASC),
	INDEX `fk_VisitInvoice_Visit1_idx` (`Visit_ID` ASC),
  CONSTRAINT `fk_VisitInvoice_Visit1`
    FOREIGN KEY (`Visit_ID`)
    REFERENCES `ND_Practice`.`Visit` (`Visit_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_VisitInvoice_Invoice1`
    FOREIGN KEY (`Invoice_ID`)
    REFERENCES `ND_Practice`.`Invoice` (`Invoice_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;

-- Populating database with data:

INSERT INTO Patient
VALUES 	(DEFAULT, 'Lucas', 'Schwarz', '8029171320', 'luke.schwarz@gmail.com', 34, 'M'),
		(DEFAULT, 'V L', 'Huang', '9990618765', 'vlh@hotmail.com', 38, 'Female'),
        (DEFAULT, 'Will', 'Schwarz', '8024263384', 'wjs@gmail.com', 63, 'M'),
        (DEFAULT, 'Nightingale', 'Riptide', '9999999999', 'riptide@hotmail.com', 22, 'M'),
        (DEFAULT, 'Bosephus', 'Hubbard', '1111111111', DEFAULT, 44, 'M');
        
INSERT INTO Address
VALUES	(DEFAULT, '550 Nasmith Brook Rd', NULL, 'Plainfield', 'VT', '05667'),
		(DEFAULT, '8738 NW 18TH AVE', NULL, 'Seattle', 'WA', '98117'),
        (DEFAULT, '2445 NW 64TH ST', NULL, 'Seattle', 'WA', '98107'),
        (DEFAULT, 'Lingonberry Lane', 'PO BOX 67', 'Edmunds', 'WA', '98873');

INSERT INTO PatientAddress
VALUES	(1, 1),
		(1, 3),
        (2, 2),
        (4, 5),
        (3, 4);

INSERT INTO Visit
VALUES	(DEFAULT, '2014-08-15 12:00:00', 1),
		(DEFAULT, '2014-09-15 12:00:00', 1),
        (DEFAULT, '2016-03-15 14:00:00', 2),
        (DEFAULT, '2015-11-05 17:00:00', 4),
        (DEFAULT, '1999-03-28 12:30:00', 3),
        (DEFAULT, '2016-04-05 09:00:00', 5);
        
INSERT INTO Complaint
VALUES	(DEFAULT, 'Upset Tummy'),
		(DEFAULT, 'Backache'),
        (DEFAULT, 'Depression'),
        (DEFAULT, 'Arthritis'),
        (DEFAULT, 'Hyperactivity'),
        (DEFAULT, 'Gigantism'),
        (DEFAULT, 'Migraines');

INSERT INTO VisitComplaints
VALUES	(1, 2, 6),
		(1, 3, 8),
        (2, 1, 5),
        (3, 2, 10),
        (4, 7, 4),
        (5, 5, 8),
        (6, 2, 8);
        
INSERT INTO Insurance
VALUES	(DEFAULT, 'Group Health', 'Gold', 'Y', 'N'),
		(DEFAULT, 'Premera', 'Bronze', DEFAULT, DEFAULT),
        (DEFAULT, 'Blue Cross', 'Platinum', 'Y', 'Y'),
        (DEFAULT, 'Group Health', 'Silver', 'N', 'N');

INSERT INTO PatientInsurance
VALUES	(1, 1, 20, '2016-11-30'),
		(2, 1, 20, '2016-11-30'),
        (3, 4, 40, '2017-03-15'),
        (4, 3, 00, '2016-12-01');
        
INSERT INTO Invoice
VALUES	(DEFAULT, '2014-10-15', 200, 1),
		(DEFAULT, '2016-04-15', 100, 2),
        (DEFAULT, '2016-12-05', 100, 4),
        (DEFAULT, '1999-04-28', 100, 3),
        (DEFAULT, '2016-05-05', 100, 5);
        
INSERT INTO VisitInvoice
VALUES	(1,1),
		(2,1),
        (3,2),
        (4,3),
        (5,4),
        (6,5);

/*
	This was the hardest table to fill because I was trying to stay 
    consistent across which patient had which insurance and 
    what their co-pay was.
*/        
INSERT INTO Payment
VALUES	(DEFAULT, 'CASH', 20, '2014-08-15', NULL),
		(DEFAULT, 'INSURANCE', 100, '2016-12-15', 3),
		(DEFAULT, 'INSURANCE', 0, '1999-05-15', 4),
        (DEFAULT, 'CASH', 100, '1999-05-17', NULL);

/*
	What if the front desk needs to quickly know 
    if a patient has paid their bills or still needs to pay?
    The front desk shouldn't necessarily have access to patient
    health data.
*/ 
CREATE OR REPLACE VIEW PatientMustPay 
AS
	SELECT 	CONCAT(Patient_LName, ', ', Patient_FName) 	AS 	`Name`,
			Invoice_Balance 							AS 	Balance
	FROM Invoice
		INNER JOIN Patient
			USING (Patient_ID)
	WHERE Invoice_Balance >= 200;

/*	in case you would quickly like to know the most common complaint, 
	without having access to patient info
*/
CREATE OR REPLACE VIEW `MostCommonComplaint` 
AS
	SELECT 	Complaint_Name AS `Name`, 
			COUNT(VisitComplaints.Complaint_ID)
	FROM Complaint
		INNER JOIN VisitComplaints
			USING (Complaint_ID)
	GROUP BY Complaint_Name
    ORDER BY 2 DESC;
    
-- Sample queries follow.

-- So who is local to Washington?
SELECT 	CONCAT(Patient_LName, ', ', Patient_FName) 	AS 	`Name`
FROM Patient
	INNER JOIN PatientAddress
		USING (Patient_ID)
	INNER JOIN Address
		USING (Address_ID)
WHERE Address_State = 'WA';

-- what patient has depression?
SELECT 	CONCAT(Patient_LName, ', ', Patient_FName) 	AS 	`Name`
FROM Patient
	INNER JOIN Visit
		USING (Patient_ID)
	INNER JOIN VisitComplaints
		USING (Visit_ID)
	INNER JOIN Complaint
		USING (Complaint_ID)
WHERE Complaint_Name = 'Depression';

-- show payments involving insurance with the insurance name and plan
SELECT 	Insurance_Name 		AS 		`Name`,
		Insurance_Plan		AS		'Plan',
        Payment_Amount		AS		'Amount'
FROM Insurance
	INNER JOIN Payment
		USING (Insurance_ID);
        
-- Let's just get patient balances so 
-- we know how much money is outstanding
SELECT	CONCAT(Patient_LName, ', ', Patient_FName)	AS	`Name`,
		Invoice_Balance								AS	'Balance'
FROM Patient
	INNER JOIN Invoice
		USING (Patient_ID)
WHERE 2 > 0;