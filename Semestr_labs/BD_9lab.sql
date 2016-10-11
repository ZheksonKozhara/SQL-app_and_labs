

BACKUP DATABASE Accounts_Department
TO DISK='C:\Backups\AccountsDepartment.bak'
WITH INIT

INSERT INTO Equipment(Equipment_name,Cost,Ostatok_cost) Values('abba',1000,500)
INSERT INTO Equipment(Equipment_name,Cost,Ostatok_cost) Values('enna',1000,500)


BACKUP DATABASE Accounts_Department
TO DISK='C:\Backups\AccountsDepartment.bak'
WITH DIFFERENTIAL

INSERT INTO Equipment(Equipment_name,Cost,Ostatok_cost) Values('kolla',1000,500)
INSERT INTO Equipment(Equipment_name,Cost,Ostatok_cost) Values('dihha',1000,500)

DROP DATABASE Accounts_Department

RESTORE DATABASE Accounts_Department
FROM DISK='C:\Backups\AccountsDepartment.bak'
WITH NORECOVERY, FILE=1

RESTORE DATABASE Accounts_Department
FROM DISK='C:\Backups\AccountsDepartment.bak'
WITH FILE=2, RECOVERY
