
SELECT *
FROM MegsEmployees

-- Try to remove Bob
DELETE  FROM MegsEmployees
WHERE Salary IS NULL





-- DTL Transactions


-- single transaction just do Sally  ******




-- ROLLBACK







-- do multiiple transactions: add a salesperson and add an order for that person
  
  
  






-- As a Stored Procedure  with ROLLBACK

CREATE PROCEDURE InsertNewOrder
    @OrderDate DATE,
    @CustomerID INT,
    @Quantity INT,
    @Book_ID INT
AS
BEGIN
    -- Start a transaction
    BEGIN TRANSACTION;

    DECLARE @NewOrderID NVARCHAR(10);

    BEGIN TRY
        -- Generate the new Order ID
        SET @NewOrderID = 'MB' + CAST((ISNULL((SELECT MAX(CAST(SUBSTRING(orderID, 3, LEN(orderID) - 2) AS INT)) 
                                                  FROM dbo.MegsOrders), 0) + 1) AS NVARCHAR(10));

        -- Insert a new order
        INSERT INTO dbo.MegsOrders (orderID, OrderDate, CustomerID, SalespersonID, Quantity, Book_ID)
        VALUES (@NewOrderID, @OrderDate, @CustomerID, NULL, @Quantity, @Book_ID);  -- Assuming SalespersonID is optional and can be NULL

        -- Commit the transaction if all commands are successful
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- If an error occurs, roll back the transaction
        ROLLBACK TRANSACTION;

        -- Optionally, you can log the error or re-throw it
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;




-- Bank account example


-- Here's a simple example of a SQL transaction that transfers money between two bank accounts. We'll assume you have a table named `Accounts` with columns for `AccountID` and `Balance`. The transaction will move money from one account to another while ensuring that the operation is completed successfully.

--### Table Structure
--Let's assume the table structure looks like this:
--```sql
--CREATE TABLE Accounts (
--    AccountID INT PRIMARY KEY,
--    Balance DECIMAL(18, 2)
--);
--```

--### Initial Data Setup
--Let's populate the table with two accounts for the example:
--```sql
INSERT INTO Accounts (AccountID, Balance)
VALUES (1, 1000.00),  -- Account 1 with $1000
       (2, 500.00);   -- Account 2 with $500
```

--### Transaction Example
--Here is the transaction to transfer $200 from Account 1 to Account 2. The process will ensure that both accounts are updated only if the transaction succeeds.


BEGIN TRANSACTION;

-- Step 1: Deduct $200 from Account 1
UPDATE Accounts
SET Balance = Balance - 200
WHERE AccountID = 1;

-- Step 2: Check if the deduction was successful and if Account 1 has sufficient funds
IF @@ERROR <> 0 OR (SELECT Balance FROM Accounts WHERE AccountID = 1) < 0
BEGIN
    ROLLBACK;  -- Undo any changes if there's an error or insufficient funds
    PRINT 'Transaction failed. Insufficient funds or error in deduction.';
END
ELSE
BEGIN
    -- Step 3: Add $200 to Account 2
    UPDATE Accounts
    SET Balance = Balance + 200
    WHERE AccountID = 2;

    -- Step 4: Check if the addition was successful
    IF @@ERROR <> 0
    BEGIN
        ROLLBACK;  -- Undo the transaction if there's an error adding the amount to Account 2
        PRINT 'Transaction failed. Error in adding funds.';
    END
    ELSE
    BEGIN
        COMMIT;  -- Commit the transaction if everything was successful
        PRINT 'Transaction completed successfully.';
    END
END
```

### Explanation
1. **BEGIN TRANSACTION**: Starts the transaction block.
2. **Update Account 1**: Deducts $200 from Account 1.
3. **Check for Errors**: Verifies that there were no errors and that Account 1 has enough funds.
   - If there is an error or insufficient funds, the transaction is rolled back.
4. **Update Account 2**: Adds $200 to Account 2.
5. **Final Error Check**: Ensures that the amount was successfully added to Account 2.
6. **COMMIT or ROLLBACK**: If all operations are successful, commit the transaction; otherwise, roll back the changes.

### Benefits of this Approach
- **Data Integrity**: Ensures that money is deducted from one account only if it can be successfully added to the other.
- **Error Handling**: Automatically rolls back changes if any step fails, leaving the database in its original state.
- **Atomic Operation**: Guarantees that all operations succeed together or fail together.

This example illustrates the use of transactions in SQL to handle data consistency in scenarios involving multiple operations.