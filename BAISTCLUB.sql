CREATE DATABASE BAISTClubDatabase
GO
USE BAISTClubDatabase
GO

CREATE TABLE DailyReservationSheet
(
Date Date CONSTRAINT PKDate PRIMARY KEY,
DayofWeek NVARCHAR(9) NOT NULL
)

CREATE TABLE Member
(
	MemberNumber INT CONSTRAINT PKMemberID PRIMARY KEY IDENTITY(1,1),
	MembershipLevel VARCHAR(6) NOT NULL,
	MembershipTier VARCHAR(30)NOT NULL,
	MemberName NVARCHAR(50) NOT NULL,
	Password NVARCHAR(100) NOT NULL,
	IsShareHolder BIT NOT NULL,
	Sex CHAR NOT NULL,
	Standing CHAR NOT NULL,
	Handicap FLOAT NOT NULL
)

CREATE TABLE Application
(
	ApplicationID INT IDENTITY(1,1) PRIMARY KEY,
	LastName NVARCHAR(25) NOT NULL,
	FirstName NVARCHAR(24) NOT NULL,
	Address NVARCHAR(MAX) NOT NULL,
	PostalCode VARCHAR(7) NOT NULL,
	Phone VARCHAR(15) NOT NULL,
	AltPhone VARCHAR(15) NOT NULL,
	Email NVARCHAR(50) NOT NULL,
	BirthDate DATE NOT NULL,
	Occupation VARCHAR(50) NOT NULL,
	CompanyName NVARCHAR(50) NOT NULL,
	CompanyAddress NVARCHAR(MAX) NOT NULL,
	CompanyPostalCode VARCHAR(7) NOT NULL,
	CompanyPhone VARCHAR(20) NOT NULL,
	SubmitDate DATE NOT NULL,
	Sex CHAR(1) NOT NULL,
	Password NVARCHAR(100) NOT NULL,
	WantsShare BIT NOT NULL,
	IsAccepted BIT NOT NULL,
	IsDenied BIT NOT NULL,
	IsWaitlisted BIT NOT NULL,
	IsOnhold BIT NOT NULL,
	ShareholderName1 NVARCHAR(50) NOT NULL,
	ShareholderDate1 DATE NOT NULL,
	ShareholderName2 NVARCHAR(50) NOT NULL,
	ShareholderDate2 DATE NOT NULL
)


CREATE TABLE TeeTime
(
	Date Date CONSTRAINT FKDATE FOREIGN KEY REFERENCES DailyReservationSheet(Date),
	Time Time(0),
	MemberNumber INT CONSTRAINT FKMemberID FOREIGN KEY REFERENCES Member(MemberNumber),
	MemberName1 NVARCHAR(20) NOT NULL,
	MemberName2 NVARCHAR(20),
	MemberName3 NVARCHAR(20),
	MemberName4 NVARCHAR(20),
	NumberOfPlayers INT NOT NULL,
	PhoneNumber VARCHAR(15) NOT NULL,
	NumberOfCarts INT NOT NULL,
	BookingDate DATE NOT NULL,
	BookingTime Time(0) NOT NULL,
	EmployeeName NVARCHAR(20)
	PRIMARY KEY (Date,Time)
)


CREATE TABLE StandingReservation
(
	Year INT,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	RequestedTime TIME(0) NOT NULL,
	DayOfWeek NVARCHAR(9) NOT NULL,
	MemberNumber1 INT FOREIGN KEY REFERENCES Member(MemberNumber),
	MemberNumber2 INT FOREIGN KEY REFERENCES Member(MemberNumber),
	MemberNumber3 INT FOREIGN KEY REFERENCES Member(MemberNumber),
	MemberNumber4 INT FOREIGN KEY REFERENCES Member(MemberNumber),
	MemberName1 NVARCHAR(50) NOT NULL,
	MemberName2 NVARCHAR(50) NOT NULL,
	MemberName3 NVARCHAR(50) NOT NULL,
	MemberName4 NVARCHAR(50) NOT NULL,
	IsCanceled BIT NOT NULL
	PRIMARY KEY(Year,MemberNumber1)
)
GO

CREATE TABLE Account
(
	AccountID INT PRIMARY KEY IDENTITY(1,1),
	MemberNumber INT FOREIGN KEY REFERENCES Member,
	CurrentBalance MONEY NOT NULL
)

CREATE TABLE Transactions
(
	TransactionID INT IDENTITY(1,1),
	AccountID INT FOREIGN KEY REFERENCES Account,
	PostDate DATE NOT NULL,
	ActivityDate DATE NOT NULL,
	Description VARCHAR(100) NOT NULL,
	Amount MONEY NOT NULL,
	PRIMARY KEY (TransactionID,AccountID)
)


CREATE TABLE Score
(
	ScoreID INT PRIMARY KEY IDENTITY(1,1),
	MemberNumber INT FOREIGN KEY REFERENCES Member(MemberNumber),
	Tee NVARCHAR(5) NOT NULL,
	DateTime DATETIME,
	Hole1 INT NOT NULL,
	Hole2 INT NOT NULL,
	Hole3 INT NOT NULL,
	Hole4 INT NOT NULL,
	Hole5 INT NOT NULL,
	Hole6 INT NOT NULL,
	Hole7 INT NOT NULL,
	Hole8 INT NOT NULL,
	Hole9 INT NOT NULL,
	Hole10 INT,
	Hole11 INT,
	Hole12 INT,
	Hole13 INT,
	Hole14 INT,
	Hole15 INT,
	Hole16 INT,
	Hole17 INT,
	Hole18 INT,
	Total INT NOT NULL,
	HandicapDifferential FLOAT
)

GO

CREATE TABLE HandicapReport
(
	Month INT,
	Year INT
	PRIMARY KEY(Month,Year)
)

CREATE TABLE MonthlyHandicap
(
	Month INT,
	Year INT,
	MemberNumber INT FOREIGN KEY REFERENCES Member,
	Handicap FLOAT NOT NULL,
	Average FLOAT NOT NULL,
	BestAverage FLOAT NOT NULL,

	FOREIGN KEY ([Month],[Year])
	REFERENCES HandicapReport([Month],[Year]),
	PRIMARY KEY (Month,Year,MemberNumber)
)

