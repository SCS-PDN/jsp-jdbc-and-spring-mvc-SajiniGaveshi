Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.39 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE university_db;
Query OK, 1 row affected (0.59 sec)

mysql>
mysql> USE university_db;
Database changed
mysql>
mysql> CREATE TABLE students (
    ->     student_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     name VARCHAR(100) NOT NULL,
    ->     email VARCHAR(100) NOT NULL UNIQUE,
    ->     password VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.29 sec)

mysql>
mysql> CREATE TABLE courses (
    ->     course_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     name VARCHAR(100) NOT NULL,
    ->     instructor VARCHAR(100) NOT NULL,
    ->     credits INT NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> CREATE TABLE registrations (
    ->     reg_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     student_id INT NOT NULL,
    ->     course_id INT NOT NULL,
    ->     date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ->     FOREIGN KEY (student_id) REFERENCES students(student_id),
    ->     FOREIGN KEY (course_id) REFERENCES courses(course_id)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql>
mysql> INSERT INTO students (name, email, password) VALUES
    -> ('John Doe', 'john@university.edu', 'password123'),
    -> ('Jane Smith', 'jane@university.edu', 'securepass');
Query OK, 2 rows affected (0.07 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO courses (name, instructor, credits) VALUES
    -> ('Web Programming', 'Dr. Smith', 3),
    -> ('Database Systems', 'Prof. Johnson', 4),
    -> ('Algorithms', 'Dr. Williams', 4);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> GRANT ALL PRIVILEGES ON university_db.* TO 'root'@'localhost';
Query OK, 0 rows affected (0.36 sec)

mysql>