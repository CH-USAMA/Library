-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2025 at 03:00 PM
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
-- Database: `library_project_fyp`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `book_id` bigint(20) UNSIGNED DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED DEFAULT NULL,
  `teacher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` text NOT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `name`, `book_id`, `student_id`, `teacher_id`, `status`, `feedback`, `created_at`, `updated_at`) VALUES
(51, 'Blue', 42, 71, 13, 'Completed', 'asdasd', '2025-03-05 17:47:13', '2025-03-05 17:50:11'),
(52, 'Sharon Lott', 42, 71, 13, 'Completed', 'asdsadasd', '2025-03-05 17:59:40', '2025-03-05 17:59:59'),
(53, 'sdfdsf', 42, 71, 13, 'Completed', 'Feedback completed', '2025-03-05 18:00:10', '2025-03-10 16:50:11'),
(54, 'Kieran Francis', 42, 71, 13, 'Completed', 'asdasdasdas', '2025-03-05 18:02:10', '2025-03-05 18:04:08'),
(55, 'Newest Assignment by teacher', 42, 71, 62, 'Pending Feedback', NULL, '2025-03-05 20:36:15', '2025-03-10 16:51:20'),
(56, 'Harry potter assignment', 42, 71, 62, 'Completed', 'General feedback', '2025-03-05 20:50:27', '2025-03-05 20:52:49'),
(57, 'asdasdas', 42, 71, 13, 'Completed', NULL, '2025-03-10 17:02:11', '2025-03-10 17:05:03'),
(58, 'Anoter one', 42, 71, 13, 'Pending Feedback', NULL, '2025-03-10 17:05:27', '2025-03-10 17:05:36'),
(59, 'yaaaaaaaaaaaaaaa', 42, 71, 13, 'Not Completed', NULL, '2025-03-10 17:06:40', '2025-03-10 17:06:40'),
(60, 'this one is again another one', 42, 71, 13, 'Pending Feedback', NULL, '2025-03-10 17:17:51', '2025-03-10 17:51:07'),
(61, 'A assignment', 42, 71, 13, 'Pending Feedback', NULL, '2025-03-11 16:01:54', '2025-03-11 16:26:21');

-- --------------------------------------------------------

--
-- Table structure for table `assignments_questions`
--

CREATE TABLE `assignments_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assignment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `question_id` bigint(20) UNSIGNED DEFAULT NULL,
  `answer_field` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignments_questions`
--

