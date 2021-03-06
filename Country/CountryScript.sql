USE [Country]
GO
/****** Object:  Table [dbo].[AdresaRO]    Script Date: 7/7/2016 7:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdresaRO](
	[AdresaID] [tinyint] NOT NULL,
	[Strada] [varchar](50) NULL,
	[Localitate] [tinyint] NULL,
	[Judet] [tinyint] NULL,
 CONSTRAINT [PK_Adresa] PRIMARY KEY CLUSTERED 
(
	[AdresaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JudetRO]    Script Date: 7/7/2016 7:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JudetRO](
	[JudetID] [tinyint] NOT NULL,
	[Judet] [varchar](50) NULL,
	[CodJudet] [varchar](2) NULL,
 CONSTRAINT [PK_Judet] PRIMARY KEY CLUSTERED 
(
	[JudetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LocalitateRO]    Script Date: 7/7/2016 7:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LocalitateRO](
	[LocalitateID] [tinyint] NOT NULL,
	[Localitate] [varchar](50) NULL,
	[Judet] [tinyint] NULL,
 CONSTRAINT [PK_Localitate] PRIMARY KEY CLUSTERED 
(
	[LocalitateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomenclatorAdresa]    Script Date: 7/7/2016 7:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NomenclatorAdresa](
	[NomenID] [tinyint] NOT NULL,
	[AdresaResedinta] [tinyint] NOT NULL,
	[AdresaDomiciliu] [tinyint] NOT NULL,
	[AdresaCorespondenta] [tinyint] NOT NULL,
 CONSTRAINT [PK_NomenclatorAdresa] PRIMARY KEY CLUSTERED 
(
	[NomenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persoana]    Script Date: 7/7/2016 7:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Persoana](
	[Nume] [varchar](50) NOT NULL,
	[ID] [tinyint] NOT NULL,
	[Prenume] [varchar](50) NOT NULL,
	[Adresa] [tinyint] NOT NULL,
 CONSTRAINT [PK_Persoana] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AdresaRO] ([AdresaID], [Strada], [Localitate], [Judet]) VALUES (1, N'Ion Creanga', 1, 1)
INSERT [dbo].[AdresaRO] ([AdresaID], [Strada], [Localitate], [Judet]) VALUES (2, N'Titu Maiorescu', 2, 2)
INSERT [dbo].[AdresaRO] ([AdresaID], [Strada], [Localitate], [Judet]) VALUES (3, N'Nicolae Iorga', 3, 3)
INSERT [dbo].[JudetRO] ([JudetID], [Judet], [CodJudet]) VALUES (1, N'Braila', N'BR')
INSERT [dbo].[JudetRO] ([JudetID], [Judet], [CodJudet]) VALUES (2, N'Galati', N'GL')
INSERT [dbo].[JudetRO] ([JudetID], [Judet], [CodJudet]) VALUES (3, N'Olt', N'OT')
INSERT [dbo].[LocalitateRO] ([LocalitateID], [Localitate], [Judet]) VALUES (1, N'Tufesti', 1)
INSERT [dbo].[LocalitateRO] ([LocalitateID], [Localitate], [Judet]) VALUES (2, N'Chiraftei', 2)
INSERT [dbo].[LocalitateRO] ([LocalitateID], [Localitate], [Judet]) VALUES (3, N'Barza', 3)
INSERT [dbo].[NomenclatorAdresa] ([NomenID], [AdresaResedinta], [AdresaDomiciliu], [AdresaCorespondenta]) VALUES (1, 1, 1, 1)
INSERT [dbo].[NomenclatorAdresa] ([NomenID], [AdresaResedinta], [AdresaDomiciliu], [AdresaCorespondenta]) VALUES (2, 2, 1, 2)
INSERT [dbo].[NomenclatorAdresa] ([NomenID], [AdresaResedinta], [AdresaDomiciliu], [AdresaCorespondenta]) VALUES (3, 1, 3, 3)
INSERT [dbo].[Persoana] ([Nume], [ID], [Prenume], [Adresa]) VALUES (N'Fluturas', 1, N'Marian', 1)
INSERT [dbo].[Persoana] ([Nume], [ID], [Prenume], [Adresa]) VALUES (N'Nicolae', 2, N'Bogdan', 2)
INSERT [dbo].[Persoana] ([Nume], [ID], [Prenume], [Adresa]) VALUES (N'Popescu', 3, N'Marius', 3)
ALTER TABLE [dbo].[AdresaRO]  WITH CHECK ADD  CONSTRAINT [FK_Adresa_Judet] FOREIGN KEY([Judet])
REFERENCES [dbo].[JudetRO] ([JudetID])
GO
ALTER TABLE [dbo].[AdresaRO] CHECK CONSTRAINT [FK_Adresa_Judet]
GO
ALTER TABLE [dbo].[AdresaRO]  WITH CHECK ADD  CONSTRAINT [FK_Adresa_Localitate] FOREIGN KEY([Localitate])
REFERENCES [dbo].[LocalitateRO] ([LocalitateID])
GO
ALTER TABLE [dbo].[AdresaRO] CHECK CONSTRAINT [FK_Adresa_Localitate]
GO
ALTER TABLE [dbo].[LocalitateRO]  WITH CHECK ADD  CONSTRAINT [FK_Localitate_Judet] FOREIGN KEY([Judet])
REFERENCES [dbo].[JudetRO] ([JudetID])
GO
ALTER TABLE [dbo].[LocalitateRO] CHECK CONSTRAINT [FK_Localitate_Judet]
GO
ALTER TABLE [dbo].[NomenclatorAdresa]  WITH CHECK ADD  CONSTRAINT [FK_NomenclatorAdresa_Adresa] FOREIGN KEY([AdresaResedinta])
REFERENCES [dbo].[AdresaRO] ([AdresaID])
GO
ALTER TABLE [dbo].[NomenclatorAdresa] CHECK CONSTRAINT [FK_NomenclatorAdresa_Adresa]
GO
ALTER TABLE [dbo].[NomenclatorAdresa]  WITH CHECK ADD  CONSTRAINT [FK_NomenclatorAdresa_Adresa1] FOREIGN KEY([AdresaDomiciliu])
REFERENCES [dbo].[AdresaRO] ([AdresaID])
GO
ALTER TABLE [dbo].[NomenclatorAdresa] CHECK CONSTRAINT [FK_NomenclatorAdresa_Adresa1]
GO
ALTER TABLE [dbo].[NomenclatorAdresa]  WITH CHECK ADD  CONSTRAINT [FK_NomenclatorAdresa_Adresa2] FOREIGN KEY([AdresaCorespondenta])
REFERENCES [dbo].[AdresaRO] ([AdresaID])
GO
ALTER TABLE [dbo].[NomenclatorAdresa] CHECK CONSTRAINT [FK_NomenclatorAdresa_Adresa2]
GO
ALTER TABLE [dbo].[Persoana]  WITH CHECK ADD  CONSTRAINT [FK_Persoana_NomenclatorAdresa] FOREIGN KEY([Adresa])
REFERENCES [dbo].[NomenclatorAdresa] ([NomenID])
GO
ALTER TABLE [dbo].[Persoana] CHECK CONSTRAINT [FK_Persoana_NomenclatorAdresa]
GO
