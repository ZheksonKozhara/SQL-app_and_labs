USE Accounts_Department;



ALTER TABLE Department
	NOCHECK CONSTRAINT NumberOfPersonsCheck;  
INSERT INTO Department(Department_name,NumberOfPersons)   
	VALUES('MoneyDepartment','12');
SELECT * FROM Department;  

ALTER TABLE Department WITH CHECK
    CHECK CONSTRAINT NumberOfPersonsCheck;

 

DELETE FROM Department WHERE NumberOfPersons>10;  

ALTER TABLE Department WITH CHECK 
	CHECK CONSTRAINT  NumberOfPersonsCheck; 
INSERT INTO Department(Department_name,NumberOfPersons)   
	VALUES('MoneyDepartment','8');
SELECT * FROM Department;  


ALTER TABLE Equipment
	ADD Single VARCHAR(3)
	CONSTRAINT EquipmentDefault DEFAULT 'так'; 
ALTER Table Equipment
		DROP CONSTRAINT EquipmentDefault, COLUMN Single; 
EXEC SP_RENAME Equipment, Furniture; 
EXEC SP_RENAME Furniture, Equipment;



DELETE FROM Department WHERE Department_id=2; 
SELECT * FROM TYPEDepartment; 


