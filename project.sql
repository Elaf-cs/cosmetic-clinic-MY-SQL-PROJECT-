CREATE SCHEMA project;

CREATE TABLE department (
depCode INT (5) NOT NULL ,
depName VARCHAR(20) ,
depPhoneNum INT (10) , 
flor VARCHAR (2) , 
suite VARCHAR(2) ,
CONSTRAINT department_PK PRIMARY KEY (depCode)  );

CREATE TABLE service (
serviceID INT (5) NOT NULL ,
serviceName VARCHAR (20) ,
serviceType VARCHAR(20),
serviceCost DECIMAL (7,2) ,
depCode INT (5),
CONSTRAINT service_PK PRIMARY KEY (serviceID),
CONSTRAINT service_FK FOREIGN KEY (depCode) REFERENCES department(depCode)ON DELETE CASCADE);

CREATE TABLE doctor (
docID INT (5) NOT NULL ,
docName VARCHAR(20),
emailAddress VARCHAR(50) UNIQUE ,
salary        INT(5),
gender        CHAR(1) ,
docPhoneNumber INT(10) UNIQUE, 
superDocID     INT(5) ,
depCode        INT (5),
CONSTRAINT doctor_PK PRIMARY KEY (docID),
CONSTRAINT doctor_FK1 FOREIGN KEY (superDocID) REFERENCES doctor(docID)ON DELETE CASCADE,
CONSTRAINT doctor_FK2 FOREIGN KEY (depCode)    REFERENCES department(depCode)ON DELETE CASCADE );

CREATE TABLE certificate_multi (
docID INT (5) NOT NULL,
certificate  VARCHAR(30) NOT NULL,
CONSTRAINT certificate_multi_PK PRIMARY KEY (docID ,certificate),
CONSTRAINT certificate_multi_FK FOREIGN KEY (docID) REFERENCES doctor(docID) ON DELETE CASCADE);

CREATE TABLE patient (
patientID INT(5) NOT NULL ,
pGender   CHAR(1) ,
fName     VARCHAR(8) ,
lName     Varchar(8) ,
payByCash CHAR(1),
payByCredit CHAR(1),
bayByInstallmentspatient CHAR(1) ,
CONSTRAINT patient_PK PRIMARY KEY (patientID) );

CREATE TABLE phoneNum_multi (
patientID INT(5) NOT NULL,
phoneNum  INT(10) NOT NULL,
CONSTRAINT phoneNum_multi_PK PRIMARY KEY (patientID ,phoneNum),
CONSTRAINT phoneNum_multi_FK FOREIGN KEY (patientID) REFERENCES patient(patientID) ON DELETE CASCADE);

CREATE TABLE treats (
docID INT (5) NOT NULL,
patientID INT(5) NOT NULL,
appointmentTime varchar(20),
appointmentDate varchar(20),
CONSTRAINT treats_PK PRIMARY KEY (docID ,patientID),
CONSTRAINT treats_FK1 FOREIGN KEY (docID) REFERENCES doctor(docID) ON DELETE CASCADE ,
CONSTRAINT treats_FK2 FOREIGN KEY (patientID) REFERENCES patient(patientID) ON DELETE CASCADE );

CREATE TABLE choose (
serviceID INT (5) NOT NULL ,
patientID INT(5) NOT NULL,
CONSTRAINT choose_PK PRIMARY KEY (serviceID ,patientID),
CONSTRAINT choose_FK1 FOREIGN KEY (serviceID) REFERENCES service(serviceID) ON DELETE CASCADE ,
CONSTRAINT choose_FK2 FOREIGN KEY (patientID) REFERENCES patient(patientID) ON DELETE CASCADE );

INSERT INTO project.department 
VALUES ( 66532,'Dep_dermatology', 0708893260,'A1' ,2 );
INSERT INTO project.department
VALUES ( 66641,'Dep_laser', 0736789327,'B1' ,3 );
INSERT INTO project.department
VALUES ( 66752,'Dep_skin', 0728739822,'B2' ,4 );
INSERT INTO project.department
VALUES ( 66863,'Dep_peeling',0755679431,'C3',5);
INSERT INTO project.department
VALUES ( 66974,'Dep_teeth', 0744329810,'D4' ,4);
SELECT * 
FROM department ;

