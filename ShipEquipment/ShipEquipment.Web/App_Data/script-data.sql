/*
	SQL Server Dumper

	User Interface: SQL Server Dumper  3.0.8
	Script Engine:  SQLDumper.Engine  1.0.8

	Copyright © 2009 Ruizata Project. All Rights Reserved.

	Creation Date:2014-11-09 10:46:06
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

-- `dbo.Contents`

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
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (3, N'Tin tức', N'Tin tức', N'tin/tin-tuc', 0, 1, NULL, NULL, N'~/Views/Layouts/News.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (4, N'Câu thi', N'Câu thi', N'cau-thi', 0, 0, NULL, NULL, NULL)
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (5, N'Hình ảnh & clip', N'Hình ảnh & clip', N'hinh-anh-clip', 0, 1, NULL, NULL, N'~/Views/Layouts/Photo.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (6, N'Hướng dẫn', N'Hướng dẫn', N'huong-dan', 0, 1, NULL, NULL, N'~/Views/Layouts/UserGuide.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (7, N'FAQs', N'FAQs', N'faqs', 0, 1, NULL, NULL, N'~/Views/Layouts/Faqs.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (8, N'Liên hệ', N'Liên hệ', N'lien-he', 0, 1, NULL, NULL, N'~/Views/Layouts/Content.cshtml')
INSERT dbo.Pages (Id, Title, Name, [Alias], IsDefault, Active, MetaKeyword, MetaDescription, Layout) VALUES (9, N'Sản phẩm đặc biệt & Khuyến mãi', N'Sản phẩm đặc biệt & Khuyến mãi', N'khuyen-mai', 0, 1, NULL, NULL, N'~/Views/Layouts/Promotion.cshtml')
SET IDENTITY_INSERT dbo.Pages OFF


-- `dbo.Provinces`

-- `dbo.UserGuides`
SET IDENTITY_INSERT dbo.UserGuides ON

INSERT dbo.UserGuides (Id, [Alias], Name, Summary, Content, Active, DisplayOrder, Photo) VALUES (1, N'huong-dan-mua-hang', N'Hướng Dẫn Mua Hàng', 'CÁC BƯỚC ĐẶT MUA HÀNG QUA INTERNET
CÁC BƯỚC ĐẶT MUA HÀNG QUA online', '<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><strong><u><span style="font-size: 14px;">1.&nbsp;C&Aacute;C BƯỚC ĐẶT MUA H&Agrave;NG QUA INTERNET</span></u></strong></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><strong><span style="background-color: rgb(255, 255, 255);"><span style="color: rgb(255, 0, 0);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Lưu &yacute;</span></span></span></span></strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">: Để đặt mua h&agrave;ng qua Internet, bạn phải đăng k&yacute; th&agrave;nh vi&ecirc;n của Website Đồ C&acirc;u Quỳnh Chi.</span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Bước 1</span></span></span></strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">: Chọn sản phẩm bạn quan t&acirc;m để xem c&aacute;c th&ocirc;ng tin về sản phẩm.</span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Bước 2</span></span></span></strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">: Khi muốn mua sản phẩm n&agrave;o nhấn chuột v&agrave;o n&uacute;t &ldquo;Mua h&agrave;ng&rdquo;, hệ thống sẽ đưa sản phẩm bạn chọn v&agrave;o giỏ h&agrave;ng. Bạn c&oacute; thể tăng số lượng cho sản phẩm vừa chọn hoặc tiếp tục chọn th&ecirc;m sản phẩm kh&aacute;c.</span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Bước 3</span></span></span></strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">: Khi đ&atilde; chọn đủ h&agrave;ng, vui l&ograve;ng điền c&aacute;c th&ocirc;ng tin của bạn để ch&uacute;ng t&ocirc;i tiện li&ecirc;n hệ.</span><br />
<br />
<strong><span style="color: rgb(255, 0, 0);"><span style="font-size: 14px;">Lưu &yacute;</span></span></strong><span style="color: rgb(255, 0, 0);"><span style="font-size: 14px;">:&nbsp;<em>Một số mặt h&agrave;ng c&oacute; nhiều độ d&agrave;i, k&iacute;ch cỡ, hay m&agrave;u sắc&nbsp;kh&aacute;c nhau, bạn vui l&ograve;ng ghi r&otilde; chi tiết của sản phẩm v&agrave;o mục &ldquo;Th&ocirc;ng tin chi tiết về sản phẩm cần mua&rdquo;</em>.</span></span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Bước 4</span></span></span></strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">: Nhấn n&uacute;t &ldquo;Thanh To&aacute;n&rdquo; để gửi đơn h&agrave;ng. Ch&uacute;ng t&ocirc;i sẽ trả lời qua email hoặc trực tiếp qua điện thoại ngay sau khi nhận được th&ocirc;ng tin của bạn để x&aacute;c nhận đơn đặt h&agrave;ng.</span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Thời gian kiểm tra v&agrave; x&aacute;c nhận đơn h&agrave;ng v&agrave;o c&aacute;c buổi s&aacute;ng trong tuần ( tất cả c&aacute;c đơn h&agrave;ng gửi đến v&agrave;o buổi chiều sẽ được kiểm tra v&agrave; x&aacute;c nhận v&agrave;o s&aacute;ng ng&agrave;y h&ocirc;m sau ).</span><br />
<br />
<br />
<strong><u><span style="font-size: 14px;">2.&nbsp;C&Aacute;CH THỨC GIAO H&Agrave;NG</span></u></strong></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Gi&aacute; tiền của sản phẩm l&agrave; gi&aacute; giao h&agrave;ng tại cửa h&agrave;ng Đồ C&acirc;u Quỳnh Chi.</span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Ch&uacute;ng t&ocirc;i giao h&agrave;ng miễn ph&iacute; vận chuyển với điều kiện sau:<br />
Đơn h&agrave;ng trị gi&aacute; tr&ecirc;n 300,000VNĐ v&agrave; khoảng c&aacute;ch giao h&agrave;ng dưới 5km t&iacute;nh từ trung t&acirc;m th&agrave;nh phố H&agrave; Nội.</span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Ngo&agrave;i điều kiện tr&ecirc;n, kh&aacute;ch h&agrave;ng thanh to&aacute;n th&ecirc;m chi ph&iacute; vận chuyển.</span></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(255, 0, 0);"><span style="font-family: Verdana; font-size: 14px;">H&agrave;ng mua rồi kh&ocirc;ng ho&agrave;n trả lại được.</span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><strong><u><span style="font-size: 14px;">3.&nbsp;&nbsp; PHƯƠNG THỨC THANH TO&Aacute;N &ndash; ĐỊA CHỈ NG&Acirc;N H&Agrave;NG</span></u></strong></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">A.&nbsp;Thanh to&aacute;n trực tiếp: Với khoảng c&aacute;ch giao h&agrave;ng dưới 5km t&iacute;nh từ Cửa H&agrave;ng Đồ C&acirc;u Quỳnh Chi, qu&yacute; kh&aacute;ch c&oacute; thể thanh to&aacute;n trực tiếp khi nhận h&agrave;ng.<br />
B.&nbsp;Thanh to&aacute;n qua t&agrave;i khoản ng&acirc;n h&agrave;ng: Qu&yacute; kh&aacute;ch c&oacute; thể &nbsp;thanh to&aacute;n qua t&agrave;i khoản ng&acirc;n h&agrave;ng của Đồ C&acirc;u Quỳnh Chi dưới đ&acirc;y.<br />
<br />
<span style="color: rgb(255, 0, 0);"><strong>. Ng&acirc;n H&agrave;ng N&ocirc;ng Nghiệp v&agrave; Ph&aacute;t Triển N&ocirc;ng Th&ocirc;n Ho&agrave;n Kiếm ( Agribank Ho&agrave;n Kiếm )<br />
. Chủ t&agrave;i khoản: Cung B&igrave;nh Minh<br />
. Số t&agrave;i khoản: 1502205129895</strong></span></span></span></span></p>', 1, 1000, N'1-attention_shutterstock_600x553.jpg')
INSERT dbo.UserGuides (Id, [Alias], Name, Summary, Content, Active, DisplayOrder, Photo) VALUES (2, N'noi-quy-can-thu', N'Nội quy CẦN THỦ', 'Chuyên mục “Góc Cần Thủ” do thành viên sử dụng tài khoản tại Đồ Câu Quỳnh Chi đăng tải, nhằm chia sẻ thông tin, kiến thức, những câu chuyện, cảm xúc, quan điểm riêng của “Cần thủ”. ĐCQC không chịu bất cứ trách nhiệm về bản quyền và nghĩa vụ pháp lý của các nội dung này.', '<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: center; background-color: rgb(222, 194, 131);"><span style="color: rgb(255, 0, 0);"><span style="font-size: 16px;"><strong><span style="font-family: Verdana;">NỘI QUY THAM GIA CHUY&Ecirc;N MỤC G&Oacute;C CẦN THỦ</span></strong></span></span></p>

<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; background-color: rgb(222, 194, 131);"><strong><span style="color: rgb(51, 153, 102);"><span style="font-family: Verdana;"><span style="font-size: 14px;">Chuy&ecirc;n mục &ldquo;<span style="color: rgb(51, 102, 255);">G&oacute;c Cần Thủ</span>&rdquo; do th&agrave;nh vi&ecirc;n sử dụng t&agrave;i khoản tại Đồ C&acirc;u Quỳnh Chi đăng tải, nhằm chia sẻ th&ocirc;ng tin, kiến thức, những c&acirc;u chuyện, cảm x&uacute;c, quan điểm ri&ecirc;ng của &ldquo;Cần thủ&rdquo;. Đồ C&acirc;u Quỳnh Chi kh&ocirc;ng chịu bất cứ tr&aacute;ch nhiệm về bản quyền v&agrave; nghĩa vụ ph&aacute;p l&yacute; của c&aacute;c nội dung&nbsp;n&agrave;y.<br />
<br />
Tất cả c&aacute;c nội dung tham gia chuy&ecirc;n mục y&ecirc;u cầu:<br />
<br />
<span style="color: rgb(255, 0, 0);">1.&nbsp;Kh&ocirc;ng vi phạm ph&aacute;p luật nước CHXHCN Việt Nam.<br />
2.&nbsp;Kh&ocirc;ng li&ecirc;n quan đến ch&iacute;nh trị, t&ocirc;n gi&aacute;o.<br />
3.&nbsp;Kh&ocirc;ng tr&aacute;i với thuần phong, mỹ tục Việt Nam.<br />
4.&nbsp;Kh&ocirc;ng đả k&iacute;ch, lăng mạ người kh&aacute;c.<br />
5.&nbsp;Kh&ocirc;ng quấy rối, g&acirc;y phiền nhiễu, hoặc đe dọa đến sự an to&agrave;n v&agrave; t&agrave;i sản của người kh&aacute;c.<br />
6.&nbsp;Kh&ocirc;ng vu khống, n&oacute;i sai sự thật, l&agrave;m mất danh dự, hoặc mạo nhận một ai đ&oacute;.<br />
7.&nbsp;Kh&ocirc;ng đăng c&aacute;c quảng c&aacute;o kinh doanh thương mại.<br />
8.&nbsp;T&ocirc;n trọng những người c&ugrave;ng tham gia.<br />
9.&nbsp;Tất cả c&aacute;c đoạn ng&ocirc;n ngữ m&aacute;y t&iacute;nh v&agrave; đường link đều bắt buộc kiểm duyệt.</span><br />
<br />
Đồ C&acirc;u Quỳnh Chi c&oacute; quyền từ chối hoặc x&oacute;a bỏ bất cứ nội dung n&agrave;o kh&ocirc;ng ph&ugrave; hợp với c&aacute;c quy định n&oacute;i tr&ecirc;n, đồng thời c&oacute; thể đ&igrave;nh chỉ hay kh&oacute;a ho&agrave;n to&agrave;n t&agrave;i khoản của nội dung đ&oacute; nếu ph&aacute;t hiện vi phạm.</span></span></span></strong></p>', 1, 1000, N'2-new2.jpg')
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

-- `dbo.ProductPhotoes`

-- `dbo.Users`

SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Alias], [Name], [Description], [Active], [ParentId], [DisplayOrder]) VALUES (1, N'category-1', N'Category 1', NULL, 1, NULL, 1000)
INSERT [dbo].[Categories] ([Id], [Alias], [Name], [Description], [Active], [ParentId], [DisplayOrder]) VALUES (2, N'category-2', N'Category 2', NULL, 1, NULL, 1000)
INSERT [dbo].[Categories] ([Id], [Alias], [Name], [Description], [Active], [ParentId], [DisplayOrder]) VALUES (3, N'category-3', N'Category 3', NULL, 1, NULL, 1000)
INSERT [dbo].[Categories] ([Id], [Alias], [Name], [Description], [Active], [ParentId], [DisplayOrder]) VALUES (4, N'category-4', N'Category 4', NULL, 1, NULL, 1000)

SET IDENTITY_INSERT [dbo].[Categories] OFF