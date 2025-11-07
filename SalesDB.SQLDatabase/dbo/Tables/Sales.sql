CREATE TABLE [dbo].[Sales] (
    [SalesID]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [CustomerID]  INT             NOT NULL,
    [ProductID]   INT             NOT NULL,
    [Quantity]    INT             NOT NULL,
    [UnitPrice]   DECIMAL (10, 2) NOT NULL,
    [TotalAmount] AS              ([Quantity]*[UnitPrice]) PERSISTED,
    [SalesDate]   DATETIME2 (7)   NOT NULL,
    PRIMARY KEY CLUSTERED ([SalesID] ASC),
    CONSTRAINT [FK_Sales_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID]),
    CONSTRAINT [FK_Sales_Product] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ProductID])
);


GO

