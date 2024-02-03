create database Book_db;
use Book_db;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publication VARCHAR(255),
    price DECIMAL(10, 2),
    edition INT
);

INSERT INTO Books (book_id, title, author, publication, price, edition)
VALUES
    (1, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 12.99, 1),
    (2, 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', 14.99, 1),
    (3, '1984', 'George Orwell', 'Secker & Warburg', 9.99, 1),
    (4, 'The Great ++', 'F. Scott Fitzgerald', 'Charles Scribners Sons', 11.99, 1),
    (5, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', 8.99, 2),
    (6, 'The Hobbit', 'J.R.R. Tolkien', 'Allen & Unwin', 17.99, 2),
    (7, 'The Lord of the Rings C++ books', 'J.R.R. Tolkien', 'George Allen & Unwin', 25.99, 3),
    (8, 'Harry Potter and the Philosophers Stone', 'J.K. Rowling', 'Bloomsbury', 20.99, 1),
    (9, 'The Da Vinci Prog', 'Dan Brown', 'PHI', 15.99, 1),
    (10, 'The Alchemist', 'Paulo Coelho', 'HarperCollins', 13.99, 2);

select * from Books;
-- 11. List the names of author starting with capital letter.
select upper(left(author,1)) as Author from books;
-- SELECT author
-- FROM Books
-- WHERE ASCII(UPPER(LEFT(author, 1))) BETWEEN ASCII('A') AND ASCII('Z');

-- 12. Display the name of book in both lower and upper case using a single query.
select upper(title) 'UPPER',lower(title) 'lower' from books;

-- 13. Display the output : ‘BAD’ using CHR function.
SELECT CONCAT(CHAR(ASCII('B')), CHAR(ASCII('A')), CHAR(ASCII('D'))) AS OutputText;
SELECT CHAR(68) AS output;

-- 14. Display the price of books in the following format : ****450
SELECT
  CONCAT(LPAD(FLOOR(price), LENGTH(FLOOR(price)) + 4, '*'), SUBSTRING(price, LENGTH(FLOOR(price)) + 1)) AS FormattedPrice
FROM
  Books;

-- 15. Display the price of books in the following format : 450*/*/
SELECT
  CONCAT(FLOOR(price), '*', SUBSTRING(price, LENGTH(FLOOR(price)) + 1), '*/*') AS FormattedPrice
FROM
  Books;

-- 16. Display the publication of PHI as Pearson (Use replace...)
SELECT
  *,REPLACE(publication, 'PHI', 'Pearson') AS ModifiedPublication
FROM
  Books
WHERE
  publication LIKE '%PHI%';

-- 17. Display the title of books and trim the ending part if it ends with prog.
SELECT
  CASE
    WHEN RIGHT(title, 4) = 'prog' THEN LEFT(title, LENGTH(title) - 4)
    ELSE title
  END AS ModifiedTitle
FROM
  Books;

-- 18. Display the titles of books which contains ‘++’ in it.
select title from books where title like '%++%';

-- 19. Modify the column size of author.
ALTER TABLE Books MODIFY COLUMN author VARCHAR(255);

-- 20. Add a new column author2 to the table.
alter table books add column Author2 varchar(255);
