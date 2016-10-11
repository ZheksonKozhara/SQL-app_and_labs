USE Accounts_Department;

INSERT INTO TYPEDepartment(TYPEDepartment_name) VALUES('FinancialDepartment');
INSERT INTO TYPEDepartment(TYPEDepartment_name) VALUES('EconomicsDepartment');
INSERT INTO TYPEDepartment(TYPEDepartment_name) VALUES('PoliticalDepartment');
INSERT INTO TYPEDepartment(TYPEDepartment_name) VALUES('AdministrativeDepartment');
INSERT INTO TYPEDepartment(TYPEDepartment_name) VALUES('LegalDepartment');
INSERT INTO TYPEDepartment(TYPEDepartment_name) VALUES('HealthDepartment');
INSERT INTO TYPEDepartment(TYPEDepartment_name) VALUES('SportsDepartment');
INSERT INTO TYPEDepartment(TYPEDepartment_name) VALUES('ForeignDepartment');
INSERT INTO TYPEDepartment(TYPEDepartment_name) VALUES('ArmyDepartment');
INSERT INTO TYPEDepartment(TYPEDepartment_name) VALUES('PoliceDepartment');

INSERT INTO Department(Department_name,TYPEDepartment_id,NumberOfPersons) VALUES('Euro','1','8');
INSERT INTO Department(Department_name,TYPEDepartment_id,NumberOfPersons) VALUES('Dollar','4','4');
INSERT INTO Department(Department_name,TYPEDepartment_id,NumberOfPersons) VALUES('Iena','2','5');
INSERT INTO Department(Department_name,TYPEDepartment_id,NumberOfPersons) VALUES('Rub','7','8');
INSERT INTO Department(Department_name,TYPEDepartment_id,NumberOfPersons) VALUES('Uah','8','4');
INSERT INTO Department(Department_name,TYPEDepartment_id,NumberOfPersons) VALUES('uan','3','7');
INSERT INTO Department(Department_name,TYPEDepartment_id,NumberOfPersons) VALUES('Frank','5','4');
INSERT INTO Department(Department_name,TYPEDepartment_id,NumberOfPersons) VALUES('Pound','9','8');
INSERT INTO Department(Department_name,TYPEDepartment_id,NumberOfPersons) VALUES('Rupiu','10','4');
INSERT INTO Department(Department_name,TYPEDepartment_id,NumberOfPersons) VALUES('Lev','6','8');




INSERT INTO ResponsiblePerson(ResponsiblePerson_Surname,ResponsiblePerson_Firstname,ResponsiblePerson_Secondname,Department_id ) VALUES('Artemenko','Valeriy','Vladilenovich','6');
INSERT INTO ResponsiblePerson(ResponsiblePerson_Surname,ResponsiblePerson_Firstname,ResponsiblePerson_Secondname,Department_id ) VALUES('Zatsepin','Olexiy','Dmitrovich','1');
INSERT INTO ResponsiblePerson(ResponsiblePerson_Surname,ResponsiblePerson_Firstname,ResponsiblePerson_Secondname,Department_id ) VALUES('Konorev','Olexand','Artemovich','8');
INSERT INTO ResponsiblePerson(ResponsiblePerson_Surname,ResponsiblePerson_Firstname,ResponsiblePerson_Secondname,Department_id ) VALUES('Berinda','Alex','Andreevich','2');
INSERT INTO ResponsiblePerson(ResponsiblePerson_Surname,ResponsiblePerson_Firstname,ResponsiblePerson_Secondname,Department_id ) VALUES('Alloghko','Valeriy','Dmitrovich','5');
INSERT INTO ResponsiblePerson(ResponsiblePerson_Surname,ResponsiblePerson_Firstname,ResponsiblePerson_Secondname,Department_id ) VALUES('Martynenko','Valeriy','Dmitrovich','7');
INSERT INTO ResponsiblePerson(ResponsiblePerson_Surname,ResponsiblePerson_Firstname,ResponsiblePerson_Secondname,Department_id ) VALUES('Errera','Ander','Vasilievich','3');
INSERT INTO ResponsiblePerson(ResponsiblePerson_Surname,ResponsiblePerson_Firstname,ResponsiblePerson_Secondname,Department_id ) VALUES('Dronov','Valeriy','Solomonovich','9');
INSERT INTO ResponsiblePerson(ResponsiblePerson_Surname,ResponsiblePerson_Firstname,ResponsiblePerson_Secondname,Department_id ) VALUES('Schmatko','Andrey','Dmitrovich','4');
INSERT INTO ResponsiblePerson(ResponsiblePerson_Surname,ResponsiblePerson_Firstname,ResponsiblePerson_Secondname,Department_id ) VALUES('Gurnov','Valeriy','Sergiyovich','10');



INSERT INTO Equipment(Equipment_name,Cost,Ostatok_cost,ResponsiblePerson_id) VALUES('TV','1000','500','5');
INSERT INTO Equipment(Equipment_name,Cost,Ostatok_cost,ResponsiblePerson_id) VALUES('Bad','5000','1500','7');
INSERT INTO Equipment(Equipment_name,Cost,Ostatok_cost,ResponsiblePerson_id) VALUES('Phone','5000','1300','5');
INSERT INTO Equipment(Equipment_name,Cost,Ostatok_cost,ResponsiblePerson_id) VALUES('Car','14400','5500','2');
INSERT INTO Equipment(Equipment_name,Cost,Ostatok_cost,ResponsiblePerson_id) VALUES('Tablet','2000','500','6');
INSERT INTO Equipment(Equipment_name,Cost,Ostatok_cost,ResponsiblePerson_id) VALUES('Bag','670','600','4');
INSERT INTO Equipment(Equipment_name,Cost,Ostatok_cost,ResponsiblePerson_id) VALUES('Potatoes','1000','500','1');
INSERT INTO Equipment(Equipment_name,Cost,Ostatok_cost,ResponsiblePerson_id) VALUES('Toy','1000','500','6');
INSERT INTO Equipment(Equipment_name,Cost,Ostatok_cost,ResponsiblePerson_id) VALUES('Laptop','4000','550','7');
INSERT INTO Equipment(Equipment_name,Cost,Ostatok_cost,ResponsiblePerson_id) VALUES('HomeTheater','8700','3500','6');