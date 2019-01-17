/********************************************************************
*Compose a SELECT statement that queries for the following information
*
*All information from the habitat table.
*********************************************************************/


SELECT * FROM tbl_habitat; 


/************************************************************************************
*Compose a SELECT statement that queries for the following information
*
*Retrieve all names from the species_name column that have a species_order value of 3.
**************************************************************************************/

SELECT species_name FROM tbl_species WHERE species_order LIKE '3';



/******************************************************************************************************
*Compose a SELECT statement that queries for the following information
*
*Retrieve only the nutrition_type from the nutrition table that have a nutrition_cost of 600.00 or less.
*******************************************************************************************************/

SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost  < 600.00;


/******************************************************************************************************
*Compose a SELECT statement that queries for the following information
*
* Retrieve all species_names with the nutrition_id between 2202 and 2206 from the nutrition table.
*******************************************************************************************************/


SELECT a1.species_name FROM tbl_species a1 INNER JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition WHERE a2.nutrition_id BETWEEN  '2202' AND '2206';




/******************************************************************************************************
*Compose a SELECT statement that queries for the following information
*
* Retrieve all names within the species_name column using the alias "Species Name:" from the species table and their corresponding nutrition_type under the alias "Nutrition Type:" from the nutrition table.
*******************************************************************************************************/

SELECT a1.species_name AS 'Species Name', a2.nutrition_type AS 'Nutrition Type'  FROM tbl_species a1 INNER JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition;
  

  
/*********************************************************************************************************************************************
*Compose a SELECT statement that queries for the following information
*
* From the specialist table, retrieve the first and last name and contact number of those that provide care for the penguins from the species table.
**************************************************************************************************************************************************/

SELECT
		a1.specialist_fname, a1.specialist_lname, 
		a1.specialist_contact 
		FROM tbl_specialist a1
		INNER JOIN tbl_care a2 ON a2.care_specialist = a1.specialist_id
		INNER JOIN tbl_species a3 ON a3.species_care = a2.care_id
		WHERE species_name = 'penguin'
	;



/********************************************************************************************************************************************************************************************************************
*Compose a SELECT statement that queries for the following information
*
*  Create a database with two tables. Assign a foreign key constraint on one table that shares related data with the primary key on the second table. Finally, create a statement that queries data from both tables..
*********************************************************************************************************************************************************************************************************************/

CREATE DATABASE db_endDrill;


/******************************************************
	 * Build  tables and define ther schema
******************************************************/
	CREATE TABLE tbl_students (
		students_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		students_name VARCHAR(50) NOT NULL,
		students_grade INT NOT NULL,
		students_age INT NOT NULL
	);


	CREATE TABLE tbl_sports (
		sports_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		sports_grade INT NOT NULL CONSTRAINT fk_students_id FOREIGN KEY REFERENCES tbl_students (students_id) ON UPDATE CASCADE ON DELETE CASCADE,
		sports_location VARCHAR(50) NOT NULL
	);

		

	INSERT INTO tbl_students
	(students_name,students_grade, students_age)
	VALUES 
	('Kwabena',4,9),
	('Kwaku',1,6),
	('Kofi',1,6),
	('Demo',4,10),
	('Valentino',1,7),
	('Eileen',2,8),
	('Kenyatta',6,12),
	('Landon',6,13),
	('Kwabena',4,9),
	('Aisha', 8,14)
;



  INSERT INTO tbl_sports
  (sports_grade, sports_location)
  VALUES
  (1,'school gym' ),
  (2,'Fitzgerald field' ),
  (3,'out field' ),
  (4,'basket ball court' ),
  (5,'pavillion ease' ),
  (6,'school gym' ),
  (7,'sand point' ),
  (8,'magnusson' )
;




SELECT
		a1.students_name, a1.students_grade 
		FROM tbl_students a1
		INNER JOIN tbl_sports a2 ON a2.sports_id = a1.students_id
		
		WHERE sports_location = 'school gym'
;