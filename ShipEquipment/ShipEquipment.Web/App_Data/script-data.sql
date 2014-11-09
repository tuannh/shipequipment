/*
	SQL Server Dumper

	User Interface: SQL Server Dumper  3.0.8
	Script Engine:  SQLDumper.Engine  1.0.8

	Copyright © 2009 Ruizata Project. All Rights Reserved.

	Creation Date:2014-11-09 08:52:26
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

-- `dbo.Districts`

-- `dbo.NewsArticles`
SET IDENTITY_INSERT dbo.NewsArticles ON

INSERT dbo.NewsArticles (Id, Title, [Alias], Summary, Content, Active, DisplayOrder, CategoryId, Photo, CreatedDate, UpdatedDate) VALUES (1, N'test', N'test', 'Họ hầu hết đã ở tầm tuổi 70, 80. Ngày ngày, từ sáng tinh mơ cho đến chiều tà, họ chèo chống trên chiếc thuyền nhỏ hay ôm cần câu đứng trên cầu Nhật Lệ (Quảng Bình). Vừa là thú vui vừa để rèn luyện sức khỏe, và cũng không ít người đi câu là để thỏa nỗi nhớ một thời tuổi thanh xuân với nghề sông nước...', '<p>L&atilde;o ngư Nguyễn Thị Qu&aacute;n (80 tuổi) từng l&agrave; th&agrave;nh vi&ecirc;n của Đội đ&aacute;nh c&aacute; nữ Minh Khai nổi tiếng một thời. Những l&atilde;o ngư say nghề</p>

<p>Bắt đầu từ s&aacute;ng tinh mơ, những thuyền c&acirc;u nhỏ neo b&ecirc;n bờ s&ocirc;ng Nhật Lệ bắt đầu bơi ra giữa d&ograve;ng. Chủ nh&acirc;n của những chiếc thuyền c&acirc;u ấy kh&ocirc;ng ai kh&aacute;c ch&iacute;nh l&agrave; c&aacute;c &ocirc;ng gi&agrave;, b&agrave; l&atilde;o đ&atilde; ở tuổi xưa nay hiếm...</p>

<p>Ngồi tr&ecirc;n chiếc thuyền c&acirc;u, nữ l&atilde;o ngư Nguyễn Thị Th&ograve;a (68 tuổi) cười rộn r&agrave;ng, kể: Mạ tui đẻ tui ngo&agrave;i biển. Lớn l&ecirc;n 12 tuổi th&igrave; bắt đầu đi biển cho đến 3 năm lại đ&acirc;y, tui mới v&ocirc; đi c&acirc;u ở s&ocirc;ng. L&agrave;m nghề chi say nghề, o &agrave;! Nhiều h&ocirc;m, k&eacute;o c&acirc;u l&ecirc;n, được c&aacute;, đ&atilde; c&aacute;i tay lắm! Ngồi m&atilde;i chẳng muốn về nh&agrave;.</p>

<p>N&oacute;i xong, b&agrave; Th&ograve;a tạm biệt t&ocirc;i rồi c&ugrave;ng chồng l&agrave; l&atilde;o ngư Nguyễn Thẻo (75 tuổi) ch&egrave;o ngược ra ph&iacute;a cửa biển. Ngược gi&oacute;, con nước đang l&ecirc;n, nhiều l&uacute;c họ phải gồng m&igrave;nh để chống chọi với những con s&oacute;ng lớn. Đến một kh&uacute;c s&ocirc;ng, họ bu&ocirc;ng ch&egrave;o v&agrave; bắt đầu thả c&acirc;u. L&agrave;m được một l&uacute;c lại ch&egrave;o thuyền qua kh&uacute;c s&ocirc;ng kh&aacute;c. Cứ thế xoay v&ograve;ng từ Ph&uacute; Hải ra đến cửa biển.</p>

<p>Trưa, thuyền c&acirc;u của vợ chồng l&atilde;o ngư Phạm K&igrave;nh (78 tuổi) v&agrave; Nguyễn Ki&ecirc;n (74 tuổi) cập bến chợ Đồng Hới. Cụ b&agrave; Nguyễn Ki&ecirc;n bưng rổ c&aacute; s&ocirc;ng tươi r&oacute;i, lấp l&aacute;nh &aacute;nh bạc, nhiều ch&uacute; c&aacute; vẫn c&ograve;n nhảy l&oacute;c ch&oacute;c trong rổ. Cụ bảo: C&aacute; vừa c&acirc;u l&ecirc;n mang ra chợ b&aacute;n ngay, kh&ocirc;ng c&oacute; h&oacute;a chất chi cả. Giờ họ ưng ăn c&aacute; ni n&ecirc;n c&oacute; gi&aacute; lắm!</p>

<p>Từ s&aacute;ng sớm, c&aacute;c cụ b&agrave; đ&atilde; chen ch&acirc;n đi mua mồi c&acirc;u. C&aacute;i nghề ni cũng đ&ograve;i hỏi khắt khe lắm! Mồi c&acirc;u l&agrave; con t&ocirc;m nhỏ, chỉ nhỉnh hơn tăm xe m&aacute;y v&agrave; phải đang c&ograve;n sống, c&aacute; mới chịu ăn. Mồi đến 20 ngh&igrave;n/lạng, m&agrave; mua c&oacute; dễ m&ocirc; o, l&atilde;o ngư Nguyễn Thị Diễu (82 tuổi) cho biết. C&acirc;u ống chỉ cần 1 người, nhưng c&acirc;u bủa, c&acirc;u chặng phải c&oacute; 2 người mới l&agrave;m nổi: người ch&egrave;o thuyền, người bủa c&acirc;u. Ng&agrave;y gặp c&aacute;, c&oacute; h&ocirc;m l&agrave;m được v&agrave;i ba đến năm trăm ngh&igrave;n, nhưng khi nước &ldquo;ương&rdquo; th&igrave; chỉ được dăm ba chục ngh&igrave;n th&ocirc;i. V&igrave; thế, người sống bằng nghề ch&agrave;i lưới, c&acirc;u k&eacute;o phải hiểu quy luật của con nước để tận dụng tăng năng suất, hiệu quả.</p>

<p>Những khi nước l&ecirc;n, nước xuống, c&aacute; rất hay ăn. Con nước sinh trong v&ograve;ng 14 ng&agrave;y. Mỗi th&aacute;ng c&oacute; 2 con nước, ri&ecirc;ng th&aacute;ng 2 v&agrave; th&aacute;ng 8 (&acirc;m lịch) th&igrave; c&oacute; 3 con nước. Ba ng&agrave;y đầu khi con nước mới sinh, nước xuống sớm. Từ đ&oacute; đến khi m&atilde;n con nước th&igrave; chuyển sang trưa, chiều, tối... v&agrave; cứ thế quay v&ograve;ng sang con nước kh&aacute;c, rất r&agrave;nh rẽ, l&atilde;o ngư Ho&agrave;ng Ngọc L&agrave;nh (68 tuổi) chia sẻ với t&ocirc;i.</p>

<p>&Ocirc;ng L&agrave;nh hiện l&agrave; Chi hội trưởng Chi hội Người cao tuổi của th&ocirc;n Đồng Dương, x&atilde; Bảo Ninh (TP. Đồng Hới). &Ocirc;ng bảo: Ri&ecirc;ng th&ocirc;n &ocirc;ng, c&oacute; 15 cụ c&ograve;n tham gia sản xuất tr&ecirc;n biển, tr&ecirc;n s&ocirc;ng. Ở th&ocirc;n Mỹ Cảnh, số n&agrave;y c&ograve;n nhiều nữa.</p>

<p>C&ocirc; con d&acirc;u cả của cụ Nguyễn Thị Cẩm (78 tuổi) kể: &Ocirc;ng b&agrave; say nghề lắm, ng&agrave;y n&agrave;o cũng đi l&agrave;m. Gần 80 tuổi rồi nhưng chưa một lần ngả tay xin tiền con, thậm ch&iacute; l&uacute;c con c&aacute;i l&agrave;m nh&agrave;, &ocirc;ng b&agrave; c&ograve;n cho tiền nữa. N&oacute;i thật, &ocirc;ng b&agrave; đi như vậy bọn t&ocirc;i cũng lo lắm, nhưng bảo nghỉ &ocirc;ng b&agrave; kh&ocirc;ng chịu, ốm cũng đ&ograve;i đi cho được. Cụ Cẩm cười, vội ph&acirc;n bua: T&iacute;nh hay l&agrave;m quen rồi, kh&ocirc;ng đi chịu kh&ocirc;ng nổi. Đi l&agrave;m cũng l&agrave; để r&egrave;n luyện sức khỏe, ngồi ở nh&agrave; buồn, lại kh&ocirc;ng vận động nữa dễ ốm lắm!.</p>

<p>V&agrave; k&yacute; ức h&agrave;o h&ugrave;ng</p>

<p>Những ng&agrave;y trời hửng nắng, người ta lại thấy một cụ b&agrave; với m&aacute;i t&oacute;c trắng như cước, miệng bỏm bẻm nhai trầu v&agrave; khoan thai đứng c&acirc;u c&aacute; tr&ecirc;n cầu Nhật Lệ. Cụ t&ecirc;n l&agrave; Nguyễn Thị Qu&aacute;n, ở th&ocirc;n Mỹ Cảnh (x&atilde; Bảo Ninh), năm nay đ&atilde; 80 tuổi. Mỗi dịp đi qua, t&ocirc;i gh&eacute; lại chuyện tr&ograve;. Đứa con duy nhất của cụ đi xuất khẩu lao động đ&atilde; l&acirc;u chưa về. Khi n&agrave;o nhớ con, cụ lại x&aacute;ch cần ra đ&acirc;y cho khu&acirc;y khỏa...</p>', 1, 1000, 1, N'1-new1.jpg', '20141109 12:09:19', '20141109 19:16:37.27')
INSERT dbo.NewsArticles (Id, Title, [Alias], Summary, Content, Active, DisplayOrder, CategoryId, Photo, CreatedDate, UpdatedDate) VALUES (2, N'CÂU CÁ ĐÊM Ở TRƯỜNG SA', N'cau-ca-dem-o-truong-sa', 'Mỗi chuyến tàu ra với quần đảo Trường Sa, các thủy thủ không bỏ lỡ cơ hội buông câu và hò reo khi bắt được cá lớn. Câu đêm với họ không chỉ là thú vui mà còn giúp cải thiện bữa cơm người lính', '<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">Nữ chiến binh c&oacute; b&iacute; danh Rehana được ca ngợi l&agrave; biểu tượng của niềm hy vọng cho Kobani, thị trấn Syria đang bị IS đ&aacute;nh chiếm. C&ocirc; trở n&ecirc;n nổi tiếng sau khi một nh&agrave; b&aacute;o đăng bức ảnh của c&ocirc; tr&ecirc;n mạng x&atilde; hội Twitter v&agrave; cho biết&nbsp;<span style="margin: 0px; padding: 0px;">Rehana&nbsp;</span><span style="margin: 0px; padding: 0px;">đ&atilde; tự tay ti&ecirc;u diệt 100 chiến binh IS.</span></p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">Những tuy&ecirc;n truyền vi&ecirc;n tr&ecirc;n mạng x&atilde; hội của phiến qu&acirc;n Hồi gi&aacute;o mới đ&acirc;y ph&aacute;t t&aacute;n một bức h&igrave;nh gh&ecirc; rợn, trong đ&oacute; một chiến binh IS giơ cao chiếc đầu bị cắt đứt được cho l&agrave; của Rehana.&nbsp;<span style="margin: 0px; padding: 0px;">Tuy nhi&ecirc;n, Đơn vị Bảo vệ Nh&acirc;n d&acirc;n (YPG) v&agrave; Đơn vị Chiến đấu của Nữ giới (YPJ), lực lượng người Kurd ở Syria m&agrave; c&ocirc; tham gia hiện chưa đưa ra tuy&ecirc;n bố về vụ việc n&agrave;y.</span></p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">C&aacute;c nữ chiến binh đ&oacute;ng một vai tr&ograve; quan trọng trong cuộc chiến ti&ecirc;u diệt IS tại Kobani. Đơn vị vũ trang to&agrave;n nữ giới của người Kurd được th&agrave;nh lập hồi th&aacute;ng 4 v&agrave; ước t&iacute;nh c&oacute; khoảng 10.000 th&agrave;nh vi&ecirc;n. Phần lớn c&aacute;c nữ chiến binh được huấn luyện l&agrave;m l&iacute;nh bắn tỉa.</p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;"><span style="margin: 0px; padding: 0px;">C&ocirc; g&aacute;i lấy t&ecirc;n Arin Mirkan hồi đầu th&aacute;ng đ&aacute;nh bom tự s&aacute;t ngo&agrave;i Kobani, giết chết 10 tay s&uacute;ng IS. Nh&oacute;m Gi&aacute;m s&aacute;t Nh&acirc;n quyền Syria trước đ&oacute; cho biết phiến qu&acirc;n Hồi gi&aacute;o đ&atilde; chặt đầu 9 chiến binh người Kurd, trong đ&oacute; c&oacute; ba phụ nữ.</span></p>', 1, 1000, 1, NULL, '20141109 17:03:23', '20141109 18:06:30.107')
INSERT dbo.NewsArticles (Id, Title, [Alias], Summary, Content, Active, DisplayOrder, CategoryId, Photo, CreatedDate, UpdatedDate) VALUES (3, N'QUÁI NGƯ TRÊN SÔNG MÊ KÔNG', N'quai-ngu-tren-song-me-kong', 'Các loài cá tra dầu,cá hô… khổng lồ của dòng sông Mê Kông đang đứng bên bờ vực tuyệt chủng do tình trạng đánh bắt quá mức của người dân.', '<div>&nbsp;</div>

<div>
<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="margin: 0px auto 10px; padding: 0px; max-width: 100%; font-family: arial; font-size: 13.63636302948px; line-height: normal; width: 480px;">
	<tbody style="margin: 0px; padding: 0px;">
		<tr style="margin: 0px; padding: 0px;">
			<td style="margin: 0px; padding: 0px; line-height: 0;"><img alt="RTR3JCN7-8961-1414295025.jpg" data-natural-="" data-pwidth="480" data-width="499" src="http://m.f29.img.vnecdn.net/2014/10/26/RTR3JCN7-8961-1414295025.jpg" style="margin: 0px; padding: 0px; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 480px;" /></td>
		</tr>
		<tr style="margin: 0px; padding: 0px;">
			<td style="margin: 0px; padding: 0px; line-height: 0;">
			<p class="Image" style="margin: 0px; padding: 10px; line-height: normal; font-stretch: normal; font-size: 12px; background: rgb(245, 245, 245);">Một nh&oacute;m nữ sinh mặc &aacute;o&nbsp;đen tr&ugrave;m k&iacute;n người đi lại tr&ecirc;n đường phố&nbsp;Raqqa,&nbsp;th&agrave;nh tr&igrave; của IS ở Syria. Ảnh:&nbsp;<em style="margin: 0px; padding: 0px;">Al-monitor</em></p>
			</td>
		</tr>
	</tbody>
</table>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">Theo&nbsp;<em style="margin: 0px; padding: 0px;">IBTimes,&nbsp;</em><span style="margin: 0px; padding: 0px;">IS đe dọa xử tử những thầy gi&aacute;o dạy học cho nữ sinh tại v&ugrave;ng ch&uacute;ng kiểm so&aacute;t.&nbsp;</span>N<span style="margin: 0px; padding: 0px;">h&agrave; hoạt động lấy t&ecirc;n Abu Wart tại Raqqa, Syria cho biết nhiều gia đ&igrave;nh tại khu vực IS chiếm đ&oacute;ng đ&atilde; để con c&aacute;i học ri&ecirc;ng ở nh&agrave;, nhằm tr&aacute;nh những luật lệ h&agrave; khắc nh&oacute;m n&agrave;y đặt ra. Tuy nhi&ecirc;n, điều n&agrave;y lại l&agrave;m dấy l&ecirc;n một mối đe dọa đ&aacute;ng sợ. Những gi&aacute;o vi&ecirc;n dạy học ri&ecirc;ng cho c&aacute;c nữ sinh c&oacute; nguy cơ bị h&agrave;nh quyết.</span></p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;"><span style="margin: 0px; padding: 0px;">Theo Abu Wart, I</span><span style="margin: 0px; padding: 0px;">S thường đe dọa trừng phạt&nbsp;</span><span style="margin: 0px; padding: 0px;">c&aacute;c gi&aacute;o vi&ecirc;n kh&ocirc;ng cho nam sinh v&agrave; nữ sinh học ri&ecirc;ng. IS c&ograve;n tịch thu những cuốn s&aacute;ch v&agrave; t&agrave;i liệu ch&uacute;ng cho l&agrave; phi ph&aacute;p. &quot;T&ocirc;i c&oacute; nhiều s&aacute;ch triết học v&agrave; lịch sử, nhưng t&ocirc;i phải giấu ch&uacute;ng đi&quot;, Wart n&oacute;i th&ecirc;m.</span></p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">IS cũng đe dọa trừng phạt nặng c&aacute;c gi&aacute;o vi&ecirc;n giảng dạy bất cứ m&ocirc;n g&igrave; nằm ngo&agrave;i luật lệ của nh&oacute;m. Người d&acirc;n sống dưới sự cai trị của IS ở Mosul, Iraq v&agrave; Raqqa, Syria bị cấm sở hữu s&aacute;ch học thuật v&agrave; nghi&ecirc;n cứu về ph&aacute;p luật, nh&acirc;n quyền. Nh&oacute;m cực đoan cũng cấm việc dạy học cho trẻ em tại nh&agrave;.</p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">Tuần n&agrave;y, khi c&aacute;c trường đại học bắt đầu ni&ecirc;n kh&oacute;a mới, IS ra lệnh đ&oacute;ng cửa c&aacute;c khoa mỹ thuật, khoa học ch&iacute;nh trị,&nbsp;<span style="margin: 0px; padding: 0px;">luật,&nbsp;</span><span style="margin: 0px; padding: 0px;">khảo cổ học, gi&aacute;o dục, thể thao, triết học, du lịch v&agrave; quản l&yacute; kh&aacute;ch sạn trong khu vực nh&oacute;m kiểm so&aacute;t.</span></p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">Tại Mosul v&agrave; Raqqa, IS ra lệnh cho gi&aacute;o vi&ecirc;n kh&ocirc;ng dạy những m&ocirc;n như d&acirc;n chủ, gi&aacute;o dục văn h&oacute;a, nh&acirc;n quyền v&agrave; ph&aacute;p luật, để duy tr&igrave; c&aacute;i gọi l&agrave; &quot;x&atilde; hội tốt đẹp&quot;.</p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">Gi&aacute;o vi&ecirc;n phải học luật lệ của IS, v&agrave; bị y&ecirc;u cầu bỏ một số m&ocirc;n trong chương tr&igrave;nh học v&agrave; thi cử &quot;kh&ocirc;ng ph&ugrave; hợp với luật lệ Hồi gi&aacute;o&quot;. Trong đ&oacute; c&oacute; &quot;học thuyết lỗi thời giả dối&quot;, c&aacute;ch nh&oacute;m cực đoan gọi thuyết tiến h&oacute;a bằng chọn lọc tự nhi&ecirc;n của Darwin v&agrave; &quot;c&aacute;ch ph&acirc;n định địa l&yacute; kh&ocirc;ng ph&ugrave; hợp với Hồi gi&aacute;o&quot; của c&aacute;c quốc gia kh&aacute;c.</p>

<p class="Normal" style="margin: 0px 0px 1em; padding: 0px; line-height: 18px; font-family: arial; font-size: 13.63636302948px;">Sinh vi&ecirc;n của trường Đại học Mosul tuần qua được ph&eacute;p ra ngo&agrave;i v&ugrave;ng IS kiểm so&aacute;t để tham dự kỳ thi năm cuối năm ở v&ugrave;ng Kurdistan, Iraq. C&aacute;c m&ocirc;n thi n&agrave;y phải nhận được sự ph&ecirc; duyệt từ nh&oacute;m.</p>
</div>', 1, 1000, 1, NULL, '20141109 17:06:37', '20141109 18:06:37.8')
SET IDENTITY_INSERT dbo.NewsArticles OFF


-- `dbo.Products`

-- `dbo.ProductPhotoes`
