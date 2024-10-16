-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2024 at 12:47 PM
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
-- Database: `email_campaign`
--

-- --------------------------------------------------------

--
-- Table structure for table `csv_files`
--

CREATE TABLE `csv_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `csv_files`
--

INSERT INTO `csv_files` (`id`, `campaign_name`, `file_name`, `path`, `created_at`, `updated_at`) VALUES
(1, 'Varun', 'csv.csv', 'csv/U17F5A3WG5knjGIMxmUBtVDVwewswTz9oShPGM6A.txt', '2024-10-16 04:47:36', '2024-10-16 04:47:36'),
(2, 'pp', 'csv.csv', 'csv/VIfTKZo0FMH6whILh79ozlDAp1Zi5sNAHKEq8qo5.txt', '2024-10-16 04:50:37', '2024-10-16 04:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_10_16_043406_create_csv_files_table', 2),
(6, '2024_10_16_074119_create_jobs_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'EmailCampaign', 'a8c625480489f72f4a803c899998119f37bdcf2ca2b3b01d53e7e4d38c1bb3d7', '[\"*\"]', NULL, NULL, '2024-10-14 04:23:46', '2024-10-14 04:23:46'),
(2, 'App\\Models\\User', 4, 'EmailCampaign', '86e5c4af144fee06cde0e7eff55e011bceda4d0246119443921523b324ffbe81', '[\"*\"]', NULL, NULL, '2024-10-14 04:25:35', '2024-10-14 04:25:35'),
(3, 'App\\Models\\User', 4, 'EmailCampaign', '82039c9dfac6daadcea7d37ce0714d66c69a0249b4ab9d3db4fa1a0e012802ad', '[\"*\"]', NULL, NULL, '2024-10-14 04:34:59', '2024-10-14 04:34:59'),
(4, 'App\\Models\\User', 4, 'EmailCampaign', '39bdb57045fca34d0fff845d39fe1a03a4ca3d6388214a0f7022634d2df1bb68', '[\"*\"]', NULL, NULL, '2024-10-14 04:36:58', '2024-10-14 04:36:58'),
(5, 'App\\Models\\User', 4, 'EmailCampaign', 'a9afa0c21bbad9d08981769b81ecc32290a0abbb74300018aeda0b6848f32f5e', '[\"*\"]', NULL, NULL, '2024-10-14 04:43:04', '2024-10-14 04:43:04'),
(6, 'App\\Models\\User', 4, 'EmailCampaign', 'bc52e0a3c663604b4cd4fec4dc32e0c4945d9cb974a4121b727e5a678c64538a', '[\"*\"]', NULL, NULL, '2024-10-14 05:01:29', '2024-10-14 05:01:29'),
(7, 'App\\Models\\User', 4, 'EmailCampaign', '58064d04e061364faf88b90b5c44e0177e5d4021fe74e7ca2bfeda50229a66bd', '[\"*\"]', '2024-10-14 06:39:05', NULL, '2024-10-14 05:19:48', '2024-10-14 06:39:05'),
(8, 'App\\Models\\User', 4, 'EmailCampaign', '86454acc6bb9fafcebe910a0bed5d362702e174835647dfae403c70de2b7993f', '[\"*\"]', '2024-10-16 04:35:35', NULL, '2024-10-15 23:00:01', '2024-10-16 04:35:35'),
(9, 'App\\Models\\User', 4, 'EmailCampaign', '1b199af37c42139b1fc6da5e10d0522c41b69e85c3c86a2bf05876eeb6e84bfd', '[\"*\"]', '2024-10-16 04:50:37', NULL, '2024-10-16 04:38:42', '2024-10-16 04:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$H2sQ/2h/jn5q.JvZEikaquDOS83Tdb1n82qWiyU247UOt4wjH53/G', NULL, '2024-10-14 03:34:51', '2024-10-14 03:34:51'),
(2, 'Varun Gupta', 'varun@gmail.com', NULL, '$2y$10$xav.LxZ1VaPNx7VO2vb30.njVZWi2QcfycrPDBGDVSRGVebq0EP8q', NULL, '2024-10-14 03:44:41', '2024-10-14 03:44:41'),
(3, 'tara', 'tara@gmail.com', NULL, '$2y$10$y9iOaBmU26Eg0IzrNH4mE.O4cPYwUa7lTC9AccfFWs8D206hIT9xe', NULL, '2024-10-14 04:15:37', '2024-10-14 04:15:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `csv_files`
--
ALTER TABLE `csv_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `csv_files`
--
ALTER TABLE `csv_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
