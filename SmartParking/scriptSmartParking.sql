USE [SmartParking]
GO
/****** Object:  Table [dbo].[Masini]    Script Date: 7/11/2016 9:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masini](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[Numar] [nvarchar](50) NOT NULL,
	[Culoare] [nvarchar](50) NULL,
 CONSTRAINT [PK_Masini] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Model]    Script Date: 7/11/2016 9:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProducatorID] [int] NOT NULL,
	[Nume] [nvarchar](100) NOT NULL,
	[An] [int] NOT NULL,
	[Activ] [bit] NOT NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producator]    Script Date: 7/11/2016 9:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producator](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nume] [nvarchar](100) NOT NULL,
	[Activ] [bit] NULL,
 CONSTRAINT [PK_Producator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vizita]    Script Date: 7/11/2016 9:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vizita](
	[ID] [int] NOT NULL,
	[MasinaID] [int] NOT NULL,
	[DataPlecare] [datetime2](7) NOT NULL,
	[DataSosire] [datetime2](7) NOT NULL,
	[durata]  AS (datediff(minute,[DataSosire],[DataPlecare])/(60.0)),
 CONSTRAINT [PK_Vizita] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[wv_fidel]    Script Date: 7/11/2016 9:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[wv_fidel] as
Select  COUNT(*) AS C,M.Numar
FROM dbo.Vizita V,dbo.Masini M
WHERE V.MasinaID=M.ID
GROUP BY M.Numar

GO
SET IDENTITY_INSERT [dbo].[Masini] ON 

INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Culoare]) VALUES (1, 1, N'BR-19-BJJ', N'Rosu')
INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Culoare]) VALUES (2, 2, N'B-666-SEX', N'Galben')
INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Culoare]) VALUES (3, 3, N'OT-10-GIK', N'Negru')
INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Culoare]) VALUES (4, 4, N'GL-90-TTL', N'Fucsia')
INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Culoare]) VALUES (5, 5, N'CT-29-CUI', N'Verde')
INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Culoare]) VALUES (6, 2, N'B-21-KKK', N'Gri')
INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Culoare]) VALUES (7, 1, N'GL-12-QEW', N'ALB')
INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Culoare]) VALUES (8, 4, N'B-21-DWW', N'Auriu')
SET IDENTITY_INSERT [dbo].[Masini] OFF
SET IDENTITY_INSERT [dbo].[Model] ON 

INSERT [dbo].[Model] ([ID], [ProducatorID], [Nume], [An], [Activ]) VALUES (1, 1, N'Fabia', 2008, 1)
INSERT [dbo].[Model] ([ID], [ProducatorID], [Nume], [An], [Activ]) VALUES (2, 2, N'X5', 2012, 1)
INSERT [dbo].[Model] ([ID], [ProducatorID], [Nume], [An], [Activ]) VALUES (3, 3, N'4X4', 1990, 0)
INSERT [dbo].[Model] ([ID], [ProducatorID], [Nume], [An], [Activ]) VALUES (4, 4, N'CLR', 2010, 0)
INSERT [dbo].[Model] ([ID], [ProducatorID], [Nume], [An], [Activ]) VALUES (5, 5, N'Punto', 2010, 0)
SET IDENTITY_INSERT [dbo].[Model] OFF
SET IDENTITY_INSERT [dbo].[Producator] ON 

INSERT [dbo].[Producator] ([ID], [Nume], [Activ]) VALUES (1, N'Skoda', 1)
INSERT [dbo].[Producator] ([ID], [Nume], [Activ]) VALUES (2, N'BWM', 1)
INSERT [dbo].[Producator] ([ID], [Nume], [Activ]) VALUES (3, N'ARO', 0)
INSERT [dbo].[Producator] ([ID], [Nume], [Activ]) VALUES (4, N'Mercedes', 1)
INSERT [dbo].[Producator] ([ID], [Nume], [Activ]) VALUES (5, N'Fiat', 1)
SET IDENTITY_INSERT [dbo].[Producator] OFF
INSERT [dbo].[Vizita] ([ID], [MasinaID], [DataPlecare], [DataSosire]) VALUES (1, 1, CAST(N'2016-07-07 03:39:59.4930000' AS DateTime2), CAST(N'2016-07-07 01:39:59.4930000' AS DateTime2))
INSERT [dbo].[Vizita] ([ID], [MasinaID], [DataPlecare], [DataSosire]) VALUES (2, 2, CAST(N'2016-07-07 20:39:59.4930000' AS DateTime2), CAST(N'2016-07-07 16:39:59.4930000' AS DateTime2))
INSERT [dbo].[Vizita] ([ID], [MasinaID], [DataPlecare], [DataSosire]) VALUES (3, 3, CAST(N'2016-07-08 01:39:59.4930000' AS DateTime2), CAST(N'2016-07-07 23:39:59.4930000' AS DateTime2))
INSERT [dbo].[Vizita] ([ID], [MasinaID], [DataPlecare], [DataSosire]) VALUES (4, 4, CAST(N'2016-07-08 23:39:59.4930000' AS DateTime2), CAST(N'2016-07-08 01:39:59.4930000' AS DateTime2))
INSERT [dbo].[Vizita] ([ID], [MasinaID], [DataPlecare], [DataSosire]) VALUES (5, 2, CAST(N'2016-07-08 23:39:59.4930000' AS DateTime2), CAST(N'2016-07-08 17:39:59.4930000' AS DateTime2))
INSERT [dbo].[Vizita] ([ID], [MasinaID], [DataPlecare], [DataSosire]) VALUES (6, 3, CAST(N'2016-07-09 05:31:59.4930000' AS DateTime2), CAST(N'2016-07-09 01:39:59.4930000' AS DateTime2))
ALTER TABLE [dbo].[Masini]  WITH CHECK ADD  CONSTRAINT [FK_Masini_Model] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Model] ([ID])
GO
ALTER TABLE [dbo].[Masini] CHECK CONSTRAINT [FK_Masini_Model]
GO
ALTER TABLE [dbo].[Model]  WITH CHECK ADD  CONSTRAINT [FK_Model_Producator] FOREIGN KEY([ProducatorID])
REFERENCES [dbo].[Producator] ([ID])
GO
ALTER TABLE [dbo].[Model] CHECK CONSTRAINT [FK_Model_Producator]
GO
ALTER TABLE [dbo].[Vizita]  WITH CHECK ADD  CONSTRAINT [FK_Vizita_Masini] FOREIGN KEY([MasinaID])
REFERENCES [dbo].[Masini] ([ID])
GO
ALTER TABLE [dbo].[Vizita] CHECK CONSTRAINT [FK_Vizita_Masini]
GO
