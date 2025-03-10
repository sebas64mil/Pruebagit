-- Database generation
CREATE SCHEMA IF NOT EXISTS `icetex`;
USE `icetex` ;

CREATE TABLE IF NOT EXISTS `icetex`.`student` (
  `cedula` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`));

CREATE TABLE IF NOT EXISTS `icetex`.`debt` (
  `iddebt` INT AUTO_INCREMENT NOT NULL,
  `total_debt` INT NOT NULL,
  `date` DATE NOT NULL,
  `student_cedula` INT NOT NULL,
  PRIMARY KEY (`iddebt`),
  INDEX `fk_debt_student_idx` (`student_cedula` ASC),
  CONSTRAINT `fk_debt_student`
    FOREIGN KEY (`student_cedula`)
    REFERENCES `icetex`.`student` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------------------------------
-- Fill basic info into the table

-- Insert Students in the table
INSERT INTO student(cedula, student.name) VALUES ('1000284236', 'Sergio Reyes');
INSERT INTO student(cedula, student.name) VALUES ('1000284235', 'Memo Reyes');
INSERT INTO student(cedula, student.name) VALUES ('1000284234', 'Alberto Reyes');
INSERT INTO student(cedula, student.name) VALUES ('1000284233', 'Juan Perez');
INSERT INTO student(cedula, student.name) VALUES ('1000284232', 'Rodolfo Lopez');
INSERT INTO student(cedula, student.name) VALUES ('1000284231', 'Armando Ricaurte');
INSERT INTO student(cedula, student.name) VALUES ('1000284230', 'Beatriz Pinzon');

-- Insert Debts in the table
INSERT INTO debt(total_debt, debt.date, student_cedula) VALUES (1000000, '2025-08-12', "1000284236");
INSERT INTO debt(total_debt, debt.date, student_cedula) VALUES (8000000, '2025-10-12', "1000284236");
INSERT INTO debt(total_debt, debt.date, student_cedula) VALUES (500000, '2025-08-12', "1000284230");
INSERT INTO debt(total_debt, debt.date, student_cedula) VALUES (100000000, '2025-08-12', "1000284231");
INSERT INTO debt(total_debt, debt.date, student_cedula) VALUES (10000, '2025-08-12', "1000284233");
INSERT INTO debt(total_debt, debt.date, student_cedula) VALUES (1000000, '2025-08-12', "1000284234");

-- Simple Queries
SELECT * FROM student;
SELECT * FROM debt WHERE student_cedula = "1000284236";

-- ADVANCED QUERIES

-- Select just some columns
SELECT total_debt, debt.date FROM debt WHERE student_cedula = "1000284236";
SELECT student.name FROM student WHERE cedula = "1000284230";
-- Order Ascending or descending
SELECT * FROM debt WHERE student_cedula = "1000284236" ORDER BY total_debt DESC;
SELECT * FROM debt WHERE student_cedula = "1000284236" ORDER BY total_debt ASC;
SELECT * FROM debt WHERE student_cedula = "1000284236" ORDER BY debt.date ASC;

SELECT * FROM student Where name ="Armando Ricaurte" ORDER BY  student.name ASC;
SELECT * FROM student Where name ="Armando Ricaurte" ORDER BY  student.name DESC;


-- Join sentence
SELECT student.name, debt.total_debt, debt.date
FROM debt
INNER JOIN student ON debt.student_cedula=student.cedula;
 