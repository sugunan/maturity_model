-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: aiops.ca7zbewmumiq.us-east-1.rds.amazonaws.com
-- Generation Time: Apr 08, 2024 at 02:18 PM
-- Server version: 8.0.35
-- PHP Version: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `survey`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int NOT NULL,
  `question_id` int DEFAULT NULL,
  `answer` text,
  `recomendation` text,
  `is_default` int NOT NULL DEFAULT '0',
  `answer_order` int DEFAULT NULL,
  `points` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `question_id`, `answer`, `recomendation`, `is_default`, `answer_order`, `points`) VALUES
(1, 1, 'Never assessed or high level assessment was done', 'Consider conducting a comprehensive SRE assessment to identify areas for improvement and prioritize actions', 1, 1, 0),
(2, 1, 'Assessed and preparing an action plan', 'Continue refining the action plan based on ongoing assessments and adjust priorities as needed', 0, 2, 5),
(3, 1, 'Assessed in detail and actively deploying the action plan', NULL, 0, 3, 10),
(4, 2, 'Nothing defined', 'Develop a well-defined SRE charter outlining roles, responsibilities, and goals to provide clarity and direction', 1, 1, 0),
(5, 2, 'Partially defined; experimenting in pockets', 'Continue refining the charter, expanding it to cover all aspects of your organization\'s SRE practices', 0, 2, 5),
(6, 2, 'Defined, tested and rolled out actively', NULL, 0, 3, 10),
(7, 4, 'Only technical monitoring and measures', 'Begin implementing SLOs and error budgets to measure and improve service reliability', 1, 1, 0),
(8, 4, 'SLOs defined and monitored, but no error budgets', 'Establish error budgets to enforce reliability goals and refine SLOs based on incident learnings', 0, 2, 5),
(9, 4, 'SLOs reflect customer experience and error budgets with consequences are in force', NULL, 0, 3, 10),
(10, 5, 'More than 4 hours', 'Focus on reducing mean time to recovery (MTTR) by identifying and addressing bottlenecks in incident response processes', 1, 1, 0),
(11, 5, '1-4 hours', 'Continue optimizing incident response processes for even faster recovery times', 0, 2, 5),
(12, 5, 'Less than 1 hour', NULL, 0, 3, 10),
(13, 6, 'Reactive management', 'Implement proactive capacity planning based on trend analysis to ensure scalability and prevent performance issues', 1, 1, 0),
(14, 6, 'Mostly proactive via trend analysis', 'Continuously optimize capacity planning, leveraging automation for dynamic scalability as needed', 0, 2, 5),
(15, 6, 'Fully automated and proactive with chaos engineering', NULL, 0, 3, 10),
(16, 7, 'None or minimal monitoring; technical measures like infra and log analytics only; monitoring is not standardized', 'Establish standardized observability across the entire technology stack, including application layers, with comprehensive dashboards and views for enhanced visibility', 1, 1, 0),
(17, 7, 'Visibility of issues and performance of more than 1 layer (e.g. application) with different dashboards and views for each; standardized monitoring solution', 'Continue evolving observability capabilities to incorporate advanced analytics and predictive insights for proactive issue detection and resolution', 0, 2, 5),
(18, 7, 'Integrated end-to-end view of all interactions on the system at all layers of the IT system(s) with clear correlation capability', NULL, 0, 3, 10),
(19, 8, 'Not utilized or only for ticket noise reduction', 'Explore and implement AI-driven incident diagnosis to enhance efficiency and accuracy in issue resolution', 1, 1, 0),
(20, 8, 'Assists in diagnosis', 'Implement AI models for anomaly detection and enhance automatic correlation of events for quicker issue identification', 0, 2, 5),
(21, 8, 'Plays a key role in diagnosis, resolution and prediction', NULL, 0, 3, 10),
(22, 9, 'No active measures or based on thresholds only', 'Implement AI models for anomaly detection and enhance automatic correlation of events for quicker issue identification', 1, 1, 0),
(23, 9, 'Anomalies detected using AI models; minimal automatic correlation of events', 'Continue refining AI-based anomaly detection and correlation algorithms to improve accuracy and reduce false positives', 0, 2, 5),
(24, 9, 'Proactively and continuously refined AI models for anomaly detection with causal analysis run via AI-based automation', NULL, 0, 3, 10),
(25, 10, 'Not integrated', 'Integrate predictive analytics into IT operations to anticipate potential issues and proactively address them', 1, 1, 0),
(26, 10, 'Partially integrated', 'Further integrate predictive analytics across IT operations, expanding coverage and refining models based on continuous learning', 0, 2, 5),
(27, 10, 'Fully integrated', NULL, 0, 3, 10),
(28, 11, 'Rarely', 'Increase the frequency of AI-driven contributions to performance optimization and decision-making, leveraging insights for continuous improvement', 1, 1, 0),
(29, 11, 'Occasionally', 'Strive for regular and proactive AI-driven contributions to decision-making and performance optimization, incorporating feedback loops for continuous enhancement', 0, 2, 5),
(30, 11, 'Frequently', NULL, 0, 3, 10),
(31, 12, 'Not in use or experimenting in isolation', 'Integrate LLMs into IT Operations for enhanced decision support and knowledge retrieval', 1, 1, 0),
(32, 12, 'In use independently to assist operations, but not integrated', 'Develop seamless integration of LLMs into existing operations workflows, ensuring effective utilization for improved outcomes', 0, 2, 5),
(33, 12, 'Fully integrated into operations workflows and actively used', NULL, 0, 3, 10),
(34, 13, 'None or limited involvement of AI', 'Increase AI involvement to regularly generate and update knowledge resources, minimizing manual efforts', 1, 1, 0),
(35, 13, 'Occasionally used to generate knowledge articles with significant manual effort to complete', 'Optimize AI algorithms for knowledge resource creation, reducing manual efforts and ensuring up-to-date and accurate information', 0, 2, 5),
(36, 13, 'Refined and augmented LLM models generate and refine knowledge articles with limited manual intervention required', NULL, 0, 3, 10),
(37, 14, 'No role', 'Expand the role of Gen AI to actively participate in sorting, preliminary responses, and initial ticket resolution', 1, 1, 0),
(38, 14, 'Assists in sorting and preliminary responses', 'Further integrate Gen AI into customer support workflows, automating more ticket resolution steps for increased efficiency', 0, 2, 5),
(39, 14, 'Fully manages and resolves tickets', NULL, 0, 3, 10),
(40, 15, 'No role', 'Incorporate Gen AI into continuous improvement cycles for generating insights, identifying areas for automation, and suggesting solutions', 1, 1, 0),
(41, 15, 'Used in isolation to generate automation code or suggest solutions', 'Collaborate Gen AI with the Operations team, creating a feedback loop for ongoing improvements based on AI-driven insights and recommendations', 0, 2, 5),
(42, 15, 'Fully integrated into the workflow to generate code for automation, test and validate its efficacy', NULL, 0, 3, 10),
(43, 16, 'Never', 'Implement regular AI-generated recommendations for issue resolution and request fulfillment, with continuous monitoring and improvement', 1, 1, 0),
(44, 16, 'Rarely or occasionally, but has a high likelihood of being incorrect', 'Enhance AI models to improve accuracy and reliability of recommendations, increasing the frequency of reliable AI-driven suggestions', 0, 2, 5),
(45, 16, 'Regularly and consistently correct recommendations received', NULL, 0, 3, 10),
(46, 17, 'Less than 25%', 'Increase automation efforts to target 25-50% automation in IT operations', 1, 1, 0),
(47, 17, '25-50%', 'Continue expanding automation efforts to achieve higher than 50% automation', 0, 2, 5),
(48, 17, 'More than 50%', NULL, 0, 3, 10),
(49, 18, 'Customized independent scripts', 'Transition to using IPA/RPA tools alongside custom scripts, and initiate a clean-up and streamlining activity', 1, 1, 0),
(50, 18, 'Using IPA / RPA tools and custom scripts; requires a clean-up and streamlining activity', 'Standardize and optimize automation workflows, ensuring efficient use of IPA/RPA tools with minimal custom scripts', 0, 2, 5),
(51, 18, 'Well-defined automation process and standardized framework using IPA tools with customizations as plugins', NULL, 0, 3, 10),
(52, 19, 'None', 'Implement automation for some RCAs to improve efficiency and reduce resolution time', 1, 1, 0),
(53, 19, 'Some RCAs', 'Increase the percentage of automated RCAs, leveraging machine learning for advanced analysis and faster issue resolution', 0, 2, 5),
(54, 19, 'Majority of RCAs', NULL, 0, 3, 10),
(55, 20, 'Hardly automated', 'Increase automation of routine tasks to improve operational efficiency', 1, 1, 0),
(56, 20, 'Partially automated', 'Implement automation for remaining routine tasks, focusing on end-to-end process automation for maximal efficiency', 0, 2, 5),
(57, 20, 'Mostly automated with benefits measured', NULL, 0, 3, 10),
(58, 21, 'Minimal', 'Identify areas where errors persist and enhance automation to minimize errors significantly', 1, 1, 0),
(59, 21, 'Significant in certain areas', 'Continue refining automation to address specific areas and extend its impact to further reduce errors across all operations', 0, 2, 5),
(60, 21, 'Central to all areas', NULL, 0, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int NOT NULL,
  `survey_id` int DEFAULT NULL,
  `category` varchar(128) DEFAULT NULL,
  `question` text,
  `question_order` int DEFAULT NULL,
  `question_type` int DEFAULT '1' COMMENT '1-radio, 2-text',
  `weightage` float(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `survey_id`, `category`, `question`, `question_order`, `question_type`, `weightage`) VALUES
(1, 5, 'SRE', 'Have you assessed your state of SRE in detail?', 1, 1, 0.10),
(2, 5, 'SRE', 'Do you maintain a clear SRE charter in your organization?', 2, 1, 0.10),
(4, 5, 'SRE', 'Have you embraced SLOs and error budgets?', 3, 1, 0.20),
(5, 5, 'SRE', 'How quickly does your organization typically recover from a major incident or failure?', 4, 1, 0.30),
(6, 5, 'SRE', 'How does your organization manage service capacity and scalability?', 5, 1, 0.30),
(7, 5, 'AIOps', 'To what extent do you have observability in your technology stack?', 6, 1, 0.10),
(8, 5, 'AIOps', 'How is AI utilized in incident diagnosis and resolution in your organization?', 7, 1, 0.20),
(9, 5, 'AIOps', 'How actively do you use AI to detect anomalies and correlate issues in your systems?', 8, 1, 0.20),
(10, 5, 'AIOps', 'How integrated are predictive analytics in your IT operations?', 9, 1, 0.20),
(11, 5, 'AIOps', 'How often does AI contribute to performance optimization and decision-making during operations?', 10, 1, 0.30),
(12, 5, 'Gen AI', 'Are Large Language Models (LLMs) in use within your organization\'s IT Operations?', 11, 1, 0.20),
(13, 5, 'Gen AI', 'How is AI utilized in creating and updating knowledge resources for IT operations?', 12, 1, 0.10),
(14, 5, 'Gen AI', 'What role does Gen AI play in managing and resolving customer support tickets (for even a % of tickets)?', 13, 1, 0.20),
(15, 5, 'Gen AI', 'What role does Gen AI play in your Operations team\'s continuous improvement cycles?', 14, 1, 0.20),
(16, 5, 'Gen AI', 'How often do you receive AI-generated recommendations for issue resolution and request fulfillment?', 15, 1, 0.30),
(17, 5, 'Automation', 'What % of your IT operations processes would you say are automated?', 16, 1, 0.30),
(18, 5, 'Automation', 'How standardized is your IT operations automation approach?', 17, 1, 0.10),
(19, 5, 'Automation', 'What % of root cause analyses (RCA) in your IT Operations is currently automated?', 18, 1, 0.20),
(20, 5, 'Automation', 'To what extent are routine and repetitive tasks automated?', 19, 1, 0.10),
(21, 5, 'Automation', 'How effectively has automation reduced errors in your operations?', 20, 1, 0.30);

-- --------------------------------------------------------

--
-- Table structure for table `question_answer`
--

CREATE TABLE `question_answer` (
  `user_id` int NOT NULL,
  `answer_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `question_answer`
--

INSERT INTO `question_answer` (`user_id`, `answer_id`) VALUES
(1, 1),
(3, 1),
(5, 1),
(6, 1),
(7, 1),
(10, 1),
(13, 1),
(15, 1),
(16, 1),
(17, 1),
(19, 1),
(22, 1),
(29, 1),
(31, 1),
(32, 1),
(8, 2),
(9, 2),
(14, 2),
(21, 2),
(24, 2),
(25, 2),
(26, 2),
(28, 2),
(30, 2),
(4, 3),
(11, 3),
(12, 3),
(18, 3),
(20, 3),
(23, 3),
(27, 3),
(3, 4),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(10, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(19, 4),
(22, 4),
(31, 4),
(1, 5),
(9, 5),
(12, 5),
(20, 5),
(25, 5),
(26, 5),
(27, 5),
(28, 5),
(29, 5),
(30, 5),
(4, 6),
(11, 6),
(18, 6),
(21, 6),
(23, 6),
(24, 6),
(32, 6),
(5, 7),
(6, 7),
(7, 7),
(10, 7),
(13, 7),
(14, 7),
(15, 7),
(16, 7),
(17, 7),
(19, 7),
(20, 7),
(22, 7),
(25, 7),
(26, 7),
(27, 7),
(29, 7),
(31, 7),
(32, 7),
(1, 8),
(3, 8),
(30, 8),
(4, 9),
(8, 9),
(9, 9),
(11, 9),
(12, 9),
(18, 9),
(21, 9),
(23, 9),
(24, 9),
(28, 9),
(3, 10),
(4, 10),
(5, 10),
(6, 10),
(7, 10),
(8, 10),
(10, 10),
(13, 10),
(14, 10),
(15, 10),
(16, 10),
(17, 10),
(19, 10),
(20, 10),
(30, 10),
(1, 11),
(9, 11),
(12, 11),
(22, 11),
(29, 11),
(31, 11),
(32, 11),
(11, 12),
(18, 12),
(21, 12),
(23, 12),
(24, 12),
(25, 12),
(26, 12),
(27, 12),
(28, 12),
(1, 13),
(3, 13),
(4, 13),
(5, 13),
(6, 13),
(7, 13),
(8, 13),
(10, 13),
(13, 13),
(16, 13),
(17, 13),
(19, 13),
(20, 13),
(22, 13),
(30, 13),
(9, 14),
(14, 14),
(15, 14),
(23, 14),
(25, 14),
(26, 14),
(28, 14),
(29, 14),
(31, 14),
(32, 14),
(11, 15),
(12, 15),
(18, 15),
(21, 15),
(24, 15),
(27, 15),
(1, 16),
(3, 16),
(4, 16),
(5, 16),
(6, 16),
(7, 16),
(8, 16),
(10, 16),
(13, 16),
(16, 16),
(17, 16),
(19, 16),
(20, 16),
(21, 16),
(24, 16),
(9, 17),
(14, 17),
(15, 17),
(22, 17),
(25, 17),
(26, 17),
(27, 17),
(28, 17),
(29, 17),
(30, 17),
(31, 17),
(32, 17),
(11, 18),
(12, 18),
(18, 18),
(23, 18),
(1, 19),
(3, 19),
(5, 19),
(6, 19),
(7, 19),
(8, 19),
(10, 19),
(13, 19),
(14, 19),
(15, 19),
(16, 19),
(17, 19),
(19, 19),
(20, 19),
(23, 19),
(25, 19),
(26, 19),
(30, 19),
(9, 20),
(22, 20),
(24, 20),
(27, 20),
(28, 20),
(29, 20),
(31, 20),
(32, 20),
(4, 21),
(11, 21),
(12, 21),
(18, 21),
(21, 21),
(1, 22),
(3, 22),
(5, 22),
(6, 22),
(7, 22),
(8, 22),
(10, 22),
(13, 22),
(14, 22),
(16, 22),
(17, 22),
(19, 22),
(20, 22),
(21, 22),
(22, 22),
(23, 22),
(25, 22),
(26, 22),
(30, 22),
(9, 23),
(15, 23),
(24, 23),
(27, 23),
(28, 23),
(31, 23),
(32, 23),
(4, 24),
(11, 24),
(12, 24),
(18, 24),
(29, 24),
(1, 25),
(3, 25),
(4, 25),
(5, 25),
(6, 25),
(7, 25),
(8, 25),
(10, 25),
(13, 25),
(14, 25),
(15, 25),
(16, 25),
(17, 25),
(19, 25),
(20, 25),
(21, 25),
(22, 25),
(23, 25),
(30, 25),
(32, 25),
(9, 26),
(25, 26),
(26, 26),
(27, 26),
(28, 26),
(29, 26),
(31, 26),
(11, 27),
(12, 27),
(18, 27),
(24, 27),
(1, 28),
(3, 28),
(5, 28),
(6, 28),
(7, 28),
(8, 28),
(10, 28),
(13, 28),
(14, 28),
(15, 28),
(16, 28),
(17, 28),
(19, 28),
(22, 28),
(23, 28),
(24, 28),
(25, 28),
(26, 28),
(30, 28),
(20, 29),
(27, 29),
(28, 29),
(31, 29),
(4, 30),
(9, 30),
(11, 30),
(12, 30),
(18, 30),
(21, 30),
(29, 30),
(32, 30),
(3, 31),
(4, 31),
(5, 31),
(6, 31),
(7, 31),
(8, 31),
(10, 31),
(13, 31),
(14, 31),
(15, 31),
(16, 31),
(17, 31),
(19, 31),
(20, 31),
(21, 31),
(22, 31),
(23, 31),
(25, 31),
(26, 31),
(30, 31),
(31, 31),
(9, 32),
(12, 32),
(27, 32),
(28, 32),
(32, 32),
(1, 33),
(11, 33),
(18, 33),
(24, 33),
(29, 33),
(3, 34),
(4, 34),
(5, 34),
(6, 34),
(7, 34),
(8, 34),
(10, 34),
(13, 34),
(14, 34),
(15, 34),
(16, 34),
(17, 34),
(19, 34),
(20, 34),
(21, 34),
(22, 34),
(23, 34),
(30, 34),
(12, 35),
(24, 35),
(25, 35),
(26, 35),
(27, 35),
(28, 35),
(31, 35),
(32, 35),
(1, 36),
(9, 36),
(11, 36),
(18, 36),
(29, 36),
(3, 37),
(4, 37),
(5, 37),
(6, 37),
(7, 37),
(8, 37),
(10, 37),
(13, 37),
(14, 37),
(15, 37),
(16, 37),
(17, 37),
(19, 37),
(21, 37),
(22, 37),
(23, 37),
(24, 37),
(12, 38),
(20, 38),
(25, 38),
(26, 38),
(27, 38),
(28, 38),
(29, 38),
(30, 38),
(31, 38),
(32, 38),
(1, 39),
(9, 39),
(11, 39),
(18, 39),
(3, 40),
(4, 40),
(5, 40),
(6, 40),
(7, 40),
(8, 40),
(10, 40),
(13, 40),
(14, 40),
(15, 40),
(16, 40),
(17, 40),
(19, 40),
(20, 40),
(21, 40),
(22, 40),
(23, 40),
(9, 41),
(12, 41),
(27, 41),
(28, 41),
(29, 41),
(31, 41),
(32, 41),
(1, 42),
(11, 42),
(18, 42),
(24, 42),
(25, 42),
(26, 42),
(30, 42),
(3, 43),
(4, 43),
(5, 43),
(6, 43),
(7, 43),
(8, 43),
(10, 43),
(12, 43),
(13, 43),
(14, 43),
(15, 43),
(16, 43),
(17, 43),
(19, 43),
(20, 43),
(21, 43),
(22, 43),
(23, 43),
(9, 44),
(24, 44),
(25, 44),
(26, 44),
(27, 44),
(28, 44),
(30, 44),
(31, 44),
(32, 44),
(1, 45),
(11, 45),
(18, 45),
(29, 45),
(1, 46),
(3, 46),
(4, 46),
(5, 46),
(6, 46),
(7, 46),
(10, 46),
(13, 46),
(17, 46),
(19, 46),
(20, 46),
(23, 46),
(8, 47),
(14, 47),
(15, 47),
(16, 47),
(22, 47),
(24, 47),
(25, 47),
(26, 47),
(29, 47),
(30, 47),
(31, 47),
(32, 47),
(9, 48),
(11, 48),
(12, 48),
(18, 48),
(21, 48),
(27, 48),
(28, 48),
(3, 49),
(4, 49),
(5, 49),
(6, 49),
(7, 49),
(10, 49),
(13, 49),
(15, 49),
(16, 49),
(17, 49),
(19, 49),
(20, 49),
(22, 49),
(23, 49),
(24, 49),
(31, 49),
(1, 50),
(8, 50),
(14, 50),
(25, 50),
(26, 50),
(27, 50),
(32, 50),
(9, 51),
(11, 51),
(12, 51),
(18, 51),
(21, 51),
(28, 51),
(29, 51),
(30, 51),
(1, 52),
(4, 52),
(5, 52),
(6, 52),
(7, 52),
(10, 52),
(12, 52),
(13, 52),
(14, 52),
(15, 52),
(17, 52),
(19, 52),
(20, 52),
(22, 52),
(23, 52),
(8, 53),
(16, 53),
(21, 53),
(24, 53),
(25, 53),
(26, 53),
(27, 53),
(28, 53),
(29, 53),
(30, 53),
(31, 53),
(32, 53),
(3, 54),
(9, 54),
(11, 54),
(18, 54),
(1, 55),
(3, 55),
(4, 55),
(5, 55),
(6, 55),
(7, 55),
(8, 55),
(10, 55),
(13, 55),
(16, 55),
(17, 55),
(19, 55),
(20, 55),
(22, 55),
(23, 55),
(31, 55),
(15, 56),
(24, 56),
(27, 56),
(28, 56),
(29, 56),
(30, 56),
(32, 56),
(9, 57),
(11, 57),
(12, 57),
(14, 57),
(18, 57),
(21, 57),
(25, 57),
(26, 57),
(1, 58),
(3, 58),
(4, 58),
(5, 58),
(6, 58),
(7, 58),
(8, 58),
(10, 58),
(12, 58),
(13, 58),
(15, 58),
(17, 58),
(19, 58),
(20, 58),
(22, 58),
(23, 58),
(31, 58),
(32, 58),
(14, 59),
(21, 59),
(27, 59),
(28, 59),
(29, 59),
(30, 59),
(9, 60),
(11, 60),
(16, 60),
(18, 60),
(24, 60),
(25, 60),
(26, 60);

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `id` int NOT NULL,
  `survey_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`id`, `survey_name`) VALUES
(1, 'SRE'),
(2, 'AIOps'),
(3, 'Gen AI'),
(4, 'Automation'),
(5, 'SmartOps Maturity Model');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `refered_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `refered_by`, `name`) VALUES
(1, 'ksugunan@virtusa.com', 'Sugunan', 'Sugunan'),
(3, 'prathnayake@virtusa.com', 'Sugunan', 'Pasindu'),
(4, 'ibwimalasuriya@virtusa.com', 'Sugunan', 'Indika'),
(5, 'test@virtusa.com', 'test', 'Test'),
(6, 'wimalasuriyaib@gmail.com', 'Misnad', 'Indika'),
(7, '', 'none', ''),
(8, 'Test@test.com', '', 'Indika New'),
(9, 'anupbabu@virtusa.com', 'Inder', 'Anup Babu'),
(10, 'sssk@gmaa.com', '', 'Satish'),
(11, 'ramakrishnank@virtusa.com', 'Sugunan', 'Ramakrishna'),
(12, 'zugunan@gmail.com', 'Indika', 'Kumaraguru Sugunan'),
(13, 'test@email.com', 'Test', 'test'),
(14, 'mhaque@virtusa.com', 'N/A', 'Misnad'),
(15, 'rcrow@crow.com', 'none', 'Robert Crow'),
(16, 'indika@gmail.com', '', 'IndikaAB'),
(17, 'wimala@virtusa.com', 'Misnad', 'Indika'),
(18, 'ini2@virtusa.com', 'Indika', 'Indikaww'),
(19, 'navvinn@gmail.com', 'Indika', 'Navin A'),
(20, 'inderjeetsaidhi@virtusa.com', 'Ind8', 'Inderjeet Singh Aidhi'),
(21, 'johndoe@test.com', 'N/A', 'John Doe'),
(22, 'srinivasj@virtusa.com', 'Abdul', 'Jureddi Srinivas '),
(23, 'ranjitht@virtusa.com', 'Anbu ', 'Ranjith T'),
(24, 'mounicamd@virtusa.com', '', 'Mounica '),
(25, 'sathyakumarb@virtusa.com', 'Abbu', 'Sathya'),
(26, 'sathyakumarb@virtusa.com', 'Abbu', 'Sathya'),
(27, 'saicharanma@virtusa.com', '', 'Saicharan'),
(28, 'naveenchintada@virtusa.com', 'Abbu', 'Naveen Kumar Chintada'),
(29, 'suresha@virtusa.com', 'Abu', 'Suresh Adduru '),
(30, 'Harithak@virtusa.com', '', 'Haritha K'),
(31, 'udaym@virtusa.com', 'Abhu , Misnad, Indrajeet', 'Uday Musunuru'),
(32, 'narasimhac@virtusa.com', 'Indrajit', 'NarasimhaRao ch');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_qna`
-- (See below for the actual view)
--
CREATE TABLE `view_qna` (
`category` varchar(128)
,`question` text
,`question_order` int
,`answer` text
,`recomendation` text
,`answer_order` int
,`weightage` float(4,2)
,`points` int
);

-- --------------------------------------------------------

--
-- Structure for view `view_qna`
--
DROP TABLE IF EXISTS `view_qna`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `view_qna`  AS SELECT `q`.`category` AS `category`, `q`.`question` AS `question`, `q`.`question_order` AS `question_order`, `a`.`answer` AS `answer`, `a`.`recomendation` AS `recomendation`, `a`.`answer_order` AS `answer_order`, `q`.`weightage` AS `weightage`, `a`.`points` AS `points` FROM (`answer` `a` left join `question` `q` on((`a`.`question_id` = `q`.`id`))) ORDER BY `q`.`question_order` ASC, `a`.`answer_order` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_id` (`survey_id`);

--
-- Indexes for table `question_answer`
--
ALTER TABLE `question_answer`
  ADD PRIMARY KEY (`user_id`,`answer_id`),
  ADD KEY `answer_id` (`answer_id`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`);

--
-- Constraints for table `question_answer`
--
ALTER TABLE `question_answer`
  ADD CONSTRAINT `question_answer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `question_answer_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
