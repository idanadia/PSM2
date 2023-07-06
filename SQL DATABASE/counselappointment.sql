-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 06, 2023 at 01:08 PM
-- Server version: 5.7.33
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `counselappointment`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `dateBirth` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(10) UNSIGNED NOT NULL,
  `clientId` int(10) UNSIGNED DEFAULT NULL,
  `counselorId` int(10) UNSIGNED DEFAULT NULL,
  `timeslotId` int(10) UNSIGNED DEFAULT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appointmentDate` date DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `clientId`, `counselorId`, `timeslotId`, `method`, `appointmentDate`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 4, 'Video Call', '2023-06-15', 1, '2023-06-14 08:25:56', '2023-06-15 02:27:11'),
(2, 1, 4, 4, 'Video Call', '2023-06-16', 0, '2023-06-14 08:28:10', '2023-06-14 08:28:10'),
(3, 1, 4, 2, 'Video Call', '2023-06-09', 0, '2023-06-14 08:32:57', '2023-06-14 08:32:57'),
(4, 1, 4, 1, 'Video Call', '2023-06-16', 0, '2023-06-14 08:42:24', '2023-06-14 08:42:24'),
(5, 2, 4, 4, 'Video Call', '2023-06-18', 0, '2023-06-14 08:46:22', '2023-06-14 08:46:22'),
(6, 1, 4, 1, 'Video Call', '2023-07-24', 1, '2023-06-22 04:54:20', '2023-06-30 16:43:31'),
(7, 1, 4, 1, 'Video Call', '2023-09-13', 0, '2023-06-22 04:56:06', '2023-06-22 04:56:06'),
(8, 1, 4, 4, 'Video Call', '2023-09-25', 0, '2023-06-22 05:01:31', '2023-06-22 05:01:31'),
(10, 1, 4, 1, 'Video Call', '2023-08-01', 0, '2023-06-30 16:54:20', '2023-06-30 16:54:20'),
(11, 1, 4, 1, 'Video Call', '2023-08-08', 0, '2023-07-01 08:02:26', '2023-07-01 08:02:26'),
(12, 1, 4, 6, 'Face to Face', '2023-08-09', 0, '2023-07-01 08:07:06', '2023-07-01 08:07:06'),
(13, 12, 4, 1, 'Video Call', '2023-06-12', 0, '2023-07-01 08:14:28', '2023-07-01 08:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `chatmessages`
--

CREATE TABLE `chatmessages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `senderId` bigint(20) UNSIGNED NOT NULL,
  `receiverId` bigint(20) UNSIGNED NOT NULL,
  `isSeen` tinyint(1) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chatmessages`
--

INSERT INTO `chatmessages` (`id`, `senderId`, `receiverId`, `isSeen`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 0, 'test messages', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(2, 1, 2, 0, 'test messages 2', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(3, 1, 2, 0, 'test messages 3', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(4, 2, 1, 1, 'test messages 4', '2023-06-14 08:23:11', '2023-06-14 08:58:19'),
(5, 2, 1, 1, 'test messages 5', '2023-06-14 08:23:11', '2023-06-14 08:58:19'),
(6, 3, 2, 0, 'test messages', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(7, 3, 2, 0, 'test messages 2', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(8, 4, 1, 1, 'HI!', '2023-06-14 08:29:49', '2023-06-15 02:27:43'),
(9, 4, 1, 1, 'Tester', '2023-06-22 04:59:00', '2023-06-22 04:59:51'),
(10, 1, 4, 1, 'Testing', '2023-06-22 05:00:01', '2023-06-30 16:49:11'),
(11, 1, 4, 1, 'Hi! Or anything.', '2023-06-30 16:45:13', '2023-06-30 16:49:11'),
(12, 4, 1, 0, 'Hello, Ida Nadia.', '2023-06-30 16:49:20', '2023-06-30 16:49:20'),
(13, 4, 1, 0, 'Hello, our appointment is on 8/8.', '2023-07-01 08:05:16', '2023-07-01 08:05:16'),
(14, 1, 4, 0, 'Hi!', '2023-07-01 08:07:30', '2023-07-01 08:07:30'),
(15, 1, 5, 0, 'Hi.', '2023-07-01 08:09:09', '2023-07-01 08:09:09'),
(16, 12, 11, 0, 'May I ask question?', '2023-07-01 08:15:53', '2023-07-01 08:15:53');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `clientId` int(10) UNSIGNED DEFAULT NULL,
  `counselorId` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `clientId`, `counselorId`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2023-06-14 08:25:56', '2023-06-14 08:25:56'),
(2, 2, 4, '2023-06-14 08:46:22', '2023-06-14 08:46:22'),
(3, 12, 4, '2023-07-01 08:14:28', '2023-07-01 08:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` int(10) UNSIGNED NOT NULL,
  `day_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `day_name`, `created_at`, `updated_at`) VALUES
(1, 'Monday', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(2, 'Tuesday', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(3, 'Wednesday', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(4, 'Thursday', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(5, 'Friday', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(6, 'Saturday', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(7, 'Sunday', '2023-06-14 08:23:11', '2023-06-14 08:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inspections`
--

