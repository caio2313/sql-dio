#Número de empregados por departamento e localidade
create view vw_emp_dep_loc as 
select count(e.Fname) as quant, p.Dlocation
from employee as e join departament as d on e.Ssn = d.Essn
					join dept_location as p on d.Dnumber = p.Dnumber
group by d.Dnumber;

#Lista de departamentos e seus gerentes
create view vw_dep_ger as
select d.Dname, concat(e.Lname, e.Fname) as fullName
from departament as d join employee as e on d.Ssn = e.Mgr_Ssn
where d.Mgr_Ssn = e.Ssn;

#Projetos com maior número de empregados
select count(w.Essn) as num_emp_prj
from employee as e join works_on as w on e.Ssn = w.Essn
                   join project as p on w.Pro = p.Pnumber
order by num_emp_prj DESC;

#Lista de projetos, departamentos e gerentes
select p.Pname, d.Dname, concat(e.Fname, e.Lname) as fullName
from employee as e join works_on as w on e.Ssn = w.Essn
                   join project as p on w.Pro = p.Pnumber
                   join departament as d on d.Mgr_Ssn = e.Ssn
group by fullName
having e.Ssn = d.Mgr_Ssn;

#Quais empregados possuem dependentes e se são gerentes
select concat(e.Fname, e.Lname) as fullName
from employee as e join departament as d on e.Ssn = d.Mgr_Ssn
where e.Ssn = d.Mgr_Ssn;

#Code2
delimiter //
create trigger tr_del_user before delete on clients
for each row
begin
declare t_fName varchar(14);
declare t_Adress varchar(60);
declare t_CPF varchar(13);
declare t_lName varchar(14);

set t_fName = clients.fName;
set t_Adress = clients.Adress;
set t_CPF = clients.CPF;
set t_lName = clients.lName;

end //
delimiter ;

#Code3
insert into employee (Fname, Mint, Lname, Bdate, Address, Sex, Salary) values(
'Samuel', 'SS', 'Silva', '24-08-78', 'Clever st, 146', 'M', '2350.00'
'Albert', 'AM', 'Malachias', '22-02-68', 'Hidden st, 133', 'M', '3800.00'
'Esther', 'EY', 'Yolanda', '04-03-1980', 'Agile st, 22', 'F', '2100.00'
);




