select * from emp;
select * from dept;
select * from BONUS;
select * from SALGRADE;

-- preliminary sql practice !!!

select count(*) from emp;
select distinct(deptno) from emp;
select count(distinct(deptno)) from emp;

select * from emp where job ='SALESMAN';

select job,count(*) from emp group by job;

select * from emp order by sal;

select e.ename,e.job,d.dname from emp e, dept d 
where e.deptno = d.deptno;

select e.ename,e.job,d.dname from emp e LEFT JOIN dept d on e.deptno = d.deptno;


-----


-- Actual SQL practice questions !!

-- 1. Display the dept information from department table
select * from dept;

-- 2. Display the details of all employees
select * from emp;

-- 3.  Display the name and job for all employees
select ename, job from emp;

-- 4.  Display name and salary for all employees
select ename,sal from emp;

-- 5. Display employee number and total salary for each employee
select empno,sal from emp;
select empno,sal+nvl(comm,0) from emp;

-- 6. Display employee name and annual salary for all employees
select ename,sal from emp;

-- 7. Display the names of all employees who are working in department number 10
select ename from emp where deptno = 10;

-- 8. Display the names of all employees working as clerks and drawing a salary more than          3000
select ename from emp where job = 'CLERK' and sal > 3000;

-- 9.  Display employee number and names for employees who earn commission
select empno,ename from emp where comm is not null;
select empno,ename from emp where comm is null;

-- 10. Display names of employees who do not earn any commission
select ename from emp where comm is null;

-- 11. Display the names of employees who are working as clerk , salesman or analyst and drawing a salary more than 2500
select ename from emp where job in ('CLERK','SALESMAN','ANALYST') and sal > 2500;

-- 12. Display the names of employees who are working in the company for the past 5 years
select ename from emp where (sysdate-hiredate)> ( 365*5);
select ename from emp where extract(year from hiredate)<=2013;

select extract(month from sysdate) from dual;
select extract(year from sysdate) from dual;
select extract(day from sysdate) from dual;



-- 13. Display the list of employees who have joined the company before 30th june 80 or after 31 st dec 80
select ename from emp where hiredate < to_date('30-06-1980','dd-mm-yyyy') or hiredate > to_date('31-12-1980','dd-mm-yyyy');

-- 14. Display current date
select sysdate from dual;

-- 15. Display the list of users in your database (using log table)
select * from all_users;

-- 16. Display the names of all tables from the current user
select table_name from all_tables where owner=(select user from dual);

-- 17. Display the name of the current user
select user from dual;

-- 18. Display the names of employees working in department number 10 or 20 or 40 or em employees working as clerks , salesman or analyst
select ename from emp where deptno in (10,20,40) or job in ('CLIENT','SALESMAN','ANALYST');

-- 19. Display the names of employees whose name starts with alphabet S
select ename from emp where ename like 'S%';

-- 20. Display employee name from employees whose name ends with alphabet S
select ename from emp where ename like '%S';

-- 21. Display the names of employees whose names have sencond alphabet A in their names
select ename from emp where ename like '_A%';

-- 22.Display the names of employees whose name is exactly five characters in length
select ename from emp where length(ename) = 5;

-- 23.Display the names of employees who are not working as managers
select ename from emp where job != 'MANAGER';

-- 24.Display the names of employees who are not working as SALESMAN or CLERK or ANALYST
select ename from emp where job not in ('SALESMAN','CLERK','ANALYST');

-- 25.Display all rows from emp table. The system should wait after every screen full of information
select * from emp;

-- 26.Display the total number of employees working in the company
select count(*) from emp;

-- 27.Display the total salary and total commission to all employees
select ename,sal,nvl(comm,0) from emp;

-- 28.Display the maximum salary from emp table
select max(sal) from emp;

-- 29.Display the minimum salary from emp table
select min(sal) from emp;

-- 30.Display the average salary from emp table
select avg(sal) from emp;
select round(avg(sal),2) from emp;

