--Schema(A schema is a structured through which by all the table, views ,stored procedure is defined in database.
--to create schema we follow data definition and data control language.

create schema SECURE_AUDIT authorization dbo

create table EMP_AUDIT (sid_emp int not null)

--Assigning users ,for this first assign users

grant select on SCHEMA :: SECURE_AUDIT to star_audit
deny select on SCHEMA :: SECURE_AUDIT to buisness_user

--finding lenght of a particular columns.
select
emp_no,
len(last_name) as lenghtofName
from
Employees



--USING LEFT FUNCTION.
select
first_name,
last_name,
left(first_name,1) as Initial,
left(first_name,1) +'.' + last_name as shortname
from
Employees

--postion of a character in a column 
select
*
from 
Current_Personnel
where 
CHARINDEX('N.',current_location)>0



select
emp_no,
current_location,
REPLACE(current_location,'N.','North') as Updatedname
from 
Current_Personnel
where 
CHARINDEX('N.',current_location)>0

--loop function
declare @counter int =1

while @counter <=25
begin
print @counter 

set @counter=@counter+1

end

--creating table using loop
declare @tdate table(week_no int,week_date date)
declare @num int=1
declare @first date='2020-12-31'

while @num>-1
begin
insert into @tdate(week_no,week_date)
select
@num,
dateadd(wk,@num,@first)

set @num=@num+1
if @num >52 BREAK
end;

select * from @tdate;

--UNIONS(filters the duplicate value)
select * from Departments
union
select * from Departments

--UNIONS all(return the duplicate value)
select * from Departments
union all 
select * from Departments

--improving Query 
--performance of query get slow may be beacuse of the 
--data is very large
--design of the databsae
--buisness server is slow


--INDEX

select 
count(distinct sid_Employee) as emp_pay
from 
Payroll.Employee_Payroll
where
Pay_Date='2019-07-15'