INSERT INTO `assignments_questions` (`id`, `assignment_id`, `question_id`, `answer_field`, `created_at`, `updated_at`) VALUES
(24, 51, 8, 'sdfsdfdsf', '2025-03-05 17:47:13', '2025-03-05 17:47:25'),
(25, 51, 9, 'sdfsdfsdf', '2025-03-05 17:47:13', '2025-03-05 17:47:25'),
(26, 52, 8, 'sdfsdfsdf', '2025-03-05 17:59:40', '2025-03-05 17:59:50'),
(27, 52, 9, 'sdfsdfdsf', '2025-03-05 17:59:40', '2025-03-05 17:59:50'),
(28, 53, 8, 'ANSWERED', '2025-03-05 18:00:10', '2025-03-05 18:00:44'),
(29, 53, 9, 'ANSWERED', '2025-03-05 18:00:10', '2025-03-05 18:00:44'),
(30, 54, 8, 'Naswere normally', '2025-03-05 18:02:10', '2025-03-05 18:03:17'),
(31, 54, 9, 'answered normally', '2025-03-05 18:02:10', '2025-03-05 18:03:17'),
(32, 54, 10, 'answered normally', '2025-03-05 18:02:10', '2025-03-05 18:03:17'),
(33, 55, 8, 'asdsad', '2025-03-05 20:36:15', '2025-03-10 16:51:20'),
(34, 55, 9, 'asdasdasd', '2025-03-05 20:36:15', '2025-03-10 16:51:20'),
(35, 56, 8, 'Question 1 answer', '2025-03-05 20:50:27', '2025-03-05 20:51:52'),
(36, 56, 9, 'Question 2 answer', '2025-03-05 20:50:27', '2025-03-05 20:51:52'),
(37, 57, 8, 'asdasdasd', '2025-03-10 17:02:11', '2025-03-10 17:02:18'),
(38, 58, 8, 'asd', '2025-03-10 17:05:27', '2025-03-10 17:05:36'),
(39, 58, 9, 'asd', '2025-03-10 17:05:27', '2025-03-10 17:05:36'),
(40, 59, 8, 'a', '2025-03-10 17:06:40', '2025-03-10 17:06:48'),
(41, 60, 8, 'asdasd', '2025-03-10 17:17:51', '2025-03-10 17:38:25'),
(42, 60, 9, 'asdasdsa', '2025-03-10 17:17:51', '2025-03-10 17:38:25'),
(43, 61, 8, 'sdf', '2025-03-11 16:01:54', '2025-03-11 16:26:21'),
(44, 61, 9, 'wd', '2025-03-11 16:01:54', '2025-03-11 16:26:21');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `or_level` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `created_at`, `updated_at`, `publisher`, `author`, `title`, `genre`, `category`, `description`, `or_level`, `content`, `image`) VALUES
(42, '2025-02-04 12:38:43', '2025-02-04 12:38:43', 'Penguin LTD', 'JK Rowling', 'Harry Potter and the Philosopher\'s Stone', NULL, 'Fiction', 'Harry Potter, an eleven-year-old orphan, discovers that he is a wizard and is invited to study at Hogwarts. Even as he escapes a dreary life and enters a world of magic, he finds trouble awaiting him.', '10', NULL, '1738672723.jpg'),
(43, '2025-02-04 12:49:41', '2025-02-04 12:49:41', 'Penguin LTD', 'Jeremy Strong', 'Romans are coming', NULL, 'Fiction', 'Harry Potter, an eleven-year-old orphan, discovers that he is a wizard and is invited to study at Hogwarts. Even as he escapes a dreary life and enters a world of magic, he finds trouble awaiting him.', '10', NULL, '1738673381.jpg'),
(44, '2025-02-04 12:50:36', '2025-02-04 12:50:36', 'Penguin LTD', 'Christine Engel', 'Stars And Space', NULL, 'Fiction', 'Space Stars and More!', '10', NULL, '1738673436.jpeg'),
(45, '2025-02-22 13:10:40', '2025-02-22 13:10:40', 'Mollit explicabo Vo', 'Fugiat culpa conseq', 'space book', NULL, 'Inventore necessitat', 'Similique cillum mol', 'Deleniti nostrum con', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_genre`
--

CREATE TABLE `book_genre` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED DEFAULT NULL,
  `genre_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_genre`
--

INSERT INTO `book_genre` (`id`, `book_id`, `genre_id`, `created_at`, `updated_at`) VALUES
(22, 45, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('shusanttamang@outlook.com|127.0.0.1', 'i:1;', 1740768446),
('shusanttamang@outlook.com|127.0.0.1:timer', 'i:1740768446;', 1740768446),
('student10@outlook.com|127.0.0.1', 'i:1;', 1741197833),
('student10@outlook.com|127.0.0.1:timer', 'i:1741197833;', 1741197833);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `form_classes`
--

CREATE TABLE `form_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `teacher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `substitute_teacher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_classes`
--

INSERT INTO `form_classes` (`id`, `class_name`, `teacher_id`, `substitute_teacher_id`, `created_at`, `updated_at`) VALUES
(1, 'Admin Form Class', NULL, NULL, '2025-03-12 16:53:17', '2025-03-12 16:53:17');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `genre_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `genre_name`, `created_at`, `updated_at`) VALUES
(7, 'Space', '2025-02-04 12:30:35', '2025-03-04 21:11:54'),
(8, 'History', '2025-02-04 12:30:45', '2025-02-04 12:30:45'),
(9, 'Fantasy', '2025-02-04 12:30:51', '2025-02-04 12:30:51'),
(10, 'Romance', '2025-02-04 12:33:22', '2025-02-04 12:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `genre_user`
--

CREATE TABLE `genre_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `genre_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genre_user`
--

INSERT INTO `genre_user` (`id`, `genre_id`, `user_id`, `created_at`, `updated_at`) VALUES
(39, 7, 70, NULL, NULL),
(40, 8, 71, NULL, NULL),
(41, 7, 60, NULL, NULL);

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
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_13_153655_create_students_table', 1),
(5, '2025_01_14_122751_add__date__of__birth_to_users_table', 1),
(6, '2025_01_14_130938_add_role_to_users_table', 1),
(7, '2025_01_16_124258_add_additonal_users_fields_to_users', 1),
(8, '2025_01_16_140045_create_notes_table', 1),
(9, '2025_01_19_155434_create_books_table', 1),
(10, '2025_01_19_155455_create_reviews_table', 1),
(11, '2025_01_22_165704_add_created_to_assigned_to_to_notes_table', 1),
(12, '2025_01_25_164035_add_fields_to_books_table', 1),
(13, '2025_01_25_193815_add_content_to_books_table', 1),
(14, '2025_01_29_134406_add_image_to_books_table', 1),
(15, '2025_01_29_172741_add__f_k_book_id_to_users_table', 1),
(16, '2025_01_31_125230_create_genres_table', 1),
(17, '2025_01_31_150939_create_book_genres', 1),
(18, '2025_02_01_195252_create_genre_user', 1),
(19, '2025_02_03_210333_drop_notes_table', 1),
(20, '2025_02_03_210944_create_notes_table', 1),
(22, '2025_02_14_124402_create_questions_table', 2),
(25, '2025_02_22_133829_create_assignments_table', 3),
(26, '2025_02_26_135657_drop_assignmentstable', 4),
(27, '2025_02_26_140553_create_assignments_table', 5),
(28, '2025_02_26_140721_create_assignments_questions_table', 6),
(29, '2025_02_26_142828_alter_datatype_status', 7),
(30, '2025_03_05_112349_drop_feedback_column', 8),
(31, '2025_03_05_112459_add_feedback_column_to_assignments', 9),
(32, '2025_03_05_124114_alter_feedback_datatype_assignments', 10),
(33, '2025_03_10_145331_add_columns_to_reviews', 11),
(34, '2025_03_12_134804_create_form_classes_table', 12),
(35, '2025_03_12_135304_add_assigned_class', 13),
(36, '2025_03_12_135705_rename_id', 14),
(37, '2025_03_12_142912_create_form_classes_teacher', 15),
(38, '2025_03_12_160252_drop_form_classes_teachers', 16),
(39, '2025_03_12_160450_add_teacher_id_to_form_classes', 17),
(40, '2025_03_12_162516_add_substitute_teacher_to_form_classes', 18);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `teacher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_text` varchar(255) DEFAULT NULL,
  `question_type` varchar(255) DEFAULT NULL,
  `book_id` bigint(20) UNSIGNED DEFAULT NULL,
  `teacher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question_text`, `question_type`, `book_id`, `teacher_id`, `created_at`, `updated_at`) VALUES
(8, 'quesiont1', 'Infer', 42, 13, '2025-02-27 17:13:03', '2025-02-27 17:13:03'),
(9, 'question 2', 'Infer', 42, 13, '2025-02-27 17:13:11', '2025-02-27 17:13:11'),
(10, 'Questions 2123123', 'Infer', 42, 13, '2025-03-04 21:43:16', '2025-03-04 21:43:16');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `book_id` bigint(20) UNSIGNED DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `created_at`, `updated_at`, `book_id`, `student_id`, `rating`, `comment_text`) VALUES
(4, '2025-03-10 17:51:15', '2025-03-10 17:51:15', 42, 71, 5, 'okay this is completed'),
(5, '2025-03-11 16:27:15', '2025-03-11 16:27:15', 42, 71, 5, 'ss'),
(6, '2025-03-11 16:27:16', '2025-03-11 16:27:16', 42, 71, 5, 'ss'),
(7, '2025-03-12 13:30:13', '2025-03-12 13:30:13', 42, 71, 5, 'Review new button mode');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4AsDGgCNVmgsz5GEVoFAQ7xfwsfAteFR9WjdI4ad', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVzNZVUs1eEJrMTV4a0Q4aFdrYUNtNlNFc2lyUG81aHhiYTZzWmJibSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9lZGl0Z2VucmUvMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEzO3M6NDoiYXV0aCI7YToxOntzOjIxOiJwYXNzd29yZF9jb25maXJtZWRfYXQiO2k6MTc0MTc4NTUwNzt9fQ==', 1741800535),
('s3DrJDXdS1I5n2HZyYp7e4MZ702WmffjO3wLAGrL', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRUp6UmUzY1VxNXBtN3hJR21uZ1Z4MTFiNWtNcjZvZWdXTUxIUWN5MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdHVkZW50c2xpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxMztzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3NDE4ODA3ODE7fX0=', 1741882173);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `or_level` varchar(255) DEFAULT NULL,
  `current_book_name` varchar(255) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `assigned_class` varchar(255) DEFAULT NULL,
  `interests` varchar(255) DEFAULT NULL,
  `book_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `date_of_birth`, `role`, `or_level`, `current_book_name`, `topic`, `assigned_class`, `interests`, `book_id`) VALUES
