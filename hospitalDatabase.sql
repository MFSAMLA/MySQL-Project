-- TMA02 - 521425136 --
-- Drop the database if exists
DROP DATABASE IF EXISTS SuwapiyasaPrivateHospital;
-- Create a new database
CREATE DATABASE SuwapiyasaPrivateHospital;
USE SuwapiyasaPrivateHospital;

-- Create Staff table
CREATE TABLE Staff (
    EmployeeNumber INT NOT NULL,
    Name VARCHAR(255),
    Gender CHAR(1),
    Address VARCHAR(255)
    
);
ALTER TABLE Staff ADD PRIMARY KEY (EmployeeNumber);
-- insert values for table staff
INSERT INTO Staff (EmployeeNumber, Name, Gender, Address)
VALUES
    (101, 'John Smith', 'M', '123 Main Street Colombo'),
    (102, 'Emily Johnson', 'F', '456 Wellwathe Colombo'),
    (103, 'Michael Williams', 'M', '789 Oak Rd Malldives'),
    (104, 'Jessica Brown', 'F', '101 Main Street Galle'),
    (105, 'Wikreme Sinhe', 'M', '555 ADM street Negembo'),
    (106, 'Sarah Jones', 'F', '777 Cedar Ln Kandy'),
    (107, 'Ruchire Thennekone', 'M', '888 Birch Ave Colombo'),
    (108, 'Jennifer Lee', 'F', '999 Willow Rd Hatton'),
    (109, 'Mansoor Ali', 'M', '222 Spruce St Batticalo'),
    (110, 'Hetti Aarachi', 'F', '444 Walnut Colombo'),
    (111, 'Christopher Anderson', 'M', '303 Sunset Blvd Matara'),
    (112, 'Amanda Wilson', 'F', '456 Park Ave Colombo'),
    (113, 'Matthew Thompson', 'M', '777 Lakeview Kandy'),
    (114, 'Melissa Taylor', 'F', '101 Spring St Malasiya'),
    (115, 'Balaji Chanthren', 'M', '888 River Rd India'),
    (116, 'Laura Davis', 'F', '555 Mountain View canada'),
    (117, 'William Smith', 'M', '666 Valley Rd USA'),
    (118, 'Mohammed Ali', 'F', '999 Forest Ln Ampara'),
    (119, 'Nowsath Mohammed', 'M', '222 Meadow Dr Ampara'),
    (120, 'Elizabeth Garcia', 'F', '444 Ridge Ave Colombo'),
    (121, 'Willium Cambel', 'M', '345 Cuba'),
    (122, 'Allison Michel', 'F', '444 Ridge Ave Colombo'),
    (123, 'Lucifer Angel', 'F', '444 Ridge Ave Colombo'),
    (124, 'Diana Maria', 'F', '444 Ridge Ave Anurathepure');

SELECT * FROM Staff;
 
-- Create Doctor table
CREATE TABLE Doctor (
    EmployeeNumber INT NOT NULL,
    Specialty VARCHAR(255),
    HDNumber INT
);
ALTER TABLE Doctor
ADD PRIMARY KEY (EmployeeNumber),
ADD CONSTRAINT FK_Doctor_Staff
FOREIGN KEY (EmployeeNumber) REFERENCES Staff(EmployeeNumber)
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Inserting values into the Doctor table
INSERT INTO Doctor (EmployeeNumber, Specialty, HDNumber)
VALUES
    (101, 'Cardiology', NULL),
    (102, 'Orthopedics', NULL),
    (103, 'Neurology', 101),
    (104, 'Dermatology', NULL),
    (105, 'Pediatrics', NULL);

SELECT * FROM Doctor;

