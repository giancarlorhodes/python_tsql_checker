1  USE [master]
2  GO
3  /****** Object:  Database [MdcStandard]    Script Date: 9/27/2024 6:35:46 PM ******/
4  CREATE DATABASE [MdcStandard]
5   CONTAINMENT = NONE
6   ON  PRIMARY 
7  ( NAME = N'MdcStandard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER22\MSSQL\DATA\MdcStandard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
8   LOG ON 
9  ( NAME = N'MdcStandard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER22\MSSQL\DATA\MdcStandard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
10   WITH CATALOG_COLLATION = DATABASE_DEFAULT
11  GO
12  ALTER DATABASE [MdcStandard] SET COMPATIBILITY_LEVEL = 150
13  GO
14  IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
15  begin
16  EXEC [MdcStandard].[dbo].[sp_fulltext_database] @action = 'enable'
17  end
18  GO
19  ALTER DATABASE [MdcStandard] SET ANSI_NULL_DEFAULT OFF 
20  GO
21  ALTER DATABASE [MdcStandard] SET ANSI_NULLS OFF 
22  GO
23  ALTER DATABASE [MdcStandard] SET ANSI_PADDING OFF 
24  GO
25  ALTER DATABASE [MdcStandard] SET ANSI_WARNINGS OFF 
26  GO
27  ALTER DATABASE [MdcStandard] SET ARITHABORT OFF 
28  GO
29  ALTER DATABASE [MdcStandard] SET AUTO_CLOSE OFF 
30  GO
31  ALTER DATABASE [MdcStandard] SET AUTO_SHRINK OFF 
32  GO
33  ALTER DATABASE [MdcStandard] SET AUTO_UPDATE_STATISTICS ON 
34  GO
35  ALTER DATABASE [MdcStandard] SET CURSOR_CLOSE_ON_COMMIT OFF 
36  GO
37  ALTER DATABASE [MdcStandard] SET CURSOR_DEFAULT  GLOBAL 
38  GO
39  ALTER DATABASE [MdcStandard] SET CONCAT_NULL_YIELDS_NULL OFF 
40  GO
41  ALTER DATABASE [MdcStandard] SET NUMERIC_ROUNDABORT OFF 
42  GO
43  ALTER DATABASE [MdcStandard] SET QUOTED_IDENTIFIER OFF 
44  GO
45  ALTER DATABASE [MdcStandard] SET RECURSIVE_TRIGGERS OFF 
46  GO
47  ALTER DATABASE [MdcStandard] SET  DISABLE_BROKER 
48  GO
49  ALTER DATABASE [MdcStandard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
50  GO
51  ALTER DATABASE [MdcStandard] SET DATE_CORRELATION_OPTIMIZATION OFF 
52  GO
53  ALTER DATABASE [MdcStandard] SET TRUSTWORTHY OFF 
54  GO
55  ALTER DATABASE [MdcStandard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
56  GO
57  ALTER DATABASE [MdcStandard] SET PARAMETERIZATION SIMPLE 
58  GO
59  ALTER DATABASE [MdcStandard] SET READ_COMMITTED_SNAPSHOT OFF 
60  GO
61  ALTER DATABASE [MdcStandard] SET HONOR_BROKER_PRIORITY OFF 
62  GO
63  ALTER DATABASE [MdcStandard] SET RECOVERY SIMPLE 
64  GO
65  ALTER DATABASE [MdcStandard] SET  MULTI_USER 
66  GO
67  ALTER DATABASE [MdcStandard] SET PAGE_VERIFY CHECKSUM  
68  GO
69  ALTER DATABASE [MdcStandard] SET DB_CHAINING OFF 
70  GO
71  ALTER DATABASE [MdcStandard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
72  GO
73  ALTER DATABASE [MdcStandard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
74  GO
75  ALTER DATABASE [MdcStandard] SET DELAYED_DURABILITY = DISABLED 
76  GO
77  ALTER DATABASE [MdcStandard] SET ACCELERATED_DATABASE_RECOVERY = OFF  
78  GO
79  ALTER DATABASE [MdcStandard] SET QUERY_STORE = OFF
80  GO
81  USE [MdcStandard]
82  GO
83  /****** Object:  Table [dbo].[tblkProducts]    Script Date: 9/27/2024 6:35:47 PM ******/
84  SET ANSI_NULLS ON
85  GO
86  SET QUOTED_IDENTIFIER ON
87  GO
88  CREATE TABLE [dbo].[tblkProducts](
89  	[ProductID] [int] IDENTITY(1,1) NOT NULL,
90  	[ProductName] [nvarchar](40) NOT NULL,
91  	[SupplierID] [int] NULL,
92  	[CategoryID] [int] NULL,
93  	[QuantityPerUnit] [nvarchar](20) NULL,
94  	[UnitPrice] [money] NULL,
95  	[UnitsInStock] [smallint] NULL,
96  	[UnitsOnOrder] [smallint] NULL,
97  	[ReorderLevel] [smallint] NULL,
98  	[Discontinued] [bit] NOT NULL,
99   CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
100  (
101  	[ProductID] ASC
102  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
103  ) ON [PRIMARY]
104  GO
105  /****** Object:  View [dbo].[vw_CurrentProductList]    Script Date: 9/27/2024 6:35:47 PM ******/
106  SET ANSI_NULLS ON
107  GO
108  SET QUOTED_IDENTIFIER ON
109  GO
110  
111  
112  CREATE   view [dbo].[vw_CurrentProductList] AS
113  
114  
115  --=======================================================================================
116  --					D E F I N I T I O N
117  --=======================================================================================
118  -- Author:			Giancarlo Rhodes
119  -- Create Date:		05/24/2024
120  -- Description:		
121  --					
122  -- Integration:		
123  -- Update History:  Please see comment at bottom for changelog
124  --=======================================================================================
125  
126  SELECT Product_List.ProductID, Product_List.ProductName
127  FROM tblkProducts AS Product_List
128  WHERE (((Product_List.Discontinued)=0))
129  
130  
131  --=======================================================================================
132  --				Change Log
133  --=======================================================================================
134  -- Author:			
135  -- Create Date:		
136  -- Description:		View was modified			
137  -- Integration:		
138  -- Update History:  
139  --=======================================================================================
140  
141  
142  
143  GO
144  /****** Object:  Table [dbo].[tblEmployees]    Script Date: 9/27/2024 6:35:47 PM ******/
145  SET ANSI_NULLS ON
146  GO
147  SET QUOTED_IDENTIFIER ON
148  GO
149  CREATE TABLE [dbo].[tblEmployees](
150  	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
151  	[LastName] [nvarchar](20) NOT NULL,
152  	[FirstName] [nvarchar](10) NOT NULL,
153  	[Title] [nvarchar](30) NULL,
154  	[TitleOfCourtesy] [nvarchar](25) NULL,
155  	[BirthDate] [datetime] NULL,
156  	[HireDate] [datetime] NULL,
157  	[Address] [nvarchar](60) NULL,
158  	[City] [nvarchar](15) NULL,
159  	[Region] [nvarchar](15) NULL,
160  	[PostalCode] [nvarchar](10) NULL,
161  	[Country] [nvarchar](15) NULL,
162  	[HomePhone] [nvarchar](24) NULL,
163  	[Extension] [nvarchar](4) NULL,
164  	[Photo] [image] NULL,
165  	[Notes] [ntext] NULL,
166  	[ReportsTo] [int] NULL,
167  	[PhotoPath] [nvarchar](255) NULL,
168   CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
169  (
170  	[EmployeeID] ASC
171  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
172  ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
173  GO
174  /****** Object:  Table [dbo].[tblCustomers]    Script Date: 9/27/2024 6:35:47 PM ******/
175  SET ANSI_NULLS ON
176  GO
177  SET QUOTED_IDENTIFIER ON
178  GO
179  CREATE TABLE [dbo].[tblCustomers](
180  	[CustomerID] [nchar](5) NOT NULL,
181  	[CompanyName] [nvarchar](40) NOT NULL,
182  	[ContactName] [nvarchar](30) NULL,
183  	[ContactTitle] [nvarchar](30) NULL,
184  	[Address] [nvarchar](60) NULL,
185  	[City] [nvarchar](15) NULL,
186  	[Region] [nvarchar](15) NULL,
187  	[PostalCode] [nvarchar](10) NULL,
188  	[Country] [nvarchar](15) NULL,
189  	[Phone] [nvarchar](24) NULL,
190  	[Fax] [nvarchar](24) NULL,
191   CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
192  (
193  	[CustomerID] ASC
194  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
195  ) ON [PRIMARY]
196  GO
197  /****** Object:  Table [dbo].[tblkShippers]    Script Date: 9/27/2024 6:35:47 PM ******/
198  SET ANSI_NULLS ON
199  GO
200  SET QUOTED_IDENTIFIER ON
201  GO
202  CREATE TABLE [dbo].[tblkShippers](
203  	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
204  	[CompanyName] [nvarchar](40) NOT NULL,
205  	[Phone] [nvarchar](24) NULL,
206   CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
207  (
208  	[ShipperID] ASC
209  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
210  ) ON [PRIMARY]
211  GO
212  /****** Object:  Table [dbo].[tblOrders]    Script Date: 9/27/2024 6:35:47 PM ******/
213  SET ANSI_NULLS ON
214  GO
215  SET QUOTED_IDENTIFIER ON
216  GO
217  CREATE TABLE [dbo].[tblOrders](
218  	[OrderID] [int] IDENTITY(1,1) NOT NULL,
219  	[CustomerID] [nchar](5) NULL,
220  	[EmployeeID] [int] NULL,
221  	[OrderDate] [datetime] NULL,
222  	[RequiredDate] [datetime] NULL,
223  	[ShippedDate] [datetime] NULL,
224  	[ShipVia] [int] NULL,
225  	[Freight] [money] NULL,
226  	[ShipName] [nvarchar](40) NULL,
227  	[ShipAddress] [nvarchar](60) NULL,
228  	[ShipCity] [nvarchar](15) NULL,
229  	[ShipRegion] [nvarchar](15) NULL,
230  	[ShipPostalCode] [nvarchar](10) NULL,
231  	[ShipCountry] [nvarchar](15) NULL,
232   CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
233  (
234  	[OrderID] ASC
235  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
236  ) ON [PRIMARY]
237  GO
238  /****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 9/27/2024 6:35:47 PM ******/
239  SET ANSI_NULLS ON
240  GO
241  SET QUOTED_IDENTIFIER ON
242  GO
243  CREATE TABLE [dbo].[tblOrderDetails](
244  	[OrderID] [int] NOT NULL,
245  	[ProductID] [int] NOT NULL,
246  	[UnitPrice] [money] NOT NULL,
247  	[Quantity] [smallint] NOT NULL,
248  	[Discount] [real] NOT NULL,
249   CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
250  (
251  	[OrderID] ASC,
252  	[ProductID] ASC
253  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
254  ) ON [PRIMARY]
255  GO
256  /****** Object:  View [dbo].[vw_Invoices]    Script Date: 9/27/2024 6:35:47 PM ******/
257  SET ANSI_NULLS ON
258  GO
259  SET QUOTED_IDENTIFIER ON
260  GO
261  
262  
263  CREATE   view [dbo].[vw_Invoices] AS
264  
265  
266  --=======================================================================================
267  --					D E F I N I T I O N
268  --=======================================================================================
269  -- Author:			Giancarlo Rhodes
270  -- Create Date:		05/24/2024
271  -- Description:		
272  --					
273  -- Integration:		
274  -- Update History:  Please see comment at bottom for changelog
275  --=======================================================================================
276  
277  
278  
279  SELECT tblOrders.ShipName, tblOrders.ShipAddress, tblOrders.ShipCity, tblOrders.ShipRegion, tblOrders.ShipPostalCode, 
280  	tblOrders.ShipCountry, tblOrders.CustomerID, tblCustomers.CompanyName AS CustomerName, tblCustomers.Address, tblCustomers.City, 
281  	tblCustomers.Region, tblCustomers.PostalCode, tblCustomers.Country, 
282  	(FirstName + ' ' + LastName) AS Salesperson, 
283  	tblOrders.OrderID, tblOrders.OrderDate, tblOrders.RequiredDate, tblOrders.ShippedDate, tblkShippers.CompanyName As ShipperName, 
284  	"tblOrderDetails".ProductID, tblkProducts.ProductName, "tblOrderDetails".UnitPrice, "tblOrderDetails".Quantity, 
285  	"tblOrderDetails".Discount, 
286  	(CONVERT(money,("tblOrderDetails".UnitPrice*Quantity*(1-Discount)/100))*100) AS ExtendedPrice, tblOrders.Freight
287  FROM 	tblkShippers INNER JOIN 
288  		(tblkProducts INNER JOIN 
289  			(
290  				(tblEmployees INNER JOIN 
291  					(tblCustomers INNER JOIN tblOrders ON tblCustomers.CustomerID = tblOrders.CustomerID) 
292  				ON tblEmployees.EmployeeID = tblOrders.EmployeeID) 
293  			INNER JOIN "tblOrderDetails" ON tblOrders.OrderID = "tblOrderDetails".OrderID) 
294  		ON tblkProducts.ProductID = "tblOrderDetails".ProductID) 
295  	ON tblkShippers.ShipperID = tblOrders.ShipVia
296  
297  
298  	
299  --=======================================================================================
300  --				Change Log
301  --=======================================================================================
302  -- Author:			
303  -- Create Date:		
304  -- Description:		View was modified			
305  -- Integration:		
306  -- Update History:  
307  --=======================================================================================
308  
309  
310  
311  
312  GO
313  /****** Object:  View [dbo].[vw_OrderDetailsExtended]    Script Date: 9/27/2024 6:35:47 PM ******/
314  SET ANSI_NULLS ON
315  GO
316  SET QUOTED_IDENTIFIER ON
317  GO
318  
319  CREATE
320  	
321  
322   VIEW [dbo].[vw_OrderDetailsExtended]
323  AS
324  --=======================================================================================
325  --					D E F I N I T I O N
326  --=======================================================================================
327  -- Author:			Giancarlo Rhodes
328  -- Create Date:		05/24/2024
329  -- Description:		
330  --					
331  -- Integration:		
332  -- Update History:  Please see comment at bottom for changelog
333  --=======================================================================================
334  SELECT tblOrderDetails.OrderID,
335  	tblOrderDetails.ProductID,
336  	tblkProducts.ProductName,
337  	tblOrderDetails.UnitPrice,
338  	tblOrderDetails.Quantity,
339  	tblOrderDetails.Discount,
340  	(CONVERT(MONEY, (tblOrderDetails.UnitPrice * Quantity * (1 - Discount) / 100)) * 100) AS ExtendedPrice
341  FROM tblkProducts
342  INNER JOIN tblOrderDetails ON tblkProducts.ProductID = tblOrderDetails.ProductID
343  	--=======================================================================================
344  	--				Change Log
345  	--=======================================================================================
346  	-- Author:			
347  	-- Create Date:		
348  	-- Description:		View was modified			
349  	-- Integration:		
350  	-- Update History:  
351  	--=======================================================================================
352  GO
353  /****** Object:  View [dbo].[vw_OrderSubtotals]    Script Date: 9/27/2024 6:35:47 PM ******/
354  SET ANSI_NULLS ON
355  GO
356  SET QUOTED_IDENTIFIER ON
357  GO
358  
359  CREATE
360  	
361  
362   VIEW [dbo].[vw_OrderSubtotals]
363  AS
364  
365  
366  --=======================================================================================
367  --					D E F I N I T I O N
368  --=======================================================================================
369  -- Author:			Giancarlo Rhodes
370  -- Create Date:		05/24/2024
371  -- Description:		
372  --					
373  -- Integration:		
374  -- Update History:  Please see comment at bottom for changelog
375  --=======================================================================================
376  
377  
378  SELECT tblOrderDetails.OrderID,
379  	Sum(CONVERT(MONEY, (tblOrderDetails.UnitPrice * Quantity * (1 - Discount) / 100)) * 100) AS Subtotal
380  FROM tblOrderDetails
381  GROUP BY tblOrderDetails.OrderID
382  
383  
384  --=======================================================================================
385  --				Change Log
386  --=======================================================================================
387  -- Author:			
388  -- Create Date:		
389  -- Description:		View was modified			
390  -- Integration:		
391  -- Update History:  
392  --=======================================================================================
393  
394  
395  
396  GO
397  
398  
399  --/****** Object:  View [dbo].[Orders Qry]    Script Date: 9/27/2024 6:35:47 PM ******/
400  --SET ANSI_NULLS ON
401  --GO
402  --SET QUOTED_IDENTIFIER ON
403  --GO
404  
405  --create view [dbo].[Orders Qry] AS
406  --SELECT Orders.OrderID, Orders.CustomerID, Orders.EmployeeID, Orders.OrderDate, Orders.RequiredDate, 
407  --	Orders.ShippedDate, Orders.ShipVia, Orders.Freight, Orders.ShipName, Orders.ShipAddress, Orders.ShipCity, 
408  --	Orders.ShipRegion, Orders.ShipPostalCode, Orders.ShipCountry, 
409  --	Customers.CompanyName, Customers.Address, Customers.City, Customers.Region, Customers.PostalCode, Customers.Country
410  --FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
411  --GO
412  
413  
414  
415  --/****** Object:  View [dbo].[Product Sales for 1997]    Script Date: 9/27/2024 6:35:47 PM ******/
416  --SET ANSI_NULLS ON
417  --GO
418  --SET QUOTED_IDENTIFIER ON
419  --GO
420  
421  --create view [dbo].[Product Sales for 1997] AS
422  --SELECT Categories.CategoryName, Products.ProductName, 
423  --Sum(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ProductSales
424  --FROM (Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID) 
425  --	INNER JOIN (Orders 
426  --		INNER JOIN "Order Details" ON Orders.OrderID = "Order Details".OrderID) 
427  --	ON Products.ProductID = "Order Details".ProductID
428  --WHERE (((Orders.ShippedDate) Between '19970101' And '19971231'))
429  --GROUP BY Categories.CategoryName, Products.ProductName
430  --GO
431  
432  
433  
434  
435  --/****** Object:  View [dbo].[Products Above Average Price]    Script Date: 9/27/2024 6:35:47 PM ******/
436  --SET ANSI_NULLS ON
437  --GO
438  --SET QUOTED_IDENTIFIER ON
439  --GO
440  
441  --create view [dbo].[Products Above Average Price] AS
442  --SELECT Products.ProductName, Products.UnitPrice
443  --FROM Products
444  --WHERE Products.UnitPrice>(SELECT AVG(UnitPrice) From Products)
445  ----ORDER BY Products.UnitPrice DESC
446  --GO
447  
448  
449  
450  
451  --/****** Object:  View [dbo].[Products by Category]    Script Date: 9/27/2024 6:35:47 PM ******/
452  --SET ANSI_NULLS ON
453  --GO
454  --SET QUOTED_IDENTIFIER ON
455  --GO
456  
457  --create view [dbo].[Products by Category] AS
458  --SELECT Categories.CategoryName, Products.ProductName, Products.QuantityPerUnit, Products.UnitsInStock, Products.Discontinued
459  --FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
460  --WHERE Products.Discontinued <> 1
461  ----ORDER BY Categories.CategoryName, Products.ProductName
462  --GO
463  
464  
465  
466  /****** Object:  View [dbo].[Quarterly Orders]    Script Date: 9/27/2024 6:35:47 PM ******/
467  SET ANSI_NULLS ON
468  GO
469  SET QUOTED_IDENTIFIER ON
470  GO
471  
472  create view [dbo].[Quarterly Orders] AS
473  SELECT DISTINCT Customers.CustomerID, Customers.CompanyName, Customers.City, Customers.Country
474  FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
475  WHERE Orders.OrderDate BETWEEN '19970101' And '19971231'
476  GO
477  
478  
479  
480  
481  
482  /****** Object:  View [dbo].[Sales by Category]    Script Date: 9/27/2024 6:35:47 PM ******/
483  SET ANSI_NULLS ON
484  GO
485  SET QUOTED_IDENTIFIER ON
486  GO
487  
488  create view [dbo].[Sales by Category] AS
489  SELECT Categories.CategoryID, Categories.CategoryName, Products.ProductName, 
490  	Sum("Order Details Extended".ExtendedPrice) AS ProductSales
491  FROM 	Categories INNER JOIN 
492  		(Products INNER JOIN 
493  			(Orders INNER JOIN "Order Details Extended" ON Orders.OrderID = "Order Details Extended".OrderID) 
494  		ON Products.ProductID = "Order Details Extended".ProductID) 
495  	ON Categories.CategoryID = Products.CategoryID
496  WHERE Orders.OrderDate BETWEEN '19970101' And '19971231'
497  GROUP BY Categories.CategoryID, Categories.CategoryName, Products.ProductName
498  --ORDER BY Products.ProductName
499  GO
500  
501  
502  
503  
504  /****** Object:  View [dbo].[Sales Totals by Amount]    Script Date: 9/27/2024 6:35:47 PM ******/
505  SET ANSI_NULLS ON
506  GO
507  SET QUOTED_IDENTIFIER ON
508  GO
509  
510  create view [dbo].[Sales Totals by Amount] AS
511  SELECT "Order Subtotals".Subtotal AS SaleAmount, Orders.OrderID, Customers.CompanyName, Orders.ShippedDate
512  FROM 	Customers INNER JOIN 
513  		(Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID) 
514  	ON Customers.CustomerID = Orders.CustomerID
515  WHERE ("Order Subtotals".Subtotal >2500) AND (Orders.ShippedDate BETWEEN '19970101' And '19971231')
516  GO
517  
518  
519  
520  /****** Object:  View [dbo].[Summary of Sales by Quarter]    Script Date: 9/27/2024 6:35:47 PM ******/
521  SET ANSI_NULLS ON
522  GO
523  SET QUOTED_IDENTIFIER ON
524  GO
525  
526  create view [dbo].[Summary of Sales by Quarter] AS
527  SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal
528  FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
529  WHERE Orders.ShippedDate IS NOT NULL
530  --ORDER BY Orders.ShippedDate
531  GO
532  
533  
534  
535  
536  /****** Object:  View [dbo].[Summary of Sales by Year]    Script Date: 9/27/2024 6:35:47 PM ******/
537  SET ANSI_NULLS ON
538  GO
539  SET QUOTED_IDENTIFIER ON
540  GO
541  
542  create view [dbo].[Summary of Sales by Year] AS
543  SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal
544  FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
545  WHERE Orders.ShippedDate IS NOT NULL
546  --ORDER BY Orders.ShippedDate
547  GO
548  
549  
550  
551  /****** Object:  View [dbo].[vw_CustomerAndSuppliersByCity]    Script Date: 9/27/2024 6:35:47 PM ******/
552  SET ANSI_NULLS ON
553  GO
554  SET QUOTED_IDENTIFIER ON
555  GO
556  
557  
558  create view [dbo].[vw_CustomerAndSuppliersByCity] AS
559  SELECT City, CompanyName, ContactName, 'Customers' AS Relationship 
560  FROM Customers
561  UNION SELECT City, CompanyName, ContactName, 'Suppliers'
562  FROM Suppliers
563  --ORDER BY City, CompanyName
564  GO
565  
566  
567  
568  /****** Object:  Table [dbo].[TableTest]    Script Date: 9/27/2024 6:35:47 PM ******/
569  SET ANSI_NULLS ON
570  GO
571  SET QUOTED_IDENTIFIER ON
572  GO
573  CREATE TABLE [dbo].[TableTest](
574  	[ID] [uniqueidentifier] NOT NULL,
575  	[Data] [nvarchar](max) NULL,
576   CONSTRAINT [PK_TableTest] PRIMARY KEY CLUSTERED 
577  (
578  	[ID] ASC
579  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
580  ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
581  GO
582  
583  
584  
585  
586  /****** Object:  Table [dbo].[tblCategories]    Script Date: 9/27/2024 6:35:47 PM ******/
587  SET ANSI_NULLS ON
588  GO
589  SET QUOTED_IDENTIFIER ON
590  GO
591  CREATE TABLE [dbo].[tblCategories](
592  	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
593  	[CategoryName] [nvarchar](15) NOT NULL,
594  	[Description] [ntext] NULL,
595  	[Picture] [image] NULL,
596   CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
597  (
598  	[CategoryID] ASC
599  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
600  ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
601  GO
602  
603  
604  
605  /****** Object:  Table [dbo].[tblCustomerCustomerDemo]    Script Date: 9/27/2024 6:35:47 PM ******/
606  SET ANSI_NULLS ON
607  GO
608  SET QUOTED_IDENTIFIER ON
609  GO
610  CREATE TABLE [dbo].[tblCustomerCustomerDemo](
611  	[CustomerID] [nchar](5) NOT NULL,
612  	[CustomerTypeID] [nchar](10) NOT NULL,
613   CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY NONCLUSTERED 
614  (
615  	[CustomerID] ASC,
616  	[CustomerTypeID] ASC
617  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
618  ) ON [PRIMARY]
619  GO
620  
621  
622  
623  /****** Object:  Table [dbo].[tblCustomerDemographics]    Script Date: 9/27/2024 6:35:47 PM ******/
624  SET ANSI_NULLS ON
625  GO
626  SET QUOTED_IDENTIFIER ON
627  GO
628  CREATE TABLE [dbo].[tblCustomerDemographics](
629  	[CustomerTypeID] [nchar](10) NOT NULL,
630  	[CustomerDesc] [ntext] NULL,
631   CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY NONCLUSTERED 
632  (
633  	[CustomerTypeID] ASC
634  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
635  ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
636  GO
637  
638  
639  
640  
641  /****** Object:  Table [dbo].[tblEmployeeTerritories]    Script Date: 9/27/2024 6:35:47 PM ******/
642  SET ANSI_NULLS ON
643  GO
644  SET QUOTED_IDENTIFIER ON
645  GO
646  CREATE TABLE [dbo].[tblEmployeeTerritories](
647  	[EmployeeID] [int] NOT NULL,
648  	[TerritoryID] [nvarchar](20) NOT NULL,
649   CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY NONCLUSTERED 
650  (
651  	[EmployeeID] ASC,
652  	[TerritoryID] ASC
653  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
654  ) ON [PRIMARY]
655  GO
656  
657  
658  
659  /****** Object:  Table [dbo].[tblkRegion]    Script Date: 9/27/2024 6:35:47 PM ******/
660  SET ANSI_NULLS ON
661  GO
662  SET QUOTED_IDENTIFIER ON
663  GO
664  CREATE TABLE [dbo].[tblkRegion](
665  	[RegionID] [int] NOT NULL,
666  	[RegionDescription] [nchar](50) NOT NULL,
667   CONSTRAINT [PK_Region] PRIMARY KEY NONCLUSTERED 
668  (
669  	[RegionID] ASC
670  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
671  ) ON [PRIMARY]
672  GO
673  
674  
675  
676  /****** Object:  Table [dbo].[tblkSuppliers]    Script Date: 9/27/2024 6:35:47 PM ******/
677  SET ANSI_NULLS ON
678  GO
679  SET QUOTED_IDENTIFIER ON
680  GO
681  CREATE TABLE [dbo].[tblkSuppliers](
682  	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
683  	[CompanyName] [nvarchar](40) NOT NULL,
684  	[ContactName] [nvarchar](30) NULL,
685  	[ContactTitle] [nvarchar](30) NULL,
686  	[Address] [nvarchar](60) NULL,
687  	[City] [nvarchar](15) NULL,
688  	[Region] [nvarchar](15) NULL,
689  	[PostalCode] [nvarchar](10) NULL,
690  	[Country] [nvarchar](15) NULL,
691  	[Phone] [nvarchar](24) NULL,
692  	[Fax] [nvarchar](24) NULL,
693  	[HomePage] [ntext] NULL,
694   CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
695  (
696  	[SupplierID] ASC
697  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
698  ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
699  GO
700  
701  
702  
703  /****** Object:  Table [dbo].[tblkTerritories]    Script Date: 9/27/2024 6:35:47 PM ******/
704  SET ANSI_NULLS ON
705  GO
706  SET QUOTED_IDENTIFIER ON
707  GO
708  CREATE TABLE [dbo].[tblkTerritories](
709  	[TerritoryID] [nvarchar](20) NOT NULL,
710  	[TerritoryDescription] [nchar](50) NOT NULL,
711  	[RegionID] [int] NOT NULL,
712   CONSTRAINT [PK_Territories] PRIMARY KEY NONCLUSTERED 
713  (
714  	[TerritoryID] ASC
715  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
716  ) ON [PRIMARY]
717  GO
718  SET ANSI_PADDING ON
719  GO
720  
721  
722  
723  /****** Object:  Index [CategoryName]    Script Date: 9/27/2024 6:35:47 PM ******/
724  CREATE NONCLUSTERED INDEX [CategoryName] ON [dbo].[tblCategories]
725  (
726  	[CategoryName] ASC
727  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
728  GO
729  SET ANSI_PADDING ON
730  GO
731  /****** Object:  Index [City]    Script Date: 9/27/2024 6:35:47 PM ******/
732  CREATE NONCLUSTERED INDEX [City] ON [dbo].[tblCustomers]
733  (
734  	[City] ASC
735  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
736  GO
737  SET ANSI_PADDING ON
738  GO
739  /****** Object:  Index [CompanyName]    Script Date: 9/27/2024 6:35:47 PM ******/
740  CREATE NONCLUSTERED INDEX [CompanyName] ON [dbo].[tblCustomers]
741  (
742  	[CompanyName] ASC
743  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
744  GO
745  SET ANSI_PADDING ON
746  GO
747  /****** Object:  Index [PostalCode]    Script Date: 9/27/2024 6:35:47 PM ******/
748  CREATE NONCLUSTERED INDEX [PostalCode] ON [dbo].[tblCustomers]
749  (
750  	[PostalCode] ASC
751  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
752  GO
753  SET ANSI_PADDING ON
754  GO
755  /****** Object:  Index [Region]    Script Date: 9/27/2024 6:35:47 PM ******/
756  CREATE NONCLUSTERED INDEX [Region] ON [dbo].[tblCustomers]
757  (
758  	[Region] ASC
759  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
760  GO
761  SET ANSI_PADDING ON
762  GO
763  /****** Object:  Index [NDX_LastName]    Script Date: 9/27/2024 6:35:47 PM ******/
764  CREATE NONCLUSTERED INDEX [NDX_LastName] ON [dbo].[tblEmployees]
765  (
766  	[LastName] ASC
767  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
768  GO
769  SET ANSI_PADDING ON
770  GO
771  /****** Object:  Index [NDX_PostalCode]    Script Date: 9/27/2024 6:35:47 PM ******/
772  CREATE NONCLUSTERED INDEX [NDX_PostalCode] ON [dbo].[tblEmployees]
773  (
774  	[PostalCode] ASC
775  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
776  GO
777  /****** Object:  Index [CategoriesProducts]    Script Date: 9/27/2024 6:35:47 PM ******/
778  CREATE NONCLUSTERED INDEX [CategoriesProducts] ON [dbo].[tblkProducts]
779  (
780  	[CategoryID] ASC
781  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
782  GO
783  /****** Object:  Index [CategoryID]    Script Date: 9/27/2024 6:35:47 PM ******/
784  CREATE NONCLUSTERED INDEX [CategoryID] ON [dbo].[tblkProducts]
785  (
786  	[CategoryID] ASC
787  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
788  GO
789  SET ANSI_PADDING ON
790  GO
791  /****** Object:  Index [ProductName]    Script Date: 9/27/2024 6:35:47 PM ******/
792  CREATE NONCLUSTERED INDEX [ProductName] ON [dbo].[tblkProducts]
793  (
794  	[ProductName] ASC
795  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
796  GO
797  /****** Object:  Index [SupplierID]    Script Date: 9/27/2024 6:35:47 PM ******/
798  CREATE NONCLUSTERED INDEX [SupplierID] ON [dbo].[tblkProducts]
799  (
800  	[SupplierID] ASC
801  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
802  GO
803  /****** Object:  Index [SuppliersProducts]    Script Date: 9/27/2024 6:35:47 PM ******/
804  CREATE NONCLUSTERED INDEX [SuppliersProducts] ON [dbo].[tblkProducts]
805  (
806  	[SupplierID] ASC
807  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
808  GO
809  SET ANSI_PADDING ON
810  GO
811  /****** Object:  Index [CompanyName]    Script Date: 9/27/2024 6:35:47 PM ******/
812  CREATE NONCLUSTERED INDEX [CompanyName] ON [dbo].[tblkSuppliers]
813  (
814  	[CompanyName] ASC
815  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
816  GO
817  SET ANSI_PADDING ON
818  GO
819  /****** Object:  Index [PostalCode]    Script Date: 9/27/2024 6:35:47 PM ******/
820  CREATE NONCLUSTERED INDEX [PostalCode] ON [dbo].[tblkSuppliers]
821  (
822  	[PostalCode] ASC
823  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
824  GO
825  /****** Object:  Index [OrderID]    Script Date: 9/27/2024 6:35:47 PM ******/
826  CREATE NONCLUSTERED INDEX [OrderID] ON [dbo].[tblOrderDetails]
827  (
828  	[OrderID] ASC
829  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
830  GO
831  /****** Object:  Index [OrdersOrder_Details]    Script Date: 9/27/2024 6:35:47 PM ******/
832  CREATE NONCLUSTERED INDEX [OrdersOrder_Details] ON [dbo].[tblOrderDetails]
833  (
834  	[OrderID] ASC
835  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
836  GO
837  /****** Object:  Index [ProductID]    Script Date: 9/27/2024 6:35:47 PM ******/
838  CREATE NONCLUSTERED INDEX [ProductID] ON [dbo].[tblOrderDetails]
839  (
840  	[ProductID] ASC
841  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
842  GO
843  /****** Object:  Index [ProductsOrder_Details]    Script Date: 9/27/2024 6:35:47 PM ******/
844  CREATE NONCLUSTERED INDEX [ProductsOrder_Details] ON [dbo].[tblOrderDetails]
845  (
846  	[ProductID] ASC
847  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
848  GO
849  SET ANSI_PADDING ON
850  GO
851  /****** Object:  Index [CustomerID]    Script Date: 9/27/2024 6:35:47 PM ******/
852  CREATE NONCLUSTERED INDEX [CustomerID] ON [dbo].[tblOrders]
853  (
854  	[CustomerID] ASC
855  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
856  GO
857  SET ANSI_PADDING ON
858  GO
859  /****** Object:  Index [CustomersOrders]    Script Date: 9/27/2024 6:35:47 PM ******/
860  CREATE NONCLUSTERED INDEX [CustomersOrders] ON [dbo].[tblOrders]
861  (
862  	[CustomerID] ASC
863  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
864  GO
865  /****** Object:  Index [EmployeeID]    Script Date: 9/27/2024 6:35:47 PM ******/
866  CREATE NONCLUSTERED INDEX [EmployeeID] ON [dbo].[tblOrders]
867  (
868  	[EmployeeID] ASC
869  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
870  GO
871  /****** Object:  Index [EmployeesOrders]    Script Date: 9/27/2024 6:35:47 PM ******/
872  CREATE NONCLUSTERED INDEX [EmployeesOrders] ON [dbo].[tblOrders]
873  (
874  	[EmployeeID] ASC
875  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
876  GO
877  /****** Object:  Index [OrderDate]    Script Date: 9/27/2024 6:35:47 PM ******/
878  CREATE NONCLUSTERED INDEX [OrderDate] ON [dbo].[tblOrders]
879  (
880  	[OrderDate] ASC
881  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
882  GO
883  /****** Object:  Index [ShippedDate]    Script Date: 9/27/2024 6:35:47 PM ******/
884  CREATE NONCLUSTERED INDEX [ShippedDate] ON [dbo].[tblOrders]
885  (
886  	[ShippedDate] ASC
887  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
888  GO
889  /****** Object:  Index [ShippersOrders]    Script Date: 9/27/2024 6:35:47 PM ******/
890  CREATE NONCLUSTERED INDEX [ShippersOrders] ON [dbo].[tblOrders]
891  (
892  	[ShipVia] ASC
893  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
894  GO
895  SET ANSI_PADDING ON
896  GO
897  /****** Object:  Index [ShipPostalCode]    Script Date: 9/27/2024 6:35:47 PM ******/
898  CREATE NONCLUSTERED INDEX [ShipPostalCode] ON [dbo].[tblOrders]
899  (
900  	[ShipPostalCode] ASC
901  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
902  GO
903  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
904  GO
905  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_UnitsInStock]  DEFAULT ((0)) FOR [UnitsInStock]
906  GO
907  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_UnitsOnOrder]  DEFAULT ((0)) FOR [UnitsOnOrder]
908  GO
909  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_ReorderLevel]  DEFAULT ((0)) FOR [ReorderLevel]
910  GO
911  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_Discontinued]  DEFAULT ((0)) FOR [Discontinued]
912  GO
913  ALTER TABLE [dbo].[tblOrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
914  GO
915  ALTER TABLE [dbo].[tblOrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
916  GO
917  ALTER TABLE [dbo].[tblOrderDetails] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [Discount]
918  GO
919  ALTER TABLE [dbo].[tblOrders] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)) FOR [Freight]
920  GO
921  ALTER TABLE [dbo].[tblCustomerCustomerDemo]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCustomerDemo] FOREIGN KEY([CustomerTypeID])
922  REFERENCES [dbo].[tblCustomerDemographics] ([CustomerTypeID])
923  GO
924  ALTER TABLE [dbo].[tblCustomerCustomerDemo] CHECK CONSTRAINT [FK_CustomerCustomerDemo]
925  GO
926  ALTER TABLE [dbo].[tblCustomerCustomerDemo]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCustomerDemo_Customers] FOREIGN KEY([CustomerID])
927  REFERENCES [dbo].[tblCustomers] ([CustomerID])
928  GO
929  ALTER TABLE [dbo].[tblCustomerCustomerDemo] CHECK CONSTRAINT [FK_CustomerCustomerDemo_Customers]
930  GO
931  ALTER TABLE [dbo].[tblEmployees]  WITH NOCHECK ADD  CONSTRAINT [FK_tblEmployeesTerritories_TerritoryID] FOREIGN KEY([ReportsTo])
932  REFERENCES [dbo].[tblEmployees] ([EmployeeID])
933  GO
934  ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployeesTerritories_TerritoryID]
935  GO
936  ALTER TABLE [dbo].[tblEmployeeTerritories]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY([EmployeeID])
937  REFERENCES [dbo].[tblEmployees] ([EmployeeID])
938  GO
939  ALTER TABLE [dbo].[tblEmployeeTerritories] CHECK CONSTRAINT [FK_EmployeeTerritories_Employees]
940  GO
941  ALTER TABLE [dbo].[tblEmployeeTerritories]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY([TerritoryID])
942  REFERENCES [dbo].[tblkTerritories] ([TerritoryID])
943  GO
944  ALTER TABLE [dbo].[tblEmployeeTerritories] CHECK CONSTRAINT [FK_EmployeeTerritories_Territories]
945  GO
946  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
947  REFERENCES [dbo].[tblCategories] ([CategoryID])
948  GO
949  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [FK_Products_Categories]
950  GO
951  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
952  REFERENCES [dbo].[tblkSuppliers] ([SupplierID])
953  GO
954  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [FK_Products_Suppliers]
955  GO
956  ALTER TABLE [dbo].[tblkTerritories]  WITH CHECK ADD  CONSTRAINT [FK_Territories_Region] FOREIGN KEY([RegionID])
957  REFERENCES [dbo].[tblkRegion] ([RegionID])
958  GO
959  ALTER TABLE [dbo].[tblkTerritories] CHECK CONSTRAINT [FK_Territories_Region]
960  GO
961  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([OrderID])
962  REFERENCES [dbo].[tblOrders] ([OrderID])
963  GO
964  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_Order_Details_Orders]
965  GO
966  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY([ProductID])
967  REFERENCES [dbo].[tblkProducts] ([ProductID])
968  GO
969  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_Order_Details_Products]
970  GO
971  ALTER TABLE [dbo].[tblOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
972  REFERENCES [dbo].[tblCustomers] ([CustomerID])
973  GO
974  ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_Orders_Customers]
975  GO
976  ALTER TABLE [dbo].[tblOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
977  REFERENCES [dbo].[tblEmployees] ([EmployeeID])
978  GO
979  ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_Orders_Employees]
980  GO
981  ALTER TABLE [dbo].[tblOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipVia])
982  REFERENCES [dbo].[tblkShippers] ([ShipperID])
983  GO
984  ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_Orders_Shippers]
985  GO
986  ALTER TABLE [dbo].[tblEmployees]  WITH NOCHECK ADD  CONSTRAINT [CK_Birthdate] CHECK  (([BirthDate]<getdate()))
987  GO
988  ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [CK_Birthdate]
989  GO
990  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [CK_Products_UnitPrice] CHECK  (([UnitPrice]>=(0)))
991  GO
992  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [CK_Products_UnitPrice]
993  GO
994  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [CK_ReorderLevel] CHECK  (([ReorderLevel]>=(0)))
995  GO
996  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [CK_ReorderLevel]
997  GO
998  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsInStock] CHECK  (([UnitsInStock]>=(0)))
999  GO
1000  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [CK_UnitsInStock]
1001  GO
1002  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsOnOrder] CHECK  (([UnitsOnOrder]>=(0)))
1003  GO
1004  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [CK_UnitsOnOrder]
1005  GO
1006  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [CK_Discount] CHECK  (([Discount]>=(0) AND [Discount]<=(1)))
1007  GO
1008  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [CK_Discount]
1009  GO
1010  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [CK_Quantity] CHECK  (([Quantity]>(0)))
1011  GO
1012  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [CK_Quantity]
1013  GO
1014  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitPrice] CHECK  (([UnitPrice]>=(0)))
1015  GO
1016  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [CK_UnitPrice]
1017  GO
1018  /****** Object:  StoredProcedure [dbo].[CustOrdersOrders]    Script Date: 9/27/2024 6:35:47 PM ******/
1019  SET ANSI_NULLS ON
1020  GO
1021  SET QUOTED_IDENTIFIER ON
1022  GO
1023  
1024  CREATE PROCEDURE [dbo].[CustOrdersOrders] @CustomerID nchar(5)
1025  AS
1026  SELECT OrderID, 
1027  	OrderDate,
1028  	RequiredDate,
1029  	ShippedDate
1030  FROM Orders
1031  WHERE CustomerID = @CustomerID
1032  ORDER BY OrderID
1033  GO
1034  /****** Object:  StoredProcedure [dbo].[Employee Sales by Country]    Script Date: 9/27/2024 6:35:47 PM ******/
1035  SET ANSI_NULLS ON
1036  GO
1037  SET QUOTED_IDENTIFIER ON
1038  GO
1039  
1040  create procedure [dbo].[Employee Sales by Country] 
1041  @Beginning_Date DateTime, @Ending_Date DateTime AS
1042  SELECT Employees.Country, Employees.LastName, Employees.FirstName, Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal AS SaleAmount
1043  FROM Employees INNER JOIN 
1044  	(Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID) 
1045  	ON Employees.EmployeeID = Orders.EmployeeID
1046  WHERE Orders.ShippedDate Between @Beginning_Date And @Ending_Date
1047  GO
1048  /****** Object:  StoredProcedure [dbo].[Sales by Year]    Script Date: 9/27/2024 6:35:47 PM ******/
1049  SET ANSI_NULLS ON
1050  GO
1051  SET QUOTED_IDENTIFIER ON
1052  GO
1053  
1054  create procedure [dbo].[Sales by Year] 
1055  	@Beginning_Date DateTime, @Ending_Date DateTime AS
1056  SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal, DATENAME(yy,ShippedDate) AS Year
1057  FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
1058  WHERE Orders.ShippedDate Between @Beginning_Date And @Ending_Date
1059  GO
1060  /****** Object:  StoredProcedure [dbo].[SalesByCategory]    Script Date: 9/27/2024 6:35:47 PM ******/
1061  SET ANSI_NULLS ON
1062  GO
1063  SET QUOTED_IDENTIFIER ON
1064  GO
1065  CREATE PROCEDURE [dbo].[SalesByCategory]
1066      @CategoryName nvarchar(15), @OrdYear nvarchar(4) = '1998'
1067  AS
1068  IF @OrdYear != '1996' AND @OrdYear != '1997' AND @OrdYear != '1998' 
1069  BEGIN
1070  	SELECT @OrdYear = '1998'
1071  END
1072  
1073  SELECT ProductName,
1074  	TotalPurchase=ROUND(SUM(CONVERT(decimal(14,2), OD.Quantity * (1-OD.Discount) * OD.UnitPrice)), 0)
1075  FROM [Order Details] OD, Orders O, Products P, Categories C
1076  WHERE OD.OrderID = O.OrderID 
1077  	AND OD.ProductID = P.ProductID 
1078  	AND P.CategoryID = C.CategoryID
1079  	AND C.CategoryName = @CategoryName
1080  	AND SUBSTRING(CONVERT(nvarchar(22), O.OrderDate, 111), 1, 4) = @OrdYear
1081  GROUP BY ProductName
1082  ORDER BY ProductName
1083  GO
1084  /****** Object:  StoredProcedure [dbo].[Ten Most Expensive Products]    Script Date: 9/27/2024 6:35:47 PM ******/
1085  SET ANSI_NULLS ON
1086  GO
1087  SET QUOTED_IDENTIFIER ON
1088  GO
1089  
1090  create procedure [dbo].[Ten Most Expensive Products] AS
1091  SET ROWCOUNT 10
1092  SELECT Products.ProductName AS TenMostExpensiveProducts, Products.UnitPrice
1093  FROM Products
1094  ORDER BY Products.UnitPrice DESC
1095  GO
1096  /****** Object:  StoredProcedure [dbo].[uspCustOrderHist]    Script Date: 9/27/2024 6:35:47 PM ******/
1097  SET ANSI_NULLS ON
1098  GO
1099  SET QUOTED_IDENTIFIER ON
1100  GO
1101  
1102  CREATE
1103  	
1104  
1105   PROCEDURE [dbo].[uspCustOrderHist] @parmCustomerID NCHAR(5)
1106  AS
1107  --=======================================================================================
1108  --					D E F I N I T I O N
1109  --=======================================================================================
1110  -- Author:			Giancarlo Rhodes
1111  -- Create Date:		05/24/2024
1112  -- Description:		
1113  --					
1114  -- Integration:		
1115  -- Update History:  Please see comment at bottom for changelog
1116  --=======================================================================================
1117  SELECT ProductName,
1118  	Total = SUM(Quantity)
1119  FROM Products P,
1120  	[Order Details] OD,
1121  	Orders O,
1122  	Customers C
1123  WHERE C.CustomerID = @parmCustomerID
1124  	AND C.CustomerID = O.CustomerID
1125  	AND O.OrderID = OD.OrderID
1126  	AND OD.ProductID = P.ProductID
1127  GROUP BY ProductName
1128  	--=======================================================================================
1129  	--				Change Log
1130  	--=======================================================================================
1131  	-- Author:			
1132  	-- Create Date:		
1133  	-- Description:		View was modified			
1134  	-- Integration:		
1135  	-- Update History:  
1136  	--=======================================================================================
1137  GO
1138  /****** Object:  StoredProcedure [dbo].[uspCustOrdersDetail]    Script Date: 9/27/2024 6:35:47 PM ******/
1139  SET ANSI_NULLS ON
1140  GO
1141  SET QUOTED_IDENTIFIER ON
1142  GO
1143  
1144  CREATE PROCEDURE [dbo].[uspCustOrdersDetail] @parmOrderID int
1145  AS
1146  
1147  --=======================================================================================
1148  --					D E F I N I T I O N
1149  --=======================================================================================
1150  -- Author:			Giancarlo Rhodes
1151  -- Create Date:		05/24/2024
1152  -- Description:		
1153  --					
1154  -- Integration:		
1155  -- Update History:  Please see comment at bottom for changelog
1156  --=======================================================================================
1157  
1158  SELECT ProductName,
1159      UnitPrice=ROUND(Od.UnitPrice, 2),
1160      Quantity,
1161      Discount=CONVERT(int, Discount * 100), 
1162      ExtendedPrice=ROUND(CONVERT(money, Quantity * (1 - Discount) * Od.UnitPrice), 2)
1163  FROM Products P, [Order Details] Od
1164  WHERE Od.ProductID = P.ProductID and Od.OrderID = @parmOrderID
1165  
1166  --=======================================================================================
1167  --				Change Log
1168  --=======================================================================================
1169  -- Author:			
1170  -- Create Date:		
1171  -- Description:		View was modified			
1172  -- Integration:		
1173  -- Update History:  
1174  --=======================================================================================
1175  
1176  
1177  
1178  GO
1179  USE [master]
1180  GO
1181  ALTER DATABASE [MdcStandard] SET  READ_WRITE 
1182  GO

-- Validation Results --
Line 1: Failed - Database Name Convention
Line 2: Failed - Database Name Convention
Line 3: Failed - Database Name Convention
Line 4: Passed - Database Name Convention
Line 5: Failed - Database Name Convention
Line 6: Failed - Database Name Convention
Line 7: Failed - Database Name Convention
Line 8: Failed - Database Name Convention
Line 9: Failed - Database Name Convention
Line 10: Failed - Database Name Convention
Line 11: Failed - Database Name Convention
Line 12: Failed - Database Name Convention
Line 13: Failed - Database Name Convention
Line 14: Failed - Database Name Convention
Line 15: Failed - Database Name Convention
Line 16: Failed - Database Name Convention
Line 17: Failed - Database Name Convention
Line 18: Failed - Database Name Convention
Line 19: Failed - Database Name Convention
Line 20: Failed - Database Name Convention
Line 21: Failed - Database Name Convention
Line 22: Failed - Database Name Convention
Line 23: Failed - Database Name Convention
Line 24: Failed - Database Name Convention
Line 25: Failed - Database Name Convention
Line 26: Failed - Database Name Convention
Line 27: Failed - Database Name Convention
Line 28: Failed - Database Name Convention
Line 29: Failed - Database Name Convention
Line 30: Failed - Database Name Convention
Line 31: Failed - Database Name Convention
Line 32: Failed - Database Name Convention
Line 33: Failed - Database Name Convention
Line 34: Failed - Database Name Convention
Line 35: Failed - Database Name Convention
Line 36: Failed - Database Name Convention
Line 37: Failed - Database Name Convention
Line 38: Failed - Database Name Convention
Line 39: Failed - Database Name Convention
Line 40: Failed - Database Name Convention
Line 41: Failed - Database Name Convention
Line 42: Failed - Database Name Convention
Line 43: Failed - Database Name Convention
Line 44: Failed - Database Name Convention
Line 45: Failed - Database Name Convention
Line 46: Failed - Database Name Convention
Line 47: Failed - Database Name Convention
Line 48: Failed - Database Name Convention
Line 49: Failed - Database Name Convention
Line 50: Failed - Database Name Convention
Line 51: Failed - Database Name Convention
Line 52: Failed - Database Name Convention
Line 53: Failed - Database Name Convention
Line 54: Failed - Database Name Convention
Line 55: Failed - Database Name Convention
Line 56: Failed - Database Name Convention
Line 57: Failed - Database Name Convention
Line 58: Failed - Database Name Convention
Line 59: Failed - Database Name Convention
Line 60: Failed - Database Name Convention
Line 61: Failed - Database Name Convention
Line 62: Failed - Database Name Convention
Line 63: Failed - Database Name Convention
Line 64: Failed - Database Name Convention
Line 65: Failed - Database Name Convention
Line 66: Failed - Database Name Convention
Line 67: Failed - Database Name Convention
Line 68: Failed - Database Name Convention
Line 69: Failed - Database Name Convention
Line 70: Failed - Database Name Convention
Line 71: Failed - Database Name Convention
Line 72: Failed - Database Name Convention
Line 73: Failed - Database Name Convention
Line 74: Failed - Database Name Convention
Line 75: Failed - Database Name Convention
Line 76: Failed - Database Name Convention
Line 77: Failed - Database Name Convention
Line 78: Failed - Database Name Convention
Line 79: Failed - Database Name Convention
Line 80: Failed - Database Name Convention
Line 81: Failed - Database Name Convention
Line 82: Failed - Database Name Convention
Line 83: Failed - Database Name Convention
Line 84: Failed - Database Name Convention
Line 85: Failed - Database Name Convention
Line 86: Failed - Database Name Convention
Line 87: Failed - Database Name Convention
Line 88: Failed - Database Name Convention
Line 89: Failed - Database Name Convention
Line 90: Failed - Database Name Convention
Line 91: Failed - Database Name Convention
Line 92: Failed - Database Name Convention
Line 93: Failed - Database Name Convention
Line 94: Failed - Database Name Convention
Line 95: Failed - Database Name Convention
Line 96: Failed - Database Name Convention
Line 97: Failed - Database Name Convention
Line 98: Failed - Database Name Convention
Line 99: Failed - Database Name Convention
Line 100: Failed - Database Name Convention
Line 101: Failed - Database Name Convention
Line 102: Failed - Database Name Convention
Line 103: Failed - Database Name Convention
Line 104: Failed - Database Name Convention
Line 105: Failed - Database Name Convention
Line 106: Failed - Database Name Convention
Line 107: Failed - Database Name Convention
Line 108: Failed - Database Name Convention
Line 109: Failed - Database Name Convention
Line 110: Failed - Database Name Convention
Line 111: Failed - Database Name Convention
Line 112: Failed - Database Name Convention
Line 113: Failed - Database Name Convention
Line 114: Failed - Database Name Convention
Line 115: Failed - Database Name Convention
Line 116: Failed - Database Name Convention
Line 117: Failed - Database Name Convention
Line 118: Failed - Database Name Convention
Line 119: Failed - Database Name Convention
Line 120: Failed - Database Name Convention
Line 121: Failed - Database Name Convention
Line 122: Failed - Database Name Convention
Line 123: Failed - Database Name Convention
Line 124: Failed - Database Name Convention
Line 125: Failed - Database Name Convention
Line 126: Failed - Database Name Convention
Line 127: Failed - Database Name Convention
Line 128: Failed - Database Name Convention
Line 129: Failed - Database Name Convention
Line 130: Failed - Database Name Convention
Line 131: Failed - Database Name Convention
Line 132: Failed - Database Name Convention
Line 133: Failed - Database Name Convention
Line 134: Failed - Database Name Convention
Line 135: Failed - Database Name Convention
Line 136: Failed - Database Name Convention
Line 137: Failed - Database Name Convention
Line 138: Failed - Database Name Convention
Line 139: Failed - Database Name Convention
Line 140: Failed - Database Name Convention
Line 141: Failed - Database Name Convention
Line 142: Failed - Database Name Convention
Line 143: Failed - Database Name Convention
Line 144: Failed - Database Name Convention
Line 145: Failed - Database Name Convention
Line 146: Failed - Database Name Convention
Line 147: Failed - Database Name Convention
Line 148: Failed - Database Name Convention
Line 149: Failed - Database Name Convention
Line 150: Failed - Database Name Convention
Line 151: Failed - Database Name Convention
Line 152: Failed - Database Name Convention
Line 153: Failed - Database Name Convention
Line 154: Failed - Database Name Convention
Line 155: Failed - Database Name Convention
Line 156: Failed - Database Name Convention
Line 157: Failed - Database Name Convention
Line 158: Failed - Database Name Convention
Line 159: Failed - Database Name Convention
Line 160: Failed - Database Name Convention
Line 161: Failed - Database Name Convention
Line 162: Failed - Database Name Convention
Line 163: Failed - Database Name Convention
Line 164: Failed - Database Name Convention
Line 165: Failed - Database Name Convention
Line 166: Failed - Database Name Convention
Line 167: Failed - Database Name Convention
Line 168: Failed - Database Name Convention
Line 169: Failed - Database Name Convention
Line 170: Failed - Database Name Convention
Line 171: Failed - Database Name Convention
Line 172: Failed - Database Name Convention
Line 173: Failed - Database Name Convention
Line 174: Failed - Database Name Convention
Line 175: Failed - Database Name Convention
Line 176: Failed - Database Name Convention
Line 177: Failed - Database Name Convention
Line 178: Failed - Database Name Convention
Line 179: Failed - Database Name Convention
Line 180: Failed - Database Name Convention
Line 181: Failed - Database Name Convention
Line 182: Failed - Database Name Convention
Line 183: Failed - Database Name Convention
Line 184: Failed - Database Name Convention
Line 185: Failed - Database Name Convention
Line 186: Failed - Database Name Convention
Line 187: Failed - Database Name Convention
Line 188: Failed - Database Name Convention
Line 189: Failed - Database Name Convention
Line 190: Failed - Database Name Convention
Line 191: Failed - Database Name Convention
Line 192: Failed - Database Name Convention
Line 193: Failed - Database Name Convention
Line 194: Failed - Database Name Convention
Line 195: Failed - Database Name Convention
Line 196: Failed - Database Name Convention
Line 197: Failed - Database Name Convention
Line 198: Failed - Database Name Convention
Line 199: Failed - Database Name Convention
Line 200: Failed - Database Name Convention
Line 201: Failed - Database Name Convention
Line 202: Failed - Database Name Convention
Line 203: Failed - Database Name Convention
Line 204: Failed - Database Name Convention
Line 205: Failed - Database Name Convention
Line 206: Failed - Database Name Convention
Line 207: Failed - Database Name Convention
Line 208: Failed - Database Name Convention
Line 209: Failed - Database Name Convention
Line 210: Failed - Database Name Convention
Line 211: Failed - Database Name Convention
Line 212: Failed - Database Name Convention
Line 213: Failed - Database Name Convention
Line 214: Failed - Database Name Convention
Line 215: Failed - Database Name Convention
Line 216: Failed - Database Name Convention
Line 217: Failed - Database Name Convention
Line 218: Failed - Database Name Convention
Line 219: Failed - Database Name Convention
Line 220: Failed - Database Name Convention
Line 221: Failed - Database Name Convention
Line 222: Failed - Database Name Convention
Line 223: Failed - Database Name Convention
Line 224: Failed - Database Name Convention
Line 225: Failed - Database Name Convention
Line 226: Failed - Database Name Convention
Line 227: Failed - Database Name Convention
Line 228: Failed - Database Name Convention
Line 229: Failed - Database Name Convention
Line 230: Failed - Database Name Convention
Line 231: Failed - Database Name Convention
Line 232: Failed - Database Name Convention
Line 233: Failed - Database Name Convention
Line 234: Failed - Database Name Convention
Line 235: Failed - Database Name Convention
Line 236: Failed - Database Name Convention
Line 237: Failed - Database Name Convention
Line 238: Failed - Database Name Convention
Line 239: Failed - Database Name Convention
Line 240: Failed - Database Name Convention
Line 241: Failed - Database Name Convention
Line 242: Failed - Database Name Convention
Line 243: Failed - Database Name Convention
Line 244: Failed - Database Name Convention
Line 245: Failed - Database Name Convention
Line 246: Failed - Database Name Convention
Line 247: Failed - Database Name Convention
Line 248: Failed - Database Name Convention
Line 249: Failed - Database Name Convention
Line 250: Failed - Database Name Convention
Line 251: Failed - Database Name Convention
Line 252: Failed - Database Name Convention
Line 253: Failed - Database Name Convention
Line 254: Failed - Database Name Convention
Line 255: Failed - Database Name Convention
Line 256: Failed - Database Name Convention
Line 257: Failed - Database Name Convention
Line 258: Failed - Database Name Convention
Line 259: Failed - Database Name Convention
Line 260: Failed - Database Name Convention
Line 261: Failed - Database Name Convention
Line 262: Failed - Database Name Convention
Line 263: Failed - Database Name Convention
Line 264: Failed - Database Name Convention
Line 265: Failed - Database Name Convention
Line 266: Failed - Database Name Convention
Line 267: Failed - Database Name Convention
Line 268: Failed - Database Name Convention
Line 269: Failed - Database Name Convention
Line 270: Failed - Database Name Convention
Line 271: Failed - Database Name Convention
Line 272: Failed - Database Name Convention
Line 273: Failed - Database Name Convention
Line 274: Failed - Database Name Convention
Line 275: Failed - Database Name Convention
Line 276: Failed - Database Name Convention
Line 277: Failed - Database Name Convention
Line 278: Failed - Database Name Convention
Line 279: Failed - Database Name Convention
Line 280: Failed - Database Name Convention
Line 281: Failed - Database Name Convention
Line 282: Failed - Database Name Convention
Line 283: Failed - Database Name Convention
Line 284: Failed - Database Name Convention
Line 285: Failed - Database Name Convention
Line 286: Failed - Database Name Convention
Line 287: Failed - Database Name Convention
Line 288: Failed - Database Name Convention
Line 289: Failed - Database Name Convention
Line 290: Failed - Database Name Convention
Line 291: Failed - Database Name Convention
Line 292: Failed - Database Name Convention
Line 293: Failed - Database Name Convention
Line 294: Failed - Database Name Convention
Line 295: Failed - Database Name Convention
Line 296: Failed - Database Name Convention
Line 297: Failed - Database Name Convention
Line 298: Failed - Database Name Convention
Line 299: Failed - Database Name Convention
Line 300: Failed - Database Name Convention
Line 301: Failed - Database Name Convention
Line 302: Failed - Database Name Convention
Line 303: Failed - Database Name Convention
Line 304: Failed - Database Name Convention
Line 305: Failed - Database Name Convention
Line 306: Failed - Database Name Convention
Line 307: Failed - Database Name Convention
Line 308: Failed - Database Name Convention
Line 309: Failed - Database Name Convention
Line 310: Failed - Database Name Convention
Line 311: Failed - Database Name Convention
Line 312: Failed - Database Name Convention
Line 313: Failed - Database Name Convention
Line 314: Failed - Database Name Convention
Line 315: Failed - Database Name Convention
Line 316: Failed - Database Name Convention
Line 317: Failed - Database Name Convention
Line 318: Failed - Database Name Convention
Line 319: Failed - Database Name Convention
Line 320: Failed - Database Name Convention
Line 321: Failed - Database Name Convention
Line 322: Failed - Database Name Convention
Line 323: Failed - Database Name Convention
Line 324: Failed - Database Name Convention
Line 325: Failed - Database Name Convention
Line 326: Failed - Database Name Convention
Line 327: Failed - Database Name Convention
Line 328: Failed - Database Name Convention
Line 329: Failed - Database Name Convention
Line 330: Failed - Database Name Convention
Line 331: Failed - Database Name Convention
Line 332: Failed - Database Name Convention
Line 333: Failed - Database Name Convention
Line 334: Failed - Database Name Convention
Line 335: Failed - Database Name Convention
Line 336: Failed - Database Name Convention
Line 337: Failed - Database Name Convention
Line 338: Failed - Database Name Convention
Line 339: Failed - Database Name Convention
Line 340: Failed - Database Name Convention
Line 341: Failed - Database Name Convention
Line 342: Failed - Database Name Convention
Line 343: Failed - Database Name Convention
Line 344: Failed - Database Name Convention
Line 345: Failed - Database Name Convention
Line 346: Failed - Database Name Convention
Line 347: Failed - Database Name Convention
Line 348: Failed - Database Name Convention
Line 349: Failed - Database Name Convention
Line 350: Failed - Database Name Convention
Line 351: Failed - Database Name Convention
Line 352: Failed - Database Name Convention
Line 353: Failed - Database Name Convention
Line 354: Failed - Database Name Convention
Line 355: Failed - Database Name Convention
Line 356: Failed - Database Name Convention
Line 357: Failed - Database Name Convention
Line 358: Failed - Database Name Convention
Line 359: Failed - Database Name Convention
Line 360: Failed - Database Name Convention
Line 361: Failed - Database Name Convention
Line 362: Failed - Database Name Convention
Line 363: Failed - Database Name Convention
Line 364: Failed - Database Name Convention
Line 365: Failed - Database Name Convention
Line 366: Failed - Database Name Convention
Line 367: Failed - Database Name Convention
Line 368: Failed - Database Name Convention
Line 369: Failed - Database Name Convention
Line 370: Failed - Database Name Convention
Line 371: Failed - Database Name Convention
Line 372: Failed - Database Name Convention
Line 373: Failed - Database Name Convention
Line 374: Failed - Database Name Convention
Line 375: Failed - Database Name Convention
Line 376: Failed - Database Name Convention
Line 377: Failed - Database Name Convention
Line 378: Failed - Database Name Convention
Line 379: Failed - Database Name Convention
Line 380: Failed - Database Name Convention
Line 381: Failed - Database Name Convention
Line 382: Failed - Database Name Convention
Line 383: Failed - Database Name Convention
Line 384: Failed - Database Name Convention
Line 385: Failed - Database Name Convention
Line 386: Failed - Database Name Convention
Line 387: Failed - Database Name Convention
Line 388: Failed - Database Name Convention
Line 389: Failed - Database Name Convention
Line 390: Failed - Database Name Convention
Line 391: Failed - Database Name Convention
Line 392: Failed - Database Name Convention
Line 393: Failed - Database Name Convention
Line 394: Failed - Database Name Convention
Line 395: Failed - Database Name Convention
Line 396: Failed - Database Name Convention
Line 397: Failed - Database Name Convention
Line 398: Failed - Database Name Convention
Line 399: Failed - Database Name Convention
Line 400: Failed - Database Name Convention
Line 401: Failed - Database Name Convention
Line 402: Failed - Database Name Convention
Line 403: Failed - Database Name Convention
Line 404: Failed - Database Name Convention
Line 405: Failed - Database Name Convention
Line 406: Failed - Database Name Convention
Line 407: Failed - Database Name Convention
Line 408: Failed - Database Name Convention
Line 409: Failed - Database Name Convention
Line 410: Failed - Database Name Convention
Line 411: Failed - Database Name Convention
Line 412: Failed - Database Name Convention
Line 413: Failed - Database Name Convention
Line 414: Failed - Database Name Convention
Line 415: Failed - Database Name Convention
Line 416: Failed - Database Name Convention
Line 417: Failed - Database Name Convention
Line 418: Failed - Database Name Convention
Line 419: Failed - Database Name Convention
Line 420: Failed - Database Name Convention
Line 421: Failed - Database Name Convention
Line 422: Failed - Database Name Convention
Line 423: Failed - Database Name Convention
Line 424: Failed - Database Name Convention
Line 425: Failed - Database Name Convention
Line 426: Failed - Database Name Convention
Line 427: Failed - Database Name Convention
Line 428: Failed - Database Name Convention
Line 429: Failed - Database Name Convention
Line 430: Failed - Database Name Convention
Line 431: Failed - Database Name Convention
Line 432: Failed - Database Name Convention
Line 433: Failed - Database Name Convention
Line 434: Failed - Database Name Convention
Line 435: Failed - Database Name Convention
Line 436: Failed - Database Name Convention
Line 437: Failed - Database Name Convention
Line 438: Failed - Database Name Convention
Line 439: Failed - Database Name Convention
Line 440: Failed - Database Name Convention
Line 441: Failed - Database Name Convention
Line 442: Failed - Database Name Convention
Line 443: Failed - Database Name Convention
Line 444: Failed - Database Name Convention
Line 445: Failed - Database Name Convention
Line 446: Failed - Database Name Convention
Line 447: Failed - Database Name Convention
Line 448: Failed - Database Name Convention
Line 449: Failed - Database Name Convention
Line 450: Failed - Database Name Convention
Line 451: Failed - Database Name Convention
Line 452: Failed - Database Name Convention
Line 453: Failed - Database Name Convention
Line 454: Failed - Database Name Convention
Line 455: Failed - Database Name Convention
Line 456: Failed - Database Name Convention
Line 457: Failed - Database Name Convention
Line 458: Failed - Database Name Convention
Line 459: Failed - Database Name Convention
Line 460: Failed - Database Name Convention
Line 461: Failed - Database Name Convention
Line 462: Failed - Database Name Convention
Line 463: Failed - Database Name Convention
Line 464: Failed - Database Name Convention
Line 465: Failed - Database Name Convention
Line 466: Failed - Database Name Convention
Line 467: Failed - Database Name Convention
Line 468: Failed - Database Name Convention
Line 469: Failed - Database Name Convention
Line 470: Failed - Database Name Convention
Line 471: Failed - Database Name Convention
Line 472: Failed - Database Name Convention
Line 473: Failed - Database Name Convention
Line 474: Failed - Database Name Convention
Line 475: Failed - Database Name Convention
Line 476: Failed - Database Name Convention
Line 477: Failed - Database Name Convention
Line 478: Failed - Database Name Convention
Line 479: Failed - Database Name Convention
Line 480: Failed - Database Name Convention
Line 481: Failed - Database Name Convention
Line 482: Failed - Database Name Convention
Line 483: Failed - Database Name Convention
Line 484: Failed - Database Name Convention
Line 485: Failed - Database Name Convention
Line 486: Failed - Database Name Convention
Line 487: Failed - Database Name Convention
Line 488: Failed - Database Name Convention
Line 489: Failed - Database Name Convention
Line 490: Failed - Database Name Convention
Line 491: Failed - Database Name Convention
Line 492: Failed - Database Name Convention
Line 493: Failed - Database Name Convention
Line 494: Failed - Database Name Convention
Line 495: Failed - Database Name Convention
Line 496: Failed - Database Name Convention
Line 497: Failed - Database Name Convention
Line 498: Failed - Database Name Convention
Line 499: Failed - Database Name Convention
Line 500: Failed - Database Name Convention
Line 501: Failed - Database Name Convention
Line 502: Failed - Database Name Convention
Line 503: Failed - Database Name Convention
Line 504: Failed - Database Name Convention
Line 505: Failed - Database Name Convention
Line 506: Failed - Database Name Convention
Line 507: Failed - Database Name Convention
Line 508: Failed - Database Name Convention
Line 509: Failed - Database Name Convention
Line 510: Failed - Database Name Convention
Line 511: Failed - Database Name Convention
Line 512: Failed - Database Name Convention
Line 513: Failed - Database Name Convention
Line 514: Failed - Database Name Convention
Line 515: Failed - Database Name Convention
Line 516: Failed - Database Name Convention
Line 517: Failed - Database Name Convention
Line 518: Failed - Database Name Convention
Line 519: Failed - Database Name Convention
Line 520: Failed - Database Name Convention
Line 521: Failed - Database Name Convention
Line 522: Failed - Database Name Convention
Line 523: Failed - Database Name Convention
Line 524: Failed - Database Name Convention
Line 525: Failed - Database Name Convention
Line 526: Failed - Database Name Convention
Line 527: Failed - Database Name Convention
Line 528: Failed - Database Name Convention
Line 529: Failed - Database Name Convention
Line 530: Failed - Database Name Convention
Line 531: Failed - Database Name Convention
Line 532: Failed - Database Name Convention
Line 533: Failed - Database Name Convention
Line 534: Failed - Database Name Convention
Line 535: Failed - Database Name Convention
Line 536: Failed - Database Name Convention
Line 537: Failed - Database Name Convention
Line 538: Failed - Database Name Convention
Line 539: Failed - Database Name Convention
Line 540: Failed - Database Name Convention
Line 541: Failed - Database Name Convention
Line 542: Failed - Database Name Convention
Line 543: Failed - Database Name Convention
Line 544: Failed - Database Name Convention
Line 545: Failed - Database Name Convention
Line 546: Failed - Database Name Convention
Line 547: Failed - Database Name Convention
Line 548: Failed - Database Name Convention
Line 549: Failed - Database Name Convention
Line 550: Failed - Database Name Convention
Line 551: Failed - Database Name Convention
Line 552: Failed - Database Name Convention
Line 553: Failed - Database Name Convention
Line 554: Failed - Database Name Convention
Line 555: Failed - Database Name Convention
Line 556: Failed - Database Name Convention
Line 557: Failed - Database Name Convention
Line 558: Failed - Database Name Convention
Line 559: Failed - Database Name Convention
Line 560: Failed - Database Name Convention
Line 561: Failed - Database Name Convention
Line 562: Failed - Database Name Convention
Line 563: Failed - Database Name Convention
Line 564: Failed - Database Name Convention
Line 565: Failed - Database Name Convention
Line 566: Failed - Database Name Convention
Line 567: Failed - Database Name Convention
Line 568: Failed - Database Name Convention
Line 569: Failed - Database Name Convention
Line 570: Failed - Database Name Convention
Line 571: Failed - Database Name Convention
Line 572: Failed - Database Name Convention
Line 573: Failed - Database Name Convention
Line 574: Failed - Database Name Convention
Line 575: Failed - Database Name Convention
Line 576: Failed - Database Name Convention
Line 577: Failed - Database Name Convention
Line 578: Failed - Database Name Convention
Line 579: Failed - Database Name Convention
Line 580: Failed - Database Name Convention
Line 581: Failed - Database Name Convention
Line 582: Failed - Database Name Convention
Line 583: Failed - Database Name Convention
Line 584: Failed - Database Name Convention
Line 585: Failed - Database Name Convention
Line 586: Failed - Database Name Convention
Line 587: Failed - Database Name Convention
Line 588: Failed - Database Name Convention
Line 589: Failed - Database Name Convention
Line 590: Failed - Database Name Convention
Line 591: Failed - Database Name Convention
Line 592: Failed - Database Name Convention
Line 593: Failed - Database Name Convention
Line 594: Failed - Database Name Convention
Line 595: Failed - Database Name Convention
Line 596: Failed - Database Name Convention
Line 597: Failed - Database Name Convention
Line 598: Failed - Database Name Convention
Line 599: Failed - Database Name Convention
Line 600: Failed - Database Name Convention
Line 601: Failed - Database Name Convention
Line 602: Failed - Database Name Convention
Line 603: Failed - Database Name Convention
Line 604: Failed - Database Name Convention
Line 605: Failed - Database Name Convention
Line 606: Failed - Database Name Convention
Line 607: Failed - Database Name Convention
Line 608: Failed - Database Name Convention
Line 609: Failed - Database Name Convention
Line 610: Failed - Database Name Convention
Line 611: Failed - Database Name Convention
Line 612: Failed - Database Name Convention
Line 613: Failed - Database Name Convention
Line 614: Failed - Database Name Convention
Line 615: Failed - Database Name Convention
Line 616: Failed - Database Name Convention
Line 617: Failed - Database Name Convention
Line 618: Failed - Database Name Convention
Line 619: Failed - Database Name Convention
Line 620: Failed - Database Name Convention
Line 621: Failed - Database Name Convention
Line 622: Failed - Database Name Convention
Line 623: Failed - Database Name Convention
Line 624: Failed - Database Name Convention
Line 625: Failed - Database Name Convention
Line 626: Failed - Database Name Convention
Line 627: Failed - Database Name Convention
Line 628: Failed - Database Name Convention
Line 629: Failed - Database Name Convention
Line 630: Failed - Database Name Convention
Line 631: Failed - Database Name Convention
Line 632: Failed - Database Name Convention
Line 633: Failed - Database Name Convention
Line 634: Failed - Database Name Convention
Line 635: Failed - Database Name Convention
Line 636: Failed - Database Name Convention
Line 637: Failed - Database Name Convention
Line 638: Failed - Database Name Convention
Line 639: Failed - Database Name Convention
Line 640: Failed - Database Name Convention
Line 641: Failed - Database Name Convention
Line 642: Failed - Database Name Convention
Line 643: Failed - Database Name Convention
Line 644: Failed - Database Name Convention
Line 645: Failed - Database Name Convention
Line 646: Failed - Database Name Convention
Line 647: Failed - Database Name Convention
Line 648: Failed - Database Name Convention
Line 649: Failed - Database Name Convention
Line 650: Failed - Database Name Convention
Line 651: Failed - Database Name Convention
Line 652: Failed - Database Name Convention
Line 653: Failed - Database Name Convention
Line 654: Failed - Database Name Convention
Line 655: Failed - Database Name Convention
Line 656: Failed - Database Name Convention
Line 657: Failed - Database Name Convention
Line 658: Failed - Database Name Convention
Line 659: Failed - Database Name Convention
Line 660: Failed - Database Name Convention
Line 661: Failed - Database Name Convention
Line 662: Failed - Database Name Convention
Line 663: Failed - Database Name Convention
Line 664: Failed - Database Name Convention
Line 665: Failed - Database Name Convention
Line 666: Failed - Database Name Convention
Line 667: Failed - Database Name Convention
Line 668: Failed - Database Name Convention
Line 669: Failed - Database Name Convention
Line 670: Failed - Database Name Convention
Line 671: Failed - Database Name Convention
Line 672: Failed - Database Name Convention
Line 673: Failed - Database Name Convention
Line 674: Failed - Database Name Convention
Line 675: Failed - Database Name Convention
Line 676: Failed - Database Name Convention
Line 677: Failed - Database Name Convention
Line 678: Failed - Database Name Convention
Line 679: Failed - Database Name Convention
Line 680: Failed - Database Name Convention
Line 681: Failed - Database Name Convention
Line 682: Failed - Database Name Convention
Line 683: Failed - Database Name Convention
Line 684: Failed - Database Name Convention
Line 685: Failed - Database Name Convention
Line 686: Failed - Database Name Convention
Line 687: Failed - Database Name Convention
Line 688: Failed - Database Name Convention
Line 689: Failed - Database Name Convention
Line 690: Failed - Database Name Convention
Line 691: Failed - Database Name Convention
Line 692: Failed - Database Name Convention
Line 693: Failed - Database Name Convention
Line 694: Failed - Database Name Convention
Line 695: Failed - Database Name Convention
Line 696: Failed - Database Name Convention
Line 697: Failed - Database Name Convention
Line 698: Failed - Database Name Convention
Line 699: Failed - Database Name Convention
Line 700: Failed - Database Name Convention
Line 701: Failed - Database Name Convention
Line 702: Failed - Database Name Convention
Line 703: Failed - Database Name Convention
Line 704: Failed - Database Name Convention
Line 705: Failed - Database Name Convention
Line 706: Failed - Database Name Convention
Line 707: Failed - Database Name Convention
Line 708: Failed - Database Name Convention
Line 709: Failed - Database Name Convention
Line 710: Failed - Database Name Convention
Line 711: Failed - Database Name Convention
Line 712: Failed - Database Name Convention
Line 713: Failed - Database Name Convention
Line 714: Failed - Database Name Convention
Line 715: Failed - Database Name Convention
Line 716: Failed - Database Name Convention
Line 717: Failed - Database Name Convention
Line 718: Failed - Database Name Convention
Line 719: Failed - Database Name Convention
Line 720: Failed - Database Name Convention
Line 721: Failed - Database Name Convention
Line 722: Failed - Database Name Convention
Line 723: Failed - Database Name Convention
Line 724: Failed - Database Name Convention
Line 725: Failed - Database Name Convention
Line 726: Failed - Database Name Convention
Line 727: Failed - Database Name Convention
Line 728: Failed - Database Name Convention
Line 729: Failed - Database Name Convention
Line 730: Failed - Database Name Convention
Line 731: Failed - Database Name Convention
Line 732: Failed - Database Name Convention
Line 733: Failed - Database Name Convention
Line 734: Failed - Database Name Convention
Line 735: Failed - Database Name Convention
Line 736: Failed - Database Name Convention
Line 737: Failed - Database Name Convention
Line 738: Failed - Database Name Convention
Line 739: Failed - Database Name Convention
Line 740: Failed - Database Name Convention
Line 741: Failed - Database Name Convention
Line 742: Failed - Database Name Convention
Line 743: Failed - Database Name Convention
Line 744: Failed - Database Name Convention
Line 745: Failed - Database Name Convention
Line 746: Failed - Database Name Convention
Line 747: Failed - Database Name Convention
Line 748: Failed - Database Name Convention
Line 749: Failed - Database Name Convention
Line 750: Failed - Database Name Convention
Line 751: Failed - Database Name Convention
Line 752: Failed - Database Name Convention
Line 753: Failed - Database Name Convention
Line 754: Failed - Database Name Convention
Line 755: Failed - Database Name Convention
Line 756: Failed - Database Name Convention
Line 757: Failed - Database Name Convention
Line 758: Failed - Database Name Convention
Line 759: Failed - Database Name Convention
Line 760: Failed - Database Name Convention
Line 761: Failed - Database Name Convention
Line 762: Failed - Database Name Convention
Line 763: Failed - Database Name Convention
Line 764: Failed - Database Name Convention
Line 765: Failed - Database Name Convention
Line 766: Failed - Database Name Convention
Line 767: Failed - Database Name Convention
Line 768: Failed - Database Name Convention
Line 769: Failed - Database Name Convention
Line 770: Failed - Database Name Convention
Line 771: Failed - Database Name Convention
Line 772: Failed - Database Name Convention
Line 773: Failed - Database Name Convention
Line 774: Failed - Database Name Convention
Line 775: Failed - Database Name Convention
Line 776: Failed - Database Name Convention
Line 777: Failed - Database Name Convention
Line 778: Failed - Database Name Convention
Line 779: Failed - Database Name Convention
Line 780: Failed - Database Name Convention
Line 781: Failed - Database Name Convention
Line 782: Failed - Database Name Convention
Line 783: Failed - Database Name Convention
Line 784: Failed - Database Name Convention
Line 785: Failed - Database Name Convention
Line 786: Failed - Database Name Convention
Line 787: Failed - Database Name Convention
Line 788: Failed - Database Name Convention
Line 789: Failed - Database Name Convention
Line 790: Failed - Database Name Convention
Line 791: Failed - Database Name Convention
Line 792: Failed - Database Name Convention
Line 793: Failed - Database Name Convention
Line 794: Failed - Database Name Convention
Line 795: Failed - Database Name Convention
Line 796: Failed - Database Name Convention
Line 797: Failed - Database Name Convention
Line 798: Failed - Database Name Convention
Line 799: Failed - Database Name Convention
Line 800: Failed - Database Name Convention
Line 801: Failed - Database Name Convention
Line 802: Failed - Database Name Convention
Line 803: Failed - Database Name Convention
Line 804: Failed - Database Name Convention
Line 805: Failed - Database Name Convention
Line 806: Failed - Database Name Convention
Line 807: Failed - Database Name Convention
Line 808: Failed - Database Name Convention
Line 809: Failed - Database Name Convention
Line 810: Failed - Database Name Convention
Line 811: Failed - Database Name Convention
Line 812: Failed - Database Name Convention
Line 813: Failed - Database Name Convention
Line 814: Failed - Database Name Convention
Line 815: Failed - Database Name Convention
Line 816: Failed - Database Name Convention
Line 817: Failed - Database Name Convention
Line 818: Failed - Database Name Convention
Line 819: Failed - Database Name Convention
Line 820: Failed - Database Name Convention
Line 821: Failed - Database Name Convention
Line 822: Failed - Database Name Convention
Line 823: Failed - Database Name Convention
Line 824: Failed - Database Name Convention
Line 825: Failed - Database Name Convention
Line 826: Failed - Database Name Convention
Line 827: Failed - Database Name Convention
Line 828: Failed - Database Name Convention
Line 829: Failed - Database Name Convention
Line 830: Failed - Database Name Convention
Line 831: Failed - Database Name Convention
Line 832: Failed - Database Name Convention
Line 833: Failed - Database Name Convention
Line 834: Failed - Database Name Convention
Line 835: Failed - Database Name Convention
Line 836: Failed - Database Name Convention
Line 837: Failed - Database Name Convention
Line 838: Failed - Database Name Convention
Line 839: Failed - Database Name Convention
Line 840: Failed - Database Name Convention
Line 841: Failed - Database Name Convention
Line 842: Failed - Database Name Convention
Line 843: Failed - Database Name Convention
Line 844: Failed - Database Name Convention
Line 845: Failed - Database Name Convention
Line 846: Failed - Database Name Convention
Line 847: Failed - Database Name Convention
Line 848: Failed - Database Name Convention
Line 849: Failed - Database Name Convention
Line 850: Failed - Database Name Convention
Line 851: Failed - Database Name Convention
Line 852: Failed - Database Name Convention
Line 853: Failed - Database Name Convention
Line 854: Failed - Database Name Convention
Line 855: Failed - Database Name Convention
Line 856: Failed - Database Name Convention
Line 857: Failed - Database Name Convention
Line 858: Failed - Database Name Convention
Line 859: Failed - Database Name Convention
Line 860: Failed - Database Name Convention
Line 861: Failed - Database Name Convention
Line 862: Failed - Database Name Convention
Line 863: Failed - Database Name Convention
Line 864: Failed - Database Name Convention
Line 865: Failed - Database Name Convention
Line 866: Failed - Database Name Convention
Line 867: Failed - Database Name Convention
Line 868: Failed - Database Name Convention
Line 869: Failed - Database Name Convention
Line 870: Failed - Database Name Convention
Line 871: Failed - Database Name Convention
Line 872: Failed - Database Name Convention
Line 873: Failed - Database Name Convention
Line 874: Failed - Database Name Convention
Line 875: Failed - Database Name Convention
Line 876: Failed - Database Name Convention
Line 877: Failed - Database Name Convention
Line 878: Failed - Database Name Convention
Line 879: Failed - Database Name Convention
Line 880: Failed - Database Name Convention
Line 881: Failed - Database Name Convention
Line 882: Failed - Database Name Convention
Line 883: Failed - Database Name Convention
Line 884: Failed - Database Name Convention
Line 885: Failed - Database Name Convention
Line 886: Failed - Database Name Convention
Line 887: Failed - Database Name Convention
Line 888: Failed - Database Name Convention
Line 889: Failed - Database Name Convention
Line 890: Failed - Database Name Convention
Line 891: Failed - Database Name Convention
Line 892: Failed - Database Name Convention
Line 893: Failed - Database Name Convention
Line 894: Failed - Database Name Convention
Line 895: Failed - Database Name Convention
Line 896: Failed - Database Name Convention
Line 897: Failed - Database Name Convention
Line 898: Failed - Database Name Convention
Line 899: Failed - Database Name Convention
Line 900: Failed - Database Name Convention
Line 901: Failed - Database Name Convention
Line 902: Failed - Database Name Convention
Line 903: Failed - Database Name Convention
Line 904: Failed - Database Name Convention
Line 905: Failed - Database Name Convention
Line 906: Failed - Database Name Convention
Line 907: Failed - Database Name Convention
Line 908: Failed - Database Name Convention
Line 909: Failed - Database Name Convention
Line 910: Failed - Database Name Convention
Line 911: Failed - Database Name Convention
Line 912: Failed - Database Name Convention
Line 913: Failed - Database Name Convention
Line 914: Failed - Database Name Convention
Line 915: Failed - Database Name Convention
Line 916: Failed - Database Name Convention
Line 917: Failed - Database Name Convention
Line 918: Failed - Database Name Convention
Line 919: Failed - Database Name Convention
Line 920: Failed - Database Name Convention
Line 921: Failed - Database Name Convention
Line 922: Failed - Database Name Convention
Line 923: Failed - Database Name Convention
Line 924: Failed - Database Name Convention
Line 925: Failed - Database Name Convention
Line 926: Failed - Database Name Convention
Line 927: Failed - Database Name Convention
Line 928: Failed - Database Name Convention
Line 929: Failed - Database Name Convention
Line 930: Failed - Database Name Convention
Line 931: Failed - Database Name Convention
Line 932: Failed - Database Name Convention
Line 933: Failed - Database Name Convention
Line 934: Failed - Database Name Convention
Line 935: Failed - Database Name Convention
Line 936: Failed - Database Name Convention
Line 937: Failed - Database Name Convention
Line 938: Failed - Database Name Convention
Line 939: Failed - Database Name Convention
Line 940: Failed - Database Name Convention
Line 941: Failed - Database Name Convention
Line 942: Failed - Database Name Convention
Line 943: Failed - Database Name Convention
Line 944: Failed - Database Name Convention
Line 945: Failed - Database Name Convention
Line 946: Failed - Database Name Convention
Line 947: Failed - Database Name Convention
Line 948: Failed - Database Name Convention
Line 949: Failed - Database Name Convention
Line 950: Failed - Database Name Convention
Line 951: Failed - Database Name Convention
Line 952: Failed - Database Name Convention
Line 953: Failed - Database Name Convention
Line 954: Failed - Database Name Convention
Line 955: Failed - Database Name Convention
Line 956: Failed - Database Name Convention
Line 957: Failed - Database Name Convention
Line 958: Failed - Database Name Convention
Line 959: Failed - Database Name Convention
Line 960: Failed - Database Name Convention
Line 961: Failed - Database Name Convention
Line 962: Failed - Database Name Convention
Line 963: Failed - Database Name Convention
Line 964: Failed - Database Name Convention
Line 965: Failed - Database Name Convention
Line 966: Failed - Database Name Convention
Line 967: Failed - Database Name Convention
Line 968: Failed - Database Name Convention
Line 969: Failed - Database Name Convention
Line 970: Failed - Database Name Convention
Line 971: Failed - Database Name Convention
Line 972: Failed - Database Name Convention
Line 973: Failed - Database Name Convention
Line 974: Failed - Database Name Convention
Line 975: Failed - Database Name Convention
Line 976: Failed - Database Name Convention
Line 977: Failed - Database Name Convention
Line 978: Failed - Database Name Convention
Line 979: Failed - Database Name Convention
Line 980: Failed - Database Name Convention
Line 981: Failed - Database Name Convention
Line 982: Failed - Database Name Convention
Line 983: Failed - Database Name Convention
Line 984: Failed - Database Name Convention
Line 985: Failed - Database Name Convention
Line 986: Failed - Database Name Convention
Line 987: Failed - Database Name Convention
Line 988: Failed - Database Name Convention
Line 989: Failed - Database Name Convention
Line 990: Failed - Database Name Convention
Line 991: Failed - Database Name Convention
Line 992: Failed - Database Name Convention
Line 993: Failed - Database Name Convention
Line 994: Failed - Database Name Convention
Line 995: Failed - Database Name Convention
Line 996: Failed - Database Name Convention
Line 997: Failed - Database Name Convention
Line 998: Failed - Database Name Convention
Line 999: Failed - Database Name Convention
Line 1000: Failed - Database Name Convention
Line 1001: Failed - Database Name Convention
Line 1002: Failed - Database Name Convention
Line 1003: Failed - Database Name Convention
Line 1004: Failed - Database Name Convention
Line 1005: Failed - Database Name Convention
Line 1006: Failed - Database Name Convention
Line 1007: Failed - Database Name Convention
Line 1008: Failed - Database Name Convention
Line 1009: Failed - Database Name Convention
Line 1010: Failed - Database Name Convention
Line 1011: Failed - Database Name Convention
Line 1012: Failed - Database Name Convention
Line 1013: Failed - Database Name Convention
Line 1014: Failed - Database Name Convention
Line 1015: Failed - Database Name Convention
Line 1016: Failed - Database Name Convention
Line 1017: Failed - Database Name Convention
Line 1018: Failed - Database Name Convention
Line 1019: Failed - Database Name Convention
Line 1020: Failed - Database Name Convention
Line 1021: Failed - Database Name Convention
Line 1022: Failed - Database Name Convention
Line 1023: Failed - Database Name Convention
Line 1024: Failed - Database Name Convention
Line 1025: Failed - Database Name Convention
Line 1026: Failed - Database Name Convention
Line 1027: Failed - Database Name Convention
Line 1028: Failed - Database Name Convention
Line 1029: Failed - Database Name Convention
Line 1030: Failed - Database Name Convention
Line 1031: Failed - Database Name Convention
Line 1032: Failed - Database Name Convention
Line 1033: Failed - Database Name Convention
Line 1034: Failed - Database Name Convention
Line 1035: Failed - Database Name Convention
Line 1036: Failed - Database Name Convention
Line 1037: Failed - Database Name Convention
Line 1038: Failed - Database Name Convention
Line 1039: Failed - Database Name Convention
Line 1040: Failed - Database Name Convention
Line 1041: Failed - Database Name Convention
Line 1042: Failed - Database Name Convention
Line 1043: Failed - Database Name Convention
Line 1044: Failed - Database Name Convention
Line 1045: Failed - Database Name Convention
Line 1046: Failed - Database Name Convention
Line 1047: Failed - Database Name Convention
Line 1048: Failed - Database Name Convention
Line 1049: Failed - Database Name Convention
Line 1050: Failed - Database Name Convention
Line 1051: Failed - Database Name Convention
Line 1052: Failed - Database Name Convention
Line 1053: Failed - Database Name Convention
Line 1054: Failed - Database Name Convention
Line 1055: Failed - Database Name Convention
Line 1056: Failed - Database Name Convention
Line 1057: Failed - Database Name Convention
Line 1058: Failed - Database Name Convention
Line 1059: Failed - Database Name Convention
Line 1060: Failed - Database Name Convention
Line 1061: Failed - Database Name Convention
Line 1062: Failed - Database Name Convention
Line 1063: Failed - Database Name Convention
Line 1064: Failed - Database Name Convention
Line 1065: Failed - Database Name Convention
Line 1066: Failed - Database Name Convention
Line 1067: Failed - Database Name Convention
Line 1068: Failed - Database Name Convention
Line 1069: Failed - Database Name Convention
Line 1070: Failed - Database Name Convention
Line 1071: Failed - Database Name Convention
Line 1072: Failed - Database Name Convention
Line 1073: Failed - Database Name Convention
Line 1074: Failed - Database Name Convention
Line 1075: Failed - Database Name Convention
Line 1076: Failed - Database Name Convention
Line 1077: Failed - Database Name Convention
Line 1078: Failed - Database Name Convention
Line 1079: Failed - Database Name Convention
Line 1080: Failed - Database Name Convention
Line 1081: Failed - Database Name Convention
Line 1082: Failed - Database Name Convention
Line 1083: Failed - Database Name Convention
Line 1084: Failed - Database Name Convention
Line 1085: Failed - Database Name Convention
Line 1086: Failed - Database Name Convention
Line 1087: Failed - Database Name Convention
Line 1088: Failed - Database Name Convention
Line 1089: Failed - Database Name Convention
Line 1090: Failed - Database Name Convention
Line 1091: Failed - Database Name Convention
Line 1092: Failed - Database Name Convention
Line 1093: Failed - Database Name Convention
Line 1094: Failed - Database Name Convention
Line 1095: Failed - Database Name Convention
Line 1096: Failed - Database Name Convention
Line 1097: Failed - Database Name Convention
Line 1098: Failed - Database Name Convention
Line 1099: Failed - Database Name Convention
Line 1100: Failed - Database Name Convention
Line 1101: Failed - Database Name Convention
Line 1102: Failed - Database Name Convention
Line 1103: Failed - Database Name Convention
Line 1104: Failed - Database Name Convention
Line 1105: Failed - Database Name Convention
Line 1106: Failed - Database Name Convention
Line 1107: Failed - Database Name Convention
Line 1108: Failed - Database Name Convention
Line 1109: Failed - Database Name Convention
Line 1110: Failed - Database Name Convention
Line 1111: Failed - Database Name Convention
Line 1112: Failed - Database Name Convention
Line 1113: Failed - Database Name Convention
Line 1114: Failed - Database Name Convention
Line 1115: Failed - Database Name Convention
Line 1116: Failed - Database Name Convention
Line 1117: Failed - Database Name Convention
Line 1118: Failed - Database Name Convention
Line 1119: Failed - Database Name Convention
Line 1120: Failed - Database Name Convention
Line 1121: Failed - Database Name Convention
Line 1122: Failed - Database Name Convention
Line 1123: Failed - Database Name Convention
Line 1124: Failed - Database Name Convention
Line 1125: Failed - Database Name Convention
Line 1126: Failed - Database Name Convention
Line 1127: Failed - Database Name Convention
Line 1128: Failed - Database Name Convention
Line 1129: Failed - Database Name Convention
Line 1130: Failed - Database Name Convention
Line 1131: Failed - Database Name Convention
Line 1132: Failed - Database Name Convention
Line 1133: Failed - Database Name Convention
Line 1134: Failed - Database Name Convention
Line 1135: Failed - Database Name Convention
Line 1136: Failed - Database Name Convention
Line 1137: Failed - Database Name Convention
Line 1138: Failed - Database Name Convention
Line 1139: Failed - Database Name Convention
Line 1140: Failed - Database Name Convention
Line 1141: Failed - Database Name Convention
Line 1142: Failed - Database Name Convention
Line 1143: Failed - Database Name Convention
Line 1144: Failed - Database Name Convention
Line 1145: Failed - Database Name Convention
Line 1146: Failed - Database Name Convention
Line 1147: Failed - Database Name Convention
Line 1148: Failed - Database Name Convention
Line 1149: Failed - Database Name Convention
Line 1150: Failed - Database Name Convention
Line 1151: Failed - Database Name Convention
Line 1152: Failed - Database Name Convention
Line 1153: Failed - Database Name Convention
Line 1154: Failed - Database Name Convention
Line 1155: Failed - Database Name Convention
Line 1156: Failed - Database Name Convention
Line 1157: Failed - Database Name Convention
Line 1158: Failed - Database Name Convention
Line 1159: Failed - Database Name Convention
Line 1160: Failed - Database Name Convention
Line 1161: Failed - Database Name Convention
Line 1162: Failed - Database Name Convention
Line 1163: Failed - Database Name Convention
Line 1164: Failed - Database Name Convention
Line 1165: Failed - Database Name Convention
Line 1166: Failed - Database Name Convention
Line 1167: Failed - Database Name Convention
Line 1168: Failed - Database Name Convention
Line 1169: Failed - Database Name Convention
Line 1170: Failed - Database Name Convention
Line 1171: Failed - Database Name Convention
Line 1172: Failed - Database Name Convention
Line 1173: Failed - Database Name Convention
Line 1174: Failed - Database Name Convention
Line 1175: Failed - Database Name Convention
Line 1176: Failed - Database Name Convention
Line 1177: Failed - Database Name Convention
Line 1178: Failed - Database Name Convention
Line 1179: Failed - Database Name Convention
Line 1180: Failed - Database Name Convention
Line 1181: Failed - Database Name Convention
Line 1182: Failed - Database Name Convention
Line 4: Passed - Database Name Convention for 'MdcStandard'

-- Processing Log --
-- 10-17-2024 18:54:11 - File copied and updated with line numbers (including all lines): C:\github\giancarlorhodes\python_tsql_checker\tsql\check_MdcStandard_processed_10172024185411.sql
-- 10-17-2024 18:54:11 - Processing complete (without validation).
