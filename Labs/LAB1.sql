--1. ������� ��� ���������� �� ������� Employees.
SELECT *FROM employees;

--2. ������� ��� ���������� �� ������� Departments. 
SELECT *FROM departments;

--3. ������� �� ������ � �� ������������, ������� ������������ � ������� Employees. ������ � �������� ������� �� ������ �����������. 
SELECT DISTINCT D.department_id, department_name 
FROM Departments D 
JOIN Employees E ON D.department_id = E.department_id;

--4. ������� ����� � ������� �����������, ���� ������ ������, ��������. 
SELECT first_name || ' ' || last_name AS "�.�.�", hire_date AS "����", salary AS "�/�" 
FROM Employees;

--5. ���������: ���� �� � ������� Employees ���� � ������� ����������. ������� ����� �� ��������, � ������� ���� ����� ��������, �������������� ������� ������� �������� �� ���������. 
SELECT NVL(commission_pct, 0), NVL(manager_id, 0), NVL(department_id, 0) 
FROM employees;

--6. ������� ����� � ������� �����������, ������� ������� �������� �������, ���������. 
SELECT first_name, last_name, salary * 12, job_title 
FROM employees E 
JOIN jobs J ON E.job_id = J.job_id;

--7. ������� �����������, ������� �������� ������. 
SELECT first_name, last_name 
FROM employees 
WHERE commission_pct IS NOT NULL;

--8. ������� ������ �������� ������ ������� ����������, ��������, ��� ������ ������� � ���������
SELECT first_name, last_name, 
(salary + (salary * NVL(commission_pct, 0))) * 12 
FROM employees;

--9. ����� �����������, ������ �������� ������� ������ ����������� ��������� � ������ ���������� ��������� ��������. ������� ������� ����������, ��������. 
SELECT last_name, salary 
FROM employees E 
JOIN jobs J ON E.job_id = J.Job_id 
WHERE E.salary < J.max_salary AND E.salary > J.min_salary;

--10. ������� � ���������� ������� ������, � ������� ���� ������� ��������. 
SELECT DISTINCT C.country_name FROM countries C
JOIN locations L ON C.country_id = L.country_id
JOIN departments D ON L.location_id = D.location_id
ORDER BY C.country_name; 

--11. ������� ����� �����������, ������� ������� ���������� �� ����� �K� ��� �L�.   
SELECT first_name FROM employees WHERE last_name LIKE 'K%' OR last_name LIKE 'L%';

--12. ������� ����� �����������, � �������� ������� ������������� ����� �n�. 
SELECT first_name FROM employees WHERE last_name LIKE '%n_';

--13. �������� ������, ������� ��������� �����������, ���������� ����������� ������� �����.    
SELECT first_name, last_name FROM employees E 
JOIN departments D ON E.manager_id = D.manager_id; 

--14. ��������� ������, ����������� �������� ��������, � ������� ����� ������ ������ ����� ���������� (�� ������� �������) �� ���. 
--��������, ��� �������� ���������� ���� ����� ���������. ��������� ������ ������� ������� ���: 2% � ���������� ����, 2% � ���� ����������� �����������, 15% � ���������� �����.
SELECT first_name, last_name, 
(salary - salary * 0.19) * 12 AS "Annual salary", 
salary * 0.02 * 12 AS "Pension fund - 2%", 
salary * 0.02 * 12 AS "Social insurance - 2%",
salary * 0.15 * 12 AS "Income tax - 15%"    
FROM employees; 

--15.  ������� �������, ���, ���������, �������� ������ ��� ��� �����������, ������ �������� ������� ��������� ����� ����� ����������� ���� ����������. 
SELECT last_name, first_name, job_title, department_name FROM employees E 
JOIN jobs J ON E.job_id = J.job_id 
JOIN departments D ON E.department_id = D.department_id
WHERE salary BETWEEN 9000 AND 20000;