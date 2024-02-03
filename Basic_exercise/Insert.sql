use Exercises;

INSERT INTO Client (CintID, CintName, CintUrl, CintDesc) VALUES ('CLT001', 'SCT India', 'http://sctindia.com', 'Software Package Firm');
INSERT INTO Client (CIntID, CintName, CintUrl, CintDesc) VALUES ('CLT002', 'ABCL Corp', 'http://abcl.com', 'Dealer in Kitchen Utensils');
INSERT INTO Client (CintID, CintName, CintUrl, CintDesc) VALUES ('CLT003', 'Dell Corp', 'http://dellcorp.com', 'Dealer in Computer Peripherals');
INSERT INTO Client (CintID, CintName, CintUrl, CintDesc) VALUES ('CLT004', 'Essenpross', NULL, 'Dealer in Electronics');

INSERT INTO CintAddr (CintAddrID, CintID, CintAddrType, CintAddr1, CintAddr2, CintCity, CintState, CintCountry, CintZip) VALUES ('CLA001', 'CLT001', 'Official', 'Jay Chambers', 'S.V. Road', 'Mumbal', 'Maharashtra', 'India', 400057);
INSERT INTO CintAddr (CintAddrID, CintID, CintAddrType, CintAddr1, CintAddr2, CintCity, CintState, CintCountry, CintZip) VALUES ('CLA002', 'CLT002', 'Official', 'Essenpross', 'Manchen Road', 'Chinow', 'Beijing', 'China', 400058);
INSERT INTO CintAddr (CintAddrID, CintID, CintAddrType, CintAddr1, CintAddr2, CintCity, CintState, CintCountry, CintZip) VALUES ('CLA003', 'CLT003', 'Personal', 'Arjuna Estate', 'Lankan Road', 'Colombo', 'Colombo', 'Srilanka', 400064);
INSERT INTO CintAddr (CintAddrID, CintID, CintAddrType, CintAddr1, CintAddr2, CintCity, CintState, CintCountry, CintZip) VALUES ('CLA004', 'CLT004', 'Official', 'Laxmi Ind. Estate', 'L. S. Marg', 'Bangalore', 'Karnataka', 'India',400017);
INSERT INTO CintAddr (CintAddrID, CintID, CintAddrType, CintAddr1, CintAddr2, CintCity, CintState, CintCountry, CintZip) VALUES ('CLA005', 'CLT001', 'Official', 'Fantasy Villa', 'Washington Road', 'Chicago', 'Chicago', 'America', 400087);
INSERT INTO CintAddr (CintAddrID, CintID, CintAddrType, CintAddr1, CintAddr2, CintCity, CintState, CintCountry, CintZip) VALUES ('CLA006', 'CLT004', 'Personal', 'Rose Apartment', 'Highway', 'Vinci', 'Vancouver', 'Canada', 400057);
INSERT INTO CintAddr (CintAddrID, CintID, CintAddrType, CintAddr1, CintAddr2, CintCity, CintState, CintCountry, CintZip) VALUES ('CLA007', 'CLT003', 'Official', '30 MIDC Road', 'MaDurga Lane', 'Kolatta', 'West Bengal', 'India', 400001); 
INSERT INTO CintAddr (CintAddrID, CintID, CintAddrType, CintAddr1, CintAddr2, CintCity, CintState, CintCountry, CintZip) VALUES ('CLA008', 'CLT003', 'Personal', '5 George Mansion', 'Mandella Road', 'Nairobi', 'Kenya', 'Africa', 400023);

INSERT INTO CintContMod (CintContID, CintAddrID, CintType, CintData) VALUES ('CCT001', 'CLA001', 'Telephone', '022876876');
INSERT INTO CintContMod (CintContID, CintAddrID, CintType, CintData) VALUES ('CCT002', 'CLA002', 'Email', 'myid@gmail.com');
INSERT INTO CintContMod (CintContID, CintAddrID, CintType, CintData) VALUES ('CCT003', 'CLA003', 'Fax Number', '022812323');
INSERT INTO CintContMod (CintContID, CintAddrID, CintType, CintData) VALUES ('CCT004', 'CLA004', 'Mobile', '9892221123');
INSERT INTO CintContMod (CintContID, CintAddrID, CintType, CintData) VALUES ('CCT005', 'CLA001', 'Fax Number', '022866557');
INSERT INTO CintContMod (CintContID, CintAddrID, CintType, CintData) VALUES ('CCT006', 'CLA002', 'Mobile', '981992200');

