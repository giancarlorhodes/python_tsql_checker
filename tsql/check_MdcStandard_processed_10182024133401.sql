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

-- Processing Log --
-- 10-18-2024 13:34:01 - File copied and updated with line numbers (including all lines): C:\github\giancarlorhodes\python_tsql_checker\tsql\check_MdcStandard_processed_10182024133401.sql
-- 10-18-2024 13:34:01 - Starting validation process...
-- 10-18-2024 13:34:01 - Line 4: Failed - Database Name Convention for 'CREATE DATABASE [MdcStandard]'
-- 10-18-2024 13:34:01 - Ending validation process...
