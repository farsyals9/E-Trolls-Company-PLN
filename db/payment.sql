-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2024 at 08:10 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payment`
--

-- --------------------------------------------------------

--
-- Table structure for table `agen`
--

CREATE TABLE `agen` (
  `id_agen` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `saldo` double NOT NULL,
  `biaya_admin` double NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `akses` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agen`
--

INSERT INTO `agen` (`id_agen`, `nama`, `alamat`, `no_telepon`, `saldo`, `biaya_admin`, `username`, `password`, `akses`) VALUES
('A20180129001', 'Farsya Lisanush Shidqi', 'Jakarta', '08988741360', 0, 5000, 'Farsya', 'farsya123', 'agen');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(14) NOT NULL,
  `no_meter` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tenggang` varchar(2) NOT NULL,
  `id_tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `no_meter`, `nama`, `alamat`, `tenggang`, `id_tarif`) VALUES
('20740301234567', '021823654300', 'Anastasia ', 'Pancoran', '26', 4),
('20740302345678', '021789673524', 'Beatrice', 'Sudirman', '26', 3),
('20740303456789', '021678923570', 'Galvin', 'Anyer', '28', 8),
('20740304567890', '021527839625', 'Fitzgerald', 'Ashta', '28', 5),
('20740305678901', '021426738946', 'Caldwell', 'Menara mandiri', '26', 8);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(15) NOT NULL,
  `id_pelanggan` varchar(14) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `waktu_bayar` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bulan_bayar` varchar(2) NOT NULL,
  `tahun_bayar` year(4) NOT NULL,
  `jumlah_bayar` double NOT NULL,
  `biaya_admin` double NOT NULL,
  `total_akhir` double NOT NULL,
  `bayar` double NOT NULL,
  `kembali` double NOT NULL,
  `id_agen` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pelanggan`, `tgl_bayar`, `waktu_bayar`, `bulan_bayar`, `tahun_bayar`, `jumlah_bayar`, `biaya_admin`, `total_akhir`, `bayar`, `kembali`, `id_agen`) VALUES
('BYR202407250001', '20740302345678', '2024-07-25', '2024-07-25 02:52:22', '07', 2024, 5000000, 5000, 5005000, 8000000, 2995000, 'A20180129001'),
('BYR202407250002', '20740305678901', '2024-07-25', '2024-07-25 03:22:31', '07', 2024, 3000000, 5000, 3005000, 3100000, 95000, 'A20180129001'),
('BYR202407250003', '20740304567890', '2024-07-25', '2024-07-25 03:22:37', '07', 2024, 187500, 5000, 192500, 200000, 7500, 'A20180129001'),
('BYR202407250004', '20740303456789', '2024-07-25', '2024-07-25 03:22:43', '07', 2024, 900000, 5000, 905000, 1000000, 95000, 'A20180129001'),
('BYR202407250005', '20740302345678', '2024-07-25', '2024-07-25 03:22:49', '07', 2024, 2000000, 5000, 2005000, 2100000, 95000, 'A20180129001');

-- --------------------------------------------------------

--
-- Table structure for table `penggunaan`
--

