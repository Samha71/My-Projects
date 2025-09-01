-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2025 at 11:40 PM
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
-- Database: `it_courses`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `description`, `category`, `image_url`) VALUES
(1, 'Web Development', 'Learn HTML, CSS, JavaScript, and more...', 'Web Development', 'images/web_dev.jpg'),
(2, 'Data Science', 'Explore data analysis, machine learning, and statistics.', 'Data Science', 'images/data.jpg'),
(3, 'Machine Learning', 'Understand the core concepts of machine learning.', 'AI & ML', 'images/machine.jpeg'),
(4, 'Cloud Computing', 'Master cloud infrastructure, AWS, Azure, and more.', 'Cloud Computing', 'images/cloud_comp.jpg'),
(5, 'Frontend Fundamentals', 'Deep dive into HTML5, CSS3, and responsive design.', 'Web Development', 'images/frontend.jpg'),
(6, 'JavaScript Mastery', 'Master JavaScript from basics to advanced concepts.', 'Web Development', 'images/script.jpg'),
(7, 'React for Beginners', 'Learn to build dynamic interfaces with React.js.', 'Web Development', 'images/react.jpg'),
(8, 'Backend Development with Node.js', 'Build powerful backend services using Node.js and Express.', 'Web Development', 'images/node.jpg'),
(9, 'Python for Data Science', 'Use Python to clean, analyze, and visualize data.', 'Data Science', 'images/python.jpg'),
(10, 'Data Analysis with Pandas', 'Analyze data efficiently with Pandas library.', 'Data Science', 'images/analysis.jpg'),
(11, 'Data Visualization with Matplotlib & Seaborn', 'Create insightful plots and charts.', 'Data Science', 'images/data-science.jpg'),
(12, 'Statistics for Data Science', 'Understand statistical methods for data analysis.', 'Data Science', 'images/statistics.jpg'),
(13, 'Deep Learning with TensorFlow', 'Train neural networks using TensorFlow.', 'AI & ML', 'images/stats.jpg'),
(14, 'Natural Language Processing', 'Build NLP applications like chatbots and text summarizers.', 'AI & ML', 'images/nlp.jpg'),
(15, 'Computer Vision Basics', 'Work with image data and build vision models.', 'AI & ML', 'images/vision.jpg'),
(16, 'AWS Essentials', 'Learn the core AWS services and architecture.', 'Cloud Computing', 'images/aws.jpg'),
(17, 'Microsoft Azure Fundamentals', 'Get started with Azure cloud solutions.', 'Cloud Computing', 'images/tech.jpg'),
(18, 'Google Cloud Platform Basics', 'Understand GCP services and workflows.', 'Cloud Computing', 'images/gcp.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