insert into project.doctor
values(11234,'Mohammed','moh@gmail.com',9000,'M',01255558,11234,66532);
insert into project.doctor
values(12234,'Fatema','fatema.11@gmail.com',7000,'M',01266669,12234,66641);
insert into project.doctor
values(12334,'Ahmed','Ahd.m@gmail.com',7000,'M',01277771,12334,66752);
insert into project.doctor
values(12344,'Halema','ema.hal@gmail.com',11000,'F',01288882,12344,66863);
insert into project.doctor
values(12345,'safiya','safo.d@gmail.com',8000,'F',01299993,12345,66974);
insert into project.doctor
values(66789,'Khaled','K.haled@gmail.com',5000,'M',01211112,66789,66532);
insert into project.doctor
values(67789,'khadiga','k122.a@gmail.com',12000,'F',01222223,67789,66641);
insert into project.doctor
values(67889,'majed','majed11.d@gmail.com',8000,'M',01233334,67889,66752);
insert into project.doctor
values(67899,'AbdUllah','Adb@gmail.com',9000,'M',01244445,67899,66863);
insert into project.doctor
values(67890,'Sahar','Sahar_090@gmail.com',6000,'F',01255556,67890,66974);
select *
from doctor;

insert into project.patient
values(10101,'M','Omar','hasan','Y','N','N');
insert into project.patient
values(20202,'F','Raghad','Anas','N','Y','N');
insert into project.patient
values(30303,'M','Bashar','Fares','N','N','Y');
insert into project.patient
values(40404,'F','Waad','Youssef','Y','N','N');
insert into project.patient
values(50505,'M','Ahmed','Fahad','N','Y','N');
insert into project.patient
values(60606,'F','Noha','Ibrahim','N','N','Y');
insert into project.patient
values(70707,'M','Faisl','Yazeed','Y','N','N');
insert into project.patient
values(80808,'F','Tala','Ali','N','Y','N');
insert into project.patient
values(90909,'M','Tariq','Rajab','N','N','Y');
insert into project.patient
values(09123,'F','Amjad','Rayan','Y','N','N');
insert into project.patient
values(08456,'M','Maher','Adam','N','Y','N');
insert into project.patient
values(07678,'F','Manal','Sultan','N','N','Y');
insert into project.patient
values(09342,'M','Adel','Alaa','Y','N','N');
insert into project.patient
values(04987,'F','Samer','Saleh','N','Y','N');
insert into project.patient
values(03000,'M','Moayed','Emad','N','N','Y');
select *
from patient;

INSERT INTO project.service 
VALUES ( 11210, 'Back+ShouldersLaser','Laser Hair Removal-Packages',400.00,66641);
INSERT INTO project.service 
VALUES ( 11211, 'Arms+Full LegsLaser','Laser Hair Removal-Packages',350.00,66641);
INSERT INTO project.service
VALUES ( 11212, 'Arms+Half LegsLaser','Laser Hair Removal-Packages',150.00,66641);
INSERT INTO project.service
 VALUES ( 11213, 'Face+NeckLaser','Laser Hair Removal-Packages',100.00,66641);
INSERT INTO project.service
 VALUES ( 11214, 'Full BodyLaser','Laser Hair Removal-Packages',700.00,66641);
INSERT INTO project.service
 VALUES ( 11221, '10 Step-Face','Microdermabrasion',149.00,66752);
INSERT INTO project.service
 VALUES ( 11222, 'FaceNeedling','Micro-Needling',200.00,66752);
INSERT INTO project.service
 VALUES ( 11223, 'NeckNeedling','Micro-Needling',180.00,66752);
INSERT INTO project.service
VALUES ( 11224, 'BreastNeedling','Micro-Needling',220.00,66752);
INSERT INTO project.service
 VALUES ( 11225, 'HandNeedling','Micro-Needling',150.00,66752);
INSERT INTO project.service
 VALUES ( 11226, 'HipsNeedling','Micro-Needling',250.00,66752);
INSERT INTO project.service
 VALUES ( 11227, 'Upper BackNeedling','Micro-Needling',359.00,66752);
INSERT INTO project.service
 VALUES ( 11231, 'Acne Control','Skin-Pakages',599.00,66752);
