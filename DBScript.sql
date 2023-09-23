USE [master]
GO
CREATE DATABASE [EMedicine]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EMedicine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EMedicine.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EMedicine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EMedicine_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EMedicine] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EMedicine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EMedicine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EMedicine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EMedicine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EMedicine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EMedicine] SET ARITHABORT OFF 
GO
ALTER DATABASE [EMedicine] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EMedicine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EMedicine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EMedicine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EMedicine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EMedicine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EMedicine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EMedicine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EMedicine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EMedicine] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EMedicine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EMedicine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EMedicine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EMedicine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EMedicine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EMedicine] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EMedicine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EMedicine] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EMedicine] SET  MULTI_USER 
GO
ALTER DATABASE [EMedicine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EMedicine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EMedicine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EMedicine] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EMedicine] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EMedicine] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EMedicine] SET QUERY_STORE = OFF
GO
USE [EMedicine]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[MedicineID] [int] NULL,
	[UnitPrice] [varchar](100) NULL,
	[Discount] [varchar](100) NULL,
	[Quantity] [varchar](100) NULL,
	[TotalPrice] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicines](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Manufacturer] [varchar](100) NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[ExpDate] [datetime] NULL,
	[ImageUrl] [varchar](1000) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[MedicineID] [int] NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderNo] [varchar](100) NULL,
	[OrderTotal] [decimal](18, 2) NULL,
	[OrderStatus] [varchar](100) NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Fund] [decimal](18, 2) NULL,
	[Type] [varchar](100) NULL,
	[Status] [int] NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddToCart]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddToCart](@ID INT, @Email VARCHAR(100) = null, @UnitPrice DECIMAL(18,2) = NULL, @Discount DECIMAL(18,2) = NULL  
,@Quantity INT  = NULL,@TotalPrice DECIMAL(18,2)  = NULL)  
AS  
BEGIN  
        DECLARE @UserId INT;  
  DECLARE @UnitPrice_ DECIMAL(18,2);  
  DECLARE @Discount_ DECIMAL(18,2);  
  DECLARE @TotalPrice_ DECIMAL(18,2);  
  SET @UserId = (SELECT TOp 1 ID FROM Users WHERE Email = @Email);  
  SET @UnitPrice_ = (SELECT  TOp 1 UnitPrice FROM Medicines WHERE ID = @ID);  
  SET @Discount_ = (SELECT (UnitPrice * @Quantity * Discount)/ 100 FROM Medicines WHERE ID = @ID);  
  SET @TotalPrice_ = (SELECT (UnitPrice * @Quantity) - @Discount_ FROM Medicines WHERE ID = @ID);  
    
  IF NOT EXISTS(SELECT 1 FROM Cart WHERE UserId = @UserId AND MedicineID = @ID)  
  BEGIN  
   INSERT INTO Cart(UserId,MedicineID,UnitPrice,Discount,Quantity,TotalPrice)  
   VALUES(@UserId,@ID,@UnitPrice_,@Discount_,@Quantity,@TotalPrice_);   
  END  
  ELSE  
  BEGIN  
   UPDATE Cart SET Quantity = (Quantity + @Quantity) WHERE UserId = @UserId AND MedicineID = @ID;  
  END  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddUpdateMedicine]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddUpdateMedicine](@ID INT = null, @Name VARCHAR(100) = null, @Manufacturer VARCHAR(100) = null,@UnitPrice DECIMAL(18,2) = null
,@Discount DECIMAL(18,2)  = null,@Quantity INT  = null,@ExpDate DATETIME  = null,@ImageUrl VARCHAR(100) = null,@Status INT = null
, @Type VARCHAR(100) = null)
AS
BEGIN
	IF @Type = 'Add'
	BEGIN
		INSERT INTO Medicines(Name,Manufacturer,UnitPrice,Discount,Quantity,ExpDate,ImageUrl,Status)
		VALUES(@Name,@Manufacturer,@UnitPrice,@Discount,@Quantity,@ExpDate,@ImageUrl,@Status)
	END
	IF @Type = 'Update'
	BEGIN
		UPDATE Medicines SET Name=@Name,Manufacturer=@Manufacturer,UnitPrice=@UnitPrice,Discount=@Discount,Quantity=@Quantity		
		WHERE ID = @ID;
	END
	IF @Type = 'Delete'
	BEGIN
		UPDATE Medicines SET Status = 0 WHERE ID = @ID;
	END
	IF @Type = 'Get'
	BEGIN
		SELECT * FROM Medicines WHERE Status = 1;
	END
	IF @Type = 'GetByID'
	BEGIN
		SELECT * FROM Medicines WHERE ID = @ID;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CartList]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_CartList](@Email VARCHAR(100))
