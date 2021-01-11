-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 11 2021 г., 11:56
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'motherboard', NULL, NULL),
(2, 'cpu', NULL, NULL),
(3, 'gpu', NULL, NULL),
(4, 'ram', NULL, NULL),
(5, 'ssd&hdd', NULL, NULL),
(8, 'power supply', NULL, NULL),
(9, 'computer case', NULL, NULL),
(10, 'monitors', NULL, NULL),
(11, 'consoles', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `maintexts`
--

CREATE TABLE `maintexts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `small_body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `showhide` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `maintexts`
--

INSERT INTO `maintexts` (`id`, `name`, `small_body`, `body`, `url`, `lang`, `showhide`, `created_at`, `updated_at`) VALUES
(1, 'О магазине', 'Наш магазин создан для вас', '<p>4theGamers</p>\r\n<p>компьютерный магазин</p>', 'about', 'ru', 'show', NULL, NULL),
(2, 'Конструктор', 'Описание конструктора маленькое', 'Описание конструктора большое и с html-кодом', 'construct', '', 'show', NULL, NULL),
(3, 'Отзывы', 'Тут коротко об отзывах', 'Отзывы полно', 'overview', '', 'show', NULL, NULL),
(4, 'Контакты', 'Телефон', 'Контакты компании - все', 'contact', '', 'show', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_10_28_161942_create_maintexts_table', 2),
(5, '2019_11_06_164029_create_products_table', 3),
(6, '2019_11_06_164114_create_categories_table', 3),
(7, '2019_12_24_200021_create_orders_table', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `small_body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `showhide` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `category_id` int(11) NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `body`, `small_body`, `showhide`, `category_id`, `picture`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(8, 'ASUS TUF B450M-Pro Gaming', '105', '<p>mATX, сокет AMD AM4, чипсет AMD B450, память 4xDDR4, слоты: 2xPCIe x16, 1xPCIe x1, 2xM.2</p>', 'AM4', '0', 1, '21_01_08_12_37_45.jpg', 2, 'new', '2021-01-07 19:26:43', '2021-01-08 09:37:45'),
(9, 'Gigabyte X570 Aorus Elite', '200', 'ATX, сокет AMD AM4, чипсет AMD X570, память 4xDDR4, слоты: 2xPCIe x16, 2xPCIe x1, 2xM.2', 'AM4', '0', 1, '21_01_07_10_57_38.jpg', 2, 'new', '2021-01-07 19:57:38', '2021-01-07 19:57:38'),
(10, 'MSI B460M-A Pro', '100', 'mATX, сокет Intel LGA1200, чипсет Intel B460, память 2xDDR4, слоты: 1xPCIe x16, 2xPCIe x1, 1xM.2', 'LGA1200', '0', 1, '21_01_08_01_18_50.jpg', 2, 'new', '2021-01-07 22:18:50', '2021-01-07 22:18:50'),
(11, 'Ryzen 5 3600', '205', '<p>Matisse, AM4, 6 ядер, частота 4.2/3.6 ГГц, кэш 3 МБ + 32 МБ, техпроцесс 7 нм, TDP 65W</p>', 'AMD AM4', '0', 2, '21_01_08_10_56_20.jpg', 2, 'new', '2021-01-07 22:21:49', '2021-01-08 19:56:20'),
(12, 'Intel Core I5-10400F', '190', '<p>Comet Lake, LGA1200, 6 ядер, частота 4.3/2.9 ГГц, кэш 12 МБ, техпроцесс 14 нм, TDP 65W</p>', 'Intel LGA1200', '0', 2, '21_01_08_10_55_35.jpg', 2, 'new', '2021-01-07 22:27:03', '2021-01-08 19:55:36'),
(13, 'Palit GeForce GTX 1650 Super StormX', '280', 'NVIDIA GeForce GTX 1650 Super, базовая частота 1530 МГц, Turbo-частота 1770 МГц, 1280sp, частота памяти 12000 МГц, 128 бит, доп. питание: 6 pin, 2 слота, DVI, HDMI, DisplayPort', '4Gb', '0', 3, '21_01_08_01_38_04.jpg', 2, 'new', '2021-01-07 22:38:04', '2021-01-07 22:38:04'),
(14, 'Gigabyte Radeon RX 5500 XT', '400', 'AMD Radeon RX 5500 XT, базовая частота 1647 МГц, Turbo-частота 1845 МГц, 1408sp, частота памяти 14000 МГц, 128 бит, доп. питание: 8 pin, 2.3 слота, HDMI, DisplayPort', '8Gb', '0', 3, '21_01_08_10_25_40.jpg', 2, 'new', '2021-01-08 07:25:41', '2021-01-08 07:25:41'),
(15, 'HyperX Fury 2x8GB', '100', 'DDR4 2 модуля, частота 3200 МГц, CL 16T, тайминги 16-18-18, напряжение 1.35 В', 'DDR4', '0', 4, '21_01_08_10_28_10.jpg', 2, 'new', '2021-01-08 07:28:10', '2021-01-08 07:28:10'),
(16, 'SSD Samsung 970 Evo 500GB MZ-V7E500', '100', 'M.2, PCI Express 3.0 x4 (NVMe 1.3), контроллер Samsung Phoenix, микросхемы 3D TLC NAND, последовательный доступ: 3400/2300 MBps, случайный доступ: 370000/450000 IOps', '500 Gb', '0', 5, '21_01_08_10_34_11.jpg', 2, 'new', '2021-01-08 07:34:12', '2021-01-08 07:34:12'),
(17, 'DeepCool DA700 Aurora', '75', 'активная PFC, КПД 85%, бронзовый сертификат, вентилятор 1x140 мм, модульные кабели, 12V 54 А', '700W', '0', 8, '21_01_08_10_38_07.jpg', 2, 'new', '2021-01-08 07:38:07', '2021-01-08 07:38:07'),
(18, 'DeepCool Matrexx 55 Mesh ADD-RGB 4F DP-ATX', '90', 'Mid Tower, блок питания отсутствует, для плат ATX/micro-ATX/eATX/mini-ITX, 4 вентилятора, 2xUSB 2.0, 1xUSB 3.0, цвет черный', 'ATX', '0', 9, '21_01_08_10_41_55.jpg', 2, 'new', '2021-01-08 07:41:55', '2021-01-08 07:41:55'),
(19, 'Samsung C24RG50FQI', '200', '23.5\", 16:9, 1920x1080, VA, изогнутый (1800R), 144 Гц, FreeSync, интерфейсы HDMI+DisplayPort', 'Full HD Curved', '0', 10, '21_01_08_10_45_11.jpg', 2, 'new', '2021-01-08 07:45:12', '2021-01-08 07:45:12'),
(20, 'Sony PlayStation 5', '499', '825 ГБ, разрешение игр - 4K UHD (2160p), поддержка HDR, в комплекте 1 игра', 'PS5', '0', 11, '21_01_08_10_47_53.jpg', 2, 'new', '2021-01-08 07:47:53', '2021-01-08 07:47:53'),
(21, 'ASRock B460M Pro4', '120', '<p>mATX, сокет Intel LGA1200, чипсет Intel B460, память 4xDDR4, слоты: 2xPCIe x16, 1xPCIe x1, 2xM.2</p>', 'LGA1200', '0', 1, '21_01_11_10_15_35.jpg', 2, 'new', '2021-01-11 07:15:35', '2021-01-11 07:15:35'),
(22, 'MSI Z490-A Pro', '200', '<p>ATX, сокет Intel LGA1200, чипсет Intel Z490, память 4xDDR4, слоты: 2xPCIe x16, 3xPCIe x1, 2xM.2</p>', 'LGA1200', '0', 1, '21_01_11_10_49_06.jpg', 2, 'new', '2021-01-11 07:49:06', '2021-01-11 07:49:06');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mikhalkevich', 'mikhalkevich@ya.ru', NULL, '$2y$10$.fanysOVb4.Hy3JCM1d.nemMsdT/FtFd1/P9j/nLARgmGgEXMiIma', NULL, '2019-11-06 12:56:58', '2019-11-06 12:56:58'),
(2, 'Dmitry', 'forzavettel@yandex.ru', NULL, '$2y$10$TNn/kZUluymQFuG/NrHZcOwGFj7KwXJsjcTxIK2fIAAg7xTED8AA2', NULL, '2020-12-25 09:13:01', '2020-12-25 09:13:01');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `maintexts`
--
ALTER TABLE `maintexts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `maintexts`
--
ALTER TABLE `maintexts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
