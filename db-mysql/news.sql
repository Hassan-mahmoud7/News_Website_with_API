-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2024 at 11:06 PM
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
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `phone`, `email`, `role_id`, `status`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin name', 'admin_username', '01287587134', 'admin@gmail.com', 1, 1, '$2y$10$4Djv1rIRWtGHSdY5qZlzZOHYqzTWGpIlpRK7ASSz0tV7h3JitvzGS', NULL, '2024-11-13 22:05:19', '2024-11-13 22:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `authorizations`
--

CREATE TABLE `authorizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authorizations`
--

INSERT INTO `authorizations` (`id`, `role`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '[\"posts\",\"categories\",\"settings\",\"users\",\"contacts\",\"admins\",\"home\",\"authorizations\",\"profile\",\"notifications\"]', '2024-11-13 22:05:19', '2024-11-13 22:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `small_desc` longtext NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `small_desc`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cora Schowalter II', 'Dolorum nisi provident veniam eaque tempora. Ut aut sunt deleniti qui et explicabo.', 'quo-esse-delectus-fugiat-rem-quis', 1, '1975-11-30 09:11:09', '1975-11-30 09:11:09'),
(2, 'Sammie Koepp', 'Et et dolorem temporibus qui consequatur ut. Sit recusandae aut eius consequatur.', 'consectetur-repellendus-aut-ducimus-et-itaque-minus-omnis-vitae', 1, '1997-05-03 02:05:43', '1997-05-03 02:05:43'),
(3, 'Dr. Jody Monahan', 'Dolorem autem eum et. Eveniet eos dolor vero. Amet et eius molestiae culpa sit necessitatibus.', 'doloremque-laborum-veritatis-nulla-et', 1, '1985-09-23 01:09:57', '1985-09-23 01:09:57'),
(4, 'Dusty Jacobs', 'Vero modi ut dolor porro culpa eligendi. Distinctio corrupti non harum qui sunt. Asperiores maiores harum consequuntur dignissimos sit.', 'sit-fuga-fugit-tempore-sit-quod', 1, '1983-05-06 07:05:40', '1983-05-06 07:05:40');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `ip_address`, `status`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 'Corporis molestias quis autem eum voluptas enim consequatur. Et deserunt consequatur aut aperiam rem.', '170.64.80.64', 0, 20, 26, '1985-09-22 04:09:16', '1985-09-22 04:09:16'),
(2, 'Sequi voluptate perferendis occaecati placeat et. Officia ut aliquid tenetur facilis tempore.', '235.121.179.30', 0, 19, 47, '1990-06-09 06:06:01', '1990-06-09 06:06:01'),
(3, 'Corporis quo ea pariatur blanditiis. Temporibus repellendus eius et beatae. Minus modi quia mollitia qui eum voluptas et.', '203.62.100.168', 0, 1, 3, '1996-04-29 23:04:08', '1996-04-29 23:04:08'),
(4, 'Vero quos velit nisi dicta aut. Nulla sed nesciunt perferendis voluptatibus et ut temporibus.', '41.162.62.217', 1, 19, 35, '1971-03-03 00:03:42', '1971-03-03 00:03:42'),
(5, 'Incidunt atque ut tempore et. Cumque sed recusandae incidunt molestiae fugit sint praesentium ratione.', '174.231.241.148', 1, 20, 42, '2019-10-09 06:10:32', '2019-10-09 06:10:32'),
(6, 'Qui impedit eius ab voluptate amet. Vitae odio possimus ut dolorem dolorem iusto voluptatem. Non dolorem dolores velit enim est dignissimos.', '90.80.131.146', 0, 2, 31, '2011-02-25 03:02:29', '2011-02-25 03:02:29'),
(7, 'Est aut non minus quis sit mollitia dolorem. Ex omnis autem non.', '136.125.219.58', 0, 5, 32, '2001-09-05 07:09:50', '2001-09-05 07:09:50'),
(8, 'Consequatur maxime quod et distinctio alias consequatur. Sint id alias ea delectus magnam autem. Ea laboriosam ex voluptatem minima voluptatem quod est.', '247.21.128.68', 1, 7, 5, '1984-10-07 09:10:07', '1984-10-07 09:10:07'),
(9, 'Quas ut quia accusantium fuga. Modi suscipit dolorem corrupti labore quod corporis. Eius architecto at voluptatem numquam distinctio officia quod.', '212.139.200.59', 1, 6, 32, '2001-05-25 07:05:38', '2001-05-25 07:05:38'),
(10, 'Cum atque praesentium dolores consequuntur omnis distinctio nostrum distinctio. Labore laboriosam deleniti sed eum. Nemo ipsum dolorem quod hic a quis.', '211.20.151.94', 0, 11, 30, '1986-05-23 09:05:59', '1986-05-23 09:05:59'),
(11, 'Et aut occaecati qui est et. Quam quo voluptatibus tempora iste atque delectus.', '191.171.163.157', 0, 1, 15, '1975-09-15 07:09:16', '1975-09-15 07:09:16'),
(12, 'Dignissimos voluptatem temporibus eos possimus eum. Et delectus et ipsam dolorem quam. Voluptatem architecto quasi consectetur voluptas ea.', '189.27.170.156', 1, 3, 40, '2003-11-21 10:11:24', '2003-11-21 10:11:24'),
(13, 'Rem nostrum quae aut id nihil. At rem eum quam corporis non id praesentium. Culpa iste velit id sunt dicta rerum.', '242.90.133.247', 1, 5, 35, '1998-12-25 01:12:14', '1998-12-25 01:12:14'),
(14, 'Consequatur dolor architecto corrupti non ut similique. Placeat impedit quod provident harum aliquid. Consequatur aut provident adipisci rem tempora esse sequi.', '54.12.128.163', 0, 13, 1, '2004-06-29 06:06:23', '2004-06-29 06:06:23'),
(15, 'Eos quibusdam impedit quis quibusdam optio quae. Eligendi nihil et fuga corrupti modi ipsum corporis.', '251.129.92.170', 1, 17, 2, '1974-05-20 23:05:18', '1974-05-20 23:05:18'),
(16, 'Delectus tempore quia distinctio autem rerum sed adipisci. A autem blanditiis reiciendis ut quia. Accusantium aut corrupti hic non quis aut perferendis velit.', '10.201.166.149', 0, 17, 14, '1984-11-28 23:11:46', '1984-11-28 23:11:46'),
(17, 'Quas quod aperiam atque atque amet. Debitis cum rem voluptatum numquam hic voluptas.', '243.201.191.135', 1, 10, 31, '1970-08-14 09:08:43', '1970-08-14 09:08:43'),
(18, 'Accusamus laboriosam amet ipsum voluptas. Nesciunt voluptatem quia dolore autem reprehenderit. Quibusdam quo et ut et consequatur voluptatem sunt.', '70.167.234.76', 0, 12, 17, '1985-12-21 23:12:14', '1985-12-21 23:12:14'),
(19, 'Distinctio eum voluptate quas non. In odio tenetur et rerum temporibus temporibus. Non corrupti quibusdam et hic id maxime.', '115.140.126.143', 1, 13, 22, '1988-06-20 23:06:36', '1988-06-20 23:06:36'),
(20, 'Vero saepe dolores distinctio voluptas deserunt. Vitae nostrum possimus ipsam doloribus reiciendis. Officiis dignissimos autem omnis nihil veritatis impedit.', '6.147.139.98', 1, 4, 20, '2003-10-23 06:10:24', '2003-10-23 06:10:24'),
(21, 'Rerum quibusdam commodi sequi alias. Non natus quae et iste minus hic.', '98.126.67.61', 0, 16, 6, '1976-11-08 04:11:04', '1976-11-08 04:11:04'),
(22, 'Omnis neque temporibus laudantium doloremque eum. Laudantium aliquam non quo modi non. Modi est minus dolor placeat mollitia quia repellat.', '93.79.125.11', 1, 18, 4, '2024-08-14 02:08:03', '2024-08-14 02:08:03'),
(23, 'Dolor similique qui quae officia est eaque. Voluptatem iure qui et quia. Molestias totam eos hic doloribus labore.', '139.226.194.65', 1, 5, 43, '2005-04-25 23:04:39', '2005-04-25 23:04:39'),
(24, 'Distinctio omnis nulla dolor quia qui. Delectus earum porro sunt quia.', '119.87.5.238', 1, 15, 9, '1975-05-03 06:05:54', '1975-05-03 06:05:54'),
(25, 'Quaerat fuga possimus minus velit. Deleniti molestiae ad iste voluptates quo. Animi autem eaque id expedita dolor.', '13.22.82.98', 1, 7, 17, '2013-03-07 08:03:14', '2013-03-07 08:03:14'),
(26, 'Doloremque officia vero sed aliquid facere. Neque harum commodi tempore quaerat molestiae sed non delectus. A quia suscipit repellat dolor impedit mollitia libero minus.', '40.106.27.153', 1, 3, 7, '2023-02-25 03:02:29', '2023-02-25 03:02:29'),
(27, 'Sit dignissimos illum dolorem et. Accusantium qui distinctio quisquam iusto corporis sapiente.', '182.225.190.61', 0, 5, 11, '2000-12-12 06:12:20', '2000-12-12 06:12:20'),
(28, 'Quis cumque repudiandae maiores cum sint ut nesciunt tenetur. Labore animi quis accusantium molestiae provident.', '77.209.45.118', 1, 20, 38, '1971-04-02 03:04:35', '1971-04-02 03:04:35'),
(29, 'Maiores velit minima pariatur vel. Sit voluptatem veniam minima. Corporis non ullam cum molestiae.', '120.105.122.216', 0, 5, 32, '2014-06-23 22:06:19', '2014-06-23 22:06:19'),
(30, 'Sed quia eius autem vel ad delectus. Officiis dolore voluptatem sit aut a recusandae autem.', '52.207.119.158', 1, 6, 29, '2006-07-04 09:07:42', '2006-07-04 09:07:42'),
(31, 'Sit earum quam non debitis deleniti nihil cupiditate quos. Ratione delectus facere accusantium in harum quaerat praesentium enim.', '146.198.167.90', 1, 8, 5, '2009-10-11 01:10:32', '2009-10-11 01:10:32'),
(32, 'Et qui labore tempore architecto architecto eaque. In qui nihil sint blanditiis debitis ipsa hic atque. Qui quam eveniet illo dicta ipsam sint.', '88.185.97.12', 0, 4, 3, '1999-01-29 04:01:33', '1999-01-29 04:01:33'),
(33, 'Omnis qui accusamus repudiandae nisi et accusantium. Enim dolorum ullam saepe iure.', '54.165.251.154', 1, 4, 30, '1973-09-03 03:09:56', '1973-09-03 03:09:56'),
(34, 'Sapiente accusantium iure eaque doloremque qui sed. Dolor nobis nulla vel porro beatae reiciendis commodi.', '163.24.98.172', 1, 4, 27, '2000-03-05 06:03:34', '2000-03-05 06:03:34'),
(35, 'Similique rerum est ab ut omnis quam ut. Quia sapiente autem alias iure ut sapiente. Repudiandae explicabo fuga est dolores sequi ratione vel.', '112.147.34.150', 1, 1, 39, '1998-05-30 00:05:31', '1998-05-30 00:05:31'),
(36, 'Animi numquam dolorem explicabo aperiam non minima. Est est vel delectus blanditiis veniam voluptatem. Fuga autem officiis sed officia qui est tempore.', '17.42.158.125', 0, 7, 46, '2010-10-26 06:10:45', '2010-10-26 06:10:45'),
(37, 'Possimus quia atque facilis tenetur sed iusto. Hic et fugit optio nostrum explicabo sed consectetur.', '69.113.116.39', 1, 20, 37, '2012-05-09 02:05:03', '2012-05-09 02:05:03'),
(38, 'Rerum minima doloremque libero vitae. Vero rerum qui necessitatibus.', '171.58.137.250', 0, 15, 13, '2001-11-21 06:11:17', '2001-11-21 06:11:17'),
(39, 'Voluptatem voluptas doloremque blanditiis impedit odio totam dolorem. Est eius rerum eum iusto cupiditate. Odio rerum dignissimos et omnis nihil eos laboriosam.', '255.228.107.177', 1, 11, 46, '2022-07-29 00:07:16', '2022-07-29 00:07:16'),
(40, 'Quis aut fugit dolore. Ut quis corporis omnis et accusantium non. Quis iste doloremque ut consequatur similique error quia.', '219.255.69.202', 0, 19, 26, '1977-11-03 02:11:41', '1977-11-03 02:11:41'),
(41, 'Natus incidunt aut quasi quibusdam. Ea suscipit fuga repellendus ducimus et. Nostrum et veniam voluptatibus.', '243.2.30.35', 0, 7, 7, '1989-08-27 06:08:30', '1989-08-27 06:08:30'),
(42, 'Architecto mollitia incidunt assumenda culpa non ipsum fugit. Eius officia corporis magni dignissimos et dolores.', '62.174.211.49', 1, 12, 14, '1974-08-03 03:08:39', '1974-08-03 03:08:39'),
(43, 'Facilis repudiandae ipsum est quibusdam quae non repudiandae. Aliquam dolor dolore excepturi assumenda.', '142.28.247.86', 0, 17, 24, '1990-01-28 04:01:39', '1990-01-28 04:01:39'),
(44, 'Mollitia animi eos eos unde possimus laborum adipisci aliquid. Distinctio sed dolore totam est tempora aperiam a nihil. Aliquam autem inventore enim tenetur.', '184.96.2.85', 0, 12, 26, '1989-06-10 23:06:31', '1989-06-10 23:06:31'),
(45, 'Consectetur magnam recusandae harum provident molestiae magni. Et nihil cupiditate quas aut. Aut omnis dolore necessitatibus voluptatem explicabo.', '193.43.136.188', 0, 18, 31, '1988-03-27 23:03:08', '1988-03-27 23:03:08'),
(46, 'Sunt quis minima corrupti quos. Voluptatem iusto sequi voluptatibus reprehenderit accusamus aliquid necessitatibus. Vitae porro corporis iste quia perferendis.', '35.222.192.187', 1, 8, 6, '2003-05-01 23:05:57', '2003-05-01 23:05:57'),
(47, 'Qui mollitia nesciunt dolores totam. Est beatae eaque necessitatibus inventore eos eius.', '113.163.202.23', 1, 19, 33, '1987-12-16 09:12:29', '1987-12-16 09:12:29'),
(48, 'Ut sit voluptatibus quia voluptatum iusto ea. Similique velit molestiae sit numquam et consequatur.', '128.25.143.175', 0, 4, 39, '1970-09-06 04:09:44', '1970-09-06 04:09:44'),
(49, 'Consectetur aut culpa nisi occaecati et dignissimos. Qui sed provident molestiae voluptas illo. Repellendus earum et non.', '139.74.85.86', 1, 11, 19, '1970-07-03 00:07:10', '1970-07-03 00:07:10'),
(50, 'Consequatur quos eos quibusdam eius id perferendis tempora. Consequatur eveniet natus id possimus ipsum rerum. Libero voluptatem nihil eius quos quis assumenda non.', '152.48.227.253', 1, 4, 48, '2006-05-09 22:05:32', '2006-05-09 22:05:32'),
(51, 'Nam quia non eos eius consequatur molestiae. Et quia aut maiores animi.', '31.233.233.84', 1, 12, 20, '2024-06-30 00:06:15', '2024-06-30 00:06:15'),
(52, 'Illo earum qui consequuntur aliquid sequi adipisci voluptatibus. Eos veritatis recusandae voluptatem accusantium ipsam. Soluta dolorem optio exercitationem temporibus suscipit et et.', '122.144.64.169', 1, 15, 36, '1975-05-24 07:05:10', '1975-05-24 07:05:10'),
(53, 'Optio et placeat voluptates voluptatem iste aperiam. Reprehenderit vel est eius debitis aliquid velit delectus.', '167.31.141.204', 1, 9, 16, '2008-02-08 09:02:52', '2008-02-08 09:02:52'),
(54, 'Incidunt dolorem quam repudiandae. Saepe dolores distinctio veritatis debitis et. Repellat et sint dolores temporibus tenetur nobis.', '125.64.3.191', 0, 6, 16, '2009-01-20 10:01:52', '2009-01-20 10:01:52'),
(55, 'Voluptas eos consequatur commodi optio harum rerum est sint. Magni distinctio quibusdam accusantium animi eveniet.', '45.85.204.175', 1, 8, 20, '2007-03-22 23:03:57', '2007-03-22 23:03:57'),
(56, 'Culpa eveniet ut exercitationem vero consequatur non corrupti. Debitis blanditiis ducimus ut fugiat repellat optio. Facere reprehenderit error odit molestiae est.', '148.115.169.49', 1, 16, 36, '2000-12-25 10:12:58', '2000-12-25 10:12:58'),
(57, 'Qui nihil corrupti doloremque rem ratione voluptas nihil. Omnis optio ipsum nisi nam voluptatem assumenda iusto. Dolorem sed repellendus cum hic autem.', '23.62.193.202', 1, 17, 46, '1994-05-04 02:05:18', '1994-05-04 02:05:18'),
(58, 'Consequatur rerum eius qui et. Repellat eveniet odio similique quaerat sequi ducimus.', '150.124.110.31', 0, 1, 13, '2024-08-07 22:08:14', '2024-08-07 22:08:14'),
(59, 'Quisquam quod delectus iste odit et repellat vitae. Ipsam est cupiditate non et placeat nobis.', '4.32.170.146', 0, 8, 49, '1998-02-15 08:02:00', '1998-02-15 08:02:00'),
(60, 'Facilis ratione adipisci dolorem veritatis. Sed eum est qui fugiat.', '240.123.176.154', 1, 18, 11, '2024-04-24 10:04:07', '2024-04-24 10:04:07'),
(61, 'Aperiam non repellat iure nihil culpa quis assumenda. Placeat quo nostrum repellat eos dolores consequatur et.', '168.125.246.216', 1, 16, 23, '2009-03-17 09:03:02', '2009-03-17 09:03:02'),
(62, 'Magnam voluptatem sed est est qui pariatur voluptate dolorem. Facilis adipisci recusandae sint molestias.', '138.138.206.41', 1, 9, 21, '1973-08-24 05:08:35', '1973-08-24 05:08:35'),
(63, 'Et consequatur recusandae qui est unde. Minima dolores velit tempora est voluptate ut.', '116.19.74.198', 0, 19, 35, '1976-12-07 01:12:11', '1976-12-07 01:12:11'),
(64, 'Cumque voluptatem praesentium eum nostrum dolorum temporibus. In quis magni libero ipsa. Dicta libero ipsa officia optio aut magni.', '137.90.4.168', 0, 14, 40, '1985-05-06 22:05:52', '1985-05-06 22:05:52'),
(65, 'Ad saepe ratione et velit praesentium sapiente laboriosam. Non similique qui veniam molestias.', '44.254.34.0', 1, 2, 5, '2000-12-24 00:12:52', '2000-12-24 00:12:52'),
(66, 'Quis blanditiis dolorem non sit voluptas labore et. Et dolores molestiae perferendis numquam fuga voluptas. Quibusdam id sed enim distinctio.', '223.230.16.237', 1, 19, 27, '2013-03-01 03:03:39', '2013-03-01 03:03:39'),
(67, 'Laborum ipsum esse earum doloribus in. Laboriosam eligendi aut optio ex voluptates aspernatur. Est velit ullam est nihil mollitia quidem.', '55.160.117.15', 1, 12, 22, '1991-02-12 08:02:23', '1991-02-12 08:02:23'),
(68, 'Qui laboriosam quas sunt excepturi sint libero. Ut molestiae est qui qui autem maxime. Officia assumenda explicabo modi et est unde est.', '99.19.106.120', 0, 13, 40, '2007-02-26 06:02:31', '2007-02-26 06:02:31'),
(69, 'Id ut ut consectetur omnis aut et. Voluptas iste quas ut voluptatem ut voluptas est.', '163.146.107.155', 1, 14, 11, '1985-12-02 02:12:10', '1985-12-02 02:12:10'),
(70, 'Quia dicta dignissimos impedit quibusdam veniam est nisi. Dolores illum animi et est. Sed qui nihil voluptatum qui ducimus.', '64.230.249.98', 1, 9, 11, '1995-04-11 10:04:25', '1995-04-11 10:04:25'),
(71, 'Harum ad a corrupti est. Ut sunt et nemo quibusdam. Atque provident consectetur fugit enim autem tenetur ut.', '233.233.31.204', 0, 7, 46, '2004-09-17 23:09:49', '2004-09-17 23:09:49'),
(72, 'Aut excepturi et animi repellendus. Iusto maxime non fugit. Adipisci qui molestias enim omnis dolores ipsam.', '138.141.197.232', 0, 19, 4, '2015-11-12 08:11:34', '2015-11-12 08:11:34'),
(73, 'Commodi natus ex quo molestiae facere dolorum numquam recusandae. Qui est suscipit nesciunt consequatur. Et dolor hic consequatur est harum harum.', '24.189.87.213', 1, 8, 1, '2009-04-09 02:04:36', '2009-04-09 02:04:36'),
(74, 'Exercitationem sint adipisci officiis quidem sunt dolores autem. Animi unde officia est rerum vel in vero. Quasi sint odit ipsa.', '198.0.62.231', 1, 9, 18, '1998-09-16 01:09:48', '1998-09-16 01:09:48'),
(75, 'Eum et quas atque vel sapiente. Nobis eum iusto qui dignissimos rerum.', '52.94.228.75', 1, 7, 39, '1986-07-10 05:07:50', '1986-07-10 05:07:50'),
(76, 'Mollitia nulla ut aliquid a non. Deserunt ut molestiae eum.', '175.33.115.251', 0, 3, 46, '2021-12-15 07:12:03', '2021-12-15 07:12:03'),
(77, 'Tenetur voluptatem et nihil consequatur blanditiis modi magnam. Dolorem alias et iure tempora delectus. Ipsa nihil repellendus consequuntur voluptatibus dolor soluta cum velit.', '21.1.178.135', 0, 8, 12, '1985-06-16 22:06:28', '1985-06-16 22:06:28'),
(78, 'Tempore accusantium fugit dicta id. Quod saepe voluptate ullam.', '41.91.192.76', 1, 1, 47, '1997-09-29 22:09:05', '1997-09-29 22:09:05'),
(79, 'Laudantium quia distinctio ut et quidem quibusdam nihil. Perspiciatis et cupiditate eos vel dolores.', '246.125.205.235', 1, 4, 8, '1999-02-28 06:02:29', '1999-02-28 06:02:29'),
(80, 'Earum ducimus ea autem cumque harum. Nobis a quasi eius eveniet sapiente.', '8.93.54.55', 0, 7, 3, '2005-12-15 06:12:52', '2005-12-15 06:12:52'),
(81, 'Eaque numquam enim labore velit dicta quibusdam harum. Et harum vitae officia earum. Quasi laboriosam dicta molestiae doloribus aut et.', '183.120.40.174', 1, 1, 40, '1991-01-31 10:01:29', '1991-01-31 10:01:29'),
(82, 'Est facere quia repudiandae doloribus. Optio qui reprehenderit minima sed. Est quia nam magnam alias sed ut.', '31.254.210.159', 1, 17, 43, '2007-02-28 09:02:38', '2007-02-28 09:02:38'),
(83, 'Deserunt fugit aut sed qui in ratione quaerat facere. Fugiat nulla velit aut non. Perspiciatis quidem quis quis soluta deserunt.', '148.14.66.212', 0, 9, 38, '1990-01-08 08:01:44', '1990-01-08 08:01:44'),
(84, 'Blanditiis doloremque et itaque placeat laborum repudiandae. Exercitationem sit beatae et sunt aut illo ut. Corporis quasi reprehenderit voluptas similique.', '147.128.235.41', 1, 11, 18, '1996-05-17 22:05:40', '1996-05-17 22:05:40'),
(85, 'Ut repellat expedita qui laudantium in ut. Numquam hic consequuntur beatae maxime ad. Enim dolor asperiores maiores culpa.', '48.70.216.173', 1, 4, 22, '1999-04-15 03:04:02', '1999-04-15 03:04:02'),
(86, 'Voluptates culpa quasi enim hic. Provident non ex facilis eaque.', '242.126.250.8', 0, 5, 6, '1993-10-01 08:10:44', '1993-10-01 08:10:44'),
(87, 'Vel fugit nemo eaque voluptas voluptatibus magnam ea. Nulla est quidem nam omnis. Velit laudantium odio voluptatem.', '215.138.64.197', 1, 8, 11, '2009-09-07 23:09:00', '2009-09-07 23:09:00'),
(88, 'Sunt sit illo quis inventore facilis. Beatae corporis totam ipsam necessitatibus blanditiis asperiores. Adipisci commodi autem quam nesciunt.', '153.190.186.68', 0, 1, 26, '1990-03-27 10:03:08', '1990-03-27 10:03:08'),
(89, 'Ex est omnis architecto error rerum. Illum labore non est ab aut libero. Dolorem quisquam et praesentium qui consectetur voluptate.', '21.93.236.149', 1, 13, 43, '1985-08-14 09:08:17', '1985-08-14 09:08:17'),
(90, 'Quasi esse perspiciatis distinctio nobis eaque in et. Animi in voluptatem in ut vitae sed aut.', '239.168.245.72', 0, 18, 7, '2007-08-16 22:08:24', '2007-08-16 22:08:24'),
(91, 'Debitis repellendus aut minus sequi. Atque ad hic sapiente blanditiis consectetur ratione.', '229.18.246.14', 0, 6, 2, '2022-03-05 23:03:38', '2022-03-05 23:03:38'),
(92, 'Ratione fuga accusamus tempora. Numquam esse ut quibusdam natus nobis iste voluptatibus.', '89.155.166.34', 1, 19, 15, '1971-05-09 05:05:53', '1971-05-09 05:05:53'),
(93, 'Eum totam id eum tempora earum pariatur voluptatem. Voluptatibus sit in est cum. Sit nihil non porro ut consequatur molestias et.', '120.139.0.200', 1, 10, 10, '2017-03-04 04:03:14', '2017-03-04 04:03:14'),
(94, 'Velit tempore eos quia labore dolor. In autem est id illum. Mollitia minima consectetur non eius optio minus.', '254.145.171.190', 0, 11, 40, '2008-03-07 05:03:10', '2008-03-07 05:03:10'),
(95, 'Non repellendus dolorum officiis id consequatur. Quia doloribus nemo repudiandae deleniti et et. Saepe itaque quaerat sit eum qui et nobis aut.', '68.80.237.76', 0, 8, 15, '2016-01-20 00:01:41', '2016-01-20 00:01:41'),
(96, 'Dolores facere voluptatibus neque libero ab. Adipisci nisi et autem repudiandae qui enim.', '240.59.163.154', 0, 14, 31, '2013-11-15 08:11:53', '2013-11-15 08:11:53'),
(97, 'Est sint veritatis repellendus ad ut. Voluptatem doloribus et velit error nisi sunt et.', '137.244.146.86', 0, 11, 46, '1983-09-09 06:09:58', '1983-09-09 06:09:58'),
(98, 'Aliquid sunt quia incidunt ut. Sit sunt architecto odit molestiae non. Voluptas est aperiam labore eos.', '77.239.203.55', 1, 12, 27, '2003-04-02 02:04:57', '2003-04-02 02:04:57'),
(99, 'Dicta itaque quos et iure sapiente qui quam. Quia illum numquam expedita enim. Rerum rerum aut maiores earum quae aut nisi.', '14.67.208.30', 0, 12, 1, '1973-07-08 05:07:24', '1973-07-08 05:07:24'),
(100, 'Et rem aliquid facere ea aut. Exercitationem maiores cumque aut non pariatur laborum est.', '253.197.244.49', 0, 2, 6, '1999-09-27 22:09:05', '1999-09-27 22:09:05'),
(101, 'Impedit explicabo officiis et a aliquid ullam saepe. Numquam odit consequatur sed alias qui enim minus numquam. Nam perferendis sed delectus reiciendis autem.', '221.173.139.121', 1, 13, 12, '2009-01-24 23:01:16', '2009-01-24 23:01:16'),
(102, 'Odio delectus eos recusandae illum. Omnis dolores sed eos ut aliquam corporis.', '237.137.41.240', 0, 10, 30, '1980-06-24 00:06:35', '1980-06-24 00:06:35'),
(103, 'Eum et quas autem minus maiores est. Consequatur sequi quas optio eaque officiis magni et. Placeat id sapiente quo esse.', '20.45.213.14', 1, 9, 29, '2010-09-07 06:09:02', '2010-09-07 06:09:02'),
(104, 'Rerum aut est laboriosam necessitatibus expedita. Deleniti non repellat facilis aliquid eveniet. Dolore ab numquam consequuntur illum voluptatem quia.', '30.153.192.228', 0, 9, 38, '2003-09-08 05:09:58', '2003-09-08 05:09:58'),
(105, 'Quo dicta quidem quia officiis dolor. Neque repellat id commodi porro suscipit sunt voluptatibus.', '8.220.137.99', 0, 4, 33, '1993-06-12 05:06:13', '1993-06-12 05:06:13'),
(106, 'Illum magni ipsam et debitis. Nobis hic quaerat optio rerum.', '73.194.156.53', 0, 4, 44, '1986-06-16 09:06:18', '1986-06-16 09:06:18'),
(107, 'Numquam ad occaecati cumque necessitatibus sed aperiam. Quaerat quidem ut doloribus vel expedita sint omnis.', '58.137.252.198', 1, 16, 33, '1982-11-03 01:11:43', '1982-11-03 01:11:43'),
(108, 'Accusantium enim asperiores voluptas iure eaque facilis ut. Voluptatem voluptatem vel placeat doloremque reiciendis veritatis. Vitae consequuntur quia magni libero soluta.', '134.46.53.8', 0, 20, 32, '1987-07-16 09:07:19', '1987-07-16 09:07:19'),
(109, 'Sit qui vel in suscipit enim incidunt. Dolores incidunt ratione quas culpa ut reiciendis est omnis. Reprehenderit dolorem commodi facilis sint nostrum.', '171.92.206.73', 0, 17, 37, '2005-04-30 23:05:27', '2005-04-30 23:05:27'),
(110, 'Rerum aut sed sint eius neque eaque laboriosam ut. Autem quos omnis est aut quisquam blanditiis perspiciatis voluptatum. Eligendi porro perspiciatis beatae tempore nihil officiis quo blanditiis.', '246.159.139.128', 1, 17, 11, '1970-01-31 05:01:41', '1970-01-31 05:01:41'),
(111, 'Ea et exercitationem qui id est. Quis ipsum praesentium maxime.', '75.83.189.247', 0, 2, 11, '1991-04-06 08:04:33', '1991-04-06 08:04:33'),
(112, 'Fugiat sed corporis voluptate autem adipisci. Sint mollitia quo eligendi debitis voluptas tenetur sunt.', '50.133.229.56', 1, 19, 11, '2000-07-10 00:07:22', '2000-07-10 00:07:22'),
(113, 'Reprehenderit ipsam quos repellendus repellendus. Aspernatur illo esse nesciunt.', '54.187.8.6', 0, 5, 41, '1983-06-24 09:06:13', '1983-06-24 09:06:13'),
(114, 'Aut nihil fuga sit debitis qui. Sed placeat doloremque consectetur.', '8.159.214.198', 0, 15, 32, '1989-10-19 02:10:21', '1989-10-19 02:10:21'),
(115, 'Soluta quo sed rerum atque non natus molestiae tempora. Omnis quasi quod sint quam. Sit itaque cupiditate ut delectus molestias quia.', '186.169.191.221', 1, 2, 41, '1974-11-17 01:11:09', '1974-11-17 01:11:09'),
(116, 'Eius nesciunt recusandae voluptatem aut voluptatibus id. Minus optio molestiae numquam incidunt hic dolor.', '155.250.87.90', 1, 10, 16, '1974-09-23 00:09:36', '1974-09-23 00:09:36'),
(117, 'Nulla totam nemo fuga dolorem minus. Labore soluta et qui quis.', '174.154.32.218', 1, 9, 33, '1978-12-28 10:12:28', '1978-12-28 10:12:28'),
(118, 'Voluptas quo enim et quaerat. Alias provident nihil aut ex. Suscipit doloribus qui consequatur qui explicabo unde.', '56.10.131.183', 0, 12, 45, '1990-11-15 03:11:21', '1990-11-15 03:11:21'),
(119, 'Veritatis tempora blanditiis unde expedita velit dolore veniam sed. Sint quia minus non repudiandae placeat est.', '83.201.47.32', 1, 11, 18, '1997-04-15 01:04:36', '1997-04-15 01:04:36'),
(120, 'Beatae ipsa iure numquam autem animi unde. Maiores deleniti facilis tenetur. Minus harum exercitationem autem dolor exercitationem.', '105.55.120.180', 1, 7, 46, '2014-11-23 10:11:40', '2014-11-23 10:11:40'),
(121, 'Molestiae odit dolore tempore cumque earum aperiam. Optio cum molestias voluptatem cum praesentium quibusdam vel voluptatum. Ex maiores laborum soluta exercitationem.', '210.118.122.42', 1, 2, 47, '1996-08-17 05:08:26', '1996-08-17 05:08:26'),
(122, 'Odio aut iusto perferendis earum voluptatem exercitationem. Autem enim ut et voluptate.', '116.227.111.243', 1, 18, 47, '2013-08-23 22:08:08', '2013-08-23 22:08:08'),
(123, 'Temporibus beatae amet at repellat optio. Quae aut accusantium mollitia quia voluptatem sed.', '2.218.113.97', 1, 11, 31, '2016-05-12 08:05:04', '2016-05-12 08:05:04'),
(124, 'Quis eos dolorem sunt quo pariatur pariatur dicta. Maiores accusantium nihil quod id non. Quia mollitia ducimus nihil dolores mollitia aut qui.', '15.140.192.92', 1, 13, 20, '1990-12-08 05:12:04', '1990-12-08 05:12:04'),
(125, 'Maxime totam fugit aliquid laboriosam. Hic sint est qui. At voluptatibus quia natus nostrum molestiae.', '236.31.255.239', 0, 3, 14, '1995-02-18 07:02:53', '1995-02-18 07:02:53'),
(126, 'Minima quasi nam exercitationem nemo. Maxime quae placeat porro eum.', '208.90.254.94', 1, 8, 24, '2022-02-04 02:02:46', '2022-02-04 02:02:46'),
(127, 'Libero repellendus consectetur assumenda quia rem ipsum quis. Repudiandae sed consectetur quod et quis.', '159.151.81.37', 1, 3, 2, '1987-11-09 02:11:24', '1987-11-09 02:11:24'),
(128, 'Fugit asperiores mollitia ut non. Numquam et optio deleniti voluptatem beatae.', '189.67.64.195', 0, 20, 21, '2022-12-14 08:12:44', '2022-12-14 08:12:44'),
(129, 'Quas voluptates sit incidunt reiciendis facilis et vitae. Qui recusandae dolor eligendi perspiciatis. Aut consequatur numquam et et quis.', '115.226.133.75', 0, 11, 18, '2014-10-22 08:10:49', '2014-10-22 08:10:49'),
(130, 'Beatae ea sed ipsam. Inventore omnis rem quis nihil.', '250.81.31.126', 0, 17, 30, '2018-07-14 04:07:48', '2018-07-14 04:07:48'),
(131, 'Nulla rem sit commodi animi sunt saepe veniam. Et quod autem ut nostrum.', '194.125.206.209', 1, 19, 10, '2016-05-10 04:05:24', '2016-05-10 04:05:24'),
(132, 'Repudiandae rerum ut saepe labore vel est repudiandae. Nam ut commodi et assumenda soluta vel.', '19.153.32.170', 0, 14, 46, '2013-07-18 09:07:24', '2013-07-18 09:07:24'),
(133, 'Sequi incidunt repellat iure natus. Et aliquid dolorem velit ut voluptatum animi.', '240.199.151.94', 0, 19, 42, '2009-11-29 00:11:29', '2009-11-29 00:11:29'),
(134, 'Sunt voluptatem libero nemo voluptatum nam. Amet quod quos at praesentium voluptatem facilis ut.', '228.109.239.23', 1, 14, 7, '1993-02-22 03:02:15', '1993-02-22 03:02:15'),
(135, 'Nam accusamus quo aut quo maxime laborum et. Cumque in sit illum sint reprehenderit magnam libero.', '223.223.148.122', 0, 20, 40, '2007-04-25 05:04:23', '2007-04-25 05:04:23'),
(136, 'Tempora dolore ut ut distinctio ipsam ipsa. Minus architecto autem sit est rerum sint nihil.', '160.36.118.50', 1, 6, 12, '2022-10-03 23:10:02', '2022-10-03 23:10:02'),
(137, 'Recusandae velit laudantium ea dolore omnis adipisci molestiae illo. Quis pariatur qui similique hic. Assumenda et molestiae hic.', '121.139.62.20', 0, 6, 32, '2019-03-14 08:03:52', '2019-03-14 08:03:52'),
(138, 'Corrupti totam quia quaerat fuga soluta cum. Quia et ut et. Quia et dolor nam qui voluptatum reprehenderit dolorem.', '11.222.15.169', 0, 14, 6, '1994-02-19 08:02:03', '1994-02-19 08:02:03'),
(139, 'Aliquid architecto debitis explicabo consequuntur voluptas. Dolor sunt iure harum corrupti veritatis consequatur. Rerum odit quis eos nihil.', '14.220.241.14', 1, 19, 13, '1980-10-15 07:10:20', '1980-10-15 07:10:20'),
(140, 'Dolorem impedit quae saepe doloribus. Voluptatem voluptatem fugiat magni omnis sit.', '150.185.141.57', 1, 20, 26, '2019-07-15 03:07:15', '2019-07-15 03:07:15'),
(141, 'Eligendi repudiandae nostrum facilis dolores tempora est voluptas. Cupiditate ut qui debitis natus iste. Rem nesciunt est pariatur.', '95.41.188.114', 1, 9, 36, '2013-07-10 06:07:25', '2013-07-10 06:07:25'),
(142, 'Ut possimus laborum dolorem occaecati quis fugit autem. Ea magnam dolore est.', '158.10.8.50', 0, 1, 26, '1972-10-16 22:10:01', '1972-10-16 22:10:01'),
(143, 'Optio incidunt nihil optio neque minus adipisci quae. Voluptas laboriosam et ea vero quas perspiciatis porro aut.', '242.95.244.229', 1, 4, 25, '2013-03-17 02:03:53', '2013-03-17 02:03:53'),
(144, 'Sapiente maxime aliquid alias deleniti voluptas voluptatem. Asperiores eum voluptatem cum dolorum culpa.', '2.136.218.142', 1, 19, 48, '1996-10-14 22:10:23', '1996-10-14 22:10:23'),
(145, 'Quis in odio omnis cum error asperiores quibusdam. Necessitatibus repellat repellat quis blanditiis ea. Beatae illum itaque quia.', '147.174.109.26', 1, 13, 38, '2001-08-13 05:08:01', '2001-08-13 05:08:01'),
(146, 'Id inventore ducimus in dignissimos exercitationem maiores autem. Sit voluptatem consequatur deleniti sit quas.', '75.63.92.131', 1, 4, 27, '1984-11-05 00:11:01', '1984-11-05 00:11:01'),
(147, 'Possimus adipisci est ad dolorem nesciunt. Ea nisi dolorem dolor quis.', '245.100.150.92', 1, 3, 9, '1987-02-05 07:02:14', '1987-02-05 07:02:14'),
(148, 'Et ut sunt eos magnam. Ut et incidunt quisquam ut sunt laborum molestiae. Ipsa nobis et eligendi officia.', '239.168.120.146', 0, 10, 12, '2022-05-30 23:05:23', '2022-05-30 23:05:23'),
(149, 'Numquam deserunt et dolores dolor. Aperiam qui voluptas eius in.', '217.0.52.38', 0, 7, 16, '2020-05-23 06:05:01', '2020-05-23 06:05:01'),
(150, 'Repellendus nam quas aut dolor ut. Distinctio sed vitae aut fuga non ea. Perspiciatis id deserunt laborum aperiam nulla repellat est.', '107.27.159.48', 1, 11, 34, '1993-06-23 06:06:48', '1993-06-23 06:06:48'),
(151, 'Saepe fugiat commodi itaque nostrum. Optio debitis non corporis est non ut alias et. Eaque tenetur praesentium fuga vero ut ut.', '70.51.147.93', 1, 18, 4, '2008-04-30 04:04:25', '2008-04-30 04:04:25'),
(152, 'Eaque eos dolore sequi voluptatem sequi ab ipsam. Porro odit in expedita cumque sunt recusandae non. Porro perspiciatis esse deleniti consequuntur suscipit.', '157.19.197.167', 1, 10, 4, '2019-12-17 03:12:45', '2019-12-17 03:12:45'),
(153, 'Eius deleniti aliquam aliquid id veritatis. Labore et alias aut rerum.', '120.31.213.128', 1, 20, 36, '1994-05-07 23:05:58', '1994-05-07 23:05:58'),
(154, 'Sit quas rem qui magni eum ipsam. Et qui molestias corporis facere sit adipisci.', '78.254.193.17', 1, 9, 40, '1990-06-07 07:06:23', '1990-06-07 07:06:23'),
(155, 'Praesentium culpa sint dolore rerum. Distinctio rem voluptas illo fugit tempore. Et ab eos magnam corporis sed.', '231.121.31.88', 0, 13, 35, '1991-05-24 01:05:28', '1991-05-24 01:05:28'),
(156, 'Ipsa veniam possimus et et dolorem cumque neque. Omnis optio ipsam voluptate id ut.', '57.193.40.48', 1, 10, 5, '2020-08-09 22:08:42', '2020-08-09 22:08:42'),
(157, 'Ab non explicabo facere dignissimos. Corporis id pariatur sed ut aliquam sit. Est necessitatibus nam officia eveniet nemo cupiditate.', '191.7.191.211', 1, 10, 18, '1992-03-23 01:03:07', '1992-03-23 01:03:07'),
(158, 'Deleniti ratione ut eligendi consequatur porro. Exercitationem quis in nostrum officia eius deleniti. Aliquam molestiae distinctio ea explicabo cum aliquam.', '78.50.117.67', 1, 9, 44, '2007-02-28 09:02:57', '2007-02-28 09:02:57'),
(159, 'Soluta sunt nam perspiciatis architecto dolor est. In nam quidem animi nisi.', '180.64.109.11', 0, 20, 31, '1972-02-20 07:02:13', '1972-02-20 07:02:13'),
(160, 'Magni ut quae commodi doloremque. Et laborum doloremque dolore est et debitis. Eum non assumenda provident.', '221.109.72.140', 1, 17, 31, '2017-10-16 01:10:17', '2017-10-16 01:10:17'),
(161, 'Qui corporis aut unde nesciunt porro. Rerum soluta aliquam cum iure.', '208.49.195.2', 1, 9, 14, '1997-02-12 01:02:17', '1997-02-12 01:02:17'),
(162, 'Quaerat id sunt laudantium dolores et reiciendis cupiditate est. Eos omnis at accusamus tenetur.', '238.47.109.20', 1, 19, 21, '1975-05-08 07:05:10', '1975-05-08 07:05:10'),
(163, 'Repudiandae aspernatur sequi quaerat commodi in. In doloremque neque minima quia suscipit assumenda et. Enim sit minus alias officiis quis.', '73.137.215.111', 0, 16, 46, '2019-07-19 08:07:36', '2019-07-19 08:07:36'),
(164, 'Eos distinctio consequatur earum ea ipsa incidunt. Vitae assumenda qui deserunt est. Eveniet qui sit ipsum pariatur aut qui id.', '59.239.28.38', 1, 14, 10, '2015-04-04 06:04:30', '2015-04-04 06:04:30'),
(165, 'Earum totam qui voluptatem aut repellendus error. Vero sequi corporis quaerat dolorem. Ut aut distinctio animi mollitia saepe recusandae.', '52.213.141.111', 1, 4, 19, '2013-08-03 22:08:54', '2013-08-03 22:08:54'),
(166, 'Dignissimos ut ea hic. Vitae non nam facere saepe atque autem adipisci.', '154.151.53.54', 1, 8, 27, '1970-05-01 01:05:40', '1970-05-01 01:05:40'),
(167, 'Ullam officiis quas repellat facere vel inventore eos est. Aut ipsum aliquid in voluptate rem. Molestiae quaerat voluptas consectetur.', '218.96.52.76', 1, 16, 33, '1991-06-17 07:06:10', '1991-06-17 07:06:10'),
(168, 'Doloremque sed a modi consectetur maxime. Adipisci nostrum voluptas quae.', '34.227.234.233', 0, 8, 20, '1992-08-28 08:08:19', '1992-08-28 08:08:19'),
(169, 'Sed accusantium animi nemo ad aut. Dolores excepturi nobis quaerat ducimus aut deserunt. Ut deleniti possimus eum quidem voluptas nam.', '6.216.30.246', 0, 12, 7, '1994-04-04 23:04:07', '1994-04-04 23:04:07'),
(170, 'Aliquid debitis itaque quis non. Tenetur illum aut aut qui accusamus aut ea.', '61.242.230.47', 1, 13, 27, '1988-10-30 04:10:57', '1988-10-30 04:10:57'),
(171, 'Voluptatem sint amet recusandae enim. Quos nostrum placeat incidunt optio dolores distinctio aut.', '118.165.111.130', 1, 6, 15, '1975-01-30 23:01:33', '1975-01-30 23:01:33'),
(172, 'Numquam neque nemo officia sed ipsam pariatur et. Occaecati sed error molestias quia maxime quia laborum. Facere ex alias voluptas aut.', '238.158.7.170', 1, 4, 25, '2021-01-30 00:01:58', '2021-01-30 00:01:58'),
(173, 'Amet perspiciatis expedita accusamus consequatur corporis repellat. Et voluptate repellat ullam natus. Iste ut nihil commodi dolor beatae dicta.', '253.191.71.12', 1, 13, 37, '2008-08-15 09:08:53', '2008-08-15 09:08:53'),
(174, 'Praesentium dolorem dolore ex laboriosam. Reprehenderit nihil rerum perferendis sed sed ut et. Impedit necessitatibus et iure rem tenetur.', '67.94.84.212', 0, 7, 2, '1970-05-06 06:05:57', '1970-05-06 06:05:57'),
(175, 'Quia accusamus minus ad minima quis quidem. Eos explicabo nostrum molestiae labore dolores voluptates.', '115.99.173.169', 1, 18, 25, '2008-11-26 09:11:22', '2008-11-26 09:11:22'),
(176, 'Mollitia non quos at voluptate atque. Ipsa nobis rerum molestiae aut aspernatur nihil. Aliquam voluptatem asperiores voluptatem culpa quia sapiente.', '118.251.35.186', 1, 14, 44, '2017-08-29 04:08:12', '2017-08-29 04:08:12'),
(177, 'Qui accusantium facilis recusandae velit magnam. Quis sit id voluptate voluptate odit minima eaque perferendis.', '29.101.129.62', 0, 17, 11, '1976-08-23 03:08:50', '1976-08-23 03:08:50'),
(178, 'Quos cum natus voluptatum deserunt. Nobis est dolor repellat accusantium dolores quas delectus voluptas. Voluptas pariatur voluptatem et esse maxime odio voluptatibus.', '196.224.132.9', 0, 19, 9, '2011-09-18 04:09:55', '2011-09-18 04:09:55'),
(179, 'Tempore id magni cum sed optio dolor et. Quaerat nihil nam sed minima velit ipsum quis.', '111.61.2.125', 0, 4, 44, '1972-02-25 04:02:44', '1972-02-25 04:02:44'),
(180, 'Voluptas laudantium numquam perferendis qui quos. Et veniam eius repellat cum quia tenetur vel.', '154.127.163.95', 1, 5, 47, '1996-05-09 04:05:08', '1996-05-09 04:05:08'),
(181, 'Impedit expedita sunt nesciunt accusantium velit. Ut et qui nihil eum mollitia. Soluta consectetur voluptatibus quia minus vel.', '76.151.98.52', 1, 7, 27, '2004-02-17 00:02:16', '2004-02-17 00:02:16'),
(182, 'Esse impedit velit aut nobis optio perspiciatis non. Reiciendis sed vel quibusdam aperiam quia qui corporis.', '154.50.38.246', 0, 3, 2, '1972-06-09 22:06:27', '1972-06-09 22:06:27'),
(183, 'Aut ut occaecati suscipit. Qui eos esse nam fugiat unde eos nisi. Asperiores aut voluptas vero molestias.', '179.4.189.181', 1, 11, 50, '2008-03-27 08:03:47', '2008-03-27 08:03:47'),
(184, 'Est veniam nulla laborum. Pariatur cumque ratione ea architecto.', '221.26.82.205', 1, 3, 16, '1991-11-11 01:11:33', '1991-11-11 01:11:33'),
(185, 'Ratione neque vitae et neque omnis officiis. Id excepturi aliquam sed.', '200.159.221.93', 1, 6, 44, '2023-01-04 10:01:45', '2023-01-04 10:01:45'),
(186, 'Et explicabo voluptas aut qui fugit mollitia. Fuga quis velit quo rerum modi a perferendis. Quas placeat error omnis deleniti officia minima et.', '44.103.67.148', 0, 20, 33, '1977-07-07 05:07:35', '1977-07-07 05:07:35'),
(187, 'Impedit provident aut in ut dolor unde voluptas. Sit dolores rem sed sunt aut. Porro quas quia explicabo reiciendis beatae suscipit aut.', '174.100.230.62', 1, 7, 44, '2022-10-02 01:10:11', '2022-10-02 01:10:11'),
(188, 'Laudantium labore et amet non atque molestiae sed. Minima recusandae eos autem nihil id.', '22.237.131.221', 1, 13, 24, '1990-11-13 03:11:34', '1990-11-13 03:11:34'),
(189, 'Modi et voluptate ullam. Qui eos nobis velit nesciunt maxime. Aut dolor totam consequatur et aperiam sit.', '75.147.60.29', 1, 17, 35, '1991-03-20 04:03:43', '1991-03-20 04:03:43'),
(190, 'Dolore reiciendis eum aut animi accusantium sunt deserunt. Explicabo eos cumque ipsam vel. Reprehenderit aliquam impedit rerum nisi qui natus.', '104.242.102.202', 1, 9, 23, '1991-01-03 03:01:46', '1991-01-03 03:01:46'),
(191, 'Temporibus omnis repellat perferendis unde. In labore dolorem voluptas. Ut voluptatibus soluta necessitatibus corrupti officiis odit.', '222.107.248.174', 1, 19, 23, '2021-02-20 10:02:17', '2021-02-20 10:02:17'),
(192, 'Iusto minus et cupiditate ut impedit distinctio aut. Animi numquam dolor voluptate quia est in. Enim voluptas deleniti laborum nisi.', '16.180.71.129', 1, 3, 40, '2019-02-22 01:02:06', '2019-02-22 01:02:06'),
(193, 'Sequi est deserunt esse minus consectetur adipisci. Perspiciatis quo aspernatur officia vitae quod eaque qui atque. Quasi praesentium adipisci dolor eveniet qui.', '130.3.7.48', 0, 11, 21, '2016-07-11 00:07:39', '2016-07-11 00:07:39'),
(194, 'Molestiae quis laboriosam aut doloribus. Rerum maiores exercitationem commodi voluptatem magnam fuga rerum. Eum provident consequatur beatae repellendus maxime enim vel error.', '15.181.195.19', 0, 11, 30, '2010-04-26 04:04:24', '2010-04-26 04:04:24'),
(195, 'Rem assumenda modi saepe similique omnis quia laboriosam. Deserunt explicabo nihil neque. Quo id minima doloribus quisquam.', '67.88.213.183', 0, 10, 25, '2014-05-31 09:05:59', '2014-05-31 09:05:59'),
(196, 'Explicabo et consequatur aut fugit eligendi laudantium mollitia expedita. Maiores totam error ut quia quo.', '207.31.145.148', 1, 3, 14, '2022-05-09 06:05:27', '2022-05-09 06:05:27'),
(197, 'Est est ut odit soluta ea. Tempora nobis dolorem non aut voluptatem velit cum.', '221.55.216.204', 1, 12, 1, '1976-12-09 02:12:46', '1976-12-09 02:12:46'),
(198, 'Vel beatae enim corporis et fugiat consequatur magnam. Perferendis voluptates et temporibus voluptatum eos aperiam numquam. Voluptatibus ea dolorem qui eligendi.', '92.187.197.146', 1, 7, 20, '2008-07-23 07:07:00', '2008-07-23 07:07:00'),
(199, 'Magni consequatur aut sunt quidem. Consectetur rerum ea id alias quia pariatur. Ea sit quas a quo.', '136.27.28.12', 1, 7, 39, '1989-06-04 01:06:46', '1989-06-04 01:06:46'),
(200, 'Laboriosam provident quibusdam autem repellat non eligendi. Quo delectus quam voluptatibus.', '36.255.86.132', 0, 14, 50, '2007-10-20 04:10:05', '2007-10-20 04:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `ip_address` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `title`, `body`, `status`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 'Izaiah Morissette', 'okey02@hotmail.com', '725-444-0626', 'Dr.', 'Sed occaecati et facilis asperiores nemo voluptates. Non ratione tenetur ipsa placeat dolore. Molestias non vel nemo odit est ad consequatur qui. Tempore enim est expedita quos vero autem sed.', 0, '56.18.58.44', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(2, 'Prof. Kurt Welch', 'crunolfsson@hotmail.com', '(573) 574-0941', 'Mrs.', 'Reiciendis nam repudiandae aut molestiae recusandae. Nihil ut iste odio nesciunt reiciendis explicabo. Placeat id nam similique ut aliquid ipsum repellendus.', 0, '37.13.31.147', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(3, 'Mrs. Sydni Nolan', 'yhermiston@hotmail.com', '+1.458.281.9055', 'Prof.', 'Qui deleniti quia sequi debitis quae voluptates earum unde. Dolorem nulla itaque autem eius. Cumque laboriosam molestiae labore repudiandae laboriosam. Recusandae facere id ea nostrum distinctio et alias.', 0, '1.211.53.30', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(4, 'Miss Anita Kassulke I', 'williamson.earnest@boehm.com', '+1-864-637-0355', 'Prof.', 'Aliquid velit cum nemo animi illum vel voluptatem qui. Mollitia impedit fuga placeat est magni ipsam enim. Molestiae adipisci qui sequi illum tempora dolor nobis. Neque ut eius cumque asperiores.', 0, '111.189.191.196', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(5, 'Una Stehr', 'block.katharina@koelpin.info', '424-538-1010', 'Prof.', 'Quae iure architecto voluptatibus unde distinctio aut. Nostrum quisquam molestias id consequatur totam. Eum praesentium harum eos cumque dolores voluptatibus illo. Consequatur cumque deleniti enim nulla voluptates rerum.', 0, '54.2.51.222', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(6, 'Itzel Hyatt', 'abagail21@yahoo.com', '726.293.2024', 'Prof.', 'Impedit qui voluptas consequatur non. Minima illo atque sit nihil aut eligendi ipsam. Sit repellendus vel laudantium deleniti blanditiis et. Illo voluptas repellat eligendi ut labore blanditiis commodi.', 0, '120.71.161.65', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(7, 'Stanton Marquardt', 'considine.chase@yahoo.com', '681.855.1128', 'Mr.', 'Non sint odit aut vel. Adipisci quo eum ut ad neque. Atque qui perspiciatis tempore blanditiis. Odit ut enim doloribus.', 0, '109.5.60.251', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(8, 'Valerie Howell DVM', 'bhand@hotmail.com', '+1-762-763-6824', 'Prof.', 'Eius omnis voluptatem non esse debitis in omnis. Eum ex dolor ut perferendis aut. Temporibus quasi occaecati similique laborum sed optio ut sit.', 0, '70.123.7.22', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(9, 'Zachariah Jones', 'stevie.gutkowski@price.com', '+12406101845', 'Mr.', 'Rerum sit impedit aliquid corporis qui. Totam ratione eum hic exercitationem illo rerum cumque. Dignissimos et debitis quia ad molestiae enim. Sint expedita inventore illum aut et quod.', 0, '34.95.109.176', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(10, 'Dr. Chase Smith Jr.', 'eldred48@cartwright.info', '828-602-1089', 'Miss', 'Odio rerum id qui doloremque itaque labore. Unde ut veniam aliquid blanditiis ratione dolores enim. Dignissimos similique ea quis ipsa numquam.', 0, '34.130.37.178', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(11, 'Winifred Braun', 'corwin.dax@donnelly.com', '+1.870.868.4825', 'Dr.', 'Animi odio ut id. Asperiores temporibus est est modi. Aut laboriosam nemo quod unde porro quia tempore suscipit.', 0, '21.31.158.83', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(12, 'Wiley Schoen III', 'jovanny93@gmail.com', '+1 (959) 510-1523', 'Dr.', 'Aut est sunt maxime non voluptatibus possimus sint. Nihil sint inventore consequatur maiores ut. Omnis non eveniet qui sunt repudiandae voluptate ratione.', 0, '149.250.195.196', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(13, 'Nestor Lynch', 'kulas.peyton@reynolds.com', '(754) 415-0906', 'Dr.', 'Earum laboriosam pariatur voluptate totam cupiditate dolorum. Quaerat assumenda et minus fuga vitae blanditiis facilis. Reprehenderit ut officia ea est quod occaecati dolorem laborum.', 0, '196.191.103.35', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(14, 'Bridgette Jones', 'mturner@gmail.com', '(980) 947-8399', 'Prof.', 'Distinctio quis tempore ut nihil fuga. Eos perferendis rerum voluptas. Aut laboriosam animi dolor asperiores voluptas maxime.', 0, '141.113.100.37', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(15, 'Prof. Alysa Parker', 'efren65@gmail.com', '1-838-971-8315', 'Dr.', 'Quo quo dolorum in commodi vel provident saepe. At alias nulla similique ratione quis et sint. Ab accusantium doloribus beatae atque asperiores.', 0, '150.58.175.246', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(16, 'Dawson Windler', 'sauer.rosalia@yahoo.com', '(567) 476-3778', 'Miss', 'Reiciendis magni et sit perspiciatis ad sint. Ut ullam vel voluptatum et laborum autem. Sint commodi at consequuntur labore corrupti. Porro molestiae dicta incidunt.', 0, '153.133.82.255', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(17, 'Una Gislason', 'xdickens@medhurst.com', '+1-623-364-1423', 'Mr.', 'Nemo quasi fugit et quod. Beatae eos ab neque dignissimos. Repudiandae tenetur non sit dolorem nisi. Cupiditate et ullam ut sit. Totam qui consequuntur placeat in officiis.', 0, '149.126.221.58', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(18, 'Kayden Mayer', 'ken85@gmail.com', '337-884-6635', 'Miss', 'Corporis iste rerum aperiam assumenda id est. Esse molestias sed ut voluptate aliquam mollitia. Ut quia nihil quisquam nemo corrupti. Libero voluptatem fugiat cupiditate eos.', 0, '67.199.32.189', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(19, 'Eloy Cummings', 'adan55@marquardt.net', '+1-262-531-6692', 'Mr.', 'Eveniet rerum aut minima ab rerum adipisci aliquid labore. Et distinctio est eos eligendi voluptas. Impedit natus aut rerum et qui. Sint doloribus commodi veniam consequatur recusandae repellendus.', 0, '196.40.103.188', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(20, 'Mrs. Ava Casper', 'omccullough@yahoo.com', '1-629-317-3082', 'Dr.', 'Est provident sit sapiente voluptas. Officia natus molestiae tempora quas hic qui nisi. Voluptates nisi nihil dolor laboriosam a odio.', 0, '141.114.52.91', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(21, 'Mr. Wilfrid Heathcote I', 'schimmel.kyleigh@yahoo.com', '458-502-2200', 'Prof.', 'Vel eveniet accusantium ullam corporis. Dicta aperiam commodi dicta et. Perspiciatis maxime animi rerum a tempore laboriosam.', 0, '143.150.94.94', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(22, 'Mason Prohaska II', 'nlebsack@jacobson.biz', '(781) 227-6720', 'Prof.', 'Et tenetur molestias recusandae quis exercitationem quis asperiores. Voluptates libero quia quas tenetur praesentium. Illo mollitia molestiae eligendi mollitia et quisquam.', 0, '129.230.60.224', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(23, 'Trisha Batz DDS', 'romaguera.dagmar@gmail.com', '412-295-3402', 'Dr.', 'Eum sint deserunt rem minus earum consequatur non. Adipisci voluptatem dignissimos rem molestiae est.', 0, '163.10.125.127', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(24, 'Rozella Daniel', 'jgreen@fahey.net', '+1-316-346-9750', 'Prof.', 'Ut laborum temporibus nesciunt nam debitis numquam. Voluptas harum sed eos molestiae. Enim maiores dolorum et deserunt iusto.', 0, '251.220.144.198', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(25, 'Abbie Cronin', 'vicente.sporer@bins.com', '+1.806.631.9517', 'Prof.', 'Minus doloribus magni quia. Nobis alias velit animi non eaque. Accusamus vel in est necessitatibus laborum qui.', 0, '107.241.250.208', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(26, 'Laurel Pouros', 'ynader@hotmail.com', '(360) 796-5286', 'Miss', 'Sit incidunt quia culpa. Et quidem sed quis occaecati quisquam enim. Iusto iste eaque possimus repudiandae nihil.', 0, '210.105.125.195', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(27, 'Mrs. Neoma Bailey II', 'weimann.tina@yahoo.com', '708.908.9772', 'Mr.', 'Facere qui et fugit deleniti eligendi velit quis. Ut fugiat ut quas neque. Expedita dolorem ab ut qui fuga dolorem. Possimus eum esse debitis in vel qui.', 0, '68.10.217.30', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(28, 'Gus Dooley', 'joshua.heidenreich@hahn.com', '(307) 395-4810', 'Mrs.', 'Et et commodi minima est vero consequuntur deleniti aut. Quam est molestias laborum sed corporis debitis. Ut ut hic atque voluptas blanditiis consequatur esse.', 0, '144.24.242.172', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(29, 'Destany Conroy', 'mckenzie.cecil@okon.com', '562.219.2565', 'Mrs.', 'Autem ducimus delectus quo ut aut. Sit et soluta mollitia et explicabo hic pariatur. Provident deserunt ipsum natus totam dolorem dolore quia est. Doloremque saepe alias quibusdam nemo quia.', 0, '91.94.47.160', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(30, 'Dr. Noe Aufderhar', 'rosella53@yahoo.com', '1-219-668-6068', 'Dr.', 'Amet vel dolor voluptatum consequatur. Ex tempora voluptas ducimus est perferendis. At laudantium quos assumenda esse cum eum. Ad deserunt earum ratione eum eos.', 0, '244.58.249.183', '2024-11-13 22:05:23', '2024-11-13 22:05:23');

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
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `path`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 'https://via.placeholder.com/640x480.png/00cc22?text=debitis', 1, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(2, 'https://via.placeholder.com/640x480.png/004477?text=dicta', 1, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(3, 'https://via.placeholder.com/640x480.png/00cc66?text=consectetur', 2, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(4, 'https://via.placeholder.com/640x480.png/007733?text=iusto', 2, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(5, 'https://via.placeholder.com/640x480.png/0066dd?text=explicabo', 3, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(6, 'https://via.placeholder.com/640x480.png/0022cc?text=velit', 3, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(7, 'https://via.placeholder.com/640x480.png/009999?text=illo', 4, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(8, 'https://via.placeholder.com/640x480.png/002222?text=cum', 4, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(9, 'https://via.placeholder.com/640x480.png/00aa11?text=odit', 5, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(10, 'https://via.placeholder.com/640x480.png/00cc44?text=atque', 5, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(11, 'https://via.placeholder.com/640x480.png/0088bb?text=est', 6, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(12, 'https://via.placeholder.com/640x480.png/003399?text=et', 6, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(13, 'https://via.placeholder.com/640x480.png/001111?text=enim', 7, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(14, 'https://via.placeholder.com/640x480.png/0055aa?text=rerum', 7, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(15, 'https://via.placeholder.com/640x480.png/0055bb?text=non', 8, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(16, 'https://via.placeholder.com/640x480.png/0044ff?text=doloremque', 8, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(17, 'https://via.placeholder.com/640x480.png/0088bb?text=maxime', 9, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(18, 'https://via.placeholder.com/640x480.png/00ff99?text=illum', 9, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(19, 'https://via.placeholder.com/640x480.png/000088?text=omnis', 10, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(20, 'https://via.placeholder.com/640x480.png/005588?text=error', 10, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(21, 'https://via.placeholder.com/640x480.png/008855?text=omnis', 11, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(22, 'https://via.placeholder.com/640x480.png/005511?text=blanditiis', 11, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(23, 'https://via.placeholder.com/640x480.png/000011?text=incidunt', 12, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(24, 'https://via.placeholder.com/640x480.png/000066?text=dicta', 12, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(25, 'https://via.placeholder.com/640x480.png/00ddee?text=nobis', 13, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(26, 'https://via.placeholder.com/640x480.png/005522?text=sapiente', 13, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(27, 'https://via.placeholder.com/640x480.png/009988?text=similique', 14, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(28, 'https://via.placeholder.com/640x480.png/007799?text=quae', 14, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(29, 'https://via.placeholder.com/640x480.png/009999?text=numquam', 15, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(30, 'https://via.placeholder.com/640x480.png/0033ee?text=vero', 15, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(31, 'https://via.placeholder.com/640x480.png/0066bb?text=vero', 16, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(32, 'https://via.placeholder.com/640x480.png/008866?text=distinctio', 16, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(33, 'https://via.placeholder.com/640x480.png/000077?text=consequatur', 17, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(34, 'https://via.placeholder.com/640x480.png/00cc88?text=excepturi', 17, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(35, 'https://via.placeholder.com/640x480.png/0033ee?text=veritatis', 18, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(36, 'https://via.placeholder.com/640x480.png/0088bb?text=voluptas', 18, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(37, 'https://via.placeholder.com/640x480.png/005533?text=cumque', 19, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(38, 'https://via.placeholder.com/640x480.png/007744?text=vel', 19, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(39, 'https://via.placeholder.com/640x480.png/00ccdd?text=sit', 20, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(40, 'https://via.placeholder.com/640x480.png/000044?text=ut', 20, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(41, 'https://via.placeholder.com/640x480.png/00dd88?text=et', 21, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(42, 'https://via.placeholder.com/640x480.png/008822?text=soluta', 21, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(43, 'https://via.placeholder.com/640x480.png/005555?text=dicta', 22, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(44, 'https://via.placeholder.com/640x480.png/009922?text=dolores', 22, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(45, 'https://via.placeholder.com/640x480.png/00ccee?text=voluptas', 23, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(46, 'https://via.placeholder.com/640x480.png/007788?text=dicta', 23, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(47, 'https://via.placeholder.com/640x480.png/006677?text=rerum', 24, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(48, 'https://via.placeholder.com/640x480.png/007744?text=perspiciatis', 24, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(49, 'https://via.placeholder.com/640x480.png/00ee44?text=sapiente', 25, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(50, 'https://via.placeholder.com/640x480.png/0088cc?text=sit', 25, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(51, 'https://via.placeholder.com/640x480.png/0077aa?text=eum', 26, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(52, 'https://via.placeholder.com/640x480.png/008899?text=quo', 26, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(53, 'https://via.placeholder.com/640x480.png/008811?text=totam', 27, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(54, 'https://via.placeholder.com/640x480.png/00dd00?text=et', 27, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(55, 'https://via.placeholder.com/640x480.png/008877?text=et', 28, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(56, 'https://via.placeholder.com/640x480.png/00ee11?text=modi', 28, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(57, 'https://via.placeholder.com/640x480.png/003355?text=cum', 29, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(58, 'https://via.placeholder.com/640x480.png/00cccc?text=iste', 29, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(59, 'https://via.placeholder.com/640x480.png/00ccdd?text=consequatur', 30, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(60, 'https://via.placeholder.com/640x480.png/007788?text=ut', 30, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(61, 'https://via.placeholder.com/640x480.png/00ee77?text=impedit', 31, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(62, 'https://via.placeholder.com/640x480.png/001166?text=non', 31, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(63, 'https://via.placeholder.com/640x480.png/009933?text=eum', 32, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(64, 'https://via.placeholder.com/640x480.png/00bb00?text=quia', 32, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(65, 'https://via.placeholder.com/640x480.png/00ff44?text=omnis', 33, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(66, 'https://via.placeholder.com/640x480.png/001122?text=dignissimos', 33, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(67, 'https://via.placeholder.com/640x480.png/00ffee?text=sed', 34, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(68, 'https://via.placeholder.com/640x480.png/00aaaa?text=dicta', 34, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(69, 'https://via.placeholder.com/640x480.png/0088aa?text=labore', 35, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(70, 'https://via.placeholder.com/640x480.png/0077ee?text=incidunt', 35, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(71, 'https://via.placeholder.com/640x480.png/00bb77?text=quia', 36, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(72, 'https://via.placeholder.com/640x480.png/005544?text=ea', 36, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(73, 'https://via.placeholder.com/640x480.png/006666?text=provident', 37, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(74, 'https://via.placeholder.com/640x480.png/001111?text=ab', 37, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(75, 'https://via.placeholder.com/640x480.png/00bb99?text=ea', 38, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(76, 'https://via.placeholder.com/640x480.png/00aa88?text=ipsum', 38, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(77, 'https://via.placeholder.com/640x480.png/002255?text=deleniti', 39, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(78, 'https://via.placeholder.com/640x480.png/004411?text=ad', 39, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(79, 'https://via.placeholder.com/640x480.png/00cccc?text=in', 40, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(80, 'https://via.placeholder.com/640x480.png/00cc99?text=possimus', 40, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(81, 'https://via.placeholder.com/640x480.png/00ccdd?text=qui', 41, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(82, 'https://via.placeholder.com/640x480.png/0077cc?text=eum', 41, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(83, 'https://via.placeholder.com/640x480.png/00bb55?text=est', 42, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(84, 'https://via.placeholder.com/640x480.png/009911?text=ea', 42, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(85, 'https://via.placeholder.com/640x480.png/002233?text=iste', 43, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(86, 'https://via.placeholder.com/640x480.png/0077ff?text=in', 43, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(87, 'https://via.placeholder.com/640x480.png/0011aa?text=cum', 44, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(88, 'https://via.placeholder.com/640x480.png/0000aa?text=iste', 44, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(89, 'https://via.placeholder.com/640x480.png/006644?text=est', 45, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(90, 'https://via.placeholder.com/640x480.png/00ff44?text=animi', 45, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(91, 'https://via.placeholder.com/640x480.png/0099ee?text=consequatur', 46, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(92, 'https://via.placeholder.com/640x480.png/0022dd?text=error', 46, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(93, 'https://via.placeholder.com/640x480.png/005522?text=ipsa', 47, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(94, 'https://via.placeholder.com/640x480.png/0055cc?text=autem', 47, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(95, 'https://via.placeholder.com/640x480.png/006622?text=repellat', 48, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(96, 'https://via.placeholder.com/640x480.png/002244?text=neque', 48, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(97, 'https://via.placeholder.com/640x480.png/007722?text=voluptas', 49, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(98, 'https://via.placeholder.com/640x480.png/008855?text=quia', 49, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(99, 'https://via.placeholder.com/640x480.png/00aacc?text=consequatur', 50, '2024-11-13 22:05:21', '2024-11-13 22:05:21'),
(100, 'https://via.placeholder.com/640x480.png/0033bb?text=nam', 50, '2024-11-13 22:05:21', '2024-11-13 22:05:21');

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_05_11_000000_create_otps_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2024_09_10_183957_create_admins_table', 1),
(8, '2024_09_10_185050_create_settings_table', 1),
(9, '2024_09_10_185115_create_categories_table', 1),
(10, '2024_09_10_185135_create_posts_table', 1),
(11, '2024_09_10_185257_create_contacts_table', 1),
(12, '2024_09_13_014523_create_images', 1),
(13, '2024_09_13_014552_create_comments', 1),
(14, '2024_09_14_230904_create_related_sites_table', 1),
(15, '2024_09_15_161956_create_new_subscribers_table', 1),
(16, '2024_10_02_221926_create_notifications_table', 1),
(17, '2024_10_14_233712_create_authorizations_table', 1),
(18, '2024_11_13_013126_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `new_subscribers`
--

CREATE TABLE `new_subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` int(10) UNSIGNED NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `validity` int(11) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `desc` longtext NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `comment_able` tinyint(1) NOT NULL DEFAULT 1,
  `num_of_views` bigint(20) NOT NULL DEFAULT 0,
  `small_desc` text NOT NULL DEFAULT 'small description for post to optimization seo',
  `key_words` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '["news","posts","sport"]' CHECK (json_valid(`key_words`)),
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `desc`, `title`, `slug`, `comment_able`, `num_of_views`, `small_desc`, `key_words`, `status`, `user_id`, `admin_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Et quidem qui molestias et minus tempora quia. Quia sequi at ratione rem. Magnam eos atque est aliquam earum eaque. Nam blanditiis sit laudantium tempore ut. Ex aut aliquam autem corporis consectetur. Omnis est modi quisquam velit sit labore sint. Alias facilis incidunt similique.', 'Voluptatum quae.', 'consequatur-fuga-repellendus-architecto-aliquam', 0, 40, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 20, NULL, 1, '1985-06-01 06:06:42', '1985-06-01 06:06:42'),
(2, 'Culpa vero animi sunt voluptatem ut ut voluptatum. Consequuntur exercitationem eveniet quisquam accusantium qui officiis atque. Laborum id inventore cum optio. Ut et ullam voluptatum veniam laboriosam est omnis fugiat.', 'Nihil sunt numquam deleniti.', 'esse-ab-quidem-magnam-aut-nemo-dignissimos', 1, 79, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 6, NULL, 2, '2010-01-26 10:01:17', '2010-01-26 10:01:17'),
(3, 'Quia ipsam rerum rerum sit vitae sed quia reprehenderit. Doloribus mollitia rerum quas et sapiente minima quasi quisquam. Natus beatae sed vitae et aut vel nisi. Quia inventore unde alias aut. Eligendi odio quia ut praesentium. Occaecati sit magnam omnis velit neque et vel omnis.', 'Esse similique explicabo.', 'beatae-ut-assumenda-et-architecto', 1, 81, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 14, NULL, 3, '1976-03-13 04:03:52', '1976-03-13 04:03:52'),
(4, 'Minus sunt voluptatem omnis accusantium ut mollitia. Est adipisci voluptatem in consequatur in est odit. Quia eveniet excepturi qui quos. Sit sed suscipit temporibus temporibus. Maxime aut repellendus ab ut. Ex voluptatum similique aut aut consectetur. Ut consequatur ab illo qui est.', 'Voluptate commodi dicta.', 'ut-est-excepturi-enim', 1, 39, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 4, NULL, 3, '2023-09-02 06:09:45', '2023-09-02 06:09:45'),
(5, 'Nobis eos voluptates quasi assumenda tenetur. Cupiditate et aspernatur aperiam nostrum minima rerum eum. Aut quis asperiores soluta ut quasi rerum. Commodi non velit veniam laudantium. Eos accusamus et nulla voluptatem tempora animi.', 'Rem vitae quidem molestiae.', 'delectus-et-porro-sit-ipsum-est', 1, 95, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 20, NULL, 1, '1972-07-06 04:07:57', '1972-07-06 04:07:57'),
(6, 'Tempora maiores quia sit est accusantium distinctio. Voluptatem qui esse enim natus pariatur. Sed eveniet eligendi delectus ullam. Veritatis voluptate sapiente repellat fuga.', 'Eaque voluptate qui et.', 'vel-delectus-maiores-tenetur-in', 1, 28, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 3, NULL, 2, '2004-02-27 04:02:16', '2004-02-27 04:02:16'),
(7, 'Officia quis ipsa a illo. Consequatur cumque voluptatem accusamus ab molestiae vero voluptatem. Rerum et dicta nobis quis dolores laborum quos molestiae. Eum dolorem quidem quidem expedita et enim omnis.', 'Soluta dignissimos officiis fugiat.', 'aut-dolorum-id-ab-quia-itaque-expedita', 0, 100, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 1, NULL, 4, '2019-06-23 04:06:03', '2019-06-23 04:06:03'),
(8, 'Pariatur voluptatem voluptates consequatur facilis. Qui fugit non molestias cupiditate at sunt. Consequatur voluptatibus nihil quas iste incidunt. Dolore soluta magni quidem qui eveniet itaque.', 'Aliquid sit.', 'corporis-rerum-perferendis-esse-culpa-quia-aspernatur-ipsam', 0, 34, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 8, NULL, 2, '2023-05-12 09:05:08', '2023-05-12 09:05:08'),
(9, 'Odit quas ratione molestiae et. Placeat dolore corporis voluptates autem minus natus quidem. Cum fuga saepe laborum dolores illo hic eaque. Nobis placeat temporibus earum ipsa similique quo consequatur ipsa. Sequi quasi totam ut dolore in est.', 'Aut nihil illo nihil.', 'at-sequi-est-enim-amet-ducimus-molestiae-consectetur-repellendus', 1, 67, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 3, NULL, 2, '1973-07-23 22:07:58', '1973-07-23 22:07:58'),
(10, 'Qui ea possimus id autem facilis. Est et reiciendis quasi accusantium sapiente ad. Quia atque accusantium ex vel at. In facere voluptates ducimus earum. Voluptas praesentium exercitationem asperiores.', 'Dolorem magni qui.', 'delectus-ipsa-ipsa-atque-ratione-accusamus-natus', 0, 13, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 5, NULL, 3, '2021-06-07 08:06:59', '2021-06-07 08:06:59'),
(11, 'Est delectus nemo eos quasi. Consectetur aut explicabo maiores non. Voluptas numquam soluta occaecati iusto magni dolorem. Quos animi aspernatur consequatur at possimus dolore. Vel nihil deleniti placeat.', 'Et non.', 'aliquid-accusamus-odit-voluptatem', 0, 12, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 1, NULL, 2, '1988-03-15 05:03:57', '1988-03-15 05:03:57'),
(12, 'Tenetur at veritatis nihil. Aperiam facere distinctio et in quia et. Perspiciatis voluptatum porro at aspernatur voluptas. Voluptatem porro tempore neque a. Mollitia consequatur nesciunt facilis et eum sed. Adipisci et maxime dolore. Nihil minus earum temporibus amet aut est.', 'Impedit a eum pariatur.', 'enim-consequatur-velit-omnis-reiciendis-nulla-sit-omnis', 1, 74, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 7, NULL, 3, '2006-08-10 01:08:33', '2006-08-10 01:08:33'),
(13, 'Aliquid quia rerum tempora nam tempore. Quia pariatur eum commodi incidunt. Quos officiis sunt natus laboriosam. Enim illum nesciunt sequi enim repellat expedita. Qui neque sint repellendus similique ex odit illo culpa. Nostrum quis a mollitia voluptatum qui.', 'Omnis dolores sint distinctio.', 'debitis-dolor-sed-quo-soluta-minus-vel-officia-praesentium', 1, 48, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 9, NULL, 2, '1979-07-28 00:07:09', '1979-07-28 00:07:09'),
(14, 'Pariatur molestiae voluptatibus ea est. Inventore voluptatem iste reprehenderit sint. In saepe et velit qui illum eum. Accusantium eos voluptate officiis ullam eos rerum.', 'Mollitia illum explicabo nulla.', 'facere-magnam-sed-aut-consectetur-praesentium-sed-quod', 0, 81, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 10, NULL, 2, '2015-07-28 01:07:34', '2015-07-28 01:07:34'),
(15, 'Debitis et corporis quod eum. Distinctio odio minus perspiciatis voluptas. Qui ut qui dolor. Commodi error id omnis dolor. Qui sed suscipit officiis officiis deserunt necessitatibus.', 'Minima error laboriosam.', 'error-ratione-sed-in-maxime-quasi', 0, 16, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 12, NULL, 2, '1988-05-09 03:05:11', '1988-05-09 03:05:11'),
(16, 'Quae et sequi amet. Iure harum ut delectus ut. Odio sapiente nesciunt consequatur minima esse voluptate aut necessitatibus. Ut ducimus omnis nemo doloribus accusamus eaque ipsum. Dolorem sit qui officiis explicabo eius quasi ipsam. Vitae perspiciatis et accusantium repellat enim dolorum architecto.', 'Doloremque harum provident enim.', 'aut-voluptates-corrupti-doloremque-nemo', 0, 59, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 7, NULL, 1, '1979-04-15 01:04:10', '1979-04-15 01:04:10'),
(17, 'Reiciendis est qui cum quo facilis esse. Et enim fugit blanditiis sit exercitationem voluptates aut. Officia tenetur molestiae nesciunt quo quos hic necessitatibus. Quis voluptatem tempore alias laborum sed ipsam. Est soluta inventore modi nulla aliquam est qui sunt.', 'Tenetur nihil.', 'omnis-aliquam-itaque-voluptatum-odio-sapiente-eveniet-fugiat-quos', 1, 57, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 10, NULL, 4, '1987-11-05 00:11:15', '1987-11-05 00:11:15'),
(18, 'Voluptatem adipisci doloribus soluta dolorem. Ipsa accusamus aut saepe enim reiciendis velit et. A harum similique quia voluptatum eos molestiae. Laborum iste sed nostrum sint sunt iste est.', 'Odio magnam laboriosam.', 'qui-suscipit-omnis-quibusdam-consectetur-eveniet', 1, 0, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 18, NULL, 2, '1973-07-12 06:07:17', '1973-07-12 06:07:17'),
(19, 'Deserunt atque occaecati dicta doloribus ad quam eaque. Eaque at sapiente ipsum soluta rerum. Cupiditate est sit non eveniet quod. Laudantium incidunt accusamus dolores voluptatem ducimus et. Rem debitis aspernatur officia sed quia recusandae iste.', 'Perspiciatis voluptatibus ea sapiente.', 'qui-laudantium-eius-consectetur-doloribus', 1, 97, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 8, NULL, 4, '2000-03-06 09:03:11', '2000-03-06 09:03:11'),
(20, 'Et tenetur iure quia nihil eveniet at. Error et in aspernatur vel. Nihil voluptatem et ea et. Nemo non reprehenderit est quia et ut. Rerum vitae aut modi totam numquam. Ut culpa provident dolor quo quo. Ea voluptatem alias quis error sapiente accusantium pariatur. Aut accusamus dolor ut temporibus.', 'Nihil reiciendis iste veritatis.', 'qui-animi-illum-quia-eligendi', 1, 83, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 8, NULL, 4, '2023-12-11 10:12:10', '2023-12-11 10:12:10'),
(21, 'Illum et quas sequi dolores. Cupiditate omnis et voluptate mollitia cumque. Aliquid magni quas temporibus molestiae quidem quidem officiis. Dolor tenetur rerum sit non. Ut nihil rerum et suscipit. Tempora enim iusto et consequatur cupiditate est tempore.', 'Natus non officiis.', 'distinctio-et-in-eligendi-quaerat-quae-modi', 0, 77, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 14, NULL, 4, '2023-11-26 08:11:06', '2023-11-26 08:11:06'),
(22, 'Amet excepturi et autem magnam reprehenderit fugiat fugit. Ipsam sint et vitae eos voluptatibus doloremque repellat. Aut distinctio placeat omnis maxime ut omnis. Modi culpa quam dolor ipsum rerum. Assumenda voluptas ipsa aspernatur voluptate doloribus eos. At sint vitae ut nam sunt placeat eos.', 'Sit sint doloribus ipsa.', 'aut-et-doloribus-consequatur-ducimus-facilis-totam-officia-consequatur', 0, 57, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 11, NULL, 2, '1993-10-17 22:10:44', '1993-10-17 22:10:44'),
(23, 'Non atque doloribus laboriosam autem molestias rerum numquam qui. Dolores non occaecati et est est. Et provident doloremque nisi voluptate non. Voluptatem culpa tenetur et est. Qui tempore sed quasi tempore. Molestias est deleniti eum et optio est. Nam eligendi et ratione.', 'Dolorem dicta at voluptatem.', 'aut-voluptatem-fugit-molestias-non', 1, 88, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 4, NULL, 2, '2003-07-31 23:08:21', '2003-07-31 23:08:21'),
(24, 'Dolorem neque ut optio nostrum quia veritatis qui perferendis. Sunt reprehenderit a ut corporis aut. Autem molestiae omnis magnam dolores dolorem at modi rerum. Culpa reiciendis et a. Soluta at et tempora deleniti debitis culpa voluptas.', 'Et nobis quaerat.', 'voluptas-autem-autem-corporis-deserunt-dolore-ipsam-explicabo', 0, 46, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 2, NULL, 1, '1971-01-29 02:01:32', '1971-01-29 02:01:32'),
(25, 'Quo molestias dignissimos rerum dolores culpa provident. Iure quo omnis eum repudiandae. Et explicabo quasi sed nam. Vel asperiores et incidunt in doloribus numquam incidunt.', 'Ad velit reprehenderit.', 'qui-et-saepe-fuga-ut-reiciendis-eligendi', 1, 54, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 2, NULL, 1, '2001-12-02 10:12:38', '2001-12-02 10:12:38'),
(26, 'Quia quia est eos eum dolore praesentium ratione minima. Voluptatem soluta aut nihil laborum. Vel ut natus deserunt eius maxime. Voluptatem distinctio tempore beatae quasi eum amet in ut. Consequatur sapiente animi nobis nostrum placeat deleniti temporibus. Delectus quia cumque similique quia.', 'Aut placeat voluptatem laudantium.', 'saepe-sunt-molestiae-et-et-repellat-consequatur-consectetur-natus', 0, 83, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 1, NULL, 1, '2003-08-19 06:08:55', '2003-08-19 06:08:55'),
(27, 'Dicta nihil molestiae accusantium aut nemo. Animi et a excepturi. Libero labore et dolores nihil laudantium. Fugiat non eligendi aut culpa aut. Non harum dolor fugiat voluptatem.', 'Sed architecto aliquid.', 'perferendis-iusto-beatae-est-est-ipsam-vel-qui', 0, 91, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 18, NULL, 2, '2019-04-03 23:04:54', '2019-04-03 23:04:54'),
(28, 'Est sed doloribus nostrum occaecati aut beatae. Perferendis ut sit repudiandae possimus occaecati eveniet eaque iste. Et rem eum dignissimos et. Non officia aut dolor itaque.', 'Praesentium quia dignissimos autem.', 'enim-mollitia-culpa-vel-ut-ipsam', 0, 12, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 14, NULL, 4, '1981-05-23 04:05:59', '1981-05-23 04:05:59'),
(29, 'Totam ut aut id. Sunt praesentium dolorem eum rerum soluta et sequi. Et ex provident vel eius et. Quas nihil architecto soluta nobis saepe omnis. Vero qui ipsum reiciendis est cum incidunt voluptatem voluptatem.', 'Tempora tempore non.', 'qui-nihil-autem-et-dolorem-nobis', 1, 32, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 16, NULL, 4, '1983-03-18 10:03:58', '1983-03-18 10:03:58'),
(30, 'Incidunt aut voluptatem aliquid. Tempore voluptas quis et quis consequuntur ipsum quidem quam. Doloribus ratione officiis quaerat architecto. Est laboriosam qui accusantium.', 'Esse sapiente omnis iste et.', 'quia-quaerat-nulla-assumenda', 1, 44, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 17, NULL, 1, '2002-06-27 06:06:34', '2002-06-27 06:06:34'),
(31, 'Temporibus quo dolores dolor aperiam debitis officiis laudantium. Atque eos voluptatem totam. Voluptas natus et excepturi veritatis ducimus eos sit est. Rem vel quae tempora est quo. Minus quia ratione id eum nemo ratione. Iusto eius qui perferendis veritatis.', 'Nesciunt libero vel.', 'totam-molestiae-ex-sint-dolorem', 1, 25, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 12, NULL, 3, '2008-06-22 05:06:13', '2008-06-22 05:06:13'),
(32, 'Est hic non soluta cum. Voluptas alias error qui id sunt veniam ex. Nisi autem molestias sit nisi earum repellat corrupti. Qui necessitatibus quod et distinctio voluptatem amet hic. Qui laudantium et praesentium rerum nulla quibusdam. Harum adipisci soluta qui velit unde nisi.', 'Animi consequatur et est.', 'nihil-neque-totam-dicta-veniam-aut', 0, 45, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 13, NULL, 4, '1970-09-16 01:09:41', '1970-09-16 01:09:41'),
(33, 'Vero sed mollitia quasi id. Aut non nisi assumenda officiis facere qui voluptatem. Laboriosam ad quas voluptas. Quidem error non totam non libero aut. Est tempore ipsam molestiae quae necessitatibus non.', 'Illum ut tenetur.', 'fuga-voluptas-enim-omnis-sapiente', 0, 92, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 17, NULL, 2, '2022-04-27 23:04:20', '2022-04-27 23:04:20'),
(34, 'Aut dolor est non aut natus beatae. Ut sit quia nisi libero omnis aperiam vel. Facere consequatur voluptas voluptatem nostrum adipisci ipsam sunt. Sit ut sint illum nobis quisquam delectus. Rem qui harum repudiandae qui.', 'Voluptas dolore autem necessitatibus.', 'nisi-facilis-quo-dicta', 1, 54, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 16, NULL, 4, '2017-06-10 22:06:55', '2017-06-10 22:06:55'),
(35, 'Ut consequatur hic modi dolorem numquam sint. Debitis perferendis ut officia debitis qui et. Eaque doloremque ullam alias rerum vero reprehenderit omnis ut. Repellendus tenetur et molestias aut placeat aut eligendi dolor. Et optio aut quod eum quo ut vel. Et in aut error quo.', 'Et praesentium minus iusto.', 'modi-atque-amet-voluptatem-sit-repellendus-aut-facere', 1, 59, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 5, NULL, 2, '1999-02-10 06:02:21', '1999-02-10 06:02:21'),
(36, 'Qui enim dolorum debitis optio id velit amet. Ipsum quas enim cumque ab fugit quam. Quisquam voluptatem aut quibusdam et. Ut non molestiae eum aut. Maiores pariatur iure voluptate omnis doloribus.', 'Perferendis cum est.', 'enim-itaque-et-iste-cupiditate-natus-libero-ea-aliquid', 0, 13, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 8, NULL, 1, '1972-12-03 01:12:20', '1972-12-03 01:12:20'),
(37, 'Quibusdam voluptatem quis fugiat repellat dolorem. Est temporibus tempora alias vel culpa et totam reiciendis. Suscipit repellat culpa asperiores eum a dolores. Quam voluptate fugit et est et ea earum ut.', 'Quis qui cumque.', 'in-perferendis-itaque-placeat-nobis-vel', 1, 60, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 9, NULL, 1, '1994-05-02 06:05:11', '1994-05-02 06:05:11'),
(38, 'Illum voluptas corporis quaerat quo. Et debitis et possimus ut. Cupiditate ipsam aut architecto rem aspernatur aut ipsam. Nihil sunt sit ex velit non nemo debitis. Quis dolores mollitia facere rem. Hic qui excepturi quibusdam deleniti ipsa deleniti beatae.', 'Earum facere sed quia.', 'eius-illum-et-labore-aliquam-atque-repudiandae', 1, 12, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 2, NULL, 1, '2008-01-15 01:01:18', '2008-01-15 01:01:18'),
(39, 'Qui ut ad veritatis minus deleniti doloremque quasi. Et quo temporibus molestias voluptas. Magnam non vel laboriosam ut dolores minima. Molestiae exercitationem voluptas quia quod velit ut. Repudiandae omnis rerum aliquam mollitia qui deserunt nihil.', 'Repellendus necessitatibus similique beatae laboriosam.', 'ut-animi-et-vel-doloremque-qui', 0, 46, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 1, NULL, 4, '2017-07-14 01:07:12', '2017-07-14 01:07:12'),
(40, 'Provident amet deleniti eum pariatur. Exercitationem praesentium et facilis consequatur. In quia a facilis. Dolor et quos aut et eius itaque. Temporibus error et quia doloremque consequuntur. Earum officiis autem itaque dolor. Veniam aut quia sed ratione officiis harum minus. Veniam est quia veniam qui reiciendis.', 'Officia voluptate aut qui.', 'suscipit-qui-voluptatem-non', 0, 81, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 18, NULL, 2, '1994-08-11 08:08:38', '1994-08-11 08:08:38'),
(41, 'Eos quis sunt odio voluptatem soluta nihil dolorum. Aspernatur consequatur neque laborum eaque. Ut omnis beatae autem libero quo voluptas harum veniam. Deleniti voluptas ipsa iusto consequatur sed dolor explicabo. Et doloribus culpa exercitationem velit ea. Ut provident reiciendis cupiditate sed dicta officia.', 'Aliquid culpa nihil consequatur itaque.', 'necessitatibus-sed-ipsum-animi-unde-accusantium-quidem-repellat', 1, 38, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 16, NULL, 3, '1976-05-09 09:05:06', '1976-05-09 09:05:06'),
(42, 'Officiis labore voluptates tempora sequi sapiente vero et. Ut autem magnam voluptatum velit quia architecto. Sed laborum cumque doloremque. Harum et ducimus aliquid vero. Sed ea numquam quibusdam ipsum facilis accusamus id. Ut nobis eum sint quo. Molestiae dignissimos voluptatem qui repellendus quia amet eaque animi. Quia deserunt quibusdam rerum voluptatibus rerum.', 'Quia dolores nam.', 'et-quidem-sint-vero-ex-molestiae-illo', 0, 91, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 15, NULL, 4, '1993-02-28 09:02:02', '1993-02-28 09:02:02'),
(43, 'Voluptatem blanditiis voluptate molestias autem ab perferendis placeat. Facere quo fuga reprehenderit aut. Sequi quo inventore sed quia. Nisi fugiat explicabo illum qui incidunt.', 'Distinctio quia quia perferendis.', 'eum-odit-consequuntur-accusantium-nemo-commodi-veritatis', 0, 24, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 4, NULL, 2, '1993-04-10 00:04:29', '1993-04-10 00:04:29'),
(44, 'Beatae quia ab dolor omnis accusantium voluptas. Sit voluptatem quo id laboriosam recusandae tempore. Id illum itaque dolore eum alias. Voluptatem in cupiditate explicabo explicabo mollitia doloremque. Quidem cum reprehenderit dolorum nostrum. Ex qui quam corporis harum. Repellendus ducimus ipsa et quo placeat labore.', 'Quibusdam odio voluptatum.', 'maxime-et-hic-exercitationem', 1, 92, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 16, NULL, 2, '1986-05-06 22:05:17', '1986-05-06 22:05:17'),
(45, 'Quidem dignissimos illum enim est aut. Commodi assumenda aut exercitationem. Quam officia nihil exercitationem dolorem. Cumque temporibus qui odio sunt fuga. In ab dolor blanditiis qui totam exercitationem. Eum ad in voluptas.', 'Vel at.', 'omnis-et-quae-eligendi-quam-est-facere', 1, 95, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 10, NULL, 2, '2007-08-14 03:08:54', '2007-08-14 03:08:54'),
(46, 'Eum qui sint nihil mollitia rem sed. Ipsam debitis alias aut porro nemo laborum. Dolor qui soluta aliquid ea inventore illo. Necessitatibus vel iste sed nemo error velit cupiditate. Distinctio corrupti sunt sint non. Et nulla veritatis ipsa et aperiam.', 'Praesentium labore provident.', 'voluptatem-maxime-eos-et-sint-dignissimos-cumque-non', 1, 10, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 8, NULL, 2, '1979-09-02 03:09:33', '1979-09-02 03:09:33'),
(47, 'Pariatur laboriosam sed harum soluta. Perferendis omnis a porro quos quibusdam. Totam rerum natus dolorem velit odio voluptatibus voluptatem. Veniam est omnis soluta harum nemo voluptatibus dolor.', 'Similique in dolor.', 'asperiores-et-aliquam-non-officiis-iure', 0, 75, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 19, NULL, 1, '1982-12-01 09:12:14', '1982-12-01 09:12:14'),
(48, 'Quia porro aut cumque ipsam. Veritatis iure voluptatem minus et qui quod eligendi. Molestiae nulla rerum dolorum qui nobis. Numquam architecto non quibusdam non hic. Voluptas accusantium fugiat similique aperiam. Quos et ea necessitatibus vel dolorem suscipit eos voluptatem.', 'Deserunt excepturi mollitia aut.', 'hic-voluptates-veniam-quas-sed-doloribus-ipsum-enim', 1, 6, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 7, NULL, 1, '2023-12-13 08:12:31', '2023-12-13 08:12:31'),
(49, 'Autem sed harum numquam et. Et suscipit consequatur beatae id. Inventore ea quibusdam nam sapiente molestias. Quia ut incidunt suscipit ipsum. Praesentium esse quia provident placeat eaque necessitatibus. Maxime tempore pariatur natus doloremque neque.', 'Dignissimos dolor consequatur deleniti.', 'sequi-dolores-iste-sint-et-ut-veniam-necessitatibus-molestiae', 1, 95, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 11, NULL, 2, '1992-07-11 23:07:47', '1992-07-11 23:07:47'),
(50, 'Pariatur saepe aut molestias velit mollitia dolor. Quasi rerum aut expedita et non neque. Recusandae sapiente veniam ratione quia occaecati. Animi aut vitae dolorum nam debitis suscipit vitae. Reiciendis voluptatibus ut alias veritatis dolorem suscipit. Quaerat ipsam rerum voluptatem laboriosam. Fugiat asperiores alias velit placeat aut dolor debitis.', 'Doloremque esse modi.', 'expedita-enim-nihil-cum-illum-aliquid-itaque', 0, 6, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 13, NULL, 2, '1994-06-23 01:06:02', '1994-06-23 01:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `related_sites`
--

CREATE TABLE `related_sites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `related_sites`
--

INSERT INTO `related_sites` (`id`, `name`, `url`, `created_at`, `updated_at`) VALUES
(1, 'Fugit recusandae.', 'http://www.reichert.com/consectetur-molestiae-sed-est-omnis-saepe-molestiae-minima', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(2, 'Eaque voluptates.', 'http://monahan.biz/officiis-amet-quasi-sunt-alias-voluptatibus', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(3, 'Aliquam.', 'http://www.dubuque.com/error-molestias-distinctio-tempora-omnis-ducimus-blanditiis', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(4, 'Natus.', 'https://mayert.org/in-culpa-non-dignissimos-repellat-et.html', '2024-11-13 22:05:23', '2024-11-13 22:05:23'),
(5, 'Suscipit.', 'http://bailey.com/', '2024-11-13 22:05:23', '2024-11-13 22:05:23');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `linkedin` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `small_desc` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `email`, `phone`, `favicon`, `logo`, `facebook`, `instagram`, `linkedin`, `twitter`, `youtube`, `street`, `city`, `country`, `small_desc`, `created_at`, `updated_at`) VALUES
(1, 'news', 'news@gmail.com', '01287587134', 'assets/frontend/img/uploads/setting/a098c6bf-db21-4b7b-a03c-bc52d7486dd31728917369.png', 'assets/frontend/img/uploads/setting/383cc034-efb6-4cd3-ab99-c9438db8aab91728917369.png', 'https://www.facebook.com', 'https://www.instagram.com', 'https://www.linkedin.com/in/hassan-mahmoud-b1305822a', 'https://www.twitter.com/', 'https://www.youtube.com', 'sede basher el Esawe', 'Alex', 'Egypt', 'Welcome to  News , your go-to source for the latest news and updates from around the world. Our platform provides a comprehensive range of articles covering politics, technology, health, entertainment, and more. With a commitment to delivering accurate and timely information, we strive to keep our readers informed and engaged. Whether you are looking for breaking news or in-depth analysis, News is here to deliver the stories that matter most to you', '2024-11-13 22:05:31', '2024-11-13 22:05:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'assets/frontend/img/uploads/users/default.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `floor` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `phone`, `image`, `status`, `country`, `city`, `street`, `floor`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Napoleon Berge V', 'tyshawn.fritsch@example.org', 'monte01', '+1 (520) 801-6870', 'https://via.placeholder.com/640x480.png/0011cc?text=alias', 0, 'Grenada', 'South Arno', '64762 Fay Mountains', '2', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'fGNW2pXBfV', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(2, 'Anne Ledner', 'leuschke.mallie@example.org', 'vallie.waelchi', '+1-562-616-1994', 'https://via.placeholder.com/640x480.png/003344?text=minima', 1, 'Montenegro', 'Port Wainoberg', '66335 Floy Turnpike', '5', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', '7vqmggUW1J', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(3, 'Carli Schiller', 'boyle.newton@example.net', 'quigley.berniece', '+1-276-483-5478', 'https://via.placeholder.com/640x480.png/002200?text=ratione', 0, 'Barbados', 'Lake Faustoville', '346 Stiedemann Road', '4', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'lECzi0GPzZ', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(4, 'Uriah Buckridge', 'margaretta.robel@example.org', 'cleta.greenfelder', '1-321-280-3927', 'https://via.placeholder.com/640x480.png/007799?text=voluptatibus', 1, 'Cape Verde', 'South Rocioview', '5091 Bode Crest', '13', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'MG5KPIFbRk', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(5, 'Don Legros', 'jrutherford@example.com', 'tremayne59', '+1-870-458-6938', 'https://via.placeholder.com/640x480.png/00aa11?text=vitae', 1, 'Cook Islands', 'West Asa', '85895 Stokes Divide', '11', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'GoMndjVqFY', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(6, 'Lisa Block', 'abbott.noe@example.com', 'bgraham', '(430) 987-1017', 'https://via.placeholder.com/640x480.png/005544?text=dolorem', 0, 'Angola', 'East Linnie', '499 Wiegand Spurs', '19', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'VA5zocRJAI', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(7, 'Deondre Hermann', 'shields.jody@example.org', 'joany14', '(657) 839-0546', 'https://via.placeholder.com/640x480.png/00aa00?text=mollitia', 0, 'Bouvet Island (Bouvetoya)', 'Zackarystad', '911 Bednar Wall', '8', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'oWXyrtXmh9', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(8, 'Kiel Kutch DVM', 'pmorissette@example.com', 'eryn48', '865-638-8035', 'https://via.placeholder.com/640x480.png/00ff11?text=et', 0, 'Mozambique', 'Orphabury', '4958 Russel Pike Suite 332', '11', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'HGap0W7w8y', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(9, 'Dr. Kirstin Graham DVM', 'bruen.webster@example.net', 'breitenberg.rosalyn', '+15029523343', 'https://via.placeholder.com/640x480.png/009966?text=et', 0, 'Netherlands', 'West Beauburgh', '6170 Ruben Pine', '18', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'YKnP4wow5Z', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(10, 'Dr. Giuseppe Feest', 'maurice.glover@example.com', 'tpaucek', '1-341-443-2182', 'https://via.placeholder.com/640x480.png/0077bb?text=et', 1, 'Mayotte', 'Frederiqueshire', '8441 Sawayn Lakes', '4', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', '58jiXr9WsK', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(11, 'Rebeka O\'Connell', 'fritsch.leola@example.org', 'aron.ritchie', '+1-239-401-6918', 'https://via.placeholder.com/640x480.png/006688?text=sint', 1, 'Mauritius', 'Angelaborough', '188 Bashirian Circles', '19', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'gVmE4RTgEb', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(12, 'Edd Emmerich', 'efrain.gaylord@example.org', 'daniel.kiana', '1-830-424-2512', 'https://via.placeholder.com/640x480.png/00ee33?text=quo', 1, 'Vietnam', 'New Jewelport', '611 Rutherford Mills', '12', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'V4yT8tF0y0', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(13, 'Bernadette Koch', 'clyde.west@example.org', 'nnolan', '+15093579845', 'https://via.placeholder.com/640x480.png/00dd99?text=inventore', 1, 'Gambia', 'North Lottie', '3276 Haag Stream Apt. 223', '20', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'RaxGEwYK4I', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(14, 'Shanel Douglas', 'christiansen.jaleel@example.org', 'peter79', '+12129870283', 'https://via.placeholder.com/640x480.png/00ccdd?text=quod', 1, 'Greece', 'Hankport', '563 Hipolito Groves Suite 510', '1', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'wR0YQIl2Uz', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(15, 'Prof. Demond Lang IV', 'elwyn.howe@example.net', 'oswald78', '+1 (954) 540-3666', 'https://via.placeholder.com/640x480.png/009922?text=quae', 0, 'Norway', 'East Cierraton', '164 Friesen Springs Suite 595', '19', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'SJVA7eBHbh', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(16, 'Jaime Howe', 'mraz.lavada@example.net', 'katelyn.tromp', '(972) 494-1108', 'https://via.placeholder.com/640x480.png/0022bb?text=asperiores', 0, 'Comoros', 'Lake Amelyside', '79333 Lesch Fields', '18', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'teS6xGzSrM', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(17, 'Kyla Jacobson', 'metz.zoey@example.org', 'lesch.kellie', '+1.952.275.0137', 'https://via.placeholder.com/640x480.png/00aadd?text=similique', 1, 'Dominica', 'Hansenmouth', '575 Syble Manor Apt. 348', '11', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'Zn27pryppn', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(18, 'Precious Turcotte', 'isenger@example.org', 'mathew.larkin', '+1 (872) 506-5900', 'https://via.placeholder.com/640x480.png/008800?text=nobis', 0, 'Vietnam', 'Braunchester', '4165 Coralie Terrace', '2', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'W0bz3Ys9CP', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(19, 'Providenci VonRueden', 'huel.julian@example.org', 'jaqueline50', '563-995-0143', 'https://via.placeholder.com/640x480.png/005599?text=voluptatibus', 1, 'British Indian Ocean Territory (Chagos Archipelago)', 'Ferryton', '4753 Carey Forges Suite 048', '10', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'R1pF2HLGgO', '2024-11-13 22:05:20', '2024-11-13 22:05:20'),
(20, 'Joannie O\'Reilly', 'jschmidt@example.org', 'madie.rice', '1-434-728-0257', 'https://via.placeholder.com/640x480.png/008888?text=esse', 1, 'Suriname', 'South Addisonton', '5302 Witting Hollow', '8', '2024-11-13 22:05:20', '$2y$10$D.9AOKCXVvCZSxzctUtpQu9KfT2Nif1/G2/Aq8/OYhb30waP/aKZC', 'u0bFNwlT8N', '2024-11-13 22:05:20', '2024-11-13 22:05:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authorizations`
--
ALTER TABLE `authorizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_post_id_foreign` (`post_id`);

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
-- Indexes for table `new_subscribers`
--
ALTER TABLE `new_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `new_subscribers_email_unique` (`email`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `otps_id_index` (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_admin_id_foreign` (`admin_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Indexes for table `related_sites`
--
ALTER TABLE `related_sites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `authorizations`
--
ALTER TABLE `authorizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `new_subscribers`
--
ALTER TABLE `new_subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `related_sites`
--
ALTER TABLE `related_sites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
