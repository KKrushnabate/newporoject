-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2016 at 05:57 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tours`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert_notification`
--

CREATE TABLE IF NOT EXISTS `alert_notification` (
`notify_id` int(11) NOT NULL,
  `notify_purpose` enum('driver','user','customer','vehicle','booking') DEFAULT 'user',
  `notify_name` varchar(20) DEFAULT NULL,
  `notify_value` text,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `booking_master`
--

CREATE TABLE IF NOT EXISTS `booking_master` (
`booking_id` int(11) NOT NULL,
  `booking_date` datetime NOT NULL,
  `new_booking_date` datetime DEFAULT NULL,
  `cust_id` int(11) NOT NULL,
  `booked_by` int(11) DEFAULT NULL,
  `booked_on` datetime NOT NULL,
  `pickup_location` text NOT NULL,
  `drop_location` text,
  `no_of_persons` int(5) DEFAULT NULL,
  `vehicle_type` int(5) NOT NULL,
  `travel_type` enum('Local','Outstation','','') NOT NULL COMMENT 'local,outstation',
  `admin_status` varchar(20) DEFAULT NULL,
  `booking_status` int(11) DEFAULT NULL,
  `cancel_by` int(5) DEFAULT NULL,
  `cancel_comment` text,
  `duty_slip_id` int(11) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_master`
--

CREATE TABLE IF NOT EXISTS `customer_master` (
`cust_id` int(11) NOT NULL,
  `cust_type_id` int(11) NOT NULL COMMENT '1-indivisual,2-coorporat',
  `cust_firstname` varchar(40) DEFAULT NULL,
  `cust_middlename` varchar(40) DEFAULT NULL,
  `cust_lastname` varchar(40) DEFAULT NULL,
  `cust_compname` varchar(40) DEFAULT NULL,
  `contact_per_name` varchar(40) DEFAULT NULL,
  `contact_per_desg` varchar(15) DEFAULT NULL,
  `cust_address` varchar(50) DEFAULT NULL,
  `cust_state` varchar(20) DEFAULT NULL,
  `cust_city` varchar(20) DEFAULT NULL,
  `cust_pin` int(11) DEFAULT NULL,
  `cust_telno` int(11) DEFAULT NULL,
  `cust_mob1` int(11) DEFAULT NULL,
  `cust_mob2` int(11) DEFAULT NULL,
  `cust_email1` varchar(30) DEFAULT NULL,
  `cust_email2` varchar(30) DEFAULT NULL,
  `cust_username` varchar(15) NOT NULL,
  `cust_password` varchar(30) NOT NULL,
  `is_service_tax` enum('0','1') NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL,
  `ledger_id` int(10) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_type_master`
--

CREATE TABLE IF NOT EXISTS `customer_type_master` (
`customer_type_id` int(11) NOT NULL,
  `customer_type_name` varchar(45) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `driver_master`
--

CREATE TABLE IF NOT EXISTS `driver_master` (
`driver_id` int(11) NOT NULL,
  `driver_fname` varchar(20) NOT NULL,
  `driver_lname` varchar(20) NOT NULL,
  `driver_add` varchar(40) NOT NULL,
  `driver_photo` varchar(50) NOT NULL,
  `driver_mobno` int(11) NOT NULL,
  `driver_licno` varchar(20) NOT NULL,
  `driver_licexpdate` date NOT NULL,
  `driver_panno` varchar(20) NOT NULL,
  `driver_bdate` date NOT NULL,
  `is_da` enum('0','1') NOT NULL DEFAULT '0',
  `is_night_allowance` enum('0','1') NOT NULL DEFAULT '0',
  `isactive` enum('0','1') NOT NULL DEFAULT '0',
  `ledger_id` int(10) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `duty_sleep_master`
--

CREATE TABLE IF NOT EXISTS `duty_sleep_master` (
`duty_sleep_id` int(11) NOT NULL,
  `vehicle_id` int(5) NOT NULL,
  `driver_id` int(5) NOT NULL,
  `total_kms` varchar(20) DEFAULT NULL,
  `extra_kms` varchar(20) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `extra_hrs` varchar(20) DEFAULT NULL,
  `total_hrs` varchar(20) DEFAULT NULL,
  `toll_fess` int(20) DEFAULT NULL,
  `parking_fees` int(20) DEFAULT NULL,
  `advance_paid` int(20) DEFAULT NULL,
  `total_amt` int(20) DEFAULT NULL,
  `booking_id` int(5) NOT NULL,
  `comments` text,
  `payment_status` int(5) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `extra_allowance`
--

CREATE TABLE IF NOT EXISTS `extra_allowance` (
`allowance_id` int(11) NOT NULL,
  `allowance_type` varchar(20) NOT NULL,
  `allowance_value` double DEFAULT NULL,
  `allowance_context` varchar(20) DEFAULT NULL,
  `allowance_comment` text,
  `isactive` enum('0','1') NOT NULL DEFAULT '0',
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_master`
--

CREATE TABLE IF NOT EXISTS `invoice_master` (
`invoice_id` int(11) NOT NULL,
  `booking_id` int(10) NOT NULL,
  `duty_sleep_id` int(10) DEFAULT NULL,
  `invoice_start_date` datetime DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `payment_mode` enum('cash','cheque','card','online') DEFAULT NULL,
  `total_amount` int(20) DEFAULT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cheque_date` datetime DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `bank_name` varchar(20) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ledger_master`
--

CREATE TABLE IF NOT EXISTS `ledger_master` (
`ledger_account_id` int(11) NOT NULL,
  `ledger_account_name` varchar(100) NOT NULL,
  `nature_of_account` varchar(20) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `report_head` varchar(256) DEFAULT NULL,
  `operating_type` varchar(40) DEFAULT NULL,
  `context_ref_id` int(11) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `ledger_start_date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `entity_type` enum('main','group','ledger') NOT NULL DEFAULT 'ledger',
  `behaviour` varchar(20) DEFAULT NULL,
  `defined_by` enum('system','user') DEFAULT 'user',
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ledger_transactions`
--

CREATE TABLE IF NOT EXISTS `ledger_transactions` (
`txn_id` bigint(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `ledger_account_id` int(11) DEFAULT NULL,
  `ledger_account_name` varchar(50) DEFAULT NULL,
  `transaction_type` enum('dr','cr') DEFAULT NULL COMMENT 'debit/credit',
  `payment_mode` varchar(20) DEFAULT NULL,
  `payment_reference` varchar(256) DEFAULT NULL,
  `transaction_amount` double(14,3) DEFAULT '0.000',
  `other_reference_id` varchar(256) DEFAULT NULL,
  `txn_from_id` bigint(11) DEFAULT NULL,
  `memo_desc` varchar(256) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `package_master`
--

CREATE TABLE IF NOT EXISTS `package_master` (
`package_id` int(11) NOT NULL,
  `package_name` varchar(30) NOT NULL,
  `package_amt` int(11) DEFAULT NULL,
  `isactive` tinyint(4) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `passenger_details`
--

CREATE TABLE IF NOT EXISTS `passenger_details` (
`id` int(11) NOT NULL,
  `passenger_name` varchar(25) NOT NULL,
  `passenger_number` int(11) DEFAULT NULL,
  `pickup_address` text,
  `drop_address` text,
  `pickup_time` datetime DEFAULT NULL,
  `booking_id` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_master`
--

CREATE TABLE IF NOT EXISTS `payment_master` (
`payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `payment_type` enum('dr','cr') NOT NULL,
  `to_ledger_id` int(11) DEFAULT '0',
  `from_ledger_id` int(11) DEFAULT '0',
  `payment_amount` double(14,3) DEFAULT '0.000',
  `payment_date` date NOT NULL,
  `payment_mode` enum('cheque','card','cash') NOT NULL,
  `payment_comments` varchar(45) DEFAULT NULL,
  `payment_bank_name` varchar(75) DEFAULT NULL,
  `payment_cheque_number` varchar(15) DEFAULT NULL,
  `payment_card_num` varchar(25) DEFAULT NULL,
  `transaction_id` varchar(30) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `time`) VALUES
(1, 'omkar', '0000-00-00 00:00:00'),
(2, 'omkar', '0000-00-00 00:00:00'),
(3, 'omkar', '2016-07-12 06:07:50'),
(4, 'omkar', '2016-07-12 06:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `users_master`
--

CREATE TABLE IF NOT EXISTS `users_master` (
`user_id` int(11) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `password` varchar(75) DEFAULT NULL,
  `user_first_name` varchar(100) DEFAULT NULL,
  `user_last_name` varchar(100) DEFAULT NULL,
  `user_email_id` varchar(100) DEFAULT NULL,
  `user_mobile_number` varchar(20) DEFAULT NULL,
  `user_profile_photo` varchar(45) DEFAULT NULL,
  `user_type` varchar(15) DEFAULT NULL,
  `user_dob` date DEFAULT NULL,
  `user_source` varchar(115) DEFAULT 'Admin',
  `user_referer` text,
  `user_gmt_time_zone` varchar(45) DEFAULT NULL,
  `ledger_id` int(10) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `logged_in` enum('0','1') DEFAULT '0',
  `is_superadmin` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_access_logs`
--

CREATE TABLE IF NOT EXISTS `user_access_logs` (
`user_access_logs_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ip_address` varchar(20) NOT NULL,
  `user_activity` varchar(245) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `access_url` varchar(245) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_attendance`
--

CREATE TABLE IF NOT EXISTS `user_attendance` (
`user_attn_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_first_name` varchar(100) NOT NULL,
  `user_last_name` varchar(100) NOT NULL,
  `user_type` varchar(45) NOT NULL,
  `user_check_in` datetime DEFAULT NULL,
  `user_check_out` datetime DEFAULT NULL,
  `user_check_in_gate` varchar(25) DEFAULT NULL,
  `user_check_out_gate` varchar(25) DEFAULT NULL,
  `user_allowance` varchar(25) DEFAULT NULL,
  `user_biometric_id` varchar(45) DEFAULT NULL,
  `user_badge_number` varchar(45) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_type_master`
--

CREATE TABLE IF NOT EXISTS `user_type_master` (
`user_type_id` int(11) NOT NULL,
  `user_type_name` varchar(45) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_category`
--

CREATE TABLE IF NOT EXISTS `vehicle_category` (
`cat_id` int(11) NOT NULL,
  `cat_name` varchar(10) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `vehicle_category`
--

INSERT INTO `vehicle_category` (`cat_id`, `cat_name`, `added_by`, `added_on`, `updated_by`, `updated_on`) VALUES
(3, 'xyz', 1, '2016-07-13 03:22:47', NULL, NULL),
(4, 'abc', 1, '2016-07-13 03:31:13', NULL, NULL),
(5, 'xuz', 1, '2016-07-13 03:31:45', NULL, NULL),
(6, 'vndfj', 1, '2016-07-13 03:32:03', NULL, NULL),
(7, 'vndj', 1, '2016-07-13 03:32:52', NULL, NULL),
(8, 'bfdb', 1, '2016-07-24 05:37:38', NULL, NULL),
(9, 'bfdbdsfc', 1, '2016-07-24 05:38:58', NULL, NULL),
(10, 'bfdbd', 1, '0000-00-00 00:00:00', NULL, NULL),
(11, 'bfdbdbdfbf', 1, '2016-07-24 05:43:12', NULL, NULL),
(12, 'bfdbdbdfbf', 1, '2016-07-24 05:43:54', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_details`
--

CREATE TABLE IF NOT EXISTS `vehicle_details` (
`vldetail_id` int(11) NOT NULL,
  `vehicle_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `vehicle_name` varchar(30) DEFAULT NULL,
  `vehicle_insuexpdate` datetime DEFAULT NULL,
  `vehicle_pucexpdate` datetime DEFAULT NULL,
  `vehicle_Tpermitexpdate` datetime DEFAULT NULL,
  `vehicle_oilchangedate` datetime DEFAULT NULL,
  `vehicle_oilchangekm` double DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_images`
--

CREATE TABLE IF NOT EXISTS `vehicle_images` (
`image_id` int(11) NOT NULL,
  `vehicle_id` int(10) DEFAULT NULL,
  `image_size` int(10) DEFAULT NULL,
  `image_data` blob,
  `image_name` varchar(30) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_master`
--

CREATE TABLE IF NOT EXISTS `vehicle_master` (
`vehicle_id` int(11) NOT NULL,
  `vehicle_no` varchar(15) DEFAULT NULL,
  `vehicle_type` varchar(10) NOT NULL,
  `vehicle_model` varchar(20) DEFAULT NULL,
  `fuel_type` varchar(15) DEFAULT NULL,
  `passanger_capacity` int(11) DEFAULT NULL,
  `vehicle_category` varchar(20) DEFAULT NULL COMMENT 'SUV,SEDAN,HATCHBACK',
  `vehicle_features` varchar(50) DEFAULT NULL,
  `vehicle_insuexpdate` date DEFAULT NULL,
  `vehicle_pucexpdate` date DEFAULT NULL,
  `vehicle_Tpermitexpdate` date DEFAULT NULL,
  `vehicle_oilchangedate` date DEFAULT NULL,
  `vehicle_photos` varchar(50) DEFAULT NULL,
  `vehicle_status` int(11) DEFAULT NULL COMMENT '1-active,0-inactive',
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vehicle_master`
--

INSERT INTO `vehicle_master` (`vehicle_id`, `vehicle_no`, `vehicle_type`, `vehicle_model`, `fuel_type`, `passanger_capacity`, `vehicle_category`, `vehicle_features`, `vehicle_insuexpdate`, `vehicle_pucexpdate`, `vehicle_Tpermitexpdate`, `vehicle_oilchangedate`, `vehicle_photos`, `vehicle_status`, `added_by`, `added_on`, `updated_by`, `updated_on`) VALUES
(3, '455', 'max', 'city', 'petrol', 5, '3', 'hello', NULL, NULL, NULL, NULL, NULL, 1, 1, '2016-07-24 07:23:20', NULL, NULL),
(4, '455', 'max', 'city', 'petrol', 5, '3', 'hello', NULL, NULL, NULL, NULL, NULL, 1, 1, '2016-07-24 07:23:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors_master`
--

CREATE TABLE IF NOT EXISTS `vendors_master` (
`vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(145) NOT NULL,
  `vendor_number` varchar(45) DEFAULT NULL,
  `vendor_contact_number` varchar(45) NOT NULL,
  `vendor_phone_number` varchar(45) DEFAULT NULL,
  `vendor_email` varchar(100) DEFAULT NULL,
  `vendor_notes` varchar(145) DEFAULT NULL,
  `vendor_expense_group_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT '0',
  `vendor_is_company` tinyint(4) DEFAULT '0',
  `vendor_credit_period` mediumint(9) DEFAULT '30',
  `vendor_service_regn` varchar(45) DEFAULT NULL,
  `vendor_pan_num` varchar(45) DEFAULT NULL,
  `vendor_section_code` varchar(45) DEFAULT NULL,
  `vendor_payee_name` varchar(45) DEFAULT NULL,
  `vendor_address` text,
  `vendor_vat` tinyint(4) DEFAULT '0',
  `vendor_cst` tinyint(4) DEFAULT '0',
  `vendor_gst` tinyint(4) DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `vendor_ledger_id` int(11) DEFAULT NULL,
  `status` enum('0','1') DEFAULT '0',
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `ledgercreated` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_bill_payment_details`
--

CREATE TABLE IF NOT EXISTS `vendor_bill_payment_details` (
`vendor_bill_payment_id` int(11) NOT NULL,
  `vendor_bill_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL DEFAULT '0',
  `to_ledger_id` int(11) DEFAULT '0',
  `from_ledger_id` int(11) DEFAULT '0',
  `vendor_bill_payment_amount` double(14,3) DEFAULT '0.000',
  `vendor_bill_payment_date` date NOT NULL,
  `vendor_bill_payment_mode` enum('cheque','card','cash') NOT NULL,
  `vendor_bill_payment_comments` varchar(45) DEFAULT NULL,
  `vendor_bill_payment_bank_name` varchar(75) DEFAULT NULL,
  `vendor_bill_payment_cheque_number` varchar(15) DEFAULT NULL,
  `vendor_bill_payment_card_num` varchar(4) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert_notification`
--
ALTER TABLE `alert_notification`
 ADD PRIMARY KEY (`notify_id`);

--
-- Indexes for table `booking_master`
--
ALTER TABLE `booking_master`
 ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `customer_master`
--
ALTER TABLE `customer_master`
 ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `customer_type_master`
--
ALTER TABLE `customer_type_master`
 ADD PRIMARY KEY (`customer_type_id`);

--
-- Indexes for table `driver_master`
--
ALTER TABLE `driver_master`
 ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `duty_sleep_master`
--
ALTER TABLE `duty_sleep_master`
 ADD PRIMARY KEY (`duty_sleep_id`);

--
-- Indexes for table `extra_allowance`
--
ALTER TABLE `extra_allowance`
 ADD PRIMARY KEY (`allowance_id`);

--
-- Indexes for table `invoice_master`
--
ALTER TABLE `invoice_master`
 ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `ledger_master`
--
ALTER TABLE `ledger_master`
 ADD PRIMARY KEY (`ledger_account_id`);

--
-- Indexes for table `ledger_transactions`
--
ALTER TABLE `ledger_transactions`
 ADD PRIMARY KEY (`txn_id`);

--
-- Indexes for table `package_master`
--
ALTER TABLE `package_master`
 ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `passenger_details`
--
ALTER TABLE `passenger_details`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_master`
--
ALTER TABLE `payment_master`
 ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_master`
--
ALTER TABLE `users_master`
 ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_access_logs`
--
ALTER TABLE `user_access_logs`
 ADD PRIMARY KEY (`user_access_logs_id`);

--
-- Indexes for table `user_attendance`
--
ALTER TABLE `user_attendance`
 ADD PRIMARY KEY (`user_attn_id`);

--
-- Indexes for table `user_type_master`
--
ALTER TABLE `user_type_master`
 ADD PRIMARY KEY (`user_type_id`);

--
-- Indexes for table `vehicle_category`
--
ALTER TABLE `vehicle_category`
 ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `vehicle_details`
--
ALTER TABLE `vehicle_details`
 ADD PRIMARY KEY (`vldetail_id`);

--
-- Indexes for table `vehicle_images`
--
ALTER TABLE `vehicle_images`
 ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `vehicle_master`
--
ALTER TABLE `vehicle_master`
 ADD PRIMARY KEY (`vehicle_id`);

--
-- Indexes for table `vendors_master`
--
ALTER TABLE `vendors_master`
 ADD PRIMARY KEY (`vendor_id`);

--
-- Indexes for table `vendor_bill_payment_details`
--
ALTER TABLE `vendor_bill_payment_details`
 ADD PRIMARY KEY (`vendor_bill_payment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alert_notification`
--
ALTER TABLE `alert_notification`
MODIFY `notify_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `booking_master`
--
ALTER TABLE `booking_master`
MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_master`
--
ALTER TABLE `customer_master`
MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_type_master`
--
ALTER TABLE `customer_type_master`
MODIFY `customer_type_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_master`
--
ALTER TABLE `driver_master`
MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `duty_sleep_master`
--
ALTER TABLE `duty_sleep_master`
MODIFY `duty_sleep_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `extra_allowance`
--
ALTER TABLE `extra_allowance`
MODIFY `allowance_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice_master`
--
ALTER TABLE `invoice_master`
MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ledger_master`
--
ALTER TABLE `ledger_master`
MODIFY `ledger_account_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ledger_transactions`
--
ALTER TABLE `ledger_transactions`
MODIFY `txn_id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `package_master`
--
ALTER TABLE `package_master`
MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `passenger_details`
--
ALTER TABLE `passenger_details`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_master`
--
ALTER TABLE `payment_master`
MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_master`
--
ALTER TABLE `users_master`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_access_logs`
--
ALTER TABLE `user_access_logs`
MODIFY `user_access_logs_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_attendance`
--
ALTER TABLE `user_attendance`
MODIFY `user_attn_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_type_master`
--
ALTER TABLE `user_type_master`
MODIFY `user_type_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vehicle_category`
--
ALTER TABLE `vehicle_category`
MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `vehicle_details`
--
ALTER TABLE `vehicle_details`
MODIFY `vldetail_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vehicle_images`
--
ALTER TABLE `vehicle_images`
MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vehicle_master`
--
ALTER TABLE `vehicle_master`
MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vendors_master`
--
ALTER TABLE `vendors_master`
MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vendor_bill_payment_details`
--
ALTER TABLE `vendor_bill_payment_details`
MODIFY `vendor_bill_payment_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