INSERT INTO Candidate (CandID, CandFirstName, CandMiddleName, CandLastName, CandFatherName, CandMaritalStatus, CandBirthDate, CandBirthPlace, CandReligion, CandSalExpected, CandEmail, CandTotExp) VALUES ('CAN001', 'Sharanam', 'Chaitanya', 'Shah', 'Chaitanya', 'Yes', '1981/01/03', 'Mumbai', 'Hindu', 75000, 'sharanams@hotmail.com', 3);
INSERT INTO Candidate (CandID, CandFirstName, CandMiddleName, CandLastName, CandFatherName, CandMaritalStatus, CandBirthDate, CandBirthPlace, CandReligion, CandSalExpected, CandEmail, CandTotExp) VALUES ('CAN002', 'Robert', 'James', 'Dsilva', 'James', 'No', '1982/01/01', 'Banglore', 'Christian', 7000, 'Robert@gmail.com', 1);
INSERT INTO Candidate (CandID, CandFirstName, CandMiddleName, CandLastName, CandFatherName, CandMaritalStatus, CandBirthDate, CandBirthPlace, CandReligion, CandSalExpected, CandEmail, CandTotExp) VALUES ('CAN003', 'Flora', 'Sam', 'Dcunha', 'Sam', 'Yes', '1952/06/23', 'Kolkotta', 'Christian', 25000, 'Flora@yahoo.com', 1);
INSERT INTO Candidate (CandID, CandFirstName, CandMiddleName, CandLastName, CandFatherName, CandMaritalStatus, CandBirthDate, CandBirthPlace, CandReligion, CandSalExpected, CandEmail, CandTotExp) VALUES ('CAN004', 'Neha', 'Sham', 'Mathur', 'Sham', 'No', '1976/06/22', 'Palakkad', 'Hindu', 27000, 'neha@mathur.com', 4);
INSERT INTO Candidate (CandID, CandFirstName, CandMiddleName, CandLastName, CandFatherName, CandMaritalStatus, CandBirthDate, CandBirthPlace, CandReligion, CandSalExpected, CandEmail, CandTotExp) VALUES ('CAN005', 'Ankit', 'Amar', 'Zaveri', 'Amar', 'Yes', '1978/05/07', 'Chennai', 'Hindu', 10000 , 'ankit@zaveri.com', 3);
INSERT INTO Candidate (CandID, CandFirstName, CandMiddleName, CandLastName, CandFatherName, CandMaritalStatus, CandBirthDate, CandBirthPlace, CandReligion, CandSalExpected, CandEmail, CandTotExp) VALUES ('CAN006', 'Ajay', 'Amay', 'Narvekar', 'Amay', 'Yes', '1973/04/05', 'Mumbai', 'Hindu', 6000, 'ajay@Narvekar.com', 7);

