-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 22, 2018 at 09:40 AM
-- Server version: 5.7.24-0ubuntu0.18.04.1
-- PHP Version: 7.2.11-2+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hrms`
--

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `name`) VALUES
(1, 'BSc'),
(2, 'MSc'),
(3, 'PhD');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `first_name`, `last_name`, `job_title`, `salary`, `notes`) VALUES
(1, 'Robin', 'Jackman', 'Software Engineer', 5500, NULL),
(2, 'Taylor', 'Edward', 'Software Architect', 7200, NULL),
(3, 'Vivian', 'Dickens', 'Database Administrator', 6000, NULL),
(4, 'Harry', 'Clifford', 'Database Administrator', 6800, NULL),
(5, 'Eliza', 'Clifford', 'Software Engineer', 4750, NULL),
(6, 'Nancy', 'Newman', 'Software Engineer', 5100, NULL),
(7, 'Melinda', 'Clifford', 'Project Manager', 8500, NULL),
(8, 'Harley', 'Gilbert', 'Software Architect', 8000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_education`
--

CREATE TABLE `employee_education` (
  `employee_id` int(11) NOT NULL,
  `education_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_education`
--

INSERT INTO `employee_education` (`employee_id`, `education_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `leave_type`
--

CREATE TABLE `leave_type` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leave_type`
--

INSERT INTO `leave_type` (`id`, `name`) VALUES
(1, 'Casual'),
(2, 'Medical'),
(3, 'Restricted Holiday');

-- --------------------------------------------------------

--
-- Table structure for table `tblleaves`
--

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL,
  `LeaveTypeId` tinyint(4) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AdminRemark` mediumtext,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `telephone`
--

CREATE TABLE `telephone` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `telephone`
--

INSERT INTO `telephone` (`id`, `employee_id`, `type`, `no`) VALUES
(1, 1, 'mobile', '245-249697'),
(2, 2, 'mobile', '270-235969'),
(3, 2, 'land', '325-888885'),
(4, 3, 'mobile', '270-684972'),
(5, 4, 'mobile', '245-782365'),
(6, 4, 'land', '325-888886'),
(7, 5, 'mobile', '245-537891'),
(8, 6, 'mobile', '270-359457'),
(9, 7, 'mobile', '245-436589'),
(10, 7, 'land', '325-888887'),
(11, 8, 'mobile', '245-279164'),
(12, 8, 'land', '325-888888');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `employee_id`, `user_type`, `username`, `password`) VALUES
(1, NULL, 'SUPER ADMIN', 'admin', 'admin'),
(2, 1, 'NORMAL', 'hari', 'hari'),
(3, 2, 'ADMIN', 'taylor', 'taylor'),
(4, 3, 'ADMIN', 'vivian', 'vivian'),
(5, 4, 'NORMAL', 'harry', 'harry'),
(6, 7, 'ADMIN', 'melinda', 'melinda'),
(7, 8, 'NORMAL', 'harley', 'harley');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_type`
--
ALTER TABLE `leave_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblleaves`
--
ALTER TABLE `tblleaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserEmail` (`empid`);

--
-- Indexes for table `telephone`
--
ALTER TABLE `telephone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `leave_type`
--
ALTER TABLE `leave_type`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tblleaves`
--
ALTER TABLE `tblleaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `telephone`
--
ALTER TABLE `telephone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
