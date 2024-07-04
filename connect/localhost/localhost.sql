-- phpMyAdmin SQL Dump
-- version 5.1.3-1.el7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Фев 13 2024 г., 08:37
-- Версия сервера: 10.10.2-MariaDB
-- Версия PHP: 7.4.33

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
-- Структура таблицы `Class`
--

CREATE TABLE `Class` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Comments`
--

CREATE TABLE `Comments` (
  `comment_id` int(11) NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `comment_text` varchar(255) DEFAULT NULL,
  `comment_date` timestamp NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Comments`
--

INSERT INTO `Comments` (`comment_id`, `video_id`, `comment_text`, `comment_date`, `user_id`) VALUES
(21, 10, 'asdasd', '2024-02-10 09:06:28', 6),
(22, 10, 'zxczxc', '2024-02-10 09:06:31', 6),
(23, 10, 'hvhvh', '2024-02-10 09:06:50', 7),
(24, 10, 'Ñ„Ñ‹Ð²Ñ„Ñ‹Ð²', '2024-02-10 09:46:41', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `content`
--

CREATE TABLE `content` (
  `content_id` int(11) NOT NULL,
  `content_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `heign` varchar(255) NOT NULL,
  `content_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `like_count` int(255) DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `content`
--

INSERT INTO `content` (`content_id`, `content_name`, `title`, `heign`, `content_date`, `user_id`, `like_count`, `status_id`) VALUES
(10, 'ron.jpg', '123123', '123123', '2024-02-10 09:06:23', 6, 1, 2),
(11, 'ron.jpg', '332', '32', '2024-02-10 09:46:55', 7, 108, 2),
(12, 'localhost.sql', 'ÑÑ‡Ñ', 'Ð¯Ð§Ð¡', '2024-02-12 12:36:12', 8, NULL, 2),
(13, 'bg.jpg', 'zxc', 'asd', '2024-02-12 12:48:55', 8, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `like_dislike`
--

CREATE TABLE `like_dislike` (
  `like_id` int(11) NOT NULL,
  `like_count` int(11) DEFAULT NULL,
  `dislike_count` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `like_dislike`
--

INSERT INTO `like_dislike` (`like_id`, `like_count`, `dislike_count`, `content_id`, `user_id`) VALUES
(123, 1, NULL, 11, 6),
(124, 1, NULL, 10, 6),
(125, 1, NULL, 10, 8),
(126, 1, NULL, 11, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `name_status` varchar(20) NOT NULL
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
  `user_id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `profile_picture` varchar(255) DEFAULT 'profile_3.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `login`, `password`, `role`, `profile_picture`) VALUES
(4, 'Ñ Ð»Ð¾Ñ… Ñ Ð³ÐµÐ¹ Ñ Ñ‡Ð¼Ð¾ ', '76d80224611fc919a5d54f0ff9fba446', 1, 'profile_3.jpg'),
(5, 'Ñ Ð³ÐµÐ¹ Ñ Ñ‡Ð¼Ð¾', '202cb962ac59075b964b07152d234b70', 1, 'profile_3.jpg'),
(6, 'admin', '21232f297a57a5a743894a0e4a801fc3', 2, 'like.svg'),
(7, 'renal', '76d80224611fc919a5d54f0ff9fba446', 1, 'profile_3.jpg'),
(8, 'qwe', '76d80224611fc919a5d54f0ff9fba446', 1, 'profile_3.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `videos`
--

CREATE TABLE `videos` (
  `video_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `upload_date` date NOT NULL DEFAULT current_timestamp(),
  `likes_count` int(99) NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Class`
--
ALTER TABLE `Class`
  ADD PRIMARY KEY (`class_id`);

--
-- Индексы таблицы `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `Comments_FK` (`video_id`);

--
-- Индексы таблицы `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`content_id`),
  ADD KEY `content_FK` (`user_id`);

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
-- Индексы таблицы `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`video_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Class`
--
ALTER TABLE `Class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Comments`
--
ALTER TABLE `Comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `content`
--
ALTER TABLE `content`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `like_dislike`
--
ALTER TABLE `like_dislike`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `videos`
--
ALTER TABLE `videos`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
