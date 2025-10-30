CREATE DATABASE ClothingStore1;
USE ClothingStore1;


CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT
);


CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ContactPerson VARCHAR(255),
    Phone VARCHAR(50),
    Email VARCHAR(255),
    Address TEXT
);


CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    CategoryID INT,
    SupplierID INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);


CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(50),
    Address TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    StockAdded INT NOT NULL,
    DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(50),
    Role ENUM('Manager', 'Salesperson','Cashier','Stock Manager','Assistant Manager','Store Manager','Customer Service', 'Floor Supervisor','Visual Merchandiser', 'Sales Associate') DEFAULT 'Salesperson',
    HireDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentMethod ENUM('Credit Card', 'Debit Card', 'Cash', 'Online') DEFAULT 'Credit Card',
    PaymentStatus ENUM('Paid','Pending', 'Refunded') DEFAULT 'Paid',
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Discounts (
    DiscountID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    DiscountType ENUM('Percentage', 'Fixed Amount') NOT NULL,
    DiscountValue DECIMAL(10, 2) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    ProductID INT,
    OrderID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE SET NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE SET NULL
);
ALTER TABLE Employees
ADD Salary DECIMAL(10, 2);

INSERT INTO Categories (Name, Description)
VALUES 
    ('Men\'s Wear', 'Clothing and accessories for men'),
    ('Women\'s Wear', 'Clothing and accessories for women'),
    ('Accessories', 'Fashion accessories like belts, bags, and jewelry');
	INSERT INTO Categories (Name,Description)
    VALUES
    ('Kids Wear', 'Clothing for children'),
    ('Formal Wear', 'Formal and business attire'),
    ('Sportswear', 'Clothing for athletic activities'),
    ('Footwear', 'Shoes, sandals, and boots'),
    ('Winter Wear', 'Clothing for cold weather'),
    ('Summer Wear', 'Light clothing for warm weather'),
    ('Party Wear', 'Clothing for special occasions'),
    ('Ethnic Wear', 'Traditional and cultural clothing'),
    ('Casual Wear', 'Comfortable everyday clothing'),
    ('Swimwear', 'Clothing for swimming and beachwear'),
    ('Outerwear', 'Coats, jackets, and layers'),
    ('Sleepwear', 'Pajamas and nightwear'),
    ('Maternity Wear', 'Clothing for expectant mothers'),
    ('Accessories', 'Bags, hats, and jewelry'),
    ('Underwear', 'Intimates and innerwear'),
    ('Workwear', 'Clothing for work environments'),
    ('Designer Wear', 'Premium branded clothing');
    
INSERT INTO Suppliers (Name, ContactPerson, Phone, Email, Address)
VALUES 
('H&M','Andrei Popescu','0723523451','andreipopescu@yahoo.com','Soseaua Pantelimon 227'),
('ZARA','Mihai Ionescu','0723162671','mihaiionescu@gmail.com','BD. Dacia 22'),
('PULL&BEAR','David Pop','0723135125','davidpop@gmail.com','Decebal 26'),
    ('Fashion Trends Co.', 'Sophia Brown', '111-222-3333', 'sophia.brown@example.com', '123 Sunset Blvd'),
    ('Athletic Supplies Ltd.', 'Ryan Green', '444-555-6666', 'ryan.green@example.com', '45 Sports Lane'),
    ('Winter Gear Inc.', 'Emma White', '777-888-9999', 'emma.white@example.com', '78 Snow Street'),
    ('Summer Styles', 'Olivia Johnson', '999-888-7777', 'olivia.johnson@example.com', '12 Sunshine Road'),
    ('Formal Attire Co.', 'James Davis', '222-333-4444', 'james.davis@example.com', '67 Office Drive'),
    ('Ethnic Creations', 'Aarav Patel', '333-444-5555', 'aarav.patel@example.com', '89 Tradition Lane'),
    ('Luxury Designers', 'Sophia Wilson', '555-666-7777', 'sophia.wilson@example.com', '34 Glam Avenue'),
    ('Casual Comforts', 'Liam Brown', '444-333-2222', 'liam.brown@example.com', '23 Chill Street'),
    ('Kids World', 'Mia Garcia', '888-777-6666', 'mia.garcia@example.com', '10 Kids Lane'),
    ('Swim Essentials', 'Jacob Martin', '123-456-7890', 'jacob.martin@example.com', '5 Beach Road'),
    ('Footwear Pros', 'Ella Taylor', '222-111-3333', 'ella.taylor@example.com', '11 Sole Street'),
    ('Nighttime Cozies', 'Noah Lee', '333-111-2222', 'noah.lee@example.com', '9 Dream Blvd'),
    ('Designer Exclusives', 'Charlotte King', '444-555-9999', 'charlotte.king@example.com', '45 Elite Street'),
    ('Outer Layers Ltd.', 'Amelia Harris', '777-222-8888', 'amelia.harris@example.com', '16 Warmth Way'),
    ('Accessory Haven', 'Lucas Wright', '111-555-3333', 'lucas.wright@example.com', '7 Detail Drive'),
    ('Work Apparel Corp.', 'Ethan Adams', '444-222-1111', 'ethan.adams@example.com', '8 Task Street'),
    ('Party Central', 'Isabella Scott', '555-999-1111', 'isabella.scott@example.com', '3 Celebration Drive');
