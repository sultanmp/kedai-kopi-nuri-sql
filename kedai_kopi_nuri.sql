-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2023 at 12:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pendahuluan3`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` char(6) NOT NULL,
  `nama_customer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_customer`) VALUES
('CTR001', 'Budi Santoso'),
('CTR002', 'Sisil Triana'),
('CTR003', 'Davi Liam'),
('CTR004', 'Sutris Ten An'),
('CTR005', 'Hendra Asto');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id_membership` char(6) NOT NULL,
  `no_telp_customer` varchar(15) NOT NULL,
  `alamat_customer` varchar(150) DEFAULT NULL,
  `tanggal_pembuatan` date DEFAULT NULL,
  `tanggal_kedaluwarsa` date DEFAULT NULL,
  `total_poin` int(11) NOT NULL,
  `m_id_customer` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id_membership`, `no_telp_customer`, `alamat_customer`, `tanggal_pembuatan`, `tanggal_kedaluwarsa`, `total_poin`, `m_id_customer`) VALUES
('MBR001', '08123456789', 'Jl. Imam Bonjol', '2023-10-24', '2023-11-30', 0, 'CTR001'),
('MBR002', '0812345678', 'Jl. Kelinci', '2023-10-24', '2023-11-30', 0, 'CTR002'),
('MBR003', '081234567890', 'Jl. Abah Ojak', '2023-10-25', '2023-12-01', 2, 'CTR003'),
('MBR004', '08987654321', 'Jl. Kenangan', '2023-10-26', '2023-12-02', 6, 'CTR005');

-- --------------------------------------------------------

--
-- Table structure for table `menu_minuman`
--

CREATE TABLE `menu_minuman` (
  `id_minuman` char(6) NOT NULL,
  `nama_minuman` varchar(50) NOT NULL,
  `harga_minuman` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_minuman`
--

INSERT INTO `menu_minuman` (`id_minuman`, `nama_minuman`, `harga_minuman`) VALUES
('MNM001', 'Expresso', 18000),
('MNM002', 'Cappucino', 20000),
('MNM003', 'Latte', 21000),
('MNM004', 'Americano', 19000),
('MNM005', 'Mocha', 22000),
('MNM006', 'Macchiato', 23000),
('MNM007', 'Cold Brew', 21000),
('MNM008', 'Iced Coffe', 18000),
('MNM009', 'Affogato', 23000),
('MNM010', 'Coffe Frappe', 22000);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nik` char(16) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `umur` int(11) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nik`, `nama_pegawai`, `jenis_kelamin`, `email`, `umur`, `telepon`) VALUES
('1111222233334444', 'Maimunah', 'P', 'maimunah@gmail.com', 25, '621234567'),
('1234567890123456', 'Naufal Raf', 'L', 'naufal@gmail.com', 19, '62123456789'),
('2345678901234561', 'Surinala', 'P', 'surinala@gmail.com', 24, '621234567890'),
('3456789012345612', 'Ben John', 'L', 'benjohn@gmail.com', 22, '6212345678');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` char(10) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `metode_pembayaran` varchar(15) NOT NULL,
  `customer_id_customer` char(6) NOT NULL,
  `pegawai_nik` char(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tanggal_transaksi`, `metode_pembayaran`, `customer_id_customer`, `pegawai_nik`) VALUES
('TRX0000001', '2023-10-01', 'Kartu kredit', 'CTR002', '2345678901234561'),
('TRX0000002', '2023-10-03', 'Transfer bank', 'CTR004', '3456789012345612'),
('TRX0000003', '2023-10-05', 'Tunai', 'CTR001', '3456789012345612'),
('TRX0000004', '2023-10-15', 'Kartu debit', 'CTR003', '1234567890123456'),
('TRX0000005', '2023-10-15', 'E-wallet', 'CTR004', '1234567890123456'),
('TRX0000006', '2023-10-21', 'Tunai', 'CTR001', '2345678901234561'),
('TRX0000007', '2023-10-03', 'Transfer bank', 'CTR004', '2345678901234561');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_minuman`
--

CREATE TABLE `transaksi_minuman` (
  `tm_menu_minuman_id` char(6) NOT NULL,
  `tm_transaksi_id` char(10) NOT NULL,
  `jumlah_minuman` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_minuman`
--

INSERT INTO `transaksi_minuman` (`tm_menu_minuman_id`, `tm_transaksi_id`, `jumlah_minuman`) VALUES
('MNM001', 'TRX0000003', 3),
('MNM001', 'TRX0000005', 1),
('MNM003', 'TRX0000002', 2),
('MNM003', 'TRX0000003', 1),
('MNM003', 'TRX0000006', 2),
('MNM004', 'TRX0000004', 2),
('MNM005', 'TRX0000002', 1),
('MNM005', 'TRX0000007', 1),
('MNM006', 'TRX0000005', 2),
('MNM007', 'TRX0000001', 1),
('MNM009', 'TRX0000005', 1),
('MNM010', 'TRX0000001', 1),
('MNM010', 'TRX0000004', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id_membership`),
  ADD KEY `FK_customer_membership` (`m_id_customer`);

--
-- Indexes for table `menu_minuman`
--
ALTER TABLE `menu_minuman`
  ADD PRIMARY KEY (`id_minuman`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `FK_pegawai_transaksi` (`pegawai_nik`),
  ADD KEY `FK_customer_transaksi` (`customer_id_customer`);

--
-- Indexes for table `transaksi_minuman`
--
ALTER TABLE `transaksi_minuman`
  ADD PRIMARY KEY (`tm_menu_minuman_id`,`tm_transaksi_id`),
  ADD KEY `FK_transaksi_tm` (`tm_transaksi_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `FK_customer_membership` FOREIGN KEY (`m_id_customer`) REFERENCES `customer` (`id_customer`) ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `FK_customer_transaksi` FOREIGN KEY (`customer_id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pegawai_transaksi` FOREIGN KEY (`pegawai_nik`) REFERENCES `pegawai` (`nik`);

--
-- Constraints for table `transaksi_minuman`
--
ALTER TABLE `transaksi_minuman`
  ADD CONSTRAINT `FK_minuman_tm` FOREIGN KEY (`tm_menu_minuman_id`) REFERENCES `menu_minuman` (`id_minuman`),
  ADD CONSTRAINT `FK_transaksi_tm` FOREIGN KEY (`tm_transaksi_id`) REFERENCES `transaksi` (`id_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
