
Use W3SchoolsDB
select *
from Suppliers;

select *
from Products;

-----------------------------Exists-------------------------------------

--The following SQL statement returns TRUE and lists the suppliers with a product price less than 20:
select SupplierName, SupplierID
from Suppliers
where exists ( select ProductName 
from Products 
where Products.SupplierID = Suppliers.supplierID and Price < 20);


--The following SQL statement returns TRUE and lists the suppliers with a product price equal to 22:
select SupplierName, SupplierID
from Suppliers
where exists(select ProductName from Products where Products.SupplierID = Suppliers.SupplierID and Price =20);



-----------------------------------------Any, All----------------------------------------------------
select ProductName
from Products
where ProductID = ANY
(select ProductID from OrderDetails where Quantity = 10);


select ProductName
from Products
where ProductID = ANY(select ProductID from OrderDetails where Quantity > 99);


SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity > 1000);


 SELECT ALL ProductName
FROM Products
WHERE TRUE;


SELECT ProductName
FROM Products
WHERE ProductID = ALL
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity = 10);


  ---------------------------------------Select Into-----------------------------------
  --The following SQL statement creates a backup copy of Customers:
  select *
  into CustomerBacku2017
  from Customers;


  --The following SQL statement uses the IN clause to copy the table into a new table in another database:
  select *
  into CustomersBackup2017 IN 'Backup.mdb'
  from Customers;


  --The following SQL statement copies only a few columns into a new table:
  select CustomerName, ContactName
  Into CustomersBackup2017
  from Customers;


  --The following SQL statement copies only the German customers into a new table:
  select *
  Into CustomersGermany
  from Customers
  where Country = 'Germany';


  select Customers.CustomerName, Orders.OrderID
  into CustomersOrderBackup2017
  from Customers
  Left join Orders on Customers.CustomerID = orders.CustomerID;

  select * into newtable
  from oldtable
