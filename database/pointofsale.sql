-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2025 at 07:25 AM
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
-- Database: `pointofsale`
--

-- --------------------------------------------------------

--
-- Table structure for table `cashflow`
--

CREATE TABLE `cashflow` (
  `transaction_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `transaction_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cashflow`
--

INSERT INTO `cashflow` (`transaction_id`, `description`, `amount`, `username`, `transaction_date`) VALUES
(1, 'Cash-in', 10000.00, 'admin', '2019-04-08 15:51:58'),
(2, 'Cash-in', 20.00, 'user', '2025-01-02 21:40:15'),
(3, 'Cash-in', 900.00, 'user', '2025-01-02 22:01:18');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact_number` varchar(30) DEFAULT NULL,
  `image` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `firstname`, `lastname`, `address`, `contact_number`, `image`) VALUES
(16, 'Thomas', 'Shelby', 'Philippines', '0929182738', 'user.png'),
(17, 'Harry', 'Potter', 'Hogwarts', '09195202162', 'Screenshot 2024-11-30 115632.p'),
(18, 'Bruno', 'Mars', 'Philippines', '09658439601', 'What-Is-Windows-Virtual-Memory'),
(19, 'Taylor', 'Swift', 'Philippines', '09195202165', 'Myprofile.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `transaction_no` varchar(20) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`transaction_no`, `supplier_id`, `username`, `date`) VALUES
('5CAAFDA8CD697', 21, 'admin', '2019-04-08 15:52:40'),
('5CAAFDEEDB333', 22, 'admin', '2019-04-08 15:54:19'),
('5CAAFE37D21E8', 21, 'admin', '2019-04-08 15:55:28'),
('5E7F00084C934', 22, 'admin', '2020-03-28 15:43:22'),
('5E81DF2B7B8F7', 22, 'admin', '2020-03-30 20:00:48');

-- --------------------------------------------------------

--
-- Table structure for table `initial_products`
--

CREATE TABLE `initial_products` (
  `id` varchar(50) NOT NULL,
  `initial_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `initial_products`
--

INSERT INTO `initial_products` (`id`, `initial_quantity`) VALUES
('1', 1),
('2', 1),
('3', 1),
('4', 1),
('5', 1),
('6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `logs_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `username`, `purpose`, `logs_time`) VALUES
(851, 'admin', 'User admin login', '2019-04-08 15:48:04'),
(854, 'admin', 'User admin logout', '2019-04-08 15:49:48'),
(855, 'admin', 'User admin login', '2019-04-08 15:50:04'),
(856, 'admin', 'Supplier OrangeCompany added', '2019-04-08 15:50:54'),
(857, 'admin', 'Customer jersel Added', '2019-04-08 15:51:25'),
(858, 'admin', 'Cash-in', '2019-04-08 15:51:58'),
(859, 'admin', 'Delivery Added', '2019-04-08 15:52:40'),
(860, 'admin', 'Customer Bill Added', '2019-04-08 15:53:18'),
(861, 'admin', 'Delivery Added', '2019-04-08 15:54:19'),
(862, 'admin', 'Delivery Added', '2019-04-08 15:55:29'),
(863, 'admin', 'Product sold', '2019-04-08 15:56:39'),
(864, 'admin', 'User admin logout', '2019-04-08 15:57:38'),
(865, 'admin', 'User admin login', '2019-04-08 16:06:54'),
(866, 'admin', 'User admin login', '2019-04-08 20:28:36'),
(867, 'admin', 'Product sold', '2019-04-08 20:29:27'),
(868, 'admin', 'User admin login', '2020-03-23 16:04:06'),
(869, 'admin', 'User admin logout', '2020-03-23 16:04:24'),
(870, 'admin', 'User admin login', '2020-03-28 12:58:34'),
(871, 'admin', 'User admin logout', '2020-03-28 13:02:20'),
(872, 'admin', 'User admin login', '2020-03-28 13:02:26'),
(873, 'admin', 'User admin logout', '2020-03-28 13:02:59'),
(874, 'admin', 'User admin login', '2020-03-28 13:05:48'),
(875, 'admin', 'Product sold', '2020-03-28 14:06:26'),
(876, 'admin', 'Product sold', '2020-03-28 14:07:27'),
(877, 'admin', 'Product sold', '2020-03-28 14:08:09'),
(878, 'admin', 'Product sold', '2020-03-28 14:14:46'),
(879, 'admin', 'Product sold', '2020-03-28 14:22:55'),
(880, 'admin', 'Product sold', '2020-03-28 14:27:51'),
(881, 'admin', 'Delivery Added', '2020-03-28 15:43:22'),
(882, 'admin', 'Product sold', '2020-03-28 16:14:30'),
(883, 'admin', 'User admin login', '2020-03-29 09:26:29'),
(884, 'admin', 'User admin login', '2020-03-29 09:40:46'),
(885, 'admin', 'Product Coffee updated', '2020-03-29 09:53:36'),
(886, 'admin', 'Product Coffee updated', '2020-03-29 09:53:51'),
(887, 'admin', 'User admin login', '2020-03-30 09:05:52'),
(888, 'admin', 'Product sold', '2020-03-30 09:07:10'),
(889, 'admin', 'User admin login', '2020-03-30 19:59:24'),
(890, 'admin', 'Delivery Added', '2020-03-30 20:00:48'),
(891, 'admin', 'User admin login', '2020-03-30 22:26:03'),
(892, 'admin', 'User admin login', '2025-01-02 21:33:00'),
(893, 'admin', 'User admin logout', '2025-01-02 21:34:38'),
(894, 'user', 'User user login', '2025-01-02 21:34:54'),
(895, 'user', 'User user logout', '2025-01-02 21:35:12'),
(896, 'user', 'User user login', '2025-01-02 21:35:23'),
(897, 'user', 'Cash-in', '2025-01-02 21:40:15'),
(898, 'user', 'User user logout', '2025-01-02 21:42:31'),
(899, 'user', 'User user login', '2025-01-02 21:42:39'),
(900, 'user', 'User user logout', '2025-01-02 21:49:20'),
(901, 'user', 'User user login', '2025-01-02 21:51:48'),
(903, 'user', 'Product sold', '2025-01-02 21:53:31'),
(905, 'user', 'Cash-in', '2025-01-02 22:01:18'),
(906, 'user', 'Product sold', '2025-01-02 22:01:54'),
(907, 'user', 'User user logout', '2025-01-02 22:05:15'),
(908, 'user', 'User user login', '2025-01-02 22:05:37'),
(910, 'user', 'Product sold', '2025-01-02 22:21:01'),
(911, 'user', 'User user logout', '2025-01-02 22:34:16'),
(912, 'user', 'User user login', '2025-01-02 22:34:23'),
(913, 'user', 'User user logout', '2025-01-02 22:34:43'),
(914, 'admin', 'User admin login', '2025-01-02 22:34:47'),
(915, 'admin', 'Product sold', '2025-01-02 22:51:03'),
(916, 'admin', 'Product sold', '2025-01-02 22:51:56'),
(917, 'admin', 'User admin logout', '2025-01-02 22:56:40'),
(918, 'admin', 'User admin login', '2025-01-02 22:56:44'),
(919, 'admin', 'Product deleted', '2025-01-03 03:35:28'),
(920, 'admin', 'Product deleted', '2025-01-03 03:35:33'),
(921, 'admin', 'Product deleted', '2025-01-03 03:35:39'),
(922, 'admin', 'Product deleted', '2025-01-03 03:35:48'),
(923, 'admin', 'Product deleted', '2025-01-03 03:35:52'),
(924, 'admin', 'Product deleted', '2025-01-03 03:35:56'),
(925, 'admin', 'Product deleted', '2025-01-03 03:36:00'),
(926, 'admin', 'Product deleted', '2025-01-03 03:36:04'),
(927, 'admin', 'Product deleted', '2025-01-03 03:36:10'),
(928, 'admin', 'Product deleted', '2025-01-03 03:51:45'),
(929, 'admin', 'Product deleted', '2025-01-03 04:07:27'),
(930, 'admin', 'Product deleted', '2025-01-03 04:07:31'),
(931, 'admin', 'User admin logout', '2025-01-03 04:08:13'),
(932, 'admin', 'User admin login', '2025-01-03 04:19:59'),
(933, 'admin', 'User admin logout', '2025-01-03 04:20:05'),
(934, 'user', 'User user login', '2025-01-03 04:20:12'),
(935, 'user', 'User user logout', '2025-01-03 04:20:46'),
(936, 'admin', 'User admin login', '2025-01-03 04:20:49'),
(937, 'admin', 'User admin logout', '2025-01-03 04:29:29'),
(938, 'admin', 'User admin login', '2025-01-03 04:29:43'),
(939, 'admin', 'User Deleted', '2025-01-03 04:46:22'),
(940, 'admin', 'User admin logout', '2025-01-03 05:04:49'),
(941, 'admin', 'User admin login', '2025-01-03 05:05:06'),
(942, 'admin', 'User admin logout', '2025-01-03 05:05:23'),
(943, 'admin', 'User admin login', '2025-01-03 05:06:15'),
(944, 'admin', 'User admin logout', '2025-01-03 05:06:20'),
(945, 'admin', 'User admin login', '2025-01-03 05:06:41'),
(946, 'admin', 'User admin login', '2025-01-03 12:36:41'),
(948, 'admin', 'User admin logout', '2025-01-03 12:50:37'),
(949, 'user', 'User user login', '2025-01-03 12:50:46'),
(950, 'user', 'User Chris updated', '2025-01-03 13:02:47'),
(951, 'user', 'User Chris updated', '2025-01-03 13:02:50'),
(952, 'user', 'User Chris updated', '2025-01-03 13:08:11'),
(953, 'user', 'User user logout', '2025-01-03 13:12:40'),
(954, 'admin', 'User admin login', '2025-01-03 13:12:44'),
(955, 'admin', 'Product Fried Noodles updated', '2025-01-03 13:19:09'),
(956, 'admin', 'User admin logout', '2025-01-03 13:22:15'),
(957, 'user', 'User user login', '2025-01-03 13:22:21'),
(959, 'user', 'Product sold', '2025-01-03 13:23:39'),
(968, 'user', 'User user logout', '2025-01-03 13:29:56'),
(969, 'user', 'User user login', '2025-01-03 13:30:00'),
(970, 'user', 'User user logout', '2025-01-03 13:30:45'),
(971, 'admin', 'User admin login', '2025-01-03 13:30:49'),
(972, 'admin', 'Product Fried Noodles updated', '2025-01-03 13:31:00'),
(973, 'admin', 'Product Sharksfin Siomai updat', '2025-01-03 13:31:11'),
(974, 'admin', 'Product Pork Siomai updated', '2025-01-03 13:31:18'),
(975, 'admin', 'Product Beef Siomai updated', '2025-01-03 13:31:25'),
(976, 'admin', 'Product Wanton Siomai updated', '2025-01-03 13:31:34'),
(977, 'admin', 'User admin logout', '2025-01-03 13:31:41'),
(978, 'user', 'User user login', '2025-01-03 13:31:47'),
(979, 'user', 'Product sold', '2025-01-03 13:40:20'),
(980, 'user', 'Product sold', '2025-01-03 13:40:36'),
(981, 'user', 'Product sold', '2025-01-03 13:50:32'),
(982, 'user', 'Product sold', '2025-01-03 13:50:55'),
(983, 'user', 'User user logout', '2025-01-03 13:51:07'),
(984, 'user', 'User user login', '2025-01-03 13:51:10'),
(985, 'user', 'Product sold', '2025-01-03 14:03:28'),
(986, 'user', 'Product sold', '2025-01-03 14:06:10'),
(987, 'user', 'User user logout', '2025-01-03 14:06:19'),
(988, 'user', 'User user login', '2025-01-03 14:06:25'),
(989, 'user', 'Product sold', '2025-01-03 14:06:41'),
(990, 'user', 'User user logout', '2025-01-03 14:06:50'),
(991, 'user', 'User user login', '2025-01-03 14:06:53'),
(992, 'user', 'Product sold', '2025-01-03 14:07:48'),
(993, 'user', 'User user logout', '2025-01-03 14:07:57'),
(994, 'user', 'User user login', '2025-01-03 14:08:03'),
(995, 'user', 'Product sold', '2025-01-03 14:08:25'),
(996, 'user', 'User user logout', '2025-01-03 14:09:27'),
(997, 'user', 'User user login', '2025-01-03 14:09:31'),
(998, 'user', 'Product sold', '2025-01-03 14:09:54'),
(999, 'user', 'Product sold', '2025-01-03 14:10:24'),
(1000, 'user', 'User user logout', '2025-01-03 14:10:30'),
(1001, 'user', 'User user login', '2025-01-03 14:10:33'),
(1002, 'user', 'User user logout', '2025-01-03 14:14:04'),
(1003, 'user', 'User user login', '2025-01-03 14:14:11'),
(1004, 'user', 'User user login', '2025-01-03 14:14:51'),
(1005, 'user', 'Product sold', '2025-01-03 14:16:20'),
(1006, 'user', 'Product sold', '2025-01-03 14:16:42'),
(1007, 'user', 'User user login', '2025-01-03 14:17:47'),
(1008, 'user', 'Product sold', '2025-01-03 14:21:04'),
(1009, 'user', 'Product sold', '2025-01-03 14:23:37'),
(1010, 'user', 'User user logout', '2025-01-03 14:23:41'),
(1011, 'admin', 'User admin login', '2025-01-03 14:23:52'),
(1012, 'admin', 'Product Sharksfin Siomai updat', '2025-01-03 14:24:23'),
(1013, 'admin', 'Product Beef Siomai updated', '2025-01-03 14:24:28'),
(1014, 'admin', 'Product Wanton Siomai updated', '2025-01-03 14:24:34'),
(1015, 'admin', 'User admin logout', '2025-01-03 14:24:56');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_no` varchar(50) NOT NULL,
  `product_name` varchar(30) DEFAULT NULL,
  `sell_price` decimal(18,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `min_stocks` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `images` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_no`, `product_name`, `sell_price`, `quantity`, `unit`, `min_stocks`, `remarks`, `location`, `images`) VALUES
