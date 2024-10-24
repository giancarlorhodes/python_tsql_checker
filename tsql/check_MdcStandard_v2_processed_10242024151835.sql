1  USE [master]
2  GO
3  /****** Object:  Database [MdcStandard]    Script Date: 10/23/2024 4:08:16 PM ******/
4  CREATE DATABASE [MdcStandard]
5   CONTAINMENT = NONE
6   ON  PRIMARY 
7  ( NAME = N'MdcStandard', FILENAME = N'D:\TEST\Data\MdcStandard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
8   LOG ON 
9  ( NAME = N'MdcStandard_log', FILENAME = N'E:\TEST\Logs\MdcStandard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
83  /****** Object:  UserDefinedFunction [dbo].[fnCalculateDiscountedPrice]    Script Date: 10/23/2024 4:08:16 PM ******/
84  SET ANSI_NULLS ON
85  GO
86  SET QUOTED_IDENTIFIER ON
87  GO
88  
89  CREATE   FUNCTION [dbo].[fnCalculateDiscountedPrice]
90  (
91      @parmOriginalPrice DECIMAL(10, 2),  -- Original price of the product
92      @parmDiscountPercentage DECIMAL(5, 2)  -- Discount percentage to be applied
93  )
94  RETURNS DECIMAL(10, 2)
95  AS
96  
97  --=======================================================================================
98  --					D E F I N I T I O N
99  --=======================================================================================
100  -- Author:			Giancarlo Rhodes
101  -- Create Date:		05/24/2024
102  -- Description:		
103  --					
104  -- Integration:		
105  -- Update History:  Please see comment at bottom for changelog
106  --=======================================================================================
107  
108  
109  
110  BEGIN
111      DECLARE @__DiscountedPrice DECIMAL(10, 2);
112  
113      -- Calculate the discounted price
114      SET @__DiscountedPrice = @parmOriginalPrice - (@parmOriginalPrice * @parmDiscountPercentage / 100);
115  
116      -- Return the calculated discounted price
117      RETURN @__DiscountedPrice;
118  END
119  
120  
121  --=======================================================================================
122  --				Change Log
123  --=======================================================================================
124  -- Author:			
125  -- Create Date:		
126  -- Description:		View was modified			
127  -- Integration:		
128  -- Update History:  
129  --=======================================================================================
130  
131  
132  
133  
134  GO
135  /****** Object:  Table [dbo].[tblCustomers]    Script Date: 10/23/2024 4:08:16 PM ******/
136  SET ANSI_NULLS ON
137  GO
138  SET QUOTED_IDENTIFIER ON
139  GO
140  CREATE TABLE [dbo].[tblCustomers](
141  	[CustomerID] [nchar](5) NOT NULL,
142  	[CompanyName] [nvarchar](40) NOT NULL,
143  	[ContactName] [nvarchar](30) NULL,
144  	[ContactTitle] [nvarchar](30) NULL,
145  	[Address] [nvarchar](60) NULL,
146  	[City] [nvarchar](15) NULL,
147  	[Region] [nvarchar](15) NULL,
148  	[PostalCode] [nvarchar](10) NULL,
149  	[Country] [nvarchar](15) NULL,
150  	[Phone] [nvarchar](24) NULL,
151  	[Fax] [nvarchar](24) NULL,
152   CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
153  (
154  	[CustomerID] ASC
155  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
156  ) ON [PRIMARY]
157  GO
158  /****** Object:  UserDefinedFunction [dbo].[fnGetCustomersByLocation]    Script Date: 10/23/2024 4:08:16 PM ******/
159  SET ANSI_NULLS ON
160  GO
161  SET QUOTED_IDENTIFIER ON
162  GO
163  
164  CREATE  
165  	
166  FUNCTION [dbo].[fnGetCustomersByLocation] (
167  	@parmCity NVARCHAR(100) = NULL, -- Optional input parameter for city
168  	@parmCountry NVARCHAR(100) = NULL -- Optional input parameter for country
169  	)
170  RETURNS TABLE
171  AS
172  --=======================================================================================
173  --					D E F I N I T I O N
174  --=======================================================================================
175  -- Author:			Giancarlo Rhodes
176  -- Create Date:		05/24/2024
177  -- Description:		
178  --					
179  -- Integration:		
180  -- Update History:  Please see comment at bottom for changelog
181  --=======================================================================================
182  RETURN (
183  		SELECT CustomerID,
184  			CompanyName,
185  			ContactName,
186  			ContactTitle,
187  			Address,
188  			City,
189  			Region,
190  			PostalCode,
191  			Country,
192  			Phone,
193  			Fax
194  		FROM dbo.tblCustomers
195  		WHERE (
196  				@parmCity IS NULL
197  				OR City = @parmCity
198  				)
199  			AND (
200  				@parmCountry IS NULL
201  				OR Country = @parmCountry
202  				)
203  		);
204  --=======================================================================================
205  --				Change Log
206  --=======================================================================================
207  -- Author:			
208  -- Create Date:		
209  -- Description:		View was modified			
210  -- Integration:		
211  -- Update History:  
212  --=======================================================================================
213  GO
214  /****** Object:  Table [dbo].[tblkSuppliers]    Script Date: 10/23/2024 4:08:16 PM ******/
215  SET ANSI_NULLS ON
216  GO
217  SET QUOTED_IDENTIFIER ON
218  GO
219  CREATE TABLE [dbo].[tblkSuppliers](
220  	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
221  	[CompanyName] [nvarchar](40) NOT NULL,
222  	[ContactName] [nvarchar](30) NULL,
223  	[ContactTitle] [nvarchar](30) NULL,
224  	[Address] [nvarchar](60) NULL,
225  	[City] [nvarchar](15) NULL,
226  	[Region] [nvarchar](15) NULL,
227  	[PostalCode] [nvarchar](10) NULL,
228  	[Country] [nvarchar](15) NULL,
229  	[Phone] [nvarchar](24) NULL,
230  	[Fax] [nvarchar](24) NULL,
231  	[HomePage] [ntext] NULL,
232   CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
233  (
234  	[SupplierID] ASC
235  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
236  ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
237  GO
238  /****** Object:  View [dbo].[vwCustomerAndSuppliersByCity]    Script Date: 10/23/2024 4:08:16 PM ******/
239  SET ANSI_NULLS ON
240  GO
241  SET QUOTED_IDENTIFIER ON
242  GO
243  
244  CREATE
245  	
246  
247   VIEW [dbo].[vwCustomerAndSuppliersByCity]
248  AS
249  --=======================================================================================
250  --					D E F I N I T I O N
251  --=======================================================================================
252  -- Author:			Giancarlo Rhodes
253  -- Create Date:		05/24/2024
254  -- Description:		
255  --					
256  -- Integration:		
257  -- Update History:  Please see comment at bottom for changelog
258  --=======================================================================================
259  SELECT City,
260  	CompanyName,
261  	ContactName,
262  	'Customers' AS Relationship
263  FROM tblCustomers
264  
265  UNION
266  
267  SELECT City,
268  	CompanyName,
269  	ContactName,
270  	'Suppliers'
271  FROM tblkSuppliers 
272  	
273  	--=======================================================================================
274  	--				Change Log
275  	--=======================================================================================
276  	-- Author:			
277  	-- Create Date:		
278  	-- Description:		View was modified			
279  	-- Integration:		
280  	-- Update History:  
281  	--=======================================================================================
282  GO
283  /****** Object:  Table [dbo].[tblkProducts]    Script Date: 10/23/2024 4:08:16 PM ******/
284  SET ANSI_NULLS ON
285  GO
286  SET QUOTED_IDENTIFIER ON
287  GO
288  CREATE TABLE [dbo].[tblkProducts](
289  	[ProductID] [int] IDENTITY(1,1) NOT NULL,
290  	[ProductName] [nvarchar](40) NOT NULL,
291  	[SupplierID] [int] NULL,
292  	[CategoryID] [int] NULL,
293  	[QuantityPerUnit] [nvarchar](20) NULL,
294  	[UnitPrice] [money] NULL,
295  	[UnitsInStock] [smallint] NULL,
296  	[UnitsOnOrder] [smallint] NULL,
297  	[ReorderLevel] [smallint] NULL,
298  	[Discontinued] [bit] NOT NULL,
299   CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
300  (
301  	[ProductID] ASC
302  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
303  ) ON [PRIMARY]
304  GO
305  /****** Object:  View [dbo].[vwCurrentProductList]    Script Date: 10/23/2024 4:08:16 PM ******/
306  SET ANSI_NULLS ON
307  GO
308  SET QUOTED_IDENTIFIER ON
309  GO
310  
311  CREATE
312  	
313  
314   VIEW [dbo].[vwCurrentProductList]
315  AS
316  --=======================================================================================
317  --					D E F I N I T I O N
318  --=======================================================================================
319  -- Author:			Giancarlo Rhodes
320  -- Create Date:		05/24/2024
321  -- Description:		
322  --					
323  -- Integration:		
324  -- Update History:  Please see comment at bottom for changelog
325  --=======================================================================================
326  
327  
328  SELECT p.ProductID,
329  	p.ProductName
330  FROM tblkProducts p
331  WHERE (((p.Discontinued) = 0))
332  
333  
334  --=======================================================================================
335  --				Change Log
336  --=======================================================================================
337  -- Author:			
338  -- Create Date:		
339  -- Description:		View was modified			
340  -- Integration:		
341  -- Update History:  
342  --=======================================================================================
343  
344  
345  GO
346  /****** Object:  Table [dbo].[tblOrders]    Script Date: 10/23/2024 4:08:16 PM ******/
347  SET ANSI_NULLS ON
348  GO
349  SET QUOTED_IDENTIFIER ON
350  GO
351  CREATE TABLE [dbo].[tblOrders](
352  	[OrderID] [int] IDENTITY(1,1) NOT NULL,
353  	[CustomerID] [nchar](5) NULL,
354  	[EmployeeID] [int] NULL,
355  	[OrderDate] [datetime] NULL,
356  	[RequiredDate] [datetime] NULL,
357  	[ShippedDate] [datetime] NULL,
358  	[ShipVia] [int] NULL,
359  	[Freight] [money] NULL,
360  	[ShipName] [nvarchar](40) NULL,
361  	[ShipAddress] [nvarchar](60) NULL,
362  	[ShipCity] [nvarchar](15) NULL,
363  	[ShipRegion] [nvarchar](15) NULL,
364  	[ShipPostalCode] [nvarchar](10) NULL,
365  	[ShipCountry] [nvarchar](15) NULL,
366   CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
367  (
368  	[OrderID] ASC
369  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
370  ) ON [PRIMARY]
371  GO
372  /****** Object:  View [dbo].[vwOrdersQry]    Script Date: 10/23/2024 4:08:16 PM ******/
373  SET ANSI_NULLS ON
374  GO
375  SET QUOTED_IDENTIFIER ON
376  GO
377  
378  CREATE   VIEW [dbo].[vwOrdersQry]
379  AS
380  --=======================================================================================
381  --					D E F I N I T I O N
382  --=======================================================================================
383  -- Author:			Giancarlo Rhodes
384  -- Create Date:		05/24/2024
385  -- Description:		
386  --					
387  -- Integration:		
388  -- Update History:  Please see comment at bottom for changelog
389  --=======================================================================================
390  SELECT o.OrderID,
391  	o.CustomerID,
392  	o.EmployeeID,
393  	o.OrderDate,
394  	o.RequiredDate,
395  	o.ShippedDate,
396  	o.ShipVia,
397  	o.Freight,
398  	o.ShipName,
399  	o.ShipAddress,
400  	o.ShipCity,
401  	o.ShipRegion,
402  	o.ShipPostalCode,
403  	o.ShipCountry,
404  	c.CompanyName,
405  	c.Address,
406  	c.City,
407  	c.Region,
408  	c.PostalCode,
409  	c.Country
410  FROM tblCustomers c
411  INNER JOIN tblOrders o ON c.CustomerID = o.CustomerID
412  	--=======================================================================================
413  	--				Change Log
414  	--=======================================================================================
415  	-- Author:			
416  	-- Create Date:		
417  	-- Description:		View was modified			
418  	-- Integration:		
419  	-- Update History:  
420  	--=======================================================================================
421  GO
422  /****** Object:  View [dbo].[vwProductsAboveAveragePrice]    Script Date: 10/23/2024 4:08:16 PM ******/
423  SET ANSI_NULLS ON
424  GO
425  SET QUOTED_IDENTIFIER ON
426  GO
427  
428  
429  CREATE   view [dbo].[vwProductsAboveAveragePrice] 
430  AS
431  --=======================================================================================
432  --					D E F I N I T I O N
433  --=======================================================================================
434  -- Author:			Giancarlo Rhodes
435  -- Create Date:		05/24/2024
436  -- Description:		
437  --					
438  -- Integration:		
439  -- Update History:  Please see comment at bottom for changelog
440  --=======================================================================================
441  
442  SELECT p.ProductName, p.UnitPrice
443  FROM tblkProducts p 
444  WHERE p.UnitPrice>(SELECT AVG(UnitPrice) From tblkProducts)
445  
446  
447  
448  --=======================================================================================
449  --				Change Log
450  --=======================================================================================
451  -- Author:			
452  -- Create Date:		
453  -- Description:		View was modified			
454  -- Integration:		
455  -- Update History:  
456  --=======================================================================================
457  
458  
459  
460  
461  GO
462  /****** Object:  Table [dbo].[tblCategories]    Script Date: 10/23/2024 4:08:16 PM ******/
463  SET ANSI_NULLS ON
464  GO
465  SET QUOTED_IDENTIFIER ON
466  GO
467  CREATE TABLE [dbo].[tblCategories](
468  	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
469  	[CategoryName] [nvarchar](15) NOT NULL,
470  	[Description] [ntext] NULL,
471  	[Picture] [image] NULL,
472   CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
473  (
474  	[CategoryID] ASC
475  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
476  ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
477  GO
478  /****** Object:  View [dbo].[vwProductsByCategory]    Script Date: 10/23/2024 4:08:16 PM ******/
479  SET ANSI_NULLS ON
480  GO
481  SET QUOTED_IDENTIFIER ON
482  GO
483  
484  CREATE
485  	
486  
487   VIEW [dbo].[vwProductsByCategory]
488  AS
489  
490  --=======================================================================================
491  --					D E F I N I T I O N
492  --=======================================================================================
493  -- Author:			Giancarlo Rhodes
494  -- Create Date:		05/24/2024
495  -- Description:		
496  --					
497  -- Integration:		
498  -- Update History:  Please see comment at bottom for changelog
499  --=======================================================================================
500  
501  SELECT c.CategoryName,
502  	p.ProductName,
503  	p.QuantityPerUnit,
504  	p.UnitsInStock,
505  	p.Discontinued
506  FROM tblCategories c
507  INNER JOIN tblkProducts p ON c.CategoryID = p.CategoryID
508  WHERE p.Discontinued <> 1
509  
510  
511  --=======================================================================================
512  --				Change Log
513  --=======================================================================================
514  -- Author:			
515  -- Create Date:		
516  -- Description:		View was modified			
517  -- Integration:		
518  -- Update History:  
519  --=======================================================================================
520  
521  
522  GO
523  /****** Object:  View [dbo].[vwQuarterlyOrders]    Script Date: 10/23/2024 4:08:16 PM ******/
524  SET ANSI_NULLS ON
525  GO
526  SET QUOTED_IDENTIFIER ON
527  GO
528  
529  CREATE
530  	
531  
532   VIEW [dbo].[vwQuarterlyOrders]
533  AS
534  --=======================================================================================
535  --					D E F I N I T I O N
536  --=======================================================================================
537  -- Author:			Giancarlo Rhodes
538  -- Create Date:		05/24/2024
539  -- Description:		
540  --					
541  -- Integration:		
542  -- Update History:  Please see comment at bottom for changelog
543  --=======================================================================================
544  
545  
546  SELECT DISTINCT 
547  	c.CustomerID,
548  	c.CompanyName,
549  	c.City,
550  	c.Country
551  FROM tblCustomers c
552  RIGHT JOIN tblOrders o ON c.CustomerID = o.CustomerID
553  WHERE o.OrderDate BETWEEN '19970101'
554  		AND '19971231'
555  
556  
557  --=======================================================================================
558  --				Change Log
559  --=======================================================================================
560  -- Author:			
561  -- Create Date:		
562  -- Description:		View was modified			
563  -- Integration:		
564  -- Update History:  
565  --=======================================================================================
566  
567  
568  
569  GO
570  /****** Object:  Table [dbo].[tblEmployees]    Script Date: 10/23/2024 4:08:16 PM ******/
571  SET ANSI_NULLS ON
572  GO
573  SET QUOTED_IDENTIFIER ON
574  GO
575  CREATE TABLE [dbo].[tblEmployees](
576  	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
577  	[LastName] [nvarchar](20) NOT NULL,
578  	[FirstName] [nvarchar](25) NOT NULL,
579  	[Title] [nvarchar](30) NULL,
580  	[TitleOfCourtesy] [nvarchar](25) NULL,
581  	[BirthDate] [datetime] NULL,
582  	[HireDate] [datetime] NULL,
583  	[Address] [nvarchar](60) NULL,
584  	[City] [nvarchar](15) NULL,
585  	[Region] [nvarchar](15) NULL,
586  	[PostalCode] [nvarchar](10) NULL,
587  	[Country] [nvarchar](15) NULL,
588  	[HomePhone] [nvarchar](24) NULL,
589  	[Extension] [nvarchar](4) NULL,
590  	[Photo] [image] NULL,
591  	[Notes] [ntext] NULL,
592  	[ReportsTo] [int] NULL,
593  	[PhotoPath] [nvarchar](255) NULL,
594   CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
595  (
596  	[EmployeeID] ASC
597  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
598  ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
599  GO
600  /****** Object:  Table [dbo].[tblkShippers]    Script Date: 10/23/2024 4:08:16 PM ******/
601  SET ANSI_NULLS ON
602  GO
603  SET QUOTED_IDENTIFIER ON
604  GO
605  CREATE TABLE [dbo].[tblkShippers](
606  	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
607  	[CompanyName] [nvarchar](40) NOT NULL,
608  	[Phone] [nvarchar](24) NULL,
609   CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
610  (
611  	[ShipperID] ASC
612  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
613  ) ON [PRIMARY]
614  GO
615  /****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 10/23/2024 4:08:16 PM ******/
616  SET ANSI_NULLS ON
617  GO
618  SET QUOTED_IDENTIFIER ON
619  GO
620  CREATE TABLE [dbo].[tblOrderDetails](
621  	[OrderID] [int] NOT NULL,
622  	[ProductID] [int] NOT NULL,
623  	[UnitPrice] [money] NOT NULL,
624  	[Quantity] [smallint] NOT NULL,
625  	[Discount] [real] NOT NULL,
626   CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
627  (
628  	[OrderID] ASC,
629  	[ProductID] ASC
630  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
631  ) ON [PRIMARY]
632  GO
633  /****** Object:  View [dbo].[vwInvoices]    Script Date: 10/23/2024 4:08:16 PM ******/
634  SET ANSI_NULLS ON
635  GO
636  SET QUOTED_IDENTIFIER ON
637  GO
638  
639  
640  CREATE   view [dbo].[vwInvoices] AS
641  
642  
643  --=======================================================================================
644  --					D E F I N I T I O N
645  --=======================================================================================
646  -- Author:			Giancarlo Rhodes
647  -- Create Date:		05/24/2024
648  -- Description:		
649  --					
650  -- Integration:		
651  -- Update History:  Please see comment at bottom for changelog
652  --=======================================================================================
653  
654  
655  
656  SELECT tblOrders.ShipName, tblOrders.ShipAddress, tblOrders.ShipCity, tblOrders.ShipRegion, tblOrders.ShipPostalCode, 
657  	tblOrders.ShipCountry, tblOrders.CustomerID, tblCustomers.CompanyName AS CustomerName, tblCustomers.Address, tblCustomers.City, 
658  	tblCustomers.Region, tblCustomers.PostalCode, tblCustomers.Country, 
659  	(FirstName + ' ' + LastName) AS Salesperson, 
660  	tblOrders.OrderID, tblOrders.OrderDate, tblOrders.RequiredDate, tblOrders.ShippedDate, tblkShippers.CompanyName As ShipperName, 
661  	"tblOrderDetails".ProductID, tblkProducts.ProductName, "tblOrderDetails".UnitPrice, "tblOrderDetails".Quantity, 
662  	"tblOrderDetails".Discount, 
663  	(CONVERT(money,("tblOrderDetails".UnitPrice*Quantity*(1-Discount)/100))*100) AS ExtendedPrice, tblOrders.Freight
664  FROM 	tblkShippers INNER JOIN 
665  		(tblkProducts INNER JOIN 
666  			(
667  				(tblEmployees INNER JOIN 
668  					(tblCustomers INNER JOIN tblOrders ON tblCustomers.CustomerID = tblOrders.CustomerID) 
669  				ON tblEmployees.EmployeeID = tblOrders.EmployeeID) 
670  			INNER JOIN "tblOrderDetails" ON tblOrders.OrderID = "tblOrderDetails".OrderID) 
671  		ON tblkProducts.ProductID = "tblOrderDetails".ProductID) 
672  	ON tblkShippers.ShipperID = tblOrders.ShipVia
673  
674  
675  	
676  --=======================================================================================
677  --				Change Log
678  --=======================================================================================
679  -- Author:			
680  -- Create Date:		
681  -- Description:		View was modified			
682  -- Integration:		
683  -- Update History:  
684  --=======================================================================================
685  
686  
687  
688  
689  GO
690  /****** Object:  View [dbo].[vwOrderDetailsExtended]    Script Date: 10/23/2024 4:08:16 PM ******/
691  SET ANSI_NULLS ON
692  GO
693  SET QUOTED_IDENTIFIER ON
694  GO
695  
696  CREATE
697  	
698  
699   VIEW [dbo].[vwOrderDetailsExtended]
700  AS
701  --=======================================================================================
702  --					D E F I N I T I O N
703  --=======================================================================================
704  -- Author:			Giancarlo Rhodes
705  -- Create Date:		05/24/2024
706  -- Description:		
707  --					
708  -- Integration:		
709  -- Update History:  Please see comment at bottom for changelog
710  --=======================================================================================
711  SELECT tblOrderDetails.OrderID,
712  	tblOrderDetails.ProductID,
713  	tblkProducts.ProductName,
714  	tblOrderDetails.UnitPrice,
715  	tblOrderDetails.Quantity,
716  	tblOrderDetails.Discount,
717  	(CONVERT(MONEY, (tblOrderDetails.UnitPrice * Quantity * (1 - Discount) / 100)) * 100) AS ExtendedPrice
718  FROM tblkProducts
719  INNER JOIN tblOrderDetails ON tblkProducts.ProductID = tblOrderDetails.ProductID
720  	--=======================================================================================
721  	--				Change Log
722  	--=======================================================================================
723  	-- Author:			
724  	-- Create Date:		
725  	-- Description:		View was modified			
726  	-- Integration:		
727  	-- Update History:  
728  	--=======================================================================================
729  GO
730  /****** Object:  View [dbo].[vwOrderSubtotals]    Script Date: 10/23/2024 4:08:16 PM ******/
731  SET ANSI_NULLS ON
732  GO
733  SET QUOTED_IDENTIFIER ON
734  GO
735  
736  CREATE
737  	
738  
739   VIEW [dbo].[vwOrderSubtotals]
740  AS
741  
742  
743  --=======================================================================================
744  --					D E F I N I T I O N
745  --=======================================================================================
746  -- Author:			Giancarlo Rhodes
747  -- Create Date:		05/24/2024
748  -- Description:		
749  --					
750  -- Integration:		
751  -- Update History:  Please see comment at bottom for changelog
752  --=======================================================================================
753  
754  
755  SELECT tblOrderDetails.OrderID,
756  	Sum(CONVERT(MONEY, (tblOrderDetails.UnitPrice * Quantity * (1 - Discount) / 100)) * 100) AS Subtotal
757  FROM tblOrderDetails
758  GROUP BY tblOrderDetails.OrderID
759  
760  
761  --=======================================================================================
762  --				Change Log
763  --=======================================================================================
764  -- Author:			
765  -- Create Date:		
766  -- Description:		View was modified			
767  -- Integration:		
768  -- Update History:  
769  --=======================================================================================
770  
771  
772  
773  GO
774  /****** Object:  View [dbo].[vwProductSalesFor1997]    Script Date: 10/23/2024 4:08:16 PM ******/
775  SET ANSI_NULLS ON
776  GO
777  SET QUOTED_IDENTIFIER ON
778  GO
779  
780  
781  
782  CREATE     view [dbo].[vwProductSalesFor1997] 
783  AS
784  
785  --=======================================================================================
786  --					D E F I N I T I O N
787  --=======================================================================================
788  -- Author:			Giancarlo Rhodes
789  -- Create Date:		05/24/2024
790  -- Description:		
791  --					
792  -- Integration:		
793  -- Update History:  Please see comment at bottom for changelog
794  --=======================================================================================
795  
796  
797  SELECT ca.CategoryName, p.ProductName, 
798  Sum(CONVERT(money,(od.UnitPrice*Quantity*(1-Discount)/100))*100) AS ProductSales
799  FROM (tblCategories ca INNER JOIN tblkProducts p ON ca.CategoryID = p.CategoryID) 
800  	INNER JOIN (tblOrders o 
801  		INNER JOIN tblOrderDetails od ON o.OrderID = od.OrderID) 
802  	ON p.ProductID = od.ProductID
803  WHERE (((o.ShippedDate) Between '19970101' And '19971231'))
804  GROUP BY ca.CategoryName, p.ProductName
805  
806  
807  --=======================================================================================
808  --				Change Log
809  --=======================================================================================
810  -- Author:			
811  -- Create Date:		
812  -- Description:		View was modified			
813  -- Integration:		
814  -- Update History:  
815  --=======================================================================================
816  
817  GO
818  /****** Object:  View [dbo].[vwSalesByCategory]    Script Date: 10/23/2024 4:08:16 PM ******/
819  SET ANSI_NULLS ON
820  GO
821  SET QUOTED_IDENTIFIER ON
822  GO
823  
824  
825  CREATE  
826  	
827  
828   VIEW [dbo].[vwSalesByCategory]
829  AS
830  --=======================================================================================
831  --					D E F I N I T I O N
832  --=======================================================================================
833  -- Author:			Giancarlo Rhodes
834  -- Create Date:		05/24/2024
835  -- Description:		
836  --					
837  -- Integration:		
838  -- Update History:  Please see comment at bottom for changelog
839  --=======================================================================================
840  
841  SELECT c.CategoryID,
842  	c.CategoryName,
843  	p.ProductName,
844  	Sum(vode.ExtendedPrice) AS ProductSales
845  FROM tblCategories c
846  INNER JOIN (
847  	tblkProducts p  INNER JOIN (
848  		tblOrders o INNER JOIN vwOrderDetailsExtended vode ON o.OrderID = vode.OrderID
849  		) ON p.ProductID = vode.ProductID
850  	) ON c.CategoryID = p.CategoryID
851  WHERE o.OrderDate BETWEEN '19970101'
852  		AND '19971231'
853  GROUP BY c.CategoryID,
854  	c.CategoryName,
855  	p.ProductName
856  
857  
858  --=======================================================================================
859  --				Change Log
860  --=======================================================================================
861  -- Author:			
862  -- Create Date:		
863  -- Description:		View was modified			
864  -- Integration:		
865  -- Update History:  
866  --=======================================================================================
867  
868  
869  GO
870  /****** Object:  View [dbo].[vwSalesTotalByAmount]    Script Date: 10/23/2024 4:08:16 PM ******/
871  SET ANSI_NULLS ON
872  GO
873  SET QUOTED_IDENTIFIER ON
874  GO
875  
876  
877  CREATE      VIEW [dbo].[vwSalesTotalByAmount]
878  AS
879  
880  --=======================================================================================
881  --					D E F I N I T I O N
882  --=======================================================================================
883  -- Author:			Giancarlo Rhodes
884  -- Create Date:		05/24/2024
885  -- Description:		
886  --					
887  -- Integration:		
888  -- Update History:  Please see comment at bottom for changelog
889  --=======================================================================================
890  
891  SELECT vos.Subtotal AS SaleAmount,
892  	o.OrderID,
893  	c.CompanyName,
894  	o.ShippedDate
895  FROM tblCustomers c
896  INNER JOIN (
897  	tblOrders o INNER JOIN vwOrderSubtotals vos ON o.OrderID = vos.OrderID
898  	) ON c.CustomerID = o.CustomerID
899  WHERE (vos.Subtotal > 2500)
900  	AND (
901  		o.ShippedDate BETWEEN '19970101'
902  			AND '19971231'
903  		)
904  
905  --=======================================================================================
906  --				Change Log
907  --=======================================================================================
908  -- Author:			
909  -- Create Date:		
910  -- Description:		View was modified			
911  -- Integration:		
912  -- Update History:  
913  --=======================================================================================
914  
915  
916  
917  
918  GO
919  /****** Object:  View [dbo].[vwSummaryOfSalesByQuarter]    Script Date: 10/23/2024 4:08:16 PM ******/
920  SET ANSI_NULLS ON
921  GO
922  SET QUOTED_IDENTIFIER ON
923  GO
924  
925  CREATE
926  	
927  
928   VIEW [dbo].[vwSummaryOfSalesByQuarter]
929  AS
930  --=======================================================================================
931  --					D E F I N I T I O N
932  --=======================================================================================
933  -- Author:			Giancarlo Rhodes
934  -- Create Date:		05/24/2024
935  -- Description:		
936  --					
937  -- Integration:		
938  -- Update History:  Please see comment at bottom for changelog
939  --=======================================================================================
940  SELECT o.ShippedDate,
941  	o.OrderID,
942  	vos.Subtotal
943  FROM tblOrders o
944  INNER JOIN vwOrderSubtotals vos ON o.OrderID = vos.OrderID
945  WHERE o.ShippedDate IS NOT NULL
946  	--=======================================================================================
947  	--				Change Log
948  	--=======================================================================================
949  	-- Author:			
950  	-- Create Date:		
951  	-- Description:		View was modified			
952  	-- Integration:		
953  	-- Update History:  
954  	--=======================================================================================
955  GO
956  /****** Object:  View [dbo].[vwSummaryOfSalesByYear]    Script Date: 10/23/2024 4:08:16 PM ******/
957  SET ANSI_NULLS ON
958  GO
959  SET QUOTED_IDENTIFIER ON
960  GO
961  
962  
963  CREATE  
964  
965  	
966  
967   VIEW [dbo].[vwSummaryOfSalesByYear]
968  AS
969  
970  --=======================================================================================
971  --					D E F I N I T I O N
972  --=======================================================================================
973  -- Author:			Giancarlo Rhodes
974  -- Create Date:		05/24/2024
975  -- Description:		
976  --					
977  -- Integration:		
978  -- Update History:  Please see comment at bottom for changelog
979  --=======================================================================================
980  
981  SELECT o.ShippedDate,
982  	o.OrderID,
983  	vos.Subtotal
984  FROM tblOrders o
985  INNER JOIN vwOrderSubtotals vos ON o.OrderID = vos.OrderID
986  WHERE o.ShippedDate IS NOT NULL
987  	
988  --=======================================================================================
989  --				Change Log
990  --=======================================================================================
991  -- Author:			
992  -- Create Date:		
993  -- Description:		View was modified			
994  -- Integration:		
995  -- Update History:  
996  --=======================================================================================
997  
998  GO
999  /****** Object:  Table [dbo].[tblCustomerCustomerDemo]    Script Date: 10/23/2024 4:08:16 PM ******/
1000  SET ANSI_NULLS ON
1001  GO
1002  SET QUOTED_IDENTIFIER ON
1003  GO
1004  CREATE TABLE [dbo].[tblCustomerCustomerDemo](
1005  	[CustomerID] [nchar](5) NOT NULL,
1006  	[CustomerTypeID] [nchar](10) NOT NULL,
1007   CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY NONCLUSTERED 
1008  (
1009  	[CustomerID] ASC,
1010  	[CustomerTypeID] ASC
1011  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1012  ) ON [PRIMARY]
1013  GO
1014  /****** Object:  Table [dbo].[tblCustomerDemographics]    Script Date: 10/23/2024 4:08:16 PM ******/
1015  SET ANSI_NULLS ON
1016  GO
1017  SET QUOTED_IDENTIFIER ON
1018  GO
1019  CREATE TABLE [dbo].[tblCustomerDemographics](
1020  	[CustomerTypeID] [nchar](10) NOT NULL,
1021  	[CustomerDesc] [ntext] NULL,
1022   CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY NONCLUSTERED 
1023  (
1024  	[CustomerTypeID] ASC
1025  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1026  ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
1027  GO
1028  /****** Object:  Table [dbo].[tblCustomersAuditHistory]    Script Date: 10/23/2024 4:08:16 PM ******/
1029  SET ANSI_NULLS ON
1030  GO
1031  SET QUOTED_IDENTIFIER ON
1032  GO
1033  CREATE TABLE [dbo].[tblCustomersAuditHistory](
1034  	[CustomerID] [nchar](5) NOT NULL,
1035  	[CompanyName] [nvarchar](40) NOT NULL,
1036  	[ContactName] [nvarchar](30) NULL,
1037  	[ContactTitle] [nvarchar](30) NULL,
1038  	[Address] [nvarchar](60) NULL,
1039  	[City] [nvarchar](15) NULL,
1040  	[Region] [nvarchar](15) NULL,
1041  	[PostalCode] [nvarchar](10) NULL,
1042  	[Country] [nvarchar](15) NULL,
1043  	[Phone] [nvarchar](24) NULL,
1044  	[Fax] [nvarchar](24) NULL,
1045  	[Action] [nvarchar](24) NULL,
1046  	[ActionDateTime] [datetime] NULL
1047  ) ON [PRIMARY]
1048  GO
1049  /****** Object:  Table [dbo].[tblEmployeeTerritories]    Script Date: 10/23/2024 4:08:16 PM ******/
1050  SET ANSI_NULLS ON
1051  GO
1052  SET QUOTED_IDENTIFIER ON
1053  GO
1054  CREATE TABLE [dbo].[tblEmployeeTerritories](
1055  	[EmployeeID] [int] NOT NULL,
1056  	[TerritoryID] [nvarchar](20) NOT NULL,
1057   CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY NONCLUSTERED 
1058  (
1059  	[EmployeeID] ASC,
1060  	[TerritoryID] ASC
1061  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1062  ) ON [PRIMARY]
1063  GO
1064  /****** Object:  Table [dbo].[tblkRegion]    Script Date: 10/23/2024 4:08:16 PM ******/
1065  SET ANSI_NULLS ON
1066  GO
1067  SET QUOTED_IDENTIFIER ON
1068  GO
1069  CREATE TABLE [dbo].[tblkRegion](
1070  	[RegionID] [int] NOT NULL,
1071  	[RegionDescription] [nchar](50) NOT NULL,
1072   CONSTRAINT [PK_Region] PRIMARY KEY NONCLUSTERED 
1073  (
1074  	[RegionID] ASC
1075  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1076  ) ON [PRIMARY]
1077  GO
1078  /****** Object:  Table [dbo].[tblkTerritories]    Script Date: 10/23/2024 4:08:16 PM ******/
1079  SET ANSI_NULLS ON
1080  GO
1081  SET QUOTED_IDENTIFIER ON
1082  GO
1083  CREATE TABLE [dbo].[tblkTerritories](
1084  	[TerritoryID] [nvarchar](20) NOT NULL,
1085  	[TerritoryDescription] [nchar](50) NOT NULL,
1086  	[RegionID] [int] NOT NULL,
1087   CONSTRAINT [PK_Territories] PRIMARY KEY NONCLUSTERED 
1088  (
1089  	[TerritoryID] ASC
1090  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1091  ) ON [PRIMARY]
1092  GO
1093  SET ANSI_PADDING ON
1094  GO
1095  /****** Object:  Index [CategoryName]    Script Date: 10/23/2024 4:08:16 PM ******/
1096  CREATE NONCLUSTERED INDEX [CategoryName] ON [dbo].[tblCategories]
1097  (
1098  	[CategoryName] ASC
1099  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1100  GO
1101  SET ANSI_PADDING ON
1102  GO
1103  /****** Object:  Index [City]    Script Date: 10/23/2024 4:08:16 PM ******/
1104  CREATE NONCLUSTERED INDEX [City] ON [dbo].[tblCustomers]
1105  (
1106  	[City] ASC
1107  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1108  GO
1109  SET ANSI_PADDING ON
1110  GO
1111  /****** Object:  Index [CompanyName]    Script Date: 10/23/2024 4:08:16 PM ******/
1112  CREATE NONCLUSTERED INDEX [CompanyName] ON [dbo].[tblCustomers]
1113  (
1114  	[CompanyName] ASC
1115  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1116  GO
1117  SET ANSI_PADDING ON
1118  GO
1119  /****** Object:  Index [PostalCode]    Script Date: 10/23/2024 4:08:16 PM ******/
1120  CREATE NONCLUSTERED INDEX [PostalCode] ON [dbo].[tblCustomers]
1121  (
1122  	[PostalCode] ASC
1123  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1124  GO
1125  SET ANSI_PADDING ON
1126  GO
1127  /****** Object:  Index [Region]    Script Date: 10/23/2024 4:08:16 PM ******/
1128  CREATE NONCLUSTERED INDEX [Region] ON [dbo].[tblCustomers]
1129  (
1130  	[Region] ASC
1131  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1132  GO
1133  SET ANSI_PADDING ON
1134  GO
1135  /****** Object:  Index [NDX_LastName]    Script Date: 10/23/2024 4:08:16 PM ******/
1136  CREATE NONCLUSTERED INDEX [NDX_LastName] ON [dbo].[tblEmployees]
1137  (
1138  	[LastName] ASC
1139  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1140  GO
1141  SET ANSI_PADDING ON
1142  GO
1143  /****** Object:  Index [NDX_PostalCode]    Script Date: 10/23/2024 4:08:16 PM ******/
1144  CREATE NONCLUSTERED INDEX [NDX_PostalCode] ON [dbo].[tblEmployees]
1145  (
1146  	[PostalCode] ASC
1147  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1148  GO
1149  /****** Object:  Index [CategoriesProducts]    Script Date: 10/23/2024 4:08:16 PM ******/
1150  CREATE NONCLUSTERED INDEX [CategoriesProducts] ON [dbo].[tblkProducts]
1151  (
1152  	[CategoryID] ASC
1153  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1154  GO
1155  /****** Object:  Index [CategoryID]    Script Date: 10/23/2024 4:08:16 PM ******/
1156  CREATE NONCLUSTERED INDEX [CategoryID] ON [dbo].[tblkProducts]
1157  (
1158  	[CategoryID] ASC
1159  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1160  GO
1161  SET ANSI_PADDING ON
1162  GO
1163  /****** Object:  Index [ProductName]    Script Date: 10/23/2024 4:08:16 PM ******/
1164  CREATE NONCLUSTERED INDEX [ProductName] ON [dbo].[tblkProducts]
1165  (
1166  	[ProductName] ASC
1167  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1168  GO
1169  /****** Object:  Index [SupplierID]    Script Date: 10/23/2024 4:08:16 PM ******/
1170  CREATE NONCLUSTERED INDEX [SupplierID] ON [dbo].[tblkProducts]
1171  (
1172  	[SupplierID] ASC
1173  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1174  GO
1175  /****** Object:  Index [SuppliersProducts]    Script Date: 10/23/2024 4:08:16 PM ******/
1176  CREATE NONCLUSTERED INDEX [SuppliersProducts] ON [dbo].[tblkProducts]
1177  (
1178  	[SupplierID] ASC
1179  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1180  GO
1181  SET ANSI_PADDING ON
1182  GO
1183  /****** Object:  Index [CompanyName]    Script Date: 10/23/2024 4:08:16 PM ******/
1184  CREATE NONCLUSTERED INDEX [CompanyName] ON [dbo].[tblkSuppliers]
1185  (
1186  	[CompanyName] ASC
1187  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1188  GO
1189  SET ANSI_PADDING ON
1190  GO
1191  /****** Object:  Index [PostalCode]    Script Date: 10/23/2024 4:08:16 PM ******/
1192  CREATE NONCLUSTERED INDEX [PostalCode] ON [dbo].[tblkSuppliers]
1193  (
1194  	[PostalCode] ASC
1195  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1196  GO
1197  /****** Object:  Index [OrderID]    Script Date: 10/23/2024 4:08:16 PM ******/
1198  CREATE NONCLUSTERED INDEX [OrderID] ON [dbo].[tblOrderDetails]
1199  (
1200  	[OrderID] ASC
1201  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1202  GO
1203  /****** Object:  Index [OrdersOrder_Details]    Script Date: 10/23/2024 4:08:16 PM ******/
1204  CREATE NONCLUSTERED INDEX [OrdersOrder_Details] ON [dbo].[tblOrderDetails]
1205  (
1206  	[OrderID] ASC
1207  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1208  GO
1209  /****** Object:  Index [ProductID]    Script Date: 10/23/2024 4:08:16 PM ******/
1210  CREATE NONCLUSTERED INDEX [ProductID] ON [dbo].[tblOrderDetails]
1211  (
1212  	[ProductID] ASC
1213  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1214  GO
1215  /****** Object:  Index [ProductsOrder_Details]    Script Date: 10/23/2024 4:08:16 PM ******/
1216  CREATE NONCLUSTERED INDEX [ProductsOrder_Details] ON [dbo].[tblOrderDetails]
1217  (
1218  	[ProductID] ASC
1219  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1220  GO
1221  SET ANSI_PADDING ON
1222  GO
1223  /****** Object:  Index [CustomerID]    Script Date: 10/23/2024 4:08:16 PM ******/
1224  CREATE NONCLUSTERED INDEX [CustomerID] ON [dbo].[tblOrders]
1225  (
1226  	[CustomerID] ASC
1227  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1228  GO
1229  SET ANSI_PADDING ON
1230  GO
1231  /****** Object:  Index [CustomersOrders]    Script Date: 10/23/2024 4:08:16 PM ******/
1232  CREATE NONCLUSTERED INDEX [CustomersOrders] ON [dbo].[tblOrders]
1233  (
1234  	[CustomerID] ASC
1235  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1236  GO
1237  /****** Object:  Index [EmployeeID]    Script Date: 10/23/2024 4:08:16 PM ******/
1238  CREATE NONCLUSTERED INDEX [EmployeeID] ON [dbo].[tblOrders]
1239  (
1240  	[EmployeeID] ASC
1241  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1242  GO
1243  /****** Object:  Index [EmployeesOrders]    Script Date: 10/23/2024 4:08:16 PM ******/
1244  CREATE NONCLUSTERED INDEX [EmployeesOrders] ON [dbo].[tblOrders]
1245  (
1246  	[EmployeeID] ASC
1247  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1248  GO
1249  /****** Object:  Index [OrderDate]    Script Date: 10/23/2024 4:08:16 PM ******/
1250  CREATE NONCLUSTERED INDEX [OrderDate] ON [dbo].[tblOrders]
1251  (
1252  	[OrderDate] ASC
1253  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1254  GO
1255  /****** Object:  Index [ShippedDate]    Script Date: 10/23/2024 4:08:16 PM ******/
1256  CREATE NONCLUSTERED INDEX [ShippedDate] ON [dbo].[tblOrders]
1257  (
1258  	[ShippedDate] ASC
1259  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1260  GO
1261  /****** Object:  Index [ShippersOrders]    Script Date: 10/23/2024 4:08:16 PM ******/
1262  CREATE NONCLUSTERED INDEX [ShippersOrders] ON [dbo].[tblOrders]
1263  (
1264  	[ShipVia] ASC
1265  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1266  GO
1267  SET ANSI_PADDING ON
1268  GO
1269  /****** Object:  Index [ShipPostalCode]    Script Date: 10/23/2024 4:08:16 PM ******/
1270  CREATE NONCLUSTERED INDEX [ShipPostalCode] ON [dbo].[tblOrders]
1271  (
1272  	[ShipPostalCode] ASC
1273  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
1274  GO
1275  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
1276  GO
1277  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_UnitsInStock]  DEFAULT ((0)) FOR [UnitsInStock]
1278  GO
1279  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_UnitsOnOrder]  DEFAULT ((0)) FOR [UnitsOnOrder]
1280  GO
1281  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_ReorderLevel]  DEFAULT ((0)) FOR [ReorderLevel]
1282  GO
1283  ALTER TABLE [dbo].[tblkProducts] ADD  CONSTRAINT [DF_Products_Discontinued]  DEFAULT ((0)) FOR [Discontinued]
1284  GO
1285  ALTER TABLE [dbo].[tblOrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
1286  GO
1287  ALTER TABLE [dbo].[tblOrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
1288  GO
1289  ALTER TABLE [dbo].[tblOrderDetails] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [Discount]
1290  GO
1291  ALTER TABLE [dbo].[tblOrders] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)) FOR [Freight]
1292  GO
1293  ALTER TABLE [dbo].[tblCustomerCustomerDemo]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCustomerDemo] FOREIGN KEY([CustomerTypeID])
1294  REFERENCES [dbo].[tblCustomerDemographics] ([CustomerTypeID])
1295  GO
1296  ALTER TABLE [dbo].[tblCustomerCustomerDemo] CHECK CONSTRAINT [FK_CustomerCustomerDemo]
1297  GO
1298  ALTER TABLE [dbo].[tblCustomerCustomerDemo]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCustomerDemo_Customers] FOREIGN KEY([CustomerID])
1299  REFERENCES [dbo].[tblCustomers] ([CustomerID])
1300  GO
1301  ALTER TABLE [dbo].[tblCustomerCustomerDemo] CHECK CONSTRAINT [FK_CustomerCustomerDemo_Customers]
1302  GO
1303  ALTER TABLE [dbo].[tblEmployees]  WITH NOCHECK ADD  CONSTRAINT [FK_tblEmployeesTerritories_TerritoryID] FOREIGN KEY([ReportsTo])
1304  REFERENCES [dbo].[tblEmployees] ([EmployeeID])
1305  GO
1306  ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployeesTerritories_TerritoryID]
1307  GO
1308  ALTER TABLE [dbo].[tblEmployeeTerritories]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY([EmployeeID])
1309  REFERENCES [dbo].[tblEmployees] ([EmployeeID])
1310  GO
1311  ALTER TABLE [dbo].[tblEmployeeTerritories] CHECK CONSTRAINT [FK_EmployeeTerritories_Employees]
1312  GO
1313  ALTER TABLE [dbo].[tblEmployeeTerritories]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY([TerritoryID])
1314  REFERENCES [dbo].[tblkTerritories] ([TerritoryID])
1315  GO
1316  ALTER TABLE [dbo].[tblEmployeeTerritories] CHECK CONSTRAINT [FK_EmployeeTerritories_Territories]
1317  GO
1318  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
1319  REFERENCES [dbo].[tblCategories] ([CategoryID])
1320  GO
1321  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [FK_Products_Categories]
1322  GO
1323  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
1324  REFERENCES [dbo].[tblkSuppliers] ([SupplierID])
1325  GO
1326  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [FK_Products_Suppliers]
1327  GO
1328  ALTER TABLE [dbo].[tblkTerritories]  WITH CHECK ADD  CONSTRAINT [FK_Territories_Region] FOREIGN KEY([RegionID])
1329  REFERENCES [dbo].[tblkRegion] ([RegionID])
1330  GO
1331  ALTER TABLE [dbo].[tblkTerritories] CHECK CONSTRAINT [FK_Territories_Region]
1332  GO
1333  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([OrderID])
1334  REFERENCES [dbo].[tblOrders] ([OrderID])
1335  GO
1336  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_Order_Details_Orders]
1337  GO
1338  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY([ProductID])
1339  REFERENCES [dbo].[tblkProducts] ([ProductID])
1340  GO
1341  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_Order_Details_Products]
1342  GO
1343  ALTER TABLE [dbo].[tblOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
1344  REFERENCES [dbo].[tblCustomers] ([CustomerID])
1345  GO
1346  ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_Orders_Customers]
1347  GO
1348  ALTER TABLE [dbo].[tblOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
1349  REFERENCES [dbo].[tblEmployees] ([EmployeeID])
1350  GO
1351  ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_Orders_Employees]
1352  GO
1353  ALTER TABLE [dbo].[tblOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipVia])
1354  REFERENCES [dbo].[tblkShippers] ([ShipperID])
1355  GO
1356  ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_Orders_Shippers]
1357  GO
1358  ALTER TABLE [dbo].[tblEmployees]  WITH NOCHECK ADD  CONSTRAINT [CK_Birthdate] CHECK  (([BirthDate]<getdate()))
1359  GO
1360  ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [CK_Birthdate]
1361  GO
1362  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [CK_Products_UnitPrice] CHECK  (([UnitPrice]>=(0)))
1363  GO
1364  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [CK_Products_UnitPrice]
1365  GO
1366  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [CK_ReorderLevel] CHECK  (([ReorderLevel]>=(0)))
1367  GO
1368  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [CK_ReorderLevel]
1369  GO
1370  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsInStock] CHECK  (([UnitsInStock]>=(0)))
1371  GO
1372  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [CK_UnitsInStock]
1373  GO
1374  ALTER TABLE [dbo].[tblkProducts]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsOnOrder] CHECK  (([UnitsOnOrder]>=(0)))
1375  GO
1376  ALTER TABLE [dbo].[tblkProducts] CHECK CONSTRAINT [CK_UnitsOnOrder]
1377  GO
1378  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [CK_Discount] CHECK  (([Discount]>=(0) AND [Discount]<=(1)))
1379  GO
1380  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [CK_Discount]
1381  GO
1382  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [CK_Quantity] CHECK  (([Quantity]>(0)))
1383  GO
1384  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [CK_Quantity]
1385  GO
1386  ALTER TABLE [dbo].[tblOrderDetails]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitPrice] CHECK  (([UnitPrice]>=(0)))
1387  GO
1388  ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [CK_UnitPrice]
1389  GO
1390  /****** Object:  StoredProcedure [dbo].[uspCustOrderHist]    Script Date: 10/23/2024 4:08:16 PM ******/
1391  SET ANSI_NULLS ON
1392  GO
1393  SET QUOTED_IDENTIFIER ON
1394  GO
1395  
1396  
1397  
1398  
1399  CREATE      
1400  	
1401  
1402   PROCEDURE [dbo].[uspCustOrderHist] @parmCustomerID NCHAR(5)
1403  AS
1404  --=======================================================================================
1405  --					D E F I N I T I O N
1406  --=======================================================================================
1407  -- Author:			Giancarlo Rhodes
1408  -- Create Date:		05/24/2024
1409  -- Description:		
1410  --					
1411  -- Integration:		
1412  -- Update History:  Please see comment at bottom for changelog
1413  --=======================================================================================
1414  
1415  SELECT ProductName,
1416  	Total = SUM(Quantity)
1417  FROM tblkProducts P,
1418  	tblOrderDetails OD,
1419  	tblOrders O,
1420  	tblCustomers C
1421  WHERE C.CustomerID = @parmCustomerID
1422  	AND C.CustomerID = O.CustomerID
1423  	AND O.OrderID = OD.OrderID
1424  	AND OD.ProductID = P.ProductID
1425  GROUP BY ProductName
1426  
1427  --=======================================================================================
1428  --				Change Log
1429  --=======================================================================================
1430  -- Author:			
1431  -- Create Date:		
1432  -- Description:		View was modified			
1433  -- Integration:		
1434  -- Update History:  
1435  --=======================================================================================
1436  
1437  GO
1438  /****** Object:  StoredProcedure [dbo].[uspCustOrdersDetail]    Script Date: 10/23/2024 4:08:16 PM ******/
1439  SET ANSI_NULLS ON
1440  GO
1441  SET QUOTED_IDENTIFIER ON
1442  GO
1443  
1444  CREATE     PROCEDURE [dbo].[uspCustOrdersDetail] @parmOrderID int
1445  AS
1446  
1447  --=======================================================================================
1448  --					D E F I N I T I O N
1449  --=======================================================================================
1450  -- Author:			Giancarlo Rhodes
1451  -- Create Date:		05/24/2024
1452  -- Description:		
1453  --					
1454  -- Integration:		
1455  -- Update History:  Please see comment at bottom for changelog
1456  --=======================================================================================
1457  
1458  SELECT ProductName,
1459      UnitPrice=ROUND(Od.UnitPrice, 2),
1460      Quantity,
1461      Discount=CONVERT(int, Discount * 100), 
1462      ExtendedPrice=ROUND(CONVERT(money, Quantity * (1 - Discount) * Od.UnitPrice), 2)
1463  FROM tblkProducts P, tblOrderDetails Od
1464  WHERE Od.ProductID = P.ProductID and Od.OrderID = @parmOrderID
1465  
1466  --=======================================================================================
1467  --				Change Log
1468  --=======================================================================================
1469  -- Author:			
1470  -- Create Date:		
1471  -- Description:		View was modified			
1472  -- Integration:		
1473  -- Update History:  
1474  --=======================================================================================
1475  
1476  GO
1477  /****** Object:  StoredProcedure [dbo].[uspCustOrdersOrders]    Script Date: 10/23/2024 4:08:16 PM ******/
1478  SET ANSI_NULLS ON
1479  GO
1480  SET QUOTED_IDENTIFIER ON
1481  GO
1482  
1483  
1484  CREATE    
1485  	
1486  PROCEDURE [dbo].[uspCustOrdersOrders] 
1487  @parmCustomerID NCHAR(5)
1488  
1489  AS
1490  --=======================================================================================
1491  --					D E F I N I T I O N
1492  --=======================================================================================
1493  -- Author:			Giancarlo Rhodes
1494  -- Create Date:		05/24/2024
1495  -- Description:		
1496  --					
1497  -- Integration:		
1498  -- Update History:  Please see comment at bottom for changelog
1499  --=======================================================================================
1500  
1501  
1502  SELECT o.OrderID,
1503  	o.OrderDate,
1504  	o.RequiredDate,
1505  	o.ShippedDate
1506  FROM tblOrders o
1507  WHERE o.CustomerID = @parmCustomerID
1508  ORDER BY o.OrderID
1509  
1510  
1511  --=======================================================================================
1512  --				Change Log
1513  --=======================================================================================
1514  -- Author:			
1515  -- Create Date:		
1516  -- Description:		View was modified			
1517  -- Integration:		
1518  -- Update History:  
1519  --=======================================================================================
1520  
1521  
1522  
1523  GO
1524  /****** Object:  StoredProcedure [dbo].[uspEmployeeSalesByCountry]    Script Date: 10/23/2024 4:08:16 PM ******/
1525  SET ANSI_NULLS ON
1526  GO
1527  SET QUOTED_IDENTIFIER ON
1528  GO
1529  
1530  
1531  
1532  CREATE     procedure [dbo].[uspEmployeeSalesByCountry]
1533  
1534  @parmBeginning_Date DateTime, 
1535  @parmEnding_Date DateTime 
1536  
1537  
1538  AS
1539  
1540  --=======================================================================================
1541  --					D E F I N I T I O N
1542  --=======================================================================================
1543  -- Author:			Giancarlo Rhodes
1544  -- Create Date:		05/24/2024
1545  -- Description:		
1546  --					
1547  -- Integration:		
1548  -- Update History:  Please see comment at bottom for changelog
1549  --=======================================================================================
1550  
1551  
1552  SELECT e.Country, e.LastName, e.FirstName, o.ShippedDate, o.OrderID, vos.Subtotal AS SaleAmount
1553  FROM tblEmployees e INNER JOIN 
1554  	(tblOrders o INNER JOIN vwOrderSubtotals vos ON o.OrderID = vos.OrderID) 
1555  	ON e.EmployeeID = o.EmployeeID
1556  WHERE o.ShippedDate Between @parmBeginning_Date And @parmEnding_Date
1557  
1558  --=======================================================================================
1559  --				Change Log
1560  --=======================================================================================
1561  -- Author:			
1562  -- Create Date:		
1563  -- Description:		View was modified			
1564  -- Integration:		
1565  -- Update History:  
1566  --=======================================================================================
1567  
1568  
1569  
1570  
1571  
1572  GO
1573  /****** Object:  StoredProcedure [dbo].[uspSalesByCategory]    Script Date: 10/23/2024 4:08:16 PM ******/
1574  SET ANSI_NULLS ON
1575  GO
1576  SET QUOTED_IDENTIFIER ON
1577  GO
1578  
1579  
1580  CREATE  
1581  	
1582  
1583   PROCEDURE [dbo].[uspSalesByCategory] 
1584  	@parmCategoryName NVARCHAR(15),
1585  	@parmOrdYear NVARCHAR(4) = '1998'
1586  AS
1587  --=======================================================================================
1588  --					D E F I N I T I O N
1589  --=======================================================================================
1590  -- Author:			Giancarlo Rhodes
1591  -- Create Date:		05/24/2024
1592  -- Description:		
1593  --					
1594  -- Integration:		
1595  -- Update History:  Please see comment at bottom for changelog
1596  --=======================================================================================
1597  
1598  
1599  IF @parmOrdYear != '1996'
1600  	AND @parmOrdYear != '1997'
1601  	AND @parmOrdYear != '1998'
1602  BEGIN
1603  	SELECT @parmOrdYear = '1998'
1604  END
1605  
1606  SELECT P.ProductName,
1607  	TotalPurchase = ROUND(SUM(CONVERT(DECIMAL(14, 2), OD.Quantity * (1 - OD.Discount) * OD.UnitPrice)), 0)
1608  FROM tblOrderDetails OD,
1609  	tblOrders O,
1610  	tblkProducts P,
1611  	tblCategories C
1612  WHERE OD.OrderID = O.OrderID
1613  	AND OD.ProductID = P.ProductID
1614  	AND P.CategoryID = C.CategoryID
1615  	AND C.CategoryName = @parmCategoryName
1616  	AND SUBSTRING(CONVERT(NVARCHAR(22), O.OrderDate, 111), 1, 4) = @parmOrdYear
1617  GROUP BY P.ProductName
1618  ORDER BY P.ProductName
1619  
1620  --=======================================================================================
1621  --				Change Log
1622  --=======================================================================================
1623  -- Author:			
1624  -- Create Date:		
1625  -- Description:		View was modified			
1626  -- Integration:		
1627  -- Update History:  
1628  --=======================================================================================
1629  
1630  
1631  GO
1632  /****** Object:  StoredProcedure [dbo].[uspSalesByYear]    Script Date: 10/23/2024 4:08:16 PM ******/
1633  SET ANSI_NULLS ON
1634  GO
1635  SET QUOTED_IDENTIFIER ON
1636  GO
1637  
1638  
1639  
1640  CREATE    
1641  	
1642  
1643   PROCEDURE [dbo].[uspSalesByYear] 
1644  	@parmBeginningDate DATETIME,
1645  	@parmEndingDate DATETIME
1646  AS
1647  --=======================================================================================
1648  --					D E F I N I T I O N
1649  --=======================================================================================
1650  -- Author:			Giancarlo Rhodes
1651  -- Create Date:		05/24/2024
1652  -- Description:		
1653  --					
1654  -- Integration:		
1655  -- Update History:  Please see comment at bottom for changelog
1656  --=======================================================================================
1657  
1658  SELECT o.ShippedDate,
1659  	o.OrderID,
1660  	vos.Subtotal,
1661  	DATENAME(yy, ShippedDate) AS Year
1662  FROM tblOrders o 
1663  INNER JOIN vwOrderSubtotals vos ON o.OrderID = vos.OrderID
1664  WHERE o.ShippedDate BETWEEN @parmBeginningDate
1665  		AND @parmEndingDate
1666  
1667  
1668  --=======================================================================================
1669  --				Change Log
1670  --=======================================================================================
1671  -- Author:			
1672  -- Create Date:		
1673  -- Description:		View was modified			
1674  -- Integration:		
1675  -- Update History:  
1676  --=======================================================================================
1677  
1678  
1679  GO
1680  /****** Object:  StoredProcedure [dbo].[uspTenMostExpensiveProducts]    Script Date: 10/23/2024 4:08:16 PM ******/
1681  SET ANSI_NULLS ON
1682  GO
1683  SET QUOTED_IDENTIFIER ON
1684  GO
1685  
1686  CREATE
1687  	
1688  
1689   PROCEDURE [dbo].[uspTenMostExpensiveProducts]
1690  AS
1691  --=======================================================================================
1692  --					D E F I N I T I O N
1693  --=======================================================================================
1694  -- Author:			Giancarlo Rhodes
1695  -- Create Date:		05/24/2024
1696  -- Description:		
1697  --					
1698  -- Integration:		
1699  -- Update History:  Please see comment at bottom for changelog
1700  --=======================================================================================
1701  SELECT p.ProductName AS TenMostExpensiveProducts,
1702  	p.UnitPrice
1703  FROM tblkProducts p
1704  ORDER BY p.UnitPrice DESC
1705  --=======================================================================================
1706  --				Change Log
1707  --=======================================================================================
1708  -- Author:			
1709  -- Create Date:		
1710  -- Description:		View was modified			
1711  -- Integration:		
1712  -- Update History:  
1713  --=======================================================================================
1714  GO
1715  EXEC [MdcStandard].sys.sp_addextendedproperty @name=N'Owner', @value=N'IT DBAs, IT Technology Branch' 
1716  GO
1717  EXEC [MdcStandard].sys.sp_addextendedproperty @name=N'Description', @value=N'This database is a template for new databases.' 
1718  GO
1719  EXEC [MdcStandard].sys.sp_addextendedproperty @name=N'Compliance', @value=N'MDC SQL Database Design, Standards, Guidelines, and T-SQL Programming V1.0' 
1720  GO
1721  EXEC [MdcStandard].sys.sp_addextendedproperty @name=N'Comment', @value=N'This database was created using the default model settings.' 
1722  GO
1723  USE [master]
1724  GO
1725  ALTER DATABASE [MdcStandard] SET  READ_WRITE 
1726  GO

-- Processing Log --
-- 10-24-2024 15:18:35 - File copied and updated with line numbers (including all lines): C:\github\giancarlorhodes\python_tsql_checker\tsql\check_MdcStandard_v2_processed_10242024151835.sql
-- 10-24-2024 15:18:35 - Starting validation process...
-- 10-24-2024 15:18:35 - Line 4: Passed - Database Name Convention for 'CREATE DATABASE [MdcStandard]'
-- 10-24-2024 15:18:35 - Line 140: Passed - Table Name Convention for 'CREATE TABLE [dbo].[tblCustomers]('
-- 10-24-2024 15:18:35 - Line 141: Failed - Column Name Convention for '[CustomerID] [nchar](5) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 142: Passed - Column Name Convention for '[CompanyName] [nvarchar](40) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 143: Passed - Column Name Convention for '[ContactName] [nvarchar](30) NULL,'
-- 10-24-2024 15:18:35 - Line 144: Passed - Column Name Convention for '[ContactTitle] [nvarchar](30) NULL,'
-- 10-24-2024 15:18:35 - Line 145: Passed - Column Name Convention for '[Address] [nvarchar](60) NULL,'
-- 10-24-2024 15:18:35 - Line 146: Passed - Column Name Convention for '[City] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 147: Passed - Column Name Convention for '[Region] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 148: Passed - Column Name Convention for '[PostalCode] [nvarchar](10) NULL,'
-- 10-24-2024 15:18:35 - Line 149: Passed - Column Name Convention for '[Country] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 150: Passed - Column Name Convention for '[Phone] [nvarchar](24) NULL,'
-- 10-24-2024 15:18:35 - Line 151: Passed - Column Name Convention for '[Fax] [nvarchar](24) NULL,'
-- 10-24-2024 15:18:35 - Line 152: End of table definition block.
-- 10-24-2024 15:18:35 - Line 219: Passed - Table Name Convention for 'CREATE TABLE [dbo].[tblkSuppliers]('
-- 10-24-2024 15:18:35 - Line 220: Failed - Column Name Convention for '[SupplierID] [int] IDENTITY(1,1) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 221: Passed - Column Name Convention for '[CompanyName] [nvarchar](40) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 222: Passed - Column Name Convention for '[ContactName] [nvarchar](30) NULL,'
-- 10-24-2024 15:18:35 - Line 223: Passed - Column Name Convention for '[ContactTitle] [nvarchar](30) NULL,'
-- 10-24-2024 15:18:35 - Line 224: Passed - Column Name Convention for '[Address] [nvarchar](60) NULL,'
-- 10-24-2024 15:18:35 - Line 225: Passed - Column Name Convention for '[City] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 226: Passed - Column Name Convention for '[Region] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 227: Passed - Column Name Convention for '[PostalCode] [nvarchar](10) NULL,'
-- 10-24-2024 15:18:35 - Line 228: Passed - Column Name Convention for '[Country] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 229: Passed - Column Name Convention for '[Phone] [nvarchar](24) NULL,'
-- 10-24-2024 15:18:35 - Line 230: Passed - Column Name Convention for '[Fax] [nvarchar](24) NULL,'
-- 10-24-2024 15:18:35 - Line 231: Passed - Column Name Convention for '[HomePage] [ntext] NULL,'
-- 10-24-2024 15:18:35 - Line 232: End of table definition block.
-- 10-24-2024 15:18:35 - Line 247: Passed - View Name Convention for 'VIEW [dbo].[vwCustomerAndSuppliersByCity]'
-- 10-24-2024 15:18:35 - Line 288: Passed - Table Name Convention for 'CREATE TABLE [dbo].[tblkProducts]('
-- 10-24-2024 15:18:35 - Line 289: Failed - Column Name Convention for '[ProductID] [int] IDENTITY(1,1) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 290: Passed - Column Name Convention for '[ProductName] [nvarchar](40) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 291: Failed - Column Name Convention for '[SupplierID] [int] NULL,'
-- 10-24-2024 15:18:35 - Line 292: Failed - Column Name Convention for '[CategoryID] [int] NULL,'
-- 10-24-2024 15:18:35 - Line 293: Passed - Column Name Convention for '[QuantityPerUnit] [nvarchar](20) NULL,'
-- 10-24-2024 15:18:35 - Line 294: Passed - Column Name Convention for '[UnitPrice] [money] NULL,'
-- 10-24-2024 15:18:35 - Line 295: Passed - Column Name Convention for '[UnitsInStock] [smallint] NULL,'
-- 10-24-2024 15:18:35 - Line 296: Passed - Column Name Convention for '[UnitsOnOrder] [smallint] NULL,'
-- 10-24-2024 15:18:35 - Line 297: Passed - Column Name Convention for '[ReorderLevel] [smallint] NULL,'
-- 10-24-2024 15:18:35 - Line 298: Passed - Column Name Convention for '[Discontinued] [bit] NOT NULL,'
-- 10-24-2024 15:18:35 - Line 299: End of table definition block.
-- 10-24-2024 15:18:35 - Line 314: Passed - View Name Convention for 'VIEW [dbo].[vwCurrentProductList]'
-- 10-24-2024 15:18:35 - Line 351: Passed - Table Name Convention for 'CREATE TABLE [dbo].[tblOrders]('
-- 10-24-2024 15:18:35 - Line 352: Failed - Column Name Convention for '[OrderID] [int] IDENTITY(1,1) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 353: Failed - Column Name Convention for '[CustomerID] [nchar](5) NULL,'
-- 10-24-2024 15:18:35 - Line 354: Failed - Column Name Convention for '[EmployeeID] [int] NULL,'
-- 10-24-2024 15:18:35 - Line 355: Passed - Column Name Convention for '[OrderDate] [datetime] NULL,'
-- 10-24-2024 15:18:35 - Line 356: Passed - Column Name Convention for '[RequiredDate] [datetime] NULL,'
-- 10-24-2024 15:18:35 - Line 357: Passed - Column Name Convention for '[ShippedDate] [datetime] NULL,'
-- 10-24-2024 15:18:35 - Line 358: Passed - Column Name Convention for '[ShipVia] [int] NULL,'
-- 10-24-2024 15:18:35 - Line 359: Passed - Column Name Convention for '[Freight] [money] NULL,'
-- 10-24-2024 15:18:35 - Line 360: Passed - Column Name Convention for '[ShipName] [nvarchar](40) NULL,'
-- 10-24-2024 15:18:35 - Line 361: Passed - Column Name Convention for '[ShipAddress] [nvarchar](60) NULL,'
-- 10-24-2024 15:18:35 - Line 362: Passed - Column Name Convention for '[ShipCity] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 363: Passed - Column Name Convention for '[ShipRegion] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 364: Passed - Column Name Convention for '[ShipPostalCode] [nvarchar](10) NULL,'
-- 10-24-2024 15:18:35 - Line 365: Passed - Column Name Convention for '[ShipCountry] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 366: End of table definition block.
-- 10-24-2024 15:18:35 - Line 378: Passed - View Name Convention for 'CREATE   VIEW [dbo].[vwOrdersQry]'
-- 10-24-2024 15:18:35 - Line 429: Passed - View Name Convention for 'CREATE   view [dbo].[vwProductsAboveAveragePrice]'
-- 10-24-2024 15:18:35 - Line 467: Passed - Table Name Convention for 'CREATE TABLE [dbo].[tblCategories]('
-- 10-24-2024 15:18:35 - Line 468: Failed - Column Name Convention for '[CategoryID] [int] IDENTITY(1,1) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 469: Passed - Column Name Convention for '[CategoryName] [nvarchar](15) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 470: Passed - Column Name Convention for '[Description] [ntext] NULL,'
-- 10-24-2024 15:18:35 - Line 471: Passed - Column Name Convention for '[Picture] [image] NULL,'
-- 10-24-2024 15:18:35 - Line 472: End of table definition block.
-- 10-24-2024 15:18:35 - Line 487: Passed - View Name Convention for 'VIEW [dbo].[vwProductsByCategory]'
-- 10-24-2024 15:18:35 - Line 532: Passed - View Name Convention for 'VIEW [dbo].[vwQuarterlyOrders]'
-- 10-24-2024 15:18:35 - Line 575: Passed - Table Name Convention for 'CREATE TABLE [dbo].[tblEmployees]('
-- 10-24-2024 15:18:35 - Line 576: Failed - Column Name Convention for '[EmployeeID] [int] IDENTITY(1,1) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 577: Passed - Column Name Convention for '[LastName] [nvarchar](20) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 578: Passed - Column Name Convention for '[FirstName] [nvarchar](25) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 579: Passed - Column Name Convention for '[Title] [nvarchar](30) NULL,'
-- 10-24-2024 15:18:35 - Line 580: Passed - Column Name Convention for '[TitleOfCourtesy] [nvarchar](25) NULL,'
-- 10-24-2024 15:18:35 - Line 581: Passed - Column Name Convention for '[BirthDate] [datetime] NULL,'
-- 10-24-2024 15:18:35 - Line 582: Passed - Column Name Convention for '[HireDate] [datetime] NULL,'
-- 10-24-2024 15:18:35 - Line 583: Passed - Column Name Convention for '[Address] [nvarchar](60) NULL,'
-- 10-24-2024 15:18:35 - Line 584: Passed - Column Name Convention for '[City] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 585: Passed - Column Name Convention for '[Region] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 586: Passed - Column Name Convention for '[PostalCode] [nvarchar](10) NULL,'
-- 10-24-2024 15:18:35 - Line 587: Passed - Column Name Convention for '[Country] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 588: Passed - Column Name Convention for '[HomePhone] [nvarchar](24) NULL,'
-- 10-24-2024 15:18:35 - Line 589: Passed - Column Name Convention for '[Extension] [nvarchar](4) NULL,'
-- 10-24-2024 15:18:35 - Line 590: Passed - Column Name Convention for '[Photo] [image] NULL,'
-- 10-24-2024 15:18:35 - Line 591: Passed - Column Name Convention for '[Notes] [ntext] NULL,'
-- 10-24-2024 15:18:35 - Line 592: Passed - Column Name Convention for '[ReportsTo] [int] NULL,'
-- 10-24-2024 15:18:35 - Line 593: Passed - Column Name Convention for '[PhotoPath] [nvarchar](255) NULL,'
-- 10-24-2024 15:18:35 - Line 594: End of table definition block.
-- 10-24-2024 15:18:35 - Line 605: Passed - Table Name Convention for 'CREATE TABLE [dbo].[tblkShippers]('
-- 10-24-2024 15:18:35 - Line 606: Failed - Column Name Convention for '[ShipperID] [int] IDENTITY(1,1) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 607: Passed - Column Name Convention for '[CompanyName] [nvarchar](40) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 608: Passed - Column Name Convention for '[Phone] [nvarchar](24) NULL,'
-- 10-24-2024 15:18:35 - Line 609: End of table definition block.
-- 10-24-2024 15:18:35 - Line 620: Passed - Table Name Convention for 'CREATE TABLE [dbo].[tblOrderDetails]('
-- 10-24-2024 15:18:35 - Line 621: Failed - Column Name Convention for '[OrderID] [int] NOT NULL,'
-- 10-24-2024 15:18:35 - Line 622: Failed - Column Name Convention for '[ProductID] [int] NOT NULL,'
-- 10-24-2024 15:18:35 - Line 623: Passed - Column Name Convention for '[UnitPrice] [money] NOT NULL,'
-- 10-24-2024 15:18:35 - Line 624: Passed - Column Name Convention for '[Quantity] [smallint] NOT NULL,'
-- 10-24-2024 15:18:35 - Line 625: Passed - Column Name Convention for '[Discount] [real] NOT NULL,'
-- 10-24-2024 15:18:35 - Line 626: End of table definition block.
-- 10-24-2024 15:18:35 - Line 640: Passed - View Name Convention for 'CREATE   view [dbo].[vwInvoices] AS'
-- 10-24-2024 15:18:35 - Line 699: Passed - View Name Convention for 'VIEW [dbo].[vwOrderDetailsExtended]'
-- 10-24-2024 15:18:35 - Line 739: Passed - View Name Convention for 'VIEW [dbo].[vwOrderSubtotals]'
-- 10-24-2024 15:18:35 - Line 782: Failed - View Name Convention for 'CREATE     view [dbo].[vwProductSalesFor1997]'
-- 10-24-2024 15:18:35 - Line 828: Passed - View Name Convention for 'VIEW [dbo].[vwSalesByCategory]'
-- 10-24-2024 15:18:35 - Line 877: Passed - View Name Convention for 'CREATE      VIEW [dbo].[vwSalesTotalByAmount]'
-- 10-24-2024 15:18:35 - Line 928: Passed - View Name Convention for 'VIEW [dbo].[vwSummaryOfSalesByQuarter]'
-- 10-24-2024 15:18:35 - Line 967: Passed - View Name Convention for 'VIEW [dbo].[vwSummaryOfSalesByYear]'
-- 10-24-2024 15:18:35 - Line 1004: Passed - Table Name Convention for 'CREATE TABLE [dbo].[tblCustomerCustomerDemo]('
-- 10-24-2024 15:18:35 - Line 1005: Failed - Column Name Convention for '[CustomerID] [nchar](5) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 1006: Failed - Column Name Convention for '[CustomerTypeID] [nchar](10) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 1007: End of table definition block.
-- 10-24-2024 15:18:35 - Line 1019: Passed - Table Name Convention for 'CREATE TABLE [dbo].[tblCustomerDemographics]('
-- 10-24-2024 15:18:35 - Line 1020: Failed - Column Name Convention for '[CustomerTypeID] [nchar](10) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 1021: Passed - Column Name Convention for '[CustomerDesc] [ntext] NULL,'
-- 10-24-2024 15:18:35 - Line 1022: End of table definition block.
-- 10-24-2024 15:18:35 - Line 1033: Passed - Table Name Convention for 'CREATE TABLE [dbo].[tblCustomersAuditHistory]('
-- 10-24-2024 15:18:35 - Line 1034: Failed - Column Name Convention for '[CustomerID] [nchar](5) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 1035: Passed - Column Name Convention for '[CompanyName] [nvarchar](40) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 1036: Passed - Column Name Convention for '[ContactName] [nvarchar](30) NULL,'
-- 10-24-2024 15:18:35 - Line 1037: Passed - Column Name Convention for '[ContactTitle] [nvarchar](30) NULL,'
-- 10-24-2024 15:18:35 - Line 1038: Passed - Column Name Convention for '[Address] [nvarchar](60) NULL,'
-- 10-24-2024 15:18:35 - Line 1039: Passed - Column Name Convention for '[City] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 1040: Passed - Column Name Convention for '[Region] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 1041: Passed - Column Name Convention for '[PostalCode] [nvarchar](10) NULL,'
-- 10-24-2024 15:18:35 - Line 1042: Passed - Column Name Convention for '[Country] [nvarchar](15) NULL,'
-- 10-24-2024 15:18:35 - Line 1043: Passed - Column Name Convention for '[Phone] [nvarchar](24) NULL,'
-- 10-24-2024 15:18:35 - Line 1044: Passed - Column Name Convention for '[Fax] [nvarchar](24) NULL,'
-- 10-24-2024 15:18:35 - Line 1045: Passed - Column Name Convention for '[Action] [nvarchar](24) NULL,'
-- 10-24-2024 15:18:35 - Line 1046: Passed - Column Name Convention for '[ActionDateTime] [datetime] NULL'
-- 10-24-2024 15:18:35 - Line 1047: End of table definition block.
-- 10-24-2024 15:18:35 - Line 1054: Passed - Table Name Convention for 'CREATE TABLE [dbo].[tblEmployeeTerritories]('
-- 10-24-2024 15:18:35 - Line 1055: Failed - Column Name Convention for '[EmployeeID] [int] NOT NULL,'
-- 10-24-2024 15:18:35 - Line 1056: Failed - Column Name Convention for '[TerritoryID] [nvarchar](20) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 1057: End of table definition block.
-- 10-24-2024 15:18:35 - Line 1069: Passed - Table Name Convention for 'CREATE TABLE [dbo].[tblkRegion]('
-- 10-24-2024 15:18:35 - Line 1070: Failed - Column Name Convention for '[RegionID] [int] NOT NULL,'
-- 10-24-2024 15:18:35 - Line 1071: Passed - Column Name Convention for '[RegionDescription] [nchar](50) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 1072: End of table definition block.
-- 10-24-2024 15:18:35 - Line 1083: Passed - Table Name Convention for 'CREATE TABLE [dbo].[tblkTerritories]('
-- 10-24-2024 15:18:35 - Line 1084: Failed - Column Name Convention for '[TerritoryID] [nvarchar](20) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 1085: Passed - Column Name Convention for '[TerritoryDescription] [nchar](50) NOT NULL,'
-- 10-24-2024 15:18:35 - Line 1086: Failed - Column Name Convention for '[RegionID] [int] NOT NULL,'
-- 10-24-2024 15:18:35 - Line 1087: End of table definition block.
-- 10-24-2024 15:18:35 - Ending validation process...