(13, 'admin', 'admin@gmail.com', NULL, '$2y$12$gpxT6FwJiK8qglynWkrd5.YpeQuNBNLnKncsVgU8lnX0fqq.lOg2O', NULL, '2025-01-15 15:41:30', '2025-01-15 15:41:30', NULL, 'admin', NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'Kendall Bullock', 'student@gmail.com', NULL, '$2y$12$2pDltTpAr8U0H7xzv5RFw.56eIIBZsDunFdg0IwdwRqK06ZAEtG1q', NULL, '2025-02-04 12:33:01', '2025-02-04 12:35:03', '2020-06-01', 'student', '10', 'no book found', 'No Topic', 'Class 1A', NULL, NULL),
(60, 'Raven Randolph', 'selehehal@mailinator.com', NULL, '$2y$12$eJb3P9/hOO4sbqccxFCX5OoF44DWY.4nMVaeoahO5tels.BxcjxOO', NULL, '2025-02-04 12:34:16', '2025-03-11 16:17:12', '2019-02-20', 'student', '6', 'space book', 'Dolor laborum Natus', 'Year 2', NULL, 45),
(61, 'Jenette Mosley', 'tedeqazu@mailinator.com', NULL, '$2y$12$.CQnmctXHbtNfRcpU5pcdOE7/t.Kj9fWp2lSqarZCorwzQfNX2Fye', NULL, '2025-02-04 12:37:11', '2025-02-04 12:37:21', '2020-07-14', 'student', '10', 'no book found', 'Est sed ea duis temp', 'Year 3', NULL, NULL),
(62, 'Mrs. Ann', 'teacher@gmail.com', NULL, '$2y$12$poQEESAReJq4BGFMZJRX4.R.0DNEt3GdSjF3Vt6q.H7pDM1dpwb8G', NULL, '2025-02-04 12:57:31', '2025-02-04 12:57:31', '2025-02-01', 'teacher', NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'Miss Green', 'teacher2@gmail.com', NULL, '$2y$12$DnyBJgPH1S6xtuXBjmJDK.6PClSuz5//3We/EZKkX2EJ81MxgRhBe', NULL, '2025-02-04 12:58:10', '2025-02-04 12:58:10', '2024-12-12', 'teacher', NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'Emerald Pratt', 'mexeji@mailinator.com', NULL, '$2y$12$SZqWcXEetFp3NZDLOAtHg.jH25xTnEIukuyyT8CuW/GsqR1KyKYAK', NULL, '2025-02-04 13:12:57', '2025-02-22 12:55:44', '2012-01-27', 'student', '12', 'no book found', 'Audition', 'Year 2B', NULL, NULL),
(70, 'Wallace Whitaker', 'Whitaker@mailinator.com', NULL, '$2y$12$ty4jdLby.O.uet.gw4./6.eplqWw1102c8jmUf4MJrr1jwyRQnCCq', NULL, '2025-03-04 15:37:11', '2025-03-04 15:37:43', '1981-02-12', 'student', '12', 'space book', 'what is a topic', '2a', NULL, 45),
(71, 'Keefe Yang', 'student10@gmail.com', NULL, '$2y$12$QcSRnu.tMPPY/b1L.B/qa.k1T3dLwMHzkUfNkC.s71zK8g4/uSjm2', NULL, '2025-03-05 17:32:37', '2025-03-05 17:32:37', '1977-03-21', 'student', 'Tempore in perspici', 'Damon Rios', 'Beatae quia voluptas', 'Voluptas repudiandae', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignments_book_id_foreign` (`book_id`),
  ADD KEY `assignments_student_id_foreign` (`student_id`),
  ADD KEY `assignments_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `assignments_questions`
--
ALTER TABLE `assignments_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignments_questions_assignment_id_foreign` (`assignment_id`),
  ADD KEY `assignments_questions_question_id_foreign` (`question_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_genre`
--
ALTER TABLE `book_genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_genre_book_id_foreign` (`book_id`),
  ADD KEY `book_genre_genre_id_foreign` (`genre_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `form_classes`
--
ALTER TABLE `form_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_classes_teacher_id_foreign` (`teacher_id`),
  ADD KEY `form_classes_substitute_teacher_id_foreign` (`substitute_teacher_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genre_user`
--
ALTER TABLE `genre_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genre_user_genre_id_foreign` (`genre_id`),
  ADD KEY `genre_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_teacher_id_foreign` (`teacher_id`),
  ADD KEY `notes_student_id_foreign` (`student_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_book_id_foreign` (`book_id`),
  ADD KEY `questions_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_book_id_foreign` (`book_id`),
  ADD KEY `reviews_student_id_foreign` (`student_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_book_id_foreign` (`book_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `assignments_questions`
--
ALTER TABLE `assignments_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `book_genre`
--
ALTER TABLE `book_genre`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_classes`
--
ALTER TABLE `form_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `genre_user`
--
ALTER TABLE `genre_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignments_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assignments_questions`
--
ALTER TABLE `assignments_questions`
  ADD CONSTRAINT `assignments_questions_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignments_questions_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `book_genre`
--
ALTER TABLE `book_genre`
  ADD CONSTRAINT `book_genre_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_genre_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `form_classes`
--
ALTER TABLE `form_classes`
  ADD CONSTRAINT `form_classes_substitute_teacher_id_foreign` FOREIGN KEY (`substitute_teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `form_classes_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `genre_user`
--
ALTER TABLE `genre_user`
  ADD CONSTRAINT `genre_user_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `genre_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notes_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