-- Create Surgeon table
CREATE TABLE Surgeon (
    EmployeeNumber INT NOT NULL,
    Specialty VARCHAR(255)
);
ALTER TABLE Surgeon
ADD PRIMARY KEY (EmployeeNumber),
ADD CONSTRAINT FK_Surgeon_Staff
FOREIGN KEY (EmployeeNumber) REFERENCES Staff(EmployeeNumber)
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Inserting values into the Surgeon table
INSERT INTO Surgeon (EmployeeNumber, Specialty)
VALUES
    (110, 'Cardiothoracic Surgery'),
    (114, 'Orthopedic Surgery'),
    (115, 'Plastic Surgery'),
    (116, 'Neurosurgery'),
    (117, 'Cardiovascular Surgery'),
    (106, 'General Surgery');
    
    SELECT * FROM Surgeon;

-- Create Nurse table
CREATE TABLE Nurse (
    EmployeeNumber INT NOT NULL,
    Grade VARCHAR(10),
    Experience INT,
    SurgerySkillType VARCHAR(50)
);
ALTER TABLE Nurse
ADD PRIMARY KEY (EmployeeNumber),
ADD CONSTRAINT FK_Nurse_Staff
FOREIGN KEY (EmployeeNumber) REFERENCES Staff(EmployeeNumber)
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Inserting values into the Nurse table
INSERT INTO Nurse (EmployeeNumber, Grade, Experience, SurgerySkillType)
VALUES
     (107, 'Senior', 5, 'Cardiac Surgery'),
     (108, 'Junior', 2, 'Orthopedic Surgery'),
     (109, 'Senior', 8, 'Neurosurgery'),
     (111, 'Junior', 3, 'General Surgery'),
     (112, 'Junior', 1, null),
     (113, 'Senior', 6, 'Cardiac Surgery'),
     (118, 'Junior', 4, 'Orthopedic Surgery'),
     (119, 'Senior', 7, 'Neurosurgery'),
     (120, 'Junior', 2, 'General Surgery'),
     (121, 'Junior', 1, null),
     (122, 'Senior', 9, 'Plastic Surgery'),
     (123, 'Junior', 1, null),
     (124, 'Junior', 1, null);

SELECT * FROM Nurse;

-- Create Patient table
CREATE TABLE Patient (
    PatientID INT NOT NULL,
    Surname VARCHAR(255),
    NameWithInitials VARCHAR(255),
    Address VARCHAR(255),
    Age INT,
    Allergies VARCHAR(255),
    BloodType VARCHAR(10)
);
ALTER TABLE Patient
ADD PRIMARY KEY (PatientID);

-- Inserting values into the Patient table
INSERT INTO Patient (PatientID, Surname, NameWithInitials, Address, Age, Allergies, BloodType)
VALUES
    (301, 'Lara', 'John A.', '123 Main St', 35, 'Pollen', 'A+'),
    (302, 'Johnson', 'Emily L.', '456 Elm Ave', 42, 'Penicillin', 'B-'),
    (303, 'Wimal', 'Michael J.', '789 Oak Rd', 28, NULL, 'O+'),
    (304, 'Kumara', 'Jessica M.', '101 Pine St', 19, 'Dairy', 'AB-'),
    (305, 'Davis', 'David R.', '555 Maple Dr', 50, 'Peanuts', 'A+'),
    (306, 'Alvis', 'Sarah K.', '777 Cedar Ln', 65, NULL, 'O-'),
    (307, 'Martinez', 'Robert A.', '888 Birch Ave', 38, 'Shellfish', 'B+'),
    (308, 'Lee', 'Jennifer H.', '999 Willow Rd', 29, 'Pollen', 'O-'),
    (309, 'Taylor', 'Daniel S.', '222 Spruce St', 22, NULL, 'A-'),
    (310, 'White', 'Linda M.', '444 Walnut Dr', 44, 'Penicillin', 'AB+'),
    (311, 'Anderson', 'Christopher D.', '303 Sunset Blvd', 60, 'Shellfish', 'A-'),
    (312, 'Wilson', 'Amanda E.', '456 Park Ave', 37, NULL, 'B+'),
    (313, 'Thompson', 'Matthew L.', '777 Lakeview Dr', 51, 'Pollen', 'O+'),
    (314, 'Taylor', 'Melissa A.', '101 Spring St', 25, 'Dairy', 'A-'),
    (315, 'Johnson', 'James M.', '888 River Rd', 48, 'Peanuts', 'AB-'),
    (316, 'Davis', 'Laura K.', '555 Mountain View', 32, NULL, 'O+'),
    (317, 'Smith', 'William P.', '666 Valley Rd', 56, 'Shellfish', 'B+'),
    (318, 'Martinez', 'Stephanie R.', '999 Forest Ln', 41, NULL, 'O-'),
    (319, 'Brown', 'Ryan S.', '222 Meadow Dr', 27, 'Penicillin', 'A-'),
    (320, 'Garcia', 'Elizabeth T.', '444 Ridge Ave', 19, 'Dairy', 'AB+');