INSERT INTO CandAddr (CandAddrID, CandID, CandAddr1, CandAddr2, CandCity, CandState, CandCountry, CandZip, CandTel, CandMOb) VALUES ('CNA001', 'CAN001', 'Tirupati ', ' Udyog' 'Goregaon', 'Mumbai', 'Maharashtra', 'India', 400067, 28233498, 985643634);
INSERT INTO CandAddr (CandAddrID, CandID, CandAddr1, CandAddr2, CandCity, CandState, CandCountry, CandZip, CandTel, CandMOb) VALUES ('CNA002', 'CAN002', 'Tulip Housing', 'Great Creake Road', 'Ching', 'Beijing', 'China', 400058, 28231156, 981943634);
INSERT INTO CandAddr (CandAddrID, CandID, CandAddr1, CandAddr2, CandCity, CandState, CandCountry, CandZip, CandTel, CandMOb) VALUES ('CNA003', 'CAN003', 'Raw House No. 74', 'Mandella Road', 'Nairobi', 'Kenya', 'Africa', 400055, 28883498, 989043634);
INSERT INTO CandAddr (CandAddrID, CandID, CandAddr1, CandAddr2, CandCity, CandState, CandCountry, CandZip, CandTel, CandMOb) VALUES ('CNA004', 'CAN004', 'Joyee Chambers', 'Viasonala', 'Tokiza', 'Tokyo', 'Japan', 400077, 28873498, 988943631);
INSERT INTO CandAddr (CandAddrID, CandID, CandAddr1, CandAddr2, CandCity, CandState, CandCountry, CandZip, CandTel, CandMOb) VALUES ('CNA005', 'CAN001', 'Navass', 'Peroorkada', 'Thiruvananthapuram', 'Kerala', 'India', 400059, 28563498, 989343634);
INSERT INTO CandAddr (CandAddrID, CandID, CandAddr1, CandAddr2, CandCity, CandState, CandCountry, CandZip, CandTel, CandMOb) VALUES ('CNA006', 'CAN002', 'Chan Lee', 'Guan Road', 'Chinow', 'Beijing', 'China', 400055, 28883498, 989043634);
INSERT INTO CandAddr (CandAddrID, CandID, CandAddr1, CandAddr2, CandCity, CandState, CandCountry, CandZip, CandTel, CandMOb) VALUES ('CNA007', 'CAN003', 'New Enterprise', 'Washington Road', 'Chicago', 'Chicago', 'America', 400067, 28232398, 986543634);
INSERT INTO CandAddr (CandAddrID, CandID, CandAddr1, CandAddr2, CandCity, CandState, CandCountry, CandZip, CandTel, CandMOb) VALUES ('CNA008', 'CAN004', 'Mittal Chambers', 'Kannali Road', 'Thiruvananthapuram', 'Kerala', 'India', 400057, 28236598, 985688634);
INSERT INTO CandAddr (CandAddrID, CandID, CandAddr1, CandAddr2, CandCity, CandState, CandCountry, CandZip, CandTel, CandMOb) VALUES ('CNA009', 'CAN004', 'SunTech Plaza', 'Orchid Road', 'Raffles Place', 'Singapore', 'Singapore', 777705,34454598, 956658634);

INSERT INTO CandQual (QualID, CandID, QualType, ExamName, InstitutionName, BoardName, YearOfPassing, Class) VALUES ('QUA001', 'CAN001', 'Academic', 'Master of Commerce', 'Public Examinations', 'Kerala', '1998', 'First');
INSERT INTO CandQual (QualID, CandID, QualType, ExamName, InstitutionName, BoardName, YearOfPassing, Class) VALUES ('QUA002', 'CAN002', 'Academic', 'S.S.L.C', 'Public Examinations', 'Kerala', '1989', 'Second');
INSERT INTO CandQual (QualID, CandID, QualType, ExamName, InstitutionName, BoardName, YearOfPassing, Class) VALUES ('QUA003', 'CAN003', 'Professional', 'B.A', 'Mumbai University', 'Maharashtra', '1990', 'Second');
INSERT INTO CandQual (QualID, CandID, QualType, ExamName, InstitutionName, BoardName, YearOfPassing, Class) VALUES ('QUA004', 'CAN004', 'Academic', 'Bachelor of Commerce', 'Ambedkar College', 'Mumbai University', '2001', 'Pass');
INSERT INTO CandQual (QualID, CandID, QualType, ExamName, InstitutionName, BoardName, YearOfPassing, Class) VALUES ('QUA005', 'CAN005', 'Professional', 'B.Sc', 'D.Y.Patil college', 'Pune University', '1990', 'First');
INSERT INTO CandQual (QualID, CandID, QualType, ExamName, InstitutionName, BoardName, YearOfPassing, Class) VALUES ('QUA006', 'CAN006', 'Technical', 'PGDCA', 'Engineering College', 'Trichur', '1988', 'Distinction');
INSERT INTO CandQual (QualID, CandID, QualType, ExamName, InstitutionName, BoardName, YearOfPassing, Class) VALUES ('QUA007', 'CAN007', 'Academic', 'B.Sc', 'St. Pauls College','kalamassery','1986','Second');



