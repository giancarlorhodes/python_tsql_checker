1  USE [master]
2  GO
/****** Object:  Database [MdcStandard]    Script Date: 9/27/2024 6:35:46 PM ******/
3  CREATE DATABASE [MdcStandard]
4   CONTAINMENT = NONE
5   ON  PRIMARY 
6  ( NAME = N'MdcStandard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER22\MSSQL\DATA\MdcStandard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
7   LOG ON 
8  ( NAME = N'MdcStandard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER22\MSSQL\DATA\MdcStandard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
9   WITH CATALOG_COLLATION = DATABASE_DEFAULT
10  GO
11  ALTER DATABASE [MdcStandard] SET COMPATIBILITY_LEVEL = 150
12  GO
13  IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
14  begin
15  EXEC [MdcStandard].[dbo].[sp_fulltext_database] @action = 'enable'
16  end
17  GO
18  ALTER DATABASE [MdcStandard] SET ANSI_NULL_DEFAULT OFF 
19  GO
20  ALTER DATABASE [MdcStandard] SET ANSI_NULLS OFF 
21  GO
22  ALTER DATABASE [MdcStandard] SET ANSI_PADDING OFF 
23  GO
24  ALTER DATABASE [MdcStandard] SET ANSI_WARNINGS OFF 
25  GO
26  ALTER DATABASE [MdcStandard] SET ARITHABORT OFF 
27  GO
28  ALTER DATABASE [MdcStandard] SET AUTO_CLOSE OFF 
29  GO
30  ALTER DATABASE [MdcStandard] SET AUTO_SHRINK OFF 
31  GO
32  ALTER DATABASE [MdcStandard] SET AUTO_UPDATE_STATISTICS ON 
33  GO
34  ALTER DATABASE [MdcStandard] SET CURSOR_CLOSE_ON_COMMIT OFF 
35  GO
36  ALTER DATABASE [MdcStandard] SET CURSOR_DEFAULT  GLOBAL 
37  GO
38  ALTER DATABASE [MdcStandard] SET CONCAT_NULL_YIELDS_NULL OFF 
39  GO
40  ALTER DATABASE [MdcStandard] SET NUMERIC_ROUNDABORT OFF 
41  GO
42  ALTER DATABASE [MdcStandard] SET QUOTED_IDENTIFIER OFF 
43  GO
44  ALTER DATABASE [MdcStandard] SET RECURSIVE_TRIGGERS OFF 
45  GO
46  ALTER DATABASE [MdcStandard] SET  DISABLE_BROKER 
47  GO
48  ALTER DATABASE [MdcStandard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
49  GO
50  ALTER DATABASE [MdcStandard] SET DATE_CORRELATION_OPTIMIZATION OFF 
51  GO
52  ALTER DATABASE [MdcStandard] SET TRUSTWORTHY OFF 
53  GO
54  ALTER DATABASE [MdcStandard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
55  GO
56  ALTER DATABASE [MdcStandard] SET PARAMETERIZATION SIMPLE 
57  GO
58  ALTER DATABASE [MdcStandard] SET READ_COMMITTED_SNAPSHOT OFF 
59  GO
60  ALTER DATABASE [MdcStandard] SET HONOR_BROKER_PRIORITY OFF 
61  GO
62  ALTER DATABASE [MdcStandard] SET RECOVERY SIMPLE 
63  GO
64  ALTER DATABASE [MdcStandard] SET  MULTI_USER 
65  GO
66  ALTER DATABASE [MdcStandard] SET PAGE_VERIFY CHECKSUM  
67  GO
68  ALTER DATABASE [MdcStandard] SET DB_CHAINING OFF 
69  GO
70  ALTER DATABASE [MdcStandard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
71  GO
72  ALTER DATABASE [MdcStandard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
73  GO
74  ALTER DATABASE [MdcStandard] SET DELAYED_DURABILITY = DISABLED 
75  GO
76  ALTER DATABASE [MdcStandard] SET ACCELERATED_DATABASE_RECOVERY = OFF  
77  GO
78  ALTER DATABASE [MdcStandard] SET QUERY_STORE = OFF
79  GO
80  USE [MdcStandard]
81  GO
/****** Object:  Table [dbo].[tblkProducts]    Script Date: 9/27/2024 6:35:47 PM ******/
82  SET ANSI_NULLS ON
83  GO
84  SET QUOTED_IDENTIFIER ON
85  GO
86  CREATE TABLE [dbo].[tblkProducts](
87  	[ProductID] [int] IDENTITY(1,1) NOT NULL,
88  	[ProductName] [nvarchar](40) NOT NULL,
89  	[SupplierID] [int] NULL,
90  	[CategoryID] [int] NULL,
91  	[QuantityPerUnit] [nvarchar](20) NULL,
92  	[UnitPrice] [money] NULL,
93  	[UnitsInStock] [smallint] NULL,
94  	[UnitsOnOrder] [smallint] NULL,
95  	[ReorderLevel] [smallint] NULL,
96  	[Discontinued] [bit] NOT NULL,
97   CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
98  (
99  	[ProductID] ASC
100  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
101  ) ON [PRIMARY]
102  GO
/****** Object:  View [dbo].[vw_CurrentProductList]    Script Date: 9/27/2024 6:35:47 PM ******/
103  SET ANSI_NULLS ON
104  GO
105  SET QUOTED_IDENTIFIER ON
106  GO
107  
108  
109  CREATE   view [dbo].[vw_CurrentProductList] AS
110  
111  
--=======================================================================================
--					D E F I N I T I O N
--=======================================================================================
-- Author:			Giancarlo Rhodes
-- Create Date:		05/24/2024
-- Description:		
--					
-- Integration:		
-- Update History:  Please see comment at bottom for changelog
--=======================================================================================
112  
113  SELECT Product_List.ProductID, Product_List.ProductName
114  FROM tblkProducts AS Product_List
115  WHERE (((Product_List.Discontinued)=0))
116  
117  
--=======================================================================================
--				Change Log
--=======================================================================================
-- Author:			
-- Create Date:		
-- Description:		View was modified			
-- Integration:		
-- Update History:  
--=======================================================================================
118  
119  
120  
121  GO
/****** Object:  Table [dbo].[tblEmployees]    Script Date: 9/27/2024 6:35:47 PM ******/
122  SET ANSI_NULLS ON
123  GO
124  SET QUOTED_IDENTIFIER ON
125  GO
126  CREATE TABLE [dbo].[tblEmployees](
127  	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
128  	[LastName] [nvarchar](20) NOT NULL,
129  	[FirstName] [nvarchar](10) NOT NULL,
130  	[Title] [nvarchar](30) NULL,
131  	[TitleOfCourtesy] [nvarchar](25) NULL,
132  	[BirthDate] [datetime] NULL,
133  	[HireDate] [datetime] NULL,
134  	[Address] [nvarchar](60) NULL,
135  	[City] [nvarchar](15) NULL,
136  	[Region] [nvarchar](15) NULL,
137  	[PostalCode] [nvarchar](10) NULL,
138  	[Country] [nvarchar](15) NULL,
139  	[HomePhone] [nvarchar](24) NULL,
140  	[Extension] [nvarchar](4) NULL,
141  	[Photo] [image] NULL,
142  	[Notes] [ntext] NULL,
143  	[ReportsTo] [int] NULL,
144  	[PhotoPath] [nvarchar](255) NULL,
145   CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
146  (
147  	[EmployeeID] ASC
148  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
149  ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
150  GO
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 9/27/2024 6:35:47 PM ******/
151  SET ANSI_NULLS ON
152  GO
153  SET QUOTED_IDENTIFIER ON
154  GO
155  CREATE TABLE [dbo].[tblCustomers](
156  	[CustomerID] [nchar](5) NOT NULL,
157  	[CompanyName] [nvarchar](40) NOT NULL,
158  	[ContactName] [nvarchar](30) NULL,
159  	[ContactTitle] [nvarchar](30) NULL,
160  	[Address] [nvarchar](60) NULL,
161  	[City] [nvarchar](15) NULL,
162  	[Region] [nvarchar](15) NULL,
163  	[PostalCode] [nvarchar](10) NULL,
164  	[Country] [nvarchar](15) NULL,
165  	[Phone] [nvarchar](24) NULL,
166  	[Fax] [nvarchar](24) NULL,
167   CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
168  (
169  	[CustomerID] ASC
170  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
171  ) ON [PRIMARY]
172  GO
/****** Object:  Table [dbo].[tblkShippers]    Script Date: 9/27/2024 6:35:47 PM ******/
173  SET ANSI_NULLS ON
174  GO
175  SET QUOTED_IDENTIFIER ON
176  GO
177  CREATE TABLE [dbo].[tblkShippers](
178  	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
179  	[CompanyName] [nvarchar](40) NOT NULL,
180  	[Phone] [nvarchar](24) NULL,
181   CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
182  (
183  	[ShipperID] ASC
184  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
185  ) ON [PRIMARY]
186  GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 9/27/2024 6:35:47 PM ******/
187  SET ANSI_NULLS ON
188  GO
189  SET QUOTED_IDENTIFIER ON
190  GO
191  CREATE TABLE [dbo].[tblOrders](
192  	[OrderID] [int] IDENTITY(1,1) NOT NULL,
193  	[CustomerID] [nchar](5) NULL,
194  	[EmployeeID] [int] NULL,
195  	[OrderDate] [datetime] NULL,
196  	[RequiredDate] [datetime] NULL,
197  	[ShippedDate] [datetime] NULL,
198  	[ShipVia] [int] NULL,
199  	[Freight] [money] NULL,
200  	[ShipName] [nvarchar](40) NULL,
201  	[ShipAddress] [nvarchar](60) NULL,
202  	[ShipCity] [nvarchar](15) NULL,
203  	[ShipRegion] [nvarchar](15) NULL,
204  	[ShipPostalCode] [nvarchar](10) NULL,
205  	[ShipCountry] [nvarchar](15) NULL,
206   CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
207  (
208  	[OrderID] ASC
209  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
210  ) ON [PRIMARY]
211  GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 9/27/2024 6:35:47 PM ******/
212  SET ANSI_NULLS ON
213  GO
214  SET QUOTED_IDENTIFIER ON
215  GO
216  CREATE TABLE [dbo].[tblOrderDetails](
217  	[OrderID] [int] NOT NULL,
218  	[ProductID] [int] NOT NULL,
219  	[UnitPrice] [money] NOT NULL,
220  	[Quantity] [smallint] NOT NULL,
221  	[Discount] [real] NOT NULL,
222   CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
223  (
224  	[OrderID] ASC,
225  	[ProductID] ASC
226  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
227  ) ON [PRIMARY]
228  GO
/****** Object:  View [dbo].[vw_Invoices]    Script Date: 9/27/2024 6:35:47 PM ******/
229  SET ANSI_NULLS ON
230  GO
231  SET QUOTED_IDENTIFIER ON
232  GO
233  
234  
235  CREATE   view [dbo].[vw_Invoices] AS
236  
237  
--=======================================================================================
--					D E F I N I T I O N
--=======================================================================================
-- Author:			Giancarlo Rhodes
-- Create Date:		05/24/2024
-- Description:		
--					
-- Integration:		
-- Update History:  Please see comment at bottom for changelog
--=======================================================================================
238  
239  
240  
241  SELECT tblOrders.ShipName, tblOrders.ShipAddress, tblOrders.ShipCity, tblOrders.ShipRegion, tblOrders.ShipPostalCode, 
242  	tblOrders.ShipCountry, tblOrders.CustomerID, tblCustomers.CompanyName AS CustomerName, tblCustomers.Address, tblCustomers.City, 
243  	tblCustomers.Region, tblCustomers.PostalCode, tblCustomers.Country, 
244  	(FirstName + ' ' + LastName) AS Salesperson, 
245  	tblOrders.OrderID, tblOrders.OrderDate, tblOrders.RequiredDate, tblOrders.ShippedDate, tblkShippers.CompanyName As ShipperName, 
246  	"tblOrderDetails".ProductID, tblkProducts.ProductName, "tblOrderDetails".UnitPrice, "tblOrderDetails".Quantity, 
247  	"tblOrderDetails".Discount, 
248  	(CONVERT(money,("tblOrderDetails".UnitPrice*Quantity*(1-Discount)/100))*100) AS ExtendedPrice, tblOrders.Freight
249  FROM 	tblkShippers INNER JOIN 
250  		(tblkProducts INNER JOIN 
251  			(
252  				(tblEmployees INNER JOIN 
253  					(tblCustomers INNER JOIN tblOrders ON tblCustomers.CustomerID = tblOrders.CustomerID) 
254  				ON tblEmployees.EmployeeID = tblOrders.EmployeeID) 
255  			INNER JOIN "tblOrderDetails" ON tblOrders.OrderID = "tblOrderDetails".OrderID) 
256  		ON tblkProducts.ProductID = "tblOrderDetails".ProductID) 
257  	ON tblkShippers.ShipperID = tblOrders.ShipVia
258  
259  
260  	
--=======================================================================================
--				Change Log
--=======================================================================================
-- Author:			
-- Create Date:		
-- Description:		View was modified			
-- Integration:		
-- Update History:  
--=======================================================================================
261  
262  
263  
264  
265  GO
/****** Object:  View [dbo].[vw_OrderDetailsExtended]    Script Date: 9/27/2024 6:35:47 PM ******/
266  SET ANSI_NULLS ON
267  GO
268  SET QUOTED_IDENTIFIER ON
269  GO
270  
271  CREATE
272  	
273  
274   VIEW [dbo].[vw_OrderDetailsExtended]
275  AS
--=======================================================================================
--					D E F I N I T I O N
--=======================================================================================
-- Author:			Giancarlo Rhodes
-- Create Date:		05/24/2024
-- Description:		
--					
-- Integration:		
-- Update History:  Please see comment at bottom for changelog
--=======================================================================================
276  SELECT tblOrderDetails.OrderID,
277  	tblOrderDetails.ProductID,
278  	tblkProducts.ProductName,
279  	tblOrderDetails.UnitPrice,
280  	tblOrderDetails.Quantity,
281  	tblOrderDetails.Discount,
282  	(CONVERT(MONEY, (tblOrderDetails.UnitPrice * Quantity * (1 - Discount) / 100)) * 100) AS ExtendedPrice
283  FROM tblkProducts
284  INNER JOIN tblOrderDetails ON tblkProducts.ProductID = tblOrderDetails.ProductID
	--=======================================================================================
	--				Change Log
	--=======================================================================================
	-- Author:			
	-- Create Date:		
	-- Description:		View was modified			
	-- Integration:		
	-- Update History:  
	--=======================================================================================
285  GO
/****** Object:  View [dbo].[vw_OrderSubtotals]    Script Date: 9/27/2024 6:35:47 PM ******/
286  SET ANSI_NULLS ON
287  GO
288  SET QUOTED_IDENTIFIER ON
289  GO
290  
291  CREATE
292  	
293  
294   VIEW [dbo].[vw_OrderSubtotals]
295  AS
296  
297  
--=======================================================================================
--					D E F I N I T I O N
--=======================================================================================
-- Author:			Giancarlo Rhodes
-- Create Date:		05/24/2024
-- Description:		
--					
-- Integration:		
-- Update History:  Please see comment at bottom for changelog
--=======================================================================================
298  
299  
300  SELECT tblOrderDetails.OrderID,
301  	Sum(CONVERT(MONEY, (tblOrderDetails.UnitPrice * Quantity * (1 - Discount) / 100)) * 100) AS Subtotal
302  FROM tblOrderDetails
303  GROUP BY tblOrderDetails.OrderID
304  
305  
--=======================================================================================
--				Change Log
--=======================================================================================
-- Author:			
-- Create Date:		
-- Description:		View was modified			
-- Integration:		
-- Update History:  
--=======================================================================================
306  
307  
308  
309  GO
310  
311  
--/****** Object:  View [dbo].[Orders Qry]    Script Date: 9/27/2024 6:35:47 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
312  
--create view [dbo].[Orders Qry] AS
--SELECT Orders.OrderID, Orders.CustomerID, Orders.EmployeeID, Orders.OrderDate, Orders.RequiredDate, 
--	Orders.ShippedDate, Orders.ShipVia, Orders.Freight, Orders.ShipName, Orders.ShipAddress, Orders.ShipCity, 
--	Orders.ShipRegion, Orders.ShipPostalCode, Orders.ShipCountry, 
--	Customers.CompanyName, Customers.Address, Customers.City, Customers.Region, Customers.PostalCode, Customers.Country
--FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
--GO
313  
314  
315  
--/****** Object:  View [dbo].[Product Sales for 1997]    Script Date: 9/27/2024 6:35:47 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
316  
--create view [dbo].[Product Sales for 1997] AS
--SELECT Categories.CategoryName, Products.ProductName, 
--Sum(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ProductSales
--FROM (Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID) 
--	INNER JOIN (Orders 
--		INNER JOIN "Order Details" ON Orders.OrderID = "Order Details".OrderID) 
--	ON Products.ProductID = "Order Details".ProductID
--WHERE (((Orders.ShippedDate) Between '19970101' And '19971231'))
--GROUP BY Categories.CategoryName, Products.ProductName
--GO
317  
318  
319  
320  
--/****** Object:  View [dbo].[Products Above Average Price]    Script Date: 9/27/2024 6:35:47 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
321  
--create view [dbo].[Products Above Average Price] AS
--SELECT Products.ProductName, Products.UnitPrice
--FROM Products
--WHERE Products.UnitPrice>(SELECT AVG(UnitPrice) From Products)
----ORDER BY Products.UnitPrice DESC
--GO
322  
323  
324  
325  
--/****** Object:  View [dbo].[Products by Category]    Script Date: 9/27/2024 6:35:47 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
326  
--create view [dbo].[Products by Category] AS
--SELECT Categories.CategoryName, Products.ProductName, Products.QuantityPerUnit, Products.UnitsInStock, Products.Discontinued
--FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
--WHERE Products.Discontinued <> 1
----ORDER BY Categories.CategoryName, Products.ProductName
--GO
327  
328  
329  
/****** Object:  View [dbo].[Quarterly Orders]    Script Date: 9/27/2024 6:35:47 PM ******/
330  SET ANSI_NULLS ON
331  GO
332  SET QUOTED_IDENTIFIER ON
333  GO
334  
335  create view [dbo].[Quarterly Orders] AS
336  SELECT DISTINCT Customers.CustomerID, Customers.CompanyName, Customers.City, Customers.Country
337  FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
338  WHERE Orders.OrderDate BETWEEN '19970101' And '19971231'
339  GO
340  
341  
342  
343  
344  
/****** Object:  View [dbo].[Sales by Category]    Script Date: 9/27/2024 6:35:47 PM ******/
345  SET ANSI_NULLS ON
346  GO
347  SET QUOTED_IDENTIFIER ON
348  GO
349  
350  create view [dbo].[Sales by Category] AS
351  SELECT Categories.CategoryID, Categories.CategoryName, Products.ProductName, 
352  	Sum("Order Details Extended".ExtendedPrice) AS ProductSales
353  FROM 	Categories INNER JOIN 
354  		(Products INNER JOIN 
355  			(Orders INNER JOIN "Order Details Extended" ON Orders.OrderID = "Order Details Extended".OrderID) 
356  		ON Products.ProductID = "Order Details Extended".ProductID) 
357  	ON Categories.CategoryID = Products.CategoryID
358  WHERE Orders.OrderDate BETWEEN '19970101' And '19971231'
359  GROUP BY Categories.CategoryID, Categories.CategoryName, Products.ProductName
--ORDER BY Products.ProductName
360  GO
361  
362  
363  
364  
/****** Object:  View [dbo].[Sales Totals by Amount]    Script Date: 9/27/2024 6:35:47 PM ******/
365  SET ANSI_NULLS ON
366  GO
367  SET QUOTED_IDENTIFIER ON
368  GO
369  
370  create view [dbo].[Sales Totals by Amount] AS
371  SELECT "Order Subtotals".Subtotal AS SaleAmount, Orders.OrderID, Customers.CompanyName, Orders.ShippedDate
372  FROM 	Customers INNER JOIN 
373  		(Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID) 
374  	ON Customers.CustomerID = Orders.CustomerID
375  WHERE ("Order Subtotals".Subtotal >2500) AND (Orders.ShippedDate BETWEEN '19970101' And '19971231')
376  GO
377  
378  
379  
/****** Object:  View [dbo].[Summary of Sales by Quarter]    Script Date: 9/27/2024 6:35:47 PM ******/
380  SET ANSI_NULLS ON
381  GO
382  SET QUOTED_IDENTIFIER ON
383  GO
384  
385  create view [dbo].[Summary of Sales by Quarter] AS
386  SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal
387  FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
388  WHERE Orders.ShippedDate IS NOT NULL
--ORDER BY Orders.ShippedDate
389  GO
390  
391  
392  
393  
/****** Object:  View [dbo].[Summary of Sales by Year]    Script Date: 9/27/2024 6:35:47 PM ******/
394  SET ANSI_NULLS ON
395  GO
396  SET QUOTED_IDENTIFIER ON
397  GO
398  
399  create view [dbo].[Summary of Sales by Year] AS
400  SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal
401  FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
402  WHERE Orders.ShippedDate IS NOT NULL
--ORDER BY Orders.ShippedDate
403  GO
404  
405  
406  
/****** Object:  View [dbo].[vw_CustomerAndSuppliersByCity]    Script Date: 9/27/2024 6:35:47 PM ******/
407  SET ANSI_NULLS ON
408  GO
409  SET QUOTED_IDENTIFIER ON
410  GO
411  
412  
413  create view [dbo].[vw_CustomerAndSuppliersByCity] AS
414  SELECT City, CompanyName, ContactName, 'Customers' AS Relationship 
415  FROM Customers
416  UNION SELECT City, CompanyName, ContactName, 'Suppliers'
417  FROM Suppliers
--ORDER BY City, CompanyName
418  GO
419  
420  
421  
/****** Object:  Table [dbo].[TableTest]    Script Date: 9/27/2024 6:35:47 PM ******/
422  SET ANSI_NULLS ON
423  GO
424  SET QUOTED_IDENTIFIER ON
425  GO
426  CREATE TABLE [dbo].[TableTest](
427  	[ID] [uniqueidentifier] NOT NULL,
428  	[Data] [nvarchar](max) NULL,
429   CONSTRAINT [PK_TableTest] PRIMARY KEY CLUSTERED 
430  (
431  	[ID] ASC
432  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
433  ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
434  GO
435  
436  
437  
438  
/****** Object:  Table [dbo].[tblCategories]    Script Date: 9/27/2024 6:35:47 PM ******/
439  SET ANSI_NULLS ON
440  GO
441  SET QUOTED_IDENTIFIER ON
442  GO
443  CREATE TABLE [dbo].[tblCategories](
444  	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
445  	[CategoryName] [nvarchar](15) NOT NULL,
446  	[Description] [ntext] NULL,
447  	[Picture] [image] NULL,
448   CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
449  (
450  	[CategoryID] ASC
451  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
452  ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
453  GO
454  
455  
456  
/****** Object:  Table [dbo].[tblCustomerCustomerDemo]    Script Date: 9/27/2024 6:35:47 PM ******/
457  SET ANSI_NULLS ON
458  GO
459  SET QUOTED_IDENTIFIER ON
460  GO
461  CREATE TABLE [dbo].[tblCustomerCustomerDemo](
462  	[CustomerID] [nchar](5) NOT NULL,
463  	[CustomerTypeID] [nchar](10) NOT NULL,
464   CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY NONCLUSTERED 
465  (
466  	[CustomerID] ASC,
467  	[CustomerTypeID] ASC
468  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
469  ) ON [PRIMARY]
470  GO
471  
472  
473  
/****** Object:  Table [dbo].[tblCustomerDemographics]    Script Date: 9/27/2024 6:35:47 PM ******/
474  SET ANSI_NULLS ON
475  GO
476  SET QUOTED_IDENTIFIER ON
477  GO
478  CREATE TABLE [dbo].[tblCustomerDemographics](
479  	[CustomerTypeID] [nchar](10) NOT NULL,
480  	[CustomerDesc] [ntext] NULL,
481   CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY NONCLUSTERED 
482  (
483  	[CustomerTypeID] ASC
484  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
485  ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
486  GO
487  
488  
489  
490  
/****** Object:  Table [dbo].[tblEmployeeTerritories]    Script Date: 9/27/2024 6:35:47 PM ******/
491  SET ANSI_NULLS ON
492  GO
493  SET QUOTED_IDENTIFIER ON
494  GO
495  CREATE TABLE [dbo].[tblEmployeeTerritories](
496  	[EmployeeID] [int] NOT NULL,
497  	[TerritoryID] [nvarchar](20) NOT NULL,
498   CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY NONCLUSTERED 
499  (
500  	[EmployeeID] ASC,
501  	[TerritoryID] ASC
502  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
503  ) ON [PRIMARY]
504  GO
505  
506  
507  
/****** Object:  Table [dbo].[tblkRegion]    Script Date: 9/27/2024 6:35:47 PM ******/
508  SET ANSI_NULLS ON
509  GO
510  SET QUOTED_IDENTIFIER ON
511  GO
512  CREATE TABLE [dbo].[tblkRegion](
513  	[RegionID] [int] NOT NULL,
514  	[RegionDescription] [nchar](50) NOT NULL,
515   CONSTRAINT [PK_Region] PRIMARY KEY NONCLUSTERED 
516  (
517  	[RegionID] ASC
518  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
519  ) ON [PRIMARY]
520  GO
521  
522  
523  
/****** Object:  Table [dbo].[tblkSuppliers]    Script Date: 9/27/2024 6:35:47 PM ******/
524  SET ANSI_NULLS ON
525  GO
526  SET QUOTED_IDENTIFIER ON
527  GO
528  CREATE TABLE [dbo].[tblkSuppliers](
529  	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
530  	[CompanyName] [nvarchar](40) NOT NULL,
531  	[ContactName] [nvarchar](30) NULL,
532  	[ContactTitle] [nvarchar](30) NULL,
533  	[Address] [nvarchar](60) NULL,
534  	[City] [nvarchar](15) NULL,
535  	[Region] [nvarchar](15) NULL,
536  	[PostalCode] [nvarchar](10) NULL,
537  	[Country] [nvarchar](15) NULL,
538  	[Phone] [nvarchar](24) NULL,
539  	[Fax] [nvarchar](24) NULL,
540  	[HomePage] [ntext] NULL,
541   CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
542  (
543  	[SupplierID] ASC
544  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
545  ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
546  GO
547  
548  
549  
/****** Object:  Table [dbo].[tblkTerritories]    Script Date: 9/27/2024 6:35:47 PM ******/
550  SET ANSI_NULLS ON
551  GO
552  SET QUOTED_IDENTIFIER ON
553  GO
554  CREATE TABLE [dbo].[tblkTerritories](
555  	[TerritoryID] [nvarchar](20) NOT NULL,
556  	[TerritoryDescription] [nchar](50) NOT NULL,
557  	[RegionID] [int] NOT NULL,
558   CONSTRAINT [PK_Territories] PRIMARY KEY NONCLUSTERED 
559  (
560  	[TerritoryID] ASC
561  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
562  ) ON [PRIMARY]
563  GO
564  SET ANSI_PADDING ON
565  GO
566  
567  
568  
/****** Object:  Index [CategoryName]    Script Date: 9/27/2024 6:35:47 PM ******/
569  CREATE NONCLUSTERED INDEX [CategoryName] ON [dbo].[tblCategories]
570  (
571  	[CategoryName] ASC
572  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
573  GO
574  SET ANSI_PADDING ON
575  GO
/****** Object:  Index [City]    Script Date: 9/27/2024 6:35:47 PM ******/
576  CREATE NONCLUSTERED INDEX [City] ON [dbo].[tblCustomers]
577  (
578  	[City] ASC
579  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
580  GO
581  SET ANSI_PADDING ON
582  GO
/****** Object:  Index [CompanyName]    Script Date: 9/27/2024 6:35:47 PM ******/
583  CREATE NONCLUSTERED INDEX [CompanyName] ON [dbo].[tblCustomers]
584  (
585  	[CompanyName] ASC
586  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
587  GO
588  SET ANSI_PADDING ON
589  GO
/****** Object:  Index [PostalCode]    Script Date: 9/27/2024 6:35:47 PM ******/
590  CREATE NONCLUSTERED INDEX [PostalCode] ON [dbo].[tblCustomers]
591  (
592  	[PostalCode] ASC
593  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
594  GO
595  SET ANSI_PADDING ON
596  GO
/****** Object:  Index [Region]    Script Date: 9/27/2024 6:35:47 PM ******/
597  CREATE NONCLUSTERED INDEX [Region] ON [dbo].[tblCustomers]
598  (
599  	[Region] ASC
600  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
601  GO
602  SET ANSI_PADDING ON
603  GO
/****** Object:  Index [NDX_LastName]    Script Date: 9/27/2024 6:35:47 PM ******/
604  CREATE NONCLUSTERED INDEX [NDX_LastName] ON [dbo].[tblEmployees]
605  (
606  	[LastName] ASC
607  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
608  GO
609  SET ANSI_PADDING ON
610  GO
/****** Object:  Index [NDX_PostalCode]    Script Date: 9/27/2024 6:35:47 PM ******/
611  CREATE NONCLUSTERED INDEX [NDX_PostalCode] ON [dbo].[tblEmployees]
612  (
613  	[PostalCode] ASC
614  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
615  GO
/****** Object:  Index [CategoriesProducts]    Script Date: 9/27/2024 6:35:47 PM ******/
616  CREATE NONCLUSTERED INDEX [CategoriesProducts] ON [dbo].[tblkProducts]
617  (
618  	[CategoryID] ASC
619  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
620  GO
/****** Object:  Index [CategoryID]    Script Date: 9/27/2024 6:35:47 PM ******/
621  CREATE NONCLUSTERED INDEX [CategoryID] ON [dbo].[tblkProducts]
622  (
623  	[CategoryID] ASC
624  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
625  GO
626  SET ANSI_PADDING ON
627  GO
/****** Object:  Index [ProductName]    Script Date: 9/27/2024 6:35:47 PM ******/
628  CREATE NONCLUSTERED INDEX [ProductName] ON [dbo].[tblkProducts]
629  (
630  	[ProductName] ASC
631  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
632  GO
/****** Object:  Index [SupplierID]    Script Date: 9/27/2024 6:35:47 PM ******/
633  CREATE NONCLUSTERED INDEX [SupplierID] ON [dbo].[tblkProducts]
634  (
635  	[SupplierID] ASC
636  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
637  GO
/****** Object:  Index [SuppliersProducts]    Script Date: 9/27/2024 6:35:47 PM ******/
638  CREATE NONCLUSTERED INDEX [SuppliersProducts] ON [dbo].[tblkProducts]
639  (
640  	[SupplierID] ASC
641  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
642  GO
643  SET ANSI_PADDING ON
644  GO
/****** Object:  Index [CompanyName]    Script Date: 9/27/2024 6:35:47 PM ******/
645  CREATE NONCLUSTERED INDEX [CompanyName] ON [dbo].[tblkSuppliers]
646  (
647  	[CompanyName] ASC
648  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
649  GO
650  SET ANSI_PADDING ON
651  GO
/****** Object:  Index [PostalCode]    Script Date: 9/27/2024 6:35:47 PM ******/
652  CREATE NONCLUSTERED INDEX [PostalCode] ON [dbo].[tblkSuppliers]
653  (
654  	[PostalCode] ASC
655  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
656  GO
/****** Object:  Index [OrderID]    Script Date: 9/27/2024 6:35:47 PM ******/
657  CREATE NONCLUSTERED INDEX [OrderID] ON [dbo].[tblOrderDetails]
658  (
659  	[OrderID] ASC
660  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
661  GO
/****** Object:  Index [OrdersOrder_Details]    Script Date: 9/27/2024 6:35:47 PM ******/
662  CREATE NONCLUSTERED INDEX [OrdersOrder_Details] ON [dbo].[tblOrderDetails]
663  (
664  	[OrderID] ASC
665  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
666  GO
/****** Object:  Index [ProductID]    Script Date: 9/27/2024 6:35:47 PM ******/
667  CREATE NONCLUSTERED INDEX [ProductID] ON [dbo].[tblOrderDetails]
668  (
669  	[ProductID] ASC
670  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
671  GO
/****** Object:  Index [ProductsOrder_Details]    Script Date: 9/27/2024 6:35:47 PM ******/
672  CREATE NONCLUSTERED INDEX [ProductsOrder_Details] ON [dbo].[tblOrderDetails]
673  (
674  	[ProductID] ASC
675  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
676  GO
677  SET ANSI_PADDING ON
678  GO
/****** Object:  Index [CustomerID]    Script Date: 9/27/2024 6:35:47 PM ******/
679  CREATE NONCLUSTERED INDEX [CustomerID] ON [dbo].[tblOrders]
680  (
681  	[CustomerID] ASC
682  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
683  GO
684  SET ANSI_PADDING ON
685  GO
/****** Object:  Index [CustomersOrders]    Script Date: 9/27/2024 6:35:47 PM ******/
686  CREATE NONCLUSTERED INDEX [CustomersOrders] ON [dbo].[tblOrders]
687  (
688  	[CustomerID] ASC
689  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
690  GO
/****** Object:  Index [EmployeeID]    Script Date: 9/27/2024 6:35:47 PM ******/
691  CREATE NONCLUSTERED INDEX [EmployeeID] ON [dbo].[tblOrders]
692  (
693  	[EmployeeID] ASC
694  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
695  GO
/****** Object:  Index [EmployeesOrders]    Script Date: 9/27/2024 6:35:47 PM ******/
696  CREATE NONCLUSTERED INDEX [EmployeesOrders] ON [dbo].[tblOrders]
697  (
698  	[EmployeeID] ASC
699  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
700  GO
/****** Object:  Index [OrderDate]    Script Date: 9/27/2024 6:35:47 PM ******/
701  CREATE NONCLUSTERED INDEX [OrderDate] ON [dbo].[tblOrders]
702  (
703  	[OrderDate] ASC
704  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
705  GO
/****** Object:  Index [ShippedDate]    Script Date: 9/27/2024 6:35:47 PM ******/
706  CREATE NONCLUSTERED INDEX [ShippedDate] ON [dbo].[tblOrders]
707  (
708  	[ShippedDate] ASC
709  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
710  GO
/****** Object:  Index [ShippersOrders]    Script Date: 9/27/2024 6:35:47 PM ******/
711  CREATE NONCLUSTERED INDEX [ShippersOrders] ON [dbo].[tblOrders]
712  (
713  	[ShipVia] ASC
714  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
715  GO
716  SET ANSI_PADDING ON
717  GO
/****** Object:  Index [ShipPostalCode]    Script Date: 9/27/2024 6:35:47 PM ******/
718  CREATE NONCLUSTERED INDEX [ShipPostalCode] ON [dbo].[tblOrders]
719  (
720  	[ShipPostalCode] ASC
721  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
722  GO
723  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
724  GO
725  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_UnitsInStock]  DEFAULT ((0)) FOR [UnitsInStock]
726  GO
727  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_UnitsOnOrder]  DEFAULT ((0)) FOR [UnitsOnOrder]
728  GO
729  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_ReorderLevel]  DEFAULT ((0)) FOR [ReorderLevel]
730  GO
731  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_Discontinued]  DEFAULT ((0)) FOR [Discontinued]
732  GO
733  ALTER TABLE [dbo].[tblOrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
734  GO
735  ALTER TABLE [dbo].[tblOrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
736  GO
737  ALTER TABLE [dbo].[tblOrderDetails] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [Discount]
738  GO
739  ALTER TABLE [dbo].[tblOrders] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)) FOR [Freight]
740  GO
741  ALTER TABLE [dbo].[tblCustomerCustomerDemo]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCustomerDemo] FOREIGN KEY([CustomerTypeID])
742  REFERENCES [dbo].[tblCustomerDemographics] ([CustomerTypeID])
743  GO
744  ALTER TABLE [dbo].[tblCustomerCustomerDemo] CHECK CONSTRAINT [FK_CustomerCustomerDemo]
745  GO
746  ALTER TABLE [dbo].[tblCustomerCustomerDemo]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCustomerDemo_Customers] FOREIGN KEY([CustomerID])
747  REFERENCES [dbo].[tblCustomers] ([CustomerID])
748  GO
749  ALTER TABLE [dbo].[tblCustomerCustomerDemo] CHECK CONSTRAINT [FK_CustomerCustomerDemo_Customers]
750  GO
751  ALTER TABLE [dbo].[tblEmployees]  WITH NOCHECK ADD  CONSTRAINT [FK_tblEmployeesTerritories_TerritoryID] FOREIGN KEY([ReportsTo])
752  REFERENCES [dbo].[tblEmployees] ([EmployeeID])
753  GO
754  ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployeesTerritories_TerritoryID]
755  GO
756  ALTER TABLE [dbo].[tblEmployeeTerritories]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY([EmployeeID])
757  REFERENCES [dbo].[tblEmployees] ([EmployeeID])
758  GO
759  ALTER TABLE [dbo].[tblEmployeeTerritories] CHECK CONSTRAINT [FK_EmployeeTerritories_Employees]
760  GO
761  ALTER TABLE [dbo].[tblEmployeeTerritories]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY([TerritoryID])
762  REFERENCES [dbo].[tblkTerritories] ([TerritoryID])
763  GO
764  ALTER TABLE [dbo].[tblEmployeeTerritories] CHECK CONSTRAINT [FK_EmployeeTerritories_Territories]
765  GO
766  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
767  REFERENCES [dbo].[tblCategories] ([CategoryID])
768  GO
769  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [FK_Products_Categories]
770  GO
771  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
772  REFERENCES [dbo].[tblkSuppliers] ([SupplierID])
773  GO
774  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [FK_Products_Suppliers]
775  GO
776  ALTER TABLE [dbo].[tblkTerritories]  WITH CHECK ADD  CONSTRAINT [FK_Territories_Region] FOREIGN KEY([RegionID])
777  REFERENCES [dbo].[tblkRegion] ([RegionID])
778  GO
779  ALTER TABLE [dbo].[tblkTerritories] CHECK CONSTRAINT [FK_Territories_Region]
780  GO
781  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([OrderID])
782  REFERENCES [dbo].[tblOrders] ([OrderID])
783  GO
784  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_Order_Details_Orders]
785  GO
786  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY([ProductID])
787  REFERENCES [dbo].[tblkProducts] ([ProductID])
788  GO
789  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_Order_Details_Products]
790  GO
791  ALTER TABLE [dbo].[tblOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
792  REFERENCES [dbo].[tblCustomers] ([CustomerID])
793  GO
794  ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_Orders_Customers]
795  GO
796  ALTER TABLE [dbo].[tblOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
797  REFERENCES [dbo].[tblEmployees] ([EmployeeID])
798  GO
799  ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_Orders_Employees]
800  GO
801  ALTER TABLE [dbo].[tblOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipVia])
802  REFERENCES [dbo].[tblkShippers] ([ShipperID])
803  GO
804  ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_Orders_Shippers]
805  GO
806  ALTER TABLE [dbo].[tblEmployees]  WITH NOCHECK ADD  CONSTRAINT [CK_Birthdate] CHECK  (([BirthDate]<getdate()))
807  GO
808  ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [CK_Birthdate]
809  GO
810  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [CK_Products_UnitPrice] CHECK  (([UnitPrice]>=(0)))
811  GO
812  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [CK_Products_UnitPrice]
813  GO
814  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [CK_ReorderLevel] CHECK  (([ReorderLevel]>=(0)))
815  GO
816  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [CK_ReorderLevel]
817  GO
818  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsInStock] CHECK  (([UnitsInStock]>=(0)))
819  GO
820  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [CK_UnitsInStock]
821  GO
822  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsOnOrder] CHECK  (([UnitsOnOrder]>=(0)))
823  GO
824  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [CK_UnitsOnOrder]
825  GO
826  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [CK_Discount] CHECK  (([Discount]>=(0) AND [Discount]<=(1)))
827  GO
828  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [CK_Discount]
829  GO
830  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [CK_Quantity] CHECK  (([Quantity]>(0)))
831  GO
832  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [CK_Quantity]
833  GO
834  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitPrice] CHECK  (([UnitPrice]>=(0)))
835  GO
836  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [CK_UnitPrice]
837  GO
/****** Object:  StoredProcedure [dbo].[CustOrdersOrders]    Script Date: 9/27/2024 6:35:47 PM ******/
838  SET ANSI_NULLS ON
839  GO
840  SET QUOTED_IDENTIFIER ON
841  GO
842  
843  CREATE PROCEDURE [dbo].[CustOrdersOrders] @CustomerID nchar(5)
844  AS
845  SELECT OrderID, 
846  	OrderDate,
847  	RequiredDate,
848  	ShippedDate
849  FROM Orders
850  WHERE CustomerID = @CustomerID
851  ORDER BY OrderID
852  GO
/****** Object:  StoredProcedure [dbo].[Employee Sales by Country]    Script Date: 9/27/2024 6:35:47 PM ******/
853  SET ANSI_NULLS ON
854  GO
855  SET QUOTED_IDENTIFIER ON
856  GO
857  
858  create procedure [dbo].[Employee Sales by Country] 
859  @Beginning_Date DateTime, @Ending_Date DateTime AS
860  SELECT Employees.Country, Employees.LastName, Employees.FirstName, Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal AS SaleAmount
861  FROM Employees INNER JOIN 
862  	(Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID) 
863  	ON Employees.EmployeeID = Orders.EmployeeID
864  WHERE Orders.ShippedDate Between @Beginning_Date And @Ending_Date
865  GO
/****** Object:  StoredProcedure [dbo].[Sales by Year]    Script Date: 9/27/2024 6:35:47 PM ******/
866  SET ANSI_NULLS ON
867  GO
868  SET QUOTED_IDENTIFIER ON
869  GO
870  
871  create procedure [dbo].[Sales by Year] 
872  	@Beginning_Date DateTime, @Ending_Date DateTime AS
873  SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal, DATENAME(yy,ShippedDate) AS Year
874  FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
875  WHERE Orders.ShippedDate Between @Beginning_Date And @Ending_Date
876  GO
/****** Object:  StoredProcedure [dbo].[SalesByCategory]    Script Date: 9/27/2024 6:35:47 PM ******/
877  SET ANSI_NULLS ON
878  GO
879  SET QUOTED_IDENTIFIER ON
880  GO
881  CREATE PROCEDURE [dbo].[SalesByCategory]
882      @CategoryName nvarchar(15), @OrdYear nvarchar(4) = '1998'
883  AS
884  IF @OrdYear != '1996' AND @OrdYear != '1997' AND @OrdYear != '1998' 
885  BEGIN
886  	SELECT @OrdYear = '1998'
887  END
888  
889  SELECT ProductName,
890  	TotalPurchase=ROUND(SUM(CONVERT(decimal(14,2), OD.Quantity * (1-OD.Discount) * OD.UnitPrice)), 0)
891  FROM [Order Details] OD, Orders O, Products P, Categories C
892  WHERE OD.OrderID = O.OrderID 
893  	AND OD.ProductID = P.ProductID 
894  	AND P.CategoryID = C.CategoryID
895  	AND C.CategoryName = @CategoryName
896  	AND SUBSTRING(CONVERT(nvarchar(22), O.OrderDate, 111), 1, 4) = @OrdYear
897  GROUP BY ProductName
898  ORDER BY ProductName
899  GO
/****** Object:  StoredProcedure [dbo].[Ten Most Expensive Products]    Script Date: 9/27/2024 6:35:47 PM ******/
900  SET ANSI_NULLS ON
901  GO
902  SET QUOTED_IDENTIFIER ON
903  GO
904  
905  create procedure [dbo].[Ten Most Expensive Products] AS
906  SET ROWCOUNT 10
907  SELECT Products.ProductName AS TenMostExpensiveProducts, Products.UnitPrice
908  FROM Products
909  ORDER BY Products.UnitPrice DESC
910  GO
/****** Object:  StoredProcedure [dbo].[uspCustOrderHist]    Script Date: 9/27/2024 6:35:47 PM ******/
911  SET ANSI_NULLS ON
912  GO
913  SET QUOTED_IDENTIFIER ON
914  GO
915  
916  CREATE
917  	
918  
919   PROCEDURE [dbo].[uspCustOrderHist] @parmCustomerID NCHAR(5)
920  AS
--=======================================================================================
--					D E F I N I T I O N
--=======================================================================================
-- Author:			Giancarlo Rhodes
-- Create Date:		05/24/2024
-- Description:		
--					
-- Integration:		
-- Update History:  Please see comment at bottom for changelog
--=======================================================================================
921  SELECT ProductName,
922  	Total = SUM(Quantity)
923  FROM Products P,
924  	[Order Details] OD,
925  	Orders O,
926  	Customers C
927  WHERE C.CustomerID = @parmCustomerID
928  	AND C.CustomerID = O.CustomerID
929  	AND O.OrderID = OD.OrderID
930  	AND OD.ProductID = P.ProductID
931  GROUP BY ProductName
	--=======================================================================================
	--				Change Log
	--=======================================================================================
	-- Author:			
	-- Create Date:		
	-- Description:		View was modified			
	-- Integration:		
	-- Update History:  
	--=======================================================================================
932  GO
/****** Object:  StoredProcedure [dbo].[uspCustOrdersDetail]    Script Date: 9/27/2024 6:35:47 PM ******/
933  SET ANSI_NULLS ON
934  GO
935  SET QUOTED_IDENTIFIER ON
936  GO
937  
938  CREATE PROCEDURE [dbo].[uspCustOrdersDetail] @parmOrderID int
939  AS
940  
--=======================================================================================
--					D E F I N I T I O N
--=======================================================================================
-- Author:			Giancarlo Rhodes
-- Create Date:		05/24/2024
-- Description:		
--					
-- Integration:		
-- Update History:  Please see comment at bottom for changelog
--=======================================================================================
941  
942  SELECT ProductName,
943      UnitPrice=ROUND(Od.UnitPrice, 2),
944      Quantity,
945      Discount=CONVERT(int, Discount * 100), 
946      ExtendedPrice=ROUND(CONVERT(money, Quantity * (1 - Discount) * Od.UnitPrice), 2)
947  FROM Products P, [Order Details] Od
948  WHERE Od.ProductID = P.ProductID and Od.OrderID = @parmOrderID
949  
--=======================================================================================
--				Change Log
--=======================================================================================
-- Author:			
-- Create Date:		
-- Description:		View was modified			
-- Integration:		
-- Update History:  
--=======================================================================================
950  
951  
952  
953  GO
954  USE [master]
955  GO
956  ALTER DATABASE [MdcStandard] SET  READ_WRITE 
957  GO

-- Processing Log --
-- 10-17-2024 18:14:50 - File copied and updated with line numbers (comments skipped): C:\github\giancarlorhodes\python_tsql_checker\tsql\check_MdcStandard_processed_10172024181450.sql
-- 10-17-2024 18:14:50 - Processing complete (without validation).
