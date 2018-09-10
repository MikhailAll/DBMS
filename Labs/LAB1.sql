--1. Вывести всю информацию из таблицы Employees.
SELECT *FROM employees;

--2. Вывести всю информацию из таблицы Departments. 
SELECT *FROM departments;

--3. Вывести те отделы и их наименования, которые присутствуют в таблице Employees. Строки в итоговой выборке не должны повторяться. 
SELECT DISTINCT D.department_id, department_name 
FROM Departments D 
JOIN Employees E ON D.department_id = E.department_id;

--4. Выбрать имена и фамилии сотрудников, дату начала работы, зарплату. 
SELECT first_name || ' ' || last_name AS "Ф.И.О", hire_date AS "Дата", salary AS "З/п" 
FROM Employees;

--5. Проверить: есть ли в таблице Employees поля с пустыми значениями. Вывести любой из столбцов, в котором были такие значения, предварительно заменив «пустые» значения на «непустые». 
SELECT NVL(commission_pct, 0), NVL(manager_id, 0), NVL(department_id, 0) 
FROM employees;

--6. Выбрать имена и фамилии сотрудников, указать годовую зарплату каждого, должность. 
SELECT first_name, last_name, salary * 12, job_title 
FROM employees E 
JOIN jobs J ON E.job_id = J.job_id;

--7. Выбрать сотрудников, которые получают премию. 
SELECT first_name, last_name 
FROM employees 
WHERE commission_pct IS NOT NULL;

--8. Указать размер годового дохода каждого сотрудника, учитывая, что премия указана в процентах
SELECT first_name, last_name, 
(salary + (salary * NVL(commission_pct, 0))) * 12 
FROM employees;

--9. Найти сотрудников, размер зарплаты которых меньше максимально возможной и больше минимально возможной зарплаты. Вывести фамилию сотрудника, зарплату. 
SELECT last_name, salary 
FROM employees E 
JOIN jobs J ON E.job_id = J.Job_id 
WHERE E.salary < J.max_salary AND E.salary > J.min_salary;

--10. Вывести в алфавитном порядке страны, в которых есть филиалы компании. 
SELECT DISTINCT C.country_name FROM countries C
JOIN locations L ON C.country_id = L.country_id
JOIN departments D ON L.location_id = D.location_id
ORDER BY C.country_name; 

--11. Вывести имена сотрудников, фамилии которых начинаются на буквы «K» или «L».   
SELECT first_name FROM employees WHERE last_name LIKE 'K%' OR last_name LIKE 'L%';

--12. Вывести имена сотрудников, в фамилиях которых предпоследняя буква «n». 
SELECT first_name FROM employees WHERE last_name LIKE '%n_';

--13. Напишите запрос, который определит сотрудников, являющихся менеджерами высшего звена.    
SELECT first_name, last_name FROM employees E 
JOIN departments D ON E.manager_id = D.manager_id; 

--14. Составьте запрос, формирующий выходной документ, в котором будет указан чистый доход сотрудника (за вычетом налогов) за год. 
--Известно, что налогами облагается весь доход работника. Налоговые ставки условно принять как: 2% – пенсионный фонд, 2% – фонд социального страхования, 15% – подоходный налог.
SELECT first_name, last_name, 
(salary - salary * 0.19) * 12 AS "Annual salary", 
salary * 0.02 * 12 AS "Pension fund - 2%", 
salary * 0.02 * 12 AS "Social insurance - 2%",
salary * 0.15 * 12 AS "Income tax - 15%"    
FROM employees; 

--15.  Вывести фамилию, имя, должность, название отдела для тех сотрудников, размер зарплаты которых находится между двумя задаваемыми вами значениями. 
SELECT last_name, first_name, job_title, department_name FROM employees E 
JOIN jobs J ON E.job_id = J.job_id 
JOIN departments D ON E.department_id = D.department_id
WHERE salary BETWEEN 9000 AND 20000;