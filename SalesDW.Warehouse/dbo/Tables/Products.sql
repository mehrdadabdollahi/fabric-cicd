CREATE TABLE [dbo].[Products] (

	[ProductID] int NULL, 
	[ProductName] varchar(8000) NULL, 
	[Category] varchar(8000) NULL, 
	[UnitPrice] decimal(38,6) NULL, 
	[CreatedDate] datetime2(6) NULL
);