('1', 'Fried Noodles', 70.00, 40, 'Small Paper Cup', 40, 'updated', 'Ternate', ''),
('2', 'Sharksfin Siomai', 80.00, 40, 'Small Paper Cup', 40, 'updated', 'Bucana Malaki', ''),
('3', 'Pork Siomai', 70.00, 40, 'Small Paper Cup', 40, 'updated', 'Maragondon', ''),
('4', 'Beef Siomai', 80.00, 40, 'Small Paper Cup', 40, 'updated', 'Naic', ''),
('5', 'Wanton Siomai', 70.00, 40, 'Small Paper Cup', 40, 'updated', 'Tanza', ''),
('6', 'Beef Teriyaki', 100.00, -1, 'Small Papper Cup', 40, '', 'Trece Martires', '');

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `delete` BEFORE DELETE ON `products` FOR EACH ROW DELETE FROM initial_products WHERE id=old.product_no
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert` AFTER INSERT ON `products` FOR EACH ROW INSERT INTO initial_products(id,initial_quantity) VALUES(new.product_no,new.quantity)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_delivered`
--

CREATE TABLE `product_delivered` (
  `transaction_no` varchar(30) NOT NULL,
  `product_id` varchar(30) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `buy_price` decimal(18,2) NOT NULL,
  `tax_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `reciept_no` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `username` varchar(30) NOT NULL,
  `discount` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`reciept_no`, `customer_id`, `username`, `discount`, `total`, `date`) VALUES
(20, 16, 'admin', 0, 0, '2019-04-08 07:56:39'),
(21, 16, 'admin', 0, 0, '2019-04-08 12:29:27'),
(22, 16, 'admin', 0, 0, '2020-03-28 06:06:26'),
(23, 16, 'admin', 0, 0, '2020-03-28 06:07:27'),
(24, 16, 'admin', 0, 0, '2020-03-28 06:08:08'),
(25, 16, 'admin', 10, 0, '2020-03-28 06:14:46'),
(26, 16, 'admin', 10, 0, '2020-03-28 06:22:55'),
(27, 16, 'admin', 10, 2160, '2020-03-28 06:27:51'),
(28, 16, 'admin', 20, 1920, '2020-03-28 08:14:30'),
(29, 16, 'admin', 20, 4017, '2020-03-30 01:07:10'),
(30, 17, 'user', 0, 60, '2025-01-02 13:53:31'),
(31, 16, 'user', 0, 1200, '2025-01-02 14:01:54'),
(32, 18, 'user', 0, 60, '2025-01-02 14:21:01'),
(33, 17, 'admin', 0, 12, '2025-01-02 14:51:03'),
(34, 17, 'admin', 0, 24, '2025-01-02 14:51:56'),
(35, 19, 'user', 0, 210, '2025-01-03 05:23:39'),
(36, 19, 'user', 0, 350, '2025-01-03 05:40:20'),
(37, 19, 'user', 0, 350, '2025-01-03 05:40:36'),
(38, 16, 'user', 0, 200, '2025-01-03 05:50:32'),
(39, 19, 'user', 0, 280, '2025-01-03 05:50:55'),
(40, 16, 'user', 0, 350, '2025-01-03 06:03:28'),
(41, 19, 'user', 0, 160, '2025-01-03 06:06:10'),
(42, 19, 'user', 0, 140, '2025-01-03 06:06:41'),
(43, 19, 'user', 0, 140, '2025-01-03 06:07:48'),
(44, 16, 'user', 0, 160, '2025-01-03 06:08:25'),
(45, 17, 'user', 0, 160, '2025-01-03 06:09:54'),
(46, 17, 'user', 0, 140, '2025-01-03 06:10:24'),
(47, 16, 'user', 0, 140, '2025-01-03 06:16:20'),
(48, 19, 'user', 0, 160, '2025-01-03 06:16:42'),
(49, 17, 'user', 0, 140, '2025-01-03 06:21:04'),
(50, 17, 'user', 0, 140, '2025-01-03 06:23:37');

-- --------------------------------------------------------

--
-- Table structure for table `sales_product`
--

CREATE TABLE `sales_product` (
  `reciept_no` int(11) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sales_product`
--

INSERT INTO `sales_product` (`reciept_no`, `product_id`, `price`, `qty`) VALUES
(35, '5', 70.00, 3),
(36, '5', 70.00, 5),
(37, '5', 70.00, 5),
(38, '6', 100.00, 2),
(39, '5', 70.00, 4),
(40, '5', 70.00, 5),
(41, '4', 80.00, 2),
(42, '5', 70.00, 2),
(43, '5', 70.00, 2),
(44, '2', 80.00, 2),
(45, '4', 80.00, 2),
(46, '5', 70.00, 2),
(47, '5', 70.00, 2),
(48, '4', 80.00, 2),
(49, '5', 70.00, 2),
(50, '5', 70.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact_number` varchar(30) DEFAULT NULL,
  `image` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `company_name`, `firstname`, `lastname`, `address`, `contact_number`, `image`) VALUES
(21, 'OrangeCompany', 'Oracle', 'LTD', 'USA', '+63(09)1234-1234', 'Internship-Web-Graphic-01.png'),
(22, 'BrandName', 'Bill', 'Joe', 'Africa', '+63(09)1234-1234', 'multi-user-icon.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `position` varchar(20) NOT NULL,
  `contact_number` varchar(30) NOT NULL,
  `image` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstname`, `lastname`, `position`, `contact_number`, `image`, `password`) VALUES
(7, 'admin', 'Juan', 'Cruz', 'admin', '+63(09)1234-1234', 'Myprofile.jpg', '21232f297a57a5a743894a0e4a801fc3'),
(13, 'user', 'Chris', 'Doe', 'Employee', '+63(09)1234-1234', 'men-in-black.png', 'ee11cbb19052e40b07aac0ca060c23ee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cashflow`
--
ALTER TABLE `cashflow`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`transaction_no`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `initial_products`
--
ALTER TABLE `initial_products`
  ADD KEY `id` (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_no`);

--
-- Indexes for table `product_delivered`
--
ALTER TABLE `product_delivered`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `transaction_no` (`transaction_no`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`reciept_no`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `sales_product`
--
ALTER TABLE `sales_product`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `reciept_no` (`reciept_no`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `user_id` (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cashflow`
--
ALTER TABLE `cashflow`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1016;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `reciept_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `sales_product`
--
ALTER TABLE `sales_product`
  MODIFY `reciept_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cashflow`
--
ALTER TABLE `cashflow`
  ADD CONSTRAINT `cashflow_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `initial_products`
--
ALTER TABLE `initial_products`
  ADD CONSTRAINT `initial_products_ibfk_1` FOREIGN KEY (`id`) REFERENCES `products` (`product_no`);

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `product_delivered`
--
ALTER TABLE `product_delivered`
  ADD CONSTRAINT `product_delivered_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_no`),
  ADD CONSTRAINT `product_delivered_ibfk_2` FOREIGN KEY (`transaction_no`) REFERENCES `delivery` (`transaction_no`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `sales_product`
--
ALTER TABLE `sales_product`
  ADD CONSTRAINT `sales_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_no`),
  ADD CONSTRAINT `sales_product_ibfk_3` FOREIGN KEY (`reciept_no`) REFERENCES `sales` (`reciept_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
