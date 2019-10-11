CREATE TABLE [dbo].[USStates](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](30) NULL,
 CONSTRAINT [PK_USStates] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)
)
GO