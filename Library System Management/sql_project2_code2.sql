SELECT*FROM branch
SELECT*FROM books
SELECT*FROM employees
SELECT*FROM issued_status
SELECT*FROM members
SELECT*FROM return_status

--PROJECT TASK 
--Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
INSERT INTO books(isbn,book_title,category,rental_price,status,author,publisher)
VALUES ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

--Task 2: Update an Existing Member's Address
UPDATE members
SET member_address = '125 Oak St'
WHERE member_id = 'C103';

--Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
DELETE FROM issued_status
WHERE issued_id = 'IS121';

--Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
SELECT*FROM issued_status
WHERE issued_emp_id = 'E101';

--Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.
SELECT issued_member_id, COUNT(issued_member_id) AS total_book
FROM issued_status
GROUP BY issued_member_id
HAVING COUNT(issued_member_id)>1
ORDER BY 2 DESC;

--CTAS (Create Table As Select)
--Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**
CREATE TABLE book_issued_cnt AS
SELECT a.isbn,a.book_title,a.author,COUNT(b.issued_book_isbn) AS issued_book_count
FROM books a
JOIN issued_status b
ON a.isbn = b.issued_book_isbn
GROUP BY a.isbn,a.book_title,a.author;

--Data Analysis
--Task 7. Retrieve All Books in a Specific Category:
SELECT*FROM books
WHERE category = 'Classic';

--Task 8: Find Total Rental Income by Category:
SELECT b.category, SUM(b.rental_price) AS total_rental_income, COUNT(*)
FROM issued_status a
JOIN books b
ON a.issued_book_isbn=b.isbn
GROUP BY b.category
ORDER BY 2 DESC;

--Task 9. List Members Who Registered in the Last 180 Days:
SELECT*FROM members
WHERE reg_date BETWEEN '2023-12-04' AND '2024-06-01'
--WHERE reg_date >= CURRENT_DATE - INTERVAL '180 days';

--Task 10. List Employees with Their Branch Manager's Name and their branch details:
SELECT a.emp_id,a.emp_name, c.emp_name AS manager,b.branch_address,b.contact_no
FROM employees a
LEFT JOIN branch b
ON a.branch_id=b.branch_id
LEFT JOIN employees c
ON b.manager_id=c.emp_id

--Task 11. Create a Table of Books with Rental Price Above a Certain Threshold:
CREATE expensive_books AS
SELECT*FROM books
WHERE rental_price > 6
ORDER BY rental_price 

--Task 12. Retrieve the List of Books Not Yet Returned
SELECT*FROM issued_status a
LEFT JOIN return_status b
ON a.issued_id=b.issued_id
WHERE b.return_id IS NULL;

--Task 13: Identify Members with Overdue Books
	--Write a query to identify members who have overdue books (assume a 30-day return period). Display the member's_id, member's name, book title, issue date, and days overdue.
SELECT a.issued_member_id, b.member_name, a.issued_book_name, a.issued_date, (c.return_date - a.issued_date - 30) AS days_overdue
FROM issued_status a
LEFT JOIN members b
ON a.issued_member_id=b.member_id
LEFT JOIN return_status c
ON a.issued_id = c.issued_id
WHERE 
 c.return_date - a.issued_date > 30;

--Task 14: Update Book Status on Return
	--Write a query to update the status of books in the books table to "Yes" when they are returned (based on entries in the return_status table).

CREATE OR REPLACE PROCEDURE add_return_records(p_return_id VARCHAR(10), p_issued_id VARCHAR(10), p_book_quality VARCHAR(10))
LANGUAGE plpgsql
AS $$

DECLARE
    v_isbn VARCHAR(50);
    v_book_name VARCHAR(80);
    
BEGIN
    -- all your logic and code
    -- inserting into returns based on users input
    INSERT INTO return_status(return_id, issued_id, return_date, book_quality)
    VALUES
    (p_return_id, p_issued_id, CURRENT_DATE, p_book_quality);

    SELECT 
        issued_book_isbn,
        issued_book_name
        INTO
        v_isbn,
        v_book_name
    FROM issued_status
    WHERE issued_id = p_issued_id;

    UPDATE books
    SET status = 'yes'
    WHERE isbn = v_isbn;

    RAISE NOTICE 'Thank you for returning the book: %', v_book_name;
    
END;
$$


-- Testing FUNCTION add_return_records

