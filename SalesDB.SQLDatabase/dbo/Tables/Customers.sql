CREATE TABLE [dbo].[Customers] (
    [CustomerID]  INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]   NVARCHAR (50)  NULL,
    [LastName]    NVARCHAR (50)  NULL,
    [Email]       NVARCHAR (100) NULL,
    [City]        NVARCHAR (50)  NULL,
    [Country]     NVARCHAR (50)  NULL,
    [CreatedDate] DATETIME2 (7)  DEFAULT (sysutcdatetime()) NULL,
    PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);


GO