SELECT * FROM Patient;

-- Create Surgery table
CREATE TABLE Surgery (
    PatientID INT NOT NULL,
    SurgeryName VARCHAR(255),
    SpecialNeeds VARCHAR(255),
    Category VARCHAR(50),
    Time TIME,
    Date DATE,
    EmployeeNumber INT NOT NULL,
    TheatreNumber INT
);
ALTER TABLE Surgery
ADD PRIMARY KEY (PatientID,EmployeeNumber),
ADD CONSTRAINT FK_Surgery_Patient
FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_Surgery_Staff
FOREIGN KEY (EmployeeNumber) REFERENCES Staff(EmployeeNumber)
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Inserting values into the Surgery table
INSERT INTO Surgery (PatientID, SurgeryName, SpecialNeeds, Category, Time, Date, EmployeeNumber, TheatreNumber)
VALUES
    (301, 'Appendectomy', NULL, 'General', '10:00:00', '2023-07-15', 106, 1),
    (302, 'Knee Replacement', 'Wheelchair access', 'Orthopedic', '14:30:00', '2023-08-02', 108, 2),
    (303, 'Brain Tumor Removal', 'ICU after surgery', 'Neurosurgery', '08:45:00', '2023-06-20', 116, 3),
    (304, 'Liposuction', NULL, 'Plastic', '11:15:00', '2023-09-12', 115, 1),
    (305, 'Open Heart Surgery', 'ICU after surgery', 'Cardiac', '09:30:00', '2023-07-30', 113, 2),
    (306, 'Appendectomy', NULL, 'General', '14:00:00', '2023-08-07', 120, 3),
    (307, 'Hip Replacement', 'Wheelchair access', 'Orthopedic', '11:30:00', '2023-09-18', 114, 1),
    (308, 'Spinal Fusion', 'ICU after surgery', 'Neurosurgery', '15:15:00', '2023-08-25', 116, 2),
    (309, 'Rhinoplasty', NULL, 'Plastic', '13:45:00', '2023-06-10', 122, 3),
    (310, 'Coronary Bypass', 'ICU after surgery', 'Cardiac', '10:45:00', '2023-07-05', 110, 1);

SELECT * FROM Surgery;

-- Create Medication table
CREATE TABLE Medication (
    MedicationCode INT NOT NULL,
    MedicationName VARCHAR(255),
    ExpirationDate DATE,
    Cost DECIMAL(10, 2),
    QuantityOnHand INT,
    QuantityOrdered INT
);
ALTER TABLE Medication
ADD PRIMARY KEY (MedicationCode);

