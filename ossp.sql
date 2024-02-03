-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: Jan 30, 2024 at 11:39 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ossp`
--

-- --------------------------------------------------------

--
-- Table structure for table `downloads`
--

CREATE TABLE `downloads` (
  `download_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `software_id` int(11) DEFAULT NULL,
  `download_date` datetime DEFAULT current_timestamp(),
  `software` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `downloads`
--

INSERT INTO `downloads` (`download_id`, `user_id`, `software_id`, `download_date`, `software`) VALUES
(1, 1, 263572882, '2023-12-07 10:25:18', NULL),
(2, 3, 2147483647, '2023-12-14 12:42:02', NULL),
(4, NULL, NULL, '2024-01-11 11:09:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `license`
--

CREATE TABLE `license` (
  `license_id` int(11) NOT NULL,
  `license_type` varchar(100) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `license`
--

INSERT INTO `license` (`license_id`, `license_type`, `issue_date`, `expiration_date`) VALUES
(1, 'software license', '2022-01-11', '2025-01-15'),
(2, 'proffesional license', '2022-01-11', '2025-01-15'),
(3, 'software license', '2022-01-11', '2025-01-15');

-- --------------------------------------------------------

--
-- Table structure for table `software`
--

CREATE TABLE `software` (
  `software_id` int(11) NOT NULL,
  `software` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `version` varchar(100) DEFAULT NULL,
  `release_date` varchar(100) DEFAULT NULL,
  `date_created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `software`
--

INSERT INTO `software` (`software_id`, `software`, `description`, `category`, `version`, `release_date`, `date_created`) VALUES
(263572882, 'visual studio code', 'for programming', 'programming', 'v18.0.1', '18/03/2013', '2023-12-01 14:58:14'),
(2147483647, 'kali linux', 'operating system', 'operating system', 'v12.9.0', '12/04/2019', '2023-12-01 15:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `date_reg` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fname`, `lname`, `user_name`, `email`, `phone`, `password`, `date_reg`) VALUES
(1, 'Fatuma', 'Jarufu', 'fettykidot', 'fatumajarufu4@gmail.com', '0783443058', '7a53928fa4dd31e82c6ef826f341daec', '2023-12-01 13:59:13'),
(3, 'irene', 'kibonde', 'kibo', 'irenekibonde@gmail.com', '0782134206', '250cf8b51c773f3f8dc8b4be867a9a02', '2023-12-07 09:39:58'),
(4, 'joseph', 'edson', 'joo', 'josekusaya@gmail.com', '0764332566', '662eaa47199461d01a623884080934ab', '2023-12-07 09:46:20'),
(5, 'baraka', 'marwa', 'sureboy', 'barakamarwa@gmail.com', '0773829345', '92eb5ffee6ae2fec3ad71c777531578f', '2023-12-14 11:28:30'),
(6, 'niccasius', 'mwijage', 'nicc mbunge', 'nicassius2023@gmaail.com', '0766243359', 'ef15c4823455a7d36bae917288a61c81', '2024-01-11 11:19:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`download_id`),
  ADD KEY `fk_userid` (`user_id`),
  ADD KEY `fk_software` (`software_id`);

--
-- Indexes for table `license`
--
ALTER TABLE `license`
  ADD PRIMARY KEY (`license_id`);

--
-- Indexes for table `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`software_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `downloads`
--
ALTER TABLE `downloads`
  ADD CONSTRAINT `fk_software` FOREIGN KEY (`software_id`) REFERENCES `software` (`software_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