CREATE TABLE `inspections` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `symptom1` tinyint(1) NOT NULL DEFAULT '0',
  `symptom2` tinyint(1) NOT NULL DEFAULT '0',
  `symptom3` tinyint(1) NOT NULL DEFAULT '0',
  `symptom4` tinyint(1) NOT NULL DEFAULT '0',
  `symptom5` tinyint(1) NOT NULL DEFAULT '0',
  `symptom6` tinyint(1) NOT NULL DEFAULT '0',
  `symptom7` tinyint(1) NOT NULL DEFAULT '0',
  `symptom8` tinyint(1) NOT NULL DEFAULT '0',
  `symptom9` tinyint(1) NOT NULL DEFAULT '0',
  `symptom10` tinyint(1) NOT NULL DEFAULT '0',
  `symptom11` tinyint(1) NOT NULL DEFAULT '0',
  `symptom12` tinyint(1) NOT NULL DEFAULT '0',
  `symptom13` tinyint(1) NOT NULL DEFAULT '0',
  `symptom14` tinyint(1) NOT NULL DEFAULT '0',
  `noOfSymptoms` int(11) NOT NULL DEFAULT '0',
  `result` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Negative',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_groups`
--

CREATE TABLE `lecturer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `part` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lecture_halls`
--

CREATE TABLE `lecture_halls` (
  `id` int(10) UNSIGNED NOT NULL,
  `lecture_hall_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecture_hall_place` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2021_11_10_140749_create_subjects_table', 1),
(5, '2021_11_10_140857_create_lecture_halls_table', 1),
(6, '2021_11_10_152640_create_days_table', 1),
(7, '2021_11_10_152712_create_lecturer_groups_table', 1),
(8, '2021_11_10_152712_create_timeslots_table', 1),
(9, '2021_11_11_073617_create_users_table', 1),
(10, '2021_11_11_074001_create_appointment_table', 1),
(11, '2021_11_11_074001_create_client_table', 1),
(12, '2021_11_11_074001_create_health_inspection_table', 1),
(13, '2021_11_11_074001_create_report_table', 1),
(14, '2021_11_11_074001_create_student_timetables_table', 1),
(15, '2021_11_11_075004_create_alter_add_table', 1),
(16, '2021_11_11_075212_alter_column_in_student_timetables_table', 1),
(17, '2023_03_21_123339_create_vendors_table', 1),
(18, '2023_03_21_123350_create_admin_table', 1),
(19, '2023_04_10_052644_create_symptoms_table', 1),
(20, '2023_04_29_000429_create_sessions_table', 1),
(21, '2023_06_06_011456_create_chat_messages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `appointmentId` int(10) UNSIGNED DEFAULT NULL,
  `clientId` int(10) UNSIGNED DEFAULT NULL,
  `counselorId` int(10) UNSIGNED DEFAULT NULL,
  `report` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `appointmentId`, `clientId`, `counselorId`, `report`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4, 'Testing', 'template_IJIC.doc', '2023-06-22 04:46:00', '2023-06-22 04:46:00'),
(2, 9, 1, 4, 'Test.', 'Template-Tesis-UTM-v2-PSM-UG-SC-System-Development.docx', '2023-06-30 16:48:13', '2023-06-30 16:48:13'),
(3, 10, 1, 4, 'DASS REPORT', 'Template-Tesis-UTM-v2-PSM-UG-SC-System-Development.docx', '2023-06-30 16:54:57', '2023-06-30 16:54:57'),
(4, 2, 1, 4, 'dass', 'template_IJIC (1).doc', '2023-06-30 16:56:45', '2023-06-30 16:56:45'),
(5, 11, 1, 4, 'DASS Report', 'template_IJIC (1).doc', '2023-07-01 08:03:37', '2023-07-01 08:03:37');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_timetables`
--

CREATE TABLE `student_timetables` (
  `student_timetable_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `subject_id` int(10) UNSIGNED DEFAULT NULL,
  `day_id` int(10) UNSIGNED DEFAULT NULL,
  `lecture_hall_id` int(10) UNSIGNED DEFAULT NULL,
  `lecturer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `time_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecturer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `symptom_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `symptoms`
--

INSERT INTO `symptoms` (`id`, `symptom_name`, `created_at`, `updated_at`) VALUES
(1, 'Parut dan bekas suntikan di lengan dan di hujung jari bertukar warna akubat menghisap dadah', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(2, 'Kemerosotan kehadiran (sekolah atau tempat kerja) mutu kerja, disiplin dan hasil kerja', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(3, 'Kemerosotan kebersihan diri dan paras rupa', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(4, 'Hidung kerap berdarah', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(5, 'Kesan terbakar di mulut atau jari', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(6, 'Ujian Air Kencing Positif', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(7, 'Meradang tidak tentu sebab, selalu menguap dan tidak bermaya', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(8, 'Tabiat suka menyembunyikan apa-apa yang dilakukan atau dimiliki', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(9, 'Mengelakkan diri dari tanggungjawab', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(10, 'Hilang selera makan (kurang berat badan)', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(11, 'Mata berkaca-kaca, berair atau kemerah-merahan', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(12, 'Badan atau Anggota Badan menggeletar', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(13, 'Percakapan tidak lancar', '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(14, 'Pernafasan berbau', '2023-06-14 08:23:11', '2023-06-14 08:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `timeslots`
--

CREATE TABLE `timeslots` (
  `id` int(10) UNSIGNED NOT NULL,
  `counselorId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `endTime` timestamp NULL DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timeslots`
--

INSERT INTO `timeslots` (`id`, `counselorId`, `startTime`, `endTime`, `isActive`, `created_at`, `updated_at`) VALUES
(1, '4', '2023-05-30 00:00:00', '2023-05-30 01:00:00', 1, '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(2, '4', '2023-05-30 01:00:00', '2023-05-30 02:00:00', 1, '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(3, '4', '2023-05-30 02:00:00', '2023-05-30 03:00:00', 0, '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(4, '4', '2023-05-30 03:00:00', '2023-05-30 04:00:00', 1, '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(5, '4', '2023-05-30 04:00:00', '2023-05-30 05:00:00', 1, '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(6, '4', '2023-07-01 14:00:00', '2023-07-01 15:00:00', 1, '2023-07-01 08:04:36', '2023-07-01 08:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `matricId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `dateOfBirth` timestamp NULL DEFAULT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qualification` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roomLocation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faculty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '0',
  `imagePath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `fullName`, `course`, `password`, `phoneNo`, `matricId`, `address`, `dateOfBirth`, `nationality`, `qualification`, `roomLocation`, `position`, `faculty`, `department`, `icNo`, `email_verified_at`, `role`, `imagePath`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'idanadiarizal@gmail.com', 'Ida Nadia Rizal', '4SECRH', '$2y$10$XGbDiT8RYtetlF4b71QwPeptaVxDZ5I.UJw3gMSwzIpOzm5BfrSju', '0123456789', 'B20EC0027', '12 Jalan Pulau Angsa u10/1e', '2023-06-13 16:00:00', 'Malaysian', NULL, NULL, NULL, 'Faculty of Engineering', NULL, '1234567890', NULL, 0, '1686731140.jpg', NULL, '2023-06-14 08:23:11', '2023-07-01 08:06:06'),
