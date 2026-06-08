-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 08 Jun 2026 pada 03.22
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventori_barang25550012`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `kd_kat` varchar(6) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `kd_kat`, `category_name`) VALUES
(1, 'K001', 'Makanan Instant'),
(2, 'K002', 'Minuman Kemasan'),
(3, 'K003', 'Snack'),
(4, 'K004', 'Sayuran'),
(5, 'K005', 'Makanan Beku');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `min_stock` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_code`, `product_name`, `stock`, `min_stock`, `price`, `gambar`, `created_at`, `update_at`) VALUES
(2, 2, 'P002', 'Buavita Jus Jambu', 6, 5, 8000, '2096bb18ae6d72f3e2e09a038f3589e6.jpg', '2026-05-12 03:22:00', NULL),
(3, 1, 'P003', 'Mie Lemonilo Pedas Korea', 15, 5, 6000, 'f628c8f1080270150323b4a6046ffd4a.jpg', '2026-05-21 04:38:14', NULL),
(4, 4, 'P004', 'Jamur Enoki', 40, 5, 7000, 'bcac57cf67c4c6156b297a59aa51e4c7.jpg', '2026-05-21 04:40:08', NULL),
(5, 4, 'P005', 'Pakcoy', 20, 5, 5000, 'f93bda25898f055fb139c727f7073ddb.jpg', '2026-05-21 04:41:55', NULL),
(6, 3, 'P006', 'Kentang Goreng', 43, 10, 2000, 'e72828e26cab3f1daa5aa7b23485bdf0.jpg', '2026-05-21 04:43:52', NULL),
(7, 1, 'P007', 'Nissin Gekikara Ramen Goreng Hot Chicken ', 20, 5, 4000, '131a5aae191b2be2726087ed0e063912.jpg', '2026-06-04 05:11:07', NULL),
(8, 2, 'P008', 'Teh Pucuk Harum 350ml', 40, 10, 3000, '4d806f5335ee7d1a04170b4b2d99bc77.webp', '2026-06-04 05:16:37', NULL),
(9, 2, 'P009', 'Buavita Jus Jeruk', 45, 10, 4500, '57ca927dac0b8c46ae93b40a78545121.jpg', '2026-06-04 05:17:10', NULL),
(10, 2, 'P010', 'Nescafe latte', 30, 5, 6000, '289f6aac8ca3db4c2c2eb4393cc26377.jpg', '2026-06-04 05:18:47', NULL),
(11, 3, 'P011', 'Japota Umami Japanese Seaweed', 40, 5, 5000, 'd890141dfbc8017bf47f7ddd978f32b2.jpg', '2026-06-04 05:22:00', NULL),
(12, 3, 'P012', 'Guribee Layers', 50, 10, 2000, 'dfa78bd74e23523243e62ad706685c1e.jpg', '2026-06-04 05:24:15', NULL),
(13, 3, 'P013', 'Kacang Garuda Rosta', 40, 10, 2000, '8c6080190a2b1abc90e8857825f1054f.webp', '2026-06-04 05:24:48', NULL),
(14, 4, 'P014', 'Sawi Putih', 20, 5, 8000, '88605675b4b434dbacdfbc91b9770f7c.jpg', '2026-06-04 05:27:34', NULL),
(15, 4, 'P015', 'Bayam Merah', 20, 5, 7000, '6f035938d55202a5749013458aafc3ea.jpg', '2026-06-04 05:28:42', NULL),
(16, 1, 'P016', 'Topokki', 25, 5, 10000, 'd3ad23752e3a48c4924dbbafbd5287f4.jpg', '2026-06-04 05:30:10', NULL),
(17, 1, 'P017', 'Jajangmyeon', 12, 5, 9000, '67c5705ad8abe615832fa61bfffeeed5.webp', '2026-06-04 05:34:05', NULL),
(18, 5, 'P018', 'Baso Ikan', 30, 5, 10000, '4bfcc79b6052b8857e551191d73901fd.jpg', '2026-06-04 05:57:29', NULL),
(19, 5, 'P019', 'Kanzler Chicken Nugget', 40, 5, 25000, '1a7b88d1647cd8a58c38081b5a1ebb33.jpg', '2026-06-04 05:58:18', NULL),
(20, 5, 'P020', 'Kanzler Sosis Keju', 25, 5, 20000, 'bbfc672ad7702d063ec326b52a6c5749.jpg', '2026-06-04 05:59:08', NULL),
(21, 5, 'P021', 'Tempura', 30, 5, 15000, 'f6bc08e26e82a18f4ec471ced7668dcb.jpg', '2026-06-04 05:59:36', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_logs`
--

CREATE TABLE `stock_logs` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `change_type` enum('ADD','EDIT','REDUCE') DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `stock_before` int(11) DEFAULT NULL,
  `stock_after` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `stock_logs`
--

INSERT INTO `stock_logs` (`id`, `product_id`, `change_type`, `qty`, `stock_before`, `stock_after`, `note`, `created_at`, `created_by`) VALUES
(1, 1, 'ADD', 14, 45, 59, '', '2026-05-21 04:21:46', 0),
(2, 1, 'ADD', 14, 59, 73, '', '2026-05-21 04:23:43', 0),
(3, 2, 'REDUCE', 1, 35, 34, '', '2026-05-21 04:27:07', 0),
(4, 1, 'ADD', 10, 10, 20, '', '2026-05-21 04:31:29', 0),
(5, 6, 'ADD', 3, 40, 43, '', '2026-05-21 04:58:25', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','staff') DEFAULT 'staff',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `is_active`, `created_at`) VALUES
(2, 'kirana cinta mentari', 'kanaira01@gmail.com', '$2y$10$0NlXNt1o8YPjCo0FrFToyOqjtukEBD6IuoQ7U3Pi2PRcRkbL/Q94G', 'staff', 1, '2026-06-04 02:12:15'),
(3, 'kanaira', 'kanairaa21@gmail.com', '123456', 'admin', 1, '2026-06-04 03:09:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kd_kat` (`kd_kat`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_id` (`category_id`,`product_code`);

--
-- Indexes for table `stock_logs`
--
ALTER TABLE `stock_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `stock_logs`
--
ALTER TABLE `stock_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