-- 31.Display the maximum salary being paid to CLERK
select max(sal) from emp where job = 'CLERK';

-- 32.Display the maximum salary being paid in dept no 20
select max(sal) from emp where deptno = 20;

-- 33.Display the minimum salary being paid to any SALESMAN
select min(sal) from emp where job = 'SALESMAN';

-- 34.Display the average salary drawn by managers
select avg(sal) from emp where job = 'MANAGER';
select round(avg(sal),2) from emp where job = 'MANAGER';

-- 35.Display the total salary drawn by analyst working in dept no 20
select sum(sal) from emp where job = 'ANALYST' and deptno = 20;

-- 36.Display the names of employees in order of salary i.e. the name of the employee earning
select ename from emp order by sal;
select ename,sal from emp order by sal;
select ename,sal from emp order by sal DESC ;


-- 37.Display the names of employees in descending order of salary
-- lowest salary shoud appear first
select ename,sal from emp order by sal ASC;

-- 38.Display the details from emp table in order of emp name
select * from emp order by ename;

-- 39.Display empnno,ename,deptno and sal. Sort the output first based on name and within name by deptno and witdhin deptno by sal;
select empno,ename,deptno,sal from emp order by ename,deptno,sal;

-- 40) Display the name of employees along with their annual salary(sal*12)
-- the name of the employee earning highest annual salary should appear first?
select ename,sal*12 as annual_salary from emp order by annual_salary desc;

-- 41) Display name,salary,Hra,pf,da,TotalSalary for each employee.
select ename,sal + nvl(comm,0) from emp;

-- The out put should be in the order of total salary ,hra 15% of salary ,DA 10% of salary .pf 5% salary Total Salary will be (salary+hra+da)-pf?
-- 42) Display Department numbers and total number of employees working in each Department?
select deptno,count(*) as number_of_employees from emp group by deptno;
select deptno,count(*) as "Number Of Employees" from emp group by deptno;


-- 43) Display the various jobs and total number of employees working in each job group?
select job,count(*) as number_of_employees from emp group by job;

-- 44)Display department numbers and Total Salary for each Department?
select deptno,sum(sal) from emp group by deptno;

-- 45)Display department numbers and Maximum Salary from each Department?
select deptno, max(sal) from emp group by deptno;

-- 46)Display various jobs and Total Salary for each job?
select job, sum(sal) from emp group by job;

-- 47)Display each job along with min of salary being paid in each job group?
select job, min(sal), max(sal), round(avg(sal),2) from emp group by job;

-- 48) Display the department Number with more than three employees in each department?
select deptno,count(*) as number_emp from emp group by deptno having count(*) > 3 ;

-- 49) Display various jobs along with total salary for each of the job where total salary is
-- greater than 5000?
select job, sum(sal) from emp group by job having sum(sal) > 5000;

-- 50) Display the various jobs along with total number of employees in each job.The
-- output should contain only those jobs with more than three employees?
select job,count(*) from emp group by job having count(*) > 3;

-- 51) Display the name of employees who earn Highest Salary?
select ename from emp where sal = ( select max(sal) from emp );

-- 52) Display the employee Number and name for employee working as clerk and earning highest salary among the clerks?
select empno, ename from emp where job ='CLERK' and sal =  ( select max(sal) from emp where job ='CLERK' );

-- 53) Display the names of salesman who earns a salary more than the Highest Salary of the clerk?
select ename from emp where job = 'SALESMAN' and sal > ( select max(sal) from emp where job ='CLERK');

-- 54) Display the names of clerks who earn a salary more than the lowest Salary of any salesman?
select ename from emp where job = 'CLERK' and sal > ( select min(sal) from emp where job = 'SALESMAN' );

-- 55) Display the names of employees who earn a salary more than that of jones or that of salary greater than that of scott?
select ename from emp where sal > ( select max(sal) from emp where ename in ('JONES','SCOTT'));

