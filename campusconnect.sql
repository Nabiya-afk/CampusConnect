-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2026 at 02:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `campusconnect`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `name`, `email`, `password`) VALUES
(1, 'Campus Admin', 'admin@campusconnect.com', 'admin123'),
(2, 'Event Coordinator', 'coordinator@campusconnect.com', 'coord123');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `event_date` date NOT NULL,
  `venue` varchar(150) NOT NULL,
  `max_participants` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_name`, `description`, `event_date`, `venue`, `max_participants`, `admin_id`) VALUES
(1, 'Tech Fest 2026', 'Annual technical festival with coding and technology events.', '2026-04-08', 'Main Auditorium', 100, 1),
(2, 'Code Challenge', 'Inter-college programming competition.', '2026-09-20', 'Computer Lab 3', 50, 1),
(3, 'Cultural Night', 'Annual college cultural and entertainment event.', '2026-10-05', 'Seminar Hall Tagore Building ', 200, 2),
(6, 'Genz Coded', 'genz  coded slangs ', '2026-09-01', 'Cafesto Cafe Rajkot', 50, 1),
(9, 'InnovateX', 'techincal fest', '2026-12-10', 'Main Auditorium', 50, 1),
(10, 'Youthopia', 'Youth festival', '2026-11-24', 'Colloge Ground ', 80, 1);

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `registration_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(30) DEFAULT 'REGISTERED'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`registration_id`, `student_id`, `event_id`, `registration_date`, `status`) VALUES
(1, 1, 1, '2026-08-26 17:41:05', 'REGISTERED'),
(2, 2, 1, '2026-08-26 17:41:05', 'REGISTERED'),
(3, 3, 2, '2026-08-26 17:41:05', 'REGISTERED'),
(4, 4, 1, '2026-11-19 05:20:14', 'REGISTERED'),
(6, 4, 3, '2026-11-19 05:26:52', 'REGISTERED'),
(7, 4, 2, '2026-11-19 05:35:15', 'CANCELLED'),
(8, 5, 2, '2026-11-19 13:07:16', 'REGISTERED'),
(9, 5, 3, '2026-11-19 13:07:58', 'REGISTERED');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `enrollment_no` varchar(50) NOT NULL,
  `branch` varchar(100) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `email`, `password`, `enrollment_no`, `branch`, `semester`) VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', 'rahul123', 'CC001', 'Computer Science', 5),
(2, 'Priya Patel', 'priya@gmail.com', 'priya123', 'CC002', 'Information Technology', 5),
(3, 'Arjun Mehta', 'arjun@gmail.com', 'arjun123', 'CC003', 'Computer Science', 3),
(4, 'Nabiya', 'itzzu8@gmail.com', 'nabiya@22', '92610120021', 'Computer Science', 4),
(5, 'Tanisha Rathod', 'tanisha@gmail.com', 'tan123', '92610120059', 'Computer Engineering', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`registration_id`),
  ADD UNIQUE KEY `student_id` (`student_id`,`event_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `enrollment_no` (`enrollment_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `registration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`);

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
