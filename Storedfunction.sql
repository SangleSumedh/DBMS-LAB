create database Score; 
use Score; 
create table stud_marks(name varchar(20),total_marks int(5)); 
create table Result(roll_no int(3) primary key,name varchar(20),class varchar(20)); 
insert into stud_marks values('Suresh',995); 
insert into stud_marks values('Harish',865); 
insert into stud_marks values('Samart',920); 
insert into stud_marks values('Mohan',1000); 
insert into stud_marks values('Soham',745); 
select * from stud_marks; 
insert into Result(roll_no,Name) values(1,'Suresh'); 
insert into Result(roll_no,Name) values(2,'Harish'); 
insert into Result(roll_no,Name) values(3,'Samart'); 
insert into Result(roll_no,Name) values(4,'Mohan'); 
insert into Result(roll_no,Name) values(5,'Soham'); 
select * from Result; 
delimiter // 
create procedure proc_Grade(in r int(2),out grade char(25)) 
begin 
declare m int(4); 
select total_marks into m from stud_marks where name=(select name from Result where roll_no=r); 
if m>=990 and m<=1500 then 
select 'Distinction' into grade; 
update Result set Class='Distinction' where Roll_no=r; 
elseif m>=900 and m<=989 then 
select 'FirstClass' into grade; 
update Result set Class='FirstClass' where Roll_no=r; 
elseif m>=825 and m<=899 then 
select 'SecondClass' into grade; 
update Result set Class='SecondClass' where Roll_no=r; 
else 
select '--' into grade; 
update Result set Class='--' where Roll_no=r; 
end if; 
end // 
delimiter // 
create function func_Grade(r int(2)) 
returns varchar(25) 
deterministic 
begin 
declare grade varchar(25); 
call proc_Grade(r,grade); 
return grade; 
end // 
select func_Grade(1); // 
select func_Grade(2); // 
select func_Grade(3); // 
select func_Grade(4); // 
select func_Grade(5); // 
select * from Result; // 