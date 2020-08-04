create database logfile;
use logfile;
create table logfile(
creationDate VARCHAR(1000),
userName VARCHAR(1000),
actionCrudType VARCHAR(1000),
actionVerb VARCHAR(1000),
actionObject VARCHAR(1000),
parentResName VARCHAR(1000),
targetResName VARCHAR(1000)
);
show tables;
desc logfile; 
SET GLOBAL local_infile='ON';
LOAD DATA LOCAL INFILE "C:\\Users\\Joyee\\Desktop\\new logfile\\course_static_logfile.csv" 
INTO TABLE logfile
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
IgNORE 1 LINES
(creationDate, userName, actionCrudType, actionVerb, actionObject, parentResName, targetResName);
SET userName = NULLIF(@vuserName,'');
select *from logfile;
select targetResName from logfile;
select targetResName, count(targetResName) as total from logfile group by targetResName;
select DATE(creationDate) as accessing_Date, targetResName, COUNT(targetResName) as access
from logfile group by targetResName, DATE(creationDate)
order by accessing_date;