-- Inserting values into the Medication table
INSERT INTO Medication (MedicationCode, MedicationName, ExpirationDate, Cost, QuantityOnHand, QuantityOrdered)
VALUES
    (501, 'Aspirin', '2023-12-31', 5.99, 100, 200),
    (502, 'Ibuprofen', '2024-10-15', 7.49, 150, 250),
    (503, 'Acetaminophen', '2023-11-30', 4.29, 120, 180),
    (504, 'Lisinopril', '2025-06-30', 12.75, 80, 150),
    (505, 'Simvastatin', '2024-08-22', 9.85, 90, 170),
    (506, 'Metformin', '2023-09-10', 6.55, 110, 190),
    (507, 'Loratadine', '2024-05-01', 3.99, 130, 220),
    (508, 'Omeprazole', '2025-03-15', 8.25, 100, 200),
    (509, 'Amlodipine', '2023-07-31', 10.15, 70, 130),
    (510, 'Albuterol', '2024-02-28', 15.50, 60, 110);

SELECT * FROM Medication;

-- Create ContractBasedSalary table
CREATE TABLE ContractBasedSalary (
    EmployeeNumber INT NOT NULL,
    LengthOfContract INT,
    TypeOfContract VARCHAR(50)
);
ALTER TABLE ContractBasedSalary
ADD PRIMARY KEY (EmployeeNumber),
ADD CONSTRAINT FK_ContractBasedSalary_Staff
FOREIGN KEY (EmployeeNumber) REFERENCES Staff(EmployeeNumber)
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Inserting values into the ContractBasedSalary table
INSERT INTO ContractBasedSalary (EmployeeNumber, LengthOfContract, TypeOfContract)
VALUES
    (110, 12, 'Full-Time'),
    (114, 6, 'Part-Time'),
    (115, 24, 'Full-Time'),
    (116, 18, 'Part-Time'),
    (117, 36, 'Full-Time'),
    (106, 12, 'Full-Time');

SELECT * FROM ContractBasedSalary;

-- Create MonthlyBasedSalary table
CREATE TABLE MonthlyBasedSalary (
    EmployeeNumber INT NOT NULL
);
ALTER TABLE MonthlyBasedSalary
ADD PRIMARY KEY (EmployeeNumber),
ADD CONSTRAINT FK_MonthlyBasedSalary_Staff
FOREIGN KEY (EmployeeNumber) REFERENCES Staff(EmployeeNumber)
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Inserting values into the MonthlyBasedSalary table
INSERT INTO MonthlyBasedSalary (EmployeeNumber)
VALUES
    (101),
    (102),
    (103),
    (104),
    (105),
    (107),
    (108),
    (109),
    (110),
    (111),
    (112),
    (113),
    (114),
    (115),
    (116),
    (117),
    (118),
    (119),
    (120);

SELECT * FROM MonthlyBasedSalary;

-- Create Staffs_Telephone table
CREATE TABLE Staffs_Telephone (
    EmployeeNumber INT NOT NULL,
    TelephoneNumber VARCHAR(20)
);
ALTER TABLE Staffs_Telephone
ADD CONSTRAINT FK_Staffs_Telephone_Staff
FOREIGN KEY (EmployeeNumber) REFERENCES Staff(EmployeeNumber)
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Inserting values into the Staffs_Telephone table
INSERT INTO Staffs_Telephone (EmployeeNumber, TelephoneNumber)
VALUES
    (101, '555-1234'),
    (101, '555-5678'),
    (102, '555-9876'),
    (103, '555-4567'),
    (104, '677-8779'),
    (104, '367-1345'),
    (107, '567-2345'),
    (108, '094-9779'),
    (109, '677-6899'),
    (109, '999-7876'),
    (110, '244-5677'),
    (111, '578-0766'),
    (112, '523-4567'),
    (113, '122-5649'),
    (114, '876-0965'),
    (115, '299-9199'),
    (115, '909-9799'),
    (116, '767-9979'),
    (117, '455-9790'),
    (120, '977-2334'),
    (121, '757-4545');
    
    SELECT * FROM Staffs_Telephone;
    
-- Create Patient_Telephone table

