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