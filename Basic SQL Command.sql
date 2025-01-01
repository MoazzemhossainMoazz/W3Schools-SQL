--Distinct
select distinct Country from Customers;

select count(distinct country) from Customers;

--select count(*) as distinctCountries
--from (select distinct Country from Customers); --Incorrect Systax






--Where
select *
from customers
where Country = 'London';

select * 
from Customers
where CustomerID=1;

select *
from customers
where CustomerID > 60;

select *
from products
where Price <> 18;

select *
from products
where Price between 50 and 60;

select *
from customers
where City Like '%d'; 

select *
from customers
where city in('paris', 'london');







--Order by
select * from Products
order by price;

select *
from products
order by price desc;

select *
from Products
Order by ProductName;

select * 
from Products
order by ProductName desc;

select *
from Customers
order by Country, CustomerName;

select * 
from customers
order by Country asc, CustomerName desc;

select *
from customers
order by Country desc, CustomerName asc;


--And
select *
from customers
where Country='spain'and CustomerName like 'G%';

select *
from customers
where country = 'Spain'
and city = 'Madrid'
and postalcode > 12000;

select * 
from customers
where country = 'Spain' and  (customerName like 'G%' or customerName like 'R%');

select * 
from customers
where (customerName like 'G%' or customerName like 'R%') and country = 'Spain' ;

select * 
from customers
where Country = 'Spain' and customerName like 'G%' or customerName Like 'R%';







--OR
--Select all customers from Germany or Spain:
Select *
from customers
where country = 'Germany' or country = 'spain';


--The following SQL statement selects all fields from Customers where either City is "Berlin", CustomerName starts with the letter "G" or Country is "Norway":
select *
from customers
where city = 'Berlin' and CustomerName like 'G%' or Country = 'Norway';


--Select all Spanish customers that starts with either "G" or "R":
select *
from customers
where country = 'spain' and (customerName like 'G%' or CustomerName like 'R%');


--Select all customers that either:
--are from Spain and starts with either "G", or
--starts with the letter "R":
select *
from customers
where country = 'Spain' and customerName like 'G%' or CustomerName like 'R%';




--NOT
select customerName, country
from customers
where country <> 'spain';

select customerName, country
from customers
where not country = 'spain';

select customername
from customers
where not customername like 'A%'; 

--same as
select customername
from customers
where customername not like 'A%';

select *
from customers
where customerID not between 10 and 60;

--same as
select *
from customers
where not customerID between 10 and 60;

select *
from customers
where not country = 'Paris' or country = 'London';
--same as
select *
from customers
where country not in ('Paris', 'London');

--Select customers with a CustomerId not greater than 50:
select *
from customers
where not customerID > 50;

--Select customers with a CustomerID not less than 50:
select *
from customers
where not customerID < 50;

--Null values
select customerName, contactname, address
from customers
where address is null;

select customerName, ContactName, Address
from Customers
where address is not null;


--The following SQL statement updates the first customer (CustomerID = 1) with a new contact person and a new city.
update customers
set ContactName = 'Alfred Schmidt', city = 'Frankfurt'
where customerId = 1;

--The following SQL statement will update the ContactName to "Juan" for all records where country is "Mexico":
update customers
set ContactName = 'Juan'
where country = 'Mexico' and customerId = 2;


--Delete
--The following SQL statement deletes the customer "Alfreds Futterkiste" from the "Customers" table:
delete from customers
where CustomerName = 'Wolski';





--select top
--Select the first 3 records of the Customers table:
select *
from customers
LIMIT 3;


select top 50 percent *
from customers;

--The following SQL statement selects the first 50% of the records from the "Customers" table (for SQL Server/MS Access):
select *
from customers;


--select the first 3 record of the Customers table:
select *
from customers
fetch first 3 rows only;

--The following SQL statement selects the first three records from the "Customers" table, where the country is "Germany" (for SQL Server/MS Access):
select top 5 *
from Customers
where country = 'Germany';


--Min and Max
--Find the lowest price in the Price column:
select min(price)
from products;

--Find the highest price in the Price column:
select max(price)
from products;

select min(price) as SmallPrice, CategoryID
from products
group by categoryID;

--Find the total number of rows in the Products table:
select count(*)
from products;


--Find the number of products where Price is higher than 20:
select count(ProductID)
from products
where price>20;

--How many different prices are there in the Products table:
select count(distinct price)
from Products;


--Name the column "Number of records":
select count(*) as [Number of records]
from products;

--Here we use the COUNT() function and the GROUP BY clause, to return the number of records for each category in the Products table:
select count(*) as [Number of record], CategoryID
from Products
group by CategoryID;




--The following SQL statement selects the first 50% of the records from the "Customers" table (for SQL Server/MS Access):
select *
from customers;



--Sum
SELECT SUM(Quantity)
FROM Order_Details;


--Return the sum of the Quantity field for the product with ProductID 11:
select sum(quantity)
from Order_Details 
where productid = 11;

--Give the summarized column a name by using the AS keyword.
select sum(quantity) as Total
from Order_details;

select OrderID, Sum(Quantity) as [Total Quantity]
from order_Details
group by OrderID;


select sum(Quantity * 10)
from Order_Details;

select Sum(price * quantity)
from Order_details
Left Join Products ON Order_Details.ProductID = Products.ProductID

--Average 
select avg(price)
from Products;


select avg(Price)
from Products
where CategoryId = 1



--Like and wildcard
--Return all customers that starts with "b" and ends with "s":
select *
from customers
where customername like 'b%s';



--IN
--Return all customers from 'Germany', 'France', or 'UK'
select *
from customers
where country in ('Germany', 'France', 'UK');

--Return all customers that are NOT from 'Germany', 'France', or 'UK':
select *
from customers
where Country not in ('Germany', 'France', 'UK');


--Return all customers that have an order in the Orders table:
select *
from customers
where customerID in (select customerID from orders);

--Return all customers that have NOT placed any orders in the Orders table:
select *
from customers
where customerID not in(select customerID from orders);




--Between
--Selects all products with a price between 10 and 20:
select *
from Products 
where price between 10 and 20;


--To display the products outside the range of the previous example, use NOT BETWEEN:
select *
from products
where price not between 10 and 20;


--The following SQL statement selects all products with a price between 10 and 20. In addition, the CategoryID must be either 1,2, or 3:
select *
from products
where price between 10 and 20
and categoryID in (1,2,3);


--The following SQL statement selects all products with a ProductName alphabetically between Carnarvon Tigers and Mozzarella di Giovanni:
select * 
from products
where ProductName between 'Carnarvon Tigers' and 'Mozzarella di Giovanni'
order by ProductName;





select Products.ProductID, Categories.categoryID
from Products
Join Categories ON Products.CategoryID = Categories.CategoryID

select Products.ProductID, Categories.categoryID 
from categories
join Products on categories.categoryID = Products.categoryID;


select customers.CustomerName, Orders.OrderID
from customers
left join orders on customers.customerid = orders.customerid
order by customers.customerName;

select Orders.OrderID, customers.customerName 
from  orders
left join customers on  customers.customerId = orders.customerid
order by customers.customerName;


select *
from products;

select *
from categories;

