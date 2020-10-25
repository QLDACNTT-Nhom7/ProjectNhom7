-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 25, 2020 lúc 04:23 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `php41`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `name`) VALUES
(1, 'Son Môi'),
(2, 'Phấn Má Hồng'),
(3, 'Kem Trắng Da'),
(4, 'Kem Dưỡng Ẩm'),
(5, 'Nươc Tẩy Trang');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customer_id` int(11) NOT NULL,
  `fullname` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_id`, `fullname`, `email`, `address`, `phone`) VALUES
(2, 'Nguyễn Văn A', 'admin1@mail.com', 'ha noi', '0825585459'),
(3, 'Nguyễn Văn A', 'tung.anhb3@gmail.com', 'ha noi', '0825585459'),
(4, 'tung anh', 'admin1@gmail.com', 'Thôn Thanh Hương Xã Xuân Quỳ Huyện Như Xuân Tỉnh Thanh Hóa', '0399966637'),
(5, 'fsfs', 'jkb', 'hkb', 'jhghj'),
(6, 'tung anh', 'tung.anhb3@gmail.com', 'Thôn Thanh Hương Xã Xuân Quỳ Huyện Như Xuân Tỉnh Thanh Hóa', '0399966637'),
(7, 'truong ngoc trương', 'tung.anhb3@gmail.com', 'như thanh', '236487236');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `create_at` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0: chưa giao hàng - 1: đã giao hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `create_at`, `status`) VALUES
(4, 2, '2019-09-23', 0),
(5, 3, '2019-09-30', 0),
(6, 4, '2019-10-14', 0),
(7, 5, '2019-10-15', 0),
(8, 6, '2019-10-28', 0),
(9, 7, '2020-10-08', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_detail`
--

CREATE TABLE `tbl_order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_detail`
--

INSERT INTO `tbl_order_detail` (`order_detail_id`, `order_id`, `product_id`, `price`, `number`) VALUES
(7, 4, 4, 6490000, 3),
(8, 4, 3, 8490000, 3),
(9, 5, 5, 27990000, 4),
(10, 5, 6, 16990000, 1),
(11, 6, 8, 5990000, 1),
(12, 7, 2, 12990000, 1),
(13, 8, 5, 27990000, 1),
(14, 9, 15, 115000, 1),
(15, 9, 14, 179000, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `content` text NOT NULL,
  `hotproduct` int(1) NOT NULL,
  `img` varchar(500) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `name`, `category_id`, `description`, `content`, `hotproduct`, `img`, `price`) VALUES
(1, 'Son mờ lì', 1, 'Xuất xứ : Hàn Quốc       \r\nKích cỡ : Full size\r\n', 'Son có màu sắc khá bắt mắt, có thể giữ được trong khoảng thời gian từ 7-9 giờ trong ngày mà không sợ bị trôi.', 1, 'son_mo_li.jpg', 650000),
(2, 'Black rouge mousse', 1, 'Xuất xứ : Hàn Quốc\r\nKích cỡ : Full size', 'Hãng mỹ phẩm Black Rouge không làm chị em thất vọng khi liên tục tung ra những dòng son mới với chất lượng ngày càng được nâng cấp. Đầu năm 2019, Black Rouge trình làng bộ sưu tập son Black Rouge Mousse Blending gồm 5 màu, hãy cùng BlogAnChoi xem xét các màu son này nhé.', 1, 'black_rougo_mousse.jpg', 550000),
(3, 'Ombre lipstick', 1, 'Xuất xứ : Hàn Quốc\r\nKích cỡ : Full size', 'Tạo ra một đôi môi ombre mà không phức tạp bằng cách sử dụng son môi ba màu độc đáo này trong một công thức nhiều dưỡng, sắc tố. Công thức dạng kem nhẹ giúp giữ ẩm cho đôi môi cho đôi môi mềm mại và màu sắc đều, mịn giúp bạn luôn thoải mái khi trang điểm.', 0, 'ombre_lipstick.jpg', 499000),
(4, 'Nivea', 1, 'Xuất xứ : Hàn Quốc\r\nKích cỡ: Full size', 'Nivea có nhiều dòng son dưỡng môi khác nhau, trong đó 4 dòng phổ biến nhất là son dưỡng không màu huyền thoại Nivea Essential Care, dòng có màu Nivea Fruity Shine, dòng chống nắng Nivea Med Protection và cuối cùng là son dưỡng dạng hũ Nivea Lip Butter Vanilla & Macamadia Kiss', 0, 'nivea.jpg', 289000),
(5, 'Black rouge', 1, 'Xuất xứ : Hàn Quốc\r\nKích cỡ : tiêu chuẩn', '* Thành Phần Chính Và Công Dụng:\r\nSon kem lì mịn thuộc dòng Air Fit Velvet Tint Blueming Garden của Black Rouge với chất son nhẹ tênh, giúp bạn hạn chế tối đa tình trạng khô môi. Son lên chuẩn sắc và giữ màu đến 8 tiếng và có một lớp base hồng nhẹ giúp môi luôn có sức sống. Thiết kế thân vuông đặc trưng của thương hiệu Black Rouge với logo được in hologram óng ánh sang trọng.\r\n\r\n- Kết cấu velvet bám chắc trên đôi môi và rõ sắc son chỉ với một lần chạm nhẹ\r\n- Chất son nhẹ như không tránh cảm giác gây nặng môi\r\n- Thành phần giàu dưỡng ẩm tránh gây khô môi như những dòng son tint khác\r\n- Hương trái cây ngọt ngào sẽ lôi cuốn mọi cô gái ngay lập tức\r\n- Kết cấu mịn cùng màu sắc tươi sáng giúp che khuyết điểm môi hiệu quả chỉ sau một lần đánh\r\n- Độ bám màu của son tốt, giữ nguyên sắc môi xinh cả ngày dài\r\n- 5 sắc hoa nở rộ thu hút, dễ dàng cho nhiều phong cách makeup.', 0, 'black_rouge.jpg', 599000),
(6, 'Son Kem Lì Laskin Matte Liptint Korea', 1, 'Xuất xứ: Hàn quốc\r\nKích cỡ : tiêu chuẩn', 'Son kem lì Laskin Lipstick Korea\r\n- Thông tin chung:\r\n+ Thương hiệu: Laskin\r\n+ HSD: 3 năm từ ngày sản xuất\r\n+ Số công bố: \r\n+ Định lượng: 6ml\r\n+ Tính chất: Son kem lì\r\n- Bộ sưu tập son Laskin Cosmetic, bao gồm 5 màu son\r\n#1 Jolly - Cam Da\r\n#2 Dreamy - Đỏ Hồng Đất\r\n#3 Classy - Đỏ Cam Cháy\r\n#4 Trendy - Đỏ Gạch\r\n#5 Witty - Đỏ Nâu\r\n- Màu 01 Jolly \r\n+ Cam da với độ ấm vừa phải nên không làm khuôn mặt nhợt nhạt. Với màu này các nàng nên kết hợp trang điểm theo phong cách Âu Mỹ sẽ cho một vẻ ngoài cá tính, sang chảnh và đầy thu hút.\r\n\r\n- Màu 02 Dreamy - Đỏ hồng đất\r\n+ Là một tone màu hồng đất ấm, thiên hồng nhiều hơn nên dễ phù hợp với màu da vàng của người châu á, hơn nữa cũng dễ kết hợp với nhiều kiểu makeup khác nhau.\r\n+ Nếu bạn thích một màu son đỏ nhưng không quá... đỏ, đỏ đất Dreamy tươi tắn nhưng dịu dàng là một sự lựa chọn cực kỳ phù hợp.\r\n\r\n- Màu 03 Classy đỏ cam cháy: \r\n+ Tông son nổi bật, tươi mới nhất trong bảng 5 màu son. Khi cần thu hút sự chú ý của mọi người hay muốn trở lên tự tin hơn với phong cách trẻ trung năng động thì đây là màu son hoàn toàn giúp các cô gái trở nên nổi bật hơn. \r\n+ Màu son không kén tông da và men răng, và đặc biệt khá ưng trên mặt mộc.\r\n\r\n- Màu 04 Trendy Đỏ Gạch: Màu son thuộc tone đỏ gạch trầm nhưng nghiêng về sắc cam nhiều hơn nên cũng tươi và trẻ trung hơn. Sắc son sẽ làm cho khuôn mặt cùng men răng các nàng bức sáng, không kén tone da, rất thích hợp cho những cô nàng công sở chọn phong cách trang điểm nhẹ nhàng với sắc son vô cùng thanh lịch.\r\n\r\n- Màu 05 Witty - Đỏ Nâu: Đây là màu son hot trend nhất hiện nay và cũng là màu best saller của tất cả hãng son. sự kết hợp tinh tế giữa đỏ truyền thống và đỏ nâu  tạo nên một màu son vừa cổ điển, vừa hiện đại, phù hợp hầu hết tone da và không hề kén răng.', 0, 'Son_Kem_Li_Laskin_Matte_Liptint_Korea.jpg', 386000),
(7, 'Phấn Má Hồng Sivanna Obsession', 2, 'Xuất xứ : hàn Quốc\r\nKích cỡ : Tiêu chuẩn', 'Đối với các cô nàng thường xuyên trang điểm thì việc đánh phấn má hồng được xem là bước quan trọng không thể thiếu cho vẻ đẹp hoàn hảo. Sivanna Colors Obsession HF3015 20g là dòng phấn má hồng đặc biệt đến từ thương hiệu mỹ phẩm hàng đầu Thái Lan đang được nhiều người yêu thích. \r\n\r\nSản phẩm là sự kết hợp hài hòa giữa phấn má hồng với phấn tạo khối-highlight bắt sáng giúp tạo hiệu ứng cho làn da tươi tắn tràn đầy sức sống.\r\n\r\nPhấn má hồng bắt sáng Sivanna Colors Obsession HF3015 20g là một trong những bảo bối cho các nàng tỏa sáng dù ở bất kì nơi nào.\r\n\r\nĐặc điểm nổi bật của phấn má: Kết cấu phấn mỏng nhẹ, mịn màng Bền màu và độ bám cao Tạo hình thể với hạt phấn trong suốt và sáng lấp lánh, đem đến nét rạng rỡ cho làn da ngay tức thì. Mang đến hiệu ứng cho đôi gò má ửng hồng tự nhiên, trong trẻo Giúp làn da tỏa sáng tự nhiên. Có thể sử dụng như phấn highlight để tạo khối cho gương mặt thon gọn và nổi bật.\r\n\r\ncực mịn và nhuyễn, không gây vón cục và rất dễ tán, không bí da và độ bám cũng cực kì lâu. Bảng phấn sẽ tạo vẻ rạng rỡ và tươi tắn, phản chút ánh nhũ nhẹ nhàng, đa công dụng với khả năng dùng làm màu mắt, má hồng, bắt sáng hoặc tạo khối cho khuôn mặt tươi sáng và thu hút hơn.\r\n\r\nNàng nào yêu thích kiểu phấn Ombre thì đây là một gợi ý không thể nào tuyệt vời hơn luôn ạ. Phấn má hồng bắt sáng Sivanna Colors Obsession HF3015 được thiết kế theo kiểu ombre, phấn sẽ chuyển màu từ nhạt sang đậm, hoặc chuyển dần sang một màu khác trong cùng một ô. Nàng sẽ dễ dàng phối màu để trang điểm.', 1, 'Phan_Ma_Hong_Sivanna_Obsession.jpg', 276000),
(8, 'Phấn Má Hồng Lameila Gốm Vitality Blush Color Geometry', 2, 'Xuất xứ : Trung quốc\r\nKích cỡ : Tiêu chuẩn', 'Phấn má hồng lameila vality là má hông dạng phấn nén truyền thống nhưng rất hiện đại, hợp thời trang & cá tính.\r\n– Những gam màu đơn sắc chuyển từ nhạt sang đậm phù hợp với nhu cầu trang điểm mịn, lì, khô thoáng.\r\n– Màu sắc được pha trộn cũng như hiệu ứng phát sáng tại những điểm giao thoa, giúp gương mặt trông nổi bật & cá tính hơn, bắt kịp xu hướng trang điểm thời thượng của thế giới, phù hợp với nhiều phong cách trang điểm khác nhau từ đi làm, đi học đến đi chơi, du lịch.', 0, 'Phan_Ma_Hong_Lameila_Gom_Vitality_Blush_Color_Geometry.jpg', 545000),
(9, 'Phấn má hồng SANIYE một màu nhẹ nhàng lâu trôi chuyên dụng trang điểm E0119', 2, 'Xuất xứ : Hàn quốc\r\nKích cỡ : Tiêu chuẩn', 'Thông tin sản phẩm:\r\n  Thương hiệu: SANIYE\r\n  Tên sản phẩm: Phấn má hồng một màu\r\n  Màu sắc: 8 màu\r\n  Kích thước: 6.5*6.5*1.5cm\r\n  Khối lượng: 43g\r\n  Ngày sản xuất: 2019.10\r\n  Hết hạn sử dụng: 2 năm kể từ ngày sản xuất\r\n  Thích hợp cho loại da: mọi loại da\r\n  Gói hàng bao gồm: 1 * Hộp phấn má hồng một màu\r\n  \r\n  Ưu điểm nổi bật: \r\n  ? Dễ dàng lên màu\r\n  ? Kết cấu mềm mại\r\n  ? Hồng và sáng\r\n  ? Nhẹ và mềm\r\n  ? Dễ dàng lên màu\r\n  ? Giúp cho bạn trở nên thanh lịch và hào phóng', 1, 'phan3.jpg', 130000),
(10, 'Phấn má hồng đơn sắc Lameila Blusher Color Geometry BLG6', 2, 'Xuất xứ : hàn quốc\r\nKích cỡ : Tiêu chuẩn', 'Đây là một trong những phấn má hồng được các tín đồ làm đẹp ưu ái , không chỉ bởi màu sắc đa dạng phù hợp với nhiều tone màu da mà còn bởi chất lượng phấn quá chuẩn để mang đến một lớp make up hoàn hảo suốt cả ngày dài. \r\n\r\nƯu điểm nổi bật :\r\n- Phấn có thiết kế hộp nhỏ gọn, chắc chắn giúp nàng có thể dễ dàng bỏ túi mang theo bên mình khắp mọi nơi. \r\n- Đặc biệt chất phấn cực kì mỏng mịn với các hạt phấn có khả năng bắt sáng tuyệt vời. \r\n- Khi tán lên da, những hạt phấn siêu mịn dễ dàng tiệp vào da tạo hiệu ứng ửng hồng tự nhiên, không hề bị dày cộm hay bí bít lỗ chân lông.\r\n- Phấn giữ bền màu, lâu trôi suốt cả ngày dài.\r\n', 0, 'phan4.jpg', 165000),
(11, 'Phấn Má Hồng Mengxuan Lâu Trôi Chất Lì Lấp Lánh', 2, 'Xuất xứ : Hàn quốc\r\nKích cỡ : Tiêu chuẩn', 'HÀNG CHÍNH HÃNG 100% \r\n Thời hạn sử dụng: 3 Năm\r\n Đóng gói: 1 Cái / hộp\r\n Thành phần chính: Mica, titanium dioxide, silica, vitamin E, chất tạo màu, v.v.\r\n Khối lượng tịnh: 10g\r\n Người hồi giáo có thể sử dụng được 100% ', 0, 'phan5.jpg', 135000),
(12, 'Phấn má hồng Milani Baked Blush', 2, 'Xuất xứ : Hàn quốc\r\nKích cỡ : Tiêu chuẩn', '- Sản phẩm có chất phấn mềm mịn, lâu trôi và có thể bền màu cả ngày.\r\n- Màu lên mượt, bám và rất đẹp do có sự hòa quyện giữa các màu sắc với nhau tạo nên sắc màu tự nhiên nhất khi lên da.\r\n- Chỉ cần dùng cọ phớt nhẹ duy nhất một lần thôi, sản phẩm cũng đã giúp đôi má của bạn lên màu rất chuẩn, cam ra cam, hồng ra hồng, nhũ mịn và bền màu.\r\n- Ngoài ra, vỏ sản phẩm mang một vẻ cổ điển, thanh lịch và vô cùng chắc chắn, vừa tay. Không tạo ra cảm giác nặng nề, quá khổ.\r\n- Thiết kế sang trọng, nhỏ gọn, xinh xắn với gương và cọ theo kèm, bạn có thể mang theo bên mình để sử dụng khi cần.\r\n* Hướng dẫn sử dụng :\r\nMá hồng này dạng baked, bạn có thể dùng chúng ướt hoặc khô. Dùng khô như các loại phấn má thông thường, hoặc làm ẩm cọ bằng cách xịt một chút xíu nước, sau đó dùng như bình thường. Khi dùng ướt, màu blush sẽ lên rõ hơn là khi dùng khô.\r\n', 0, 'phan6.jpg', 121000),
(13, 'Kem Trắng Da Body Ova WhitePro Chính Hãng', 3, 'Xuất xứ : Hàn quốc\r\nKích cỡ : Tiêu chuẩn ', 'OVA WHITEPRO là kem dưỡng trắng body nuôi dưỡng phục hồi, làm săn chắc và cải thiện độ đàn hồi\r\ncho da. Đặc biết nhất, WHITEPRO giúp nâng tông, kích trắng rõ rệt trong vòng 15-20 phút và nếu sử\r\ndụng đều đặn trong 7-10 ngày, sẽ duy trì được kết quả da trăng hồng, mìn màng, căng bóng, và thơm\r\ntho.\r\n\r\nLỢI ÍCH &amp; ƯU ĐIỂM\r\n- 3 lớp bảo vệ:\r\nDưỡng ẩm: giúp da sáng mịn và mềm mại\r\nTái tạo tế bào, trẻ hóa làn da: tăng cường bảo vệ da trước các yếu tố từ môi trường, giúp da căng sáng,\r\ngiảm nếp nhăn\r\nKích trắng nâng tông: da sáng, trắng hồng chỉ sau vài phút sử dụng\r\n- Chỉ số chống nắng SPF 30+: chống nắng hiệu quả\r\n- Phục hồi làn da bị tổn thương, mỏng yếu do lột, tẩy, lạm dụng mỹ phẩm. Giải quyết tình trạng da bị phụ\r\nthuộc các chất như corticoid, Hydroquinone…\r\n- Cung cấp vitamin C và E giúp chống lại các gốc tự do và kích thích sự hình thành collagen\r\n- An toàn: chiết xuất hoàn toàn từ thiên nhiên không gây kích ứng\r\n- Thoải mái: không bết dính, không bóng nhờn, không trôi khi gặp nước', 0, 'kem1.jpg', 198000),
(14, 'KEM DƯỠNG ẨM TRẮNG DA ALOINS EAUDE CREAM S', 4, 'Xuất xứ : Hàn quốc\r\nKích cỡ : Tiêu chuẩn', '?? KEM DƯỠNG ẨM TRẮNG DA ALOINS EAUDE CREAM S ? \r\n\r\n?DÙNG CHO CẢ MẶT, BODY HOẶC DÙNG NHƯ KEM TAY\r\n\r\n? Aloins Eaude Cream S được chiết xuất từ cây Lô Hội giúp trắng da, dưỡng ẩm cho da, trị khô da, nứt nẻ da và ngăn chặn nám da do sự hình thành melamin ở tuổi 30.\r\n\r\n? Kem dưỡng da Aloins là loại kem dưỡng ẩm trắng da, có tác dụng nuôi dưỡng làn da sáng mịn, tạo độ ẩm sâu cho da, cung cấp dưỡng chất cần thiết cho 1 làn da khỏe mạnh, bảo vệ ADN màng tế bào, kiểm soát tiến trình lão hóa của da\r\n\r\n? Chiết xuất lô hội có trong Aloins Eaude Cream S giúp dưỡng ẩm cho da, làm da càng ngày càng khỏe mạnh, trắng sáng, hồng hào, mịn màng 1 cách tự nhiên.\r\n\r\n? Kem còn có tác dụng giảm viêm, giảm triệu chứng khô rát khi cháy nắng', 1, 'kem2.jpg', 179000),
(15, 'Kem dưỡng da mặt ban đêm face nhau thai Seimy - Diamond Luxury dưỡng trắng , cấp ẩm, mờ nám, trị mụn', 3, 'Xuất xứ: Hàn quốc\r\nKích cỡ : Tiêu chuẩn', 'Bộ đôi kem dưỡng và tinh chất DIAMOND LUXURY là kết tinh của những tinh hoa tinh tuý nhất, sở hữu công nghệ hiện đại nhất bóc tách các tế bào bổ sung nuôi dưỡng làn da căng bóng tự nhiên. \r\n\r\n  Quá trình lựa chọn các thành phần để tạo nên hiệu quả phù hợp với mọi loại da là vô cùng quan trọng, không chỉ sở hữu những thành phần HẢO HẠNG QUÝ HIẾM, bộ đôi DIAMOND LUXURY còn đem đến những công dụng tuyệt vời cho làn da : \r\n+ Giúp cấp ẩm, bổ sung dưỡng chất dành cho da.\r\n+ Làm da săn chắc, căng bóng, giảm mụn, mờ vết thâm.\r\n+ Chống lão hoá chảy sệ da.\r\n+ Giảm mờ các vết thâm nám lâu năm và nám sắc tố.\r\n+ Dưỡng trắng da từ sâu bên trong bằng các hoạt chất làm trắng tự nhiên.\r\n+ Phục hồi da yếu, da hư tổn, da sử dụng phải kem trộn.\r\n+ Tái tạo, nuôi dưỡng làn da từ sâu bên trong.\r\n+ Thu nhỏ lỗ chân lông, nâng tông tự nhiên.\r\n+ Tạo sự mềm mại, đàn hồi cho làn da.\r\n+ Mờ nếp nhăn, vết chân chim, ngăn quá trình hình thành sắc tố melanin tạo thành nám\r\n+ Bổ sung Collagen nuôi dưỡng các tế bào làm tái tạo giúp làn da trẻ hoá.', 1, 'kem3.jpg', 115000),
(16, 'POND\'S Kem Trắng Da Không Tì Vết Ban Đêm', 3, 'Xuất xứ : Hàn quốc\r\nKích cỡ : Tiêu chuẩn', 'Khi quá trình tái tạo da diễn ra mạnh mẽ nhất. Dưỡng chất kem đêm giúp tái tạo làn da và hồi phục những hư tổn hàng ngày để tăng cường dưỡng trắng da ngay cả trong khi bạn ngủ. Công thức dưỡng trắng GenActiv™, hoạt động tích cực từ sâu bên trong (tại lớp biểu bì), làm giảm quá trình hình thành hắc sắc tố. Sản phẩm có khả năng thích ứng chuyên biệt trên từng làn da, giúp dưỡng trắng và giảm thâm nám tối ưu, mang lại vẻ trắng sáng cho làn da. Với Kem Pond\'s Trắng Không Tì Vết bạn sẽ thức dậy mỗi ngày với vẻ đẹp trắng rạng ngời.', 0, 'kem4.jpg', 199000),
(17, 'Kem Trắng Da Chống Lão Hoá SULWHASOO Luminature Glow 5ml', 3, 'Xuất xứ : Hàn quốc\r\nKích cỡ : Tiêu chuẩn', 'Kem kiểm soát độ sáng bóng và bề mặt da ,mang vẻ đẹp trắng hồng cho làn da\r\nGiúp khí sắc da đẹp tự nhiên  không cần trang điểm.\r\n\r\nKem glow cream Với sáng chế độc quyền chỉ có ở Sulwhasoo.\r\n\r\n Bôi sau các lớp giúp các chất dinh dưỡng và độ bóng duy trì lâu,không gây bí da\r\n\r\n?Giúp trắng  da với chiết xuất  hoàng kim(vàng) tâc dụng giữ chặt các sắc tố melanin chống nám tàn nhang,giúp làn da rạng rỡ. \r\n\r\n?giúp da láng mịn săn chắc với chiết xuất từ cây kim ngân. \r\n\r\n?Trị mụn thu nhỏ lỗ chân lông. \r\n?Bóng da với chiết xuất từ dầu quả anh đào. \r\n\r\nSản phẩm thích hợp với mọi loại da\r\nKể cả da nhạy cảm nhất. Da yếu nhất \r\n\r\nTích hợp 3 bước chỉ trong 1 loại kem:\r\ndưỡng trắng,chống nhăn Căng da,săn chắc da \r\n\r\nCòn thay thế cả bước kem lót trước trang điểm', 0, 'c1.jpg', 315000),
(18, 'Kem trắng da chống lão hóa Ohui phyto vital Prime Advancer ampoule capture cream 7ml', 3, 'Xuất xứ : Hàn quốc\r\nKích cỡ : Tiêu chuẩn', 'Kem trắng da chống lão hóa Ohui phyto vital Prime Advancer ampoule capture cream\r\n\r\n có tác dụng chống lão hóa, chống nhăn, giúp da săn chắc căng bóng trắng sáng mịn màng như da em bé. Tinh chất thẩm thấu sâu vào 3 lớp biểu bì, thân bì và hạ bì để nuôi dưỡng da từ gốc cho bạn một làn da khỏe và đẹp tự nhiên một cách bền vững.\r\n\r\n- Sét chống lão hóa Ohui phyto vital Prime Advancer\r\n\r\n giữ cho phần cốt lõi của da luôn được vững chắc. Đồng thời, nuôi dưỡng từ sâu bên trong tăng cường khả năng bảo vệ da, giữ da luôn tươi trẻ, khỏe mạnh trước các tác động có hại như stress, tia cực tím UV hay khói bụi, môi trường ô nhiễm bên ngoài\r\n \r\nCông dụng:\r\n- Làm mềm và trắng da\r\n- Chống lão hóa, làm trẻ hóa da\r\n- Làm săn chắc da\r\n- Phục hồi da sau tổn thương\r\n- Giữ ẩm cho da\r\n-trị mụn ', 0, 'c2.jpg', 430000),
(19, 'Kem trắng da ngừa Lão hoá White Doctor Skin Lighting', 3, 'Xuất xứ : Hàn quốc\r\nKích cỡ : Tiêu chuẩn', 'Ship hàng toàn quốc - Thanh toán khi nhận hàng - Đổi trả dễ dàng\r\n\r\nKem trắng da mặt chống lão hóa White Doctors giúp da trắng sáng, mịn màng tự nhiên, chống lão hóa da, loại bỏ gân máu, xóa bỏ các nếp nhăn, giúp da mặt mềm mại và được thư giãn, tăng sức đề kháng chống viêm da, làm đều tông màu da, se khít lỗ chân lông, da căng mịn hồng hào đẹp tự nhiên.\r\n\r\nThành Phần :\r\n\r\nKem dưỡng trắng da chống lão hóa White Doctors là một sự kết hợp hoàn hảo các tinh chất dưỡng da tự nhiên : Bột Yến Mạch, tinh chất tế bào gốc, tinh chất nhau thai cừu, chiết xuất dầu oliu, dịch chiết xuất nhân sâm, tinh chất Bạch Quả, vitamin E, Vitamin C tinh khiết, vitamin B3, Chất chống nắng SPF 30+,  tinh chất Ọme ga 3, Tinh chất thầu dầu , tinh chất nha đam\r\n\r\nSản phẩm được Bộ Y Tế Cấp Chứng nhận chất lượng Quốc Tế CGMP - ASEAN 18/11/2015 - Đủ tiêu chuẩn lưu hành trên toàn thế giới', 0, 'c3.jpg', 365000),
(20, 'Son Thỏi M.O.I 05 Beautiful Liar Màu Cam Đất (Vỏ Đen)', 1, 'Xuất xứ : hàn Quốc <br />\r\nKích cỡ : Tiêu chuẩn<br />\r\nChất son: \r\nChất son nhẹ môi, lên màu chuẩn.\r\n\r\nMàu son đa dạng, phù hợp với xu hướng.\r\n\r\nƯu thế nổi bật:\r\nNhẹ môi, dễ chịu khi dùng thường xuyên.\r\n\r\nChất dưỡng ẩm sâu và giúp môi mềm mượt.\r\n\r\nMùi vanila ngọt ngào\r\n\r\nBám và giữ màu từ 6-8 tiếng.\r\n\r\nBảo vệ môi dưới ánh nắng tia cực tím.\r\n\r\nChống lão hóa cho môi.', 'Son Thỏi M.O.I (Vỏ Đen) Love M.O.I Special Edition là dòng son môi đến từ thương hiệu mỹ phẩm M.O.I của Việt Nam được sản xuất tại Hàn Quốc, đây là phiên bản giới hạn ra mắt mới nhất trong năm 2020 được đại diện bởi các siêu mẫu Hồ Ngọc Hà, Lan Khuê, Võ Hoàng Yến. Bảng màu đa dạng với 12 màu son phù hợp cho mọi cá tính của các cô nàng Châu Á.', 0, 's1.jpg', 376000),
(21, 'Son Kem Lì M.O.I S-Girls 07 Successful', 1, 'Xuất xứ : hàn Quốc <br />\r\nKích cỡ : Tiêu chuẩn<br />\r\nƯu điểm nổi bật:\r\nChất son mịn lì nhưng nhẹ tênh trên môi, tạo cảm giác dễ chịu khi dùng thường xuyên.\r\nChứa dưỡng chất giúp cung cấp độ ẩm chuyên sâu, giúp môi mềm mượt.\r\nBền màu, lâu trôi suốt nhiều giờ đồng hồ.\r\nBộ sưu tập màu sắc thời trang, thích hợp cho nhiều phong cách makeup khác nhau.\r\nChứa thành phần giúp ngăn ngừa lão hóa cho da môi.', 'Sau những thành công nhất định với 3 dòng sản phẩm trước của thương hiệu M.O.I Cosmetics, đến đầu tháng 10/2019, “nữ hoàng giải trí” Hồ Ngọc Hà đã bắt tay cùng với ca sĩ – hoa hậu Hương Giang để hợp tác cho ra mắt dòng son kem lì mang tên “S-Girls by Hương Giang” mới toanh. Bộ sưu tập son lần này lấy cảm hứng từ thế hệ các cô gái trẻ hiện đại ngày nay, với tình yêu cái đẹp mãnh liệt, khả năng tự tin thể hiện phong cách của bản thân và luôn dẫn đầu các xu hướng.', 0, 's2.jpg', 186000),
(22, 'Son Lì VDIVOV BB805 Tag Beige 3.8g', 1, 'Xuất xứ : hàn Quốc <br />\r\nKích cỡ : Tiêu chuẩn<br />\r\nBảo quản:<br />\r\n\r\nTránh ánh nắng trực tiếp.<br />\r\n\r\nĐể nơi khô ráo, thoáng mát.<br />\r\n\r\nĐậy nắp kín sau khi sử dụng.<br />\r\n\r\nTrọng lượng: 3.8g<br />\r\n\r\nThương hiệu: VDIVOV<br />\r\n', 'Son Thỏi Mịn Môi VDIVOV Lip Cut Rouge là sản phẩm đến từ thương hiệu VDIVOV của Hàn Quốc. Sản phẩm có thiết kế vỏ vô cùng sang trọng cùng chất son mịn mượt như nhung với nhiều màu sắc vô cùng trendy giúp đôi môi trở nên quyến rũ, cuốn hút hơn nhiều lần.', 0, 's3.jpg', 328000),
(23, 'Son Lì Lâu Trôi Essance RD404 Pure Red 3.5g', 1, 'Xuất xứ : hàn Quốc <br />\r\nKích cỡ : Tiêu chuẩn<br />\r\nChất son:<br />\r\nChất son mịn trải đều trên môi.<br />\r\n\r\nDễ dàng apply, lên màu chuẩn ngay sau 1 lần apply.<br />\r\n\r\nKhông gây khô môi, khó chịu.<br />\r\n\r\nƯu thế nổi bật:<br />\r\nHiệu ứng mịn lì sắc sảo nhờ sự kết hợp thành phần Velvet Powder và Matter Powder.<br />\r\n\r\nCác hạt thành phần có độ lớn khách nhau giúp son bám chặt trên đôi môi.', 'Son Lì Lâu Trôi Essance Lip Rouge Velvet 3.5g là dòng son môi đến từ thương hiệu mỹ phẩm Essance của Hàn Quốc, với thành phần Velvet Powder và Matter Powder mang lại hiệu ứng mịn lì sắc sảo, son bám chặt trên môi nhưng lại không hề gây cảm giác khô môi, bong tróc, bảng màu đa dạng cho mọi phong cách.', 0, 's4.jpg', 197000),
(24, 'Son Màu Dưỡng Môi Maybelline Màu Cam Đất 518 Chillionaire 3.9g', 1, 'Xuất xứ : hàn Quốc <br />\r\nKích cỡ : Tiêu chuẩn<br />\r\nĐặc điểm nổi bật:<br />\r\n\r\n- Tông màu son siêu đẹp và cực kì dễ dùng.<br />\r\n\r\n- Chất son mịn mượt, nhẹ môi, cho lớp finish mềm mại.<br />\r\n\r\n- Hiệu ứng satin quyến rũ, bền màu và không khô môi.<br />\r\n\r\n- Tinh chất mật ong dưỡng môi giúp môi căng mọng suốt cả ngày.<br />\r\n\r\n- Thiết kế vỏ son trong suốt tinh tế và sang trọng, kích cỡ nhỏ gọn tiện mang theo bên mình bất cứ đâu.<br />', 'Những dòng son lì tuy có màu sắc rất đẹp nhưng luôn khiến bờ môi bạn khô căng, khó chịu thậm chí ngày càng thâm, xỉn màu hơn. Lúc này, một thỏi son màu bổ sung dưỡng chất thực sự là điều cấp thiết. Son Màu Dưỡng Môi từ thương hiệu Maybelline với các gam màu siêu đẹp và cực hot cùng thành phần giàu độ ẩm sẽ giúp đôi môi bạn luôn mềm mượt và quyến rũ suốt cả ngày dài, chắc chắn sẽ là dự lựa chọn phù hợp mà các nàng môi khô không nên bỏ qua.', 0, 's5.jpg', 311000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `name`, `email`, `password`) VALUES
(1, 'Nguyễn Văn A', 'admin1@mail.com', '202cb962ac59075b964b07152d234b70'),
(2, 'Nguyễn Văn B', 'admin2@mail.com', '202cb962ac59075b964b07152d234b70'),
(3, 'Nguyễn Văn C', 'admin3@mail.com', '202cb962ac59075b964b07152d234b70'),
(4, 'Nguyễn Văn D', 'admin4@mail.com', '202cb962ac59075b964b07152d234b70');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`order_detail_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