(2, 'client2@counselAppoint.com', 'Client User 2', 'B20', '$2y$10$dvYZloHPy7DHJyZQ2JQvAOcdm9p4PlcQGI5LdsRJ687rhkycSNFdy', '0123456789', 'B20EC0027', '12 Jalan Pulau Angsa u10/1e', NULL, 'Malaysian', NULL, NULL, NULL, 'Faculty of Engineering', 'SASMO', '1234567890', NULL, 0, NULL, NULL, '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(3, 'client3@counselAppoint.com', 'Client User 3', 'B20', '$2y$10$Q1Uvm.Jv2MpYk6K5wQczPuW6h4gTHmtOCtFKQwFBsQU9/Q4/1mZCS', '0123456789', 'B20EC0027', '12 Jalan Pulau Angsa u10/1e', NULL, 'Malaysian', NULL, NULL, NULL, 'Faculty of Engineering', 'SASMO', '1234567890', NULL, 0, NULL, NULL, '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(4, 'idaispunk@gmail.com', 'Dr Zulfikar Ahmad', NULL, '$2y$10$YCmeMT.cs/fmAdt.V2Rkp.pUa05qgreEbUCojYrkcadV/UXbAcxe2', '0123456789', NULL, '01, Jalan Resak 01, UTMJB', '1989-12-31 16:00:00', 'Malaysian', 'Bachelor\'s Degree in Psychology', 'T-01-TEST', 'Tester', 'Faculty of Testing', 'Testing Centre', '1234567890', NULL, 1, '1687360540.png', NULL, '2023-06-14 08:23:11', '2023-07-01 08:01:56'),
(5, 'counselor2@counselAppoint.com', 'Counsellor 2 User', NULL, '$2y$10$n6mmBi6vBe9RoZ7sK3T06uqKo/PLdttr1PGny6kxZj6q4hLw6GxD6', '0123456789', NULL, '12 Jalan Pulau Angsa u10/1e', NULL, 'Malaysian', 'UTM Dengree', 'BL-40-2', NULL, 'Faculty of Engineering', 'SASMO', '1234567890', NULL, 1, NULL, NULL, '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(6, 'counselor3@counselAppoint.com', 'Counsellor 3 User', NULL, '$2y$10$xIAi3bv2cl3g7JF7Xv0sH.GC8MpjY2Hx8kw4sieMQVTAdIAYJLPqC', '0123456789', NULL, '12 Jalan Pulau Angsa u10/1e', NULL, 'Malaysian', 'UTM Dengree', 'BL-40-2', NULL, 'Faculty of Engineering', 'SASMO', '1234567890', NULL, 1, NULL, NULL, '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(7, 'counselor4@counselAppoint.com', 'Counsellor 4 User', NULL, '$2y$10$oPC8oJW.8c.jaaFK1wphs.l9PNLVQLLFc4Tw1wFlOEzGiGYDNPVgS', '0123456789', NULL, '12 Jalan Pulau Angsa u10/1e', NULL, 'Malaysian', 'UTM Dengree', 'BL-40-2', NULL, 'Faculty of Engineering', 'SASMO', '1234567890', NULL, 1, NULL, NULL, '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(8, 'supervisor@counselAppoint.com', 'Supervisor User', NULL, '$2y$10$Rr0nIKiNPmvfK0Sm3FKjCO7JpiaY35YJzpIu0prTUG9G.KL0ESZxq', '0123456789', NULL, '12 Jalan Pulau Angsa u10/1e', NULL, 'Malaysian', 'UTM Dengree', 'BL-40-2', NULL, 'Faculty of Engineering', 'SASMO', '1234567890', NULL, 2, NULL, NULL, '2023-06-14 08:23:11', '2023-06-14 08:23:11'),
(10, 'tmfariz@counselappoint.com', 'TM Fariz', NULL, '$2y$10$WUm8xpr0WBbEHwTLz6Ov8OX0BL19D1jTxccp92KuMpg0uD8PK1kym', '0133809090', NULL, 'No 54 jln bengkung', '2023-06-30 16:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '9908122222', NULL, 0, NULL, NULL, '2023-06-30 16:59:45', '2023-07-01 08:12:14'),
(11, 'muz@utmpk.com', 'Muzaffar', NULL, '$2y$10$V93NviKQgK4DcTRBVmE1UO1U8LWvJxe4NrBJnredXjuOhFdRw48bS', '0123123143', NULL, 'Jalan Bengkung', '1998-12-31 16:00:00', 'Malaysian', 'BSC', 'TEST', 'TESTER', 'TEST', 'TEST', '990110111111', NULL, 1, NULL, NULL, '2023-07-01 08:11:29', '2023-07-01 08:11:29'),
(12, 'nanamilovesyou@gmail.com', 'Nanami', '4SECR', '$2y$10$Bava3UI0OVLmYaDF.y8tbOWflMRTsAb.C/UuiaHwG5C4tjdlFLvK6', '0123445666', 'B20EC0038', 'Jalan Damar', '2023-06-30 16:00:00', 'Malaysiab', NULL, NULL, NULL, 'FOC', NULL, '997622221', NULL, 0, '1688199230.jpg', NULL, '2023-07-01 08:13:14', '2023-07-01 08:13:50');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `dateBirth` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_email_unique` (`email`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatmessages`
--
ALTER TABLE `chatmessages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inspections`
--
ALTER TABLE `inspections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lecturer_groups`
--
ALTER TABLE `lecturer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lecture_halls`
--
ALTER TABLE `lecture_halls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD KEY `password_reset_tokens_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `student_timetables`
--
ALTER TABLE `student_timetables`
  ADD PRIMARY KEY (`student_timetable_id`),
  ADD KEY `student_timetables_subject_id_foreign` (`subject_id`),
  ADD KEY `student_timetables_day_id_foreign` (`day_id`),
  ADD KEY `student_timetables_lecture_hall_id_foreign` (`lecture_hall_id`),
  ADD KEY `student_timetables_user_id_foreign` (`user_id`),
  ADD KEY `student_timetables_lecturer_group_id_foreign` (`lecturer_group_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timeslots`
--
ALTER TABLE `timeslots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chatmessages`
--
ALTER TABLE `chatmessages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inspections`
--
ALTER TABLE `inspections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lecturer_groups`
--
ALTER TABLE `lecturer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lecture_halls`
--
ALTER TABLE `lecture_halls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student_timetables`
--
ALTER TABLE `student_timetables`
  MODIFY `student_timetable_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `symptoms`
--
ALTER TABLE `symptoms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `timeslots`
--
ALTER TABLE `timeslots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student_timetables`
--
ALTER TABLE `student_timetables`
  ADD CONSTRAINT `student_timetables_day_id_foreign` FOREIGN KEY (`day_id`) REFERENCES `days` (`id`),
  ADD CONSTRAINT `student_timetables_lecture_hall_id_foreign` FOREIGN KEY (`lecture_hall_id`) REFERENCES `lecture_halls` (`id`),
  ADD CONSTRAINT `student_timetables_lecturer_group_id_foreign` FOREIGN KEY (`lecturer_group_id`) REFERENCES `lecturer_groups` (`id`),
  ADD CONSTRAINT `student_timetables_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `student_timetables_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
