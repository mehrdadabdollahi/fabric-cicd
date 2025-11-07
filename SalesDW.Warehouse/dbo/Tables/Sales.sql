CREATE TABLE [dbo].[Sales] (

	[SalesID] bigint NULL, 
	[CustomerID] int NULL, 
	[ProductID] int NULL, 
	[Quantity] int NULL, 
	[UnitPrice] decimal(38,6) NULL, 
	[TotalAmount] decimal(38,6) NULL, 
	[SalesDate] datetime2(6) NULL
);