INSERT INTO Products (Name,Description,Price,Stock,CategoryID,SupplierID)
VALUES
('BLUGI ALBASTRII','Distressed Denim ','249.99',100,1,1),
('TRICOU NEGRU','Tricou cu fit oversized','99.99',100,1,2),
('CUREA PIELE','Curea din piele bovina','179.99',100,1,3),
    ('Tuxedo', 'Black formal tuxedo', 199.99, 20, 1, 5),
    ('Running Shoes', 'Lightweight running shoes', 89.99, 100, 6, 2),
    ('Leather Boots', 'Durable leather boots', 129.99, 50, 1, 11),
    ('Winter Jacket', 'Warm insulated jacket', 149.99, 30, 2, 3),
    ('Sundress', 'Light floral sundress', 49.99, 70, 2, 4),
    ('Party Gown', 'Elegant evening gown', 299.99, 15, 7, 17),
    ('Kurta', 'Traditional ethnic wear', 59.99, 40, 8, 6),
    ('Casual T-Shirt', 'Comfortable cotton t-shirt', 19.99, 200, 9, 8),
    ('Bikini', 'Two-piece swimwear', 39.99, 50, 10, 10),
    ('Raincoat', 'Waterproof raincoat', 79.99, 25, 11, 14),
    ('Pajamas', 'Soft cotton pajamas', 24.99, 60, 12, 12),
    ('Maternity Dress', 'Stretchable maternity dress', 49.99, 20, 13, 7),
    ('Leather Wallet', 'Stylish leather wallet', 29.99, 100, 14, 16),
    ('Boxer Shorts', 'Comfortable boxers', 9.99, 150, 15, 6),
    ('Work Gloves', 'Durable work gloves', 14.99, 80, 16, 15),
    ('Designer Suit', 'Premium tailored suit', 499.99, 10, 17, 13),
    ('Sneakers', 'Trendy casual sneakers', 59.99, 120, 4, 9);
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES 
('Alexandru', 'Cuta', 'cuta.alexandru@yahoo.com', '0723123123', 'Sos Iancului 23'),
('Mihai', 'Ciortan', 'mihai.ciortan@yahoo.com', '0723133123', 'Sos Trapezului 13'),
('Tudor','Popescu','tudor.popescu@gmail.com','0723123868' ,'BD. Nicolae Grigorescu 17'),
('Liam', 'Smith', 'liam.smith@example.com', '123-456-7890', '123 Maple Street'),
('Emma', 'Johnson', 'emma.johnson@example.com', '987-654-3210', '456 Oak Lane'),
('Noah', 'Brown', 'noah.brown@example.com', '555-555-5555', '789 Pine Avenue'),
('Olivia', 'Williams', 'olivia.williams@example.com', '444-333-2222', '101 Elm Road'),
    ('Ethan', 'Jones', 'ethan.jones@example.com', '222-111-3333', '202 Birch Drive'),
    ('Sophia', 'Garcia', 'sophia.garcia@example.com', '333-222-1111', '303 Willow Street'),
    ('James', 'Miller', 'james.miller@example.com', '111-222-3333', '404 Cedar Lane'),
    ('Isabella', 'Martinez', 'isabella.martinez@example.com', '666-777-8888', '505 Aspen Way'),
    ('Lucas', 'Davis', 'lucas.davis@example.com', '999-888-7777', '606 Poplar Avenue'),
    ('Mia', 'Hernandez', 'mia.hernandez@example.com', '888-999-6666', '707 Spruce Road'),
    ('Benjamin', 'Lopez', 'benjamin.lopez@example.com', '123-456-1234', '808 Palm Boulevard'),
    ('Amelia', 'Wilson', 'amelia.wilson@example.com', '789-789-7890', '909 Magnolia Place'),
    ('Henry', 'Taylor', 'henry.taylor@example.com', '555-333-4444', '1010 Redwood Drive'),
    ('Charlotte', 'Anderson', 'charlotte.anderson@example.com', '333-555-2222', '1111 Cypress Way'),
    ('Alexander', 'Thomas', 'alexander.thomas@example.com', '444-111-6666', '1212 Beech Avenue'),
    ('Ava', 'Moore', 'ava.moore@example.com', '777-444-1111', '1313 Cherry Lane'),
    ('William', 'Martin', 'william.martin@example.com', '222-888-3333', '1414 Holly Street');

