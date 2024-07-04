-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 25 2024 г., 21:46
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `APTUBE`
--
CREATE DATABASE IF NOT EXISTS `APTUBE` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `APTUBE`;

-- --------------------------------------------------------

--
-- Структура таблицы `censor`
--

CREATE TABLE `censor` (
  `censor_id` int NOT NULL,
  `censor_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `censor`
--

INSERT INTO `censor` (`censor_id`, `censor_name`) VALUES
(3, 'fack'),
(7, 'хуй');

-- --------------------------------------------------------

--
-- Структура таблицы `Class`
--

CREATE TABLE `Class` (
  `class_id` int NOT NULL,
  `class_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Comments`
--

CREATE TABLE `Comments` (
  `comment_id` int NOT NULL,
  `video_id` int DEFAULT NULL,
  `comment_text` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Comments`
--

INSERT INTO `Comments` (`comment_id`, `video_id`, `comment_text`, `comment_date`, `user_id`) VALUES
(38, 10, 'gg', '2024-02-23 13:15:19', 9),
(41, 9, 'asd', '2024-02-23 14:09:34', 9),
(42, 13, 'ячс', '2024-02-23 15:40:10', 9),
(43, 12, 'asd', '2024-02-24 09:58:09', 18),
(44, 12, 'asd', '2024-02-24 09:59:15', 9),
(50, 10, 'на хуй', '2024-02-24 10:03:35', 9),
(62, 13, 'фыв', '2024-02-24 10:41:25', 9);

-- --------------------------------------------------------

--
-- Структура таблицы `content`
--

CREATE TABLE `content` (
  `content_id` int NOT NULL,
  `content_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `heign` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `like_count` int DEFAULT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `content_img` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `content`
--

INSERT INTO `content` (`content_id`, `content_name`, `title`, `heign`, `content_date`, `user_id`, `like_count`, `status_id`, `content_img`) VALUES
(9, 'Desktop 2024.02.20 - 15.17.20.04.mp4', 'qwe', 'qwe', '2024-02-20 10:26:27', 9, NULL, 2, ''),
(10, 'Desktop 2024.02.20 - 15.17.20.04.mp4', 'qwe', 'qwe', '2024-02-20 11:41:49', 9, NULL, 2, 'kit.jpg'),
(12, 'Desktop 2024.02.20 - 15.17.20.04.mp4', 'qwe', ' qwe', '2024-02-20 12:46:15', 9, NULL, 2, 'Desktop 2024.02.20 - 15.17.20.04.mp4'),
(13, 'Desktop 2024.02.20 - 15.17.20.04.mp4', 'qwe', ' qwe', '2024-02-20 12:47:40', 9, NULL, 2, 'kit.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `like_dislike`
--

CREATE TABLE `like_dislike` (
  `like_id` int NOT NULL,
  `like_count` int DEFAULT NULL,
  `dislike_count` int DEFAULT NULL,
  `content_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `like_dislike`
--

INSERT INTO `like_dislike` (`like_id`, `like_count`, `dislike_count`, `content_id`, `user_id`) VALUES
(3, 1, NULL, 9, 9),
(4, 1, NULL, 13, 9),
(5, 1, NULL, 9, 18),
(6, 1, NULL, 10, 9),
(7, 1, NULL, 10, 18),
(8, 1, NULL, 12, 18);

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `status_id` int NOT NULL,
  `name_status` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`status_id`, `name_status`) VALUES
(1, 'V obrabotke'),
(2, 'Access'),
(3, 'Delete');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` int NOT NULL DEFAULT '1',
  `profile_picture` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'profile_3.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `login`, `password`, `role`, `profile_picture`) VALUES
(4, 'Ñ Ð»Ð¾Ñ… Ñ Ð³ÐµÐ¹ Ñ Ñ‡Ð¼Ð¾ ', '76d80224611fc919a5d54f0ff9fba446', 1, 'profile_3.jpg'),
(7, 'renal', '76d80224611fc919a5d54f0ff9fba446', 1, 'profile_3.jpg'),
(9, 'admin', '21232f297a57a5a743894a0e4a801fc3', 2, 'profile_3.jpg'),
(15, 'asd', '7815696ecbf1c96e6894b779456d330e', 1, 'profile_3.jpg'),
(17, 'qweq', '76d80224611fc919a5d54f0ff9fba446', 1, 'profile_3.jpg'),
(18, 'qwe', '76d80224611fc919a5d54f0ff9fba446', 1, 'profile_3.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `censor`
--
ALTER TABLE `censor`
  ADD PRIMARY KEY (`censor_id`);

--
-- Индексы таблицы `Class`
--
ALTER TABLE `Class`
  ADD PRIMARY KEY (`class_id`);

--
-- Индексы таблицы `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Индексы таблицы `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`content_id`);

--
-- Индексы таблицы `like_dislike`
--
ALTER TABLE `like_dislike`
  ADD PRIMARY KEY (`like_id`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `censor`
--
ALTER TABLE `censor`
  MODIFY `censor_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `Class`
--
ALTER TABLE `Class`
  MODIFY `class_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Comments`
--
ALTER TABLE `Comments`
  MODIFY `comment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT для таблицы `content`
--
ALTER TABLE `content`
  MODIFY `content_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `like_dislike`
--
ALTER TABLE `like_dislike`
  MODIFY `like_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