AS
BEGIN
    IF @Email != 'Admin'
	BEGIN
		SELECT C.ID, M.Name, M.Manufacturer, M.UnitPrice, M.Discount, C.Quantity, C.TotalPrice, M.ImageUrl FROM Cart C 
		INNER JOIN Medicines M ON M.ID = C.MedicineID
		INNER JOIN Users U ON U.ID = C.UserId
		WHERE U.Email =  @Email;
	END
	ELSE
	BEGIN
		SELECT M.ID, M.Name, M.Manufacturer, M.UnitPrice, M.Discount, M.Quantity, M.ImageUrl , 0 AS TotalPrice FROM Medicines M;
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_login](@Email VARCHAR(100), @Password VARCHAR(100))
AS
BEGIN
	SELECT * FROM Users WHERE Email = @Email AND Password = @Password AND Status = 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_OrderList]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_OrderList](@Type VARCHAR(100), @Email VARCHAR(100) = null, @ID INT)  
AS  
BEGIN  
 IF @Type = 'Admin'  
 BEGIN  
  SELECT O.ID,OrderNo,OrderTotal,OrderStatus,CONVERT(NVARCHAR,O.CreatedOn,107) AS CreatedOn  
  ,CONCAT(U.FirstName,' ',U.LastName ) AS CustomerName  
  FROM Orders O INNER JOIN Users U  
  ON U.ID = O.UserID;  
 END   
 IF @Type = 'User'  
 BEGIN  
  SELECT O.ID,OrderNo,OrderTotal,OrderStatus,CONVERT(NVARCHAR,O.CreatedOn,107) AS CreatedOn  
  ,CONCAT(U.FirstName,' ',U.LastName ) AS CustomerName  
  FROM Orders O INNER JOIN Users U  
  ON U.ID = O.UserID  
  WHERE U.Email = @Email;  
 END   
 IF @Type = 'UserItems'  
 BEGIN  
  SELECT   
  O.ID, O.OrderNo,O.OrderTotal,O.OrderStatus, M.Name AS MedicineName, M.Manufacturer,M.UnitPrice,OI.Quantity,OI.TotalPrice   
  ,CONVERT(NVARCHAR,O.CreatedOn,107) AS CreatedOn ,CONCAT(U.FirstName,' ',U.LastName ) AS CustomerName  
  , M.ImageUrl  
  FROM Orders O   
  INNER JOIN Users U ON U.ID = O.UserID  
  INNER JOIN OrderItems OI ON OI.OrderID = O.ID  
  INNER JOIN Medicines M ON M.ID = OI.MedicineID  
  WHERE O.ID = @ID;  
 END   
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PlaceOrder]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_PlaceOrder](@Email VARCHAR(100))
AS
BEGIN
	DECLARE @OrderNO VARCHAR(100);
	DECLARE @OrderID INT;
	DECLARE @OrderTotal DECIMAL(18,2);
	DECLARE @UserID INT;
	SET @OrderNO =	(SELECT NEWID());
	SET @UserID = (SELECT ID FROM Users WHERE Email = @Email);

	IF OBJECT_ID('tempdb..#TempOrder') IS NOT NULL DROP TABLE #TempOrder; 
	
	SELECT * INTO #TempOrder 
	FROM Cart WHERE UserId = @UserID;

	SET @OrderTotal = (SELECT SUM(TotalPrice) from #TempOrder);

	INSERT INTO Orders(UserID,OrderNo,OrderTotal,OrderStatus,CreatedOn)
	VALUES(@UserID,@OrderNO,@OrderTotal,'Pending',GETDATE());

	SET @OrderID = (SELECT ID FROM Orders WHERE OrderNo = @OrderNO);

	INSERT INTO OrderItems(OrderID,MedicineID,UnitPrice,Discount,Quantity,TotalPrice)
	SELECT @OrderID, MedicineID,UnitPrice,Discount,Quantity,TotalPrice FROM #TempOrder;

	DELETE FROM Cart WHERE UserId = @UserID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_register]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_register](@ID INT = NULL, @FirstName VARCHAR(100) = NULL, @LastName VARCHAR(100) = NULL, @Password VARCHAR(100) = NULL,
@Email VARCHAR(100) = NULL, @Fund DECIMAL(18,2) = NULL, @Type VARCHAR(100) = NULL, @Status INT = NULL, @ActionType VARCHAR(100) = NULL)
AS
BEGIN
	IF @ActionType = 'Add'
	BEGIN
		INSERT INTO Users(FirstName,LastName,Password,Email,Fund,Type,Status,CreatedOn)
		VALUES(@FirstName,@LastName,@Password,@Email,@Fund,@Type,@Status,GETDATE())
	END
	IF @ActionType = 'Update'
	BEGIN
		UPDATE Users SET FirstName = @FirstName,LastName = @LastName,Password = @Password
		WHERE Email = @Email;
	END
	IF @ActionType = 'AddFund'
	BEGIN
		UPDATE Users SET Fund = @Fund WHERE Email = @Email;
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_RemoveToCart]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_RemoveToCart](@ID INT, @Email VARCHAR(100) = null)    
AS    
BEGIN    
  DECLARE @UserId INT;    
  SET @UserId = (SELECT TOp 1 ID FROM Users WHERE Email = @Email);    
     
  DELETE FROM Cart WHERE UserId = @UserId AND ID = @ID;    
