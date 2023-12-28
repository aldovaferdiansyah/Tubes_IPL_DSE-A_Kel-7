-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Des 2023 pada 15.05
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `informatikaunjani`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrasi`
--

CREATE TABLE `administrasi` (
  `Id_Administrasi` int(5) NOT NULL,
  `Nim` int(15) NOT NULL,
  `Jumlah_SKS` int(5) NOT NULL,
  `Bukti_Pembayaran` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bimbingan`
--

CREATE TABLE `bimbingan` (
  `Id_bimbingan` varchar(10) NOT NULL,
  `Jumlah_bimbingan` varchar(20) NOT NULL,
  `Nim` int(15) NOT NULL,
  `NID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `NID` int(10) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `ID_Pembimbing` varchar(20) NOT NULL,
  `ID_Penguji` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `Nim` int(15) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `Id_Administrasi` int(5) NOT NULL,
  `Kode_MK` varchar(10) NOT NULL,
  `Nama_Matakuliah` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `seminar`
--

CREATE TABLE `seminar` (
  `Id_seminar` int(5) NOT NULL,
  `Jadwal_seminar` date NOT NULL,
  `Ruangan` varchar(10) NOT NULL,
  `Id_bimbingan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `administrasi`
--
ALTER TABLE `administrasi`
  ADD PRIMARY KEY (`Id_Administrasi`),
  ADD KEY `Nim` (`Nim`);

--
-- Indeks untuk tabel `bimbingan`
--
ALTER TABLE `bimbingan`
  ADD PRIMARY KEY (`Id_bimbingan`),
  ADD KEY `NID` (`NID`),
  ADD KEY `Nim` (`Nim`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`NID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`Nim`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`Kode_MK`),
  ADD KEY `Id_Administrasi` (`Id_Administrasi`);

--
-- Indeks untuk tabel `seminar`
--
ALTER TABLE `seminar`
  ADD PRIMARY KEY (`Id_seminar`),
  ADD KEY `Id_bimbingan` (`Id_bimbingan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `administrasi`
--
ALTER TABLE `administrasi`
  MODIFY `Id_Administrasi` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `seminar`
--
ALTER TABLE `seminar`
  MODIFY `Id_seminar` int(5) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `administrasi`
--
ALTER TABLE `administrasi`
  ADD CONSTRAINT `administrasi_ibfk_1` FOREIGN KEY (`Nim`) REFERENCES `mahasiswa` (`Nim`);

--
-- Ketidakleluasaan untuk tabel `bimbingan`
--
ALTER TABLE `bimbingan`
  ADD CONSTRAINT `bimbingan_ibfk_2` FOREIGN KEY (`NID`) REFERENCES `dosen` (`NID`),
  ADD CONSTRAINT `bimbingan_ibfk_3` FOREIGN KEY (`Nim`) REFERENCES `mahasiswa` (`Nim`);

--
-- Ketidakleluasaan untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD CONSTRAINT `matakuliah_ibfk_1` FOREIGN KEY (`Id_Administrasi`) REFERENCES `administrasi` (`Id_Administrasi`);

--
-- Ketidakleluasaan untuk tabel `seminar`
--
ALTER TABLE `seminar`
  ADD CONSTRAINT `seminar_ibfk_1` FOREIGN KEY (`Id_bimbingan`) REFERENCES `bimbingan` (`Id_bimbingan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
