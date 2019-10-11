ALTER PROCEDURE usp_TestTransaction
@TheMessageToSave NVARCHAR(255) = N'Default Message'
AS
BEGIN TRY
	-- We need a random number to create the fail condition
	DECLARE @RandomInteger INT

	-- This number needs to be from 0 - 100 inclusive
	-- We can use SQL's built in RAND function to do this
	-- Here's Pinal Dave's nice post on this: 
	-- https://blog.sqlauthority.com/2007/04/29/sql-server-random-number-generator-script-sql-query/
	SET @RandomInteger = CONVERT(INT, (100+1)*RAND())

	BEGIN TRANSACTION

		-- write data to the two tables
		INSERT SampleOrder(Message, DateRecorded)
		VALUES (@TheMessageToSave, GETUTCDATE());
		
		INSERT SampleShippingRequest(Message, DateRecorded)
		VALUES (@TheMessageToSave, GETUTCDATE());

		-- check for the fail status to simulate an error somewhere
		-- feel free to try different values here (like 90)
		-- if under or equal to 25 fail occurs
		IF @RandomInteger <= 25 
		BEGIN
			PRINT 'Error criteria matched';

			-- here we raise the error to cause the rollback
			-- severity of 11 or above will cause the jump to catch block
			RAISERROR(	N'FAIL condition occurred: RandomInteger value was %d.',
						11,
						1,
						@RandomInteger);
		END 
	COMMIT
END TRY
BEGIN CATCH
	
	ROLLBACK
	PRINT 'In Catch Block - ROLLBACK Occurred'
	
END CATCH
