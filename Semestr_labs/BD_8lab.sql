
USE Accounts_Department
GO
CREATE TRIGGER Tr1
ON ResponsiblePerson
FOR DELETE
AS
IF EXISTS (SELECT 'TRUE'
         FROM ResponsiblePerson RP, Equipment EQ, deleted D
		 WHERE EQ.ResponsiblePerson_id=RP.ResponsiblePerson_id AND RP.ResponsiblePerson_id=D.ResponsiblePerson_id)
		 BEGIN 
		 RAISERROR('Changes are forbiden',16,1) 
		 ROLLBACK TRAN
		 END
		 


USE Accounts_Department
GO
CREATE VIEW ExpensiveEquipment
AS
SELECT Equipment_name,Department_name
FROM Equipment,Department,ResponsiblePerson
WHERE Equipment.ResponsiblePerson_id=ResponsiblePerson.ResponsiblePerson_id AND ResponsiblePerson.Department_id=Department.Department_id AND Equipment.Cost>10000
SELECT * FROM ExpensiveEquipment;




USE Accounts_Department;
GO
CREATE TRIGGER UpdateView ON ExpensiveEquipment
INSTEAD OF INSERT
AS
DECLARE
@Equipment_name VARCHAR(40)
SET @Equipment_name = (SELECT Equipment_name FROM INSERTED)
IF NOT EXISTS (SELECT 'TRUE' FROM Equipment WHERE @Equipment_name=Equipment.Equipment_name)
BEGIN
INSERT INTO Equipment(Equipment_name, Cost, Ostatok_cost, ResponsiblePerson_id)
VALUES(@Equipment_name,12000,3500,5);
END
GO

INSERT INTO ExpensiveEquipment(Equipment_name) VALUES('auto');
SELECT * FROM ExpensiveEquipment;

 
