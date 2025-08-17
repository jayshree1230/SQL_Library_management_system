create database	Library_Management_system;
use Library_Management_system;
show tables;
select * from books;
/*project Task
Q1- create a new book record --"978-1-60129-456-2","To kill a Mockingbird","classic",6.00,'yes','Harper Lee','J.B.Lipincott & C0.'*/
insert into books (isbn, book_title,category,rental_price,status,author,publisher) 
values
("978-1-60129-456-2","To kill a Mockingbird","classic",6.00,'yes','Harper Lee','J.B.Lipincott & C0.');

/*Q2 Update an existing Members Address*/
update members
set member_address="125 Main St"
where member_id='C101';
select * from members;

/*Q3 delete a record from the Issued Status Table where issued_id='IS107'*/
select * from issued_status;
delete from issued_status
where issued_id='IS107';

/*Q4 Retrive all the books issued by a specific employee where employee_id=E101*/
select * from issued_status 
where issued_emp_id="E101";

/* Q5 List the member who have issued more than one book*/
select issued_emp_id,
count(issued_id) as Total_book_issued
from issued_status
group by issued_emp_id
having count(issued_id)>1;

/*Q6 create summary tables:used CTAS to generate new table based on query results -each book & total book_issued_cnt**/

create table book_cnts
as
select b.isbn,
count(ist.issued_id) as no_of_issued
from books as b
join 
issued_status as ist
on ist.issued_book_isbn=b.isbn
group by 1;

select * from book_cnts;

/*Q7etrive all books in a specific category:Classic*/
select * from books
where category='Classic';

/*Q8 Find Total Rental Income by each Category*/
select b.category, 
sum(b.rental_price) as Total_rental_price,
count(*)
from books as b
join
issued_status as ist
on ist.issued_book_isbn=b.isbn
group by category;

/*Q9 list Members who registered in the Last 180 Days*/
SELECT *
FROM members
WHERE reg_date >= CURDATE() - INTERVAL 180 DAY;

insert into members(member_id,member_name,member_address,reg_date) 
values
('C188','sam','145 Main St','2025-16-08'),
('C189','john','133 Main St','2025-11-08');

/* Q10ist Employees with their Branch Managers name and their branch details*/
select * from branch;
select e1.emp_id,e1.emp_name,
b.branch_id,
e2.emp_name as manager
from employees as e1
join 
branch as b 
on b.branch_id=e1.branch_id
join
employees as e2
on b.manager_id=e2.emp_id;

/* Q11 create table of books with rental price above a certain threshold 7USD*/
create table Books_price_greater_than_7
select * from books
where rental_price>7;
select * from Books_price_greater_than_7;

/*Q12 Retrive the list of books not yet Returned*/
select 
distinct ist.issued_book_name from issued_status as ist
left join
return_status as rs
on rs.issued_id=ist.issued_id
where rs.return_id is Null;
