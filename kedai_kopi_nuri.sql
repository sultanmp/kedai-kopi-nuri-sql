-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2023 at 05:39 PM
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
-- Database: `kedai kopi nuri`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID_customer` char(6) NOT NULL,
  `Nama_Customer` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID_customer`, `Nama_Customer`) VALUES
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
  `no_telepon_customer` varchar(15) DEFAULT NULL,
  `alamat_customer` varchar(150) DEFAULT NULL,
  `tanggal_pembuatan_kartu_membership` date DEFAULT curdate(),
  `tanggal_kedaluwarsa_kartu_membership` date DEFAULT NULL,
  `total_poin` int(11) DEFAULT NULL,
  `customer_id_customer` char(6) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `menu_minuman`
--

CREATE TABLE `menu_minuman` (
  `ID_minuman` char(5) NOT NULL,
  `Nama_minuman` varchar(50) DEFAULT NULL,
  `Harga_minuman` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_minuman`
--

INSERT INTO `menu_minuman` (`ID_minuman`, `Nama_minuman`, `Harga_minuman`) VALUES
('MNM01', 'Expresso', 18000),
('MNM02', 'Cappuccino', 20000),
('MNM03', 'Latte', 21000),
('MNM04', 'Americano', 19000),
('MNM05', 'Mocha', 22000),
('MNM06', 'Macchiato', 23000),
('MNM07', 'Cold Brew', 21000),
('MNM08', 'Iced Coffee', 18000),
('MNM09', 'Affogato', 23000),
('MNM10', 'Coffee Frappe', 22000);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `NIK` char(16) NOT NULL,
  `Nama_pegawai` varchar(100) DEFAULT NULL,
  `Jenis_kelamin` char(1) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Umur` int(11) DEFAULT NULL,
  `nomor_telepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`NIK`, `Nama_pegawai`, `Jenis_kelamin`, `Email`, `Umur`, `nomor_telepon`) VALUES
('1234567890123456', 'Naufal Raf', 'L', 'naufal@gmail.com', 19, '62123456789'),
('2345678901234561', 'Surinala', 'P', 'surinala@gmail.com', 24, '621234567890'),
('3456789012345612', 'Ben John', 'L', 'benjohn@gmail.com', 22, '6212345678');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_transaksi` char(10) NOT NULL,
  `Tanggal_transaksi` date DEFAULT NULL,
  `Metode_pembayaran` varchar(15) DEFAULT NULL,
  `Customer_ID_customer` char(6) DEFAULT NULL,
  `Pegawai_NIK` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID_transaksi`, `Tanggal_transaksi`, `Metode_pembayaran`, `Customer_ID_customer`, `Pegawai_NIK`) VALUES
('TRX0000001', '2023-10-01', 'Kartu kredit', 'CTR002', '2345678901234561'),
('TRX0000002', '2023-10-03', 'Transfer bank', 'CTR004', '3456789012345612'),
('TRX0000003', '2023-10-05', 'Tunai', 'CTR001', '3456789012345612'),
('TRX0000004', '2023-10-15', 'Kartu debit', 'CTR003', '1234567890123456'),
('TRX0000005', '2023-10-15', 'E-wallet', 'CTR004', '1234567890123456'),
('TRX0000006', '2023-10-21', 'Tunai', 'CTR001', '2345678901234561'),
('TRX0000007', '2023-10-03', 'Transfer bank', 'CTR004', '3456789012345612');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_minuman`
--

CREATE TABLE `transaksi_minuman` (
  `TM_Menu_minuman_ID` char(6) NOT NULL,
  `TM_Transaksi_ID` char(10) NOT NULL,
  `Jumlah_cup` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_minuman`
--

INSERT INTO `transaksi_minuman` (`TM_Menu_minuman_ID`, `TM_Transaksi_ID`, `Jumlah_cup`) VALUES
('MNM01', 'TRX0000003', 3),
('MNM01', 'TRX0000005', 1),
('MNM03', 'TRX0000002', 2),
('MNM03', 'TRX0000003', 1),
('MNM03', 'TRX0000006', 2),
('MNM04', 'TRX0000004', 2),
('MNM05', 'TRX0000007', 1),
('MNM06', 'TRX0000002', 1),
('MNM06', 'TRX0000005', 2),
('MNM07', 'TRX0000001', 1),
('MNM09', 'TRX0000005', 1),
('MNM10', 'TRX0000001', 1),
('MNM10', 'TRX0000004', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID_customer`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id_membership`),
  ADD KEY `fk_customer_membership` (`customer_id_customer`);

--
-- Indexes for table `menu_minuman`
--
ALTER TABLE `menu_minuman`
  ADD PRIMARY KEY (`ID_minuman`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`NIK`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_transaksi`),
  ADD KEY `Pegawai_NIK` (`Pegawai_NIK`),
  ADD KEY `fk_customer_transaksi` (`Customer_ID_customer`);

--
-- Indexes for table `transaksi_minuman`
--
ALTER TABLE `transaksi_minuman`
  ADD PRIMARY KEY (`TM_Menu_minuman_ID`,`TM_Transaksi_ID`),
  ADD KEY `TM_Transaksi_ID` (`TM_Transaksi_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `fk_customer_membership` FOREIGN KEY (`customer_id_customer`) REFERENCES `customer` (`ID_customer`) ON UPDATE CASCADE,
  ADD CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`customer_id_customer`) REFERENCES `customer` (`ID_customer`) ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_customer_transaksi` FOREIGN KEY (`Customer_ID_customer`) REFERENCES `customer` (`ID_customer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`Customer_ID_customer`) REFERENCES `customer` (`ID_customer`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`Pegawai_NIK`) REFERENCES `pegawai` (`NIK`);

--
-- Constraints for table `transaksi_minuman`
--
ALTER TABLE `transaksi_minuman`
  ADD CONSTRAINT `transaksi_minuman_ibfk_1` FOREIGN KEY (`TM_Menu_minuman_ID`) REFERENCES `menu_minuman` (`ID_minuman`),
  ADD CONSTRAINT `transaksi_minuman_ibfk_2` FOREIGN KEY (`TM_Transaksi_ID`) REFERENCES `transaksi` (`ID_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