GO
CREATE PROCEDURE AddScore(@MemberNumber INT = NULL,@Tee NVARCHAR(5) = NULL,@Hole1 INT = NULL,@Hole2 INT = NULL,@Hole3 INT = NULL,@Hole4 INT = NULL,@Hole5 INT = NULL,@Hole6 INT = NULL,
@Hole7 INT = NULL,@Hole8 INT = NULL,@Hole9 INT = NULL,@Hole10 INT,@Hole11 INT,@Hole12 INT,@Hole13 INT,@Hole14 INT,@Hole15 INT,@Hole16 INT,@Hole17 INT,@Hole18 INT,@Total INT = NULL,
@HandicapDifferential FLOAT)
AS
DECLARE @ReturnCode INT = 1

IF @MemberNumber IS NULL
	RAISERROR('AddScore Error - Missing parameter @MemberNumber',16,1)
ELSE IF @Tee IS NULL
	RAISERROR('AddScore Error - Missing parameter @Tee',16,1)
ELSE IF @Hole1 IS NULL
	RAISERROR('AddScore Error - Missing parameter @Hole1',16,1)
ELSE IF @Hole2 IS NULL
	RAISERROR('AddScore Error - Missing parameter @Hole2',16,1)
ELSE IF @Hole3 IS NULL
	RAISERROR('AddScore Error - Missing parameter @Hole3',16,1)
ELSE IF @Hole4 IS NULL
	RAISERROR('AddScore Error - Missing parameter @Hole4',16,1)
ELSE IF @Hole5 IS NULL
	RAISERROR('AddScore Error - Missing parameter @Hole5',16,1)
ELSE IF @Hole6 IS NULL
	RAISERROR('AddScore Error - Missing parameter @Hole6',16,1)
ELSE IF @Hole7 IS NULL
	RAISERROR('AddScore Error - Missing parameter @Hole7',16,1)
ELSE IF @Hole8 IS NULL
	RAISERROR('AddScore Error - Missing parameter @Hole8',16,1)
ELSE IF @Hole9 IS NULL
	RAISERROR('AddScore Error - Missing parameter @Hole9',16,1)
ELSE IF @Total IS NULL
	RAISERROR('AddScore Error - Missing parameter @Total',16,1)
ELSE
	BEGIN
	INSERT INTO Score
	VALUES(@MemberNumber,@Tee,GETDATE(),@Hole1,@Hole2,@Hole3,@Hole4,@Hole5,@Hole6,@Hole7,@Hole8,@Hole9,
	@Hole10,@Hole11,@Hole12,@Hole13,@Hole14,@Hole15,@Hole16,@Hole17,@Hole18,@Total,@HandicapDifferential)
	EXEC ProcessCurrentHandicapFactor @MemberNumber
	IF @@ERROR = 0
	SET @ReturnCode = 0
	ELSE
		RAISERROR('AddScore Error - INSERT ERROR',16,1)
	END
RETURN @ReturnCode	

GO
CREATE PROCEDURE AddReservation(@Date DATE = NULL)
AS
DECLARE @ReturnCode INT
SET @ReturnCode = 1
DECLARE @DayName NVARCHAR(9)
SET @DayName = DATENAME(WEEKDAY,@Date)

IF @Date IS NULL
	RAISERROR('AddReservation error - Required parameter @Date',16,1)
ELSE
	BEGIN
	INSERT INTO DailyReservationSheet
	VALUES(@Date,@DayName)

	
	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
	RAISERROR('AddReservation error - INSERT ERROR',16,1)
	END
	EXECUTE CheckStandingReservations @DayName,@Date
RETURN @ReturnCode
go


CREATE PROCEDURE AddTeeTime(@Date date  = NULL,@Time TIME(0) = NULL,@MemberNumber INT = NULL,@MemberName1 NVARCHAR(20) = NULL,@MemberName2 NVARCHAR(20),@MemberName3 NVARCHAR(20),@MemberName4 NVARCHAR(20),@NumberOfPlayers INT = NULL,@PhoneNumber VARCHAR(15) = NULL,
@NumberOfCarts INT = NULL,@EmployeeName NVARCHAR(20) = NULL)
AS
DECLARE @ReturnCode INT
SET @ReturnCode = 1
DECLARE @Now AS DATETIME
SET @Now = GETDATE()
DECLARE @MembershipLevel VARCHAR(6)
DECLARE @NumMem INT
DECLARE @Good Bit
SET @Good = 0
DECLARE @MEM1 NVARCHAR(20)
DECLARE @MEM2 NVARCHAR(20)
DECLARE @MEM3 NVARCHAR(20)
DECLARE @MEM4 NVARCHAR(20)