-- 56) Display the names of employees who earn Highest salary in their respective departments?
select ename,deptno from emp where sal in (select max(sal) from emp group by deptno);

select ename from emp e, (select deptno, max(sal) as max_sal from emp group by deptno) d 
where e.deptno = d.deptno and e.sal = d.max_sal;

-- 57) Display the names of employees who earn Highest salaries in their respective job Groups?
select ename from emp e, (select job, max(sal) as max_sal from emp group by job) d 
where e.job = d.job and e.sal = d.max_sal;


-- 58) Display employee names who are working in Accounting department?
select e.ename from emp e, dept d 
where e.deptno = d.deptno and d.dname='ACCOUNTING';

-- 59) Display the employee names who are Working in Chicago?
select e.ename from emp e, dept d 
where e.deptno = d.deptno and d.loc='CHICAGO';


-- 60) Display the job groups having Total Salary greater than the maximum salary for Managers?
select job,sum(sal) from emp group by job having sum(sal) > (select max(sal) from emp where job ='MANAGER');

-- 61) Display the names of employees from department number 10 with salary greater than that of ANY employee working in other departments?
select ename from emp where deptno =10 and sal > ( select min(sal) from emp where deptno != 10) ;

-- 62) Display the names of employees from department number 10 with salary greater than    of   ALL employee working in other departments ?
select ename from emp where deptno =10 and sal > ( select max(sal) from emp where deptno != 10) ;

-- 63) Display the names of mployees in Upper Case?
select upper(ename) from emp;

-- 64) Display the names of employees in Lower Case?
select lower(ename) from emp;

-- 65) Display the names of employees in Proper case?
select initcap(ename) from emp;

-- 66) Find the length of your name using Appropriate Function?
select length('Sathwik') from dual;

-- 67) Display the length of all the employee names?
select ename,length(ename) from emp;

-- 68) Display the name of employee Concatinate with Employee Number?
select concat(ename,empno) from emp;

-- 69) Use appropriate function and extract 3 characters starting from 2 characters from the following string 'Oracle' i.e., the out put should be ac?
select substr('Oracle',2,2) from dual;

-- 70) Find the first occurance of character a from the following string Computer Maintenance Corporation?
select instr('Computer Maintenance Corporation','a') as first_occurence from dual;

-- 71)  Replace every occurance of alphabet A with B in the string .Alliens (Use Translate function)?
select replace('Alliens','A','B') from dual;

-- 72) Display the information from the employee table . where ever job Manager is found it should be displayed as Boss?
select ename,replace(job,'MANAGER','BOSS') from emp;

-- 73) Display empno,ename,deptno from emp table. Instead of display department numbers display the related department name(Use decode function)?
select e.empno,e.ename,d.dname from emp e , dept d where e.deptno = d.deptno;
select e.empno,e.ename,d.dname from emp e , dept d where e.deptno = d.deptno;

select empno,ename, decode(deptno,10,'ACCOUNTING',20,'RESEARCH',30,'SALES',40,'OPERATIONS') from emp;

-- 74) Display your Age in Days?
select round(sysdate-to_date('19-08-1993','dd-mm-yyyy'),2) as days_in_age from dual;
select round(round(sysdate-to_date('19-08-1993','dd-mm-yyyy'),2)/365,2) as years_in_age from dual;

-- 75) Display your Age in Months?
select round(round(sysdate-to_date('19-08-1993','dd-mm-yyyy'),2)/12,2) as months_in_age from dual;

-- 76) Display current date as 15th August Friday Nineteen Nienty Seven?
select to_date('15-08-1997','dd-mm-yyyy') as current_date from dual;

-- 78) Scott has joined the company on 13th August ninteen ninety?


-- 79) Find the nearest Saturday after Current date?
-- 80) Display the current time?
select sysdate from dual;
select CURRENT_TIMESTAMP from dual;

-- 81) Display the date three months before the Current date?
select sysdate-90 from dual;

