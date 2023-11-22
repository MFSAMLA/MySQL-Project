-- Q1 521425136 MiniProject View 
USE SuwapiyasaPrivateHospital;
CREATE VIEW PatientSurgeryInfo AS
SELECT 
    p.PatientID,
    CONCAT(p.NameWithInitials ,'', p.Surname) AS "Patient Name",
    CONCAT(l.BedNumber, l.RoomNumber) AS "Location",
    s.SurgeryName,
    s.Date
FROM 
    patient p
JOIN
location l ON p.PatientID = l.PatientID
JOIN
Surgery s ON p.PatientID  = s.PatientID ;
	
SELECT * from PatientSurgeryInfo;

    
-- Q2 2.1 521425136 MiniProject View triggers
    
CREATE TABLE MedInfo (
    MedName VARCHAR(200) PRIMARY KEY,
    QuantityAvailable INT,
    ExpirationDate DATE
);
DELIMITER //
CREATE TRIGGER InsertMedInfo
AFTER INSERT ON medication
FOR EACH ROW
BEGIN
    INSERT INTO MedInfo (MedName, QuantityAvailable, ExpirationDate)
    VALUES (NEW.MedicationName, NEW.QuantityOnHand, NEW.ExpirationDate);
END;
//
DELIMITER ;
SELECT * FROM  MedInfo;
INSERT INTO Medication (MedicationCode, MedicationName, ExpirationDate, Cost, QuantityOnHand, QuantityOrdered)
VALUES
    (511, 'Penadol', '2024-05-31', 10.00, 100, 200);

-- 2.2 521425136 MiniProject View triggers

DELIMITER //
CREATE TRIGGER UpdateMedInfo
AFTER UPDATE ON medication
FOR EACH ROW
BEGIN
    UPDATE MedInfo
    SET QuantityAvailable = NEW.QuantityOnHand, ExpirationDate = NEW.ExpirationDate
    WHERE MedName = NEW.MedicationName;
END;
//
DELIMITER ;
UPDATE Medication SET QuantityOnHand = 300 WHERE MedicationCode = 511;
-- 2.3 521425136 MiniProject View triggers
DELIMITER //
CREATE TRIGGER DeleteMedInfo
AFTER DELETE ON medication
FOR EACH ROW
BEGIN
    DELETE FROM MedInfo
    WHERE MedName = OLD.MedicationName;
END;
//
DELIMITER ;
DELETE FROM Medication WHERE MedicationCode = 511;

-- Q3 521425136 MiniProject storeProcedure

DELIMITER //
CREATE PROCEDURE getNoOfMedicationTake(INOUT NoOfMedication INT, -- Input parameter for Patient Identification number
IN Patient_ID INT) -- InOut parameter to store the result
BEGIN
SELECT count(MedicationCode) INTO NoOfMedication -- Query to count medications for the given patient
FROM take
WHERE Patient_ID = PatientID;
END//
DELIMITER ;

CALL getNoOfMedicationTake(@CountMedication,301); -- Call the stored procedure with the patient ID and session variable
SELECT @CountMedication AS No_Of_Medication_Take; -- Display the result stored in the session variable

-- Q4 521425136 MiniProject function

DELIMITER //

CREATE FUNCTION NoOfDaysForExpiration( Expiration_Date date )
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE DaysForExpiration int;
   SET DaysForExpiration = datediff(Expiration_Date, CURDATE());
    RETURN  DaysForExpiration;
END //

DELIMITER ;
SELECT * FROM
    medication
WHERE
    NoOfDaysForExpiration(ExpirationDate) < 30;
    
    -- Q5 521425136 MiniProject load XML file
LOAD XML 
INFILE "D:/521425136_MiniProject/staff.xml"
INTO TABLE Staff
ROWS IDENTIFIED BY "<employee>";

SELECT * FROM Staff;

LOAD XML 
INFILE "D:/521425136_MiniProject/Patient.xml"
INTO TABLE suwapiyasaprivatehospital.Patient
ROWS IDENTIFIED BY "<PATIENT>";
    
SELECT * FROM Patient;

    
    











