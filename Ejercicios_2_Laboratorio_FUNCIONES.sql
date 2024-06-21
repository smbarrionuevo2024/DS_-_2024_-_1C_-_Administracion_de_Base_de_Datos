------------------------------------------------------
--	FUNCIONES ESCALARES
-- ---------------------------------------------------
--1)Crear una funci?n que devuelva el promedio de los productos.
--Tablas: Production.Product
--Campos: ListPrice

--2)Crear una funci?n que dado un c?digo de producto 
--  devuelva el total de ventas para dicho producto luego,
-- mediante una  consulta, traer c?digo y total de ventas.
--Tablas: Sales.SalesOrderDetail
--Campos: ProductID, LineTotal

--3) Crear una funci?n que dado un c?digo devuelva 
--  la cantidad de productos vendidos o cero si no se ha vendido.
--Tablas: Sales.SalesOrderDetail
--Campos: ProductID, OrderQty

--4)Crear una funci?n que devuelva el promedio de venta
-- luego obtner los productos cuyo precio sea inferior al promedio.
--Tablas: Sales.SalesOrderDetail, Production.Product
--Campos: ProductID, ListPrice

-----------------------------------------------------------------------------------------
--	FUNCIONES DE TABLA EN L?NEA
-- --------------------------------------------------------------------------------------
--5) Crear una funci?n que dado un a?o, devuelva nombre y  apellido de los empleados  
--que ingresaron ese a?o 
--Tablas: Person.Person, HumanResources.Employee
--Campos: FirstName, LastName,HireDate, BusinessEntityID

--6) Crear una funci?n que reciba un par?metro correspondiente a un precio 
-- y nos retorna una tabla con  c?digo,nombre, color y precio de todos los productos 
-- cuyo precio sea inferior al par?metro  ingresado
--Tablas: Production.Product
--Campos: ProductID, Name, Color, ListPrice

------------------------------------------------------------------
--	FUNCIONES DE MULTI SENTENCIA 
-- ---------------------------------------------------------------
--7)Realizar el mismo pedido que en el punto anterior pero utilizando este  tipo de funci?n
--Tablas: Production.Product
--Campos: ProductID, Name, Color, ListPrice