-- 82) Display the common jobs from department number 10 and 20?
(select job from emp where deptno = 10) INTERSECT
(select job from emp where deptno = 20);

(select job from emp where deptno = 10) UNION 
(select job from emp where deptno = 20);

(select job from emp where deptno = 10) UNION ALL 
(select job from emp where deptno = 20);

-- 83) Display the jobs found in department 10 and 20 Eliminate duplicate jobs?
(select job from emp where deptno = 10) UNION 
(select job from emp where deptno = 20);

-- 84) Display the jobs which are unique to department 10?
(select job from emp where deptno = 10) minus 
(select job from emp where deptno != 10);

-- 85) Display the details of those employees who do not have any person working under him?
select * from emp where empno not in (select distinct(mgr) from emp where mgr is not null);

-- 86) Display the details of those employees who are in sales department and grade is 3?
select e.*,d.dname from emp e JOIN dept d on e.deptno = d.deptno where d.dname ='SALES'
and sal > ( select losal from salgrade where grade =3) and sal < ( select hisal from salgrade where grade =3);

-- 87) Display thoes who are not managers?
select * from emp where job != 'MANAGER';

-- 88) Display those employees whose name contains not less than 4 characters?
select * from emp where length(ename)>4;

-- 89) Display those department whose name start with"S" while location name ends with "K"?
select * from dept where dname like 'S%' and loc like '%K';
select * from dept;
select * from dept where dname like 'S%' or loc like '%K';

-- 90) Display those employees whose manager name is Jones?
select * from emp where mgr = ( select empno from emp where ename ='JONES');

-- 91) Display those employees whose salary is more than 3000 after giving 20% increment?
select * from emp where (1.2*sal) >3000;

-- 92g
-- 93) Display ename who are working in sales department?
select e.ename from emp e join dept d on e.deptno = d.deptno where d.dname ='SALES';
 
-- 94) Display employee name,dept name,salary,and commission for those sal in between 2000 to 5000 while location is Chicago?
select e.* from emp e join dept d on e.deptno = d.deptno where e.sal >= 2000 and e.sal <= 5000 and d.loc ='CHICAGO'; 

-- 95) Display those employees whose salary is greater than his managers salary?
select e.*,m.* from emp e join emp m on e.mgr = m.empno where e.sal > m.sal;

-- 96) Display those employees who are working in the same dept where his manager is work?
select e.*,m.* from emp e join emp m on e.mgr = m.empno where e.deptno = m.deptno;


-- 97) Display those employees who are not working under any Manager?
select * from emp where mgr is null; 

-- 98) Display the grade and employees name for the deptno 10 or 30 but grade is not 4 while joined the company before 31-DEC-82?
select e.*,s.* from emp e, salgrade s where e.deptno in (10,30)
and hiredate < to_date('31-12-1982','dd-mm-yyyy') and e.sal < s.hisal and e.sal > s.losal
and s.grade != 4;

-- 99) Update the salary of each employee by 10% increment who are not eligible for commission?
select 1.1*sal from emp where comm is null;


-- 100)  Delete those employees who joined the company before 31-Dec-82 while their department Location is New York or Chicago?
-- 101) Display employee name ,job,deptname,loc for all who are working as manager?
select e.ename,e.job, d.dname, d.loc from emp e join dept d on e.deptno = d.deptno where e.empno in (select mgr from emp where mgr is not null);

-- 102) Display those employees whose manager name is jones and also display their manager name?
select e.*,m.* from emp e join emp m on e.mgr = m.empno where m.ename='JONES';

-- 103)  Display name and salary of ford if his salary is equal to hisal of his grade?
select e.ename, e.sal from emp e join salgrade s on e.sal >s.losal and e.sal <s.hisal
where e.ename ='FORD' ;

-- 104) Display employee name, job, deptname, his manager name ,his grade and make an under department wise?

