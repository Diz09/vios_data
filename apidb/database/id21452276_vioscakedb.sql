-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 03, 2024 at 04:06 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21452276_vioscakedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `basecake`
--

CREATE TABLE `basecake` (
  `id_basecake` int(11) NOT NULL,
  `basecake` varchar(50) NOT NULL,
  `gambar_basecake` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `basecake`
--

INSERT INTO `basecake` (`id_basecake`, `basecake`, `gambar_basecake`) VALUES
(1, 'Brownies', 'brownies.png'),
(2, 'Black Forest', 'blackForest.png'),
(3, 'choco Devil', 'chocoDevil.png'),
(4, 'Matcha', 'matcha.png'),
(5, 'Redvelvet', 'redVelvet.png'),
(6, 'Pandan', 'pandan.png'),
(7, 'Vanila Keju', 'vanilaKeju.png'),
(8, 'Vanila Strawberry', NULL),
(9, 'Burn Cheese Cake', 'burnChese.png');

-- --------------------------------------------------------

--
-- Table structure for table `catatan`
--

CREATE TABLE `catatan` (
  `id_catatan` int(11) NOT NULL,
  `catatan` text NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `catatan`
--

INSERT INTO `catatan` (`id_catatan`, `catatan`, `waktu`) VALUES
(2, 'simpan database', '2023-12-05 08:32:51'),
(10, 'Tghyuhh', '2024-04-01 02:01:37');

-- --------------------------------------------------------

--
-- Table structure for table `desain`
--

CREATE TABLE `desain` (
  `id_desain` int(11) NOT NULL,
  `gambar` text NOT NULL,
  `jenis` enum('birthday','bento') NOT NULL,
  `harga` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `desain`
--

INSERT INTO `desain` (`id_desain`, `gambar`, `jenis`, `harga`) VALUES
(1, 'b1.png', 'bento', 0),
(2, 'd12_1.png', 'birthday', 0),
(3, 'd12_2.png', 'birthday', 0),
(4, 'd12_3.png', 'birthday', 0),
(5, 'd12_4.png', 'birthday', 0),
(6, 'b2.png', 'bento', 0),
(7, 'b3.png', 'bento', 0),
(8, 'b4.png', 'bento', 0),
(9, 'b5.png', 'bento', 0),
(10, 'd12_5.png', 'birthday', 0),
(11, 'd13_1.png', 'birthday', 0),
(12, 'd13_2.png', 'birthday', 0),
(13, 'd13_3.png', 'birthday', 0),
(14, 'd13_4.png', 'birthday', 0),
(15, 'd13_5.png', 'birthday', 0),
(16, 'd15_1.png', 'birthday', 0),
(17, 'd15_2.png', 'birthday', 0),
(18, 'd15_3.png', 'birthday', 0),
(19, 'd15_4.png', 'birthday', 0),
(20, 'd15_5.png', 'birthday', 0),
(21, 'd17_1.png', 'birthday', 0),
(22, 'd17_2.png', 'birthday', 0),
(23, 'd17_3.png', 'birthday', 0),
(24, 'd17_4.png', 'birthday', 0),
(25, 'd17_5.png', 'birthday', 0),
(26, 'd19_1.png', 'birthday', 0),
(27, 'd19_2.png', 'birthday', 0),
(28, 'd19_3.png', 'birthday', 0),
(29, 'd19_4.png', 'birthday', 0),
(30, 'd19_5.png', 'birthday', 0),
(31, 'd21_1.png', 'birthday', 0),
(32, 'd21_2.png', 'birthday', 0),
(33, 'd21_3.png', 'birthday', 0),
(34, 'd21_4.png', 'birthday', 0),
(35, 'd21_5.png', 'birthday', 0);

-- --------------------------------------------------------

--
-- Table structure for table `detailharga_ukurandanbasecake`
--

CREATE TABLE `detailharga_ukurandanbasecake` (
  `id_harga` int(11) NOT NULL,
  `id_uk` int(11) NOT NULL,
  `id_ba` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detailharga_ukurandanbasecake`
--

INSERT INTO `detailharga_ukurandanbasecake` (`id_harga`, `id_uk`, `id_ba`, `harga`) VALUES
(1, 1, 1, 33000),
(2, 1, 2, 38000),
(3, 1, 3, 45000),
(4, 1, 4, 30000),
(5, 1, 5, 30000),
(6, 1, 6, 30000),
(7, 1, 7, 35000),
(8, 1, 8, 35000),
(9, 2, 1, 50000),
(10, 3, 1, 59000),
(11, 4, 1, 69000),
(12, 5, 1, 90000),
(13, 6, 1, 129000),
(14, 2, 2, 55000),
(15, 3, 2, 65000),
(16, 4, 2, 85000),
(17, 5, 2, 95000),
(18, 6, 2, 135000),
(19, 2, 3, 60000),
(20, 3, 3, 70000),
(21, 4, 3, 95000),
(22, 5, 3, 105000),
(23, 6, 3, 155000),
(24, 2, 4, 45000),
(25, 3, 4, 50000),
(26, 4, 4, 60000),
(27, 5, 4, 80000),
(28, 6, 4, 110000),
(29, 2, 5, 45000),
(30, 3, 5, 50000),
(31, 4, 5, 60000),
(32, 5, 5, 80000),
(33, 6, 5, 110000),
(34, 2, 6, 45000),
(35, 3, 6, 50000),
(36, 4, 6, 60000),
(37, 5, 6, 80000),
(38, 6, 6, 110000),
(39, 2, 7, 50000),
(40, 3, 7, 55000),
(41, 4, 7, 65000),
(42, 5, 7, 90000),
(43, 6, 7, 120000),
(44, 2, 8, 50000),
(45, 3, 8, 55000),
(46, 4, 8, 65000),
(47, 5, 8, 90000),
(48, 6, 8, 120000),
(49, 7, 1, 160000),
(50, 8, 1, 190000),
(51, 9, 1, 231000),
(52, 10, 1, 264000),
(53, 7, 2, 175000),
(54, 8, 2, 210000),
(55, 9, 2, 245000),
(56, 10, 2, 279000),
(57, 7, 3, 195000),
(58, 8, 3, 235000),
(59, 9, 3, 270000),
(60, 10, 3, 305000),
(61, 7, 4, 150000),
(62, 8, 4, 180000),
(63, 9, 4, 210000),
(64, 10, 4, 240000),
(65, 7, 5, 150000),
(66, 8, 5, 180000),
(67, 9, 5, 210000),
(68, 10, 5, 240000),
(69, 7, 6, 150000),
(70, 8, 6, 180000),
(71, 9, 6, 210000),
(72, 10, 6, 240000),
(73, 7, 7, 165000),
(74, 8, 7, 190000),
(75, 9, 7, 225000),
(76, 10, 7, 250000),
(77, 7, 8, 165000),
(78, 8, 8, 190000),
(79, 9, 8, 225000),
(80, 10, 8, 250000),
(81, 11, 1, 299000),
(82, 12, 1, 355000),
(83, 11, 2, 310000),
(84, 12, 2, 375000),
(85, 11, 3, 360000),
(86, 12, 3, 400000),
(87, 11, 4, 270000),
(88, 12, 4, 300000),
(89, 11, 5, 270000),
(90, 12, 5, 300000),
(91, 11, 6, 270000),
(92, 12, 6, 300000),
(93, 11, 7, 335000),
(94, 12, 7, 390000),
(95, 11, 8, 335000),
(96, 12, 8, 390000);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_user` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_user`, `username`, `password`, `alamat`) VALUES
(1, 'a', 'a', '0'),
(2, 'b', 'b', 'bb'),
(3, 'ca', '1', 'ss'),
(4, 'sa', '1', 'aa'),
(5, 'dimas', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `pricelist`
--

CREATE TABLE `pricelist` (
  `id_prilist` int(11) NOT NULL,
  `gambar_prilist` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `toping`
--

CREATE TABLE `toping` (
  `id_topping` int(11) NOT NULL,
  `topping` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `toping`
--

INSERT INTO `toping` (`id_topping`, `topping`, `harga`) VALUES
(1, 'Lilin spiral gold/silver', 3000),
(2, 'Lilin uril & pisau kecil', 1000),
(3, 'Lilin uril panjang gold', 3000),
(4, 'Lilin angka biasa', 4000),
(5, 'Lilin angka gold/silver', 7000),
(6, 'Topper karakter 3r', 5000),
(7, 'Topper karakter 5r', 8000),
(8, 'Topper karakter 8r', 12000),
(9, 'Topper karakter 10r', 15000),
(10, 'Topper HBD gold', 8000),
(11, 'Topper HBD hitam', 8000),
(12, 'Papan nama coklat kecil', 5000),
(13, 'Papan nama coklat besar', 8000),
(14, 'Sprinkle', 0),
(15, 'Small crown', 18000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total` int(11) NOT NULL DEFAULT 0,
  `status` enum('Menunggu konfirmasi','menunggu pembayaran','kue dibuat','selesai') NOT NULL,
  `keterangan` varchar(50) NOT NULL DEFAULT 'Tidak ada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_user`, `waktu`, `total`, `status`, `keterangan`) VALUES
(1, 2, '2023-11-15 00:15:34', 90000, 'selesai', 'Tidak ada'),
(2, 4, '2023-11-30 04:59:44', 200000, 'kue dibuat', 'Tidak ada'),
(3, 4, '2023-12-20 04:02:42', 80000, 'selesai', 'Tidak ada'),
(4, 2, '2023-12-02 02:10:20', 0, 'Menunggu konfirmasi', 'Tidak ada');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id_transaksi` int(11) NOT NULL,
  `id_harga` int(11) NOT NULL,
  `id_topping` int(11) NOT NULL,
  `id_desain` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id_transaksi`, `id_harga`, `id_topping`, `id_desain`, `id_user`, `subtotal`, `waktu`) VALUES
(1, 2, 4, 1, 2, 70000, '2023-11-30 11:02:46'),
(2, 2, 2, 1, 4, 222000, '2023-12-01 00:27:56'),
(4, 12, 10, 2, 2, 8000, '2023-12-01 23:48:34'),
(3, 7, 13, 3, 4, 70000, '2023-12-01 23:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `ukuran_cake`
--

CREATE TABLE `ukuran_cake` (
  `id_ukuran` int(11) NOT NULL,
  `ukuran` varchar(8) NOT NULL,
  `jenis` enum('birthday','bento') NOT NULL,
  `gambar_ukuran` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ukuran_cake`
--

INSERT INTO `ukuran_cake` (`id_ukuran`, `ukuran`, `jenis`, `gambar_ukuran`) VALUES
(1, '10cm', 'bento', NULL),
(2, '12cm', 'birthday', NULL),
(3, '13cm', 'birthday', NULL),
(4, '15cm', 'birthday', NULL),
(5, '17cm', 'birthday', NULL),
(6, '19cm', 'birthday', NULL),
(7, '21cm', 'birthday', NULL),
(8, '23cm', 'birthday', NULL),
(9, '25cm', 'birthday', NULL),
(10, '27cm', 'birthday', NULL),
(11, '29cm', 'birthday', NULL),
(12, '31cm', 'birthday', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `apiKey` text DEFAULT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(11) NOT NULL,
  `user_fullname` varchar(50) NOT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `alamat` varchar(225) DEFAULT NULL,
  `pict` text DEFAULT NULL,
  `tanggal_gabung` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_level` int(11) NOT NULL,
  `reset_password_otp` text DEFAULT NULL,
  `reset_password_created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `apiKey`, `user_email`, `user_password`, `user_fullname`, `telp`, `alamat`, `pict`, `tanggal_gabung`, `id_level`, `reset_password_otp`, `reset_password_created_at`) VALUES
(1, 'f694b6ae0bfbcb1cfd9f875fce658560bdbe2903e2300e', 'vioscake1@gmail.com', 'vios1234', 'VIOSCAKE', '81336496191', 'Jember', 'profile.png', '2023-12-13 03:13:08', 1, '119415', '2023-12-05 03:44:34'),
(2, '', 'izzulhaqzaindimad@gmail.com', 'Qww122', 'Dimas', '085335114721', 'Situbondo', 'dimas.png', '2023-12-05 03:51:45', 2, '895164', '2023-12-05 03:51:45'),
(4, '9c4d00b06e176f46cae6def97ed8e775d7766c003f02ad', 'das@gmail.com', '1111', 'dana', '0866255144', 'Surakarta', 'animecuy.png', '2023-12-05 09:20:37', 2, NULL, NULL),
(5, '', 'dis@gmail.com', '11', 'djaka', NULL, NULL, NULL, '2023-12-05 00:26:27', 2, NULL, NULL),
(8, '', 'dik@gmail.com', '22', 'dika', NULL, NULL, NULL, '2023-12-05 00:26:27', 2, NULL, NULL),
(10, '', 'test@gmail.com', '1111', 'Test', NULL, NULL, 'profile.png', '2023-12-05 04:22:28', 2, NULL, NULL),
(11, '01bdc77b236a2cb75666549b931784d38360f22ad60bee', 'test2@gmail.com', '1111', 'Test kedua', NULL, NULL, NULL, '2023-12-05 07:31:00', 2, NULL, NULL),
(12, '434bac3659e2b4c833c999c174de536c357f2924854253', 'deny@gmail.com', 'deny123', 'Deny', NULL, NULL, NULL, '2023-12-05 08:44:08', 2, NULL, NULL),
(13, NULL, 'd@gmail.com', '1234', 'fi', NULL, NULL, NULL, '2024-03-03 22:37:54', 2, NULL, NULL),
(14, NULL, 'da@gmail.com', '1111', 'dimas', NULL, NULL, NULL, '2024-04-01 01:57:24', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE `user_level` (
  `id_level` int(11) NOT NULL,
  `level` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`id_level`, `level`) VALUES
(1, 'admin'),
(2, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basecake`
--
ALTER TABLE `basecake`
  ADD PRIMARY KEY (`id_basecake`);

--
-- Indexes for table `catatan`
--
ALTER TABLE `catatan`
  ADD PRIMARY KEY (`id_catatan`);

--
-- Indexes for table `desain`
--
ALTER TABLE `desain`
  ADD PRIMARY KEY (`id_desain`);

--
-- Indexes for table `detailharga_ukurandanbasecake`
--
ALTER TABLE `detailharga_ukurandanbasecake`
  ADD PRIMARY KEY (`id_harga`),
  ADD KEY `c8` (`id_uk`),
  ADD KEY `c9` (`id_ba`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `pricelist`
--
ALTER TABLE `pricelist`
  ADD PRIMARY KEY (`id_prilist`);

--
-- Indexes for table `toping`
--
ALTER TABLE `toping`
  ADD PRIMARY KEY (`id_topping`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `c4` (`id_user`);

--
-- Indexes for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD KEY `c3` (`id_user`),
  ADD KEY `c6` (`id_topping`),
  ADD KEY `c7` (`id_desain`),
  ADD KEY `c2` (`id_transaksi`),
  ADD KEY `c5` (`id_harga`);

--
-- Indexes for table `ukuran_cake`
--
ALTER TABLE `ukuran_cake`
  ADD PRIMARY KEY (`id_ukuran`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c1` (`id_level`);

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `basecake`
--
ALTER TABLE `basecake`
  MODIFY `id_basecake` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `catatan`
--
ALTER TABLE `catatan`
  MODIFY `id_catatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `desain`
--
ALTER TABLE `desain`
  MODIFY `id_desain` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `detailharga_ukurandanbasecake`
--
ALTER TABLE `detailharga_ukurandanbasecake`
  MODIFY `id_harga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pricelist`
--
ALTER TABLE `pricelist`
  MODIFY `id_prilist` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `toping`
--
ALTER TABLE `toping`
  MODIFY `id_topping` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ukuran_cake`
--
ALTER TABLE `ukuran_cake`
  MODIFY `id_ukuran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailharga_ukurandanbasecake`
--
ALTER TABLE `detailharga_ukurandanbasecake`
  ADD CONSTRAINT `c8` FOREIGN KEY (`id_uk`) REFERENCES `ukuran_cake` (`id_ukuran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `c9` FOREIGN KEY (`id_ba`) REFERENCES `basecake` (`id_basecake`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `c4` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `c2` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  ADD CONSTRAINT `c3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `c5` FOREIGN KEY (`id_harga`) REFERENCES `detailharga_ukurandanbasecake` (`id_harga`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `c6` FOREIGN KEY (`id_topping`) REFERENCES `toping` (`id_topping`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `c7` FOREIGN KEY (`id_desain`) REFERENCES `desain` (`id_desain`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `c1` FOREIGN KEY (`id_level`) REFERENCES `user_level` (`id_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
