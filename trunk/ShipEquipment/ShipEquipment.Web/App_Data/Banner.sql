/*
	SQL Server Dumper

	User Interface: SQL Server Dumper  3.0.8
	Script Engine:  SQLDumper.Engine  1.0.8

	Copyright © 2009 Ruizata Project. All Rights Reserved.

	Creation Date:2014-11-07 12:08:59
	Database:`ShipEquipment` 
*/


-- `dbo.Banners`
SET IDENTITY_INSERT dbo.Banners ON

INSERT dbo.Banners (Id, Name, Description, FileName, Active, Target, Url, DisplayOrder) VALUES (1, N'Banner 1', NULL, N'1-banner1.jpg', 1, N'_blank', NULL, 1000)
INSERT dbo.Banners (Id, Name, Description, FileName, Active, Target, Url, DisplayOrder) VALUES (2, N'Banner 2', NULL, N'2-banner2.jpg', 0, N'_blank', NULL, 1000)
INSERT dbo.Banners (Id, Name, Description, FileName, Active, Target, Url, DisplayOrder) VALUES (3, N'Banner 3', NULL, N'3-banner1.jpg', 1, N'_blank', NULL, 1000)
INSERT dbo.Banners (Id, Name, Description, FileName, Active, Target, Url, DisplayOrder) VALUES (4, N'Banner 4', NULL, N'4-banner2.jpg', 1, N'_blank', NULL, 1000)
INSERT dbo.Banners (Id, Name, Description, FileName, Active, Target, Url, DisplayOrder) VALUES (5, N'Banner 5', NULL, N'5-banner1.jpg', 1, N'_blank', NULL, 1000)
SET IDENTITY_INSERT dbo.Banners OFF
GO


SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Alias], [Name], [Description], [Active], [DisplayOrder], [Photo]) VALUES (1, N'nha-cung-cap-1', N'Nhà cung cấp 1', NULL, 1, 1000, N'1-partner1.png')
INSERT [dbo].[Brands] ([Id], [Alias], [Name], [Description], [Active], [DisplayOrder], [Photo]) VALUES (2, N'nha-cung-cap-2', N'Nhà cung cấp 2', N'mô tả nhà cung cấp 2', 1, 1000, N'2-partner2.png')
INSERT [dbo].[Brands] ([Id], [Alias], [Name], [Description], [Active], [DisplayOrder], [Photo]) VALUES (3, N'nha-cung-cap-3', N'Nhà cung cấp 3', N'Mô tả nhà cung cấp 3', 1, 1000, N'3-partner32.png')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO