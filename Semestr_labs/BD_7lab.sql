/*  Процедура, що повертає середню вартість обладнання в зазначеному підрозділі  */

USE Accounts_Department
GO
CREATE PROC AVGCOST_For_Dep
@Department_name VARCHAR(40) OUTPUT
AS
SELECT Department.Department_name, AVG(Equipment.Cost) AS AvgCost FROM Equipment,ResponsiblePerson,Department 
WHERE ResponsiblePerson.ResponsiblePerson_id=Equipment.ResponsiblePerson_id
AND ResponsiblePerson.Department_id=Department.Department_id
AND Department.Department_name=@Department_name
GROUP BY Department_name;   


USE Accounts_Department;
EXEC AVGCOST_For_Dep 'Pound';  


USE Accounts_Department
GO
CREATE PROCEDURE Change10
@Surname VARCHAR(40) OUTPUT
AS
IF EXISTS (SELECT 'TRUE'
	FROM ResponsiblePerson INNER JOIN (SELECT Equipment.ResponsiblePerson_id, COUNT(Equipment.Equipment_id) CofEQ
												FROM Equipment 
												GROUP BY ResponsiblePerson_id) CEQ
	ON ResponsiblePerson.ResponsiblePerson_id = CEQ.ResponsiblePerson_id
	WHERE CofEQ < 100)
UPDATE ResponsiblePerson
SET ResponsiblePerson_Surname=@Surname

ELSE BEGIN
RAISERROR ('Forbiden',16,1)
END







CREATE PROCEDURE NewChange7
@ID INT OUTPUT,
@Change_surname VARCHAR(50) OUTPUT
AS
IF EXISTS (SELECT 'TRUE' FROM ResponsiblePerson, Equipment WHERE @ID=Equipment.ResponsiblePerson_id)
UPDATE ResponsiblePerson
SET ResponsiblePerson_Surname=@Change_surname
WHERE @ID=ResponsiblePerson_id

ELSE BEGIN
RAISERROR ('Rename is forbiden!',16,1)
END

  
USE Accounts_Department;
EXEC NewChange7 6, 'Sendiro';  