INSERT INTO project.service
 VALUES ( 11232, 'Advanced Skin','Skin-Pakages',699.00,66752);
INSERT INTO project.service
 VALUES ( 11233, 'Anti-Ageing','Skin-Pakages',800.00,66752);
INSERT INTO project.service
 VALUES ( 11234, 'light Therapy Rejuvenation','Skin-Pakages',1200.00,66752);
INSERT INTO project.service
 VALUES ( 11235, 'Sun Damage Renewal','Skin-Pakages',1500.00,66752);
INSERT INTO project.service
 VALUES ( 11236, 'Cosmelan peel','Depigmentation peels',2500.00,66863);
INSERT INTO project.service
 VALUES ( 11237, 'Dermamelan Intimate','Depigmentation peels',2000.00,66863);
INSERT INTO project.service
 VALUES ( 11241, 'Pigmentation and melasmaTreat','Skin Treatments',3000.00,66532);
INSERT INTO project.service
 VALUES ( 11242, 'ScarsTreat','Skin Treatments',3500.00,66532);
INSERT INTO project.service
 VALUES ( 11243, 'VitiligoTreat','Skin Treatments',4500.00,66532);
INSERT INTO project.service
 VALUES ( 11251, 'Teeth Cleaning Package','Teeth Whitening',200.00,66974);
INSERT INTO project.service
 VALUES ( 11252, 'Laser Teeth Whitening','Teeth Whitening',1500.00,66974);
INSERT INTO project.service
 VALUES ( 11253, 'Polishing','Teeth Whitening',100.00,66974);
INSERT INTO project.service
 VALUES ( 11254, 'Decay removal','Teeth Whitening',299.00,66974);
INSERT INTO project.service
 VALUES ( 11255, 'Gum Pinkening and Gel','Teeth Whitening',2500.00,66974);
INSERT INTO project.service
 VALUES ( 11256, 'Zirconia Crowns','Zirconia',500.00,66974);
INSERT INTO project.service
 VALUES ( 11257, 'American Braces Backages','Braces',1700.00,66974);
INSERT INTO project.service
 VALUES ( 11258, 'Panoramic X-Ray Picture','X-Ray',300.00,66974);
INSERT INTO project.service
 VALUES ( 11259, 'Dental Diamond Installation','Installation',99.00,66974);
SELECT *
FROM service;

INSERT INTO project.certificate_multi 
VALUES ( 11234,'Medical Writing');
INSERT INTO project.certificate_multi 
VALUES ( 11234,'Massage Therapy');
INSERT INTO project.certificate_multi 
VALUES ( 12234,'Emergency Medical Technology');
INSERT INTO project.certificate_multi 
VALUES ( 12234,'Dental Technician');
INSERT INTO project.certificate_multi 
VALUES ( 12334,'Medical Laboratory Technician');
INSERT INTO project.certificate_multi 
VALUES ( 12334,'X-Ray Technician');
INSERT INTO project.certificate_multi 
VALUES ( 12344,'Pharmacy Technology');
INSERT INTO project.certificate_multi 
VALUES ( 12344,'General Surgery');
INSERT INTO project.certificate_multi 
VALUES ( 12345,'Anesthesiologist');
INSERT INTO project.certificate_multi 
 VALUES ( 12345,'Geriatrician');
INSERT INTO project.certificate_multi 
VALUES ( 66789,'Radiologist');
INSERT INTO project.certificate_multi 
VALUES ( 66789,'Dental Technician');
INSERT INTO project.certificate_multi 
VALUES ( 67789,'Cutaneous Lymphoma');
INSERT INTO project.certificate_multi 
VALUES ( 67789,'Medical Dermatology');
INSERT INTO project.certificate_multi 
VALUES ( 67889,'Biomedical Engineering');
INSERT INTO project.certificate_multi 
VALUES ( 67889,'Antyomy and Histology');
INSERT INTO project.certificate_multi 
VALUES ( 67899,'Genetics');
INSERT INTO project.certificate_multi  
VALUES ( 67899,'Cosmetic Surgery');
INSERT INTO project.certificate_multi 
VALUES ( 67890,'Reconstructive Surgery');
INSERT INTO project.certificate_multi 
VALUES ( 67890,'Cosmetic Dermatology');
SELECT *
FROM certificate_multi;

