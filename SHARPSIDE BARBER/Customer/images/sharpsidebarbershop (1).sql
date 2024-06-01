-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2024 at 04:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sharpsidebarbershop`
--

-- --------------------------------------------------------

--
-- Table structure for table `appeal`
--

CREATE TABLE `appeal` (
  `appeal_id` bigint(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `violation_description` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `appeal`
--

INSERT INTO `appeal` (`appeal_id`, `user_id`, `violation_description`, `is_read`, `date_added`) VALUES
(1, 6, 'I have an appointment set with Joshua Gumbao and he didn\'t meet with me. He didn\'t even contact me ahead of time that he will cancel!!', 0, '2024-05-28 15:06:15'),
(2, 8, 'Rude barber si Hon, please ban him from this website!', 0, '2024-05-28 15:06:20');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_details`
--

CREATE TABLE `appointment_details` (
  `appointment_id` bigint(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `barber_id` bigint(11) NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `appointment_deets` varchar(255) NOT NULL,
  `total_price` int(11) NOT NULL,
  `appointment_date_time` datetime NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_status`
--

CREATE TABLE `appointment_status` (
  `status_id` int(11) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `appointment_status`
--

INSERT INTO `appointment_status` (`status_id`, `status`) VALUES
(1, 'Confirmed'),
(2, 'Pending\r\n'),
(3, 'Reject'),
(4, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `barber`
--

CREATE TABLE `barber` (
  `barber_id` bigint(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `barber_type` enum('Junior','Senior','Specialist','') NOT NULL,
  `confirmed_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `barber`
--

INSERT INTO `barber` (`barber_id`, `user_id`, `barber_type`, `confirmed_date`) VALUES
(1, 3, 'Specialist', '2024-05-26 16:48:29'),
(2, 4, 'Junior', '2024-05-26 16:48:38'),
(3, 5, 'Senior', '2024-05-26 16:48:44');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` bigint(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `feedback_description` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `user_id`, `feedback_description`, `is_read`, `date_added`) VALUES
(2, 3, 'Been a barber here for months, okay siya. Can connect me to a lot of customers!', 0, '2024-05-27 14:47:17'),
(3, 6, 'Nice website. Dito ko nahanap best barber ko as of now.', 0, '2024-05-27 19:28:44');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` bigint(11) NOT NULL,
  `barber_id` bigint(11) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `reference_no` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact_no` int(15) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_confirmed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `barber_id`, `account_name`, `reference_no`, `amount`, `email`, `contact_no`, `date_added`, `is_confirmed`) VALUES
(2, 1, 'Jake Mariscotes', 'iutwer8t340234758', 499, '', 0, '2024-05-27 17:37:14', 1),
(3, 3, 'Honorable Ezekiel', 'dfoasg384y0q98ehfisdn', 499, '', 0, '2024-05-27 19:26:43', 1),
(6, 1, 'Jake Mariscotes', 'je732jd8dgu8', 499, 'jacob@gmail.com', 2147483647, '2024-05-28 11:12:33', 0),
(7, 1, 'Hon Ezekiel', 'ji82i3id8kkk569', 499, 'hon@gmail.com', 2147483647, '2024-05-28 11:32:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pricing_junior`
--

CREATE TABLE `pricing_junior` (
  `pricing_junior_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `pricing_junior`
--

INSERT INTO `pricing_junior` (`pricing_junior_id`, `service_id`, `price`, `date_added`) VALUES
(18, 14, 240.00, '2024-05-26 16:02:20'),
(19, 64, 90.00, '2024-05-26 19:25:37'),
(20, 64, 90.00, '2024-05-26 19:25:54'),
(21, 66, 90.00, '2024-05-27 14:54:25'),
(22, 3, 45.00, '2024-05-27 20:01:18');

-- --------------------------------------------------------

--
-- Table structure for table `pricing_senior`
--

CREATE TABLE `pricing_senior` (
  `pricing_senior_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `pricing_senior`
--

INSERT INTO `pricing_senior` (`pricing_senior_id`, `service_id`, `price`, `date_added`) VALUES
(18, 14, 480.00, '2024-05-27 14:46:27'),
(19, 3, 90.00, '2024-05-27 15:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `pricing_specialist`
--

CREATE TABLE `pricing_specialist` (
  `pricing_specialist_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `pricing_specialist`
--

INSERT INTO `pricing_specialist` (`pricing_specialist_id`, `service_id`, `price`, `date_added`) VALUES
(85, 1, 500.00, '2024-05-27 13:34:49'),
(86, 66, 300.00, '2024-05-27 14:37:45'),
(87, 1, 500.00, '2024-05-27 14:39:12'),
(88, 1, 500.00, '2024-05-27 14:39:57'),
(89, 1, 500.00, '2024-05-27 14:40:46'),
(90, 1, 500.00, '2024-05-27 14:40:51'),
(91, 2, 250.00, '2024-05-27 14:42:22'),
(92, 2, 250.00, '2024-05-27 14:44:14'),
(93, 3, 150.00, '2024-05-27 14:44:53'),
(94, 3, 150.00, '2024-05-27 14:45:26'),
(95, 1, 500.00, '2024-05-27 14:45:33'),
(96, 2, 250.00, '2024-05-27 14:46:52'),
(97, 14, 800.00, '2024-05-27 14:50:38'),
(98, 66, 300.00, '2024-05-27 14:50:42'),
(99, 64, 300.00, '2024-05-27 14:51:20'),
(100, 1, 500.00, '2024-05-27 14:52:48'),
(101, 1, 500.00, '2024-05-27 14:54:02'),
(102, 66, 300.00, '2024-05-27 14:55:01'),
(103, 66, 300.00, '2024-05-27 19:34:40');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` bigint(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `barber_id` bigint(11) NOT NULL,
  `appointment_id` bigint(11) NOT NULL,
  `rating_desc` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` bigint(11) NOT NULL,
  `payment_id` bigint(11) NOT NULL,
  `sub_end` varchar(255) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `payment_id`, `sub_end`, `is_read`, `date_added`) VALUES
(6, 2, 'June 28, 2024', 0, '2024-05-27 19:51:59'),
(7, 3, 'June 28, 2024', 0, '2024-05-27 19:52:04'),
(8, 7, 'june 28, 2024', 1, '2024-05-28 11:32:54');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_description` varchar(100) NOT NULL,
  `price_cap` decimal(5,2) NOT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT 1,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_description`, `price_cap`, `availability`, `date_added`) VALUES
(1, 'Haircut', 500.00, 0, '2024-05-26 13:10:11'),
(2, 'Beard and Mustache Grooming', 250.00, 1, '2024-05-26 13:10:22'),
(3, 'Hair Tattoo', 150.00, 1, '2024-05-26 13:10:34'),
(14, 'Hair Color', 800.00, 1, '2024-05-26 13:10:44'),
(64, 'Massage', 300.00, 0, '2024-05-27 14:37:11'),
(65, 'Dreads', 450.00, 1, '2024-05-27 09:44:50'),
(66, 'Braids', 300.00, 1, '2024-05-27 13:34:14');

-- --------------------------------------------------------

--
-- Table structure for table `service_offered`
--

CREATE TABLE `service_offered` (
  `so_id` bigint(11) NOT NULL,
  `barber_id` bigint(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `service_offered`
--

INSERT INTO `service_offered` (`so_id`, `barber_id`, `service_id`, `date_added`) VALUES
(1, 1, 1, '2024-05-26 16:55:37'),
(2, 1, 2, '2024-05-26 16:57:20'),
(3, 2, 1, '2024-05-26 16:57:38'),
(4, 3, 14, '2024-05-26 16:58:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_information`
--

CREATE TABLE `user_information` (
  `user_id` bigint(255) NOT NULL,
  `user_type` enum('Admin','Barber','Customer') NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int(255) NOT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `contact_number` bigint(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `user_information`
--

INSERT INTO `user_information` (`user_id`, `user_type`, `status`, `fullname`, `username`, `password`, `age`, `sex`, `contact_number`, `email_address`, `address`, `date_added`) VALUES
(1, 'Admin', 1, 'Jacob O. Mira', 'Hakob', 'HakobJacob31', 21, 'Male', 9569333256, 'mirajacob@gmail.com', 'Pantao, Libon, Albay', '2024-05-23 13:51:35'),
(2, 'Admin', 1, 'Clarice Ann Sagaysay', 'Clars', 'clars', 20, 'Female', 9879877890, 'clars@gmail.com', 'Ubaliw', '2024-05-26 16:39:20'),
(3, 'Barber', 2, 'Jake Mariscotes', 'Jaki', 'jaki', 21, 'Male', 9876543210, 'jaki@gmail.com', 'Centro Oriental', '2024-05-26 16:40:49'),
(4, 'Barber', 2, 'Joshua Gumbao', 'Joshua', 'joshua', 20, 'Male', 1234567890, 'joshua@gmail.com', 'Tabaco', '2024-05-26 16:41:52'),
(5, 'Barber', 2, 'Hon Bognalbal', 'Hon', 'hon', 20, 'Male', 9202020200, 'hon@gmail.com', 'Tabaco', '2024-05-26 16:42:59'),
(6, 'Customer', 1, 'Marlon Factor', 'Chano', 'chano', 20, 'Male', 1919191919, 'chano@gmail.com', 'Libon', '2024-05-26 16:44:07'),
(7, 'Customer', 1, 'Rancel Duran', 'Rancel', 'rancel', 20, 'Female', 9191919191, 'rancel@gmail.com', 'Ponso', '2024-05-26 16:45:37'),
(8, 'Customer', 1, 'Kane Sapiera', 'Kane', 'kane', 20, 'Male', 9292929292, 'kane@gmail.com', 'Ponso', '2024-05-26 16:46:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appeal`
--
ALTER TABLE `appeal`
  ADD PRIMARY KEY (`appeal_id`),
  ADD KEY `appeal_user_info` (`user_id`);

--
-- Indexes for table `appointment_details`
--
ALTER TABLE `appointment_details`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `appointment_user_information` (`user_id`),
  ADD KEY `appointment_barber` (`barber_id`),
  ADD KEY `appointment_status` (`status_id`);

--
-- Indexes for table `appointment_status`
--
ALTER TABLE `appointment_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `barber`
--
ALTER TABLE `barber`
  ADD PRIMARY KEY (`barber_id`),
  ADD KEY `barber_user_information` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `feedback_user_information` (`user_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_barber` (`barber_id`);

--
-- Indexes for table `pricing_junior`
--
ALTER TABLE `pricing_junior`
  ADD PRIMARY KEY (`pricing_junior_id`),
  ADD KEY `pricingjunior_services` (`service_id`);

--
-- Indexes for table `pricing_senior`
--
ALTER TABLE `pricing_senior`
  ADD PRIMARY KEY (`pricing_senior_id`),
  ADD KEY `pricingsenior_services` (`service_id`);

--
-- Indexes for table `pricing_specialist`
--
ALTER TABLE `pricing_specialist`
  ADD PRIMARY KEY (`pricing_specialist_id`),
  ADD KEY `pricing_services` (`service_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `rating_user_information` (`user_id`),
  ADD KEY `ratings_barber` (`barber_id`),
  ADD KEY `ratings_appointment_details` (`appointment_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `report_payment` (`payment_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `service_offered`
--
ALTER TABLE `service_offered`
  ADD PRIMARY KEY (`so_id`),
  ADD KEY `so_barber` (`barber_id`),
  ADD KEY `so_service` (`service_id`);

--
-- Indexes for table `user_information`
--
ALTER TABLE `user_information`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appeal`
--
ALTER TABLE `appeal`
  MODIFY `appeal_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `appointment_details`
--
ALTER TABLE `appointment_details`
  MODIFY `appointment_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `appointment_status`
--
ALTER TABLE `appointment_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `barber`
--
ALTER TABLE `barber`
  MODIFY `barber_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pricing_junior`
--
ALTER TABLE `pricing_junior`
  MODIFY `pricing_junior_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pricing_senior`
--
ALTER TABLE `pricing_senior`
  MODIFY `pricing_senior_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pricing_specialist`
--
ALTER TABLE `pricing_specialist`
  MODIFY `pricing_specialist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `service_offered`
--
ALTER TABLE `service_offered`
  MODIFY `so_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_information`
--
ALTER TABLE `user_information`
  MODIFY `user_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appeal`
--
ALTER TABLE `appeal`
  ADD CONSTRAINT `appeal_user_info` FOREIGN KEY (`user_id`) REFERENCES `user_information` (`user_id`);

--
-- Constraints for table `appointment_details`
--
ALTER TABLE `appointment_details`
  ADD CONSTRAINT `appointment_barber` FOREIGN KEY (`barber_id`) REFERENCES `barber` (`barber_id`),
  ADD CONSTRAINT `appointment_status` FOREIGN KEY (`status_id`) REFERENCES `appointment_status` (`status_id`),
  ADD CONSTRAINT `appointment_user_information` FOREIGN KEY (`user_id`) REFERENCES `user_information` (`user_id`);

--
-- Constraints for table `barber`
--
ALTER TABLE `barber`
  ADD CONSTRAINT `barber_user_information` FOREIGN KEY (`user_id`) REFERENCES `user_information` (`user_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_user_information` FOREIGN KEY (`user_id`) REFERENCES `user_information` (`user_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_barber` FOREIGN KEY (`barber_id`) REFERENCES `barber` (`barber_id`);

--
-- Constraints for table `pricing_junior`
--
ALTER TABLE `pricing_junior`
  ADD CONSTRAINT `pricingjunior_services` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);

--
-- Constraints for table `pricing_senior`
--
ALTER TABLE `pricing_senior`
  ADD CONSTRAINT `pricingsenior_services` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);

--
-- Constraints for table `pricing_specialist`
--
ALTER TABLE `pricing_specialist`
  ADD CONSTRAINT `pricing_services` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `rating_user_information` FOREIGN KEY (`user_id`) REFERENCES `user_information` (`user_id`),
  ADD CONSTRAINT `ratings_appointment_details` FOREIGN KEY (`appointment_id`) REFERENCES `appointment_details` (`appointment_id`),
  ADD CONSTRAINT `ratings_barber` FOREIGN KEY (`barber_id`) REFERENCES `barber` (`barber_id`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`);

--
-- Constraints for table `service_offered`
--
ALTER TABLE `service_offered`
  ADD CONSTRAINT `so_barber` FOREIGN KEY (`barber_id`) REFERENCES `barber` (`barber_id`),
  ADD CONSTRAINT `so_services` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