END
GO
/****** Object:  StoredProcedure [dbo].[sp_updateOrderStatus]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_updateOrderStatus](@OrderNo VARCHAR(100) = NULL, @OrderStatus VARCHAR(100) = NULL)
AS
BEGIN
	UPDATE Orders SET OrderStatus = @OrderStatus WHERE OrderNo = @OrderNo;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserList]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UserList]
AS
BEGIN
	SELECT ID, FirstName, LastName, Email, CASE WHEN Fund IS NULL THEN 0.00 ELSE FUND END AS FUND
	, CONVERT(NVARCHAR,CreatedO ,107) AS OrderDate, Status, Password  FROM Users WHERE Status = 1 AND Type != 'Admin';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_viewUser]    Script Date: 16-06-2023 19:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_viewUser](@ID INT = null, @Email VARCHAR(100) = null)
AS
BEGIN
	IF @ID IS NOT null AND @ID != 0
	BEGIN
		SELECT * FROM Users WHERE ID = @ID AND Status = 1;
	END
	IF @Email IS NOT null AND @Email != ''
	BEGIN
		SELECT * FROM Users WHERE Email = @Email AND Status = 1;
	END
END;
GO
USE [master]
GO
ALTER DATABASE [EMedicine] SET  READ_WRITE 
GO




select * from Users;
select * from Medicines;
select * from Cart;
select * from Orders;
select * from OrderItems;







EXEC sp_rename 'Users.createdOn', 'CreatedOn', 'COLUMN';

-- Insert into the Users table
INSERT INTO Users (FirstName, LastName, Password, Email, Fund, Type, Status, CreatedOn)
VALUES
    ('John', 'Doe', 'password123', 'john.doe@email.com', 1000.00, 'Customer', 1, GETDATE()),
    ('Jane', 'Smith', 'pass456', 'jane.smith@email.com', 750.50, 'Customer', 1, GETDATE());

-- Insert into the Medicines table
INSERT INTO Medicines (Name, Manufacturer, UnitPrice, Discount, Quantity, ExpDate, ImageUrl, Status)
VALUES
    ('Medicine A', 'Manufacturer X', 10.99, 0.50, 100, '2024-12-31', 'image_url_1.jpg', 1),
    ('Medicine B', 'Manufacturer Y', 15.49, 0.25, 75, '2025-06-30', 'image_url_2.jpg', 1);

-- Insert into the Cart table
INSERT INTO Cart (UserId, MedicineID, UnitPrice, Discount, Quantity, TotalPrice)
VALUES
    (1, 1, 10.99, 0.50, 2, 19.98),
    (2, 2, 15.49, 0.25, 3, 43.98);

-- Insert into the Orders table
INSERT INTO Orders (UserID, OrderNo, OrderTotal, OrderStatus)
VALUES
    (1, 'ORD123456', 19.98, 'Pending'),
    (2, 'ORD789012', 43.98, 'Processing');

-- Insert into the OrderItems table
INSERT INTO OrderItems (OrderID, MedicineID, UnitPrice, Discount, Quantity, TotalPrice)
VALUES
    (1, 1, 10.99, 0.50, 2, 19.98),
    (2, 2, 15.49, 0.25, 3, 43.98);
