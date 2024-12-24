CREATE DATABASE LogisticDB;

USE LogisticDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    RegistrationDate DATE,
    Country VARCHAR(50),
    City VARCHAR(50),
    VIPStatus BIT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Status VARCHAR(20),
    PaymentType VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT,
    DiscountPercentage DECIMAL(5, 2)
);

CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY,
    OrderID INT,
    ShipmentDate DATE,
    DeliveryStatus VARCHAR(20),
    Region INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE DeliveryStaff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(100),
    AssignedShipmentID INT,
    AssignedRegion INT,
    FOREIGN KEY (AssignedShipmentID) REFERENCES Shipments(ShipmentID)
);

CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName, Email, RegistrationDate, Country, City, VIPStatus) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', '2023-01-15', 'USA', 'New York', 1),
(2, 'Bob Smith', 'bob.smith@example.com', '2023-02-10', 'Canada', 'Toronto', 0),
(3, 'Charlie Brown', 'charlie.brown@example.com', '2023-03-05', 'UK', 'London', 1),
(4, 'Diana Prince', 'diana.prince@example.com', '2023-04-22', 'Australia', 'Sydney', 0),
(5, 'Ethan Hunt', 'ethan.hunt@example.com', '2023-05-14', 'USA', 'Chicago', 1),
(6, 'Fiona Gallagher', 'fiona.gallagher@example.com', '2023-06-30', 'Canada', 'Vancouver', 0),
(7, 'George Lucas', 'george.lucas@example.com', '2023-07-21', 'USA', 'San Francisco', 1),
(8, 'Hannah Montana', 'hannah.montana@example.com', '2023-08-11', 'UK', 'Manchester', 0),
(9, 'Isaac Newton', 'isaac.newton@example.com', '2023-09-01', 'Australia', 'Melbourne', 1),
(10, 'Jack Sparrow', 'jack.sparrow@example.com', '2023-10-05', 'USA', 'Miami', 0);


INSERT INTO Products (ProductID, ProductName, Category, Price, Stock, DiscountPercentage) VALUES
(1, 'Smartphone', 'Electronics', 699.99, 50, 10.00),
(2, 'Laptop', 'Electronics', 1299.99, 30, 15.00),
(3, 'Wireless Headphones', 'Accessories', 199.99, 100, 5.00),
(4, 'Tablet', 'Electronics', 499.99, 40, 12.00),
(5, 'Smartwatch', 'Wearables', 299.99, 60, 8.00),
(6, 'Gaming Console', 'Gaming', 399.99, 25, 10.00),
(7, 'Camera', 'Photography', 899.99, 20, 20.00),
(8, 'Bluetooth Speaker', 'Audio', 149.99, 80, 7.00),
(9, 'Monitor', 'Computers', 249.99, 35, 5.00),
(10, 'Keyboard', 'Accessories', 49.99, 200, 10.00);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Status, PaymentType) VALUES
(1, 1, '2023-11-01', 'Pending', 'Credit Card'),
(2, 2, '2023-11-02', 'Shipped', 'PayPal'),
(3, 3, '2023-11-03', 'Delivered', 'Bank Transfer'),
(4, 4, '2023-11-04', 'Pending', 'Credit Card'),
(5, 5, '2023-11-05', 'Shipped', 'Debit Card'),
(6, 6, '2023-11-06', 'Pending', 'Credit Card'),
(7, 7, '2023-11-07', 'Delivered', 'PayPal'),
(8, 8, '2023-11-08', 'Pending', 'Cash'),
(9, 9, '2023-11-09', 'Shipped', 'Bank Transfer'),
(10, 10, '2023-11-10', 'Delivered', 'Credit Card');

INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 1, 699.99),
(2, 2, 2, 1, 1299.99),
(3, 3, 3, 2, 199.99),
(4, 4, 4, 1, 499.99),
(5, 5, 5, 1, 299.99),
(6, 6, 6, 1, 399.99),
(7, 7, 7, 1, 899.99),
(8, 8, 8, 2, 149.99),
(9, 9, 9, 1, 249.99),
(10, 10, 10, 3, 49.99);

INSERT INTO Shipments (ShipmentID, OrderID, ShipmentDate, DeliveryStatus, Region) VALUES
(1, 1, '2023-11-02', 'Shipped', 1),
(2, 2, '2023-11-03', 'Delivered', 2),
(3, 3, '2023-11-04', 'Delivered', 3),
(4, 4, '2023-11-05', 'Shipped', 4),
(5, 5, '2023-11-06', 'Delivered', 5),
(6, 6, '2023-11-07', 'Pending', 6),
(7, 7, '2023-11-08', 'Delivered', 7),
(8, 8, '2023-11-09', 'Shipped', 8),
(9, 9, '2023-11-10', 'Delivered', 9),
(10, 10, '2023-11-11', 'Pending', 10);

INSERT INTO Regions (RegionID, RegionName) VALUES
(1, 'North America'),
(2, 'Europe'),
(3, 'Asia'),
(4, 'Australia'),
(5, 'South America'),
(6, 'Africa'),
(7, 'Middle East'),
(8, 'Central America'),
(9, 'South Asia'),
(10, 'Eastern Europe');

INSERT INTO DeliveryStaff (StaffID, StaffName, AssignedShipmentID, AssignedRegion) VALUES
(1, 'John Doe', 1, 1),
(2, 'Emma Brown', 2, 2),
(3, 'Chris Green', 3, 3),
(4, 'Sophia White', 4, 4),
(5, 'Liam Black', 5, 5),
(6, 'Olivia Blue', 6, 6),
(7, 'Noah Gray', 7, 7),
(8, 'Isabella Silver', 8, 8),
(9, 'Mason Gold', 9, 9),
(10, 'Charlotte Copper', 10, 10);


CREATE PROCEDURE sp_GetAdvancedOrderDeliveryReport
    @StartDate DATE,
    @EndDate DATE,
    @Country VARCHAR(255) = NULL,
    @City VARCHAR(255) = NULL,
    @VIPOnly BIT = NULL,
    @Category VARCHAR(255) = NULL,
    @RegionName VARCHAR(255) = NULL,
    @StaffID INT = NULL,
    @MinOrderAmount DECIMAL(18,2) = NULL,
    @MaxOrderAmount DECIMAL(18,2) = NULL,
    @OrderStatus VARCHAR(50) = NULL,
    @DeliveryStatus VARCHAR(50) = NULL,
    @IncludeDiscounts BIT = NULL
