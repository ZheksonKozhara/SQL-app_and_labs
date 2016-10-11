USE Accounts_Department;

select Department.Department_name, Department.NumberOfPersons FROM Department
Where NumberOfPersons>(SELECT AVG(NumberOfPersons) FROM Department);  

select Department.Department_name, Department.NumberOfPersons FROM Department
Where NumberOfPersons=(SELECT MIN(NumberOfPersons) FROM Department); 


SELECT TYPEDepartment.TYPEDepartment_name,sum(Department.NumberOfPersons) as Numero FROM TYPEDepartment,Department
WHERE TYPEDepartment.TYPEDepartment_id=Department.TYPEDepartment_id
GROUP BY TYPEDepartment.TYPEDepartment_name
Having sum(NumberOfPersons)>=ALL(
SELECT sum(Department.NumberOfPersons) FROM TYPEDepartment,Department
WHERE TYPEDepartment.TYPEDepartment_id=Department.TYPEDepartment_id
GROUP BY TYPEDepartment.TYPEDepartment_name);




/* Выбрать департамент, у которого максимальный износ оборудования */
SELECT Department.Department_name, SUM(Equipment.Cost-Equipment.Ostatok_cost) AS Iznos FROM Department,ResponsiblePerson,Equipment
WHERE Department.Department_id=ResponsiblePerson.Department_id AND
ResponsiblePerson.ResponsiblePerson_id=Equipment.ResponsiblePerson_id
GROUP BY Department.Department_name
Having SUM(Equipment.Cost-Equipment.Ostatok_cost)>=ALL(
SELECT  SUM(Equipment.Cost-Equipment.Ostatok_cost) FROM Department,ResponsiblePerson,Equipment
WHERE Department.Department_id=ResponsiblePerson.Department_id AND
ResponsiblePerson.ResponsiblePerson_id=Equipment.ResponsiblePerson_id
GROUP BY Department.Department_name);



 
