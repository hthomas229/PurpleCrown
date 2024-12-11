USE [Cleaning]
GO

/****** Object:  Table [dbo].[acmecleaning]    Script Date: 12/10/2024 7:06:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[acmecleaning](
	[EmployeeID] [smallint] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NULL,
	[Salary] [int] NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[FormattedPhone] [varchar](20) NULL,
	[StreetAddress] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](10) NULL,
	[ZipCode] [varchar](11) NULL
) ON [PRIMARY]
GO

