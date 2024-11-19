-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2024 at 09:19 PM
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
(1, 'admin name', 'admin_username', '01287587134', 'admin@gmail.com', 1, 1, '$2y$10$W1iQazGXW/aaikXYhASrEO/FvIchiUy5vfqZly1YJbKaZIib3xweC', NULL, '2024-11-19 20:16:43', '2024-11-19 20:16:43');

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
(1, 'Manager', '[\"posts\",\"categories\",\"settings\",\"users\",\"contacts\",\"admins\",\"home\",\"authorizations\",\"profile\",\"notifications\"]', '2024-11-19 20:16:42', '2024-11-19 20:16:42');

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
(1, 'Prof. Norberto Kreiger', 'Tenetur sint odit rem sunt sint et adipisci. Commodi veniam aut excepturi.', 'earum-fuga-debitis-enim', 1, '2011-08-25 07:08:31', '2011-08-25 07:08:31'),
(2, 'Jaiden Gislason', 'Similique omnis odit placeat dolorum. Ratione nam deserunt non rerum quaerat dolorum sunt deleniti. A neque quia quas.', 'aspernatur-in-est-voluptatem-cumque', 1, '2006-08-30 08:08:23', '2006-08-30 08:08:23'),
(3, 'Prof. Arturo Emard V', 'Rem eius repudiandae corrupti quo deleniti nam fugit suscipit. Est ratione eveniet quidem possimus dignissimos.', 'rerum-inventore-sit-id-sequi-voluptatem-aliquam-dicta', 1, '1976-06-07 06:06:37', '1976-06-07 06:06:37'),
(4, 'Mr. Isaias Jerde Sr.', 'Recusandae qui et consectetur quia quia consectetur. Iusto vitae quam nemo ut.', 'temporibus-saepe-assumenda-error-esse', 1, '1989-01-10 00:01:13', '1989-01-10 00:01:13');

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
(1, 'In praesentium nobis maiores mollitia tempora et saepe voluptatem. Impedit non architecto voluptas voluptatem magnam molestiae. Debitis qui officia architecto.', '237.75.174.103', 1, 13, 25, '2002-07-30 23:07:11', '2002-07-30 23:07:11'),
(2, 'Tenetur fugit qui totam nesciunt magnam sed voluptate. Voluptatem in deserunt ut minus voluptatem inventore.', '252.65.122.75', 1, 1, 26, '1987-06-02 04:06:10', '1987-06-02 04:06:10'),
(3, 'Reprehenderit officia sed dolores alias est possimus aut. Recusandae tempore ipsum quis illo.', '245.251.150.185', 1, 5, 19, '1975-08-23 02:08:15', '1975-08-23 02:08:15'),
(4, 'Praesentium nobis sint et qui quibusdam. Et odit iste sint ea voluptatum aut.', '73.138.249.55', 1, 4, 3, '1971-01-23 07:01:57', '1971-01-23 07:01:57'),
(5, 'Ut aperiam sit aut voluptas ducimus reiciendis. Hic illo iure eos ut. Porro ducimus provident consequuntur iste rerum et numquam.', '26.54.140.216', 1, 4, 20, '2010-11-01 05:11:37', '2010-11-01 05:11:37'),
(6, 'Quo praesentium est neque consequatur. Sapiente corporis praesentium repellat eos quas dolorem. Ullam distinctio sed omnis veritatis delectus laborum et.', '144.151.85.17', 1, 15, 15, '1974-11-13 09:11:07', '1974-11-13 09:11:07'),
(7, 'Ipsa reprehenderit eius consequatur excepturi est sed maiores. Quia est ipsam quis consequuntur. Eum quasi totam ut harum ipsum repellendus.', '182.84.75.95', 1, 20, 33, '2014-05-08 01:05:21', '2014-05-08 01:05:21'),
(8, 'Ut non incidunt non. Temporibus cumque cupiditate quibusdam consequatur nihil natus dolor.', '136.52.94.232', 1, 2, 48, '1979-08-15 07:08:57', '1979-08-15 07:08:57'),
(9, 'Nam optio enim nostrum qui mollitia. Ab odio a quasi ut voluptatem.', '219.244.123.96', 1, 5, 2, '2024-05-04 03:05:42', '2024-05-04 03:05:42'),
(10, 'Magnam porro voluptatem exercitationem fugiat quae. Nulla sint id qui in.', '127.65.46.158', 1, 12, 29, '1989-10-16 23:10:27', '1989-10-16 23:10:27'),
(11, 'Quibusdam dolores qui itaque a vitae. Est soluta consequatur dolor neque. Ullam quia eos aut quia saepe itaque consequatur.', '122.138.39.194', 1, 2, 14, '2002-10-07 06:10:19', '2002-10-07 06:10:19'),
(12, 'Eum autem facilis dolores molestiae praesentium repellat et. Autem autem et voluptatibus nam optio asperiores. Aut et dolores beatae repellendus placeat ut laudantium.', '14.61.133.60', 0, 6, 33, '1977-11-01 03:11:56', '1977-11-01 03:11:56'),
(13, 'Aut nostrum amet occaecati et dolorem. Hic aperiam aut autem et molestiae quia.', '5.158.55.145', 0, 14, 13, '2001-05-23 22:05:20', '2001-05-23 22:05:20'),
(14, 'Omnis minima at similique voluptatem est numquam et blanditiis. Temporibus voluptates qui officia. Et assumenda architecto aut voluptatibus est aliquid modi hic.', '153.154.220.159', 1, 20, 41, '2023-12-19 06:12:18', '2023-12-19 06:12:18'),
(15, 'Doloribus et qui molestiae aut. Beatae voluptas pariatur eos quas minima autem voluptatem occaecati.', '127.197.142.116', 0, 5, 48, '1972-01-24 02:01:59', '1972-01-24 02:01:59'),
(16, 'Fugit sed repudiandae tempora sapiente magni quo. Est magnam vitae cumque officiis quam sint.', '251.86.222.53', 1, 19, 16, '2000-09-04 06:09:28', '2000-09-04 06:09:28'),
(17, 'Tempora consequatur quaerat sed porro perspiciatis ullam et reiciendis. Aut quia laudantium sed fugiat autem. Quo nulla voluptas quis.', '213.201.237.125', 1, 7, 3, '2015-03-30 07:03:31', '2015-03-30 07:03:31'),
(18, 'Dolorem itaque iusto ea accusamus est aut odio. Voluptates velit expedita esse porro magni dolor. Accusamus asperiores incidunt harum quae qui est quo.', '191.105.151.230', 0, 1, 17, '2008-02-03 08:02:22', '2008-02-03 08:02:22'),
(19, 'Ad dolor natus nostrum est alias commodi. Assumenda eos similique explicabo ab necessitatibus. Sit voluptas magnam sed deserunt sequi magnam omnis.', '190.219.94.181', 1, 12, 39, '1980-10-09 04:10:55', '1980-10-09 04:10:55'),
(20, 'Voluptatem cumque cumque saepe maxime consequatur ut asperiores reiciendis. Minima illum accusantium quibusdam alias.', '19.170.15.241', 0, 1, 14, '2015-07-12 04:07:46', '2015-07-12 04:07:46'),
(21, 'Sed repellat id molestiae at laboriosam qui magni. Reprehenderit enim quisquam molestiae occaecati. Velit dolores est neque suscipit.', '205.101.199.254', 0, 16, 38, '1999-03-27 03:03:24', '1999-03-27 03:03:24'),
(22, 'Voluptas minima officiis eos eligendi est ipsam quos est. Ipsam quo officiis repellendus molestiae et.', '251.236.109.107', 0, 3, 26, '1975-08-01 22:08:05', '1975-08-01 22:08:05'),
(23, 'Aut et magnam dolores dolorem dolore quas reprehenderit. Debitis aut adipisci unde dolor. Corporis et molestiae ad a fugiat sunt.', '213.232.229.26', 1, 4, 1, '2022-11-09 02:11:54', '2022-11-09 02:11:54'),
(24, 'Enim et doloribus nulla dolor reprehenderit nulla voluptas sit. Veritatis quis eum modi culpa suscipit porro dolorum. Impedit aut reprehenderit dolores facilis consequatur dolorem.', '184.127.247.173', 0, 20, 16, '1996-03-26 06:03:50', '1996-03-26 06:03:50'),
(25, 'Consequatur sapiente suscipit nulla accusamus nihil. Maxime non aperiam delectus non architecto sit. Omnis quisquam vero nesciunt quo sint quae.', '198.27.79.123', 1, 18, 47, '2004-08-02 04:08:35', '2004-08-02 04:08:35'),
(26, 'Quo eos quia vel animi sed sit. Rem consequatur in harum dolor id et. Iure quas assumenda ullam nobis et quam.', '212.53.21.181', 1, 16, 40, '2010-06-20 06:06:27', '2010-06-20 06:06:27'),
(27, 'Doloribus itaque natus deserunt in aperiam rerum. Error ea nobis neque consequatur aliquid aperiam facilis. Nisi culpa ex soluta molestiae.', '251.215.198.86', 1, 17, 41, '1990-04-27 03:04:50', '1990-04-27 03:04:50'),
(28, 'Optio impedit voluptates explicabo enim dolores veritatis neque. Temporibus reiciendis ullam libero expedita nisi quisquam iure.', '107.179.167.18', 0, 7, 5, '2001-06-29 23:06:20', '2001-06-29 23:06:20'),
(29, 'Iure et cupiditate quisquam ipsa animi aliquam tempore. Quisquam ex ut quod quos expedita libero earum.', '15.251.21.67', 1, 18, 24, '2023-10-05 23:10:43', '2023-10-05 23:10:43'),
(30, 'Voluptatem et tenetur fugiat molestiae. Est quis quia natus maiores ut laborum.', '233.58.206.98', 1, 1, 11, '1992-06-01 06:06:13', '1992-06-01 06:06:13'),
(31, 'Aperiam iure dolor et sed nihil. Doloremque delectus omnis qui doloremque autem itaque omnis molestiae.', '228.219.41.137', 1, 6, 33, '1977-08-25 07:08:43', '1977-08-25 07:08:43'),
(32, 'Porro fugit ab quisquam aut et minus. Libero ut asperiores dolores est consequatur.', '56.144.220.63', 1, 16, 29, '2001-06-06 03:06:14', '2001-06-06 03:06:14'),
(33, 'Voluptas nobis quo non eligendi. Et in qui est necessitatibus et optio.', '185.8.61.41', 0, 11, 31, '2019-08-28 05:08:37', '2019-08-28 05:08:37'),
(34, 'Neque laboriosam quia nam. Delectus aut facilis laboriosam minus.', '82.173.86.159', 0, 8, 42, '1987-10-11 00:10:44', '1987-10-11 00:10:44'),
(35, 'Ea magni modi ut officiis deleniti asperiores. Rerum ut qui culpa officiis qui rerum modi ab. Eum est consequatur ut molestiae unde.', '43.19.197.124', 1, 4, 26, '1972-08-06 23:08:32', '1972-08-06 23:08:32'),
(36, 'Odio occaecati expedita eum sed. Nobis cupiditate quaerat autem reiciendis dolor soluta dolorem. Porro excepturi expedita reprehenderit et dolor eos omnis.', '24.200.31.147', 1, 8, 25, '1978-02-02 01:02:20', '1978-02-02 01:02:20'),
(37, 'Quo qui sequi libero inventore impedit ut similique. Alias laborum veritatis velit perferendis hic ea harum.', '123.118.182.66', 0, 9, 35, '1989-04-06 23:04:12', '1989-04-06 23:04:12'),
(38, 'Adipisci ex optio odio ut aut nobis nobis. Aut voluptatem quis distinctio ea.', '248.96.185.240', 1, 11, 1, '2023-01-13 09:01:02', '2023-01-13 09:01:02'),
(39, 'Deserunt eos et qui. Fugit laborum repellendus ut fuga ut aut.', '192.94.70.252', 1, 5, 19, '2001-12-06 01:12:59', '2001-12-06 01:12:59'),
(40, 'Enim qui suscipit quidem libero voluptatum vel. Consectetur voluptates doloribus aperiam voluptas.', '253.130.225.234', 0, 6, 31, '2022-06-16 05:06:50', '2022-06-16 05:06:50'),
(41, 'Ut nemo adipisci sapiente adipisci repudiandae ut. Et dignissimos qui iure totam non eligendi.', '197.241.17.62', 1, 17, 43, '2019-11-12 10:11:56', '2019-11-12 10:11:56'),
(42, 'Temporibus voluptatum odio sit harum molestias natus est. Et voluptates iste rem reiciendis.', '99.41.21.197', 0, 17, 32, '1975-08-14 04:08:45', '1975-08-14 04:08:45'),
(43, 'Vel rem libero minus et eum atque quis. Deserunt enim qui qui sit autem possimus quo. Itaque placeat quis reiciendis repellendus veritatis voluptatum aliquid consectetur.', '100.109.114.117', 1, 2, 4, '2023-03-21 09:03:55', '2023-03-21 09:03:55'),
(44, 'Voluptatem optio et id repellendus debitis. Saepe temporibus aut aut sunt provident.', '52.253.104.206', 0, 19, 23, '2019-04-17 01:04:00', '2019-04-17 01:04:00'),
(45, 'Tenetur aspernatur impedit magnam quo. Distinctio ex sapiente nam quidem voluptas impedit qui et.', '197.165.196.225', 0, 10, 45, '1997-01-05 09:01:35', '1997-01-05 09:01:35'),
(46, 'Architecto nobis occaecati quibusdam blanditiis. Enim non non omnis quasi voluptate ut adipisci pariatur. Tempora tempore voluptatibus et quam numquam reprehenderit laudantium molestiae.', '244.158.69.46', 0, 6, 36, '1972-04-12 04:04:10', '1972-04-12 04:04:10'),
(47, 'Nulla voluptatem beatae ut aliquam. Dolores facere nam a tempora deleniti hic distinctio consequatur.', '1.165.32.112', 1, 20, 15, '2005-11-13 06:11:41', '2005-11-13 06:11:41'),
(48, 'Vitae non quis deleniti sit aperiam sint totam. Est ea consequatur consequatur ab maxime nihil.', '169.250.224.68', 0, 5, 34, '1998-07-25 23:07:15', '1998-07-25 23:07:15'),
(49, 'Rem accusamus praesentium velit sapiente nihil. Laborum eos nam nihil et ipsa reprehenderit sit.', '117.135.225.186', 1, 16, 26, '1978-07-25 00:07:39', '1978-07-25 00:07:39'),
(50, 'In velit aut voluptatem eum porro. Delectus omnis nisi harum quia. Necessitatibus rem consequuntur non vitae voluptatem nostrum rerum porro.', '220.224.81.244', 1, 14, 21, '2020-03-02 01:03:50', '2020-03-02 01:03:50'),
(51, 'Recusandae eligendi et cum. Non aliquid quia esse culpa saepe non.', '252.60.58.246', 1, 2, 31, '1999-03-04 04:03:53', '1999-03-04 04:03:53'),
(52, 'Ut quasi quis ex corporis temporibus. Fugit voluptates nemo accusantium adipisci tenetur ullam. Labore magni veniam dicta expedita animi doloremque sit.', '232.210.208.194', 0, 7, 18, '2015-02-15 04:02:29', '2015-02-15 04:02:29'),
(53, 'Est quis autem corporis voluptas voluptate. Ex dolorum aspernatur nostrum voluptatibus et nam.', '91.239.67.209', 0, 9, 32, '1992-05-08 00:05:14', '1992-05-08 00:05:14'),
(54, 'Enim ipsum cumque est dolor pariatur voluptas consequatur. In dolore et labore nulla nihil facere facere. Itaque dolor enim nostrum cupiditate.', '160.70.11.10', 1, 17, 35, '2009-10-23 03:10:01', '2009-10-23 03:10:01'),
(55, 'Ad deleniti aperiam in esse illum distinctio velit. Sint quia neque iure ut est corrupti tempore.', '46.127.182.235', 1, 16, 36, '1978-09-29 07:09:03', '1978-09-29 07:09:03'),
(56, 'Consequatur autem rem reiciendis. Vero non officia est qui.', '122.93.25.141', 0, 4, 1, '1980-10-28 00:10:45', '1980-10-28 00:10:45'),
(57, 'Laudantium illum veritatis unde pariatur aut officiis. Cupiditate eius non facere similique voluptatem porro commodi. Quia corrupti cum esse.', '192.237.207.246', 0, 20, 13, '2006-06-18 05:06:57', '2006-06-18 05:06:57'),
(58, 'Quasi consequatur consectetur amet dolores quos soluta. Quo modi consequatur et.', '41.226.187.165', 0, 13, 49, '1996-09-01 07:09:40', '1996-09-01 07:09:40'),
(59, 'Fuga quibusdam dolorem similique aperiam commodi ratione perspiciatis aperiam. Voluptas libero quis error voluptate.', '57.218.168.200', 0, 19, 37, '1971-12-02 01:12:09', '1971-12-02 01:12:09'),
(60, 'Aliquam et qui quae beatae. Eveniet asperiores in est hic ea qui quos. Voluptates blanditiis aspernatur architecto temporibus voluptatem culpa nam.', '24.229.165.166', 0, 2, 21, '1974-10-18 07:10:55', '1974-10-18 07:10:55'),
(61, 'Aliquid in et eligendi. Et doloremque nam nulla reiciendis necessitatibus earum nemo.', '65.171.31.161', 1, 4, 18, '1977-07-30 05:07:59', '1977-07-30 05:07:59'),
(62, 'Quidem repudiandae aspernatur maiores laboriosam. Ea architecto atque earum incidunt.', '143.177.255.190', 1, 8, 30, '1988-03-01 10:03:57', '1988-03-01 10:03:57'),
(63, 'Voluptates corporis quia laudantium beatae consectetur rerum. Animi quasi sit cupiditate modi.', '199.232.230.132', 1, 5, 18, '2009-05-03 03:05:49', '2009-05-03 03:05:49'),
(64, 'Ut fuga odit et. Debitis dolorem ut enim repellat.', '165.94.153.123', 0, 12, 47, '1992-10-04 02:10:05', '1992-10-04 02:10:05'),
(65, 'Delectus nisi est et dolorum aut saepe. Molestiae doloribus facilis labore sunt. Pariatur unde eum blanditiis porro quisquam qui.', '227.250.247.72', 0, 11, 43, '1974-03-03 02:03:04', '1974-03-03 02:03:04'),
(66, 'Ea doloremque expedita corrupti. Quis quibusdam minima vel esse voluptatem consequatur ut. Beatae temporibus omnis sit fugit id ut quia ut.', '168.149.139.78', 0, 1, 33, '2006-08-07 01:08:47', '2006-08-07 01:08:47'),
(67, 'Impedit recusandae corporis occaecati rerum beatae aliquam. Ducimus quia amet porro aut fuga excepturi quia. Est enim sequi ullam cumque omnis.', '254.80.231.206', 0, 16, 25, '2019-02-13 09:02:08', '2019-02-13 09:02:08'),
(68, 'Dolor quidem enim rerum. Quia voluptas autem dolores non fugit quidem possimus. Reprehenderit ad exercitationem quas aut consequatur tempore amet.', '37.50.79.239', 1, 20, 12, '1989-10-14 02:10:25', '1989-10-14 02:10:25'),
(69, 'Facere et reiciendis et temporibus corrupti. Labore inventore fuga sint pariatur soluta ea. Delectus modi provident qui exercitationem.', '52.62.31.247', 0, 20, 22, '1973-02-07 10:02:09', '1973-02-07 10:02:09'),
(70, 'Et ipsum et impedit aspernatur vel mollitia. Sequi dolorem provident sit ut sint. Occaecati deleniti ut reprehenderit quisquam perferendis voluptas itaque.', '152.64.210.242', 1, 9, 12, '1970-08-15 01:08:31', '1970-08-15 01:08:31'),
(71, 'Sed ut iure ea quisquam. Quis totam consequatur voluptates cupiditate consequuntur atque dignissimos. Tempora veniam dolore illo blanditiis pariatur magnam ut.', '227.252.168.205', 1, 19, 9, '1974-11-30 09:11:12', '1974-11-30 09:11:12'),
(72, 'Nisi magnam laborum molestiae non debitis ipsa. Dolores fugit dolores autem vero. Iure quod illo et et sint quo ipsa ex.', '2.153.212.245', 0, 7, 18, '2007-10-11 00:10:00', '2007-10-11 00:10:00'),
(73, 'Nisi saepe et consequatur quia a. Voluptatem nam velit atque repellat placeat.', '32.126.251.202', 0, 8, 15, '2003-05-27 07:05:37', '2003-05-27 07:05:37'),
(74, 'Expedita sint saepe neque autem mollitia incidunt. Voluptate quos fuga assumenda eveniet illo. Explicabo laborum totam aut sit voluptatum quod.', '91.40.59.253', 1, 18, 36, '1994-07-12 23:07:41', '1994-07-12 23:07:41'),
(75, 'Totam recusandae et magnam esse et. At fugiat aspernatur magni debitis omnis corporis. Tempora sunt saepe et ducimus.', '196.58.16.196', 0, 5, 1, '2024-02-20 07:02:26', '2024-02-20 07:02:26'),
(76, 'Aut quia reiciendis nihil dolor reiciendis sapiente culpa. Soluta et provident delectus consequatur maiores dolor. Ut culpa voluptatum maxime nihil consequatur id ut.', '230.54.167.223', 1, 18, 32, '2003-08-18 03:08:17', '2003-08-18 03:08:17'),
(77, 'Necessitatibus voluptatem sint molestias labore ea. Quia repellendus odio est et.', '242.9.137.217', 1, 19, 10, '2006-05-05 03:05:10', '2006-05-05 03:05:10'),
(78, 'Officiis consequuntur ratione quo ipsum. Et aliquid debitis soluta quia. Animi sed dolores voluptatem exercitationem.', '150.195.135.64', 0, 20, 7, '1997-06-23 04:06:22', '1997-06-23 04:06:22'),
(79, 'Adipisci placeat commodi molestias a repudiandae sunt. Tenetur dolorum enim placeat expedita illo harum eius nihil. Vero sint vel ex hic.', '45.109.5.92', 0, 14, 35, '1989-04-23 01:04:51', '1989-04-23 01:04:51'),
(80, 'Laudantium sunt magni velit rem quo. Ullam harum expedita quidem aut ipsum ab. Iusto harum laudantium voluptatem qui occaecati voluptatem maxime.', '192.195.101.113', 0, 5, 17, '2015-01-01 10:01:32', '2015-01-01 10:01:32'),
(81, 'Cumque adipisci neque quidem ex in aut. Ut quasi dolor voluptatibus earum rerum pariatur fugit. Fuga nihil natus enim repudiandae.', '97.87.106.22', 0, 20, 11, '2023-07-31 04:07:50', '2023-07-31 04:07:50'),
(82, 'Dolorem magni unde est explicabo veritatis. Similique quia accusantium nam non quam. Ducimus vel sapiente deserunt aut quia consectetur.', '60.242.6.16', 1, 10, 37, '1970-01-10 01:01:36', '1970-01-10 01:01:36'),
(83, 'Ipsam laboriosam dolor voluptatem quia maiores odit ad voluptates. Error ducimus inventore unde.', '242.244.5.247', 0, 5, 28, '1982-07-12 04:07:39', '1982-07-12 04:07:39'),
(84, 'Eum nam expedita possimus vitae nisi. Voluptatum fugit libero est totam molestiae inventore unde. Iste dolorum facilis delectus rerum aliquid.', '55.233.252.172', 0, 13, 25, '2012-10-30 04:10:33', '2012-10-30 04:10:33'),
(85, 'Et velit eum excepturi. Excepturi illo qui necessitatibus qui voluptatem. Harum architecto iusto consequatur perferendis.', '51.84.83.230', 0, 6, 50, '2012-10-20 04:10:43', '2012-10-20 04:10:43'),
(86, 'Aut et commodi sequi qui adipisci sed sit neque. Consectetur veritatis eos vel recusandae et odit. Voluptatibus ipsum architecto tempora repudiandae rerum porro beatae nobis.', '13.103.27.105', 1, 4, 26, '2000-11-03 08:11:48', '2000-11-03 08:11:48'),
(87, 'Rerum debitis animi unde minima quis veritatis. Numquam omnis sed voluptas ipsa. Est culpa ducimus quo odio maiores ea quia.', '162.101.216.108', 0, 15, 16, '2012-06-20 00:06:30', '2012-06-20 00:06:30'),
(88, 'Nihil nihil et in debitis deleniti laboriosam facilis. Recusandae vitae quia voluptas voluptatem et ex.', '17.167.81.91', 1, 16, 42, '1984-12-13 04:12:35', '1984-12-13 04:12:35'),
(89, 'Nihil animi est voluptatem dolores. Fugiat quia similique velit nihil.', '48.235.58.189', 0, 7, 44, '2008-09-23 05:09:42', '2008-09-23 05:09:42'),
(90, 'Vel est et quidem quaerat sit nihil suscipit. Aliquid doloribus aliquid sit recusandae optio officiis ad unde.', '125.241.113.16', 0, 7, 3, '2004-08-29 05:08:43', '2004-08-29 05:08:43'),
(91, 'Ab nulla at modi explicabo. Velit laboriosam sit molestiae quia adipisci distinctio explicabo.', '54.230.8.201', 0, 15, 20, '1978-10-30 03:10:55', '1978-10-30 03:10:55'),
(92, 'Quam nostrum saepe commodi sapiente consequatur aut. Excepturi repudiandae adipisci quia sequi rerum consequatur quasi. Eveniet consectetur molestiae et est.', '89.168.100.8', 1, 9, 37, '2012-02-03 00:02:01', '2012-02-03 00:02:01'),
(93, 'Aut neque voluptatem molestiae dolore possimus officia fugiat. Blanditiis quia harum perferendis voluptatem. Velit eos doloremque dolores magnam voluptates.', '122.202.214.84', 1, 12, 10, '2012-11-11 05:11:50', '2012-11-11 05:11:50'),
(94, 'Quo et unde autem quasi dolores alias eligendi. Illo facere ipsam libero dolor consequatur cum porro.', '30.159.232.171', 1, 17, 50, '2015-04-04 05:04:29', '2015-04-04 05:04:29'),
(95, 'Perferendis est commodi sit voluptatem rerum veritatis blanditiis et. Iusto quibusdam dolorem placeat sunt eum. Quis eligendi quaerat ea ad at aut.', '106.223.75.68', 1, 19, 24, '1988-08-25 01:08:41', '1988-08-25 01:08:41'),
(96, 'Pariatur repudiandae explicabo beatae quia. Maiores est sit aut ullam et qui eligendi. Aut qui qui ullam nihil sit enim repellendus.', '42.224.13.34', 1, 1, 48, '1979-06-24 08:06:05', '1979-06-24 08:06:05'),
(97, 'Maiores porro illo officia qui ut. Et est quam aut eaque et earum velit. Autem exercitationem laudantium ut sint velit.', '98.250.76.48', 0, 7, 11, '1994-06-22 01:06:27', '1994-06-22 01:06:27'),
(98, 'Pariatur culpa voluptatem aut est. Molestiae sapiente enim odio delectus quo explicabo. Atque iusto sint aut omnis impedit aliquid.', '200.215.105.166', 1, 9, 22, '2006-01-13 05:01:44', '2006-01-13 05:01:44'),
(99, 'Et eligendi quia quo inventore. Deserunt doloribus commodi rerum repudiandae odio harum unde. Quidem enim consequatur dolorum dolores architecto est.', '163.157.153.77', 0, 6, 27, '2008-02-05 06:02:27', '2008-02-05 06:02:27'),
(100, 'Non provident omnis veniam. Nemo consequatur esse quos tenetur. Aut dolorum ut minus.', '198.118.53.163', 0, 15, 15, '1976-05-10 09:05:32', '1976-05-10 09:05:32'),
(101, 'Explicabo natus velit voluptatibus doloremque. Quia est est cupiditate recusandae blanditiis repudiandae vitae. Iste iusto ad totam.', '17.72.102.45', 1, 10, 31, '1988-09-09 01:09:25', '1988-09-09 01:09:25'),
(102, 'Mollitia debitis error dolor ab qui qui. Aut ut quia quia ea et repudiandae. Labore ut maxime itaque.', '52.191.80.170', 1, 8, 42, '1993-09-10 22:09:36', '1993-09-10 22:09:36'),
(103, 'Et occaecati voluptas quaerat ipsum similique voluptates perferendis illo. Quia saepe explicabo molestiae odit consectetur iure ullam.', '16.38.209.214', 1, 1, 28, '1971-08-19 08:08:21', '1971-08-19 08:08:21'),
(104, 'Corporis aliquam a officia hic nemo quis nobis. Aspernatur omnis at eaque officia.', '237.151.78.20', 0, 20, 19, '1978-09-10 22:09:36', '1978-09-10 22:09:36'),
(105, 'Quis assumenda quas atque quis. Modi sed non et ratione debitis. Ut ut ratione non inventore et labore.', '247.101.44.132', 1, 18, 46, '2015-01-04 23:01:46', '2015-01-04 23:01:46'),
(106, 'Sed mollitia rerum aut minus neque illum. Soluta voluptatem maxime et itaque. Ad possimus expedita debitis iste.', '37.197.65.83', 0, 3, 2, '2018-12-29 08:12:49', '2018-12-29 08:12:49'),
(107, 'Ullam quia voluptatum ullam asperiores explicabo iste sed. Ut sint non praesentium dolore numquam quia est. Aliquid est quasi aspernatur veritatis at nisi.', '114.128.178.91', 0, 10, 50, '2018-05-16 06:05:11', '2018-05-16 06:05:11'),
(108, 'Alias quis magnam ut. Aut ducimus ut voluptatem et voluptas sint cumque sunt. Voluptas voluptatem ut voluptatem nulla officia.', '154.94.165.197', 1, 20, 33, '2013-09-18 00:09:46', '2013-09-18 00:09:46'),
(109, 'Dolor dolores aut nihil qui. Quibusdam consectetur ut ad est voluptatibus eos quod praesentium.', '48.242.144.37', 0, 7, 14, '2011-08-16 06:08:30', '2011-08-16 06:08:30'),
(110, 'Incidunt vitae repudiandae repellendus iure deleniti neque. Amet voluptatem provident facere ad ipsum consequatur. Est dolores natus quibusdam quae inventore.', '29.24.60.181', 1, 3, 31, '2004-02-22 07:02:14', '2004-02-22 07:02:14'),
(111, 'Natus voluptas nihil rerum similique vel sit eos. Aut modi explicabo nesciunt qui qui.', '246.93.178.95', 1, 6, 18, '1976-12-22 03:12:35', '1976-12-22 03:12:35'),
(112, 'Saepe et laborum excepturi. Iure eos non et necessitatibus. Rerum eum a eius officiis temporibus.', '220.191.45.28', 1, 15, 19, '1998-08-05 02:08:33', '1998-08-05 02:08:33'),
(113, 'Laboriosam vel officia nam est dolor voluptatem at. Dignissimos dolores aut voluptatem dignissimos voluptas.', '225.154.165.31', 1, 11, 22, '2001-12-08 23:12:35', '2001-12-08 23:12:35'),
(114, 'Nemo itaque asperiores et animi corporis laborum. Quo rerum qui ut sit pariatur. Quis et ducimus assumenda tempora dolore similique.', '202.224.228.131', 1, 13, 30, '2019-10-17 05:10:00', '2019-10-17 05:10:00'),
(115, 'Et veniam autem aspernatur mollitia ea eum distinctio. Tenetur maxime dolorem est consectetur harum minima. Incidunt voluptatem illum voluptatibus ducimus voluptates consequatur.', '6.42.103.36', 0, 13, 30, '2001-02-16 04:02:53', '2001-02-16 04:02:53'),
(116, 'Est ea vel placeat dolorem dolorem placeat. Non et dolorem veritatis facilis.', '99.75.160.144', 0, 10, 11, '1984-03-10 05:03:22', '1984-03-10 05:03:22'),
(117, 'Ut aliquam voluptate iusto facilis. Ut ipsum harum facilis suscipit atque.', '199.251.215.207', 1, 12, 21, '1996-06-23 07:06:39', '1996-06-23 07:06:39'),
(118, 'Assumenda fugiat exercitationem sunt velit voluptatem modi. Perferendis quasi asperiores repellendus itaque magni nesciunt.', '97.13.62.47', 0, 20, 24, '1991-10-04 04:10:29', '1991-10-04 04:10:29'),
(119, 'Autem est mollitia consequatur vel occaecati nobis quia. Velit mollitia repellat et. Ea omnis excepturi eaque.', '79.141.167.52', 1, 8, 20, '1976-02-25 05:02:29', '1976-02-25 05:02:29'),
(120, 'Dolorum ut asperiores cumque eligendi veritatis illo. Minus totam id accusamus ipsam amet.', '70.207.60.199', 1, 1, 30, '2002-06-21 06:06:38', '2002-06-21 06:06:38'),
(121, 'Voluptas laborum ut ullam et vero veniam. Aut sint soluta est aut at.', '86.90.7.64', 1, 18, 12, '1976-08-25 05:08:46', '1976-08-25 05:08:46'),
(122, 'Corrupti autem asperiores est nesciunt. Dicta debitis recusandae error delectus.', '55.228.138.75', 1, 14, 20, '2010-05-27 08:05:08', '2010-05-27 08:05:08'),
(123, 'Harum non blanditiis similique qui magni hic illo pariatur. Aspernatur deleniti explicabo vel omnis sed velit.', '125.67.100.112', 0, 14, 9, '2012-09-29 09:09:57', '2012-09-29 09:09:57'),
(124, 'Vitae et cupiditate possimus aut qui dignissimos neque. Porro quia rerum rerum ut ut blanditiis.', '172.54.27.77', 1, 15, 1, '1977-09-30 23:10:19', '1977-09-30 23:10:19'),
(125, 'Suscipit velit deleniti amet quasi veritatis. Minima ullam molestiae asperiores sit repudiandae praesentium.', '45.39.31.207', 1, 13, 25, '1994-03-11 04:03:45', '1994-03-11 04:03:45'),
(126, 'Nostrum hic est provident harum. Repudiandae aspernatur debitis facilis perspiciatis aliquam nisi sint. Eum iste et sapiente numquam itaque possimus sunt illum.', '71.27.134.219', 0, 18, 45, '1973-09-24 05:09:38', '1973-09-24 05:09:38'),
(127, 'Incidunt vel voluptatum ipsam consequuntur ratione voluptatem. Aspernatur sequi qui nostrum soluta eum natus.', '142.161.125.25', 0, 19, 15, '1971-08-10 04:08:25', '1971-08-10 04:08:25'),
(128, 'Ea sed dolores minus exercitationem voluptatem. Veniam cum qui non earum voluptatibus delectus.', '120.51.245.197', 0, 16, 24, '1998-08-13 00:08:55', '1998-08-13 00:08:55'),
(129, 'Excepturi exercitationem repudiandae quas. Vero animi eligendi asperiores quo ad ullam dolorem. Perspiciatis consequatur ipsum eos quisquam expedita saepe earum.', '176.181.8.47', 1, 16, 44, '1971-11-03 01:11:02', '1971-11-03 01:11:02'),
(130, 'Beatae recusandae sunt occaecati illo sit harum. Ipsa pariatur soluta quaerat officiis unde.', '11.153.146.0', 0, 2, 33, '1984-09-20 06:09:58', '1984-09-20 06:09:58'),
(131, 'Neque suscipit et et quia est dolorem. Consequatur rerum qui accusamus optio impedit provident et.', '165.253.54.138', 1, 16, 15, '1970-10-01 01:10:39', '1970-10-01 01:10:39'),
(132, 'Et veritatis velit eos quidem esse accusantium. Consequatur rem ipsam excepturi vitae quia incidunt voluptatem. Eaque debitis sed harum.', '101.201.4.173', 0, 7, 40, '2013-02-10 06:02:49', '2013-02-10 06:02:49'),
(133, 'Voluptas et aut eos eos. Molestiae pariatur suscipit numquam.', '107.51.171.213', 1, 8, 8, '2019-11-18 05:11:38', '2019-11-18 05:11:38'),
(134, 'Dolor ad facere magnam fugit officia. Consectetur nostrum sapiente ipsa quod hic vel.', '82.199.75.212', 0, 7, 40, '1972-08-06 00:08:38', '1972-08-06 00:08:38'),
(135, 'Neque earum id nihil at vitae. Iste quibusdam debitis quidem dolore soluta.', '181.169.73.245', 1, 19, 45, '1986-07-14 07:07:09', '1986-07-14 07:07:09'),
(136, 'Facilis dolor itaque recusandae iste et ipsum sapiente accusamus. Quisquam tenetur eum est placeat saepe. Veritatis ut quae velit molestiae tenetur est ullam.', '32.68.63.57', 0, 4, 39, '2011-12-18 06:12:44', '2011-12-18 06:12:44'),
(137, 'Quam sit quia facilis est minus nostrum magni. Qui quasi voluptatem repellat quod tenetur. Quam quis odio voluptatem eum.', '210.85.14.222', 0, 3, 47, '1987-02-09 04:02:37', '1987-02-09 04:02:37'),
(138, 'Dolores earum non ratione quis suscipit. Ipsam provident non vero velit dolor totam voluptates minima. Aut in ut nulla rem.', '202.15.202.32', 1, 8, 6, '2023-03-21 10:03:38', '2023-03-21 10:03:38'),
(139, 'Eum in ut veritatis earum expedita similique libero numquam. Natus et corporis nemo hic magnam.', '224.63.248.125', 1, 3, 27, '1991-02-26 08:02:29', '1991-02-26 08:02:29'),
(140, 'Possimus laboriosam quia quaerat alias placeat pariatur ullam. Pariatur pariatur ad officia.', '197.15.42.120', 0, 8, 4, '1997-09-27 01:09:39', '1997-09-27 01:09:39'),
(141, 'Itaque quas vel molestiae. Aperiam ipsa quis repellat natus et reiciendis omnis. Voluptates natus perferendis ullam aut ipsa hic facere qui.', '161.2.219.24', 0, 17, 12, '2011-11-19 00:11:09', '2011-11-19 00:11:09'),
(142, 'Tenetur maxime unde repudiandae ex. Quisquam et quia iste et dolorem et culpa cupiditate.', '116.242.65.110', 0, 13, 42, '2015-03-08 05:03:21', '2015-03-08 05:03:21'),
(143, 'Iusto rerum maxime illo odit et officia nihil. Eum sunt nulla itaque dolores odit. Ad laudantium maiores blanditiis tenetur voluptas voluptas.', '138.228.29.197', 0, 12, 24, '1997-06-03 02:06:13', '1997-06-03 02:06:13'),
(144, 'Illum omnis laudantium modi quia exercitationem. Maxime eum quas asperiores in aperiam omnis.', '94.148.0.167', 1, 6, 26, '2018-03-09 23:03:13', '2018-03-09 23:03:13'),
(145, 'Dolorum animi repellendus sunt eos odio commodi dignissimos. Vero accusamus error et quis recusandae exercitationem.', '222.240.202.14', 0, 8, 31, '1972-01-28 04:01:34', '1972-01-28 04:01:34'),
(146, 'Et ipsum suscipit vitae beatae dolores. Quo porro consectetur consequuntur rerum voluptates aut voluptates. Sint perferendis sint illo pariatur.', '55.28.128.246', 1, 1, 29, '2013-05-22 07:05:34', '2013-05-22 07:05:34'),
(147, 'Nemo modi perspiciatis doloribus velit quisquam. Laboriosam est est officia facere.', '87.253.239.228', 0, 19, 24, '1985-11-10 03:11:07', '1985-11-10 03:11:07'),
(148, 'Incidunt debitis quo dolor assumenda aut minus. Eius consequuntur et et quam consequatur adipisci libero.', '254.30.85.129', 0, 10, 37, '1990-08-24 00:08:41', '1990-08-24 00:08:41'),
(149, 'Reiciendis eos rerum aspernatur libero amet illo. Quia qui sequi sed ut voluptatem. Veritatis nemo ab dolores reiciendis.', '60.52.63.225', 0, 16, 18, '2008-01-22 10:01:07', '2008-01-22 10:01:07'),
(150, 'Ut hic libero deserunt eum. Unde ratione non perferendis sunt dicta.', '71.129.28.47', 1, 4, 2, '2012-10-03 09:10:44', '2012-10-03 09:10:44'),
(151, 'Et adipisci odio omnis quam culpa. Voluptatum porro et quia enim ut vitae velit cumque. Cum quae omnis eligendi dolores quibusdam nulla.', '231.202.59.226', 1, 6, 31, '2024-08-08 05:08:16', '2024-08-08 05:08:16'),
(152, 'Et consequatur saepe at illo. Ullam quae qui et. Adipisci nihil veritatis rerum et minima.', '19.191.165.6', 0, 16, 12, '1975-05-28 03:05:39', '1975-05-28 03:05:39'),
(153, 'Fugiat nobis hic non quidem itaque iste. Expedita non quaerat velit quia rerum facere magnam. Corrupti beatae ea amet enim et qui eos.', '200.183.111.170', 0, 12, 38, '2011-10-25 03:10:34', '2011-10-25 03:10:34'),
(154, 'Expedita eum facilis magni. Est saepe eos ut maxime officia molestiae possimus. Omnis quod ipsum dolore.', '70.48.64.211', 1, 12, 10, '2013-12-15 00:12:58', '2013-12-15 00:12:58'),
(155, 'Quo autem voluptatem vitae assumenda et asperiores. Tempore praesentium fuga voluptas odio.', '145.41.64.31', 0, 1, 46, '2004-05-02 05:05:51', '2004-05-02 05:05:51'),
(156, 'Et nam sapiente vitae vero suscipit perspiciatis. Officia accusantium error labore sequi est perspiciatis. Et aut nihil eaque eos aut aspernatur laborum.', '115.40.210.40', 0, 1, 7, '1997-09-06 09:09:10', '1997-09-06 09:09:10'),
(157, 'Magnam veritatis sed est voluptas numquam aut placeat. Provident molestiae qui dolores vero assumenda quam ipsam.', '218.107.145.3', 1, 19, 32, '1980-03-21 02:03:50', '1980-03-21 02:03:50'),
(158, 'Atque inventore quis et numquam illum et. Cupiditate sit sapiente ratione dolorem quia rem. Eius odio aut sed dolores culpa.', '78.18.19.244', 1, 2, 41, '2008-03-19 07:03:16', '2008-03-19 07:03:16'),
(159, 'Pariatur quis quo commodi perspiciatis deleniti nam quod saepe. Reiciendis occaecati exercitationem est quidem. Fugit quo facilis non veritatis officia.', '231.134.255.49', 0, 20, 49, '1990-04-30 01:04:27', '1990-04-30 01:04:27'),
(160, 'Voluptatem qui sed exercitationem quia. Dolor rerum aut soluta et ullam cum. Ut tempore distinctio rerum nulla.', '144.74.161.240', 1, 16, 42, '1993-06-17 08:06:19', '1993-06-17 08:06:19'),
(161, 'Et doloribus voluptatem quis. Qui non et quia placeat.', '74.107.112.216', 0, 12, 14, '1984-10-02 04:10:12', '1984-10-02 04:10:12'),
(162, 'Sint quia quia voluptatem adipisci provident optio. Dolorem non ex quia tempora unde eum esse. Culpa ea dolorem quibusdam omnis ducimus temporibus.', '161.165.15.97', 0, 18, 4, '2008-06-23 01:06:37', '2008-06-23 01:06:37'),
(163, 'Ea harum ex dolorem. Voluptas voluptatem et quod dolor. Sint voluptas velit accusamus nulla sint quidem delectus non.', '204.104.212.119', 0, 8, 5, '1980-04-06 08:04:19', '1980-04-06 08:04:19'),
(164, 'Similique dolor cupiditate aut et qui eum fugit. Voluptatem fuga esse aut quia eos quia. Dolores dolor dolores rerum ullam alias.', '120.153.187.87', 0, 4, 23, '2018-07-05 23:07:53', '2018-07-05 23:07:53'),
(165, 'Optio omnis qui debitis sint voluptatem. Sint ratione enim voluptatem quia amet praesentium.', '124.85.136.43', 1, 11, 50, '2023-11-24 10:11:54', '2023-11-24 10:11:54'),
(166, 'Voluptas repellendus impedit qui voluptas. Aperiam at alias facere molestiae magni ut. Sit perspiciatis ut sit nobis.', '92.76.23.46', 0, 10, 10, '1977-09-06 04:09:18', '1977-09-06 04:09:18'),
(167, 'Aut assumenda nostrum laudantium consectetur dolores magni quis. Qui voluptatem esse animi quia in ut in.', '217.128.235.98', 0, 17, 46, '1997-02-28 00:02:00', '1997-02-28 00:02:00'),
(168, 'A ut accusantium non rerum fugiat. Excepturi minus error sequi commodi ut aut. Quis saepe ut voluptatem et animi facilis et.', '26.35.90.190', 1, 7, 43, '2012-10-09 07:10:11', '2012-10-09 07:10:11'),
(169, 'Laborum ullam repellat velit veniam asperiores minima. Accusantium debitis vel facilis adipisci. Sunt quidem ex neque sed autem sapiente.', '28.192.144.37', 0, 4, 29, '2014-02-02 04:02:24', '2014-02-02 04:02:24'),
(170, 'In et exercitationem veritatis et quia. Voluptas aut maiores aut praesentium enim recusandae. Eum eos quam quo delectus itaque aspernatur.', '151.212.116.237', 1, 7, 7, '2003-09-25 08:09:51', '2003-09-25 08:09:51'),
(171, 'Deleniti vero quia velit maiores. Eum ea modi reiciendis qui quia. Ea veritatis amet ipsam deleniti quod.', '45.238.138.166', 0, 4, 16, '1993-07-13 09:07:46', '1993-07-13 09:07:46'),
(172, 'Harum voluptatibus ipsa mollitia ea blanditiis deleniti. Vitae voluptatibus nesciunt dolorum non. Quaerat atque et a voluptatibus commodi occaecati enim.', '139.106.214.11', 0, 11, 23, '1984-02-26 08:02:30', '1984-02-26 08:02:30'),
(173, 'Ad id accusamus sunt cumque voluptatum. Dolore voluptas mollitia et voluptas. Provident natus et quisquam sed voluptate.', '43.32.89.167', 1, 4, 50, '2021-06-20 23:06:54', '2021-06-20 23:06:54'),
(174, 'Exercitationem dignissimos maiores aut cupiditate unde eos vel. Iure commodi totam numquam nam. Facilis consequatur molestiae qui placeat et.', '122.136.205.195', 1, 1, 10, '1997-08-20 22:08:19', '1997-08-20 22:08:19'),
(175, 'Fugit et dolorem reiciendis. Qui esse ab sunt voluptatem.', '253.229.204.11', 0, 6, 3, '2008-01-22 08:01:58', '2008-01-22 08:01:58'),
(176, 'Enim doloribus eos voluptates et ea. Recusandae earum labore qui odio dignissimos.', '234.69.84.99', 1, 4, 30, '1970-03-28 09:03:17', '1970-03-28 09:03:17'),
(177, 'At mollitia aut accusantium eligendi harum exercitationem et. Maiores aperiam inventore in numquam commodi et. Quia quas maiores quis maxime.', '196.102.13.96', 0, 13, 38, '1992-02-22 02:02:45', '1992-02-22 02:02:45'),
(178, 'Commodi necessitatibus nihil non dicta dolores vel impedit numquam. Quo dolores aliquam natus necessitatibus et neque. Suscipit vero quas voluptate nisi porro alias.', '62.64.89.20', 0, 4, 17, '1982-09-23 05:09:45', '1982-09-23 05:09:45'),
(179, 'Dicta eos qui consequatur sed. Aperiam esse nihil deleniti eligendi. Iste laboriosam et cumque modi illo facilis.', '55.61.22.244', 0, 13, 45, '1979-07-03 02:07:09', '1979-07-03 02:07:09'),
(180, 'Nulla earum iusto temporibus qui officia assumenda. Aut sunt aliquam sunt quis. Soluta expedita qui nihil omnis cumque occaecati.', '176.125.197.32', 0, 5, 33, '2009-01-04 05:01:35', '2009-01-04 05:01:35'),
(181, 'Dolor eos deleniti quia tempore sit id perferendis. Dicta rerum rem non laudantium eaque corporis. Ab provident voluptatum fugit sequi aut quas.', '31.138.14.226', 0, 12, 42, '1970-01-06 10:01:51', '1970-01-06 10:01:51'),
(182, 'Recusandae eaque et cum laborum nesciunt. Facilis enim enim quia fugit.', '245.192.199.210', 0, 17, 34, '2006-07-29 04:07:05', '2006-07-29 04:07:05'),
(183, 'Repellat pariatur ut neque reiciendis assumenda voluptatum. Hic quo ut quidem reiciendis culpa provident.', '122.4.236.232', 0, 7, 4, '1975-06-01 23:06:45', '1975-06-01 23:06:45'),
(184, 'Vel nobis labore dolores animi officiis. Est nostrum illum et aut. Et ratione et numquam distinctio ad ipsa.', '166.47.183.211', 0, 5, 33, '1991-06-19 04:06:34', '1991-06-19 04:06:34'),
(185, 'Eos repudiandae aperiam sit voluptas voluptas. Doloribus odio mollitia doloremque accusamus necessitatibus reiciendis enim est. Fugiat aliquid aut modi ex nam.', '36.108.248.174', 0, 14, 41, '2016-11-04 01:11:38', '2016-11-04 01:11:38'),
(186, 'Voluptatem dolorem deleniti dolores mollitia. Soluta consequuntur numquam iste aut quasi beatae consequatur voluptas. Vel neque cum porro.', '237.9.136.186', 1, 4, 42, '2005-04-14 02:04:41', '2005-04-14 02:04:41'),
(187, 'Omnis debitis cupiditate nostrum iusto neque sit accusamus. Debitis aut quo mollitia est illo et impedit.', '236.33.172.6', 0, 16, 35, '1984-03-19 02:03:37', '1984-03-19 02:03:37'),
(188, 'Ut rem deleniti quae dolores ut. Excepturi ea quas et ipsam minus eos. Laudantium aut et sunt esse laudantium ab facere.', '181.49.129.127', 0, 14, 21, '1972-08-05 03:08:47', '1972-08-05 03:08:47'),
(189, 'Eius qui necessitatibus eum saepe deserunt ad quo. Dolores sed fugiat molestias ullam delectus omnis. Sit consequatur consequatur assumenda.', '48.146.121.78', 1, 16, 23, '1991-11-28 05:11:59', '1991-11-28 05:11:59'),
(190, 'Tempora eius dolore molestiae neque repudiandae optio consequatur. Molestias fuga sunt voluptas culpa est.', '173.225.44.47', 1, 2, 3, '2011-11-23 00:11:13', '2011-11-23 00:11:13'),
(191, 'Voluptatem natus ipsam nihil repudiandae blanditiis et. Quod dolore ut aspernatur suscipit iure sequi. Tempora quia voluptatem possimus.', '150.102.66.124', 0, 4, 6, '2022-09-08 23:09:51', '2022-09-08 23:09:51'),
(192, 'Dolor enim ut reiciendis. Fugit quia vel sit odit provident.', '20.228.40.238', 0, 10, 1, '1979-03-15 06:03:52', '1979-03-15 06:03:52'),
(193, 'Reiciendis molestias et labore ut officia. Distinctio qui sed alias voluptas tempora magni et. Deserunt unde vero qui beatae sed impedit placeat.', '66.207.83.30', 1, 4, 41, '1973-05-08 07:05:43', '1973-05-08 07:05:43'),
(194, 'Praesentium accusantium eos quis. Veritatis libero ad eaque est autem.', '88.168.236.113', 1, 1, 39, '2020-11-27 08:11:07', '2020-11-27 08:11:07'),
(195, 'Repellendus atque neque officia quod non nisi voluptatum. Inventore omnis tenetur labore qui omnis aut. Reiciendis aliquam nobis doloremque ut recusandae maxime.', '177.121.197.71', 0, 14, 14, '2007-01-10 07:01:42', '2007-01-10 07:01:42'),
(196, 'Molestiae necessitatibus debitis quasi enim qui optio. Sint id expedita fugit vel sequi voluptate dolores. Ipsum laboriosam dolor omnis voluptatem dolores et.', '187.160.65.252', 1, 15, 26, '1991-07-05 07:07:22', '1991-07-05 07:07:22'),
(197, 'Quas autem quo modi qui maiores fugit assumenda id. Magnam delectus libero et distinctio. Ipsa praesentium aut sed nihil sunt consectetur.', '187.31.100.105', 0, 6, 24, '2022-04-19 08:04:27', '2022-04-19 08:04:27'),
(198, 'Sunt fugiat magnam quo deserunt veniam adipisci perferendis. Et odio ullam ratione est nulla officiis. Sit quidem eligendi animi vitae accusamus veritatis dolorem.', '30.205.145.92', 1, 2, 14, '2024-02-07 06:02:20', '2024-02-07 06:02:20'),
(199, 'Omnis suscipit qui a reiciendis. Occaecati eos corporis eius aut explicabo enim.', '2.50.63.61', 1, 18, 29, '1974-03-12 00:03:33', '1974-03-12 00:03:33'),
(200, 'Voluptas placeat fuga ab officia ut. Dignissimos laborum quia accusamus ea voluptatem dicta ut. Rem iste dolorum asperiores deleniti.', '214.254.62.8', 1, 17, 15, '2006-06-03 01:06:00', '2006-06-03 01:06:00');

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
(1, 'Makenna Gaylord', 'lavinia.watsica@gmail.com', '540-235-6431', 'Dr.', 'Quae assumenda recusandae repellat veniam. Fugit libero at nulla facilis et veniam quasi odio. Sed nulla porro nulla eaque.', 0, '190.122.177.67', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(2, 'Mrs. Elenor Wintheiser', 'bradtke.oran@jaskolski.com', '+1.651.743.2984', 'Ms.', 'Dolores aut voluptatem temporibus neque id consequatur similique. Quibusdam in dolores commodi et. Mollitia et omnis consequatur hic ut reprehenderit ut.', 0, '46.222.89.241', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(3, 'Raoul Abshire PhD', 'lledner@murphy.com', '+1.870.571.5965', 'Dr.', 'Dolore totam non alias sit dolores. Molestias quasi doloribus consequuntur quia eaque.', 0, '13.184.142.188', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(4, 'Lue Berge', 'jessyca57@doyle.biz', '+1 (779) 732-9008', 'Prof.', 'Rerum minima voluptatem qui sit. Et sed ab voluptas. Dicta dolorem ullam est deserunt voluptatem doloremque labore doloribus. Nulla laborum animi minus impedit laudantium velit omnis.', 0, '197.49.196.110', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(5, 'Dovie Schulist', 'mathias.oreilly@yahoo.com', '1-308-284-6864', 'Miss', 'Tempora rem pariatur quas aut qui rerum. Eum omnis adipisci id et molestiae. Rerum placeat voluptates id accusantium in veniam voluptatem.', 0, '86.202.227.124', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(6, 'Miss Esmeralda Abbott MD', 'lemke.immanuel@schaden.com', '1-229-993-6783', 'Dr.', 'Consequuntur impedit facilis quo laboriosam assumenda facilis omnis. Eius eveniet ipsa cumque placeat rerum asperiores. Autem consequatur tempore nostrum voluptatem et similique.', 0, '73.54.106.219', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(7, 'Jewel Sipes Sr.', 'adeline.becker@hotmail.com', '1-601-898-2122', 'Miss', 'Aut qui vero voluptas corporis animi. Dolores possimus dignissimos est inventore et necessitatibus qui. Est ullam cupiditate molestiae rerum id est. Ratione omnis alias libero nihil minima sapiente sapiente.', 0, '11.11.74.156', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(8, 'Rudy O\'Kon', 'mona90@sipes.com', '+13044947498', 'Mr.', 'Reprehenderit adipisci sapiente ab voluptas est aspernatur. Nisi numquam aut est voluptas fuga quod labore. Excepturi minus eos et in voluptatem vel quo.', 0, '252.221.102.137', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(9, 'Magnolia Wisoky', 'hand.violet@ullrich.net', '838-287-0530', 'Miss', 'Facilis illum non quidem quia est. Vero fugiat vel cupiditate omnis ratione molestiae repudiandae vel. Et culpa ex optio. Rerum voluptatem magnam facere fuga ut enim repellendus.', 0, '103.150.179.3', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(10, 'Edd Reichert', 'ssatterfield@gmail.com', '+12403286958', 'Miss', 'Velit ipsa tempore eos est repellendus. Qui porro qui libero nobis libero. Officiis exercitationem aut nam aut. Vel inventore sunt rem tempore fugit autem reprehenderit.', 0, '16.173.58.123', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(11, 'Prof. Vida Kutch DDS', 'braun.caesar@larson.com', '+13166156959', 'Dr.', 'Similique pariatur eveniet dolor asperiores. Cupiditate non exercitationem illo blanditiis omnis distinctio dolor.', 0, '137.183.154.177', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(12, 'Heloise Bartoletti', 'keeling.agustina@lowe.biz', '713.871.9166', 'Ms.', 'Praesentium fugit nihil rerum est. Debitis amet voluptatem consequatur vero ab sint sed. Quia cupiditate vitae exercitationem voluptatum expedita.', 0, '54.165.208.61', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(13, 'Ms. Euna Hoeger', 'maida.sawayn@gmail.com', '+18473051771', 'Prof.', 'Accusamus ab non error eum minima et. Et aut omnis eius dolores voluptatem. Est eos aut perspiciatis sed enim tenetur. Quibusdam ut voluptas non eveniet et dolorem.', 0, '169.121.206.112', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(14, 'Mr. Adolfo Feil Sr.', 'carmine83@yahoo.com', '+16802746738', 'Mr.', 'Officiis est dolor quia alias impedit ut quis in. Aut iste voluptatem cupiditate. Quia voluptas blanditiis voluptatum ab quibusdam perferendis.', 0, '9.7.115.42', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(15, 'Fletcher Yundt', 'jacinto24@hettinger.com', '1-941-394-0001', 'Prof.', 'Nihil eius asperiores similique sapiente et. A exercitationem est distinctio commodi sit deleniti. Incidunt odit sit sed autem culpa. Fuga rerum quia quia placeat nulla.', 0, '190.81.12.46', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(16, 'Bailey Koch', 'mitchell.ernest@hagenes.info', '430.990.6597', 'Prof.', 'Nam et alias aut quia quidem alias dolorem. Delectus sint cupiditate unde temporibus exercitationem voluptatibus consequuntur. Omnis necessitatibus vel aut nulla inventore. Deserunt sed facilis quisquam vel placeat.', 0, '149.6.75.157', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(17, 'Prof. Mose Harvey', 'oschulist@schneider.com', '+1.339.925.7511', 'Ms.', 'Rerum voluptatem libero voluptatibus repudiandae quasi provident. Vel eos labore dolore quia vero accusamus velit. Magni ea ea autem corporis et. Quam facilis qui corporis aperiam et reiciendis molestias.', 0, '172.17.83.213', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(18, 'Rosanna Bayer', 'dedric.langosh@wehner.net', '1-484-201-0701', 'Dr.', 'Consequuntur ex sed vitae esse officia. Quo illum tempore doloribus velit voluptatem ipsum. Ut commodi est doloremque facilis cupiditate.', 0, '55.221.27.251', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(19, 'Waldo Towne', 'melissa83@yahoo.com', '+1-856-577-0793', 'Prof.', 'Ipsam totam quas vel consequatur incidunt aspernatur. Ipsum illum ea rerum et blanditiis alias eveniet facilis. Ratione aut sed vel delectus et placeat nesciunt qui.', 0, '208.229.205.99', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(20, 'Mac Lockman', 'lynch.aurelie@ratke.com', '+1.661.273.2978', 'Dr.', 'Repellat praesentium sed necessitatibus hic. Ipsa ipsum aut quidem laboriosam nisi. Veniam ab architecto et numquam quasi. Aut iusto porro quibusdam ratione in aut.', 0, '48.132.249.117', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(21, 'Kaci Hirthe', 'green.oral@gmail.com', '912-435-4642', 'Dr.', 'Enim est recusandae et labore vel iste. Mollitia id et quasi temporibus placeat facere. Eos eum pariatur voluptas officia voluptatem amet officia.', 0, '240.131.6.101', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(22, 'Jeanie Ernser', 'volkman.kory@yahoo.com', '1-848-727-2631', 'Dr.', 'Amet assumenda architecto quis consequatur fugit. Sed doloribus voluptates rerum ratione laboriosam et. Nam facere dignissimos corporis dolores enim error occaecati. Ut quaerat amet sunt aut facilis magni.', 0, '113.235.91.200', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(23, 'Justus Bahringer', 'spencer.keenan@hotmail.com', '+1-210-964-8711', 'Mr.', 'Illum quod quam qui doloremque molestiae nihil ea aut. Atque perferendis voluptatem ea accusantium. Sed omnis sunt autem qui.', 0, '164.122.146.91', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(24, 'Prof. Ahmed Tremblay DDS', 'trolfson@brown.org', '551.464.8271', 'Mrs.', 'Sed et officia facilis dolores. Nulla tempore exercitationem eos modi consequatur voluptas et ut. Sit necessitatibus quia unde atque. Rerum temporibus magnam reiciendis temporibus.', 0, '100.233.215.0', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(25, 'Skylar Tillman', 'margarett56@roberts.com', '+1-615-795-8571', 'Mrs.', 'Dolores voluptatem ea voluptatem aut aut ut qui pariatur. Reprehenderit inventore commodi maiores modi id aut tenetur. Rerum doloremque exercitationem blanditiis. Vel eum error est.', 0, '16.29.190.246', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(26, 'Dr. Lori Mann', 'dedrick.ondricka@hotmail.com', '(573) 412-6167', 'Dr.', 'Possimus nostrum alias veritatis aliquam. Et nisi eos aut. Vel ea eius mollitia reiciendis. Nobis est omnis suscipit possimus qui blanditiis.', 0, '84.204.93.121', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(27, 'Angeline Connelly', 'bfarrell@hotmail.com', '(785) 609-8301', 'Ms.', 'Est beatae sunt dolorem qui aut. Esse est est et voluptas dignissimos consequuntur qui. Ut laudantium iusto maiores totam aut minima. Reiciendis dignissimos explicabo vel repudiandae sit accusamus numquam.', 0, '46.18.210.155', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(28, 'Humberto Hammes', 'boris05@boehm.com', '551.239.9333', 'Mrs.', 'Maxime occaecati impedit in ipsam reprehenderit illo. Ad suscipit qui cum quis aut voluptas. Adipisci quos omnis impedit provident. Ut voluptas perspiciatis et ut aut.', 0, '66.33.26.181', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(29, 'Lilliana Braun', 'justyn.gleichner@larkin.com', '+1 (458) 988-2405', 'Prof.', 'Doloribus non totam blanditiis enim repellendus saepe. Et maiores libero voluptas quisquam a tempora.', 0, '97.98.16.33', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(30, 'Miracle Raynor', 'lwalker@oconnell.com', '463-276-2638', 'Ms.', 'Consequuntur porro sint et neque quia. Hic soluta eveniet nulla velit odit. Eligendi unde perferendis omnis deleniti sed at explicabo. Architecto numquam qui repellat enim et minima.', 0, '139.244.188.199', '2024-11-19 20:16:48', '2024-11-19 20:16:48');

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
(1, 'https://via.placeholder.com/640x480.png/00cc11?text=voluptatem', 1, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(2, 'https://via.placeholder.com/640x480.png/001188?text=nemo', 1, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(3, 'https://via.placeholder.com/640x480.png/0099aa?text=qui', 2, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(4, 'https://via.placeholder.com/640x480.png/001188?text=nihil', 2, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(5, 'https://via.placeholder.com/640x480.png/006622?text=pariatur', 3, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(6, 'https://via.placeholder.com/640x480.png/00ff66?text=at', 3, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(7, 'https://via.placeholder.com/640x480.png/00dd55?text=asperiores', 4, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(8, 'https://via.placeholder.com/640x480.png/00bb66?text=nisi', 4, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(9, 'https://via.placeholder.com/640x480.png/00aabb?text=quidem', 5, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(10, 'https://via.placeholder.com/640x480.png/001111?text=velit', 5, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(11, 'https://via.placeholder.com/640x480.png/0044ff?text=suscipit', 6, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(12, 'https://via.placeholder.com/640x480.png/004466?text=itaque', 6, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(13, 'https://via.placeholder.com/640x480.png/0066dd?text=voluptatem', 7, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(14, 'https://via.placeholder.com/640x480.png/002222?text=vel', 7, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(15, 'https://via.placeholder.com/640x480.png/0077aa?text=ea', 8, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(16, 'https://via.placeholder.com/640x480.png/003366?text=in', 8, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(17, 'https://via.placeholder.com/640x480.png/00eeee?text=ullam', 9, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(18, 'https://via.placeholder.com/640x480.png/00ccee?text=aliquid', 9, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(19, 'https://via.placeholder.com/640x480.png/0044cc?text=voluptatem', 10, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(20, 'https://via.placeholder.com/640x480.png/0022ff?text=similique', 10, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(21, 'https://via.placeholder.com/640x480.png/007766?text=exercitationem', 11, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(22, 'https://via.placeholder.com/640x480.png/00ff00?text=dolorem', 11, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(23, 'https://via.placeholder.com/640x480.png/00bbff?text=ea', 12, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(24, 'https://via.placeholder.com/640x480.png/00dddd?text=ratione', 12, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(25, 'https://via.placeholder.com/640x480.png/00aa33?text=sint', 13, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(26, 'https://via.placeholder.com/640x480.png/001144?text=ratione', 13, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(27, 'https://via.placeholder.com/640x480.png/00bb00?text=qui', 14, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(28, 'https://via.placeholder.com/640x480.png/0055bb?text=fugiat', 14, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(29, 'https://via.placeholder.com/640x480.png/00eebb?text=sit', 15, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(30, 'https://via.placeholder.com/640x480.png/000066?text=dicta', 15, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(31, 'https://via.placeholder.com/640x480.png/00cc88?text=itaque', 16, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(32, 'https://via.placeholder.com/640x480.png/00cc55?text=quos', 16, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(33, 'https://via.placeholder.com/640x480.png/004400?text=aut', 17, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(34, 'https://via.placeholder.com/640x480.png/0033aa?text=officiis', 17, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(35, 'https://via.placeholder.com/640x480.png/00dd99?text=eos', 18, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(36, 'https://via.placeholder.com/640x480.png/00ee88?text=eum', 18, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(37, 'https://via.placeholder.com/640x480.png/007744?text=omnis', 19, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(38, 'https://via.placeholder.com/640x480.png/00cc22?text=nam', 19, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(39, 'https://via.placeholder.com/640x480.png/003311?text=dicta', 20, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(40, 'https://via.placeholder.com/640x480.png/00bbcc?text=ducimus', 20, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(41, 'https://via.placeholder.com/640x480.png/00dd22?text=repudiandae', 21, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(42, 'https://via.placeholder.com/640x480.png/003366?text=qui', 21, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(43, 'https://via.placeholder.com/640x480.png/00bb66?text=sunt', 22, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(44, 'https://via.placeholder.com/640x480.png/00aa99?text=perferendis', 22, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(45, 'https://via.placeholder.com/640x480.png/00eebb?text=et', 23, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(46, 'https://via.placeholder.com/640x480.png/008844?text=voluptas', 23, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(47, 'https://via.placeholder.com/640x480.png/0099bb?text=rerum', 24, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(48, 'https://via.placeholder.com/640x480.png/00ee99?text=alias', 24, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(49, 'https://via.placeholder.com/640x480.png/000088?text=magni', 25, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(50, 'https://via.placeholder.com/640x480.png/00ee88?text=dolor', 25, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(51, 'https://via.placeholder.com/640x480.png/009911?text=dolorum', 26, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(52, 'https://via.placeholder.com/640x480.png/0077bb?text=ut', 26, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(53, 'https://via.placeholder.com/640x480.png/0033dd?text=sunt', 27, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(54, 'https://via.placeholder.com/640x480.png/00ee66?text=necessitatibus', 27, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(55, 'https://via.placeholder.com/640x480.png/0055ee?text=id', 28, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(56, 'https://via.placeholder.com/640x480.png/002244?text=quaerat', 28, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(57, 'https://via.placeholder.com/640x480.png/00ff22?text=unde', 29, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(58, 'https://via.placeholder.com/640x480.png/00ccee?text=nihil', 29, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(59, 'https://via.placeholder.com/640x480.png/004477?text=iusto', 30, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(60, 'https://via.placeholder.com/640x480.png/00ff11?text=enim', 30, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(61, 'https://via.placeholder.com/640x480.png/008822?text=sed', 31, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(62, 'https://via.placeholder.com/640x480.png/007722?text=similique', 31, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(63, 'https://via.placeholder.com/640x480.png/0055cc?text=quo', 32, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(64, 'https://via.placeholder.com/640x480.png/00ee44?text=sint', 32, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(65, 'https://via.placeholder.com/640x480.png/0044aa?text=non', 33, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(66, 'https://via.placeholder.com/640x480.png/00ddcc?text=sapiente', 33, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(67, 'https://via.placeholder.com/640x480.png/0000bb?text=ut', 34, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(68, 'https://via.placeholder.com/640x480.png/000033?text=enim', 34, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(69, 'https://via.placeholder.com/640x480.png/00aacc?text=ea', 35, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(70, 'https://via.placeholder.com/640x480.png/004488?text=odio', 35, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(71, 'https://via.placeholder.com/640x480.png/005544?text=doloremque', 36, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(72, 'https://via.placeholder.com/640x480.png/003333?text=id', 36, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(73, 'https://via.placeholder.com/640x480.png/00dd11?text=odio', 37, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(74, 'https://via.placeholder.com/640x480.png/004499?text=velit', 37, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(75, 'https://via.placeholder.com/640x480.png/0033bb?text=et', 38, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(76, 'https://via.placeholder.com/640x480.png/00eecc?text=voluptas', 38, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(77, 'https://via.placeholder.com/640x480.png/00aadd?text=repudiandae', 39, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(78, 'https://via.placeholder.com/640x480.png/009944?text=assumenda', 39, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(79, 'https://via.placeholder.com/640x480.png/009944?text=neque', 40, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(80, 'https://via.placeholder.com/640x480.png/000033?text=id', 40, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(81, 'https://via.placeholder.com/640x480.png/0066cc?text=est', 41, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(82, 'https://via.placeholder.com/640x480.png/00eeaa?text=mollitia', 41, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(83, 'https://via.placeholder.com/640x480.png/0099bb?text=impedit', 42, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(84, 'https://via.placeholder.com/640x480.png/008855?text=asperiores', 42, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(85, 'https://via.placeholder.com/640x480.png/00aa44?text=non', 43, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(86, 'https://via.placeholder.com/640x480.png/0077bb?text=eos', 43, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(87, 'https://via.placeholder.com/640x480.png/009944?text=voluptatem', 44, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(88, 'https://via.placeholder.com/640x480.png/002233?text=esse', 44, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(89, 'https://via.placeholder.com/640x480.png/006622?text=dolor', 45, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(90, 'https://via.placeholder.com/640x480.png/00aabb?text=enim', 45, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(91, 'https://via.placeholder.com/640x480.png/00ee77?text=voluptatem', 46, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(92, 'https://via.placeholder.com/640x480.png/0011ff?text=voluptatem', 46, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(93, 'https://via.placeholder.com/640x480.png/003377?text=ea', 47, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(94, 'https://via.placeholder.com/640x480.png/0077ee?text=ex', 47, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(95, 'https://via.placeholder.com/640x480.png/008866?text=incidunt', 48, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(96, 'https://via.placeholder.com/640x480.png/000077?text=ea', 48, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(97, 'https://via.placeholder.com/640x480.png/00cc88?text=qui', 49, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(98, 'https://via.placeholder.com/640x480.png/005555?text=ipsum', 49, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(99, 'https://via.placeholder.com/640x480.png/0044aa?text=autem', 50, '2024-11-19 20:16:44', '2024-11-19 20:16:44'),
(100, 'https://via.placeholder.com/640x480.png/000044?text=enim', 50, '2024-11-19 20:16:44', '2024-11-19 20:16:44');

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
(1, 'Cum ut eaque quo sed ut praesentium et. Qui dolorem cupiditate pariatur qui quibusdam enim. Necessitatibus aut consequatur culpa quis veritatis magni. Est et totam nesciunt vel.', 'Tempora atque libero molestiae.', 'pariatur-officiis-necessitatibus-est-animi-enim-quisquam-vero', 0, 6, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 5, NULL, 1, '1989-05-05 09:05:23', '1989-05-05 09:05:23'),
(2, 'Nobis consectetur repellat eveniet suscipit. Voluptas voluptas earum sint praesentium reprehenderit voluptas. Et numquam veniam eligendi rerum voluptatem velit laudantium. Exercitationem aut accusamus magnam sunt omnis.', 'Explicabo porro quia.', 'quos-magni-voluptatibus-aperiam-asperiores-enim-exercitationem-omnis-laborum', 0, 49, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 13, NULL, 4, '2021-03-23 04:03:47', '2021-03-23 04:03:47'),
(3, 'Asperiores tempore ad nostrum saepe et voluptas esse. Explicabo pariatur fugit laborum adipisci dolor. Quo accusamus a sit architecto itaque. Voluptas id eius culpa sed libero rerum. Neque fuga quia voluptatibus modi. Earum labore fugit consequuntur excepturi tempore aut voluptas.', 'Aperiam beatae.', 'quam-sint-non-non-occaecati-cumque-quasi', 1, 3, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 6, NULL, 1, '1993-07-08 06:07:48', '1993-07-08 06:07:48'),
(4, 'Sed placeat nostrum sequi et officia eum et. Architecto voluptates omnis maiores quam aliquam. Omnis corrupti saepe corrupti alias laudantium et et. Et voluptatem rem dolore qui velit non. Laboriosam doloremque facilis qui quia corporis.', 'Ad asperiores rerum.', 'voluptatem-itaque-praesentium-et-laboriosam-corporis', 1, 87, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 7, NULL, 2, '1971-11-15 04:11:54', '1971-11-15 04:11:54'),
(5, 'Voluptatum dolores dicta sed et. Nihil maiores error assumenda ut nulla saepe ad. Numquam eligendi necessitatibus est tempora voluptatum omnis molestiae. Et in harum nobis beatae quia magnam.', 'Aut fugiat accusamus.', 'libero-voluptatem-voluptates-nobis-fugiat', 1, 29, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 14, NULL, 1, '2010-12-13 04:12:29', '2010-12-13 04:12:29'),
(6, 'Qui ullam itaque iusto non maiores quisquam. Necessitatibus officia sint impedit rerum similique voluptas dolores. Tempore accusantium laudantium neque aspernatur. Dolor dolores velit vel praesentium. Et consequatur et quae magni totam numquam unde ut.', 'Delectus et autem possimus.', 'est-rem-dolorem-beatae-ipsa-laboriosam', 0, 96, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 1, NULL, 2, '2019-03-03 01:03:39', '2019-03-03 01:03:39'),
(7, 'Libero nihil qui rerum corrupti. Animi quia porro veniam asperiores atque. Quasi aperiam sequi voluptatem earum. Autem officia reprehenderit et est. Deserunt perspiciatis dolor nobis ipsa praesentium dolores est. Impedit similique amet vel.', 'Rem voluptate consequatur at.', 'quibusdam-ad-rerum-maxime-quo', 0, 26, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 16, NULL, 1, '2014-07-30 01:07:46', '2014-07-30 01:07:46'),
(8, 'Asperiores omnis harum numquam libero rerum aut. Molestias placeat eos et. Perspiciatis placeat unde et sed quia. Velit aspernatur sunt placeat assumenda illo explicabo dolores.', 'Iste unde ut et.', 'quis-atque-nostrum-ut-aut-quia', 1, 25, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 18, NULL, 2, '2022-12-22 02:12:11', '2022-12-22 02:12:11'),
(9, 'Qui suscipit sit doloremque beatae. Veritatis pariatur adipisci eaque in. Illo veniam quis velit error. Qui sit consequatur molestiae occaecati. Eos expedita deleniti porro tempore.', 'Quia possimus cumque.', 'fuga-odit-reiciendis-et-aut-vero', 1, 36, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 11, NULL, 2, '2016-06-02 05:06:56', '2016-06-02 05:06:56'),
(10, 'Sint quia error iusto eius voluptatem eligendi. Voluptas labore iusto quia vel qui ea. Nesciunt incidunt aut error unde. Et quia expedita soluta excepturi at.', 'Nihil consequatur aperiam rerum.', 'vel-fuga-perferendis-omnis-odio-velit-voluptas', 1, 52, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 17, NULL, 3, '2021-12-23 03:12:58', '2021-12-23 03:12:58'),
(11, 'Nostrum eius quis ipsam assumenda eos. Ab possimus quisquam illo. Expedita consequatur et qui et eos et placeat. Voluptas harum facere id. Quidem aut aspernatur qui labore. Temporibus molestias omnis id aut exercitationem dolorem. Ut labore dolores reprehenderit et velit molestias a.', 'Et id necessitatibus esse.', 'maxime-placeat-recusandae-sed-enim-quia-vel-et', 0, 97, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 16, NULL, 3, '1981-04-12 06:04:38', '1981-04-12 06:04:38'),
(12, 'Dicta quos est enim alias qui. Nulla modi debitis accusantium. Itaque quia dolorum molestiae. Ullam sapiente sapiente quam autem. Optio est atque dolores enim. Ab voluptatem praesentium ipsam. Delectus recusandae qui nemo voluptates veritatis fuga illo.', 'Labore officia ducimus occaecati a.', 'temporibus-nostrum-facere-facere-mollitia-non-facilis', 0, 29, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 11, NULL, 1, '1985-04-16 10:04:54', '1985-04-16 10:04:54'),
(13, 'Eveniet ut voluptatem optio occaecati voluptatem est. Numquam enim mollitia cum. Totam vero dolor dolor modi. Numquam mollitia illum dolor corrupti aspernatur.', 'Voluptatem ea maiores.', 'recusandae-sed-porro-exercitationem-nobis', 1, 77, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 13, NULL, 4, '1984-10-14 03:10:36', '1984-10-14 03:10:36'),
(14, 'Magnam magni repudiandae beatae ad consequatur. Aliquam quo consequatur omnis tenetur ipsum. Sed optio qui impedit nostrum sed. Saepe minus voluptate cumque sunt sapiente et commodi alias. Non culpa voluptate iste magnam velit aut eum sint. Tempora ea et sed.', 'Nulla repellendus.', 'non-totam-aut-est-porro-est', 0, 80, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 19, NULL, 3, '1987-01-05 10:01:09', '1987-01-05 10:01:09'),
(15, 'Esse doloribus ipsum enim est officiis. Quibusdam dolor non recusandae totam possimus. Autem quibusdam omnis sed libero. Occaecati corporis enim nihil qui quia repellendus quidem dignissimos. Occaecati adipisci atque recusandae assumenda quis. Voluptatem accusamus omnis totam quo sit fuga.', 'Tempore corrupti.', 'vel-odio-error-corrupti-sit-et-neque-rerum-nesciunt', 1, 86, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 6, NULL, 1, '2023-02-27 01:02:07', '2023-02-27 01:02:07'),
(16, 'Adipisci ipsam sed quaerat illo ex vero est. Ducimus et veritatis iste quasi ducimus quam omnis. Quaerat dolorum minima eveniet itaque deserunt tenetur itaque. Consequuntur qui qui corrupti architecto a harum nesciunt. Quam ut totam modi corporis labore iusto.', 'Dolorum dolorem fuga facere.', 'laborum-sit-omnis-sunt-totam-tenetur-officiis-ut', 0, 68, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 10, NULL, 4, '1986-01-29 09:01:29', '1986-01-29 09:01:29'),
(17, 'Est qui eos eos. Numquam quos earum pariatur exercitationem. Libero reprehenderit exercitationem non ut voluptates omnis. Soluta quo est dignissimos ut maxime.', 'Qui quia eveniet praesentium.', 'repellat-et-eveniet-ut-soluta-in', 1, 98, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 8, NULL, 1, '1987-10-14 07:10:27', '1987-10-14 07:10:27'),
(18, 'Praesentium recusandae qui accusantium blanditiis accusamus. Et dignissimos quod non voluptas ab. Rerum iste qui ratione quis. Laboriosam ut quisquam nobis quia totam eaque eos. Porro et iste excepturi aperiam quo ex quasi. Magni neque et aut odit ex deserunt. Vitae velit eos in rem iusto.', 'Ut vel sunt assumenda.', 'cum-perspiciatis-pariatur-ea-est-eos-et-laboriosam', 0, 27, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 7, NULL, 3, '1999-04-27 07:04:53', '1999-04-27 07:04:53'),
(19, 'Tempore numquam consectetur voluptate est. Quod nihil fugit nam qui ipsam. Aut quia sit rem ex. Et ratione molestiae repellat et placeat. Cumque consequatur provident quibusdam numquam. Maiores eum odit mollitia minima ut fugiat. Ipsam quis dolore dolor adipisci sint occaecati aliquam rerum.', 'Nisi blanditiis sunt nihil omnis.', 'dolor-molestias-maiores-quas-culpa-quibusdam-consequuntur', 1, 100, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 2, NULL, 2, '1993-12-09 06:12:26', '1993-12-09 06:12:26'),
(20, 'In sint reiciendis rerum recusandae dolor qui. Laudantium rem veritatis similique aut nam. Quasi impedit placeat in. Illo aspernatur et voluptas.', 'Hic rerum nemo.', 'neque-tenetur-quasi-et-qui-necessitatibus-aut-ullam', 0, 52, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 19, NULL, 1, '2015-02-05 00:02:51', '2015-02-05 00:02:51'),
(21, 'Iure libero atque aperiam rerum. Ut vel possimus qui quia eius. Voluptate perspiciatis sint consequuntur. Vitae saepe qui ex nostrum dolorem molestias molestiae. Sint sint illum accusamus odit iure cum. Totam sequi id ut occaecati quam. Enim velit aut praesentium vel a fuga.', 'Omnis vero.', 'corrupti-omnis-amet-dolorem', 0, 45, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 2, NULL, 1, '1999-01-15 09:01:36', '1999-01-15 09:01:36'),
(22, 'Laudantium ex doloribus culpa unde. Pariatur delectus a excepturi mollitia provident. Praesentium dolorem veritatis nihil soluta voluptates vel. Et sed ducimus voluptas mollitia repellat corporis eos harum. Aperiam et sed ab nesciunt in. Harum sunt ipsam enim et animi corrupti doloremque voluptates. Iure earum rerum cumque aliquid non labore delectus.', 'Voluptatem repudiandae esse.', 'dolore-atque-qui-perferendis', 1, 89, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 17, NULL, 1, '1993-10-29 06:10:33', '1993-10-29 06:10:33'),
(23, 'Vero eum voluptates et voluptate non illum. Sit reprehenderit rem et quisquam qui inventore ab. Temporibus vitae perferendis eveniet quia. Eius occaecati et voluptatem iste non et.', 'Eaque et dignissimos.', 'atque-molestiae-nostrum-consequatur-ad', 0, 78, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 5, NULL, 2, '1990-02-21 00:02:23', '1990-02-21 00:02:23'),
(24, 'Quisquam similique aut qui pariatur. Dolores quibusdam quod perferendis quo. Adipisci voluptas rerum a suscipit consequatur molestiae numquam. Blanditiis fuga ea rerum voluptates et illo. Vitae minus deleniti et vel. Iure a architecto impedit in eos eos explicabo.', 'Explicabo ipsa consequatur.', 'rem-vel-vero-dolorem-in-quam', 0, 17, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 7, NULL, 3, '1987-05-05 05:05:51', '1987-05-05 05:05:51'),
(25, 'Corporis ea tempore esse nemo. Maiores et non non non. Aut ea aut ducimus natus facere consectetur perferendis. Sint qui enim et perspiciatis ut quos est. Et sit iure qui illum. Numquam non voluptate quaerat eius.', 'Necessitatibus corrupti possimus odit.', 'eius-animi-aut-est-qui-perferendis', 0, 21, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 12, NULL, 1, '1988-10-10 09:10:55', '1988-10-10 09:10:55'),
(26, 'Culpa atque quidem debitis velit dolor. Est sapiente iste porro facilis ratione veniam eius. Voluptas voluptates rerum et ea quod. Laboriosam ullam ullam id eligendi.', 'Corrupti sed et eligendi.', 'ratione-dignissimos-adipisci-quia', 1, 67, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 16, NULL, 4, '1991-07-29 23:07:42', '1991-07-29 23:07:42'),
(27, 'Est et at et consequatur. Commodi porro ipsum quo eligendi voluptas perspiciatis velit. Voluptates aut quia doloribus numquam et consequatur. Nulla non nostrum soluta commodi.', 'Magni ea est officia.', 'velit-molestiae-non-occaecati-aut-dolores-voluptates-sapiente', 1, 90, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 9, NULL, 1, '2024-07-29 04:07:09', '2024-07-29 04:07:09'),
(28, 'Fugiat molestiae et ipsa molestiae. Dolorem sed consequatur velit consectetur a iusto enim occaecati. Magni quos quisquam autem libero. Et facere autem est officia ducimus placeat. Et cupiditate odit error ratione odit. Error rem eveniet qui ut.', 'Facilis quam occaecati.', 'asperiores-eligendi-consectetur-tempore-natus-qui', 0, 80, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 2, NULL, 3, '1972-02-23 03:02:51', '1972-02-23 03:02:51'),
(29, 'Saepe quia quibusdam voluptatem laboriosam. Et sit aliquam esse natus aperiam atque. Sint enim alias magnam voluptatem rerum ducimus dolor. Consequatur non numquam dolorum nihil atque corporis minus ab. Dicta voluptas vel et. Et quod unde dolorum beatae.', 'Qui eius sequi corporis.', 'qui-provident-ut-praesentium-animi-et', 0, 93, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 5, NULL, 3, '1976-10-04 01:10:05', '1976-10-04 01:10:05'),
(30, 'Laboriosam blanditiis id omnis et labore pariatur provident molestias. Vel et nostrum molestias corrupti quisquam at blanditiis. Eum ut voluptates veritatis. Fugiat et placeat ipsam et adipisci. Eos sed necessitatibus rem veniam eos est iure. Cupiditate numquam ea et vero suscipit eos magnam. Ut quo eos accusantium non.', 'Deleniti aut pariatur explicabo.', 'fuga-culpa-id-ut-quo', 0, 41, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 8, NULL, 1, '1978-12-16 07:12:18', '1978-12-16 07:12:18'),
(31, 'Sit sunt eos minima. Maiores quia ea et veritatis inventore quia. Tempore quos impedit amet ea. Quisquam tempora voluptatibus et autem laudantium quod fugiat voluptatem. Eos suscipit porro quod iure. Necessitatibus animi error voluptatibus qui officia. Quia omnis eos in aperiam quis.', 'Sit dolor et blanditiis.', 'esse-totam-vel-sit-saepe-quae-numquam', 1, 26, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 6, NULL, 3, '1986-11-25 05:11:27', '1986-11-25 05:11:27'),
(32, 'Ea voluptas et sed deleniti pariatur officiis. Voluptate dolorem id vel vel ipsa voluptas. Necessitatibus ullam quos autem sequi eos. In molestias consectetur atque iusto eligendi tenetur aperiam. Porro ratione quisquam incidunt error autem fugit. Iste atque magnam eligendi aut velit molestiae.', 'Pariatur rerum maiores impedit.', 'rerum-delectus-maxime-nam-non-unde-repellendus-qui', 1, 12, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 9, NULL, 4, '1973-05-04 08:05:57', '1973-05-04 08:05:57'),
(33, 'Ea fugiat quibusdam adipisci sit et. Qui qui beatae adipisci et dolorem unde itaque est. Qui quia voluptates earum et aliquid. Illo dolores quaerat quam sequi. Nam praesentium molestiae iste consequatur neque et. Qui sed quam quia autem consectetur sit.', 'Ipsam ut nostrum maxime.', 'modi-libero-nulla-et-nostrum-ut', 1, 43, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 8, NULL, 3, '2003-03-25 05:03:43', '2003-03-25 05:03:43'),
(34, 'Dolores animi doloremque itaque aut. Consequatur provident quod quisquam voluptatem consequatur rem. Quasi a inventore exercitationem non placeat. Odio occaecati est dicta non non.', 'Optio explicabo.', 'id-voluptatibus-est-rerum-laboriosam-aut-quae-dignissimos-ipsa', 1, 21, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 19, NULL, 1, '1998-10-15 22:10:46', '1998-10-15 22:10:46'),
(35, 'Quae rerum aut autem ad. Magnam temporibus assumenda accusantium quasi in. Dicta quibusdam qui ad sequi. Voluptate rerum magni rerum quis fugiat nihil et.', 'Accusantium consequatur repellat.', 'qui-distinctio-esse-aspernatur-sint-nemo-qui', 1, 83, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 14, NULL, 3, '1992-09-03 05:09:27', '1992-09-03 05:09:27'),
(36, 'Facere est sit sunt dolore voluptatem nobis sed. Autem nihil expedita vitae qui. Nisi omnis iste harum et. Cum cum veritatis debitis doloribus laboriosam saepe. Eum iusto repellendus qui fuga iure veniam.', 'Ut iure molestiae rem.', 'vero-quis-in-optio-possimus', 0, 99, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 2, NULL, 1, '1982-03-16 05:03:55', '1982-03-16 05:03:55'),
(37, 'Sapiente qui temporibus quos sed possimus molestiae libero. Asperiores rerum qui sequi optio. Sint sapiente expedita vero voluptates doloremque. Doloremque voluptatem expedita sunt doloribus laborum adipisci vitae. Et nihil distinctio nobis tempore illo enim.', 'Quaerat inventore consectetur et qui.', 'officiis-omnis-possimus-et', 1, 0, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 6, NULL, 2, '2009-09-21 08:09:35', '2009-09-21 08:09:35'),
(38, 'Aspernatur similique ipsum est ea. Eveniet consequatur cum autem placeat eum quia distinctio voluptatem. Quia non ullam dolores expedita. Alias neque officia quaerat est aliquid voluptatem. Consequatur nemo incidunt praesentium at eum. Iste labore perspiciatis eum et enim dolorum.', 'Tempore sapiente quae nobis itaque.', 'voluptatum-iure-soluta-dicta-minus-praesentium', 0, 72, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 16, NULL, 3, '2006-08-20 00:08:10', '2006-08-20 00:08:10'),
(39, 'Itaque quos magni est aut minus. Cum et facilis quia facere consequatur. Nesciunt nihil porro aut est impedit sequi. Nam eum nam inventore ullam minus. Rerum beatae repellendus rerum deserunt qui debitis aut. Voluptas eligendi atque commodi maxime omnis.', 'Ab eum nihil et.', 'iure-repellendus-officia-velit', 1, 85, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 8, NULL, 1, '2019-10-08 08:10:27', '2019-10-08 08:10:27'),
(40, 'Officiis deleniti ea officia dignissimos quasi nihil. Et dolorem nemo expedita ex harum recusandae delectus sint. Accusamus recusandae quia fugiat tempora. Velit odit omnis consequatur placeat.', 'Amet atque sed labore.', 'illo-id-nihil-nemo-amet-repellat-ex', 0, 80, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 3, NULL, 3, '1973-12-11 07:12:31', '1973-12-11 07:12:31'),
(41, 'Sunt voluptatum facere tenetur id. Omnis asperiores dolores perferendis in vitae molestias quidem. Perferendis nihil exercitationem nulla voluptas dolor. Quibusdam tenetur vel dolore quia doloribus quos. Sunt voluptatem aut qui fuga. Modi quia reiciendis cupiditate dolores.', 'Reiciendis alias vitae.', 'voluptatum-quae-odio-eaque-animi-molestias', 1, 45, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 9, NULL, 3, '1993-11-05 08:11:39', '1993-11-05 08:11:39'),
(42, 'Enim sint vel explicabo dolorum culpa asperiores. Doloribus est eos earum in nisi. Eaque et debitis sunt porro. Est facilis fuga et cupiditate. Libero et natus sed at tenetur veniam facilis assumenda. Sed ratione soluta iste in sit.', 'Ducimus ut.', 'quaerat-ipsa-dolorum-quam-assumenda', 1, 71, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 6, NULL, 2, '2017-03-01 02:03:11', '2017-03-01 02:03:11'),
(43, 'Ut commodi tempore enim minima. Dicta quia debitis nemo quia quo optio quo eum. Aut aspernatur maxime nesciunt molestiae voluptas magnam ratione. Excepturi reiciendis velit aliquid consequatur quas. Aut aperiam perspiciatis dicta ut iste accusamus.', 'Ut magni et vero.', 'quo-maxime-illum-dolorem-dignissimos-hic-suscipit-blanditiis', 1, 12, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 5, NULL, 2, '2013-08-26 06:08:16', '2013-08-26 06:08:16'),
(44, 'Consequatur autem architecto impedit. Quam blanditiis laboriosam laboriosam architecto soluta omnis. Consequuntur itaque quaerat rerum officiis velit dolorem nihil. Enim id sit consectetur dolores debitis cum necessitatibus. Voluptates voluptatum ea consectetur fugit maiores.', 'Unde sint ratione.', 'minima-ad-est-esse-ut-autem-enim-sequi-magni', 1, 5, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 19, NULL, 1, '2019-08-10 06:08:11', '2019-08-10 06:08:11'),
(45, 'Voluptas qui ipsum quia omnis. Quis ut fugiat eum. Eos consequatur rerum et eos et. Quis at qui corporis ratione eligendi nisi nihil. Quam eos et veniam.', 'Quod autem doloribus.', 'earum-est-est-inventore-voluptas-repellendus-modi', 0, 6, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 19, NULL, 2, '1988-10-05 01:10:28', '1988-10-05 01:10:28'),
(46, 'Quisquam necessitatibus sit et rerum. Quia culpa pariatur aut molestiae sit sit accusantium. Facilis adipisci corrupti dolorum dolores. Amet sunt alias nisi repudiandae odit. Dolorum magni illo amet non.', 'Esse explicabo totam earum.', 'cupiditate-nostrum-assumenda-tempora-iste-architecto-aut', 0, 10, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 12, NULL, 2, '2019-10-11 04:10:35', '2019-10-11 04:10:35'),
(47, 'Aut quo dolorem expedita molestias. Maiores vitae et distinctio magnam itaque. Corporis amet praesentium quasi voluptates rerum. Similique facilis atque voluptatem non consequatur possimus perferendis. Cum dignissimos ducimus consectetur ab qui. Cumque ea ad sed laudantium fuga autem.', 'A provident ut.', 'autem-voluptatem-dolorem-consequatur-inventore-est', 1, 41, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 2, NULL, 3, '1972-07-22 00:07:55', '1972-07-22 00:07:55'),
(48, 'Consequatur quo numquam inventore quis. Quas quae quisquam quaerat enim asperiores repellendus. Explicabo officiis delectus rem nostrum aperiam minus. Ratione reiciendis voluptatum voluptas accusamus vitae ut. Et ipsum est illum et at est. Saepe error iste itaque aut debitis. Vitae sit dolor impedit dolores eos consequatur maxime.', 'Et est est.', 'eum-et-pariatur-ex-earum-quo-ipsa-ut', 0, 93, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 0, 9, NULL, 3, '1995-10-27 07:10:42', '1995-10-27 07:10:42'),
(49, 'Dolorem fuga et corrupti ipsum magnam. Voluptatem ad saepe beatae. Voluptatum et aut quaerat voluptatem et facere. Magni consequatur sit numquam est eos earum.', 'Voluptatum et mollitia quis qui.', 'eum-quos-beatae-earum-temporibus', 1, 85, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 15, NULL, 3, '1999-11-27 01:11:33', '1999-11-27 01:11:33'),
(50, 'Optio aut placeat voluptas ratione. Ut enim maiores ullam maxime eaque nulla voluptas. Voluptates sint voluptatem explicabo. Facere aut et ducimus est. Sed sapiente aut impedit illo aut quae non.', 'Non rem autem et.', 'quo-maiores-et-consectetur-quaerat-reiciendis', 1, 41, 'small description for post to optimization seo', '[\"news\",\"posts\",\"sport\"]', 1, 19, NULL, 3, '2019-02-16 09:02:55', '2019-02-16 09:02:55');

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
(1, 'Eius autem.', 'http://www.ledner.com/rerum-voluptates-dolorum-magni-aliquam-error-aliquid', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(2, 'Ipsam ab.', 'http://www.jast.com/dolorem-vel-soluta-veniam-sapiente-autem-ut', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(3, 'Laudantium veniam.', 'http://medhurst.net/perferendis-voluptate-in-fugit.html', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(4, 'Dolorem deleniti.', 'http://hane.com/ut-illum-nihil-sit-vitae-et-et-temporibus', '2024-11-19 20:16:48', '2024-11-19 20:16:48'),
(5, 'Et voluptates.', 'http://www.steuber.org/dignissimos-doloremque-maiores-voluptatibus-laboriosam-deserunt', '2024-11-19 20:16:48', '2024-11-19 20:16:48');

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
(1, 'news', 'news@gmail.com', '01287587134', 'assets/frontend/img/uploads/setting/a098c6bf-db21-4b7b-a03c-bc52d7486dd31728917369.png', 'assets/frontend/img/uploads/setting/383cc034-efb6-4cd3-ab99-c9438db8aab91728917369.png', 'https://www.facebook.com', 'https://www.instagram.com', 'https://www.linkedin.com/in/hassan-mahmoud-b1305822a', 'https://www.twitter.com/', 'https://www.youtube.com', 'sede basher el Esawe', 'Alex', 'Egypt', 'Welcome to  News , your go-to source for the latest news and updates from around the world. Our platform provides a comprehensive range of articles covering politics, technology, health, entertainment, and more. With a commitment to delivering accurate and timely information, we strive to keep our readers informed and engaged. Whether you are looking for breaking news or in-depth analysis, News is here to deliver the stories that matter most to you', '2024-11-19 20:17:32', '2024-11-19 20:17:32');

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
(1, 'Ceasar Borer', 'cgulgowski@example.net', 'joe.rogahn', '279.890.2435', 'https://via.placeholder.com/640x480.png/00ff11?text=nemo', 0, 'Sierra Leone', 'North Ora', '541 Metz Glens Suite 919', '9', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'Lv2jJ6e2CG', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(2, 'Elmira Cormier', 'emanuel.zemlak@example.org', 'marquardt.jasen', '+13132525094', 'https://via.placeholder.com/640x480.png/00ccdd?text=est', 0, 'Argentina', 'West Mathew', '7721 Weimann Causeway Apt. 339', '4', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'KKySkwR6VR', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(3, 'Destany Windler', 'bridie.sauer@example.org', 'mara.howell', '(203) 601-5389', 'https://via.placeholder.com/640x480.png/00ff55?text=laboriosam', 0, 'Cook Islands', 'South Myrtis', '4976 Nader Court Apt. 040', '12', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'KEaKKzheuc', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(4, 'Maryjane Heathcote', 'taya.koch@example.com', 'nitzsche.lilian', '412.413.1620', 'https://via.placeholder.com/640x480.png/0099bb?text=neque', 1, 'Poland', 'Hoppebury', '237 Cassin Path', '10', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'UlEpOilWex', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(5, 'Josephine Mayer', 'amalia83@example.net', 'renner.jon', '573-895-2138', 'https://via.placeholder.com/640x480.png/00ccdd?text=iure', 1, 'Bhutan', 'New Jacksonton', '846 Littel Lake Apt. 107', '18', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', '8jXO12zS1q', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(6, 'Prof. Ismael Stokes I', 'stacy99@example.com', 'elsie95', '+18286935072', 'https://via.placeholder.com/640x480.png/0055cc?text=et', 1, 'India', 'Lake Xavierview', '6525 Verner Street', '15', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'uBiviO2dCC', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(7, 'Molly Jaskolski', 'qrolfson@example.org', 'grant.renner', '+1-505-505-6681', 'https://via.placeholder.com/640x480.png/00ff44?text=maxime', 0, 'Angola', 'Gleichnerstad', '740 Deshaun Viaduct Apt. 817', '20', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', '8hSsOPXBUu', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(8, 'Amir Borer', 'nchristiansen@example.org', 'lizeth.larson', '+12488765455', 'https://via.placeholder.com/640x480.png/0011aa?text=sit', 0, 'Saint Helena', 'West Florine', '6188 Era Spurs Suite 718', '14', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'oUFwORXEae', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(9, 'Mr. Wilfrid Kemmer Sr.', 'herman.therese@example.com', 'hoeger.finn', '(856) 938-8183', 'https://via.placeholder.com/640x480.png/003377?text=at', 1, 'Kuwait', 'Fadelshire', '943 Candice Branch', '16', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'GBLOiUwjCP', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(10, 'Lillian Boyer', 'bernhard.frieda@example.net', 'mohr.blair', '941.623.6826', 'https://via.placeholder.com/640x480.png/0077bb?text=voluptatibus', 0, 'Slovakia (Slovak Republic)', 'New Toneyshire', '459 Skiles Route Apt. 391', '4', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'AeUT9ilSKG', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(11, 'Magali Crist', 'ucremin@example.org', 'raegan.reichel', '848-889-6020', 'https://via.placeholder.com/640x480.png/0077cc?text=suscipit', 1, 'American Samoa', 'Lemkehaven', '6932 Lukas Falls', '20', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', '4uBijkI69y', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(12, 'Dr. Dino Keeling', 'bschamberger@example.net', 'luella.vandervort', '815.559.4956', 'https://via.placeholder.com/640x480.png/001122?text=in', 0, 'Somalia', 'East Marleeside', '965 Fae Hill', '14', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'kr2ATxJeMv', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(13, 'Mr. Candido Padberg', 'goldner.alverta@example.org', 'ukoch', '+1.346.439.6827', 'https://via.placeholder.com/640x480.png/0033dd?text=qui', 0, 'Japan', 'Gorczanymouth', '45560 Camille Drive', '9', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', '3mbHh2VIm7', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(14, 'Merritt Wilkinson', 'schoen.carter@example.net', 'sauer.camron', '279.460.7884', 'https://via.placeholder.com/640x480.png/00ccbb?text=dolores', 1, 'Bouvet Island (Bouvetoya)', 'Lake Estebanburgh', '7791 Tyshawn Rapids Apt. 366', '18', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'AARtmYeKQc', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(15, 'Jaida Kerluke', 'arden01@example.org', 'percy28', '445.682.3721', 'https://via.placeholder.com/640x480.png/0077dd?text=blanditiis', 1, 'Switzerland', 'Gregoriamouth', '1303 Bins Hill', '5', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'UQD7GiA3IC', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(16, 'Fausto Hackett', 'ashton14@example.net', 'jbode', '+14636509890', 'https://via.placeholder.com/640x480.png/003399?text=sint', 1, 'Pakistan', 'Carterhaven', '4352 Edyth Keys Suite 781', '6', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'EfKFDzp8nI', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(17, 'Dannie Cartwright', 'veum.kadin@example.net', 'ashly.dooley', '432-223-7726', 'https://via.placeholder.com/640x480.png/0022ee?text=sequi', 1, 'Senegal', 'Gerlachside', '9829 Prohaska Terrace', '16', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'QedKVlih4x', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(18, 'Kole Wolf', 'kory.hintz@example.com', 'qrempel', '(283) 591-8641', 'https://via.placeholder.com/640x480.png/0022cc?text=officiis', 1, 'Guatemala', 'Adahside', '298 Morissette Roads Apt. 232', '6', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'SUgiQUEIv0', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(19, 'Ms. Sierra Crooks', 'hackett.furman@example.org', 'harold.nolan', '(689) 767-4122', 'https://via.placeholder.com/640x480.png/00bbdd?text=incidunt', 0, 'Guyana', 'East Daytonport', '51396 Heidenreich Forks Apt. 206', '1', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'WG8OWm6UoX', '2024-11-19 20:16:43', '2024-11-19 20:16:43'),
(20, 'Noelia Marks', 'langosh.abby@example.net', 'ramon.crona', '+1-281-870-2060', 'https://via.placeholder.com/640x480.png/00aadd?text=quas', 1, 'Antarctica (the territory South of 60 deg S)', 'East Chanel', '48873 Pablo Curve', '20', '2024-11-19 20:16:43', '$2y$10$CNAM4DurMcZVcTk9K1LbI.d..LMyZg0BsN4WpN1micjRD1dqAfUIa', 'UgF6pByBVc', '2024-11-19 20:16:43', '2024-11-19 20:16:43');

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