IF @Date IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @Date',16,1)
ELSE IF @Time IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @Time',16,1)
ELSE IF @MemberNumber IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @MemberID',16,1)
ELSE IF @NumberofPlayers IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @NumberOfPlayers',16,1)
ELSE IF @PhoneNumber IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @PhoneNumber',16,1)
ELSE IF @NumberOfCarts IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @NumberOfCarts',16,1)
ELSE IF @MemberName1 IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @MemberName1',16,1)
ELSE
	BEGIN
	IF DATEDIFF(day,@Now,@Date) > 7 OR DATEDIFF(day,@Now,@Date) < 0
		RAISERROR('AddTeeTime error - Cannot make a reservation that far ahead',16,1)
	ELSE
		BEGIN
		SET @MembershipLevel = (SELECT MembershipLevel FROM Member WHERE MemberNumber = @MemberNumber)

		IF @MembershipLevel = 'Gold'
			SET @Good = 1
		ELSE IF @MembershipLevel = 'Silver' AND @Good = 0
			BEGIN
			IF (DATENAME(WEEKDAY,@Date) != 'Saturday' AND DATENAME(WEEKDAY,@Date) != 'Sunday') AND (@Time < '17:30:00' AND @Time > '15:00:00')
				RAISERROR('AddTeeTime error - Cannot reserve at that time',16,1)
			ELSE IF (DATENAME(WEEKDAY,@Date) = 'Saturday' OR DATENAME(WEEKDAY,@Date) = 'Sunday') AND @Time < '11:00:00'
				RAISERROR('AddTeeTime error - Cannot reserve at that time',16,1)
			ELSE
				SET @Good = 1
			END
		ELSE IF @MemberShipLevel = 'Bronze' AND @Good = 0
			BEGIN
			IF (DATENAME(WEEKDAY,@Date) != 'Saturday' AND DATENAME(WEEKDAY,@Date) != 'Sunday') AND (@Time < '18:00:00' AND @Time > '15:00:00')
				RAISERROR('AddTeeTime error - Cannot reserve at that time',16,1)
			ELSE IF (DATENAME(WEEKDAY,@Date) = 'Saturday' OR DATENAME(WEEKDAY,@Date) = 'Sunday') AND @Time < '13:00:00'
				RAISERROR('AddTeeTime error - Cannot reserve at that time',16,1)
			ELSE
				SET @Good = 1
			END
		ELSE IF @MembershipLevel = 'Copper' AND @Good = 0
			RAISERROR('AddTeeTime error - Copper members cannot make reserve teetimes',16,1)
	
		IF @Good = 1	
			BEGIN
				IF NOT EXISTS(SELECT dbo.Reservation.Date FROM Reservation WHERE Date = @Date)
				BEGIN
					EXECUTE AddReservation @Date
				END
				IF EXISTS (SELECT * FROM TeeTime WHERE Date = @Date AND Time = @Time) --if that time is already taken
					BEGIN
						IF EXISTS (SELECT * FROM TeeTime WHERE Date = @Date AND Time = @Time AND (NumberOfPlayers + @NumberOfPlayers) <= 4) -- But if you can fit
							BEGIN
								SELECT @MEM1 = MemberName1, @MEM2 = MemberName2, @MEM3 = MemberName3, @MEM4 = MemberName4,@NumMem = NumberOfPlayers FROM TeeTime WHERE Date = @Date AND Time = @Time
								EXECUTE DealWithNames @MEM1 out, @MEM2 out, @MEM3 out, @MEM4 out, @MemberName1,@MemberName2,@MemberName3,@NumMem
								UPDATE TeeTime SET MemberName1 = @MEM1, MemberName2 = @MEM2,MemberName3 = @MEM3,MemberName4 = @MEM4,NumberOfPlayers = (NumberofPlayers + @NumberOfPlayers) WHERE Date = @Date AND Time = @Time
							END
					END
				ELSE  --if the time was open
					BEGIN
						INSERT INTO TeeTime
						VALUES(@Date,@Time,@MemberNumber,@MemberName1,@MemberName2,@MemberName3,@MemberName4,@NumberOfPlayers,@PhoneNumber,@NumberOfCarts,CONVERT(DATE,@Now),CONVERT(TIME,@Now),@EmployeeName)
						IF @@ERROR = 0
							SET @ReturnCode = 0
						ELSE
							RAISERROR('AddTeeTime error - INSERT ERROR',16,1)
					END
			END
		END
	END
RETURN @ReturnCode
GO


CREATE PROCEDURE AddMember(@MembershipLevel VARCHAR(6) = NULL,@MembershipTier VARCHAR(30) = NULL, @MemberName NVARCHAR(50) = NULL,@Password NVARCHAR(100) = NULL,@IsShareHolder BIT = NULL,
@Sex CHAR = NULL,@Standing CHAR = NULL,@MemberNumber INT OUT)
AS
DECLARE @ReturnCode INT
SET @ReturnCode = 0

IF @MembershipLevel IS NULL
	RAISERROR('AddMember error - Required parameter @MembershipLevel',16,1)
ELSE IF @MemberName IS NULL
	RAISERROR('AddMember error - Required parameter @MemberName',16,1)
ELSE IF @MembershipLevel != 'Gold' AND @MembershipLevel != 'Silver' AND @MembershipLevel != 'Bronze' AND @MembershipLevel != 'Copper'
	RAISERROR('AddMember error - Bad membership level',16,1)
ELSE IF @MembershipTier IS NULL
	RAISERROR('AddMember error - Required parameter @MembershipTier',16,1)
ELSE IF @Password IS NULL
	RAISERROR('AddMember error - Required parameter @Password',16,1)
ELSE IF @IsShareHolder IS NULL
	RAISERROR('AddMember error - Required parameter @IsShareHolder',16,1)
ELSE IF @Sex IS NULL
	RAISERROR('AddMember error - Required parameter @Sex',16,1)
ELSE IF @Standing IS NULL
	RAISERROR('AddMember error - Required parameter @Standing',16,1)
ELSE
	BEGIN
	INSERT INTO Member
	VALUES(@MembershipLevel,@MembershipTier,@MemberName,@Password,@IsShareHolder,@Sex,@Standing,0.0)
	SET @memberNumber = @@IDENTITY
	IF
		@@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('AddMember error - INSERT ERROR',16,1)
	END
RETURN @ReturnCode
GO

CREATE PROCEDURE GetLoginInfo(@MemberNumber INT = NULL, @Password NVARCHAR(100) OUT,@MemberName NVARCHAR(20) OUT, @MembershipLevel VARCHAR(6) OUT,@MembershipTier VARCHAR(30) OUT, @IsShareholder BIT OUT,
@Sex CHAR OUT, @Standing CHAR OUT)
AS
DECLARE @ReturnCode INT
SET @ReturnCode = 1

IF @MemberNumber IS NULL
	RAISERROR('GetLoginInfo error - Required parameter @MemberNumber',16,1)
ELSE
	BEGIN
	SELECT @Password = Password,@MemberName = MemberName, @MembershipLevel = MembershipLevel,@MembershipTier = MembershipTier,@IsShareholder = IsShareHolder,
	@Sex = Sex,@Standing = Standing 
	FROM Member WHERE MemberNumber = @MemberNumber

	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('GetLoginInfo error - SELECT ERROR',16,1)
	END
RETURN @ReturnCode
GO

CREATE PROCEDURE CancelTeeTime(@Date DATE = NULL, @Time TIME = NULL,@MemberNumber INT = NULL)
AS
DECLARE @ReturnCode INT
SET @ReturnCode = 1

IF @Date IS NULL
	RAISERROR('CancelTeeTime error - required parameter @Date',16,1)
