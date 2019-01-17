PRINT 'Hello World!'




DECLARE @myVariable INT
SET @myVariable= 6
PRINT @myVariable


Declare @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5


PRINT 'I have '+ CONVERT(varchar(50),@var1) + ' dollars' /***convert the int to string*/

PRINT 'Variable 1 =' +CONVERT(varchar(5),@var1)+ CHAR(13)+ 'Variable 2 =' + CONVERT(varchar(5),@var2) +CHAR(13) + 'TOtal:'

PRINT @var1 + @var2

IF @var1 <= 3
  BEGIN
     PRINT'Variable 1 <= '+ CONVERT(varchar(5),@var1) + CHAR (13)
  END
ELSE 
  BEGIN
       PRINT'Variable 1 iss not < '+ CONVERT(varchar(5),@var1) + CHAR (13)
  END