issued_id = IS135
ISBN = WHERE isbn = '978-0-307-58837-1'

SELECT * FROM books
WHERE isbn = '978-0-307-58837-1';

SELECT * FROM issued_status
WHERE issued_book_isbn = '978-0-307-58837-1';

SELECT * FROM return_status
WHERE issued_id = 'IS135';

-- calling function 
CALL add_return_records('RS138', 'IS135', 'Good');

-- calling function 
CALL add_return_records('RS148', 'IS140', 'Good');


--Task 15: Branch Performance Report
	--Create a query that generates a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.
CREATE TABLE branch_reports
AS
SELECT 
    b.branch_id,
    b.manager_id,
    COUNT(ist.issued_id) as number_book_issued,
    COUNT(rs.return_id) as number_of_book_return,
    SUM(bk.rental_price) as total_revenue
FROM issued_status as ist
JOIN 
employees as e
ON e.emp_id = ist.issued_emp_id
JOIN
branch as b
ON e.branch_id = b.branch_id
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
JOIN 
books as bk
ON ist.issued_book_isbn = bk.isbn
GROUP BY 1, 2;

SELECT * FROM branch_reports;


--Task 16: CTAS: Create a Table of Active Members
	--Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book in the last 2 months.
SELECT a.member_id, a.member_name,COUNT(b.issued_id) AS total_issued
FROM members a
LEFT JOIN issued_status b
ON a.member_id=issued_member_id
WHERE b.issued_date BETWEEN '2024-02-13' AND '2024-04-13'
GROUP BY 1,2
HAVING COUNT(b.issued_id)>=1

--Task 17: Find Employees with the Most Book Issues Processed
	--Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, number of books processed, and their branch.
SELECT a.emp_name, COUNT(b.issued_emp_id) AS book_processed,c.branch_address
FROM employees a
LEFT JOIN issued_status b
ON a.emp_id=b.issued_emp_id
LEFT JOIN branch c
ON a.branch_id=c.branch_id
GROUP BY 1,3
ORDER BY 2 DESC
LIMIT 3

--Task 18: Identify Members Issuing High-Risk Books
	--Write a query to identify members who have issued books more than twice with the status "damaged" in the books table. Display the member name, book title, and the number of times they've issued damaged books.

--Task 19: Stored Procedure 
	--Objective: Create a stored procedure to manage the status of books in a library system. 
	--Description: Write a stored procedure that updates the status of a book in the library based on its issuance. 
	--The procedure should function as follows: The stored procedure should take the book_id as an input parameter. 
	--The procedure should first check if the book is available (status = 'yes'). If the book is available, it should be issued, and the status in the books table should be updated to 'no'. If the book is not available (status = 'no'), the procedure should return an error message indicating that the book is currently not available.

CREATE OR REPLACE PROCEDURE issue_book(p_issued_id VARCHAR(10), p_issued_member_id VARCHAR(30), p_issued_book_isbn VARCHAR(30), p_issued_emp_id VARCHAR(10))
LANGUAGE plpgsql
AS $$

DECLARE
-- all the variabable
    v_status VARCHAR(10);

BEGIN
-- all the code
    -- checking if book is available 'yes'
    SELECT 
        status 
        INTO
        v_status
    FROM books
    WHERE isbn = p_issued_book_isbn;

    IF v_status = 'yes' THEN

        INSERT INTO issued_status(issued_id, issued_member_id, issued_date, issued_book_isbn, issued_emp_id)
        VALUES
        (p_issued_id, p_issued_member_id, CURRENT_DATE, p_issued_book_isbn, p_issued_emp_id);

        UPDATE books
            SET status = 'no'
        WHERE isbn = p_issued_book_isbn;

        RAISE NOTICE 'Book records added successfully for book isbn : %', p_issued_book_isbn;


    ELSE
        RAISE NOTICE 'Sorry to inform you the book you have requested is unavailable book_isbn: %', p_issued_book_isbn;
    END IF;
END;
$$

-- Testing The function
SELECT * FROM books;
-- "978-0-553-29698-2" -- yes
-- "978-0-375-41398-8" -- no
SELECT * FROM issued_status;

CALL issue_book('IS155', 'C108', '978-0-553-29698-2', 'E104');
CALL issue_book('IS156', 'C108', '978-0-375-41398-8', 'E104');

SELECT * FROM books
WHERE isbn = '978-0-375-41398-8'
