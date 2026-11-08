-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 02, 2026 lúc 12:18 PM
-- Phiên bản máy phục vụ: 10.11.16-MariaDB
-- Phiên bản PHP: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `iphone_store_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_phone` varchar(50) NOT NULL,
  `customer_address` text NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `total_price` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `customer_phone`, `customer_address`, `product_name`, `total_price`, `created_at`) VALUES
(2, 'Nguyễn Hoàng Thông', '0999999999', 'tp.hcm\n', 'iPhone 14 Pro Max 256GB', 27490000, '2026-11-02 16:22:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `specs` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `specs`, `description`) VALUES
(1, 'iPhone 15 Pro Max 256GB', 34990000, 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15-pro-max.jpg', 'Apple A17 Pro, 8GB RAM, 256GB', 'Khung Titan cao cấp, camera zoom quang học 5x.'),
(2, 'iPhone 14 Pro Max 256GB', 27490000, 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-14-pro-max-.jpg', 'Apple A16 Bionic, 6GB RAM, 256GB', 'Dynamic Island thế hệ đầu, camera 48MP sắc nét.'),
(3, 'iPhone 15 128GB', 22990000, 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg', 'Apple A16 Bionic, 6GB RAM, 128GB', 'Thiết kế mặt lưng kính pha màu, cổng sạc Type-C.'),
(4, 'iPhone 13 128GB', 15990000, 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-13.jpg', 'Apple A15 Bionic, 4GB RAM, 128GB', 'Lựa chọn quốc dân trong tầm giá với hiệu năng ổn định.');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