CREATE TABLE `penggunaan` (
  `id_penggunaan` varchar(20) NOT NULL,
  `id_pelanggan` varchar(14) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` year(4) NOT NULL,
  `meter_awal` int(11) NOT NULL,
  `meter_akhir` int(11) NOT NULL,
  `tgl_cek` date NOT NULL,
  `id_petugas` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penggunaan`
--

INSERT INTO `penggunaan` (`id_penggunaan`, `id_pelanggan`, `bulan`, `tahun`, `meter_awal`, `meter_akhir`, `tgl_cek`, `id_petugas`) VALUES
('2074030123456701', '20740301234567', '01', 2024, 500, 0, '2024-07-25', ''),
('2074030234567801', '20740302345678', '07', 2024, 1000, 6000, '2024-07-05', 'P20180125001'),
('2074030345678901', '20740303456789', '01', 2024, 200, 800, '2024-07-19', 'P20180125001'),
('20740303456789022024', '20740303456789', '02', 2024, 800, 0, '0000-00-00', ''),
('2074030456789001', '20740304567890', '05', 2024, 750, 1000, '2024-07-20', 'P20180125001'),
('20740304567890062024', '20740304567890', '06', 2024, 1000, 0, '0000-00-00', ''),
('2074030567890101', '20740305678901', '03', 2024, 8000, 10000, '2024-07-23', 'P20180125001'),
('20740305678901042024', '20740305678901', '04', 2024, 10000, 0, '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `jk` varchar(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `akses` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama`, `alamat`, `no_telepon`, `jk`, `username`, `password`, `akses`) VALUES
('P20180125001', 'Farsya Lisanush Shidqi', 'Jakarta', '08988741360', 'P', 'petugas', 'petugas123', 'petugas'),
('P20240724001', 'Farsya Lisa', 'Jakarta', '08765345789', 'P', 'Farsya', 'farsya123', 'petugas');

-- --------------------------------------------------------

--
-- Stand-in structure for view `qw_pembayaran`
-- (See below for the actual view)
--
CREATE TABLE `qw_pembayaran` (
`id_pembayaran` varchar(15)
,`id_pelanggan` varchar(14)
,`tgl_bayar` date
,`waktu_bayar` timestamp
,`bulan_bayar` varchar(2)
,`tahun_bayar` year(4)
,`jumlah_bayar` double
,`biaya_admin` double
,`total_akhir` double
,`bayar` double
,`kembali` double
,`id_agen` varchar(12)
,`nama_pelanggan` varchar(50)
,`nama_agen` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `qw_penggunaan`
-- (See below for the actual view)
--
CREATE TABLE `qw_penggunaan` (
`id_penggunaan` varchar(20)
,`id_pelanggan` varchar(14)
,`bulan` varchar(2)
,`tahun` year(4)
,`meter_awal` int(11)
,`meter_akhir` int(11)
,`tgl_cek` date
,`id_petugas` varchar(12)
,`nama_pelanggan` varchar(50)
,`nama_petugas` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `qw_tagihan`
-- (See below for the actual view)
--
CREATE TABLE `qw_tagihan` (
`id_tagihan` int(11)
,`id_pelanggan` varchar(14)
,`bulan` varchar(2)
,`tahun` year(4)
,`jumlah_meter` int(11)
,`tarif_perkwh` double
,`jumlah_bayar` double
,`status` varchar(15)
,`id_petugas` varchar(12)
,`nama_pelanggan` varchar(50)
,`id_tarif` int(11)
,`nama_petugas` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `id_pelanggan` varchar(14) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` year(4) NOT NULL,
  `jumlah_meter` int(11) NOT NULL,
  `tarif_perkwh` double NOT NULL,
  `jumlah_bayar` double NOT NULL,
  `status` varchar(15) NOT NULL,
  `id_petugas` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `id_pelanggan`, `bulan`, `tahun`, `jumlah_meter`, `tarif_perkwh`, `jumlah_bayar`, `status`, `id_petugas`) VALUES
(27, '20740302345678', '07', 2024, 5000, 1000, 5000000, 'Terbayar', 'P20180125001'),
(31, '20740303456789', '01', 2024, 600, 1500, 900000, 'Terbayar', 'P20180125001'),
(32, '20740304567890', '05', 2024, 250, 750, 187500, 'Terbayar', 'P20180125001'),
(33, '20740305678901', '03', 2024, 2000, 1500, 3000000, 'Terbayar', 'P20180125001'),
(34, '20740302345678', '05', 2024, 2000, 1000, 2000000, 'Terbayar', 'P20180125001');

-- --------------------------------------------------------

--
-- Table structure for table `tarif`
--

CREATE TABLE `tarif` (
  `id_tarif` int(11) NOT NULL,
  `kode_tarif` varchar(20) NOT NULL,
  `golongan` varchar(10) NOT NULL,
  `daya` varchar(10) NOT NULL,
  `tarif_perkwh` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tarif`
--

INSERT INTO `tarif` (`id_tarif`, `kode_tarif`, `golongan`, `daya`, `tarif_perkwh`) VALUES
(3, 'R3/450VA', 'R3', '450VA', 1000),
(4, 'R1/900VA', 'R1', '900VA', 1500),
(5, 'R2/450VA', 'R2', '450VA', 750),
(8, 'R2/900VA', 'R2', '900VA', 1500),
(9, 'B1/1500VA', 'B1', '1500VA', 2000),
(10, 'R3/900VA', 'R3', '900VA', 1400),
(13, 'R1/450VA', 'R1', '450VA', 1000),
(16, 'R3/1300VA', 'R3', '1300VA', 1500);

-- --------------------------------------------------------

--
-- Structure for view `qw_pembayaran`
--
DROP TABLE IF EXISTS `qw_pembayaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qw_pembayaran`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `pembayaran`.`id_pelanggan` AS `id_pelanggan`, `pembayaran`.`tgl_bayar` AS `tgl_bayar`, `pembayaran`.`waktu_bayar` AS `waktu_bayar`, `pembayaran`.`bulan_bayar` AS `bulan_bayar`, `pembayaran`.`tahun_bayar` AS `tahun_bayar`, `pembayaran`.`jumlah_bayar` AS `jumlah_bayar`, `pembayaran`.`biaya_admin` AS `biaya_admin`, `pembayaran`.`total_akhir` AS `total_akhir`, `pembayaran`.`bayar` AS `bayar`, `pembayaran`.`kembali` AS `kembali`, `pembayaran`.`id_agen` AS `id_agen`, `pelanggan`.`nama` AS `nama_pelanggan`, `agen`.`nama` AS `nama_agen` FROM ((`pembayaran` join `pelanggan` on(`pelanggan`.`id_pelanggan` = `pembayaran`.`id_pelanggan`)) join `agen` on(`agen`.`id_agen` = `pembayaran`.`id_agen`))  ;

-- --------------------------------------------------------

--
-- Structure for view `qw_penggunaan`
--
DROP TABLE IF EXISTS `qw_penggunaan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qw_penggunaan`  AS SELECT `penggunaan`.`id_penggunaan` AS `id_penggunaan`, `penggunaan`.`id_pelanggan` AS `id_pelanggan`, `penggunaan`.`bulan` AS `bulan`, `penggunaan`.`tahun` AS `tahun`, `penggunaan`.`meter_awal` AS `meter_awal`, `penggunaan`.`meter_akhir` AS `meter_akhir`, `penggunaan`.`tgl_cek` AS `tgl_cek`, `penggunaan`.`id_petugas` AS `id_petugas`, `pelanggan`.`nama` AS `nama_pelanggan`, `petugas`.`nama` AS `nama_petugas` FROM ((`penggunaan` join `pelanggan` on(`penggunaan`.`id_pelanggan` = `pelanggan`.`id_pelanggan`)) join `petugas` on(`penggunaan`.`id_petugas` = `petugas`.`id_petugas`))  ;

-- --------------------------------------------------------

--
-- Structure for view `qw_tagihan`
--
DROP TABLE IF EXISTS `qw_tagihan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qw_tagihan`  AS SELECT `tagihan`.`id_tagihan` AS `id_tagihan`, `tagihan`.`id_pelanggan` AS `id_pelanggan`, `tagihan`.`bulan` AS `bulan`, `tagihan`.`tahun` AS `tahun`, `tagihan`.`jumlah_meter` AS `jumlah_meter`, `tagihan`.`tarif_perkwh` AS `tarif_perkwh`, `tagihan`.`jumlah_bayar` AS `jumlah_bayar`, `tagihan`.`status` AS `status`, `tagihan`.`id_petugas` AS `id_petugas`, `pelanggan`.`nama` AS `nama_pelanggan`, `pelanggan`.`id_tarif` AS `id_tarif`, `petugas`.`nama` AS `nama_petugas` FROM ((`tagihan` join `pelanggan` on(`pelanggan`.`id_pelanggan` = `tagihan`.`id_pelanggan`)) join `petugas` on(`petugas`.`id_petugas` = `tagihan`.`id_petugas`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agen`
--
ALTER TABLE `agen`
  ADD PRIMARY KEY (`id_agen`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `penggunaan`
--
ALTER TABLE `penggunaan`
  ADD PRIMARY KEY (`id_penggunaan`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- Indexes for table `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`id_tarif`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tarif`
--
ALTER TABLE `tarif`
  MODIFY `id_tarif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

DELIMITER //

CREATE PROCEDURE ambilSemuaAgen()
BEGIN
    SELECT * FROM agen;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION hitungTotalPembayaran() 
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(pembayaran) INTO total FROM agen;
    RETURN total;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER sebelumInsertAgen
BEFORE INSERT ON agen
FOR EACH ROW
BEGIN
    -- Misalnya, mengubah data sebelum disimpan
    SET NEW.pembayaran = ROUND(NEW.pembayaran, 2);
END //

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
