USE Accounts_Department;


SELECT Equipment.Equipment_name, ResponsiblePerson.ResponsiblePerson_Surname, ResponsiblePerson_Firstname, ResponsiblePerson_Secondname FROM Equipment, ResponsiblePerson
WHERE Equipment.ResponsiblePerson_id=ResponsiblePerson.ResponsiblePerson_id;


SELECT Equipment.Equipment_name,Department.Department_name FROM Equipment,ResponsiblePerson,Department 
WHERE ResponsiblePerson.ResponsiblePerson_id=Equipment.ResponsiblePerson_id AND
Department.Department_id=ResponsiblePerson.Department_id;  



SELECT Department.Department_name,SUM(Equipment.Cost) AS summa FROM Equipment,ResponsiblePerson,Department 
WHERE ResponsiblePerson.ResponsiblePerson_id=Equipment.ResponsiblePerson_id
AND ResponsiblePerson.Department_id=Department.Department_id
GROUP BY Department_name;

