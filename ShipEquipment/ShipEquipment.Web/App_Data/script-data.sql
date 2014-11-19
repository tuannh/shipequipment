/*
	SQL Server Dumper

	User Interface: SQL Server Dumper  3.0.8
	Script Engine:  SQLDumper.Engine  1.0.8

	Copyright © 2009 Ruizata Project. All Rights Reserved.

	Creation Date:2014-11-20 12:24:36
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


-- `dbo.Brands`
SET IDENTITY_INSERT dbo.Brands ON

INSERT dbo.Brands (Id, [Alias], Name, Description, Active, DisplayOrder, Photo) VALUES (1, N'nha-cung-cap-1', N'Nhà cung cấp 1', NULL, 1, 1000, N'1-partner1.png')
INSERT dbo.Brands (Id, [Alias], Name, Description, Active, DisplayOrder, Photo) VALUES (2, N'nha-cung-cap-2', N'Nhà cung cấp 2', N'mô tả nhà cung cấp 2', 1, 1000, N'2-partner2.png')
INSERT dbo.Brands (Id, [Alias], Name, Description, Active, DisplayOrder, Photo) VALUES (3, N'nha-cung-cap-3', N'Nhà cung cấp 3', N'Mô tả nhà cung cấp 3', 1, 1000, N'3-partner32.png')
SET IDENTITY_INSERT dbo.Brands OFF


-- `dbo.Categories`
SET IDENTITY_INSERT dbo.Categories ON

ALTER TABLE dbo.Categories NOCHECK CONSTRAINT ALL

INSERT dbo.Categories (Id, [Alias], Name, Description, Active, ParentId, DisplayOrder) VALUES (1, N'category-1', N'Category 1', NULL, 1, NULL, 1000)
INSERT dbo.Categories (Id, [Alias], Name, Description, Active, ParentId, DisplayOrder) VALUES (2, N'category-2', N'Category 2', NULL, 1, NULL, 1000)
INSERT dbo.Categories (Id, [Alias], Name, Description, Active, ParentId, DisplayOrder) VALUES (3, N'category-3', N'Category 3', NULL, 1, NULL, 1000)
INSERT dbo.Categories (Id, [Alias], Name, Description, Active, ParentId, DisplayOrder) VALUES (4, N'category-4', N'Category 4', NULL, 1, NULL, 1000)
ALTER TABLE dbo.Categories CHECK CONSTRAINT ALL

SET IDENTITY_INSERT dbo.Categories OFF


-- `dbo.Contents`
SET IDENTITY_INSERT dbo.Contents ON

INSERT dbo.Contents (Id, Name, [Alias], [Value], PageAlias) VALUES (1, N'Liên hệ', N'Liên hệ', N'liên hệ theo số phone', N'lien-he')
SET IDENTITY_INSERT dbo.Contents OFF


-- `dbo.FAQs`
SET IDENTITY_INSERT dbo.FAQs ON

ALTER TABLE dbo.FAQs NOCHECK CONSTRAINT ALL

INSERT dbo.FAQs (Id, Question, Answer, ParentId, Active, DisplayOrder) VALUES (1, N'Đơn hàng nhận được bị thiếu so với đơn hàng đã đặt. Tôi cần làm gì?', N'<p style="margin: 0px 0px 10px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: tahoma, arial, sans-serif; font-size: 12.7272720336914px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 14.4000005722046px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Xin vui l&ograve;ng th&ocirc;ng b&aacute;o c&agrave;ng sớm c&agrave;ng tốt cho Lazada tại <a href="http://www.lazada.vn/contact/" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(0, 70, 137); background: transparent;" target="_blank">www.lazada.vn/contact</a> v&agrave; kh&ocirc;ng qu&aacute; 48h kể từ khi nhận h&agrave;ng để ch&uacute;ng t&ocirc;i c&oacute; thể hỗ trợ kịp thời.</p>

<ul style="margin: 10px 0px 10px 15px; padding: 0px; list-style: none; font-weight: bold; color: rgb(102, 102, 102); font-family: tahoma, arial, sans-serif; font-size: 12.7272720336914px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 14.4000005722046px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
	<li style="margin-top: 0px !important; margin-right: 0px; margin-bottom: 0px; margin-left: 0px !important; padding: 0px; list-style: disc; font-weight: normal;">Trường hợp h&agrave;ng được đ&oacute;ng g&oacute;i th&agrave;nh nhiều kiện hoặc c&oacute; một/một v&agrave;i sản phẩm thuộc gian h&agrave;ng thương nh&acirc;n th&agrave;nh vi&ecirc;n: ch&uacute;ng t&ocirc;i sẽ lưu &yacute; đơn vị vận chuyển giao phần c&ograve;n lại đến qu&yacute; kh&aacute;ch.</li>
	<li style="margin-top: 0px !important; margin-right: 0px; margin-bottom: 0px; margin-left: 0px !important; padding: 0px; list-style: disc; font-weight: normal;">Trường hợp thiếu qu&agrave; khuyến mại/ sản phẩm tặng k&egrave;m: ch&uacute;ng t&ocirc;i sẽ lưu &yacute; kiểm tra v&agrave; giao bổ sung đến qu&yacute; kh&aacute;ch.</li>
	<li style="margin-top: 0px !important; margin-right: 0px; margin-bottom: 0px; margin-left: 0px !important; padding: 0px; list-style: disc; font-weight: normal;">Trường hợp thiếu một phần của đơn h&agrave;ng hoặc một phần sản phẩm trong đơn h&agrave;ng: ch&uacute;ng t&ocirc;i cần thu hồi to&agrave;n bộ đơn h&agrave;ng v&agrave; sẽ gửi lại một đơn h&agrave;ng ho&agrave;n chỉnh kh&aacute;c đến qu&yacute; kh&aacute;ch. Để c&oacute; thể xử l&yacute; việc ho&agrave;n h&agrave;ng một c&aacute;ch nhanh ch&oacute;ng, qu&yacute; kh&aacute;ch vui l&ograve;ng đ&oacute;ng g&oacute;i lại h&agrave;ng h&oacute;a như t&igrave;nh trạng ban đầu với đầy đủ phụ kiện (nếu c&oacute;), c&ugrave;ng với <strong style="margin: 0px; padding: 0px; font-weight: bold;">h&oacute;a đơn mua h&agrave;ng</strong>.</li>
</ul>
', NULL, 1, 1000)
INSERT dbo.FAQs (Id, Question, Answer, ParentId, Active, DisplayOrder) VALUES (2, N'Món hàng nhận được không đúng với sản phẩm đã đặt. Tôi cần làm gì?', N'<p style="margin: 0px 0px 10px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: tahoma, arial, sans-serif; font-size: 12.7272720336914px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 14.4000005722046px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Trong trường hợp qu&yacute; kh&aacute;ch nhận được sản phẩm kh&ocirc;ng đ&uacute;ng với nội dung đ&atilde; đặt trong đơn h&agrave;ng, ch&uacute;ng t&ocirc;i rất lấy l&agrave;m tiếc về nhầm lẫn n&agrave;y, v&agrave; sẽ đổi lại sản phẩm đ&uacute;ng. Xin vui l&ograve;ng th&ocirc;ng b&aacute;o c&agrave;ng sớm c&agrave;ng tốt cho Lazada tại <a href="http://www.lazada.vn/contact/" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(0, 70, 137); background: transparent;" target="_blank">www.lazada.vn/contact</a> v&agrave; kh&ocirc;ng qu&aacute; 48h kể từ khi nhận h&agrave;ng để ch&uacute;ng t&ocirc;i c&oacute; thể hỗ trợ kịp thời.</p>

<p style="margin: 0px 0px 10px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: tahoma, arial, sans-serif; font-size: 12.7272720336914px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 14.4000005722046px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Để c&oacute; thể xử l&yacute; việc ho&agrave;n h&agrave;ng một c&aacute;ch nhanh ch&oacute;ng, qu&yacute; kh&aacute;ch vui l&ograve;ng đ&oacute;ng g&oacute;i lại h&agrave;ng h&oacute;a như t&igrave;nh trạng ban đầu với đầy đủ phụ kiện (nếu c&oacute;), c&ugrave;ng với <strong style="margin: 0px; padding: 0px; font-weight: bold;">h&oacute;a đơn mua h&agrave;ng</strong>.</p>

<p style="margin: 0px 0px 10px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: tahoma, arial, sans-serif; font-size: 12.7272720336914px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 14.4000005722046px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Để đổi trả h&agrave;ng, qu&yacute; kh&aacute;ch vui l&ograve;ng đọc v&agrave; l&agrave;m theo hướng dẫn tại <a href="http://www.lazada.vn/huong-dan-tra-hang/" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(0, 70, 137); background: transparent;" target="_blank">www.lazada.vn/huong-dan-tra-hang</a>.</p>
', NULL, 1, 1000)
INSERT dbo.FAQs (Id, Question, Answer, ParentId, Active, DisplayOrder) VALUES (3, N'Sản phẩm nhận được đã bị nứt vỡ hoặc không hoạt động được. Tôi cần làm gì?', N'<p style="margin: 0px 0px 10px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: tahoma, arial, sans-serif; font-size: 12.7272720336914px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 14.4000005722046px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Trong trường hợp qu&yacute; kh&aacute;ch nhận được sản phẩm vị bể vỡ hoặc kh&ocirc;ng vận h&agrave;nh được, ch&uacute;ng t&ocirc;i rất tiếc về trục trặc ngo&agrave;i &yacute; muốn n&agrave;y, v&agrave; sẽ thay thế sản phẩm kh&aacute;c cho qu&yacute; kh&aacute;ch. Xin vui l&ograve;ng th&ocirc;ng b&aacute;o c&agrave;ng sớm c&agrave;ng tốt cho Lazada tại <a href="http://www.lazada.vn/contact/" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(0, 70, 137); background: transparent;" target="_blank">www.lazada.vn/contact</a> v&agrave; kh&ocirc;ng qu&aacute; 48h kể từ khi nhận h&agrave;ng để ch&uacute;ng t&ocirc;i c&oacute; thể hỗ trợ kịp thời.</p>

<p style="margin: 0px 0px 10px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: tahoma, arial, sans-serif; font-size: 12.7272720336914px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 14.4000005722046px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Để c&oacute; thể xử l&yacute; việc ho&agrave;n h&agrave;ng một c&aacute;ch nhanh ch&oacute;ng, qu&yacute; kh&aacute;ch vui l&ograve;ng đ&oacute;ng g&oacute;i lại h&agrave;ng h&oacute;a như t&igrave;nh trạng ban đầu với đầy đủ phụ kiện (nếu c&oacute;), c&ugrave;ng với <strong style="margin: 0px; padding: 0px; font-weight: bold;">h&oacute;a đơn mua h&agrave;ng</strong>.</p>

<p style="margin: 0px 0px 10px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: tahoma, arial, sans-serif; font-size: 12.7272720336914px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 14.4000005722046px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Để đổi trả h&agrave;ng, qu&yacute; kh&aacute;ch vui l&ograve;ng đọc v&agrave; l&agrave;m theo hướng dẫn tại <a href="http://www.lazada.vn/huong-dan-tra-hang/" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(0, 70, 137); background: transparent;" target="_blank">www.lazada.vn/huong-dan-tra-hang</a>.</p>
', NULL, 1, 1000)
ALTER TABLE dbo.FAQs CHECK CONSTRAINT ALL

SET IDENTITY_INSERT dbo.FAQs OFF


-- `dbo.Pages`
SET IDENTITY_INSERT dbo.Pages ON

INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (1, N'Trang chủ', N'Trang chủ', N'index', 1, 1, NULL, NULL, N'~/Views/Layouts/Index.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (2, N'Sản phẩm', N'Sản phẩm', N'san-pham', 0, 1, NULL, NULL, N'~/Views/Layouts/Product.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (3, N'Tin tức', N'Tin tức', N'tin/tin-tuc', 0, 1, NULL, NULL, N'~/Views/Layouts/Content.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (4, N'Câu thi', N'Câu thi', N'cau-thi', 0, 0, NULL, NULL, NULL)
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (5, N'Hình ảnh & clip', N'Hình ảnh & clip', N'hinh-anh-clip', 0, 1, NULL, NULL, N'~/Views/Layouts/Content.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (6, N'Hướng dẫn', N'Hướng dẫn', N'huong-dan', 0, 1, NULL, NULL, N'~/Views/Layouts/Content.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (7, N'FAQs', N'FAQs', N'faqs', 0, 1, NULL, NULL, N'~/Views/Layouts/Content.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (8, N'Liên hệ', N'Liên hệ', N'lien-he', 0, 1, NULL, NULL, N'~/Views/Layouts/Content.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (9, N'Sản phẩm đặc biệt & Khuyến mãi', N'Sản phẩm đặc biệt & Khuyến mãi', N'khuyen-mai', 0, 1, NULL, NULL, N'~/Views/Layouts/Content.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (10, N'Chi tiết sản phẩm', N'Chi tiêt sản phẩm', N'chi-tiet-san-pham', 0, 0, NULL, NULL, N'~/Views/Layouts/Content.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (11, N'Giỏ hàng', N'Giỏ hàng', N'gio-hang', 0, 0, NULL, NULL, N'~/Views/Layouts/Content.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (12, N'Chi tiết hưỡng dân', N'Chi tiết hướng dẫn', N'chi-tiet-huong-dan', 0, 0, NULL, NULL, N'~/Views/Layouts/Content.cshtml')
SET IDENTITY_INSERT dbo.Pages OFF


-- `dbo.Provinces`

-- `dbo.UserGuides`
SET IDENTITY_INSERT dbo.UserGuides ON

INSERT dbo.UserGuides (Id, [Alias], Name, Summary, Content, Active, DisplayOrder, Photo) VALUES (1, N'huong-dan-mua-hang', N'Hướng Dẫn Mua Hàng', 'CÁC BU?C Ð?T MUA HÀNG QUA INTERNET
CÁC BU?C Ð?T MUA HÀNG QUA online', '<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><strong><u><span style="font-size: 14px;">1.&nbsp;C&Aacute;C BU?C Ð?T MUA H&Agrave;NG QUA INTERNET</span></u></strong></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><strong><span style="background-color: rgb(255, 255, 255);"><span style="color: rgb(255, 0, 0);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Luu &yacute;</span></span></span></span></strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">: Ð? d?t mua h&agrave;ng qua Internet, b?n ph?i dang k&yacute; th&agrave;nh vi&ecirc;n c?a Website Ð? C&acirc;u Qu?nh Chi.</span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Bu?c 1</span></span></span></strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">: Ch?n s?n ph?m b?n quan t&acirc;m d? xem c&aacute;c th&ocirc;ng tin v? s?n ph?m.</span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Bu?c 2</span></span></span></strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">: Khi mu?n mua s?n ph?m n&agrave;o nh?n chu?t v&agrave;o n&uacute;t &ldquo;Mua h&agrave;ng&rdquo;, h? th?ng s? dua s?n ph?m b?n ch?n v&agrave;o gi? h&agrave;ng. B?n c&oacute; th? tang s? lu?ng cho s?n ph?m v?a ch?n ho?c ti?p t?c ch?n th&ecirc;m s?n ph?m kh&aacute;c.</span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Bu?c 3</span></span></span></strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">: Khi d&atilde; ch?n d? h&agrave;ng, vui l&ograve;ng di?n c&aacute;c th&ocirc;ng tin c?a b?n d? ch&uacute;ng t&ocirc;i ti?n li&ecirc;n h?.</span><br />
<br />
<strong><span style="color: rgb(255, 0, 0);"><span style="font-size: 14px;">Luu &yacute;</span></span></strong><span style="color: rgb(255, 0, 0);"><span style="font-size: 14px;">:&nbsp;<em>M?t s? m?t h&agrave;ng c&oacute; nhi?u d? d&agrave;i, k&iacute;ch c?, hay m&agrave;u s?c&nbsp;kh&aacute;c nhau, b?n vui l&ograve;ng ghi r&otilde; chi ti?t c?a s?n ph?m v&agrave;o m?c &ldquo;Th&ocirc;ng tin chi ti?t v? s?n ph?m c?n mua&rdquo;</em>.</span></span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Bu?c 4</span></span></span></strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">: Nh?n n&uacute;t &ldquo;Thanh To&aacute;n&rdquo; d? g?i don h&agrave;ng. Ch&uacute;ng t&ocirc;i s? tr? l?i qua email ho?c tr?c ti?p qua di?n tho?i ngay sau khi nh?n du?c th&ocirc;ng tin c?a b?n d? x&aacute;c nh?n don d?t h&agrave;ng.</span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Th?i gian ki?m tra v&agrave; x&aacute;c nh?n don h&agrave;ng v&agrave;o c&aacute;c bu?i s&aacute;ng trong tu?n ( t?t c? c&aacute;c don h&agrave;ng g?i d?n v&agrave;o bu?i chi?u s? du?c ki?m tra v&agrave; x&aacute;c nh?n v&agrave;o s&aacute;ng ng&agrave;y h&ocirc;m sau ).</span><br />
<br />
<br />
<strong><u><span style="font-size: 14px;">2.&nbsp;C&Aacute;CH TH?C GIAO H&Agrave;NG</span></u></strong></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Gi&aacute; ti?n c?a s?n ph?m l&agrave; gi&aacute; giao h&agrave;ng t?i c?a h&agrave;ng Ð? C&acirc;u Qu?nh Chi.</span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Ch&uacute;ng t&ocirc;i giao h&agrave;ng mi?n ph&iacute; v?n chuy?n v?i di?u ki?n sau:<br />
Ðon h&agrave;ng tr? gi&aacute; tr&ecirc;n 300,000VNÐ v&agrave; kho?ng c&aacute;ch giao h&agrave;ng du?i 5km t&iacute;nh t? trung t&acirc;m th&agrave;nh ph? H&agrave; N?i.</span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Ngo&agrave;i di?u ki?n tr&ecirc;n, kh&aacute;ch h&agrave;ng thanh to&aacute;n th&ecirc;m chi ph&iacute; v?n chuy?n.</span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(255, 0, 0);"><span style="font-family: Verdana; font-size: 14px;">H&agrave;ng mua r?i kh&ocirc;ng ho&agrave;n tr? l?i du?c.</span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><strong><u><span style="font-size: 14px;">3.&nbsp;&nbsp; PHUONG TH?C THANH TO&Aacute;N &ndash; Ð?A CH? NG&Acirc;N H&Agrave;NG</span></u></strong></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">A.&nbsp;Thanh to&aacute;n tr?c ti?p: V?i kho?ng c&aacute;ch giao h&agrave;ng du?i 5km t&iacute;nh t? C?a H&agrave;ng Ð? C&acirc;u Qu?nh Chi, qu&yacute; kh&aacute;ch c&oacute; th? thanh to&aacute;n tr?c ti?p khi nh?n h&agrave;ng.<br />
B.&nbsp;Thanh to&aacute;n qua t&agrave;i kho?n ng&acirc;n h&agrave;ng: Qu&yacute; kh&aacute;ch c&oacute; th? &nbsp;thanh to&aacute;n qua t&agrave;i kho?n ng&acirc;n h&agrave;ng c?a Ð? C&acirc;u Qu?nh Chi du?i d&acirc;y.<br />
<br />
<span style="color: rgb(255, 0, 0);"><strong>. Ng&acirc;n H&agrave;ng N&ocirc;ng Nghi?p v&agrave; Ph&aacute;t Tri?n N&ocirc;ng Th&ocirc;n Ho&agrave;n Ki?m ( Agribank Ho&agrave;n Ki?m )<br />
. Ch? t&agrave;i kho?n: Cung B&igrave;nh Minh<br />
. S? t&agrave;i kho?n: 1502205129895</strong></span></span></span></span></p>', 1, 1000, N'1-attention_shutterstock_600x553.jpg')
INSERT dbo.UserGuides (Id, [Alias], Name, Summary, Content, Active, DisplayOrder, Photo) VALUES (2, N'noi-quy-can-thu', N'Nội quy CẦN THỦ', 'Chuyên m?c “Góc C?n Th?” do thành viên s? d?ng tài kho?n t?i Ð? Câu Qu?nh Chi dang t?i, nh?m chia s? thông tin, ki?n th?c, nh?ng câu chuy?n, c?m xúc, quan di?m riêng c?a “C?n th?”. ÐCQC không ch?u b?t c? trách nhi?m v? b?n quy?n và nghia v? pháp lý c?a các n?i dung này.', '<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: center; background-color: rgb(222, 194, 131);"><span style="color: rgb(255, 0, 0);"><span style="font-size: 16px;"><strong><span style="font-family: Verdana;">N?I QUY THAM GIA CHUY&Ecirc;N M?C G&Oacute;C C?N TH?</span></strong></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Chuy&ecirc;n m?c &ldquo;<span style="color: rgb(51, 102, 255);">G&oacute;c C?n Th?</span>&rdquo; do th&agrave;nh vi&ecirc;n s? d?ng t&agrave;i kho?n t?i Ð? C&acirc;u Qu?nh Chi dang t?i, nh?m chia s? th&ocirc;ng tin, ki?n th?c, nh?ng c&acirc;u chuy?n, c?m x&uacute;c, quan di?m ri&ecirc;ng c?a &ldquo;C?n th?&rdquo;. Ð? C&acirc;u Qu?nh Chi kh&ocirc;ng ch?u b?t c? tr&aacute;ch nhi?m v? b?n quy?n v&agrave; nghia v? ph&aacute;p l&yacute; c?a c&aacute;c n?i dung&nbsp;n&agrave;y.<br />
<br />
T?t c? c&aacute;c n?i dung tham gia chuy&ecirc;n m?c y&ecirc;u c?u:<br />
<br />
<span style="color: rgb(255, 0, 0);">1.&nbsp;Kh&ocirc;ng vi ph?m ph&aacute;p lu?t nu?c CHXHCN Vi?t Nam.<br />
2.&nbsp;Kh&ocirc;ng li&ecirc;n quan d?n ch&iacute;nh tr?, t&ocirc;n gi&aacute;o.<br />
3.&nbsp;Kh&ocirc;ng tr&aacute;i v?i thu?n phong, m? t?c Vi?t Nam.<br />
4.&nbsp;Kh&ocirc;ng d? k&iacute;ch, lang m? ngu?i kh&aacute;c.<br />
5.&nbsp;Kh&ocirc;ng qu?y r?i, g&acirc;y phi?n nhi?u, ho?c de d?a d?n s? an to&agrave;n v&agrave; t&agrave;i s?n c?a ngu?i kh&aacute;c.<br />
6.&nbsp;Kh&ocirc;ng vu kh?ng, n&oacute;i sai s? th?t, l&agrave;m m?t danh d?, ho?c m?o nh?n m?t ai d&oacute;.<br />
7.&nbsp;Kh&ocirc;ng dang c&aacute;c qu?ng c&aacute;o kinh doanh thuong m?i.<br />
8.&nbsp;T&ocirc;n tr?ng nh?ng ngu?i c&ugrave;ng tham gia.<br />
9.&nbsp;T?t c? c&aacute;c do?n ng&ocirc;n ng? m&aacute;y t&iacute;nh v&agrave; du?ng link d?u b?t bu?c ki?m duy?t.</span><br />
<br />
Ð? C&acirc;u Qu?nh Chi c&oacute; quy?n t? ch?i ho?c x&oacute;a b? b?t c? n?i dung n&agrave;o kh&ocirc;ng ph&ugrave; h?p v?i c&aacute;c quy d?nh n&oacute;i tr&ecirc;n, d?ng th?i c&oacute; th? d&igrave;nh ch? hay kh&oacute;a ho&agrave;n to&agrave;n t&agrave;i kho?n c?a n?i dung d&oacute; n?u ph&aacute;t hi?n vi ph?m.</span></span></span></strong></p>', 1, 1000, N'2-new2.jpg')
SET IDENTITY_INSERT dbo.UserGuides OFF


-- `dbo.Videos`

-- `dbo.Districts`

-- `dbo.NewsArticles`
SET IDENTITY_INSERT dbo.NewsArticles ON

INSERT dbo.NewsArticles (Id, Title, [Alias], Summary, Content, Active, DisplayOrder, CategoryId, Photo, CreatedDate, UpdatedDate) VALUES (1, N'test', N'test', 'H? h?u h?t dã ? t?m tu?i 70, 80. Ngày ngày, t? sáng tinh mo cho d?n chi?u tà, h? chèo ch?ng trên chi?c thuy?n nh? hay ôm c?n câu d?ng trên c?u Nh?t L? (Qu?ng Bình). V?a là thú vui v?a d? rèn luy?n s?c kh?e, và cung không ít ngu?i di câu là d? th?a n?i nh? m?t th?i tu?i thanh xuân v?i ngh? sông nu?c...', '<p>L&atilde;o ngu Nguy?n Th? Qu&aacute;n (80 tu?i) t?ng l&agrave; th&agrave;nh vi&ecirc;n c?a Ð?i d&aacute;nh c&aacute; n? Minh Khai n?i ti?ng m?t th?i. Nh?ng l&atilde;o ngu say ngh?</p>

<p>B?t d?u t? s&aacute;ng tinh mo, nh?ng thuy?n c&acirc;u nh? neo b&ecirc;n b? s&ocirc;ng Nh?t L? b?t d?u boi ra gi?a d&ograve;ng. Ch? nh&acirc;n c?a nh?ng chi?c thuy?n c&acirc;u ?y kh&ocirc;ng ai kh&aacute;c ch&iacute;nh l&agrave; c&aacute;c &ocirc;ng gi&agrave;, b&agrave; l&atilde;o d&atilde; ? tu?i xua nay hi?m...</p>

<p>Ng?i tr&ecirc;n chi?c thuy?n c&acirc;u, n? l&atilde;o ngu Nguy?n Th? Th&ograve;a (68 tu?i) cu?i r?n r&agrave;ng, k?: M? tui d? tui ngo&agrave;i bi?n. L?n l&ecirc;n 12 tu?i th&igrave; b?t d?u di bi?n cho d?n 3 nam l?i d&acirc;y, tui m?i v&ocirc; di c&acirc;u ? s&ocirc;ng. L&agrave;m ngh? chi say ngh?, o &agrave;! Nhi?u h&ocirc;m, k&eacute;o c&acirc;u l&ecirc;n, du?c c&aacute;, d&atilde; c&aacute;i tay l?m! Ng?i m&atilde;i ch?ng mu?n v? nh&agrave;.</p>

<p>N&oacute;i xong, b&agrave; Th&ograve;a t?m bi?t t&ocirc;i r?i c&ugrave;ng ch?ng l&agrave; l&atilde;o ngu Nguy?n Th?o (75 tu?i) ch&egrave;o ngu?c ra ph&iacute;a c?a bi?n. Ngu?c gi&oacute;, con nu?c dang l&ecirc;n, nhi?u l&uacute;c h? ph?i g?ng m&igrave;nh d? ch?ng ch?i v?i nh?ng con s&oacute;ng l?n. Ð?n m?t kh&uacute;c s&ocirc;ng, h? bu&ocirc;ng ch&egrave;o v&agrave; b?t d?u th? c&acirc;u. L&agrave;m du?c m?t l&uacute;c l?i ch&egrave;o thuy?n qua kh&uacute;c s&ocirc;ng kh&aacute;c. C? th? xoay v&ograve;ng t? Ph&uacute; H?i ra d?n c?a bi?n.</p>

<p>Trua, thuy?n c&acirc;u c?a v? ch?ng l&atilde;o ngu Ph?m K&igrave;nh (78 tu?i) v&agrave; Nguy?n Ki&ecirc;n (74 tu?i) c?p b?n ch? Ð?ng H?i. C? b&agrave; Nguy?n Ki&ecirc;n bung r? c&aacute; s&ocirc;ng tuoi r&oacute;i, l?p l&aacute;nh &aacute;nh b?c, nhi?u ch&uacute; c&aacute; v?n c&ograve;n nh?y l&oacute;c ch&oacute;c trong r?. C? b?o: C&aacute; v?a c&acirc;u l&ecirc;n mang ra ch? b&aacute;n ngay, kh&ocirc;ng c&oacute; h&oacute;a ch?t chi c?. Gi? h? ung an c&aacute; ni n&ecirc;n c&oacute; gi&aacute; l?m!</p>

<p>T? s&aacute;ng s?m, c&aacute;c c? b&agrave; d&atilde; chen ch&acirc;n di mua m?i c&acirc;u. C&aacute;i ngh? ni cung d&ograve;i h?i kh?t khe l?m! M?i c&acirc;u l&agrave; con t&ocirc;m nh?, ch? nh?nh hon tam xe m&aacute;y v&agrave; ph?i dang c&ograve;n s?ng, c&aacute; m?i ch?u an. M?i d?n 20 ngh&igrave;n/l?ng, m&agrave; mua c&oacute; d? m&ocirc; o, l&atilde;o ngu Nguy?n Th? Di?u (82 tu?i) cho bi?t. C&acirc;u ?ng ch? c?n 1 ngu?i, nhung c&acirc;u b?a, c&acirc;u ch?ng ph?i c&oacute; 2 ngu?i m?i l&agrave;m n?i: ngu?i ch&egrave;o thuy?n, ngu?i b?a c&acirc;u. Ng&agrave;y g?p c&aacute;, c&oacute; h&ocirc;m l&agrave;m du?c v&agrave;i ba d?n nam tram ngh&igrave;n, nhung khi nu?c &ldquo;uong&rdquo; th&igrave; ch? du?c dam ba ch?c ngh&igrave;n th&ocirc;i. V&igrave; th?, ngu?i s?ng b?ng ngh? ch&agrave;i lu?i, c&acirc;u k&eacute;o ph?i hi?u quy lu?t c?a con nu?c d? t?n d?ng tang nang su?t, hi?u qu?.</p>

<p>Nh?ng khi nu?c l&ecirc;n, nu?c xu?ng, c&aacute; r?t hay an. Con nu?c sinh trong v&ograve;ng 14 ng&agrave;y. M?i th&aacute;ng c&oacute; 2 con nu?c, ri&ecirc;ng th&aacute;ng 2 v&agrave; th&aacute;ng 8 (&acirc;m l?ch) th&igrave; c&oacute; 3 con nu?c. Ba ng&agrave;y d?u khi con nu?c m?i sinh, nu?c xu?ng s?m. T? d&oacute; d?n khi m&atilde;n con nu?c th&igrave; chuy?n sang trua, chi?u, t?i... v&agrave; c? th? quay v&ograve;ng sang con nu?c kh&aacute;c, r?t r&agrave;nh r?, l&atilde;o ngu Ho&agrave;ng Ng?c L&agrave;nh (68 tu?i) chia s? v?i t&ocirc;i.</p>

<p>&Ocirc;ng L&agrave;nh hi?n l&agrave; Chi h?i tru?ng Chi h?i Ngu?i cao tu?i c?a th&ocirc;n Ð?ng Duong, x&atilde; B?o Ninh (TP. Ð?ng H?i). &Ocirc;ng b?o: Ri&ecirc;ng th&ocirc;n &ocirc;ng, c&oacute; 15 c? c&ograve;n tham gia s?n xu?t tr&ecirc;n bi?n, tr&ecirc;n s&ocirc;ng. ? th&ocirc;n M? C?nh, s? n&agrave;y c&ograve;n nhi?u n?a.</p>

<p>C&ocirc; con d&acirc;u c? c?a c? Nguy?n Th? C?m (78 tu?i) k?: &Ocirc;ng b&agrave; say ngh? l?m, ng&agrave;y n&agrave;o cung di l&agrave;m. G?n 80 tu?i r?i nhung chua m?t l?n ng? tay xin ti?n con, th?m ch&iacute; l&uacute;c con c&aacute;i l&agrave;m nh&agrave;, &ocirc;ng b&agrave; c&ograve;n cho ti?n n?a. N&oacute;i th?t, &ocirc;ng b&agrave; di nhu v?y b?n t&ocirc;i cung lo l?m, nhung b?o ngh? &ocirc;ng b&agrave; kh&ocirc;ng ch?u, ?m cung d&ograve;i di cho du?c. C? C?m cu?i, v?i ph&acirc;n bua: T&iacute;nh hay l&agrave;m quen r?i, kh&ocirc;ng di ch?u kh&ocirc;ng n?i. Ði l&agrave;m cung l&agrave; d? r&egrave;n luy?n s?c kh?e, ng?i ? nh&agrave; bu?n, l?i kh&ocirc;ng v?n d?ng n?a d? ?m l?m!.</p>

<p>V&agrave; k&yacute; ?c h&agrave;o h&ugrave;ng</p>

<p>Nh?ng ng&agrave;y tr?i h?ng n?ng, ngu?i ta l?i th?y m?t c? b&agrave; v?i m&aacute;i t&oacute;c tr?ng nhu cu?c, mi?ng b?m b?m nhai tr?u v&agrave; khoan thai d?ng c&acirc;u c&aacute; tr&ecirc;n c?u Nh?t L?. C? t&ecirc;n l&agrave; Nguy?n Th? Qu&aacute;n, ? th&ocirc;n M? C?nh (x&atilde; B?o Ninh), nam nay d&atilde; 80 tu?i. M?i d?p di qua, t&ocirc;i gh&eacute; l?i chuy?n tr&ograve;. Ð?a con duy nh?t c?a c? di xu?t kh?u lao d?ng d&atilde; l&acirc;u chua v?. Khi n&agrave;o nh? con, c? l?i x&aacute;ch c?n ra d&acirc;y cho khu&acirc;y kh?a...</p>', 1, 1000, 1, N'1-new1.jpg', '20141109 12:09:19', '20141109 19:16:37.27')
INSERT dbo.NewsArticles (Id, Title, [Alias], Summary, Content, Active, DisplayOrder, CategoryId, Photo, CreatedDate, UpdatedDate) VALUES (2, N'CÂU CÁ ĐÊM Ở TRƯỜNG SA', N'cau-ca-dem-o-truong-sa', 'M?i chuy?n tàu ra v?i qu?n d?o Tru?ng Sa, các th?y th? không b? l? co h?i buông câu và hò reo khi b?t du?c cá l?n. Câu dêm v?i h? không ch? là thú vui mà còn giúp c?i thi?n b?a com ngu?i lính', '<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">N? chi?n binh c&oacute; b&iacute; danh Rehana du?c ca ng?i l&agrave; bi?u tu?ng c?a ni?m hy v?ng cho Kobani, th? tr?n Syria dang b? IS d&aacute;nh chi?m. C&ocirc; tr? n&ecirc;n n?i ti?ng sau khi m?t nh&agrave; b&aacute;o dang b?c ?nh c?a c&ocirc; tr&ecirc;n m?ng x&atilde; h?i Twitter v&agrave; cho bi?t&nbsp;<span style="margin: 0px; padding: 0px;">Rehana&nbsp;</span><span style="margin: 0px; padding: 0px;">d&atilde; t? tay ti&ecirc;u di?t 100 chi?n binh IS.</span></p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">Nh?ng tuy&ecirc;n truy?n vi&ecirc;n tr&ecirc;n m?ng x&atilde; h?i c?a phi?n qu&acirc;n H?i gi&aacute;o m?i d&acirc;y ph&aacute;t t&aacute;n m?t b?c h&igrave;nh gh&ecirc; r?n, trong d&oacute; m?t chi?n binh IS gio cao chi?c d?u b? c?t d?t du?c cho l&agrave; c?a Rehana.&nbsp;<span style="margin: 0px; padding: 0px;">Tuy nhi&ecirc;n, Ðon v? B?o v? Nh&acirc;n d&acirc;n (YPG) v&agrave; Ðon v? Chi?n d?u c?a N? gi?i (YPJ), l?c lu?ng ngu?i Kurd ? Syria m&agrave; c&ocirc; tham gia hi?n chua dua ra tuy&ecirc;n b? v? v? vi?c n&agrave;y.</span></p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">C&aacute;c n? chi?n binh d&oacute;ng m?t vai tr&ograve; quan tr?ng trong cu?c chi?n ti&ecirc;u di?t IS t?i Kobani. Ðon v? vu trang to&agrave;n n? gi?i c?a ngu?i Kurd du?c th&agrave;nh l?p h?i th&aacute;ng 4 v&agrave; u?c t&iacute;nh c&oacute; kho?ng 10.000 th&agrave;nh vi&ecirc;n. Ph?n l?n c&aacute;c n? chi?n binh du?c hu?n luy?n l&agrave;m l&iacute;nh b?n t?a.</p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;"><span style="margin: 0px; padding: 0px;">C&ocirc; g&aacute;i l?y t&ecirc;n Arin Mirkan h?i d?u th&aacute;ng d&aacute;nh bom t? s&aacute;t ngo&agrave;i Kobani, gi?t ch?t 10 tay s&uacute;ng IS. Nh&oacute;m Gi&aacute;m s&aacute;t Nh&acirc;n quy?n Syria tru?c d&oacute; cho bi?t phi?n qu&acirc;n H?i gi&aacute;o d&atilde; ch?t d?u 9 chi?n binh ngu?i Kurd, trong d&oacute; c&oacute; ba ph? n?.</span></p>', 1, 1000, 1, NULL, '20141109 17:03:23', '20141109 18:06:30.107')
INSERT dbo.NewsArticles (Id, Title, [Alias], Summary, Content, Active, DisplayOrder, CategoryId, Photo, CreatedDate, UpdatedDate) VALUES (3, N'QUÁI NGƯ TRÊN SÔNG MÊ KÔNG', N'quai-ngu-tren-song-me-kong', 'Các loài cá tra d?u,cá hô… kh?ng l? c?a dòng sông Mê Kông dang d?ng bên b? v?c tuy?t ch?ng do tình tr?ng dánh b?t quá m?c c?a ngu?i dân.', '<div>&nbsp;</div>

<div>
<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="margin: 0px auto 10px; padding: 0px; max-width: 100%; font-family: arial; font-size: 13.63636302948px; line-height: normal; width: 480px;">
	<tbody style="margin: 0px; padding: 0px;">
		<tr style="margin: 0px; padding: 0px;">
			<td style="margin: 0px; padding: 0px; line-height: 0;"><img alt="RTR3JCN7-8961-1414295025.jpg" data-natural-="" data-pwidth="480" data-width="499" src="http://m.f29.img.vnecdn.net/2014/10/26/RTR3JCN7-8961-1414295025.jpg" style="margin: 0px; padding: 0px; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 480px;" /></td>
		</tr>
		<tr style="margin: 0px; padding: 0px;">
			<td style="margin: 0px; padding: 0px; line-height: 0;">
			<p class="Image" style="margin: 0px; padding: 10px; line-height: normal; font-stretch: normal; font-size: 12px; background: rgb(245, 245, 245);">M?t nh&oacute;m n? sinh m?c &aacute;o&nbsp;den tr&ugrave;m k&iacute;n ngu?i di l?i tr&ecirc;n du?ng ph?&nbsp;Raqqa,&nbsp;th&agrave;nh tr&igrave; c?a IS ? Syria. ?nh:&nbsp;<em style="margin: 0px; padding: 0px;">Al-monitor</em></p>
			</td>
		</tr>
	</tbody>
</table>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">Theo&nbsp;<em style="margin: 0px; padding: 0px;">IBTimes,&nbsp;</em><span style="margin: 0px; padding: 0px;">IS de d?a x? t? nh?ng th?y gi&aacute;o d?y h?c cho n? sinh t?i v&ugrave;ng ch&uacute;ng ki?m so&aacute;t.&nbsp;</span>N<span style="margin: 0px; padding: 0px;">h&agrave; ho?t d?ng l?y t&ecirc;n Abu Wart t?i Raqqa, Syria cho bi?t nhi?u gia d&igrave;nh t?i khu v?c IS chi?m d&oacute;ng d&atilde; d? con c&aacute;i h?c ri&ecirc;ng ? nh&agrave;, nh?m tr&aacute;nh nh?ng lu?t l? h&agrave; kh?c nh&oacute;m n&agrave;y d?t ra. Tuy nhi&ecirc;n, di?u n&agrave;y l?i l&agrave;m d?y l&ecirc;n m?t m?i de d?a d&aacute;ng s?. Nh?ng gi&aacute;o vi&ecirc;n d?y h?c ri&ecirc;ng cho c&aacute;c n? sinh c&oacute; nguy co b? h&agrave;nh quy?t.</span></p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;"><span style="margin: 0px; padding: 0px;">Theo Abu Wart, I</span><span style="margin: 0px; padding: 0px;">S thu?ng de d?a tr?ng ph?t&nbsp;</span><span style="margin: 0px; padding: 0px;">c&aacute;c gi&aacute;o vi&ecirc;n kh&ocirc;ng cho nam sinh v&agrave; n? sinh h?c ri&ecirc;ng. IS c&ograve;n t?ch thu nh?ng cu?n s&aacute;ch v&agrave; t&agrave;i li?u ch&uacute;ng cho l&agrave; phi ph&aacute;p. &quot;T&ocirc;i c&oacute; nhi?u s&aacute;ch tri?t h?c v&agrave; l?ch s?, nhung t&ocirc;i ph?i gi?u ch&uacute;ng di&quot;, Wart n&oacute;i th&ecirc;m.</span></p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">IS cung de d?a tr?ng ph?t n?ng c&aacute;c gi&aacute;o vi&ecirc;n gi?ng d?y b?t c? m&ocirc;n g&igrave; n?m ngo&agrave;i lu?t l? c?a nh&oacute;m. Ngu?i d&acirc;n s?ng du?i s? cai tr? c?a IS ? Mosul, Iraq v&agrave; Raqqa, Syria b? c?m s? h?u s&aacute;ch h?c thu?t v&agrave; nghi&ecirc;n c?u v? ph&aacute;p lu?t, nh&acirc;n quy?n. Nh&oacute;m c?c doan cung c?m vi?c d?y h?c cho tr? em t?i nh&agrave;.</p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">Tu?n n&agrave;y, khi c&aacute;c tru?ng d?i h?c b?t d?u ni&ecirc;n kh&oacute;a m?i, IS ra l?nh d&oacute;ng c?a c&aacute;c khoa m? thu?t, khoa h?c ch&iacute;nh tr?,&nbsp;<span style="margin: 0px; padding: 0px;">lu?t,&nbsp;</span><span style="margin: 0px; padding: 0px;">kh?o c? h?c, gi&aacute;o d?c, th? thao, tri?t h?c, du l?ch v&agrave; qu?n l&yacute; kh&aacute;ch s?n trong khu v?c nh&oacute;m ki?m so&aacute;t.</span></p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">T?i Mosul v&agrave; Raqqa, IS ra l?nh cho gi&aacute;o vi&ecirc;n kh&ocirc;ng d?y nh?ng m&ocirc;n nhu d&acirc;n ch?, gi&aacute;o d?c van h&oacute;a, nh&acirc;n quy?n v&agrave; ph&aacute;p lu?t, d? duy tr&igrave; c&aacute;i g?i l&agrave; &quot;x&atilde; h?i t?t d?p&quot;.</p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">Gi&aacute;o vi&ecirc;n ph?i h?c lu?t l? c?a IS, v&agrave; b? y&ecirc;u c?u b? m?t s? m&ocirc;n trong chuong tr&igrave;nh h?c v&agrave; thi c? &quot;kh&ocirc;ng ph&ugrave; h?p v?i lu?t l? H?i gi&aacute;o&quot;. Trong d&oacute; c&oacute; &quot;h?c thuy?t l?i th?i gi? d?i&quot;, c&aacute;ch nh&oacute;m c?c doan g?i thuy?t ti?n h&oacute;a b?ng ch?n l?c t? nhi&ecirc;n c?a Darwin v&agrave; &quot;c&aacute;ch ph&acirc;n d?nh d?a l&yacute; kh&ocirc;ng ph&ugrave; h?p v?i H?i gi&aacute;o&quot; c?a c&aacute;c qu?c gia kh&aacute;c.</p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">Sinh vi&ecirc;n c?a tru?ng Ð?i h?c Mosul tu?n qua du?c ph&eacute;p ra ngo&agrave;i v&ugrave;ng IS ki?m so&aacute;t d? tham d? k? thi nam cu?i nam ? v&ugrave;ng Kurdistan, Iraq. C&aacute;c m&ocirc;n thi n&agrave;y ph?i nh?n du?c s? ph&ecirc; duy?t t? nh&oacute;m.</p>
</div>', 1, 1000, 1, NULL, '20141109 17:06:37', '20141109 18:06:37.8')
SET IDENTITY_INSERT dbo.NewsArticles OFF


-- `dbo.Products`
SET IDENTITY_INSERT dbo.Products ON

INSERT dbo.Products (Id, Name, [Alias], Code, ShortDescription, Description, Active, Price, SalePrice, MadeIn, DislayOrder, CategoryId, BrandId, Type) VALUES (1, N'Sản phẩm 1', N'san-pham-1', N'SP1', N'Sản phẩm 1 mô tả', N'Sản phẩm 1 m&ocirc; tả Sản phẩm 1 m&ocirc; tảSản phẩm 1 m&ocirc; tảSản phẩm 1 m&ocirc; tảSản phẩm 1 m&ocirc; tảSản phẩm 1 m&ocirc; tảSản phẩm 1 m&ocirc; tảSản phẩm 1 m&ocirc; tảSản phẩm 1 m&ocirc; tả', 1, 100000, 0, N'Made in VN', 1000, 1, 1, 1)
INSERT dbo.Products (Id, Name, [Alias], Code, ShortDescription, Description, Active, Price, SalePrice, MadeIn, DislayOrder, CategoryId, BrandId, Type) VALUES (2, N'Sản phẩm 2', N'san-pham-2', N'SP2', N'Mô tả sản phẩm 2', N'M&ocirc; tả sản phẩm 2 M&ocirc; tả sản phẩm 2 M&ocirc; tả sản phẩm 2 M&ocirc; tả sản phẩm 2 M&ocirc; tả sản phẩm 2 M&ocirc; tả sản phẩm 2 M&ocirc; tả sản phẩm 2 M&ocirc; tả sản phẩm 2 M&ocirc; tả sản phẩm 2 M&ocirc; tả sản phẩm 2 M&ocirc; tả sản phẩm 2 M&ocirc; tả sản phẩm 2', 1, 500000, 0, N'Made in Japan', 1000, 1, 1, 1)
INSERT dbo.Products (Id, Name, [Alias], Code, ShortDescription, Description, Active, Price, SalePrice, MadeIn, DislayOrder, CategoryId, BrandId, Type) VALUES (3, N'Sản phẩm 3', N'san-pham-3', N'SP3', N'Mô tả sản phẩm 3', N'M&ocirc; tả đầy đủ M&ocirc; tả đầy đủ M&ocirc; tả đầy đủ M&ocirc; tả đầy đủ M&ocirc; tả đầy đủ M&ocirc; tả đầy đủ', 1, 1e+006, 0, N'Made in USA', 1000, 2, 2, 1)
INSERT dbo.Products (Id, Name, [Alias], Code, ShortDescription, Description, Active, Price, SalePrice, MadeIn, DislayOrder, CategoryId, BrandId, Type) VALUES (4, N'Sản phẩm 4', N'san-pham-4', N'SP4', N' Mô tả ngắn', N'<label class="control-label col-md-2" for="ShortDescription">M&ocirc; tả ngắn</label> <label class="control-label col-md-2" for="ShortDescription">M&ocirc; tả ngắn</label> <label class="control-label col-md-2" for="ShortDescription">M&ocirc; tả ngắn</label> <label class="control-label col-md-2" for="ShortDescription">M&ocirc; tả ngắn</label> <label class="control-label col-md-2" for="ShortDescription">M&ocirc; tả ngắn</label> <label class="control-label col-md-2" for="ShortDescription">M&ocirc; tả ngắn</label> <label class="control-label col-md-2" for="ShortDescription">M&ocirc; tả ngắn</label>', 1, 600000, 0, NULL, 1000, 3, 3, 1)
SET IDENTITY_INSERT dbo.Products OFF


-- `dbo.ProductPhotoes`
SET IDENTITY_INSERT dbo.ProductPhotoes ON

INSERT dbo.ProductPhotoes (Id, Title, FileName, DisplayOrder, ProductId) VALUES (1, N'IMG_1444.JPG', N'1-Photo635518618635297227.JPG', 1000, 1)
INSERT dbo.ProductPhotoes (Id, Title, FileName, DisplayOrder, ProductId) VALUES (2, N'IMG_1475.JPG', N'1-Photo635518618635447793.JPG', 1000, 1)
INSERT dbo.ProductPhotoes (Id, Title, FileName, DisplayOrder, ProductId) VALUES (3, N'IMG_1484.JPG', N'2-Photo635518619297232096.JPG', 1000, 2)
INSERT dbo.ProductPhotoes (Id, Title, FileName, DisplayOrder, ProductId) VALUES (4, N'IMG_1475.JPG', N'2-Photo635518619297362067.JPG', 1000, 2)
INSERT dbo.ProductPhotoes (Id, Title, FileName, DisplayOrder, ProductId) VALUES (5, N'IMG_1471.JPG', N'2-Photo635518619297672692.JPG', 1000, 2)
INSERT dbo.ProductPhotoes (Id, Title, FileName, DisplayOrder, ProductId) VALUES (6, N'IMG_1448.JPG', N'3-Photo635518620191472452.JPG', 1000, 3)
INSERT dbo.ProductPhotoes (Id, Title, FileName, DisplayOrder, ProductId) VALUES (7, N'IMG_1471.JPG', N'3-Photo635518620191642613.JPG', 1000, 3)
INSERT dbo.ProductPhotoes (Id, Title, FileName, DisplayOrder, ProductId) VALUES (8, N'IMG_1483.JPG', N'4-Photo635518620716484163.JPG', 1000, 4)
INSERT dbo.ProductPhotoes (Id, Title, FileName, DisplayOrder, ProductId) VALUES (9, N'IMG_1448.JPG', N'4-Photo635518620716694352.JPG', 1000, 4)
SET IDENTITY_INSERT dbo.ProductPhotoes OFF