CREATE TABLE Patient_Telephone (
    PatientID INT NOT NULL,
    TelephoneNumber VARCHAR(20)
);
ALTER TABLE Patient_Telephone
ADD CONSTRAINT FK_Patient_Telephone_Patient
FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Inserting values into the Patient_Telephone table
INSERT INTO Patient_Telephone (PatientID, TelephoneNumber)
VALUES
    (301, '555-1111'),
    (302, '555-2222'),
    (305, '555-3333'),
    (305, '555-4444'),
    (306, '555-5555'),
    (307, '555-6666'),
    (307, '555-7777'),
    (308, '555-8888'),
    (309, '555-9999'),
    (312, '555-1212'),
    (313, '555-2323'),
    (314, '555-4545'),
    (315, '555-5656'),
    (315, '555-4567'),
    (316, '555-1234'),
    (318, '555-3445'),
    (319, '555-8865');

SELECT * FROM Patient_Telephone;

-- Create Location table
CREATE TABLE Location (
    PatientID INT NOT NULL,
    BedNumber INT,
    RoomNumber INT,
    NursingUnit VARCHAR(50)
    
);
ALTER TABLE Location
ADD PRIMARY KEY (PatientID),
ADD CONSTRAINT FK_Location_Patient
FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Inserting values into the Location table
INSERT INTO Location (PatientID, BedNumber, RoomNumber, NursingUnit)
VALUES
    (311, 101, 201, 'Cardiology'),
    (312, 102, 202, 'Orthopedics'),
    (313, 103, 203, 'Neurology'),
    (314, 104, 204, 'Pediatrics'),
    (310, 105, 205, 'Surgery'),
    (315, 103, 201, 'Cardiology'),
    (316, 104, 202, 'Orthopedics'),
    (317, 101, 203, 'Neurology'),
    (318, 105, 204, 'Pediatrics'),
    (301, 102, 205, 'Surgery'),
    (320, 101, 201, 'Cardiology'),
    (302, 105, 205, 'Surgery');
    
    SELECT * FROM Location;
    
-- Create Interact table
CREATE TABLE Interact (
    MedicationCode INT NOT NULL,
    Severity VARCHAR(50)
   
);
ALTER TABLE Interact
ADD CONSTRAINT FK_Interact_Medication
FOREIGN KEY (MedicationCode) REFERENCES Medication(MedicationCode)
ON DELETE RESTRICT ON UPDATE CASCADE;
    
    -- Inserting values into the Interact table
INSERT INTO Interact (MedicationCode, Severity)
VALUES
    (502, 'High'),
    (503, 'Moderate'),
    (506, 'Low'),
    (509, 'None'),
    (504, 'High'),
    (507, 'Moderate'),
    (501, 'Low'),
    (505, 'None'),
    (510, 'High');

SELECT * FROM Interact;

-- Create Serves table
CREATE TABLE Serves (
    PatientID INT NOT NULL,
    EmployeeNumber INT NOT NULL
);
ALTER TABLE Serves
ADD CONSTRAINT FK_Serves_Patient
FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_Serves_Staff
FOREIGN KEY (EmployeeNumber) REFERENCES Staff(EmployeeNumber)
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Inserting values into the Serves table
INSERT INTO Serves (PatientID, EmployeeNumber)
VALUES
    
    (311, 101),
    (311, 105),
    (314, 105),
    (315, 101),
    (315, 105),
    (318, 105),
    (320, 101),
    (312, 102),
    (313, 103);

SELECT * FROM Serves;

-- Create Take table
CREATE TABLE Take (
    PatientID INT NOT NULL,
    MedicationCode INT NOT NULL
);
ALTER TABLE Take
ADD CONSTRAINT FK_Take_Patient
FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_Take_Medication
FOREIGN KEY (MedicationCode) REFERENCES Medication(MedicationCode)
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Inserting values into the Take table
INSERT INTO Take (PatientID, MedicationCode)
VALUES
    (301, 501),
    (301, 506),
    (305, 502),
    (310, 503),
    (315, 504),
    (320, 505),
    (320, 510),
    (311, 506),
    (314, 507),
    (318, 508),
    (304, 509),
    (313, 510);

SELECT * FROM Take;