AS
BEGIN

    
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);
    DECLARE @Params NVARCHAR(MAX);
    
    SET @SQL = '
        SELECT 
            O.OrderID,
            O.OrderDate,
            C.CustomerName,
            C.Country,
            C.City,
            C.VIPStatus,
            SUM(OI.Quantity * P.Price * CASE WHEN @IncludeDiscounts = 1 THEN (1 - P.DiscountPercentage / 100.0) ELSE 1 END) AS TotalOrderAmount,
            SUM(OI.Quantity) AS TotalQuantity,
            S.ShipmentDate,
            S.DeliveryStatus,
            O.Status AS OrderStatus,
            DS.StaffName AS DeliveryStaffName,
            R.RegionName
        FROM Orders O
        INNER JOIN Customers C ON O.CustomerID = C.CustomerID
        INNER JOIN OrderItems OI ON O.OrderID = OI.OrderID
        INNER JOIN Products P ON OI.ProductID = P.ProductID
        INNER JOIN Shipments S ON O.OrderID = S.OrderID
        INNER JOIN DeliveryStaff DS ON S.ShipmentID = DS.AssignedShipmentID
        INNER JOIN Regions R ON S.Region = R.RegionID
        WHERE O.OrderDate BETWEEN @StartDate AND @EndDate';

    IF @Country IS NOT NULL
        SET @SQL = @SQL + ' AND C.Country = @Country';
    IF @City IS NOT NULL
        SET @SQL = @SQL + ' AND C.City = @City';
    IF @VIPOnly = 1
        SET @SQL = @SQL + ' AND C.VIPStatus = 1';
    IF @Category IS NOT NULL
        SET @SQL = @SQL + ' AND P.Category = @Category';
    IF @RegionName IS NOT NULL
        SET @SQL = @SQL + ' AND R.RegionName = @RegionName';
    IF @StaffID IS NOT NULL
        SET @SQL = @SQL + ' AND DS.StaffID = @StaffID';
    IF @OrderStatus IS NOT NULL
        SET @SQL = @SQL + ' AND O.Status = @OrderStatus';
    IF @DeliveryStatus IS NOT NULL
        SET @SQL = @SQL + ' AND S.DeliveryStatus = @DeliveryStatus';

    SET @SQL = @SQL + '
        GROUP BY 
            O.OrderID, O.OrderDate, C.CustomerName, C.Country, C.City, C.VIPStatus, 
            S.ShipmentDate, S.DeliveryStatus, O.Status, DS.StaffName, R.RegionName';

    IF @MinOrderAmount IS NOT NULL OR @MaxOrderAmount IS NOT NULL
    BEGIN
        SET @SQL = @SQL + ' HAVING';

        IF @MinOrderAmount IS NOT NULL
        BEGIN
            SET @SQL = @SQL + '
                SUM(OI.Quantity * P.Price * CASE WHEN @IncludeDiscounts = 1 THEN (1 - P.DiscountPercentage / 100.0) ELSE 1 END) >= @MinOrderAmount';
        END

        IF @MaxOrderAmount IS NOT NULL
        BEGIN
            SET @SQL = @SQL + '
                AND SUM(OI.Quantity * P.Price * CASE WHEN @IncludeDiscounts = 1 THEN (1 - P.DiscountPercentage / 100.0) ELSE 1 END) <= @MaxOrderAmount';
        END
    END
	     SET @SQL = @SQL +    ' ORDER BY O.OrderDate';

		 PRINT @SQL;


    SET @Params = '
        @StartDate DATE,
        @EndDate DATE,
        @Country VARCHAR(255),
        @City VARCHAR(255),
        @VIPOnly BIT,
        @Category VARCHAR(255),
        @RegionName VARCHAR(255),
        @StaffID INT,
        @MinOrderAmount DECIMAL(18,2),
        @MaxOrderAmount DECIMAL(18,2),
        @OrderStatus VARCHAR(50),
        @DeliveryStatus VARCHAR(50),
        @IncludeDiscounts BIT';

    EXEC sp_executesql 
        @SQL, 
        @Params, 
        @StartDate = @StartDate, 
        @EndDate = @EndDate,
        @Country = @Country,
        @City = @City,
        @VIPOnly = @VIPOnly,
        @Category = @Category,
        @RegionName = @RegionName,
        @StaffID = @StaffID,
        @MinOrderAmount = @MinOrderAmount,
        @MaxOrderAmount = @MaxOrderAmount,
        @OrderStatus = @OrderStatus,
        @DeliveryStatus = @DeliveryStatus,
        @IncludeDiscounts = @IncludeDiscounts;

END;
GO

EXEC sp_GetAdvancedOrderDeliveryReport
     @StartDate = '2023-01-01',
     @EndDate = '2023-12-31',
     @Country = 'USA',
     @City = NULL,
     @VIPOnly = NULL,
     @Category = NULL,
     @RegionName = NULL,
     @StaffID = NULL,
     @MinOrderAmount = NULL,
     @MaxOrderAmount = NULL,
     @OrderStatus = NULL,
     @DeliveryStatus = NULL,
     @IncludeDiscounts = NULL;