INSERT INTO project.phoneNum_multi 
VALUES ( 10101,0598432180);
INSERT INTO project.phoneNum_multi 
 VALUES ( 10101,0593299641);
INSERT INTO project.phoneNum_multi 
VALUES ( 20202,0579643219);
INSERT INTO project.phoneNum_multi  
VALUES ( 20202,0588329510);
INSERT INTO project.phoneNum_multi  
VALUES ( 30303,0673297410);
INSERT INTO project.phoneNum_multi  
VALUES ( 40404,0539487218);
INSERT INTO project.phoneNum_multi  
VALUES ( 40404,0582270541);
INSERT INTO project.phoneNum_multi 
VALUES ( 50505,0593287105);
INSERT INTO project.phoneNum_multi  
VALUES ( 60606,0583981759);
INSERT INTO project.phoneNum_multi  
VALUES ( 70707,0529639268);
INSERT INTO project.phoneNum_multi  
VALUES ( 70707,0553297841);
INSERT INTO project.phoneNum_multi 
VALUES ( 80808,0589438102);
INSERT INTO project.phoneNum_multi  
VALUES ( 80808,0521009625);
INSERT INTO project.phoneNum_multi  
VALUES ( 90909,0583791059);
INSERT INTO project.phoneNum_multi  
VALUES ( 09123,0593286410);
INSERT INTO project.phoneNum_multi 
VALUES ( 08456,0542197540);
INSERT INTO project.phoneNum_multi 
VALUES ( 08456,0566821064);
INSERT INTO project.phoneNum_multi  
VALUES ( 07678,0584107491);
INSERT INTO project.phoneNum_multi  
VALUES ( 09342,0584891065);
INSERT INTO project.phoneNum_multi  
VALUES ( 04987,0549710591);
INSERT INTO project.phoneNum_multi  
VALUES ( 04987,0543981062);
INSERT INTO project.phoneNum_multi  
VALUES ( 03000,0591052910);
SELECT *
FROM phoneNum_multi;

insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(11234,30303,STR_TO_DATE('30-10-2022', '%d-%m-%Y'),'16:30');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(11234,50505,STR_TO_DATE('30-10-2022', '%d-%m-%Y'),'20:00');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(12234,20202,STR_TO_DATE('30-10-2022', '%d-%m-%Y'),'11:00');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(12344,20202,STR_TO_DATE('30-10-2022', '%d-%m-%Y'),'17:30');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(12345,60606,STR_TO_DATE('2-11-2022', '%d-%m-%Y'),'10:30');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(12345,03000,STR_TO_DATE('2-11-2022', '%d-%m-%Y'),'12:15');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(12345,40404,STR_TO_DATE('2-11-2022', '%d-%m-%Y'),'14:30');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(67789,90909,STR_TO_DATE('2-11-2022', '%d-%m-%Y'),'12:00');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(12234,08456,STR_TO_DATE('2-11-2022', '%d-%m-%Y'),'16:00');
insert into project.treats  (docID ,patientID ,appointmentDate,appointmentTime)
values(12345,80808,STR_TO_DATE('5-11-2022', '%d-%m-%Y'),'19:00');
insert into project.treats  (docID ,patientID ,appointmentDate,appointmentTime)
values(67889,07678,STR_TO_DATE('5-11-2022', '%d-%m-%Y'),'22:30');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(66789,80808,STR_TO_DATE('8-11-2022', '%d-%m-%Y'),'15:30');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(67789,09123,STR_TO_DATE('8-11-2022', '%d-%m-%Y'),'15:30');
insert into project.treats  (docID ,patientID ,appointmentDate,appointmentTime)
values(67889,10101,STR_TO_DATE('8-11-2022', '%d-%m-%Y'),'11:15');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(67899,09342,STR_TO_DATE('9-11-2022', '%d-%m-%Y'),'11:00');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(67899,04987,STR_TO_DATE('9-11-2022', '%d-%m-%Y'),'13:00');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(12334,10101,STR_TO_DATE('9-11-2022', '%d-%m-%Y'),'17:30');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(12344,70707,STR_TO_DATE('9-11-2022', '%d-%m-%Y'),'10:30');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(67890,03000,STR_TO_DATE('12-11-2022', '%d-%m-%Y'),'20:30');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(66789,60606,STR_TO_DATE('12-11-2022', '%d-%m-%Y'),'13:00');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(67890,10101,STR_TO_DATE('12-11-2022', '%d-%m-%Y'),'16:00');
insert into project.treats (docID ,patientID ,appointmentDate,appointmentTime)
values(12334,90909,STR_TO_DATE('12-11-2022', '%d-%m-%Y'),'10:00');
select *
from treats;