INSERT INTO Orders (CustomerID, Status, TotalAmount)
VALUES 
    (1, 'Pending', 99.98),
    (2, 'Shipped', 49.99),
    (1, 'Delivered', 79.99),
    (5, 'Pending', 49.99),
    (5, 'Shipped', 99.98),
    (6, 'Delivered', 149.99),
    (2, 'Cancelled', 19.99),
    (8, 'Pending', 129.99),
    (6, 'Shipped', 79.99),
    (3, 'Delivered', 299.99),
    (1, 'Pending', 59.99),
    (12, 'Shipped', 39.99),
    (7, 'Delivered', 149.99),
    (14, 'Pending', 49.99),
    (1, 'Shipped', 89.99),
    (11, 'Delivered', 24.99),
    (17, 'Cancelled', 19.99),
    (11, 'Pending', 499.99),
    (10, 'Shipped', 9.99),
    (2, 'Delivered', 79.99);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES 
  (1, 1, 2, 499.98),
    (2, 2, 1,99.99),
    (3, 3, 1, 179.99),
    (4, 1, 2, 49.99),
    (5, 2, 1, 99.98),
    (6, 3, 1, 149.99),
    (7, 4, 1, 19.99),
    (8, 5, 1, 129.99),
    (9, 6, 1, 79.99),
    (10, 7, 1, 299.99),
    (11, 8, 1, 59.99),
    (12, 9, 1, 39.99),
    (13, 10, 1, 149.99),
    (14, 11, 1, 49.99),
    (15, 12, 1, 89.99),
    (16, 13, 1, 24.99),
    (17, 14, 1, 19.99),
    (18, 15, 1, 499.99),
    (19, 16, 1, 9.99),
    (20, 17, 1, 79.99);

INSERT INTO Inventory (ProductID, StockAdded)
VALUES 
    (1, 100),
    (2, 50),
    (3, 200),
    (1, 50),
    (2, 40),
    (3, 60),
    (4, 30),
    (5, 70),
    (6, 20),
    (7, 50),
    (8, 80),
    (9, 100),
    (10, 90),
    (11, 40),
    (12, 60),
    (13, 50),
    (14, 30),
    (15, 70),
    (16, 40),
    (17, 60);

