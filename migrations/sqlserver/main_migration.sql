--creation query

CREATE DATABASE dev_kfw 
use dev_kfw


CREATE TABLE Applicant
(
ApplicantId NVARCHAR(MAX),
Name NVARCHAR(MAX),
BirthDate DATETIME,
HasHighSchoolScholarship BIT,
HasCollegeScholarship BIT,
HasWork BIT
)
ALTER TABLE Applicant ADD CONSTRAINT DF_HasHighSchoolScholarship DEFAULT (0) FOR HasHighSchoolScholarship 
ALTER TABLE Applicant ADD CONSTRAINT DF_HasCollegeScholarship DEFAULT (0) FOR HasCollegeScholarship
ALTER TABLE Applicant ADD CONSTRAINT DF_HasWork DEFAULT (0) FOR HasWork

ALTER TABLE Applicant DROP COLUMN ApplicantId
ALTER TABLE Applicant ADD ApplicantId VARCHAR(250) NOT NULL
ALTER TABLE Applicant ADD CONSTRAINT PK_Applicant PRIMARY KEY (ApplicantId)



CREATE TABLE Department
(
Name NVARCHAR(50) NOT NULL
)
ALTER TABLE Department ADD CONSTRAINT PK_Department PRIMARY KEY (Name)
ALTER TABLE Applicant ADD DepartmentName NVARCHAR(50)
ALTER TABLE Applicant ADD CONSTRAINT FK_Applicant_Department FOREIGN KEY (DepartmentName) REFERENCES Department (Name)
ALTER TABLE Applicant ADD Salary DECIMAL
ALTER TABLE Applicant ADD  WorkType NVARCHAR(50)


CREATE TABLE Faculty
(
FacultyId INT NOT NULL,
Name NVARCHAR(50) NOT NULL,
Description NVARCHAR(MAX)
)

ALTER TABLE Faculty ADD CONSTRAINT Pk_Faculty PRIMARY KEY (FacultyId)

CREATE TABLE ApplicantFaculty
(
ApplicantFacultyId INT NOT NULL,
ApplicantId NVARCHAR(250),
FacultyId INT ,
ApplicanceYear Datetime
)

ALTER TABLE ApplicantFaculty DROP COLUMN ApplicantId
ALTER TABLE ApplicantFaculty ADD  ApplicantId VARCHAR(250)

ALTER TABLE ApplicantFaculty ADD CONSTRAINT Fk_ApplicantFaculty_Applicant FOREIGN KEY (ApplicantId)
REFERENCES Applicant(ApplicantId)

ALTER TABLE ApplicantFaculty ADD CONSTRAINT Fk_ApplicantFaculty_Faculty FOREIGN KEY (FacultyId)
REFERENCES Faculty(FacultyId)

ALTER TABLE ApplicantFaculty ADD Seat NVARCHAR(50)

ALTER TABLE ApplicantFaculty ADD CONSTRAINT FK_ApplicantFaculty_Department FOREIGN KEY (Seat)
REFERENCES Department(Name)


CREATE TABLE Career 
(
CareerId INT NOT NULL,
Name Nvarchar(MAX),
Description NVARCHAR(MAX)
)

ALTER TABLE Career ADD CONSTRAINT PK_Career PRIMARY KEY(CareerId)

CREATE TABLE FacultyCareer
(
FacultyCareerId INT NOT NULL,
FacultyId INT,
CareerId INT 
)

ALTER TABLE ApplicantFaculty DROP CONSTRAINT Fk_ApplicantFaculty_Faculty

ALTER TABLE ApplicantFaculty ADD FacultyCareerId INT

ALTER TABLE FacultyCareer ADD CONSTRAINT PK_FacultyCarreer PRIMARY KEY (FacultyCareerId)

ALTER TABLE FacultyCareer ADD CONSTRAINT FK_FacultyCareer_Faculty 
FOREIGN KEY (FacultyId) REFERENCES Faculty(FacultyId)

ALTER TABLE FacultyCareer ADD CONSTRAINT FK_FacultyCareer_Career 
FOREIGN KEY (CareerId) REFERENCES Career(CareerId)

ALTER TABLE FacultyCareer ADD Seat NVARCHAR(50)

ALTER TABLE FacultyCareer ADD CONSTRAINT FK_FacultyCareer_Department FOREIGN KEY
(Seat)REFERENCES Department (Name)

ALTER TABLE ApplicantFaculty DROP CONSTRAINT FK_ApplicantFaculty_Department

ALTER TABLE ApplicantFAculty DROP COLUMN Seat

ALTER TABLE ApplicantFaculty DROP COLUMN FacultyId

ALTER TABLE ApplicantFaculty ADD CONSTRAINT FK_ApplicantFaculty FOREIGN KEY
(FacultyCareerId) REFERENCES FacultyCareer (FacultyCareerId)