-- 105) List out all the employee names ,job,salary,grade and deptname for every one in a company except 'CLERK' . Sort on salary display the highest salary?
select * from emp where job != 'CLERK' order by sal desc;

-- 106) Display employee name,job and his manager .Display also employees who are with out managers?
select * from emp where mgr is null;

-- 107)  Display Top 5 employee of a Company?
select * from (select * from emp order by sal desc ) where rownum <6;

-- 108) Display the names of those employees who are getting the highest salary?
select * from emp where sal =(select max(sal) from emp );

-- 109) Display those employees whose salary is greater to average of maximum and minimum?
select * from emp where sal > ( select (min(sal)+max(sal))/2 from emp);

-- 110) Select count of employees in each department where count >3?
select deptno,count(*) from emp group by deptno having count(*) >3;

-- 111) Display dname where atleast three are working and display only deptname?
select d.dname from emp e join dept d on e.deptno = d.deptno group by d.dname having count(*) >3;

-- 112) Display name of those managers name whose salary is more than average salary of  Company?
select ename from emp where sal > ( select avg(sal) from emp) ;

-- 113) Display those managers name whose salary is more than average salary salary of his employees?
select distinct(m.ename),m.sal,inner_query.avg_sal from emp e join emp m on e.mgr = m.empno 
join (select m.empno as mgrno, round(avg(e.sal),2) as avg_sal from emp e join emp m on e.mgr = m.empno group by m.empno) inner_query on e.mgr = inner_query.mgrno 
where m.sal > inner_query.avg_sal;

-- 114) Display employee name, sal,comm and netpay for those employees whose netpay is greater than or equal to any other employee salary of the company?
select * from emp where sal+nvl(comm,0) >= ANY(select sal from emp);
select * from emp where sal+nvl(comm,0) >= ALL(select sal from emp);

-- 115) Display those employees whose salary is less than his manager but more than salary of other managers?


-- 116) Display all employees names with total sal of company with each employee name?