INSERT INTO Employees (FirstName, LastName, Email, Phone, Role)
VALUES 
    ('Cezar', 'Decu', 'decu.cezar@gmail.com', '0762123863', 'Manager'),
    ('Chris', 'Dima', 'dima.chris@ymail.com', '0723962012', 'Salesperson'),
    ('Lucian', 'Filip', 'filip.lucian@yahoo.com', '0729838612', 'Stock Manager'),
    ('Olivia', 'Walker', 'olivia.walker@example.com', '123-123-1234', 'Sales Associate'),
    ('Noah', 'Robinson', 'noah.robinson@example.com', '987-987-9876', 'Cashier'),
    ('Emma', 'Clark', 'emma.clark@example.com', '555-555-1234', 'Stock Manager'),
    ('Liam', 'Lewis', 'liam.lewis@example.com', '444-444-5678', 'Assistant Manager'),
    ('Sophia', 'Young', 'sophia.young@example.com', '333-333-6789', 'Store Manager'),
    ('Mason', 'Hill', 'mason.hill@example.com', '222-222-2345', 'Customer Service'),
    ('Ava', 'Scott', 'ava.scott@example.com', '111-111-3456', 'Floor Supervisor'),
    ('Elijah', 'Green', 'elijah.green@example.com', '666-666-5678', 'Visual Merchandiser'),
    ('Charlotte', 'Adams', 'charlotte.adams@example.com', '777-777-6789', 'Sales Associate'),
    ('Lucas', 'Baker', 'lucas.baker@example.com', '888-888-7890', 'Cashier'),
    ('Amelia', 'Mitchell', 'amelia.mitchell@example.com', '999-999-8901', 'Stock Manager'),
    ('Harper', 'Perez', 'harper.perez@example.com', '111-222-3333', 'Assistant Manager'),
    ('William', 'Rivera', 'william.rivera@example.com', '444-555-6666', 'Store Manager'),
    ('Evelyn', 'Carter', 'evelyn.carter@example.com', '777-888-9999', 'Customer Service'),
    ('James', 'Garcia', 'james.garcia@example.com', '333-444-5555', 'Floor Supervisor'),
    ('Isabella', 'Harris', 'isabella.harris@example.com', '555-666-7777', 'Visual Merchandiser'),
    ('Alexander', 'Martin', 'alexander.martin@example.com', '888-999-0000', 'Sales Associate');
INSERT INTO Transactions (OrderID, PaymentMethod, PaymentStatus)
VALUES 
    (1, 'Credit Card', 'Paid'),
    (2, 'Debit Card', 'Paid'),
    (3, 'Online', 'Paid'),
    (4, 'Credit Card', 'Paid'),
    (5, 'Debit Card', 'Paid'),
    (6, 'Online', 'Pending'),
    (7, 'Credit Card', 'Refunded'),
    (8, 'Cash', 'Paid'),
    (9, 'Online', 'Paid'),
    (10, 'Credit Card', 'Paid'),
    (11, 'Debit Card', 'Pending'),
    (12, 'Online', 'Paid'),
    (13, 'Cash', 'Paid'),
    (14, 'Credit Card', 'Pending'),
    (15, 'Debit Card', 'Paid'),
    (16, 'Online', 'Paid'),
    (17, 'Credit Card', 'Refunded'),
    (18, 'Cash', 'Paid'),
    (19, 'Online', 'Pending'),
    (20, 'Debit Card', 'Paid');
    INSERT INTO Discounts (Name, DiscountType, DiscountValue, StartDate, EndDate, ProductID, OrderID)
VALUES
    
    ('New Year Sale', 'Percentage', 20.00, '2025-01-01', '2025-01-10', NULL, NULL),
    
    
    ('Blue Jeans Discount', 'Fixed Amount', 10.00, '2025-01-01', '2025-01-31', 1, NULL),
    
   
    ('Loyal Customer Discount', 'Percentage', 15.00, '2025-01-01', '2025-01-15', NULL, 2);
    
    INSERT INTO Discounts (Name, DiscountType, DiscountValue, StartDate, EndDate, ProductID, OrderID)