INSERT INTO project.choose 
VALUES ( 11210,40404);
INSERT INTO project.choose 
VALUES ( 11211,30303);
INSERT INTO project.choose
 VALUES ( 11212,50505);
INSERT INTO project.choose
 VALUES ( 11213,60606);
INSERT INTO project.choose
 VALUES ( 11214,20202);
INSERT INTO project.choose
 VALUES ( 11221,09123);
INSERT INTO project.choose
 VALUES ( 11222,50505);
INSERT INTO project.choose
 VALUES ( 11223,07678);
INSERT INTO project.choose
 VALUES ( 11224,80808);
INSERT INTO project.choose
 VALUES ( 11225,09342);
INSERT INTO project.choose
 VALUES ( 11226,08456);
INSERT INTO project.choose
 VALUES ( 11227,70707);
INSERT INTO project.choose
 VALUES ( 11231,10101);
INSERT INTO project.choose
 VALUES ( 11232,03000);
INSERT INTO project.choose
 VALUES ( 11233,90909);
INSERT INTO project.choose
 VALUES ( 11214,70707);
INSERT INTO project.choose
 VALUES ( 11214,09123);
INSERT INTO project.choose
 VALUES ( 11226,30303);
INSERT INTO project.choose
 VALUES ( 11237,04987);
INSERT INTO project.choose
 VALUES ( 11241,03000);
INSERT INTO project.choose
 VALUES ( 11222,09342);
INSERT INTO project.choose
 VALUES ( 11243,09342);
INSERT INTO project.choose
 VALUES ( 11243,90909);
INSERT INTO project.choose
 VALUES ( 11243,08456);
INSERT INTO project.choose
 VALUES ( 11243 ,40404);
INSERT INTO project.choose
 VALUES ( 11253,10101);
INSERT INTO project.choose
 VALUES ( 11254,07678);
INSERT INTO project.choose
 VALUES ( 11225,30303);
INSERT INTO project.choose
 VALUES ( 11257,09342);
SELECT *
FROM choose;

update doctor
set emailAddress ='Moh_al@gmail.com'
where docName='Mohammed';

select *
from doctor;

DELETE from doctor
WHERE  docID = 66789;

select *
from doctor;

SELECT depCode, COUNT(docID) AS count, SUM(gender='M')
 AS male,SUM(gender='F') AS female
FROM   doctor
GROUP BY depCode
ORDER BY  depCode;

SELECT  depName , d.depCode , flor , docName , docId , salary  
FROM department d , doctor c
WHERE d.depCode = c.depCode
ORDER BY docID , salary DESC;

SELECT serviceID, COUNT(patientID) AS count
FROM   choose
GROUP BY serviceID
HAVING   COUNT(patientID)>2
ORDER BY  serviceID;

SELECT t.docID,docName,t.patientID,fName,
appointmentTime,appointmentDate
FROM treats t,doctor d,patient p 
WHERE t.docID = d.docID AND t.patientID=p.patientID ;

SELECT * 
FROM department 
WHERE depCode IN ( SELECT depCode 
        FROM service 
                WHERE serviceCost BETWEEN 500 AND 900 );
                
SELECT serviceName , serviceType , serviceCost
FROM service 
WHERE serviceCost < (SELECT AVG(serviceCost) FROM service)
ORDER BY serviceCost ;

SELECT docId , COUNT(patientId) 
AS numberOfPatient 
FROM treats
GROUP BY docID;

SELECT docID, salary
FROM   doctor
ORDER BY 2 ASC;

SELECT salary,docID
FROM doctor
WHERE salary BETWEEN 5000 AND 8000;


select patientID ,count(serviceID)AS numberOfServices
from choose
group by patientID
having count(serviceID)>1;
