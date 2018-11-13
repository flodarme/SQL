CREATE DATABASE dbLMS   /*Create the LMS database*/



/******************************************************
	 * Build database tables and define  schema
	 ***************************************************/
	CREATE TABLE LIBRARY_BRANCHES (
		BranchID VARCHAR(30) PRIMARY KEY NOT NULL,
		BranchName VARCHAR(50) NOT NULL,
		Address VARCHAR(50) NOT NULL,
	);
	

	CREATE TABLE PUBLISHER(
		PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
		Address VARCHAR(50) NOT NULL,
		Phone VARCHAR(50) NOT NULL
	);


	CREATE TABLE BOOKS (
		BookID VARCHAR(30) PRIMARY KEY NOT NULL,
		Title  VARCHAR(50)  NOT NULL,
		PublisherName VARCHAR(50) NOT NULL CONSTRAINT FK_PublisherName FOREIGN KEY REFERENCES PUBLISHER (PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
	);

	CREATE TABLE BOOK_AUTHORS (
	    AuthorID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BookID  VARCHAR(30)  CONSTRAINT FK_BookID_1 FOREIGN KEY REFERENCES BOOKS (BookID) ON UPDATE CASCADE ON DELETE CASCADE, 
		AuthorName VARCHAR(50) NOT NULL
	);

	CREATE TABLE BOOK_COPIES (
	    CopyID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BookID VARCHAR (30) NOT NULL CONSTRAINT FK_BookID_2 FOREIGN KEY REFERENCES BOOKS (BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID VARCHAR (30) NOT NULL CONSTRAINT FK_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCHES (BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		Number_Of_Copies INT NOT NULL
	);

	CREATE TABLE BORROWER (
		CardNo INT PRIMARY KEY NOT NULL,
		Name  VARCHAR (50) NOT NULL,
		Address VARCHAR (50) NOT NULL,
		Phone VARCHAR (30) NOT NULL
	);
	
	CREATE TABLE BOOK_LOANS (
	    LoanID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BookID VARCHAR(30) NOT NULL CONSTRAINT FK_BookID_3 FOREIGN KEY REFERENCES BOOKS (BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID VARCHAR(30) NOT NULL CONSTRAINT FK_BranchID_2 FOREIGN KEY REFERENCES LIBRARY_BRANCHES (BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		CardNo INT NOT NULL CONSTRAINT FK_CardNo FOREIGN KEY REFERENCES BORROWER (CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		DateOut DATE NOT NULL,
		DateDue DATE NOT NULL
	);

	

	
	/***************************
	 * Populate Tables
	 **************************/

	INSERT INTO LIBRARY_BRANCHES
	(BranchID,BranchName, Address)
	VALUES 
	('86815','Sharpstown','39 Main Street'),
	('01781','Central','53 Main Street South'),
	('25243','Aberaeron','142 Main Street West'),
    ('83711','Aberlour','1 Main Street North')
	;
	
		

	INSERT INTO PUBLISHER
	(PublisherName, Address, Phone)
	VALUES 
	('Offieors Publishing','142 Main Street West','207-708-0307'),
	('Siieisis Books','214 High Street','201-437-4626'),
	('Petrolliors Press','53 Main Street South','205-377-7347'),
	('Bateroble Publishing','177 Elm Street','203-544-7441'),
	('Gemeerck Group','176 Washington Street','206-672-8786'),
	('Mixoble Books','1 Main Street North',N'208-528-7858'),
	('Misoican Publishing','39 Main Street','204-678-1711'),
	('Cellierck Press','191 Church Street','202-794-1745')
	;
	
		

	INSERT INTO BOOKS 
	(BookID, Title, PublisherName)
	VALUES
	('013-4-11-35109-9','Blue Gift', 'Offieors Publishing'),
	('683-1-48-73513-7','Time of Silence','Siieisis Books'),
	('761-6-85-48686-3','The Lost Tribe' ,'Petrolliors Press'),
	('845-0-21-04838-4','Threat of times','Bateroble Publishing'),
	('004-1-63-77730-9','No Reservations','Gemeerck Group'),
	('696-3-35-63903-7','Grey Matter','Petrolliors Press'),
	('717-6-94-58503-2','Dances With Wolves','Mixoble Books'),
	('189-3-33-62526-0','Ananse the Spider','Gemeerck Group'),
	('272-5-86-57463-2','Charlotte Spins a Web','Offieors Publishing'),
	('564-8-02-94242-3','Pied Pier','Gemeerck Group'),
	('488-7-37-27831-5','Bridged Freedom','Misoican Publishing'),
	('703-2-84-83109-3','Praises','Bateroble Publishing'),
	('098-1-76-44121-4','Ella goes to Bed','Siieisis Books'),
	('075-5-45-54167-7','Thandi in Town','Cellierck Press'),
	('442-9-35-30784-7','Great Legends in the Galaxy','Cellierck Press'),
	('113-4-12-35109-9','Many Rivers to Cross', 'Offieors Publishing'),
	('583-1-48-70515-7','Bedtime Stories','Siieisis Books'),
	('142-6-65-52686-3','Cupcakes' ,'Petrolliors Press'),
	('548-0-21-38048-4','Democracy Now','Bateroble Publishing'),
	('400-1-63-30777-9','Silence of the Lambs','Gemeerck Group'),
	('426-3-35-90362-7','No Mountain High','Petrolliors Press'),
	('947-6-94-55503-2','The Recital','Mixoble Books')
	;
	

	

	INSERT INTO BOOK_AUTHORS 
	(BookID, AuthorName)

	VALUES
	('013-4-11-35109-9','Ella Reyes'),
	('683-1-48-73513-7','Anna Lee'),
	('761-6-85-48686-3','Ella Reyes'),
	('845-0-21-04838-4','Stephen King'),
	('004-1-63-77730-9','Ella Reyes'),
	('696-3-35-63903-7','Lily Carter'),
	('717-6-94-58503-2','Samantha Sanchez'),
	('189-3-33-62526-0','Stephen King'),
	('272-5-86-57463-2','Stephen King'),
	('564-8-02-94242-3','Savannah Perezp'),
	('488-7-37-27831-5','Eliana Richardson'),
	('703-2-84-83109-3','Anna Lee'),
	('098-1-76-44121-4','Adeline Brown'),
	('075-5-45-54167-7','Anna Lee'),
	('442-9-35-30784-7','Piper Edwards'),
	('113-4-12-35109-9','Savannah Perez'),
	('583-1-48-70515-7','Ella Reyes'),
	('142-6-65-52686-3','Savannah Perez'),
	('548-0-21-38048-4','Piper Edwards'),
	('400-1-63-30777-9','Emma Hernandez'),
	('426-3-35-90362-7','Anna Lee'),
	('947-6-94-55503-2','Ella Reyes')
	;
	
	

	INSERT INTO BOOK_COPIES 
	(BookID, BranchID, Number_Of_Copies)

	VALUES
	('013-4-11-35109-9', '86815',3),
	('683-1-48-73513-7', '86815',2),
	('761-6-85-48686-3', '86815',4),
	('845-0-21-04838-4', '01781',6),
	('004-1-63-77730-9', '01781',5),
	('696-3-35-63903-7', '86815',6),
	('717-6-94-58503-2', '86815',8),
	('189-3-33-62526-0', '01781',10),
	('272-5-86-57463-2', '01781',8),
    ('272-5-86-57463-2', '01781',7),
    ('564-8-02-94242-3', '01781',6),
	('488-7-37-27831-5', '01781',5),
	('703-2-84-83109-3', '01781',4),
	('098-1-76-44121-4', '01781',2),
	('075-5-45-54167-7', '01781',10),
	('442-9-35-30784-7', '86815',5),
	('442-9-35-30784-7','86815',4),
	('113-4-12-35109-9','01781',5),
	('583-1-48-70515-7','86815',7),
	('142-6-65-52686-3','01781',6),
	('548-0-21-38048-4','01781',7),
	('400-1-63-30777-9','86815',10),
	('426-3-35-90362-7','86815',9),
	('947-6-94-55503-2','86815',8),
	('013-4-11-35109-9', '01781',3),
	('683-1-48-73513-7', '01781',2),
	('761-6-85-48686-3', '86815',4),
	('845-0-21-04838-4', '86815',6),
	('004-1-63-77730-9', '86815',5),
	('696-3-35-63903-7', '01781',6),
	('717-6-94-58503-2', '01781',8),
	('189-3-33-62526-0', '86815',10),
	('272-5-86-57463-2', '86815',8),
	('272-5-86-57463-2', '86815',7),
	('564-8-02-94242-3', '86815',6),
	('488-7-37-27831-5', '86815',5),
	('442-9-35-30784-7','25243',4),
	('113-4-12-35109-9','83711',5),
	('583-1-48-70515-7','25243',7),
	('142-6-65-52686-3','83711',6),
	('548-0-21-38048-4','25243',7),
	('400-1-63-30777-9','83711',10),
	('426-3-35-90362-7','25243',9),
	('947-6-94-55503-2','83711',8),
	('013-4-11-35109-9', '25243',3),
	('683-1-48-73513-7', '83711',2),
	('761-6-85-48686-3', '25243',4),
	('845-0-21-04838-4', '83711',6),
	('004-1-63-77730-9', '25243',5),
	('696-3-35-63903-7', '83711',6),
	('717-6-94-58503-2', '25243',8),
	('189-3-33-62526-0', '83711',10),
	('272-5-86-57463-2', '25243',8),
	('272-5-86-57463-2', '83711',7),
	('564-8-02-94242-3', '25243',6),
	('488-7-37-27831-5', '83711',5)
	;
	
	
	

	INSERT INTO BOOK_LOANS 
    (BookID, BranchID, CardNo, DateOut, DateDue)

	VALUES
	('013-4-11-35109-9', '86815', 460 , 2018-01-03, 2018-01-27),
	('683-1-48-73513-7', '86815', 463 , 2018-09-12, 2018-9-29),
	('761-6-85-48686-3', '86815', 463,  2018-01-03, 2018-01-27),
	('845-0-21-04838-4', '01781', 460,  2018-11-01, 2018-11-15),
	('004-1-63-77730-9', '01781', 236 , 2018-09-12, 2018-9-29),
	('696-3-35-63903-7', '86815', 460 , 2018-11-01, 2018-11-15),
	('717-6-94-58503-2', '86815', 373 , 2018-09-12, 2018-9-29),
	('189-3-33-62526-0', '01781', 463 , 2018-01-03, 2018-01-27),
	('272-5-86-57463-2', '01781', 463 , 2018-01-03, 2018-01-27),
    ('272-5-86-57463-2', '01781', 463 , 2018-09-01, 2018-09-15),
    ('564-8-02-94242-3', '01781', 460,  2018-09-01, 2018-09-15),
	('488-7-37-27831-5', '01781', 236 , 2018-09-01, 2018-09-15),
	('703-2-84-83109-3', '01781', 373 , 2018-10-01, 2018-10-15),
	('098-1-76-44121-4', '01781', 373,  2018-01-03, 2018-01-27),
	('075-5-45-54167-7', '01781', 463 , 2018-09-01, 2018-09-15),
	('442-9-35-30784-7', '86815', 236 , 2018-10-03, 2018-10-27),
	('442-9-35-30784-7','86815', 463 ,  2018-01-03, 2018-01-27),
	('113-4-12-35109-9','01781', 463 ,  2018-01-03, 2018-01-27 ),
	('583-1-48-70515-7','86815', 460 ,  2018-10-01, 2018-10-15),
	('142-6-65-52686-3','01781', 236 ,  2018-09-01, 2018-09-15),
	('548-0-21-38048-4','01781', 373 ,  2018-09-01, 2018-09-15),
	('400-1-63-30777-9','86815', 373 ,  2018-01-03, 2018-01-27),
	('426-3-35-90362-7','86815', 236 ,  2018-09-12, 2018-9-29),
	('947-6-94-55503-2','86815', 460 ,  2018-11-01, 2018-11-15),
	('013-4-11-35109-9','01781', 259 ,  2018-01-03, 2018-01-27),
	('683-1-48-73513-7','01781', 460 ,  2018-01-03, 2018-01-27),
	('761-6-85-48686-3','01781', 148,   2018-09-01, 2018-09-15),
	('845-0-21-04838-4','01781', 259 ,  2018-01-03, 2018-01-27),
	('004-1-63-77730-9','01781', 148,   2018-09-12, 2018-9-29),
	('696-3-35-63903-7','01781', 426 ,  2018-01-03, 2018-01-27),
	('717-6-94-58503-2','01781', 148 ,  2018-10-01, 2018-10-15),
	('189-3-33-62526-0','01781', 271,   2018-11-01, 2018-11-15),
	('272-5-86-57463-2','01781', 236 ,  2018-01-03, 2018-01-27),
	('272-5-86-57463-2','01781', 426 ,  2018-10-01, 2018-10-15),
	('564-8-02-94242-3','01781', 271,   2018-01-03, 2018-01-27),
	('488-7-37-27831-5','01781', 271,   2018-01-03, 2018-01-27),
	('442-9-35-30784-7','25243',  222,  2018-01-03, 2018-01-27),
	('113-4-12-35109-9','83711', 460 ,  2018-01-03, 2018-01-27),
	('583-1-48-70515-7','25243', 271,   2018-10-01, 2018-10-15),
	('142-6-65-52686-3','83711', 222,   2018-09-12, 2018-9-29),
	('548-0-21-38048-4','25243', 181,   2018-01-03, 2018-01-27),
	('400-1-63-30777-9','83711', 181,   2018-01-03, 2018-01-27),
	('426-3-35-90362-7','25243', 181,   2018-01-03, 2018-01-27),
	('947-6-94-55503-2','83711', 181,   2018-11-01, 2018-11-15),
	('013-4-11-35109-9', '25243', 181,  2018-10-01, 2018-10-15),
	('683-1-48-73513-7', '83711', 181,  2018-01-03, 2018-01-27),
	('761-6-85-48686-3', '25243', 181,  2018-01-03, 2018-01-27),
	('845-0-21-04838-4', '83711', 222,  2018-01-03, 2018-01-27),
	('004-1-63-77730-9', '25243', 271,  2018-10-01, 2018-10-15),
	('696-3-35-63903-7', '83711', 222,  2018-01-03, 2018-01-27),
	('717-6-94-58503-2', '25243', 222,  2018-09-12 ,2018-9-29),
	('189-3-33-62526-0', '83711', 271,  2018-01-03, 2018-01-27),
	('272-5-86-57463-2', '25243', 181,  2018-11-01, 2018-11-15),
	('272-5-86-57463-2', '83711', 271,  2018-09-01, 2018-09-15),
	('564-8-02-94242-3', '25243', 181,  2018-11-01, 2018-11-15),
	('488-7-37-27831-5', '83711', 222,  2018-09-12, 2018-9-29)
	;

	


	/****************************************
	*
	* BEGIN STORED PROCEDURES
	*
	***************************************/

	/**********************************************************************************************************************************
	*How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? BranchID = 86815*
	***********************************************************************************************************************************/
	BEGIN

		SELECT  B.Title, LB.BranchID, BC.Number_Of_Copies
		FROM BOOKS AS B INNER JOIN BOOK_COPIES AS BC
		ON B.BookId = BC.BookId
		INNER JOIN LIBRARY_BRANCHES AS LB
		ON BC.BranchID = LB.BranchId
		WHERE Title = 'The Lost Tribe' AND LB.BranchName = 'Sharpstown'
     ;
	 END


	/******************************************************************************************
	*How many copies of the book titled "The Lost Tribe" are owned by each library branch?
	******************************************************************************************/
	BEGIN
		
		SELECT B.Title, LB.BranchID, LB.BranchID, BC.Number_Of_Copies
			FROM BOOKS AS B INNER JOIN BOOK_COPIES AS BC
			ON B.BookId = BC.BookId
			INNER JOIN LIBRARY_BRANCHES AS LB
			ON BC.BranchID = LB.BranchId
			WHERE Title = 'The Lost Tribe'
	    ;
    END
	/****************************************************************************/
	/* Retrieve the names of all borrowers who do not have any books checked out.*/
	/****************************************************************************/

	BEGIN	
	SELECT B.Name, B.CardNo, BL.BookID, BL.DateDue
		FROM BORROWER AS B LEFT OUTER JOIN BOOK_LOANS AS BL
		ON B.CardNo = BL.CardNo
		WHERE BL.CardNo IS NULL
	;
	END
	


	/*******************************************************************************************************************************************************************/
	/* For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address 
	*********************************************************************************************************************************************************************/

	BEGIN
		SELECT BOOKS.Title, B.Name, B.Address
			FROM Book_Loans AS BL INNER JOIN LIBRARY_BRANCHES AS LB
			ON BL.BranchId = LB.BranchId
			INNER JOIN BOOKS
			ON BL.BookId = BOOKS.BookId
			INNER JOIN BORROWER AS B
			ON B.CardNo = BL.CardNo
			WHERE LB.BranchName = 'Sharpstown' AND BL.DateDue = '2018-11-13'
		;
	END
  
	/*******************************************************************************************************************************************************************/
	/* For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
	*********************************************************************************************************************************************************************/
	BEGIN
		SELECT LB.BranchName, COUNT(LB.BranchId) AS NumberOfBooks
			FROM LIBRARY_BRANCHES AS LB INNER JOIN BOOK_LOANS AS BL
			ON LB.BranchId = BL.BranchId 
			GROUP BY BranchName
		;
	END
	/*******************************************************************************************************************************************************************/
	/* Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.
	*********************************************************************************************************************************************************************/
	BEGIN	
		SELECT B.Name, B.Address, COUNT(BL.CardNo) AS NumberOfBooks
		FROM BOOK_LOANS AS BL INNER JOIN BORROWER AS B
		ON BL.CardNo = B.CardNo
		GROUP BY Name, Address
		HAVING COUNT(BL.CardNo) > 5
	;
	END

	/*******************************************************************************************************************************************************************/
	/* For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/
	/*******************************************************************************************************************************************************************/
	BEGIN

		SELECT BOOKS.Title, BC.Number_Of_Copies
			FROM BOOKS INNER JOIN BOOK_COPIES AS BC
			ON BOOKS.BookId = BC.BookId
			INNER JOIN LIBRARY_BRANCHES AS LB
			ON BC.BranchID = LB.BranchId
			INNER JOIN BOOK_AUTHORS AS BA
			ON BOOKS.BookId = BA.BookId
			WHERE LB.BranchName = 'Central' 
			AND BA.AuthorName = 'Stephen King'
		;
	END


	/****************************************
	*
	* END STORED PROCEDURES
	*
	***************************************/

