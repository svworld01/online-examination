-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2017 at 09:58 AM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `axamination`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `last_login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `last_login`) VALUES
(100, 'SV', 'admin@gmail.com', 'saurabh', ''),
(101, 'saurabh', 'sv@gmail.com', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL,
  `exam_type` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `total_que` int(3) NOT NULL,
  `result_date` varchar(50) NOT NULL,
  `mpq` int(3) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`exam_id`, `exam_type`, `subject`, `date`, `total_que`, `result_date`, `mpq`, `status`) VALUES
(102, 'Random', 'JDBC', '12/12/2014', 10, '12/02/2015', 3, 'Completed'),
(106, 'Random', 'HINDI', '12/12/2012', 10, '12/5/103`', 2, 'NEW');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `op_a` text NOT NULL,
  `op_b` text NOT NULL,
  `op_c` text NOT NULL,
  `op_d` text NOT NULL,
  `answer` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `exam_id`, `question`, `op_a`, `op_b`, `op_c`, `op_d`, `answer`) VALUES
(1, 101, 'this is just a demo questions...', 'ngldfn', 'nl', 'nnl', 'nlnk', 'A'),
(2, 106, 'njf jfo ', 'noijoijkop', ' o', 'ni', 'ni', 'B'),
(3, 106, 'fdkm', 'KMLm', 'klkm', 'km', 'km', 'B'),
(4, 106, 'fdkm', 'KMLm', 'klkm', 'km', 'km', 'B'),
(5, 106, 'fdkm', 'KMLm', 'klkm', 'km', 'km', 'B'),
(6, 106, 'fdkm', 'KMLm', 'klkm', 'km', 'km', 'B'),
(7, 106, 'fnslk', 'bjl', 'lknkl', 'mkl', 'mkl', 'A'),
(8, 106, 'cnfjdsk', 'nlnfdkj', 'nlmlk', 'nlk', 'nlk', 'A'),
(9, 106, 'fsk', 'mkm', 'km', 'k', 'k', 'A'),
(10, 106, 'nklmlk', 'mkl', 'mlk', 'm', 'm', 'B'),
(11, 106, 'mkl', 'mlk', 'mkl', 'ml', 'ml', 'A'),
(12, 102, 'fdsfsdnj', 'n', 'jn', 'nj', 'nj', 'A'),
(13, 102, 'mvdskmvklsd', 'mkm', 'klm', 'm', 'm', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `stu_id` int(11) NOT NULL,
  `reg_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `last_login` varchar(20) NOT NULL DEFAULT 'New',
  `form_status` varchar(20) NOT NULL DEFAULT 'Step2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`stu_id`, `reg_id`, `name`, `email`, `password`, `last_login`, `form_status`) VALUES
(1, '', 'Saurabh', 'svworld01@gmail.com', '123', '2372017 1526', 'Completed'),
(2, '19720172', 'Sudsvdskblkk', 's@gmail.com', '123', '1972017 015', 'Completed'),
(3, '19720173', 'dsnjkflk', 'student@gmail.com', 'student', '1972017 026', 'Completed'),
(4, '22720174', 'saybjdsbfuiwb', 'ssssss@gmail.com', '123', '2272017 1638', 'Step2'),
(5, '23720175', 'test1', 'test1@gmail.com', '123', '2372017 916', 'Step2'),
(6, '23720176', 'test2', 'test2@gmail.com', 'test2', '2372017 931', 'Step2'),
(7, '23720177', 'test3', 'test3@gmail.com', '123456', '2372017 934', 'Step2'),
(8, '23720178', 'test4', 'test4@gmail.com', '123', '2372017 944', 'Completed'),
(9, '23720179', 'test5', 'test5@gmail.com', '123', '2372017 1352', 'Completed'),
(10, '237201710', 'hehehe', 'he@gmail.com', '123', '2372017 235', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `stu_answer`
--

CREATE TABLE `stu_answer` (
  `id` int(11) NOT NULL,
  `stu_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `que_id` int(11) NOT NULL,
  `answer` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stu_answer`
--

INSERT INTO `stu_answer` (`id`, `stu_id`, `exam_id`, `que_id`, `answer`) VALUES
(1, 1, 102, 12, 'A'),
(2, 1, 102, 13, 'B'),
(3, 9, 102, 12, 'A'),
(4, 9, 102, 12, 'A'),
(5, 10, 106, 2, 'B'),
(6, 10, 106, 3, 'B'),
(7, 10, 106, 4, 'D');

-- --------------------------------------------------------

--
-- Table structure for table `stu_profile`
--

CREATE TABLE `stu_profile` (
  `profile_id` int(11) NOT NULL,
  `stu_id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `religion` varchar(50) NOT NULL,
  `nationality` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `pin` int(6) NOT NULL,
  `mob_number` varchar(15) NOT NULL,
  `img` text,
  `status` varchar(20) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stu_profile`
--

INSERT INTO `stu_profile` (`profile_id`, `stu_id`, `fname`, `mname`, `dob`, `gender`, `category`, `religion`, `nationality`, `address`, `pin`, `mob_number`, `img`, `status`) VALUES
(1, 1, 'AAA', 'NNN', '2017-01-01', 'Male', 'GENERAL', 'agn', 'v', 'sdfg', 123456, '123467890', '17795787_2055392714717566_3318585973139265056_n.jpg', 'Active'),
(2, 2, 'nfldfk', 'nlnlknmlk', '2017-07-13', 'Male', 'GENERAL', 'sdf', 'sdf', 'sdfv', 123456, '1234567890', '1.jpg', 'Active'),
(3, 3, 'sfather', 'smother', '2017-07-07', 'Male', 'SC/ST', '123', 'sd', 'sdf', 123456, '1234567890', '2.jpg', 'Active'),
(4, 4, 'bdjkan', 'mvfkdmvl', '2017-07-20', 'Male', 'GENERAL', 'estrdy', 'dfgh', 'dsfg', 1234, '123', NULL, 'Active'),
(5, 5, 'tf', 'tm', '2017-07-07', 'Male', 'OBC', 'sdcv', 'sd', 'ssd  dd', 123456, '1234567890', NULL, 'Active'),
(7, 6, 'bilbji', 'jk', '2017-07-21', 'Male', 'GENERAL', 'dgh', 'sdf', 'sdf', 123456, '1237890', NULL, 'Active'),
(8, 7, 'nfdsjl', 'bjk', '2017-07-07', 'Male', 'OBC', '12345', 'dfgd', 'ferg', 123456, '1234567890', NULL, 'Active'),
(10, 8, 'fnjos', 'jofd', '2017-07-27', 'Female', 'GENERAL', ' fjlsd', 'njd', 'njfldn', 123456, '1234567890', '17903829_2060769264179911_4485583877712213641_n.jpg', 'Active'),
(12, 9, 'fbskl', 'nlkm', '2017-07-05', 'Male', 'OBC', 'fsdg', 'vdg', 'dssdg', 224125, '8808875882', '17903829_2060769264179911_4485583877712213641_n.jpg', 'Active'),
(14, 10, 'hhee', 'hhhww', '2017-06-30', 'Male', 'GENERAL', 'fds', 'ff', 'ffew', 123, '1234567890', 'ISTS.png', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`stu_id`),
  ADD UNIQUE KEY `reg_id` (`reg_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `stu_answer`
--
ALTER TABLE `stu_answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stu_profile`
--
ALTER TABLE `stu_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `stu_id` (`stu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `stu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `stu_answer`
--
ALTER TABLE `stu_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `stu_profile`
--
ALTER TABLE `stu_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