-- 117)  Find the last 5(least) employees of company?
-- 118)  Find out the number of employees whose salary is greater than their managers salary?
-- 119) Display the manager who are not working under president but they are working under any other manager?
-- 120) Delete those department where no employee working?
-- 121) Delete those records from emp table whose deptno not available in dept table?
-- 122) Display those enames whose salary is out of grade available in salgrade table?
-- 123) Display employee name, sal, comm and whose netpay is greater than any othere in the company?
-- 124) Display name of those employees who are going to retire 31-Dec-99 if maximum job period is 18 years?
-- 125) Display those employees whose salary is odd value?
-- 126) Display those employees whose salary contains atleast 3 digits?
-- 127) Display those employees who joined in the company in the month of Dec?
-- 128) Display those employees whose name contains A?
-- 129) Display those employees whose deptno is available in salary?
-- 130) Display those employees whose first 2 characters from hiredate - last 2 characters sal?
-- 131) Display those employees whose 10% of salary is equal to the year joining?
-- 132) Display those employees who are working in sales or research?
-- 133) Display the grade of jones?
-- 134) Display those employees who joined the company before 15th of the month?
-- 135) Display those employees who has joined before 15th of the month?
-- 
-- 136) Delete those records where no of employees in particular department is less than 3?
-- 137A) Delete those employee who joined the company 10 years back from today?
-- 137B) Display the deptname the number of characters of which is equal to no of employee in any other department?
-- 138) Display the deptname where no employee is working?
-- 139) Display those employees who are working as manager?
-- 140) Count the number of employees who are working as managers (Using set operators)?
-- 141) Display the name of the dept those employees who joined the company on the same date?
-- 142) Display those employees whose grade is equal to any number of sal but not equal to first number of sal?
-- 143) Count the no of employees working as manager using set operation?
-- 144) Display the name of employees who joined the company on the same date?
-- 145) Display the manager who is having maximum number of employees working under him?
-- 146) List out the employee name and salary increased by 15% and express as whole
-- number of Dollars?
-- 147) Produce the output of the emptable "EMPLOYEE_AND JOB" for ename and job ?
-- 148) List of employees with hiredate in the format of 'June 4 1988'?
-- 149) print list of employees displaying 'Just salary' if more than 1500 if exactly 1500
-- display 'on taget' if less than 1500 display below 1500?
-- 151) Given a string of the format 'nn/nn' . Verify that the first and last 2 characters are numbers .And that the middle character is '/' Print the expressions 'Yes' IF valid
-- 'NO' of not valid . Use the following values to test your solution'12/54',01/1a,'99/98'?
-- 152) Employes hire on OR Before 15th of any month are paid on the last friday of that month those hired after 15th are paid the last friday of th following month .print a list of employees .their hiredate and first pay date sort those who se salary contains first
-- digit of their deptno?
-- 153) Display those managers who are getting less than his employees salary?
-- 154) Print the details of employees who are subordinates to BLAKE?
-- 155. Display those who working as manager using co related sub query
-- 156. Display those employees whose manager name is JONES and also with his manager name
-- 157. Define variable representing the expressions used to calculate on employees total annual remuneration
-- 158. Use the variable in a statement which finds all employees who can earn 30000 a year or more
-- 159. Find out how many managers are there with out listing them
-- 160. Find out the avg sal and avg total remuneration for each job type remember
-- salesman earn commission define emp_ann_sal=(sal+nvl(comm,0))*.12
-- 161. Check whether all employees number are indeed unique
-- 162. List out the lowest paid employees working for each manager, exclude any groups where minsal is less than
-- 1000 sort the output by sal
-- 
-- 
-- 
-- 163. List ename, job, annual sal, deptno, dname and grade who earn 30000 per year and who are not clerks
-- 
-- 
-- 164. Find out the job that was filled in the first half of 1983 and the same job that was filled during the same period on 1984
-- 
-- 
-- 165. Find out the all employees who joined the company before their manager
select e.*,m.* from emp e join emp m on e.mgr = m.empno where e.hiredate<m.HIREDATE; 
-- 
-- 166. List out the all employees by name and number along with their manager's name and number also display  'NO MANAGER' who has no manager
select e.*,m.* from emp e left join emp m on e.mgr = m.empno ;
-- 
-- 
-- 167. Find out the employees who earned the highest sal in each job typed sort in descending sal order
-- 
-- 
-- 
-- 168. Find out the employees who earned the min sal for their job in ascending order
-- 
-- 
-- 
-- 169. Find out the most recently hired employees in each dept order by hire date
-- 
-- 
-- 170. Display ename, sal and deptno for each employee who earn a sal greater than the avg of their department order by deptno
-- 
-- 
-- 
-- 
-- 171. Display the department where there are no employees
-- 
-- 
-- 
-- 
-- 172. Display the dept no with highest annual remuneration bill as compensation
-- 
-- 
-- 
-- 
-- 
-- 173. In which year did most people join the company. Display the year and number of employees
-- 
-- 
-- 
-- 174. Display avg sal figure for the dept
-- 
-- 
-- 
-- 175. Write a query of display against the row of the most recently hierd employee.display ename hire date and column max date showing
-- 
-- 
-- 176. Display employees who can earn more than lowest sal in dept no 30.
-- 
-- 177. Find employees who can earn more than every employees in dept no 30. select dept name and deptno and sum of sal break on deptno on dname;
-- 
-- 
-- 
-- 178. Find out avg sal and avg total remainders for each job type
-- A. select * from emp where sal>all(select sal from emp where deptno=30); 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 179. Find all dept's which have more than 3 employees
-- /*If the pay day is next Friday after 15th and 30th of every month. What is the next pay day from their hire date for employee in emp table /*
-- /*If an employee is taken by you today in your organization and is a policy in your company to have a  review after 9 months the joined date (and of 1st of next month after 9 months) how many days from today  your employee has to wait for a review*/
-- 
-- 
-- 
-- 
-- 180. Display the 10 th record of emp table (without using rowid)
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 181. Display the half of the enames in upper case and remaining lower case
-- 
-- 
-- 
-- 
-- 
-- 182. Display the 10th record of emp table without using group by and rowed
-- 
-- 
-- 
-- 183. Delete the 10th record of emp table
-- 
-- 
-- 
-- 184. Create a copy of emp table
-- 
-- 185. select ename if ename exists more than once
-- 
-- 
-- 186. Display all enames in reverse order
-- 
-- 
-- 187. Display those employee whose joining of month and grade is equal
-- 
-- 
-- 
-- 188. Display those employee whose joining date is available in deptno
-- 
-- 
-- 
-- 
-- 189. Display those employee name as follows A ALLEN, B BLAKE
-- 
-- 
-- 
-- 
-- 190. List out the employees ename,sal,pf from emp
-- 
-- 
-- 
-- 
-- 192. Create table emp1 with only one column empno
-- 
-- 
-- 
-- 
-- 
-- 193. Add this column to emp1 table ename varchar2(20)
-- 
-- 
-- 
-- 
-- 194.OOPSI i forget to give the primary key constraint. Add it now
-- 
-- 
-- 
-- 195.Now increase the length of ename column to 30 characters
-- 
-- 
-- 196. Add salary column to emp table?
-- 
-- 
-- 
-- 
-- 197. I want to give a validation saying that sal can not be greater 10000(note give a name to this column)
-- 
-- 
-- 
-- 
-- 198. For the time being i have decided that i will not impose this validation. My boss has agreed to pay
-- more than 10000
-- 
-- 
-- 
-- 
-- 199. My boss has changed his mind. Now he doesn't want to pay more than 10000 So revoke that salary constraint
-- 
-- 
-- 
-- 
-- 200. Add column called as mgr to your emp table
-- 
-- 
-- 
-- 201. Oh! This column should be related to empno, Give a command to add this constraint
-- 
-- 
-- 
-- 
-- 202. Add dept no column to your emp table
-- 
-- 
-- 
-- 203. This deptno column should be related to deptno column of dept table
-- 
-- 
-- 
-- 204.Create table called as new emp. Using single command create this table as well as to get data into this table (use create table as)
-- 
-- 
-- 
-- 
-- 
-- 205. Create table called as newemp. This table should contain only  empno, ename, dname ?
drop table temp_table;
create table temp_table as select e.empno, e.ename, d.loc from emp e left join dept d on e.deptno = d.deptno;
select * from temp_table;
-- 
-- 206. Delete the rows of employees who are working in the company for more than 2 years
-- 
-- 
-- 
-- 207. Provides a commission to employees who are not earning any commission
-- 
-- 
-- 
-- 
-- 208. If any employee has commission his commission should be incremented by 100% of his salary

-- 
-- 
-- 
-- 209. Display employee name and department name for each employee

-- 
-- 210.Display employee number,name and location of the department in which he is working
select e.ename,e.empno,d.dname,d.loc from emp e left join dept d on e.deptno = d.deptno ;
-- 
-- 
-- 211. Display ename,dname even if there no employees working in a particular department(use outer join)
select e.ename,d.dname from emp e full join dept d on e.deptno = d.deptno;
-- 
-- 212. Display employee name and his manager name.
select e.ename as employee_name,nvl(m.ename,'NO MANAGER') as manager_name from emp e left join emp m on e.mgr = m.empno;
-- 
-- 213. Display the department name along with total salary in each department
select d.dname,sum(e.sal) as total_salary from emp e left join dept d on e.deptno = d.deptno group by d.dname;

-- 
-- 
-- 214. Display the department name and total number of employees in each department
select d.dname,count(*) as total_employees from emp e join dept d on e.deptno = d.deptno group by d.dname;
-- 
-- 
-- 215. Select child tables for a given parent table?

-- 
-- 