ELSE IF @Time IS NULL
	RAISERROR('CancelTeeTime error - required parameter @Time',16,1)
ELSE IF @MemberNumber IS NULL
	RAISERROR('CancelTeeTime error - required parameter @MemberNumber',16,1)
ELSE
	BEGIN
	DELETE FROM TeeTime WHERE Date = @Date and Time = @Time AND MemberNumber = @MemberNumber
	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('CancelTeeTime error - DELETE error',16,1)
	END
RETURN @ReturnCode

GO
CREATE PROCEDURE GetMembersReservations(@MemberNumber INT = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @MemberNumber IS NULL
	RAISERROR('GetMembersReservations error - required parameter @MemberNumber',16,1)
ELSE
	BEGIN
	SELECT Date, Time FROM TeeTime WHERE MemberNumber = @MemberNumber AND Date >= GETDATE()
	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('GetMembersReservations error - SELECT error',16,1)
	END
RETURN @ReturnCode

SELECT * FROM TeeTime
GO

CREATE PROCEDURE DealWithNames(@MemberName1 NVARCHAR(20) OUT, @MemberName2 NVARCHAR(20) = 'EMPTY' OUT, @MemberName3 NVARCHAR(20) = 'EMPTY' OUT, @MemberName4 NVARCHAR(20) = 'EMPTY' OUT, @MemberName5 NVARCHAR(20), @MemberName6 NVARCHAR(20) = 'EMPTY',@MemberName7 NVARCHAR(20) = 'EMPTY',@Num1 INT)
AS

IF @Num1 = 1
	BEGIN
	SET @MemberName2 = @MemberName5
	SET @MemberName3 = @MemberName6
	SET @MemberName4 = @MemberName7
	END
ELSE IF @Num1 = 2
	BEGIN
		SET @MemberName3 = @MemberName5
		SET @MemberName4 = @MemberName6
	END
ELSE IF @Num1 = 3
	BEGIN
		SET @MemberName4 = @MemberName5
	END
RETURN 0
GO

CREATE PROCEDURE AddStandingReservation(@StartDate DATE = NULL,@EndDate DATE = NULL, @RequestedTime Time(0) = NULL,@DayOfWeek NVARCHAR(9) = NULL,@MemberNumber1 INT = NULL, @MemberNumber2 INT = NULL, @MemberNumber3 INT = NULL, @MemberNumber4 INT = NULL, 
@MemberName1 NVARCHAR(20) = NULL, @MemberName2 NVARCHAR(20) = NULL, @MemberName3 NVARCHAR(20) = NULL, @MemberName4 NVARCHAR(20) = NULL)
AS
DECLARE @ReturnCode INT
SET @ReturnCode = 1

IF @StartDate IS NULL
	RAISERROR('AddStandingReservation error - required parameter @StartDate',16,1)
ELSE IF @EndDate IS NULL
	RAISERROR('AddStandingReservation error - required parameter @EndDate',16,1)
ELSE IF @RequestedTime IS NULL
	RAISERROR('AddStandingReservation error - required parameter @RequestedTime',16,1)
ELSE IF @DayOfWeek IS NULL
	RAISERROR('AddStandingReservation error - required parameter @DaySfWeek',16,1)
ELSE IF @MemberNumber1 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberNumber1',16,1)
ELSE IF @MemberNumber2 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberNumber2',16,1)
ELSE IF @MemberNumber3 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberNumber3',16,1)
ELSE IF @MemberNumber4 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberNumber4',16,1)
ELSE IF @MemberName1 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberName1',16,1)
ELSE IF @MemberName2 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberName2',16,1)
ELSE IF @MemberName3 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberName3',16,1)
ELSE IF @MemberName4 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberName4',16,1)
ELSE 
	BEGIN
	INSERT INTO StandingReservation VALUES(DATEPART(YEAR,GETDATE()),@StartDate,@EndDate,@RequestedTime,@DayOfWeek,@MemberNumber1,@MemberNumber2,@MemberNumber3,@MemberNumber4,
	@MemberName1,@MemberName2,@MemberName3,@MemberName4,0)
	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('AddStandingReservation error - INSERT error',16,1)
	END
RETURN @ReturnCode
GO

CREATE PROCEDURE CheckStandingReservations(@Day NVARCHAR(9) = NULL,@Date DATE = NULL)
AS
DECLARE @ReturnCode INT
SET @ReturnCode = 1
DECLARE @Time TIME(0)
DECLARE @MemberNumber INT
DECLARE @MemberName1 NVARCHAR(20)
DECLARE @MemberName2 NVARCHAR(20)
DECLARE @MemberName3 NVARCHAR(20)
DECLARE @MemberName4 NVARCHAR(20)
IF @Day IS NULL
	RAISERROR('CreateStandingReservation error - required parameter @Day',16,1)
ELSE IF @Date IS NULL
	RAISERROR('CreateStandingReservation error - required parameter @Date',16,1)
ELSE
	BEGIN

	DECLARE contact_cursor CURSOR FOR
	SELECT RequestedTime,MemberNumber1,MemberName1,MemberName2,MemberName3,MemberName4 FROM StandingReservation WHERE DayOfWeek = @Day AND IsCanceled = 0

	OPEN contact_cursor

	FETCH NEXT FROM contact_cursor INTO @Time,@MemberNumber,@MemberName1,@MemberName2,@MemberName3,@MemberName4

	WHILE @@FETCH_STATUS = 0
		BEGIN
			EXEC AddTeeTime @Date,@Time,MemberNumber1,MemberName1,MemberName2,MemberName3,MemberName4,4,'',0,NULL
			FETCH NEXT FROM contact_cursor INTO @Time,@MemberNumber,@MemberName1,@MemberName2,@MemberName3,@MemberName4
		END

	CLOSE contact_cursor
	DEALLOCATE contact_cursor

	UPDATE StandingReservation SET IsCanceled = 1 WHERE DATEDIFF(DAY,GETDATE(),EndDate)< 1 AND IsCanceled = 0
	IF	@@ERROR = 0
		SET @ReturnCode = 0 
	ELSE
		RAISERROR('CreateStandingReservation error - update error',16,1)
	END
RETURN @ReturnCode
GO

CREATE PROCEDURE CancelStandingReservation(@MemberNumber INT = NULL, @Year INT = NULL)
AS
DECLARE @ReturnCode INT
SET @ReturnCode = 1

IF	@MemberNumber IS NULL
	RAISERROR('CancelStandingReservation errer - required parameter @MemberNumber',16,1)
ELSE IF @Year IS NULL
	RAISERROR('CancelStandingReservation errer - required parameter @Year',16,1)
ELSE
	BEGIN
	UPDATE StandingReservation SET IsCanceled = 1 WHERE MemberNumber1 = @MemberNumber AND Year = @Year
	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('CancelStandingReservation errer - UPDATE error',16,1)
	END
RETURN @ReturnCode
GO

CREATE PROCEDURE ProcessCurrentHandicapFactor(@MemberNumber INT = NULL)
AS
DECLARE @ReturnCode INT = 1
DECLARE @Rows INT
DECLARE @numtouse INT = 0
DECLARE @HandicapFactor FLOAT
IF @MemberNumber IS NULL
	RAISERROR('ProcessCurrentHandicapFactor error - Missing Parameter @MemberNumber',16,1)
ELSE
	BEGIN
	SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = @MemberNumber ORDER BY DateTime DESC
	SET @Rows = @@ROWCOUNT

	IF @Rows < 5
		BEGIN
		UPDATE Member
		SET Handicap = 100
		WHERE MemberNumber = @MemberNumber
		END
	ELSE IF @Rows >= 5 AND @Rows <= 16
		BEGIN
		SET @numtouse = CAST(ROUND(((CAST(@Rows AS FLOAT)/2) - 2),1) AS INT)
		SET @HandicapFactor = (SELECT AVG(HandicapDifferential) From
		(SELECT TOP(10) HandicapDifferential FROM
		(SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = 1 ORDER BY DateTime DESC)t
		ORDER BY HandicapDifferential ASC)t)
		SET @HandicapFactor = @HandicapFactor * .96
		SET @HandicapFactor = ROUND(@HandicapFactor,1,1)
		UPDATE Member
		SET Handicap = @HandicapFactor
		WHERE MemberNumber = @MemberNumber
		END
	ELSE IF @Rows > 16
		BEGIN
		SET @numtouse = @Rows - 10
		SET @HandicapFactor = (SELECT AVG(HandicapDifferential) From
		(SELECT TOP(10) HandicapDifferential FROM
		(SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = 1 ORDER BY DateTime DESC)t
		ORDER BY HandicapDifferential ASC)t)
		SET @HandicapFactor = @HandicapFactor * .96
		SET @HandicapFactor = ROUND(@HandicapFactor,1,1)
		UPDATE Member
		SET Handicap = @HandicapFactor
		WHERE MemberNumber = @MemberNumber
		END

	END


GO
CREATE PROCEDURE GetHandicapDifferentials(@MemberNumber INT = NULL)
AS
DECLARE @ReturnCode INT = 1

IF @MemberNumber IS NULL
	RAISERROR('GetHandicapDifferentials error - Missing Parameter @MemberNumber',16,1)
ELSE
	BEGIN
	SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = @MemberNumber ORDER BY DateTime DESC 
	IF @@ERROR  = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('GetHandicapDifferentials error - SELECT ERROR',16,1)
	END
RETURN @ReturnCode

GO

CREATE PROCEDURE AddAccount(@MemberNumber INT = NULL)
AS
DECLARE @ReturnCode INT = 1

IF @MemberNumber IS NULL
	RAISERROR('AddAccount error - Required parameter @MemberNumber',16,1)
ELSE
	BEGIN
		INSERT INTO Account Values
		(@MemberNumber,0)
		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			RAISERROR('GetLoginInfo error - INSERT ERROR',16,1)
	END
RETURN @ReturnCode
GO


GO
CREATE PROCEDURE AddTransaction(@AccountID INT = NULL,@ActivityDate DATE = NULL, @Description NVARCHAR(100) = NULL,@Amount MONEY = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @AccountID IS NULL
	RAISERROR('AddTransaction error - Required parameter @AccountID',16,1)
ELSE IF @ActivityDate IS NULL
	RAISERROR('AddTransaction error - Required parameter @ActivityDate',16,1)
ELSE IF @Description IS NULL
	RAISERROR('AddTransaction error - Required parameter @Description',16,1)
ELSE IF @Amount IS NULL
	RAISERROR('AddTransaction error - Required parameter @Amount',16,1)
ELSE
	BEGIN
		INSERT INTO Transactions VALUES
		(@AccountID,GETDATE(),@ActivityDate,@Description,@Amount)
		UPDATE Account 
		SET CurrentBalance = CurrentBalance - @Amount
		WHERE AccountID = @AccountID
	END
RETURN @ReturnCode
GO
CREATE PROCEDURE AddTransactionQuick(@MemberNumber INT = NULL,@ActivityDate DATE = NULL, @Description NVARCHAR(100) = NULL,@Amount MONEY = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @MemberNumber IS NULL
	RAISERROR('AddTransactionQuick error - Required parameter @MemberNumber',16,1)
ELSE IF @ActivityDate IS NULL
	RAISERROR('AddTransactionQuick error - Required parameter @ActivityDate',16,1)
ELSE IF @Description IS NULL
	RAISERROR('AddTransactionQuick error - Required parameter @Description',16,1)
ELSE IF @Amount IS NULL
	RAISERROR('AddTransactionQuick error - Required parameter @Amount',16,1)
ELSE
	BEGIN
		DECLARE @AccountID INT = (Select AccountID FROM Account WHERE MemberNumber = @MemberNumber)
		IF @@ERROR = 0
		BEGIN
			SET @ReturnCode = 0
			EXECUTE AddTransaction  @AccountID,@ActivityDate,@Description,@Amount
		END
		ELSE
			RAISERROR('AddTransactionQuick error - SELECT ERROR',16,1)
		
	END
RETURN @ReturnCode


GO
CREATE PROCEDURE GetTransactions(@MemberNumber INT = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @MemberNumber IS NULL
	RAISERROR('GetTransactions error - Required parameter @MemberNumber',16,1)
ELSE
	BEGIN
		DECLARE @AccountID INT = (SELECT AccountID FROM Account WHERE MemberNumber = @MemberNumber)
		SELECT PostDate,ActivityDate,Description,Amount FROM Transactions WHERE AccountID = @AccountID ORDER BY PostDate
		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			RAISERROR('GetTransactions error - SELECT EROR',16,1)
	END
RETURN @ReturnCode
GO


CREATE PROCEDURE GetCurrentBalance(@MemberNumber INT = NULL,@CurrentBalance MONEY OUT)
AS
DECLARE @ReturnCode INT = 1
IF @MemberNumber IS NULL
	RAISERROR('GetCurrentBalance error - Required parameter @MemberNumber',16,1)
ELSE
	BEGIN
	SET @CurrentBalance = (SELECT CurrentBalance FROM Account WHERE MemberNumber = @MemberNumber)
	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('GetCurrentBalance error - SELECT error',16,1)
	END
RETURN @ReturnCode



GO
CREATE PROCEDURE AddApplication(@LastName NVARCHAR(25) = NULL,@FirstName NVARCHAR(24) = NULL,@Address NVARCHAR(MAX) = NULL,@PostalCode VARCHAR(7) = NULL,@Phone VARCHAR(20) = NULL,@AltPhone VARCHAR(20) = NULL,
@Email NVARCHAR(50) = NULL, @BirthDate DATE = NULL,@Occupation VARCHAR(50) = NULL,@CompanyName NVARCHAR(50) = NULL,@CompanyAddress NVARCHAR(MAX) = NULL,@CompanyPostalCode VARCHAR(7) = NULL,@CompanyPhone VARCHAR(20) = NULL,
@SubmitDate DATE = NULL,@Sex CHAR(1) = NULL,@Password NVARCHAR(100) = NULL,@WantsShare BIT = NULL,
@ShareholderName1 NVARCHAR(50),@ShareholderDate1 DATE,@ShareholderName2 NVARCHAR(50) = NULL,@ShareholderDate2 DATE = NULL)
AS
DECLARE @ReturnCode INT = 1

IF @LastName IS NULL
	RAISERROR('AddApplication error - Missing parameter @LastName',16,1)
ELSE IF @FirstName IS NULL
	RAISERROR('AddApplication error - Missing parameter @FirstName',16,1)
ELSE IF @Address IS NULL
	RAISERROR('AddApplication error - Missing parameter @Address',16,1)
ELSE IF @PostalCode IS NULL
	RAISERROR('AddApplication error - Missing parameter @PostalCode',16,1)
ELSE IF @Phone IS NULL
	RAISERROR('AddApplication error - Missing parameter @Phone',16,1)
ELSE IF @AltPhone IS NULL
	RAISERROR('AddApplication error - Missing parameter @AltPhone',16,1)
ELSE IF @Email IS NULL
	RAISERROR('AddApplication error - Missing parameter @Email',16,1)
ELSE IF @BirthDate IS NULL
	RAISERROR('AddApplication error - Missing parameter @BirthDate',16,1)
ELSE IF @Occupation IS NULL
	RAISERROR('AddApplication error - Missing parameter @Occupation',16,1)
ELSE IF @CompanyName IS NULL
	RAISERROR('AddApplication error - Missing parameter @CompanyName',16,1)
ELSE IF @CompanyAddress IS NULL
	RAISERROR('AddApplication error - Missing parameter @CompanyAddress',16,1)
ELSE IF @CompanyPostalCode IS NULL
	RAISERROR('AddApplication error - Missing parameter @CompanyPostalCode',16,1)
ELSE IF @CompanyPhone IS NULL
	RAISERROR('AddApplication error - Missing parameter @CompanyPhone',16,1)
ELSE IF @SubmitDate IS NULL
	RAISERROR('AddApplication error - Missing parameter @SubmitDate',16,1)
ELSE IF @Sex IS NULL
	RAISERROR('AddApplication error - Missing parameter @Sex',16,1)
ELSE IF @Password IS NULL
	RAISERROR('AddApplication error - Missing parameter @Password',16,1)
ELSE IF @WantsShare IS NULL
	RAISERROR('AddApplication error - Missing parameter @WantsShare',16,1)
ELSE IF @ShareholderName1 IS NULL
	RAISERROR('AddApplication error - Missing parameter @ShareholderName1',16,1)
ELSE IF @ShareholderDate1 IS NULL
	RAISERROR('AddApplication error - Missing parameter @ShareholderDate1',16,1)
ELSE IF @ShareholderName2 IS NULL
	RAISERROR('AddApplication error - Missing parameter @ShareholderName2',16,1)
ELSE IF @ShareholderDate2 IS NULL
	RAISERROR('AddApplication error - Missing parameter @ShareholderDate2',16,1)
ELSE
	BEGIN
	INSERT INTO Application VALUES
	(@LastName,@FirstName,@Address,@PostalCode,@Phone,@AltPhone,@Email,@BirthDate,@Occupation,@CompanyName,@CompanyAddress,@CompanyPostalCode,@CompanyPhone,@SubmitDate,@Sex,@Password,@WantsShare,0,
	0,0,0,@ShareholderName1,@ShareholderDate1,@ShareholderName2,@ShareholderDate2)
	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('AddApplication error - INSERT ERROR',16,1)
	END
RETURN @ReturnCode
GO

CREATE PROCEDURE GetApplications
AS
DECLARE @ReturnCode INT = 1
SELECT * FROM Application WHERE IsAccepted = 0 AND IsDenied = 0
IF @@ERROR = 0
	SET @ReturnCode = 0
ELSE
	RAISERROR('GetApplications error - SELECT ERROR',16,1)
RETURN @ReturnCode
GO

CREATE PROCEDURE DenyApplication(@ApplicationID INT = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @ApplicationID IS NULL
	RAISERROR('DenyApplication error - Missing Parameter @ApplicationID',16,1)
ELSE
	BEGIN
		UPDATE Application
		SET IsDenied = 1
		WHERE ApplicationID = @ApplicationID
		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			RAISERROR('DenyApplication error - UPDATE ERROR',16,1)
	END
RETURN @ReturnCode
GO

CREATE PROCEDURE WaitlistApplication(@ApplicationID INT = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @ApplicationID IS NULL
	RAISERROR('WaitlistApplication error - Missing Parameter @ApplicationID',16,1)
ELSE
	BEGIN
		UPDATE Application
		SET IsWaitlisted = 1
		WHERE ApplicationID = @ApplicationID
		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			RAISERROR('WaitlistApplication error - UPDATE ERROR',16,1)
	END
RETURN @ReturnCode
GO

CREATE PROCEDURE HoldApplication(@ApplicationID INT = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @ApplicationID IS NULL
	RAISERROR('HoldApplication error - Missing Parameter @ApplicationID',16,1)
ELSE
	BEGIN
		UPDATE Application
		SET IsOnhold = 1
		WHERE ApplicationID = @ApplicationID
		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			RAISERROR('HoldApplication error - UPDATE ERROR',16,1)
	END
RETURN @ReturnCode
GO

CREATE PROCEDURE AcceptApplication(@ApplicationID INT = NULL)
AS
DECLARE @MemberShipTier VARCHAR(30)
DECLARE @MemberName NVARCHAR(50)
DECLARE @Password NVARCHAR(100)
DECLARE @IsShareHolder BIT
DECLARE @Sex CHAR(1)
DECLARE @Standing CHAR(1)
DECLARE @BirthDate DATE
DECLARE @MemberNumber INT
DECLARE @CurrentDate DATE = GETDATE()

DECLARE @ReturnCode INT = 1
IF @ApplicationID IS NULL
	RAISERROR('AcceptApplication error - Missing Parameter @ApplicationID',16,1)
ELSE
	BEGIN
		UPDATE Application
		SET IsAccepted = 1
		WHERE ApplicationID = @ApplicationID
		IF @@ERROR = 1
			RAISERROR('AcceptApplication error - UPDATE ERROR',16,1)
		SELECT @MemberName = FirstName + ' ' + LastName,@Password = Password,@IsShareHolder = WantsShare,@Sex = Sex,@BirthDate = BirthDate FROM Application WHERE ApplicationID = @ApplicationID

		IF @IsShareHolder = 0
		BEGIN
			SET @MemberShipTier = 'Associate'
			EXECUTE AddMember 'Gold',@MemberShipTier,@MemberName,@Password,0,@Sex,'G',@MemberNumber OUT
			EXECUTE AddAccount @MemberNumber
			EXECUTE AddTransactionQuick @MemberNumber,@CurrentDate,'Entrance Fee/4',2500
		END
		ELSE
			BEGIN
			IF	DATEDIFF(YEAR,@BirthDate,@CurrentDate) > 64
			BEGIN
				SET @MemberShipTier = 'Senior Shareholder'
				EXECUTE AddMember 'Gold',@MemberShipTier,@MemberName,@Password,0,@Sex,'G',@MemberNumber OUT
				EXECUTE AddAccount @MemberNumber
				EXECUTE AddTransactionQuick @MemberNumber,@CurrentDate,'Entrance Fee/4',2500
				EXECUTE AddTransactionQuick @MemberNumber,@CurrentDate,'Price of Share',1000
			END
			ELSE
			BEGIN
				SET @MemberShipTier = 'Shareholder'
				EXECUTE AddMember 'Gold',@MemberShipTier,@MemberName,@Password,0,@Sex,'G',@MemberNumber OUT
				EXECUTE AddAccount @MemberNumber
				EXECUTE AddTransactionQuick @MemberNumber,@CurrentDate,'Entrance Fee/4',2500
				EXECUTE AddTransactionQuick @MemberNumber,@CurrentDate,'Price of Share',1000
			END
			END

	END
RETURN @ReturnCode
GO

CREATE PROCEDURE GetTeeTimes(@Date DATE = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @Date IS NULL
	RAISERROR('GetTeeTimes error - Missing Parameter @Day',16,1)
ELSE
BEGIN
	SELECT Date,Time,MemberName1,MemberName2,MemberName3,MemberName4 FROM TeeTime WHERE Date = @Date
	IF @@ERROR = 0
		 SET @ReturnCode = 0
	ELSE
		RAISERROR('GetTeeTimes error - SELECT ERROR',16,1)
END
RETURN @ReturnCode
GO


CREATE PROCEDURE GetHandicapFactor(@MemberNumber INT,@HandicapFactor FLOAT OUT)
AS
DECLARE @ReturnCode INT = 1
DECLARE @Rows INT
DECLARE @numtouse INT = 0
IF @MemberNumber IS NULL
	RAISERROR('ProcessCurrentHandicapFactor error - Missing Parameter @MemberNumber',16,1)
ELSE
	BEGIN
	SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = @MemberNumber ORDER BY DateTime DESC
	SET @Rows = @@ROWCOUNT

	IF @Rows < 5
		BEGIN
		SET @HandicapFactor = 100
		END
	ELSE IF @Rows >= 5 AND @Rows <= 16
		BEGIN
		SET @numtouse = CAST(ROUND(((CAST(@Rows AS FLOAT)/2) - 2),1) AS INT)
		SET @HandicapFactor = (SELECT AVG(HandicapDifferential) From
		(SELECT TOP(10) HandicapDifferential FROM
		(SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = @MemberNumber ORDER BY DateTime DESC)t
		ORDER BY HandicapDifferential ASC)t)
		SET @HandicapFactor = @HandicapFactor * .96
		SET @HandicapFactor = ROUND(@HandicapFactor,1,1)

		END
	ELSE IF @Rows > 16
		BEGIN
		SET @numtouse = @Rows - 10
		SET @HandicapFactor = (SELECT AVG(HandicapDifferential) From
		(SELECT TOP(10) HandicapDifferential FROM
		(SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = @MemberNumber ORDER BY DateTime DESC)t
		ORDER BY HandicapDifferential ASC)t)
		SET @HandicapFactor = @HandicapFactor * .96
		SET @HandicapFactor = ROUND(@HandicapFactor,1,1)
		END
	END
GO

CREATE PROCEDURE GetBest10Average(@MemberNumber INT = NULL, @Average FLOAT OUT)
AS
DECLARE @ReturnCode INT = 1
DECLARE @Rows INT
DECLARE @numtouse INT = 0
IF @MemberNumber IS NULL
	RAISERROR('ProcessCurrentHandicapFactor error - Missing Parameter @MemberNumber',16,1)
ELSE
	BEGIN
	SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = @MemberNumber ORDER BY DateTime DESC
	SET @Rows = @@ROWCOUNT

	IF @Rows < 5
		BEGIN
		SET @Average = 100
		END
	ELSE IF @Rows >= 5 AND @Rows <= 16
		BEGIN
		SET @numtouse = CAST(ROUND(((CAST(@Rows AS FLOAT)/2) - 2),1) AS INT)
		SET @Average = (SELECT AVG(HandicapDifferential) From
		(SELECT TOP(10) HandicapDifferential FROM
		(SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = @MemberNumber ORDER BY DateTime DESC)t
		ORDER BY HandicapDifferential ASC)t)
		
		END
	ELSE IF @Rows > 16
		BEGIN
		SET @numtouse = @Rows - 10
		SET @Average = (SELECT AVG(HandicapDifferential) From
		(SELECT TOP(10) HandicapDifferential FROM
		(SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = @MemberNumber ORDER BY DateTime DESC)t
		ORDER BY HandicapDifferential ASC)t)
		END
	END

GO
CREATE PROCEDURE GetAverage(@MemberNumber INT = NULL,@Average FLOAT OUT)
AS
DECLARE @ReturnCode INT = 1
IF @MemberNumber IS NULL
	RAISERROR('ProcessCurrentHandicapFactor error - Missing Parameter @MemberNumber',16,1)
ELSE
	BEGIN	
	
	SET @Average = (SELECT AVG(HandicapDifferential) From
	(SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = 1 ORDER BY DateTime DESC)t)

	END
GO

CREATE PROCEDURE GetCurrentHandicap(@MemberNumber INT = NULL,@Handicap FLOAT OUT)
AS
DECLARE @ReturnCode INT = 1
IF @MemberNumber IS NULL
	RAISERROR('GetCurrentHandicap error - Missing Parameter @MemberNumber',16,1)
ELSE
	BEGIN
	SET @Handicap = (SELECT Handicap FROM Member WHERE MemberNumber = @MemberNumber)
	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('GetCurrentHandicap error - SELECT ERROR',16,1)
	END
RETURN @ReturnCode


GO
CREATE PROCEDURE MonthlyHandicapReport(@Month INT = NULL,@Year INT = NULL)
AS
DECLARE @MemberNumber INT
DECLARE @Handicap FLOAT
DECLARE @Average FLOAT
DECLARE @BestTen FLOAT
DECLARE @ReturnCode INT = 1
DECLARE @getid CURSOR

IF @Month IS NULL
	RAISERROR('MonthlyHandicapReport error - Missing Parameter @Month',16,1)
ELSE IF @Year IS NULL
	RAISERROR('MonthlyHandicapReport error - Missing Parameter @Year',16,1)
ELSE
	BEGIN
	INSERT INTO HandicapReport VALUES
	(@Month,@Year)

	SET @getid = CURSOR FOR
	SELECT MemberNumber 
	FROM Member
	WHERE MembershipLevel != 'Copper'

	OPEN @getid
	FETCH NEXT
	FROM @getid INTO @MemberNumber
	WHILE @@FETCH_STATUS = 0
		BEGIN
		EXEC GetAverage @MemberNumber,@Average OUT
		EXEC GetBest10Average @MemberNumber,@BestTen OUT
		EXEC GetHandicapFactor @MemberNumber,@Handicap OUT
		INSERT INTO MonthlyHandicap VALUES
		(@Month,@Year,@MemberNumber,@Handicap,@Average,@BestTen)
		END
	END

CLOSE @getid
DEALLOCATE @getid


GO


--start data insertion


DECLARE @Today DATE = GETDATE()
EXEC AddReservation @Today

SET @Today = DATEADD(DAY,1,@Today)
EXEC AddReservation @Today

SET @Today = DATEADD(DAY,1,@Today)
EXEC AddReservation @Today

SET @Today = DATEADD(DAY,1,@Today)
EXEC AddReservation @Today

SET @Today = DATEADD(DAY,1,@Today)
EXEC AddReservation @Today

SET @Today = DATEADD(DAY,1,@Today)
EXEC AddReservation @Today

SET @Today = DATEADD(DAY,1,@Today)
EXEC AddReservation @Today

SET @Today = DATEADD(DAY,1,@Today)
EXEC AddReservation @Today
GO



CREATE PROCEDURE DailyChecks
AS
BEGIN
	DECLARE @Today DATE = GETDATE()
	DECLARE @WeekfromToday DATE = DATEADD(DAY,7,@Today)
    SET NOCOUNT ON;

    DECLARE @timeToRun nvarchar(50)
    SET @timeToRun = '1:00:00'

    WHILE 1 = 1
    BEGIN
        WAITFOR TIME @timeToRun
        BEGIN
            EXECUTE [BAISTClubDatabase].[dbo].[AddReservation] @WeekfromToday;
			IF DATEPART(DAY,@Today) = 1
			BEGIN
				DECLARE @Month INT = DATEPART(MONTH,@Today)
				DECLARE @Year INT = DATEPART(YEAR,@Today)
				EXECUTE MonthlyHandicapReport @Month,@Year
			END
			IF MONTH(@Today) = 4 AND DAY(@Today) = 1
				EXECUTE YearEndFees
        END
    END
END
GO

CREATE PROCEDURE YearEndFees
AS
DECLARE @balance FLOAT
DECLARE @accountid INT
DECLARE @date DATE = GETDATE()

DECLARE contact_cursor CURSOR FOR
	SELECT AccountID, CurrentBalance FROM Account WHERE CurrentBalance != 0
	OPEN contact_cursor
	FETCH NEXT FROM contact_cursor INTO @accountid, @balance

	WHILE @@FETCH_STATUS = 0
		BEGIN
			DECLARE @tenth float = @Balance / 10
			EXEC AddTransaction @accountid,@date,'Year end fees',@tenth

		END
	CLOSE contact_cursor
	DEALLOCATE contact_cursor



sp_procoption    @ProcName = 'DailyChecks',
                @OptionName = 'startup',
                @OptionValue = 'on'
GO


