create database Exercises;

use Exercises;
 create table Client(
 CintID varchar(6) primary key,
 CintName varchar(25),
 CintUrl varchar(25),
 CintDesc varchar(100)
 );

 create table CintAddr(
 CintAddrID varchar(6) primary key,
 CintID varchar(6),
 CintAddrType varchar(25),
 CintAddr1 varchar(25),
 CintAddr2 varchar(25),
 CintCity varchar(25),
 CintState varchar(25),
 CintCountry varchar(25),
 CintZip varchar(6),
 FOREIGN KEY (CintID) REFERENCES Client(CintID)
 );

 create table CintContMod(
 CintContID varchar(6) primary key,
 CintAddrID varchar(6),
 CintType varchar(25) ,
 CintData varchar(25),
 FOREIGN KEY (CintAddrID) REFERENCES CintAddr(CintAddrID)
 );

create table Candidate(
 CandID varchar(6) primary key,
 CandFirstName varchar(25),
 CandMiddleName varchar(25) ,
 CandLastName varchar(25),
 CandFatherName varchar(25),
 CandMaritalStatus varchar(25),
 CandBirthDate varchar(25),
 CandBirthPlace varchar(25),
 CandReligion varchar(25),
 CandSalExpected varchar(25),
 CandEmail varchar(25),
 CandTotExp varchar(25)
 );
 
 create table CandAddr(
 CandAddrID varchar(6) primary key,
 CandID varchar(6) references Candidate(CandID),
 CandAddr1 varchar(25),
 CandAddr2 varchar(25),
 CandCity varchar(25),
 CandState varchar(25),
 CandCountry varchar(25),
 CandZip varchar(6),
 CandTel varchar(8),
 CandMob varchar(10)
 );
 
 create table CandQual(
 QualID varchar(6) primary key,
 CandID varchar(6) references Candidate(CandID),
 QualType varchar(25),
 ExamName varchar(25),
 InstitutionName varchar(25),
 BoardName varchar(25),
 YearOfPassing varchar(5),
 Class varchar(15)
 );	