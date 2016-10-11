USE Accounts_Department;

CREATE TABLE TYPEDepartment
    (TYPEDepartment_id INT IDENTITY 
	CONSTRAINT TYPEDepartmentPrimary PRIMARY KEY,
	TYPEDepartment_name VARCHAR(40) NOT NULL
	);

CREATE TABLE Department
    (Department_id INT IDENTITY 
	CONSTRAINT DepartmentPrimary PRIMARY KEY,
	Department_name VARCHAR(40) NOT NULL,

	TYPEDepartment_id INT,
	CONSTRAINT DepartmentTYPEDepartmentForeign FOREIGN KEY (TYPEDepartment_id) REFERENCES TYPEDepartment,
	NumberOfPersons INT 
	CONSTRAINT NumberOfPersonsCheck CHECK(NumberOfPersons BETWEEN 0 AND 10)
	);

CREATE TABLE ResponsiblePerson
    (ResponsiblePerson_id INT IDENTITY 
	CONSTRAINT ResponsiblePersonPrimary PRIMARY KEY,
	ResponsiblePerson_Surname VARCHAR(40) NOT NULL,
	ResponsiblePerson_Firstname VARCHAR(40) NOT NULL,
	ResponsiblePerson_Secondname VARCHAR(40) NOT NULL,
	Department_id INT,
	CONSTRAINT ResponsiblePersonDepartmentForeign FOREIGN KEY (Department_id) REFERENCES Department
	);

CREATE TABLE Equipment
    (Equipment_id INT IDENTITY 
	CONSTRAINT EquipmentPrimary PRIMARY KEY,
	Equipment_name VARCHAR(40) NOT NULL,
	Cost DECIMAL NOT NULL
	CONSTRAINT CostCheck CHECK(Cost>0),
	Ostatok_cost DECIMAL NOT NULL
	CONSTRAINT Ostatok_costCheck CHECK(Ostatok_cost>0),
	ResponsiblePerson_id INT,
	CONSTRAINT EquipmentResponsiblePersonForeign FOREIGN KEY (ResponsiblePerson_id) REFERENCES ResponsiblePerson,
	CONSTRAINT Ostatok_costCostCheck CHECK(Ostatok_cost<Cost),
	);


	

