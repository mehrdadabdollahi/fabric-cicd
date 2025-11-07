CREATE TABLE [dbo].[Products] (
    [ProductID]   INT             IDENTITY (1, 1) NOT NULL,
    [ProductName] NVARCHAR (100)  NULL,
    [Category]    NVARCHAR (50)   NULL,
    [UnitPrice]   DECIMAL (10, 2) NULL,
    [CreatedDate] DATETIME2 (7)   DEFAULT (sysutcdatetime()) NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC)
);


GO

