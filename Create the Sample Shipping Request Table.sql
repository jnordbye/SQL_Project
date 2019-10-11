USE [Bob]
GO

/****** Object:  Table [dbo].[SampleShippingRequest]    Script Date: 3/26/2019 9:40:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SampleShippingRequest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](255) NOT NULL,
	[DateRecorded] [datetime] NOT NULL,
 CONSTRAINT [PK_SampleShippingRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