VALUES
    ('Employee Discount','Percentage',50.00,'1999-01-01','2099-01-01',NULL,NULL);
    INSERT INTO Discounts (Name, DiscountType, DiscountValue, StartDate, EndDate, ProductID, OrderID)
VALUES
    ('Spring Sale', 'Percentage', 25.00, '2025-03-01', '2025-03-31', NULL, NULL),
    ('Laptop Discount', 'Fixed Amount', 150.00, '2025-02-01', '2025-02-28', 2, NULL),
    ('Flash Sale', 'Percentage', 30.00, '2025-04-01', '2025-04-05', NULL, NULL),
    ('Valentine\'s Day Special', 'Fixed Amount', 5.00, '2025-02-14', '2025-02-14', NULL, 3),
    ('Black Friday Deal', 'Percentage', 40.00, '2025-11-27', '2025-11-30', NULL, NULL),
    ('Cyber Monday Discount', 'Percentage', 35.00, '2025-12-01', '2025-12-01', NULL, NULL),
    ('Student Discount', 'Percentage', 10.00, '2025-01-01', '2025-12-31', NULL, NULL),
    ('Winter Clearance', 'Fixed Amount', 50.00, '2025-01-01', '2025-01-15', NULL, NULL),
    ('Holiday Discount', 'Percentage', 15.00, '2025-12-01', '2025-12-24', NULL, 4),
    ('Summer Sale', 'Percentage', 20.00, '2025-06-01', '2025-06-30', NULL, NULL),
    ('Pre-Order Discount', 'Fixed Amount', 20.00, '2025-04-01', '2025-04-30', 3, NULL),
    ('Bundle Offer', 'Percentage', 10.00, '2025-05-01', '2025-05-31', NULL, NULL),
    ('Free Shipping', 'Fixed Amount', 0.00, '2025-01-01', '2025-12-31', NULL, 5),
    ('Christmas Promo', 'Percentage', 50.00, '2025-12-20', '2025-12-25', NULL, NULL),
    ('End of Year Sale', 'Percentage', 30.00, '2025-12-26', '2025-12-31', NULL, NULL),
    ('New Customer Discount', 'Percentage', 10.00, '2025-01-01', '2025-12-31', NULL, 6);
ALTER TABLE Products ADD Size VARCHAR(50);
SET SQL_SAFE_UPDATES = 0;
UPDATE products
SET Size = CASE
            WHEN ProductID = 1 THEN 'S'
            WHEN ProductID = 2 THEN 'M'
            WHEN ProductID = 3 THEN 'L'
            ELSE 'M'
           END;
UPDATE products
SET Size = CASE
             WHEN RAND() < 0.33 THEN 'S'
             WHEN RAND() BETWEEN 0.33 AND 0.66 THEN 'M'
             ELSE 'L'
           END;
SELECT * FROM Employees;
UPDATE Employees
SET Salary = 2400;
UPDATE Employees
SET Salary = 6000
WHERE Role = 'Store Manager';
UPDATE Employees
SET Salary = 3500
WHERE Role = 'Assistant Manager';
SHOW DATABASES;
USE CLOTHINGSTORE1;
SHOW TABLES;
SELECT * FROM Categories;
SELECT * FROM Products;
SELECT * FROM Suppliers;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Inventory;
SELECT * FROM Employees;
SELECT * FROM Transactions;
DROP TABLE Orders;
DROP TABLE Employees;
DROP TABLE Transactions;
SELECT * FROM Customers;
-- Afiseaza Numele si Prenumele Angajatilor
SELECT FirstName , LastName FROM Employees;
-- Afiseaza discounturile de tip procent
SELECT * FROM Discounts WHERE DiscountType = 'Percentage';
-- Afiseaza produsele din categoria barbati(1)-
SELECT * FROM Products WHERE CategoryID = 1;
-- Lista tuturor produselor cu categoriile lor si Supplieri sai
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.Price,
    p.Stock,
    c.Name AS CategoryName,
    s.Name AS SupplierName
FROM 
    Products p
JOIN 
    Categories c ON p.CategoryID = c.CategoryID
JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID;
-- Detaliile Comenzii cu informatiile produselor;
    SELECT 
    od.OrderDetailID,
    od.OrderID,
    p.Name AS ProductName,
    od.Quantity,
    od.Price
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID;
-- Numaratoarea Clientilor dupa Rol
SELECT 
    Role,
    COUNT(EmployeeID) AS EmployeeCount
FROM 
    Employees
GROUP BY 
    Role
ORDER BY 
    EmployeeCount DESC;

-- Cele mai Vandute 10 produse
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    SUM(od.Quantity) AS TotalSold
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.ProductID, p.Name
ORDER BY 
    TotalSold DESC
LIMIT 10;
-- Salariile totale per Rol in magazin 
SELECT 
    Role,
    SUM(Salary) AS TotalSalary
FROM 
    Employees
GROUP BY 
    Role
ORDER BY 
    TotalSalary DESC;
-- Afiseaza comenzile cu status 'platit'
    SELECT OrderID
FROM Transactions
WHERE PaymentStatus='Paid';

-- Clientul cel mai fidel
SELECT o.CustomerID, c.FirstName, c.LastName, COUNT(o.OrderID) AS TotalOrders
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Transactions t ON o.OrderID = t.OrderID
WHERE t.PaymentStatus = 'Paid'
GROUP BY o.CustomerID
ORDER BY TotalOrders DESC
LIMIT 1;
-- Top 3 Angajati cu cele mai multe vanzari
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    COUNT(t.TransactionID) AS TotalSales
FROM 
    Employees e
JOIN 
    Transactions t ON t.OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = t.OrderID)
GROUP BY 
    e.EmployeeID
ORDER BY 
    TotalSales DESC
LIMIT 3;
-- Afiseaza toate comenzile si detaliile clientilor
SELECT 
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email
FROM 
    Orders o
INNER JOIN 
    Customers c ON o.CustomerID = c.CustomerID
ORDER BY 
    o.OrderDate DESC;
-- Afiseaza toate comenzile si statutul comenzilor dar si data tranzactiei
SELECT 
    t.OrderID,
    t.TransactionDate,
    t.PaymentStatus,
    CASE 
        WHEN t.PaymentStatus = 'Paid' THEN 'Order Paid'
        WHEN t.PaymentStatus = 'Pending' THEN 'Order Pending'
        WHEN t.PaymentStatus = 'Failed' THEN 'Payment Failed'
        ELSE 'Unknown Status'
    END AS OrderStatus
FROM 
    Transactions t;
-- Afiseaza toti angajatii , concatenand Numele si prenumele acestora , Afisand si cine este "important" in companie
SELECT 
    EmployeeID,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Role,
    Salary,
    CASE
        WHEN Role = 'Store Manager' THEN 'Manager'
        WHEN Role = 'Assistant Manager' THEN 'Assistant'
        ELSE 'Staff'
    END AS RoleCategory
FROM Employees;
-- Aceasta interogare ofera o lista cu comenzile si produsele corespunzatoare , cantitatile preturile si costul total pentru fiecare produs dintr-o comanda
SELECT 
    o.OrderID,
    o.OrderDate,
    p.Name AS ProductName,  -- Use 'Name' for the product's name column
    od.Quantity,
    p.Price,
    (od.Quantity * p.Price) AS TotalPrice
FROM Orders o
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID;
-- selecteaza angajatii cu cel mai mic salariu
SELECT * 
FROM employees 
WHERE Salary = (SELECT MIN(Salary) FROM employees);
-- afiseaza comenzile angajatului cu nr x	
SELECT * FROM orders WHERE CustomerID = 5;
-- afiseaza produsele din categoria x
SELECT * FROM products WHERE CategoryID = 2;
-- afiseaza produsele cu un stock scazut in acest caz sub 30
SELECT * FROM products WHERE Stock < 30;
-- numarul de comenzi plasate
SELECT COUNT(*) FROM orders;
-- afisare nume produs marimi si stoc
SELECT Name, Size, Stock
FROM products;
