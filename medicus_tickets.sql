-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 14/07/2023 às 09:47
-- Versão do servidor: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- Versão do PHP: 8.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ost_teste`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_api_key`
--

CREATE TABLE `tb_api_key` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT 1,
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `can_exec_cron` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `notes` text DEFAULT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_attachment`
--

CREATE TABLE `tb_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `type` char(1) NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `inline` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `lang` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_attachment`
--

INSERT INTO `tb_attachment` (`id`, `object_id`, `type`, `file_id`, `name`, `inline`, `lang`) VALUES
(1, 1, 'C', 2, NULL, 0, NULL),
(2, 8, 'T', 1, NULL, 1, NULL),
(3, 9, 'T', 1, NULL, 1, NULL),
(4, 10, 'T', 1, NULL, 1, NULL),
(5, 11, 'T', 1, NULL, 1, NULL),
(6, 12, 'T', 1, NULL, 1, NULL),
(7, 13, 'T', 1, NULL, 1, NULL),
(8, 14, 'T', 1, NULL, 1, NULL),
(9, 16, 'T', 1, NULL, 1, NULL),
(10, 17, 'T', 1, NULL, 1, NULL),
(11, 18, 'T', 1, NULL, 1, NULL),
(12, 19, 'T', 1, NULL, 1, NULL),
(13, 7, 'H', 2, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_canned_response`
--

CREATE TABLE `tb_canned_response` (
  `canned_id` int(10) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `isenabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_canned_response`
--

INSERT INTO `tb_canned_response` (`canned_id`, `dept_id`, `isenabled`, `title`, `response`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'What is osTicket (sample)?', 'osTicket is a widely-used open source support ticket system, an\nattractive alternative to higher-cost and complex customer support\nsystems - simple, lightweight, reliable, open source, web-based and easy\nto setup and use.', 'en_US', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(2, 0, 1, 'Sample (with variables)', 'Hi %{ticket.name.first},\n<br>\n<br>\nYour ticket #%{ticket.number} created on %{ticket.create_date} is in\n%{ticket.dept.name} department.', 'en_US', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_config`
--

CREATE TABLE `tb_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_config`
--

INSERT INTO `tb_config` (`id`, `namespace`, `key`, `value`, `updated`) VALUES
(1, 'core', 'admin_email', 'alissonguedes87@gmail.com', '2023-07-11 23:57:15'),
(2, 'core', 'helpdesk_url', 'http://localhost/osTicket/public/', '2023-07-11 23:57:15'),
(3, 'core', 'helpdesk_title', 'Alisson Guedes', '2023-07-11 23:57:15'),
(4, 'core', 'schema_signature', '5fb92bef17f3b603659e024c01cc7a59', '2023-07-11 23:57:15'),
(5, 'schedule.1', 'configuration', '{\"holidays\":[4]}', '2023-07-11 23:57:15'),
(6, 'core', 'time_format', 'hh:mm a', '2023-07-11 23:57:15'),
(7, 'core', 'date_format', 'MM/dd/y', '2023-07-11 23:57:15'),
(8, 'core', 'datetime_format', 'MM/dd/y h:mm a', '2023-07-11 23:57:15'),
(9, 'core', 'daydatetime_format', 'EEE, MMM d y h:mm a', '2023-07-11 23:57:15'),
(10, 'core', 'default_priority_id', '2', '2023-07-11 23:57:15'),
(11, 'core', 'enable_daylight_saving', '', '2023-07-11 23:57:15'),
(12, 'core', 'reply_separator', '-- reply above this line --', '2023-07-11 23:57:15'),
(13, 'core', 'isonline', '1', '2023-07-11 23:57:15'),
(14, 'core', 'staff_ip_binding', '', '2023-07-11 23:57:15'),
(15, 'core', 'staff_max_logins', '4', '2023-07-11 23:57:15'),
(16, 'core', 'staff_login_timeout', '2', '2023-07-11 23:57:15'),
(17, 'core', 'staff_session_timeout', '30', '2023-07-11 23:57:15'),
(18, 'core', 'passwd_reset_period', '', '2023-07-11 23:57:15'),
(19, 'core', 'client_max_logins', '4', '2023-07-11 23:57:15'),
(20, 'core', 'client_login_timeout', '2', '2023-07-11 23:57:15'),
(21, 'core', 'client_session_timeout', '30', '2023-07-11 23:57:15'),
(22, 'core', 'max_page_size', '25', '2023-07-11 23:57:15'),
(23, 'core', 'max_open_tickets', '', '2023-07-11 23:57:15'),
(24, 'core', 'autolock_minutes', '3', '2023-07-11 23:57:15'),
(25, 'core', 'default_smtp_id', '', '2023-07-11 23:57:15'),
(26, 'core', 'use_email_priority', '', '2023-07-11 23:57:15'),
(27, 'core', 'enable_kb', '', '2023-07-11 23:57:15'),
(28, 'core', 'enable_premade', '1', '2023-07-11 23:57:15'),
(29, 'core', 'enable_captcha', '', '2023-07-11 23:57:15'),
(30, 'core', 'enable_auto_cron', '', '2023-07-11 23:57:15'),
(31, 'core', 'enable_mail_polling', '', '2023-07-11 23:57:15'),
(32, 'core', 'send_sys_errors', '1', '2023-07-11 23:57:15'),
(33, 'core', 'send_sql_errors', '1', '2023-07-11 23:57:15'),
(34, 'core', 'send_login_errors', '1', '2023-07-11 23:57:15'),
(35, 'core', 'save_email_headers', '1', '2023-07-11 23:57:15'),
(36, 'core', 'strip_quoted_reply', '1', '2023-07-11 23:57:15'),
(37, 'core', 'ticket_autoresponder', '', '2023-07-11 23:57:15'),
(38, 'core', 'message_autoresponder', '', '2023-07-11 23:57:15'),
(39, 'core', 'ticket_notice_active', '1', '2023-07-11 23:57:15'),
(40, 'core', 'ticket_alert_active', '1', '2023-07-11 23:57:15'),
(41, 'core', 'ticket_alert_admin', '1', '2023-07-11 23:57:15'),
(42, 'core', 'ticket_alert_dept_manager', '1', '2023-07-11 23:57:15'),
(43, 'core', 'ticket_alert_dept_members', '', '2023-07-11 23:57:15'),
(44, 'core', 'message_alert_active', '1', '2023-07-11 23:57:15'),
(45, 'core', 'message_alert_laststaff', '1', '2023-07-11 23:57:15'),
(46, 'core', 'message_alert_assigned', '1', '2023-07-11 23:57:15'),
(47, 'core', 'message_alert_dept_manager', '', '2023-07-11 23:57:15'),
(48, 'core', 'note_alert_active', '', '2023-07-11 23:57:15'),
(49, 'core', 'note_alert_laststaff', '1', '2023-07-11 23:57:15'),
(50, 'core', 'note_alert_assigned', '1', '2023-07-11 23:57:15'),
(51, 'core', 'note_alert_dept_manager', '', '2023-07-11 23:57:15'),
(52, 'core', 'transfer_alert_active', '', '2023-07-11 23:57:15'),
(53, 'core', 'transfer_alert_assigned', '', '2023-07-11 23:57:15'),
(54, 'core', 'transfer_alert_dept_manager', '1', '2023-07-11 23:57:15'),
(55, 'core', 'transfer_alert_dept_members', '', '2023-07-11 23:57:15'),
(56, 'core', 'overdue_alert_active', '1', '2023-07-11 23:57:15'),
(57, 'core', 'overdue_alert_assigned', '1', '2023-07-11 23:57:15'),
(58, 'core', 'overdue_alert_dept_manager', '1', '2023-07-11 23:57:15'),
(59, 'core', 'overdue_alert_dept_members', '', '2023-07-11 23:57:15'),
(60, 'core', 'assigned_alert_active', '1', '2023-07-11 23:57:15'),
(61, 'core', 'assigned_alert_staff', '1', '2023-07-11 23:57:15'),
(62, 'core', 'assigned_alert_team_lead', '', '2023-07-11 23:57:15'),
(63, 'core', 'assigned_alert_team_members', '', '2023-07-11 23:57:15'),
(64, 'core', 'auto_claim_tickets', '1', '2023-07-11 23:57:15'),
(65, 'core', 'auto_refer_closed', '1', '2023-07-11 23:57:15'),
(66, 'core', 'collaborator_ticket_visibility', '1', '2023-07-11 23:57:15'),
(67, 'core', 'require_topic_to_close', '', '2023-07-11 23:57:15'),
(68, 'core', 'show_related_tickets', '1', '2023-07-11 23:57:15'),
(69, 'core', 'show_assigned_tickets', '1', '2023-07-11 23:57:15'),
(70, 'core', 'show_answered_tickets', '', '2023-07-11 23:57:15'),
(71, 'core', 'hide_staff_name', '', '2023-07-11 23:57:15'),
(72, 'core', 'disable_agent_collabs', '', '2023-07-11 23:57:15'),
(73, 'core', 'overlimit_notice_active', '', '2023-07-11 23:57:15'),
(74, 'core', 'email_attachments', '1', '2023-07-11 23:57:15'),
(75, 'core', 'ticket_number_format', '######', '2023-07-11 23:57:15'),
(76, 'core', 'ticket_sequence_id', '', '2023-07-11 23:57:15'),
(77, 'core', 'queue_bucket_counts', '', '2023-07-11 23:57:15'),
(78, 'core', 'allow_external_images', '', '2023-07-11 23:57:15'),
(79, 'core', 'task_number_format', '#', '2023-07-11 23:57:15'),
(80, 'core', 'task_sequence_id', '2', '2023-07-11 23:57:15'),
(81, 'core', 'log_level', '2', '2023-07-11 23:57:15'),
(82, 'core', 'log_graceperiod', '12', '2023-07-11 23:57:15'),
(83, 'core', 'client_registration', 'public', '2023-07-11 23:57:15'),
(84, 'core', 'default_ticket_queue', '1', '2023-07-11 23:57:15'),
(85, 'core', 'embedded_domain_whitelist', 'youtube.com, dailymotion.com, vimeo.com, player.vimeo.com, web.microsoftstream.com', '2023-07-11 23:57:15'),
(86, 'core', 'max_file_size', '536870912', '2023-07-11 23:57:15'),
(87, 'core', 'landing_page_id', '1', '2023-07-11 23:57:15'),
(88, 'core', 'thank-you_page_id', '2', '2023-07-11 23:57:15'),
(89, 'core', 'offline_page_id', '3', '2023-07-11 23:57:15'),
(90, 'core', 'system_language', 'en_US', '2023-07-11 23:57:15'),
(91, 'mysqlsearch', 'reindex', '0', '2023-07-12 00:02:40'),
(92, 'core', 'default_email_id', '1', '2023-07-11 23:57:15'),
(93, 'core', 'alert_email_id', '2', '2023-07-11 23:57:15'),
(94, 'core', 'default_dept_id', '1', '2023-07-11 23:57:15'),
(95, 'core', 'default_sla_id', '1', '2023-07-11 23:57:15'),
(96, 'core', 'schedule_id', '1', '2023-07-11 23:57:15'),
(97, 'core', 'default_template_id', '1', '2023-07-11 23:57:15'),
(98, 'core', 'default_timezone', 'America/Argentina/Buenos_Aires', '2023-07-11 23:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_content`
--

CREATE TABLE `tb_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(32) NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_content`
--

INSERT INTO `tb_content` (`id`, `isactive`, `type`, `name`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'landing', 'Landing', '<h1>Welcome to the Support Center</h1> <p> In order to streamline support requests and better serve you, we utilize a support ticket system. Every support request is assigned a unique ticket number which you can use to track the progress and responses online. For your reference we provide complete archives and history of all your support requests. A valid email address is required to submit a ticket. </p>', 'The Landing Page refers to the content of the Customer Portal\'s initial view. The template modifies the content seen above the two links <strong>Open a New Ticket</strong> and <strong>Check Ticket Status</strong>.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(2, 1, 'thank-you', 'Thank You', '<div>%{ticket.name},\n<br>\n<br>\nThank you for contacting us.\n<br>\n<br>\nA support ticket request has been created and a representative will be\ngetting back to you shortly if necessary.</p>\n<br>\n<br>\nSupport Team\n</div>', 'This template defines the content displayed on the Thank-You page after a\nClient submits a new ticket in the Client Portal.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(3, 1, 'offline', 'Offline', '<div><h1>\n<span style=\"font-size: medium\">Support Ticket System Offline</span>\n</h1>\n<p>Thank you for your interest in contacting us.</p>\n<p>Our helpdesk is offline at the moment, please check back at a later\ntime.</p>\n</div>', 'The Offline Page appears in the Customer Portal when the Help Desk is offline.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(4, 1, 'registration-staff', 'Welcome to osTicket', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System<br /> %{company.name}</em> </div>', 'This template defines the initial email (optional) sent to Agents when an account is created on their behalf.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(5, 1, 'pwreset-staff', 'osTicket Staff Password Reset', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who select the <strong>Forgot My Password</strong> link on the Staff Control Panel Log In page.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(6, 1, 'banner-staff', 'Authentication Required', '', 'This is the initial message and banner shown on the Staff Log In page. The first input field refers to the red-formatted text that appears at the top. The latter textarea is for the banner content which should serve as a disclaimer.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(7, 1, 'registration-client', 'Welcome to %{company.name}', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients when their account has been created in the Client Portal or by an Agent on their behalf. This email serves as an email address verification. Please use %{link} somewhere in the body.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(8, 1, 'pwreset-client', '%{company.name} Help Desk Access', '<h3><strong>Hi %{user.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients who select the <strong>Forgot My Password</strong> link on the Client Log In page.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(9, 1, 'banner-client', 'Sign in to %{company.name}', 'To better serve you, we encourage our Clients to register for an account.', 'This composes the header on the Client Log In page. It can be useful to inform your Clients about your log in and registration policies.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(10, 1, 'registration-confirm', 'Account registration', '<div><strong>Thanks for registering for an account.</strong><br/> <br /> We\'ve just sent you an email to the address you entered. Please follow the link in the email to confirm your account and gain access to your tickets. </div>', 'This templates defines the page shown to Clients after completing the registration form. The template should mention that the system is sending them an email confirmation link and what is the next step in the registration process.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(11, 1, 'registration-thanks', 'Account Confirmed!', '<div> <strong>Thanks for registering for an account.</strong><br /> <br /> You\'ve confirmed your email address and successfully activated your account. You may proceed to open a new ticket or manage existing tickets.<br /> <br /> <em>Your friendly support center</em><br /> %{company.name} </div>', 'This template defines the content displayed after Clients successfully register by confirming their account. This page should inform the user that registration is complete and that the Client can now submit a ticket or access existing tickets.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(12, 1, 'access-link', 'Ticket [#%{ticket.number}] Access Link', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> An access link request for ticket #%{ticket.number} has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> Follow the link below to check the status of the ticket #%{ticket.number}.<br /> <br /> <a href=\"%{recipient.ticket_link}\">%{recipient.ticket_link}</a><br /> <br /> If you <strong>did not</strong> make the request, please delete and disregard this email. Your account is still secure and no one has been given access to the ticket. Someone could have mistakenly entered your email address.<br /> <br /> --<br /> %{company.name} </div>', 'This template defines the notification for Clients that an access link was sent to their email. The ticket number and email address trigger the access link.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(13, 1, 'email2fa-staff', 'osTicket Two Factor Authentication', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> You have just logged into for the helpdesk at %{url}.<br /> <br /> Use the verification code below to finish logging into the helpdesk.<br /> <br /> %{otp}<br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who use Email for Two Factor Authentication', '2023-07-11 20:57:15', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_department`
--

CREATE TABLE `tb_department` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `tpl_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `autoresp_email_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manager_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `group_membership` tinyint(1) NOT NULL DEFAULT 0,
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT 1,
  `message_auto_response` tinyint(1) NOT NULL DEFAULT 0,
  `path` varchar(128) NOT NULL DEFAULT '/',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_department`
--

INSERT INTO `tb_department` (`id`, `pid`, `tpl_id`, `sla_id`, `schedule_id`, `email_id`, `autoresp_email_id`, `manager_id`, `flags`, `name`, `signature`, `ispublic`, `group_membership`, `ticket_auto_response`, `message_auto_response`, `path`, `updated`, `created`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 0, 4, 'Support', 'Support Department', 1, 1, 1, 1, '/1/', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(2, NULL, 0, 1, 0, 0, 0, 0, 4, 'Sales', 'Sales and Customer Retention', 1, 1, 1, 1, '/2/', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(3, NULL, 0, 0, 0, 0, 0, 0, 4, 'Maintenance', 'Maintenance Department', 1, 0, 1, 1, '/3/', '2023-07-11 20:57:15', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_draft`
--

CREATE TABLE `tb_draft` (
  `id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(32) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `extra` text DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_draft`
--

INSERT INTO `tb_draft` (`id`, `staff_id`, `namespace`, `body`, `extra`, `created`, `updated`) VALUES
(2, 2147483648, 'ticket.client.ou2utstp3scn', '<p>Olá, eu gostaria de solicitar a restituição do valor pelo tempo de indisponibilidade tratado no ticket de número [183192].</p>\n<p></p>\n<p>Desde já, agradeço a compreensão e ajuda de vocês!</p>', NULL, '2023-07-12 01:17:31', NULL),
(6, 1, 'ticket.response.1', '', NULL, '2023-07-12 20:14:37', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_email`
--

CREATE TABLE `tb_email` (
  `email_id` int(11) UNSIGNED NOT NULL,
  `noautoresp` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `priority_id` int(11) UNSIGNED NOT NULL DEFAULT 2,
  `dept_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_email`
--

INSERT INTO `tb_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `topic_id`, `email`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 2, 1, 0, 'desenvolvimentowebmin@gmail.com', 'Support', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(2, 0, 2, 1, 0, 'alerts@gmail.com', 'osTicket Alerts', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(3, 0, 2, 1, 0, 'noreply@gmail.com', '', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_email_account`
--

CREATE TABLE `tb_email_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `email_id` int(11) UNSIGNED NOT NULL,
  `type` enum('mailbox','smtp') NOT NULL DEFAULT 'mailbox',
  `auth_bk` varchar(128) NOT NULL,
  `auth_id` varchar(16) DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `host` varchar(128) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL,
  `folder` varchar(255) DEFAULT NULL,
  `protocol` enum('IMAP','POP','SMTP','OTHER') NOT NULL DEFAULT 'OTHER',
  `encryption` enum('NONE','AUTO','SSL') NOT NULL DEFAULT 'AUTO',
  `fetchfreq` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `fetchmax` tinyint(4) UNSIGNED DEFAULT 30,
  `postfetch` enum('archive','delete','nothing') NOT NULL DEFAULT 'nothing',
  `archivefolder` varchar(255) DEFAULT NULL,
  `allow_spoofing` tinyint(1) UNSIGNED DEFAULT 0,
  `num_errors` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `last_error_msg` tinytext DEFAULT NULL,
  `last_error` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_email_template`
--

CREATE TABLE `tb_email_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `tpl_id` int(11) UNSIGNED NOT NULL,
  `code_name` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_email_template`
--

INSERT INTO `tb_email_template` (`id`, `tpl_id`, `code_name`, `subject`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'ticket.autoresp', 'Support Ticket Opened [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <p>A request for support has been created and assigned #%{ticket.number}. A representative will follow-up with you as soon as possible. You can <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. </p> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team, <br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(2, 1, 'ticket.autoreply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> A request for support has been created and assigned ticket <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> with the following automatic reply <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>We hope this response has sufficiently answered your questions. If you wish to provide additional comments or information, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(3, 1, 'message.autoresp', 'Message Confirmation', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Your reply to support request <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> has been noted <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You can view the support request progress <a href=\"%%7Brecipient.ticket_link%7D\">online here</a></em> </div>', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(4, 1, 'ticket.notice', '%{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Our customer care team has created a ticket, <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{message} <br /> <br /> %{response} <br /> <br /> If need be, a representative will follow-up with you as soon as possible. You can also <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(5, 1, 'ticket.overlimit', 'Open Tickets Limit Reached', '<h3><strong>Dear %{ticket.name.first},</strong></h3> You have reached the maximum number of open tickets allowed. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply <a href=\"%%7Burl%7D/tickets.php?e=%%7Bticket.email%7D\">login to our helpdesk</a>. <br /> <br /> Thank you,<br /> Support Ticket System', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(6, 1, 'ticket.reply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>We hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">login to your account</a> for a complete archive of all your support requests and responses.</em></div>', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(7, 1, 'ticket.activity.notice', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a ticket in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on ticket <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">#%{ticket.number}</a>. To participate, simply reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">click here</a> for a complete archive of the ticket thread.</em> </div>', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(8, 1, 'ticket.alert', 'New Ticket Alert', '<h2>Hi %{recipient.name},</h2> New ticket #%{ticket.number} created <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(9, 1, 'message.alert', 'New Message Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> New message appended to ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{poster.name} &lt;%{ticket.email}&gt; </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(10, 1, 'note.alert', 'New Internal Activity Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> An agent has logged activity on ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{note.poster} </td> </tr> <tr><td><strong>Title</strong>: </td> <td>%{note.title} </td> </tr> </tbody> </table> <br /> %{note.message} <br /> <br /> <hr /> To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system <br /> <br /> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(11, 1, 'assigned.alert', 'Ticket Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr><td><strong>Subject</strong>: </td> <td>%{ticket.subject} </td> </tr> </tbody> </table> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(12, 1, 'transfer.alert', 'Ticket #%{ticket.number} transfer - %{ticket.dept.name}', '<h3>Hi %{recipient.name},</h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been transferred to the %{ticket.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(13, 1, 'ticket.overdue', 'Stale Ticket Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A ticket, <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tickets are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{ticket.dept.manager.name} <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system. You\'re receiving this notice because the ticket is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(14, 1, 'task.alert', 'New Task Alert', '<h2>Hi %{recipient.name},</h2> New task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> created <br /> <br /> <table><tbody><tr><td><strong>Department</strong>: </td> <td>%{task.dept.name} </td> </tr> </tbody> </table> <br /> %{task.description} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(15, 1, 'task.activity.notice', 'Re: %{task.title} [#%{task.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a task in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on task #%{task.number}. To participate, simply reply to this email.</em> </div>', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(16, 1, 'task.activity.alert', 'Task Activity [#%{task.number}] - %{activity.title}', '<h3><strong>Hi %{recipient.name},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> updated: %{activity.description} <br /> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(17, 1, 'task.assignment.alert', 'Task Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(18, 1, 'task.transfer.alert', 'Task #%{task.number} transfer - %{task.dept.name}', '<h3>Hi %{recipient.name},</h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been transferred to the %{task.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(19, 1, 'task.overdue.alert', 'Stale Task Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A task, <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tasks are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{task.dept.manager.name} <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system. You\'re receiving this notice because the task is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_email_template_group`
--

CREATE TABLE `tb_email_template_group` (
  `tpl_id` int(11) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL DEFAULT '',
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_email_template_group`
--

INSERT INTO `tb_email_template_group` (`tpl_id`, `isactive`, `name`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 1, 'osTicket Default Template (HTML)', 'en_US', 'Default osTicket templates', '2023-07-11 20:57:15', '2023-07-11 23:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_event`
--

CREATE TABLE `tb_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_event`
--

INSERT INTO `tb_event` (`id`, `name`, `description`) VALUES
(1, 'created', NULL),
(2, 'closed', NULL),
(3, 'reopened', NULL),
(4, 'assigned', NULL),
(5, 'released', NULL),
(6, 'transferred', NULL),
(7, 'referred', NULL),
(8, 'overdue', NULL),
(9, 'edited', NULL),
(10, 'viewed', NULL),
(11, 'error', NULL),
(12, 'collab', NULL),
(13, 'resent', NULL),
(14, 'deleted', NULL),
(15, 'merged', NULL),
(16, 'unlinked', NULL),
(17, 'linked', NULL),
(18, 'login', NULL),
(19, 'logout', NULL),
(20, 'message', NULL),
(21, 'note', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_faq`
--

CREATE TABLE `tb_faq` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ispublished` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_faq_category`
--

CREATE TABLE `tb_faq_category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_pid` int(10) UNSIGNED DEFAULT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_faq_topic`
--

CREATE TABLE `tb_faq_topic` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_file`
--

CREATE TABLE `tb_file` (
  `id` int(11) NOT NULL,
  `ft` char(1) NOT NULL DEFAULT 'T',
  `bk` char(1) NOT NULL DEFAULT 'D',
  `type` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `key` varchar(86) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `signature` varchar(86) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `attrs` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_file`
--

INSERT INTO `tb_file` (`id`, `ft`, `bk`, `type`, `size`, `key`, `signature`, `name`, `attrs`, `created`) VALUES
(1, 'T', 'D', 'image/png', 9452, 'b56944cb4722cc5cda9d1e23a3ea7fbc', 'gjMyblHhAxCQvzLfPBW3EjMUY1AmQQmz', 'powered-by-osticket.png', NULL, '2023-07-11 20:57:15'),
(2, 'T', 'D', 'text/plain', 24, 'z8HLDMWtx86n3ccfeGGNagoRoTDtol7o', 'MWtx86n3ccfeGGNafaacpitTxmJ4h3Ls', 'osTicket.txt', NULL, '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_file_chunk`
--

CREATE TABLE `tb_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_file_chunk`
--

INSERT INTO `tb_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(1, 0, 0x89504e470d0a1a0a0000000d49484452000000da0000002808060000009847e4c900000a43694343504943432070726f66696c65000078da9d53775893f7163edff7650f5642d8f0b1976c81002223ac08c81059a21092006184101240c585880a561415119c4855c482d50a489d88e2a028b867418a885a8b555c38ee1fdca7b57d7aefededfbd7fbbce79ce7fcce79cf0f8011122691e6a26a003952853c3ad81f8f4f48c4c9bd80021548e0042010e6cbc26705c50000f00379787e74b03ffc01af6f00020070d52e2412c7e1ff83ba50265700209100e02212e70b01905200c82e54c81400c81800b053b3640a009400006c797c422200aa0d00ecf4493e0500d8a993dc1700d8a21ca908008d0100992847240240bb00605581522c02c0c200a0ac40222e04c0ae018059b632470280bd0500768e58900f4060008099422ccc0020380200431e13cd03204c03a030d2bfe0a95f7085b8480100c0cb95cd974bd23314b895d01a77f2f0e0e221e2c26cb142611729106609e4229c979b231348e7034cce0c00001af9d1c1fe383f90e7e6e4e1e666e76ceff4c5a2fe6bf06f223e21f1dffebc8c020400104ecfefda5fe5e5d60370c701b075bf6ba95b00da560068dff95d33db09a05a0ad07af98b7938fc401e9ea150c83c1d1c0a0b0bed2562a1bd30e38b3eff33e16fe08b7ef6fc401efedb7af000719a4099adc0a383fd71616e76ae528ee7cb0442316ef7e723fec7857ffd8e29d1e234b15c2c158af15889b850224dc779b952914421c995e212e97f32f11f96fd0993770d00ac864fc04eb607b5cb6cc07eee01028b0e58d27600407ef32d8c1a0b91001067343279f7000093bff98f402b0100cd97a4e30000bce8185ca894174cc608000044a0812ab041070cc114acc00e9cc11dbcc01702610644400c24c03c104206e4801c0aa11896411954c03ad804b5b0031aa0119ae110b4c131380de7e0125c81eb70170660189ec218bc86090441c8081361213a8811628ed822ce0817998e04226148349280a420e988145122c5c872a402a9426a915d4823f22d7214398d5c40fa90dbc820328afc8abc47319481b25103d4027540b9a81f1a8ac6a073d174340f5d8096a26bd11ab41e3d80b6a2a7d14be87574007d8a8e6380d1310e668cd9615c8c87456089581a26c71663e55835568f35631d583776151bc09e61ef0824028b8013ec085e8410c26c82909047584c5843a825ec23b412ba085709838431c2272293a84fb4257a12f9c478623ab1905846ac26ee211e219e255e270e135f9348240ec992e44e0a21259032490b496b48db482da453a43ed210699c4c26eb906dc9dee408b280ac209791b7900f904f92fbc9c3e4b7143ac588e24c09a22452a494124a35653fe504a59f324299a0aa51cda99ed408aa883a9f5a496da076502f5387a91334759a25cd9b1643cba42da3d5d09a696769f7682fe974ba09dd831e4597d097d26be807e9e7e983f4770c0d860d83c7486228196b197b19a718b7192f994ca605d39799c85430d7321b9967980f986f55582af62a7c1591ca12953a9556957e95e7aa545573553fd579aa0b54ab550fab5e567da64655b350e3a909d416abd5a91d55bba936aece5277528f50cf515fa3be5ffd82fa630db2868546a08648a35463b7c6198d2116c63265f15842d6725603eb2c6b984d625bb2f9ec4c7605fb1b762f7b4c534373aa66ac6691669de671cd010ec6b1e0f039d99c4ace21ce0dce7b2d032d3f2db1d66aad66ad7ead37da7adabeda62ed72ed16edebdaef75709d409d2c9df53a6d3af77509ba36ba51ba85badb75cfea3ed363eb79e909f5caf50ee9ddd147f56df4a3f517eaefd6efd11f373034083690196c313863f0cc9063e86b9869b8d1f084e1a811cb68ba91c468a3d149a327b826ee8767e33578173e66ac6f1c62ac34de65dc6b3c61626932dba4c4a4c5e4be29cd946b9a66bad1b4d374ccccc82cdcacd8acc9ec8e39d59c6b9e61bed9bcdbfc8d85a5459cc54a8b368bc796da967ccb05964d96f7ac98563e567956f556d7ac49d65ceb2ceb6dd6576c501b579b0c9b3a9bcbb6a8ad9badc4769b6ddf14e2148f29d229f5536eda31ecfcec0aec9aec06ed39f661f625f66df6cf1dcc1c121dd63b743b7c727475cc766c70bceba4e134c3a9c4a9c3e957671b67a1739df33517a64b90cb1297769717536da78aa76e9f7acb95e51aeebad2b5d3f5a39bbb9bdcadd96dd4ddcc3dc57dabfb4d2e9b1bc95dc33def41f4f0f758e271cce39da79ba7c2f390e72f5e765e595efbbd1e4fb39c269ed6306dc8dbc45be0bdcb7b603a3e3d65facee9033ec63e029f7a9f87bea6be22df3dbe237ed67e997e07fc9efb3bfacbfd8ff8bfe179f216f14e056001c101e501bd811a81b3036b031f049904a50735058d05bb062f0c3e15420c090d591f72936fc017f21bf96333dc672c9ad115ca089d155a1bfa30cc264c1ed6118e86cf08df107e6fa6f94ce9ccb60888e0476c88b81f69199917f97d14292a32aa2eea51b453747174f72cd6ace459fb67bd8ef18fa98cb93bdb6ab6727667ac6a6c526c63ec9bb880b8aab8817887f845f1971274132409ed89e4c4d8c43d89e37302e76c9a339ce49a54967463aee5dca2b917e6e9cecb9e773c593559907c3885981297b23fe5832042502f184fe5a76e4d1d13f2849b854f45bea28da251b1b7b84a3c92e69d5695f638dd3b7d43fa68864f4675c633094f522b79911992b923f34d5644d6deaccfd971d92d39949c949ca3520d6996b42bd730b728b74f662b2b930de479e66dca1b9387caf7e423f973f3db156c854cd1a3b452ae500e164c2fa82b785b185b78b848bd485ad433df66feeaf9230b82167cbd90b050b8b0b3d8b87859f1e022bf45bb16238b5317772e315d52ba647869f0d27dcb68cbb296fd50e2585255f26a79dcf28e5283d2a5a5432b82573495a994c9cb6eaef45ab9631561956455ef6a97d55b567f2a17955fac70aca8aef8b046b8e6e2574e5fd57cf5796ddadade4ab7caedeb48eba4eb6eacf759bfaf4abd6a41d5d086f00dad1bf18de51b5f6d4ade74a17a6af58ecdb4cdcacd03356135ed5bccb6acdbf2a136a3f67a9d7f5dcb56fdadabb7bed926dad6bfdd777bf30e831d153bdeef94ecbcb52b78576bbd457df56ed2ee82dd8f1a621bbabfe67eddb847774fc59e8f7ba57b07f645efeb6a746f6cdcafbfbfb2096d52368d1e483a70e59b806fda9bed9a77b5705a2a0ec241e5c127dfa67c7be350e8a1cec3dcc3cddf997fb7f508eb48792bd23abf75ac2da36da03da1bdefe88ca39d1d5e1d47beb7ff7eef31e36375c7358f579ea09d283df1f9e48293e3a764a79e9d4e3f3dd499dc79f74cfc996b5d515dbd6743cf9e3f1774ee4cb75ff7c9f3dee78f5df0bc70f422f762db25b74bad3dae3d477e70fde148af5b6feb65f7cbed573cae74f44deb3bd1efd37ffa6ac0d573d7f8d72e5d9f79bdefc6ec1bb76e26dd1cb825baf5f876f6ed17770aee4cdc5d7a8f78affcbedafdea07fa0fea7fb4feb165c06de0f860c060cfc3590fef0e09879efe94ffd387e1d247cc47d52346238d8f9d1f1f1b0d1abdf264ce93e1a7b2a713cfca7e56ff79eb73abe7dffde2fb4bcf58fcd8f00bf98bcfbfae79a9f372efaba9af3ac723c71fbcce793df1a6fcadcedb7defb8efbadfc7bd1f9928fc40fe50f3d1fa63c7a7d04ff73ee77cfefc2ff784f3fb803925110000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000032869545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633031342037392e3135363739372c20323031342f30382f32302d30393a35333a30322020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f70204343203230313420284d6163696e746f7368292220786d704d4d3a496e7374616e636549443d22786d702e6969643a36453243393544454136373331314534424443444446393146414639344441352220786d704d4d3a446f63756d656e7449443d22786d702e6469643a3645324339354446413637333131453442444344444639314641463934444135223e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a4346413734453446413637313131453442444344444639314641463934444135222073745265663a646f63756d656e7449443d22786d702e6469643a4346413734453530413637313131453442444344444639314641463934444135222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e203c3f787061636b657420656e643d2272223f3e8bfef6ca0000170b4944415478daec5d099c53d5d53f2f7b32c9646680617118905d3637d0cfad282aa82d0af6f3b3b62ef52bd6d685ba206eb54a15c1adf6538b52b4d53a564454a42c0565d132a86c82a0ac82ec8b0233ccc24c9297f7dd9bfc6f73e64e92c90c5071ccf9fd0e249397f7eebbf7fccff99f73efbb31860f1f4e593936a4da74d2d8eeef53b17f2f51c4fd5d6b7e4ba19385ee177a9bd0ed8d3e832534dfa4d2351ebafaad3cb2d92cb219cd636c6d59f3ceca11920b849e27f4c742af68f4b7a342f34c5ab8de4d3f9b12a4b0005d7301991447d63ebed7e2125a283457a85d680d22d2be26463405995d8dfeb63f4a4b44241bfa463e5902642d7d518a5a59a065e5bb29ad849e2a7480d0d384b617ea05e024bb89080d093d287495d0e94267093d90c1b9edf85f82b4a2d19451006dc65617ed2bb3538f76618a449b57c76781f6fd908e42af14fabf42bb65f89dde42af12ba4ce848a10bd21c9b23741803f3bb42c709fd6d4657921015003b74c8205f8ed9ec4096cdd19abf7884de2e74210cbf5b13ce2123e05ca1f7e37cc9e45788921c3af703d80d47b3a049b3b739e989d21c2aca8d36cb81c802adf94a6ba15385fe41e87147c04e1e018dbc00399da49b4542ef4d13b97e2d343fed999d16d57ee3a0498b7dd426b779e56559ead8fce504a16f0aed7584cf7b2e72bbbd426b01b8d6691c763f8a97fa1f4c471bb71db4d194b51e6a17c8022d2bdf1d9151e695a30032253ee47c99caef285ecd1c9b92df0aea58e88fc672b3e654d2cf52c7e62d922af6ff96ae2de3d152a1cb8556b1bfcb4249cb3a47ca54cc23fec93569fe1a0f4522061946f31d946c443be65c5fe470befd736aca64f19193f5427f227487d00e427f29f432e477dfc4efcf8abbf76094e6adf4d0a4955e9ab6d14d6e41218de63cac59cb3e86bc9e11a592eda79019f60aab6b74f54de64a7725f9bb9c3c2eff0fddc2c342bf04555c47f142493f11e7a6935d00cc6fc6d0f4e55e07fdf4a502ba654690262ef791d76191c76135efb1cd9af7b123d2a36f3e14a4903d4c5eabd1fe5d468e9edadf4a854e04008347b9f9e385be56871afaa22171232119c50e96dbe9c036173d58eaa7399b5c541532c8efb2a87bab08990263d1e68db32cd08e297a61086bb36cb4fa4031f5cfdf127b9da104845ea3fd4d4694a1145f62d5e62837fd39a1a312ad11912b274aabd67b68f1976eea901fa1055b5cf468690eb5f34763343127271eb14debfb31b68eb3cf3e3b6be1c7904c9bbf8cdedcdd8bfab7d824dc7cc67ef02c8a97dd95940178df20b66c10dae22834572ed31a416ad58808c2729de2e37372c914579db5c94d0b05d00c579472dd227ab5689eab3eb211ed3b99a75994e7aa8a17452c8f30de8c5cbe5c31ef62ef1f12ba04afe522e12784be91c178cbfcea75d04c59ccc8a37839df29b412f95e5b009b50f45856e70c820e4e58e1a5cdbb9d542822598fb689758bdf57906581760c8add885255d843353541f2d84399d04759363f91bdff40e8abda316b8456537c82399dc849ee0758cae8a3c42a907244ca2280f64ca18384ce8e013d2a401834e9ab3d4eca775a146a19891539be2570c9f6ca2561edf17e8fd079420f6581969598f8edb5b4a2a20d95ecec4bc33b7f4854eb6fe82b8329be1e51c95f11c5b874a1d4eb1489196349ec559ec8b142229456daaac856673e4cca761457a653e2319b7cf258bbb6ee70d1b0c979b4eda09d5a78a37252ad1dc527b723a0b029fd0bc5579a48aa5b20d48df6ca08bab109dd2823f23d4207328afb43a1dbb240cb4a4c2c11481c24cbddb528f11b149f074e29329aa9b027170fbf9be498ae1ab5d42f2acff027725a9f4b44dcfb561e9d2828dfd567098c1db2c59b107b80c650935d6159c720b96adf8a3d42b39d0a22347e6e80566e7752f7b691588e46f155ff72517315ce904a64e4dc041a7abef437147f22e079a13765a963568e8a14b8aae9fdbddde8e4e00eea259442fe5460cb038553f24fd03b5d4e4e79b15819de7a37e2b61e731cb4d17df302f4e4877e6a2fa8dfac0d6eaa0e1bb4b7d246c37ad7d0c80b2a880ec46696db89e6b48c3529d7dc459ee8a1454b7cf4d66a0f15b73415c808f91c01340d492ef2c2969478b6cddbc42e8c6ac0361b88a8474a8e475ff786d39891055a7a31601c4e78e3508ae33c38a6065efec82418369376d40468555911f50aec8d47b6e4f36a72deac2f5eef448ea58ba461dd539aa3db9a496dc2b74c9c951b1afb5e20669d9d5acb0286413336ba636b0f0f08a0e57b2c1a39a052dcb14057b55125a0b05ae464f3b7d718e3576df6866f9e9627724b8a1dc74af68af65530c33759dea7447e26172aaf07d8f2d1ff9587317effe985263d50483a09efc76581d6b0c8817e01b98f7cd46434c59f3ae6d287e2eb0adbe3987b8ed4c5a30254c7b92b68b22cf38b88d6397777aacd7ae4fc5800afbf04fdd2e5062d874b80cc4e2f52dbf0cdcfcccc0ddd332d488581682b9f61150b70796d762bd2ca67c9a7a537b7f24523f3b63ae9ea92022ab9f28004db12ea5a3b78f906d7ce817715c92a89af4b71a83857e05180cc0580c8b63c04f07b589e269dd2a39478505452cf3b50c49120fc239c979b9ab225c2b727ed19c8482fbc648196a22641f179a90ef83f999517a0b2e54c6ac8870b36e1903d22b2391ca174391a5fa8bb32491e24dbf500e94bed2cda2d22d96801b2179ef9672eddfe76b0b038dfbcc9618b3da8d99e5d4d562a17442d7ab263303a7ff27a3779dfc9a347cfaf282f793dbf7cd2a75e5bb9d3bab66361e41671813ed1ba516a8bd0c729be624497afd96b79839f4a40e3fdd66398e5a44b96b7a1a0a36c657f16680d4b84d1c50329a8e341786e19fd761f8d46380d934ab69d4277772a25476c5ecd96cc8b2af944fb4c56dcfe86aa20972951d378c0e631d74e1054f1376fe69dd12edf7cce65a753a256ec3e5e84d1c8fce807422f911a8ed2bdc707cd715345def6c53e3b2ddeee143431fa74aff6a111a66944c5e7938d3855947d271fd11922f44f42cf107a9d9623f19ccdc5de77a2f8960b76383bb984ec1f49ba463ec83a18d4b91011b312e3b080e24f103444e5e5b3729782d606e18cc653dd6df22ea6f814462125a638e48a9b49ac827922faba9386a78be18465db2a1c48e04e45c366a3027435c5e74b1623c1ae4c929b0c42e2e7c54517c13311e3d936500895a0cbfd248a1156373203f6e33b1edce81e50221931fac393c8b9a0f9e0f2c40ca115dab91e83d4055c7913a8d520e42816aa72ff22aa57b23e139d9583aadd7a16fa53f17d1b8b14ea7c3f419fc8364ea3f88a0c79ce8b700e3948ab9200a2ad8a1ec436c2310c8b361fcaa750d41e075a7d69cd220fa78db2523706c512259206de4fdee8c48dfbedd18b1f6b4355216a2f403631e0b27a09ca27f3895b847ea5e577d7a3fa375600715fae2bf67dea986f5e651834221436b6898ebdc2a80ff47384fe1db6f421c5d75c72e2ca6b9e4a4e02ad54f29724409351f74eaabfae53c9f9a0a5e9e6cc241b795a285f16f53aeb7be9c0e4130757012c94a40db7012f8310b975b9041a73d60e7886e7d1b07168e80fd817e682e7abd02e9fde7d099e8a8b1cec6728be625b1ad673f04c37e3fc5246a1e42baf251fa128c1df47c33822f03412a47281ea29da3556c218168236498fd91946f50d3aef200658523e39b1da513b4729dab412efefa6f813c05e96d34cc8b052c6238bccd32e637f1b05e02fc2a0f5c0352f64d4497a6639b92ce79be6087d4f672b3e7b38be06b2be7871ef2aeaeec06bb9825edf5a6035a2ca72b975c0dc751efabacaa016bee81d22924990cd455b7507548b5cb50ad1718cc8df66e5ba2de90ccfb5e2cdba2f49342538b47b30c63722572b6ba01fab01bc54858c47615fe9641302433ab6f6a80632d9c6e1b8df7600dd59ecf3b5c82dbba3df7bc0b6fa30c79f4eec3656fdf1c2e0fb2131fd9a798817019a020040814c469979e8401f3af63a78e6103aac2f2b459fc3ae752e5e0710663d300809b25718c85622628510a64bd01935ac3347a0ed8468741e0cb823c02bc1f5193e3f0bf7e0c7bd3d82f698308e7d309ece1974a0c9bcd710b4750dfe5688b6ca39ac298c6674d1bc7e3bbc9e579f395874c874c68a23290a364578fd3972a2f3e138b8bc1feb5f4b80cc1fa5671704e80e919715e644fb8a9cec06ac9abf2b09c8b8bc0a1b90ece15aadf4fe759aef2d40df47f0dd4ccaf2a9a2dd4d1ac8c2601fd2f15e4ef10d825e461008a5c8ab09c7ddc8decf60202314b8ce624ce54644da7e9478d68e40379f84d31f053ac9dbfe216cf23119c06c1a979527fe394070298b6203e1010650624ee65550aef371ace2acf701040bf1fe7480e838189d92229627aa0d5c2621c2aa05b2b7e3264f4747d78262de0b6e1d66605d0bca3012e7e8064e3d1c6d3f9112cf6bf5c2ebdb1958ef46243f1714b5b1320614fc62500a15b106c1d89570b6309819eb7bf5124541196f68bf8c7caeea64f9591eebb7452cc7716a51659830d7ed5460d2cb4b7c3462662e15e444c9668bf5878cda6fb3e89e4ed444f87fc381aad2fd3d6c2c75d98131b95ca3a48d957614df558b8bbcee50b09a77c042ae475ffb293117a700bb034e9f6fa9b00481a196a51043d8e712c47fc6e726d281fbd8e79781cd3c0150717eff36aaaeb29d636d5a989ec0e6623ec609945c04a35586f104a302ff82272018f879f83e21dcb646bee447b42c0705cd47e408b2ca4d4f16c966200fca017551e7ec0bc0d5e0fd6e78aaa9888aaa48f019724c173cdc348a3f662fe517a07152a683ea124acabf078dc9a41225650522a389c8328e1d73211cd6a78c21a81caf27f37ecbeb700d234a65110fe5b92b523d759dcbfa6d03a35e4abe821155927ca8b2ca46ef6f709343bcf60bfa28685f6f16493399cc5d0e70754234fb2bae712ea2d6431897028db6495bd9494d9b6754116d288bfc0446f287469c672f22ea5896b7ae41fff05d99af003323b0a82949ce3507e3ad72d801acc063d3a87dcaaae347dafb8540a90340511bbe7c00bac2450128884e919ee57794d8cca5150cfe7544ce4b0096fe68d42ae459aa43a5112e8331dbe0557258343c9e79a2c5cc903bb2c8f95f42bf40874431707e166d78de56cbdeaf03e8bb6708b4355a65f22b78d0e3e048b602cc27c3500d44e9beac9feb806c77ad9ffa04f6500719cdcc64f978ec3e5d68f716fcad428bb09bd50f47bcbed447afadf052b7c2887cc8d260fd9ce98f51ec8113ea0276f011a2dbd3a0c00f42bf86432c45eeb688524ff8672a03b5f72f36f2fb39a070aa382103c4ad8ce613ec94afa07122425a0c3435781d4832c5a2072d473aa09949383325a9bed524f1827c998b1b615919db190015013c1edcb4a45abd19c857b39bd80f301bec26aad1e6cf61546ecde055b9d8c3a2d35a749a9d1213a6657008aa1ad8d4690e2345bf998c46a836ce06fde90c2adb07ed5c0be7f36f17bead26482709903dd06336b96d2210c4b636a85710e9c61cdc4a561451530f712aeab2a862a793a62cf3519ba0a99e64b6b17bce34d2f07b72b2b11c08ca7521c6b21fe8d71046a16ea3a62de8b592cc17963761aeed4cadb89183ea376940e37b509e4ce996ae252490c206281dd0f42771fbb063b6800214c31b77609e946040f90c8835180809b40b1065f6c0b0d4e31a97b2c8f239c01566d5a3a19a975625f508aeafa2939d4d2896c3abfa71ce61f0faea7307bedf17f75180e8a8775ecb0c9377d20a1c525a30c7b28b45cd4fe0746e60c587c5e897b86559063dde6d2e15f9f7922706325faafd434e60c6ae8a2821966bc7fb4dd0c48dfb1d34759d9bba251ebc3429b18f48a65b1cf8d02f11aa3b191b01f5fd107d5c8cfe389b152ae458fc8cd4063d4d77680d1a740ad1135c2722dc0ac684ec5a7e1b4d33b513812d39d938da523889a41f0e67865f4075574e7fc0e634bab2ea939acfb99b356235cbf3545e520c63530f10560268a762e03e62002318e48fd8353aa12cfb77cc6354a7a8506d619dd70ff9a2fabc27a620fe0f45096530c35815d48e42498b46785c791dbe95c055ecf522ad38a1728e1fe3f55bfc8445de723a217f0b051d358864494196c768ed275a345774b0b681b6af67ce3413e986b2f676e43cc751fd5d882df4ff5c140706e2d8412812351560116d0e2caf09e79a8cc2899256a81afa5864afd12aa6e750628ef53ca61742252bfb23632e562aa0e911ed14508e1994982c56d59979283a8c00b04623227c4675378699c1aa6c2b0028bf96b4efc580f462f3149fb282cc6078da975052fd1237d59d150f2a29f92e5e5528e85c8ece9c8af73b0186b6e884ab50d0990083790305971e1ac01b0299eac7f1e8fc001c886acb1bec3899a7fd1ac704d01f1ff393dedd7901d9648551e665a99fae1e0c5af309c6454fc0b7fddb68c206752988d0d0eeb5b468bb33b6210e9b5b5355c427a8e15f8c198871fc1ba2f5c7282efd94524f0eaf42d1621cf2ba579b18d1b668efafd48b470dc84e14abd6c0299eceeee90e7c56a61546fc68ffc126445deef4ea453413206b8f12797f366877e2f517a03ddfe0c43f44a9bd279bb3b99575fc622de1547310fb984795b29479ad7988ac07603897a20cdf1dc73c850a612b56c20d68f73209f31f11789aab31d7d1964d41bc817997296cde6b24b8fcb3ac1c1d4891c3799937fc1cfd740da2956acb48f4012f362dd34ac075263c7d22a251c4956e407bb36af04b1ab52e60112d4eb1420605da86e99ad3ab687fb54d2f5e95829d5cdf80111531765302c32f474a509421bd360f23a2bda339b611193a4362fdb10bf6f080e6181e44c48d52dd5fcc398df886430d8bfe53555d5345343bbcf218d0421faa6faf22a228f907f8f7507829278ce503ccb570cab20f03d409de9dd39c7b01885012ef340509fee5302c17403a15d14c958d7f815c6a13d55ff0f96718f930388230ee63068b2221dceb2c783737aef11a0a149df09d64fb227e8168e083e793e7ba19f9de7e50953949b8fd2c4653e7d43b6b6d4046323f0a25fb357a7c3afab83568d044eddb43d87447c254455493e57d2dfecb717a1ce77b0aa5fb6949eeb31051bf330cfe23e6cc6474fe2dc621d91c4457440cd223772365261cb09a1af1c0514e44fb7781950c80dd946aed71b2a2d47b70a4a318061e076b9b08a7a3162bdc8f7b180f675a0bc7ab72d0a56c0cabc122fc6c8e6d246cdb702449123f8031bb603cc9f8cb3a2493ea07ec4269e6629642939d635d9acedd806b38718db0768d43946492579315e87855de0f27b91f799ebfc0a118aca0f05192e90e2e07883d6f0419858133b581568598202596fe7c46f5d73d8a56ca072bad9e18248b45275e391b4ff5374bed01cf4cf51c83e8bdb25a1b850e19e4c8abb349ce3478f88761b0cfc24195e13ecec4679dd08fb7b3b3be00605f0b631c073a1ac1980d46b42844e49d7e184033d1b73329b1be533ab8df205f3f08f0b580935ca84d29e8b4ee1938d67e782f03c6efc1c64621d5506ee97f702f07d8bde502d8250c685b70dd8b5865732cdabec491a20a6965904cd311981fc9440ef7814a4b4b728fd675944198294ac0772202f664b4b1fef2a5785eb618cce257c8fb0a700fd310c9e624b9c60044f728a22d8b5d069d5d14a2d33a86686bb99de76984fc6433febf15aa8ff12bf0ee3bd8df556efe340a4bc9b650280350c768fdebd70a3b5e061ebbc6b2942c075d7c9e018458becbabb105547709569ec6de760004bc10750baabf8fe0be9e625328c114d5d9965a3f3d0c6718607892dad1a135c04d59391a92835c53816c33a8653a59096ae6426ea976a14a3597730306fb7ad27f9d53d0c62e27d4d2259b6a68cc9c80005a3d5ff01aa2f3a598f66801606f06655b9ae2bacb29f123f132a76907b0ec039d9f4dc937d7998e625618f7f515ab844e4074f253fd5f195d8aebfd08ff7766154875cd994865a6e37f0b6dd0e9ffdb486b06205ab544dbbdf8ee2728989d838ab91f4e541ebb15e77c5f3be722b4eb564a4c8dc99469bef1f2cb2ff742688ca0911bb3b838e222a9c62fe12177c2fb7f9aecc0ebca4635e5fc7654212b51c1ad2f4193464f0fd298d21cea10349b439f1a70306a43950a4acc2736b8a3519a7ed40b377644332fd84235a8aad540db5a2070c9e3cbfe5f800100b3e0af98735d4afd0000000049454e44ae426082),
(2, 0, 0x43616e6e6564204174746163686d656e747320526f636b21);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_filter`
--

CREATE TABLE `tb_filter` (
  `id` int(11) UNSIGNED NOT NULL,
  `execorder` int(10) UNSIGNED NOT NULL DEFAULT 99,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `flags` int(10) UNSIGNED DEFAULT 0,
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `match_all_rules` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `stop_onmatch` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_filter`
--

INSERT INTO `tb_filter` (`id`, `execorder`, `isactive`, `flags`, `status`, `match_all_rules`, `stop_onmatch`, `target`, `email_id`, `name`, `notes`, `created`, `updated`) VALUES
(1, 99, 1, 0, 0, 0, 0, 'Email', 0, 'SYSTEM BAN LIST', 'Internal list for email banning. Do not remove', '2023-07-11 20:57:15', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_filter_action`
--

CREATE TABLE `tb_filter_action` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(24) NOT NULL,
  `configuration` text DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_filter_action`
--

INSERT INTO `tb_filter_action` (`id`, `filter_id`, `sort`, `type`, `configuration`, `updated`) VALUES
(1, 1, 1, 'reject', '[]', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_filter_rule`
--

CREATE TABLE `tb_filter_rule` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `what` varchar(32) NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends','match','not_match') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_filter_rule`
--

INSERT INTO `tb_filter_rule` (`id`, `filter_id`, `what`, `how`, `val`, `isactive`, `notes`, `created`, `updated`) VALUES
(1, 1, 'email', 'equal', 'test@example.com', 1, '', '0000-00-00 00:00:00', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_form`
--

CREATE TABLE `tb_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(8) NOT NULL DEFAULT 'G',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `instructions` varchar(512) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_form`
--

INSERT INTO `tb_form` (`id`, `pid`, `type`, `flags`, `title`, `instructions`, `name`, `notes`, `created`, `updated`) VALUES
(1, NULL, 'U', 1, 'Contact Information', NULL, '', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(2, NULL, 'T', 1, 'Ticket Details', 'Please Describe Your Issue', '', 'This form will be attached to every ticket, regardless of its source.\nYou can add any fields to this form and they will be available to all\ntickets, and will be searchable with advanced search and filterable.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(3, NULL, 'C', 1, 'Company Information', 'Details available in email templates', '', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(4, NULL, 'O', 1, 'Organization Information', 'Details on user organization', '', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(5, NULL, 'A', 1, 'Task Details', 'Please Describe The Issue', '', 'This form is used to create a task.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(6, NULL, 'L1', 0, 'Ticket Status Properties', 'Properties that can be set on a ticket status.', '', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_form_entry`
--

CREATE TABLE `tb_form_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED DEFAULT NULL,
  `object_type` char(1) NOT NULL DEFAULT 'T',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `extra` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_form_entry`
--

INSERT INTO `tb_form_entry` (`id`, `form_id`, `object_id`, `object_type`, `sort`, `extra`, `created`, `updated`) VALUES
(1, 4, 1, 'O', 1, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(2, 3, NULL, 'C', 1, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(3, 1, 1, 'U', 1, NULL, '2023-07-11 20:57:16', '2023-07-11 20:57:16'),
(4, 2, 1, 'T', 0, '{\"disable\":[]}', '2023-07-11 20:57:16', '2023-07-11 20:57:16'),
(5, 1, 2, 'U', 1, NULL, '2023-07-11 22:17:23', '2023-07-11 22:17:23'),
(6, 2, 2, 'T', 0, '{\"disable\":[]}', '2023-07-11 22:17:23', '2023-07-11 22:17:23'),
(7, 1, 3, 'U', 1, NULL, '2023-07-12 02:15:10', '2023-07-12 02:15:10'),
(8, 5, 1, 'A', 1, NULL, '2023-07-12 15:52:31', '2023-07-12 15:52:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_form_entry_values`
--

CREATE TABLE `tb_form_entry_values` (
  `entry_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `value` text DEFAULT NULL,
  `value_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_form_entry_values`
--

INSERT INTO `tb_form_entry_values` (`entry_id`, `field_id`, `value`, `value_id`) VALUES
(2, 23, 'Alisson Guedes', NULL),
(2, 24, NULL, NULL),
(2, 25, NULL, NULL),
(2, 26, NULL, NULL),
(4, 20, 'osTicket Installed!', NULL),
(4, 22, NULL, NULL),
(5, 3, '83987752444', NULL),
(5, 4, NULL, NULL),
(6, 20, 'Restituição de valor serviço Cloud', NULL),
(6, 22, 'Normal', 2),
(7, 3, NULL, NULL),
(7, 4, NULL, NULL),
(8, 32, 'Tarefa do ticket 821917', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_form_field`
--

CREATE TABLE `tb_form_field` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED DEFAULT 1,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `label` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `configuration` text DEFAULT NULL,
  `sort` int(11) UNSIGNED NOT NULL,
  `hint` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_form_field`
--

INSERT INTO `tb_form_field` (`id`, `form_id`, `flags`, `type`, `label`, `name`, `configuration`, `sort`, `hint`, `created`, `updated`) VALUES
(1, 1, 489395, 'text', 'Email Address', 'email', '{\"size\":40,\"length\":64,\"validator\":\"email\"}', 1, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(2, 1, 489395, 'text', 'Full Name', 'name', '{\"size\":40,\"length\":64}', 2, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(3, 1, 13057, 'phone', 'Phone Number', 'phone', NULL, 3, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(4, 1, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 4, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(20, 2, 489265, 'text', 'Issue Summary', 'subject', '{\"size\":40,\"length\":50}', 1, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(21, 2, 480547, 'thread', 'Issue Details', 'message', NULL, 2, 'Details on the reason(s) for opening the ticket.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(22, 2, 274609, 'priority', 'Priority Level', 'priority', NULL, 3, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(23, 3, 291249, 'text', 'Company Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(24, 3, 274705, 'text', 'Website', 'website', '{\"size\":40,\"length\":64}', 2, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(25, 3, 274705, 'phone', 'Phone Number', 'phone', '{\"ext\":false}', 3, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(26, 3, 12545, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"html\":false,\"length\":100}', 4, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(27, 4, 489395, 'text', 'Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(28, 4, 13057, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"length\":100,\"html\":false}', 2, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(29, 4, 13057, 'phone', 'Phone', 'phone', NULL, 3, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(30, 4, 13057, 'text', 'Website', 'website', '{\"size\":40,\"length\":0}', 4, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(31, 4, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 5, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(32, 5, 487601, 'text', 'Title', 'title', '{\"size\":40,\"length\":50}', 1, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(33, 5, 413939, 'thread', 'Description', 'description', NULL, 2, 'Details on the reason(s) for creating the task.', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(34, 6, 487665, 'state', 'State', 'state', '{\"prompt\":\"State of a ticket\"}', 1, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(35, 6, 471073, 'memo', 'Description', 'description', '{\"rows\":\"2\",\"cols\":\"40\",\"html\":\"\",\"length\":\"100\"}', 3, NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_group`
--

CREATE TABLE `tb_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(120) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_help_topic`
--

CREATE TABLE `tb_help_topic` (
  `topic_id` int(11) UNSIGNED NOT NULL,
  `topic_pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `noautoresp` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED DEFAULT 0,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `priority_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `page_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sequence_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `topic` varchar(128) NOT NULL DEFAULT '',
  `number_format` varchar(32) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_help_topic`
--

INSERT INTO `tb_help_topic` (`topic_id`, `topic_pid`, `ispublic`, `noautoresp`, `flags`, `status_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `page_id`, `sequence_id`, `sort`, `topic`, `number_format`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 1, 'General Inquiry', NULL, 'Questions about products or services', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(2, 0, 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Feedback', NULL, 'Tickets that primarily concern the sales and billing departments', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(10, 0, 1, 0, 2, 0, 2, 3, 0, 0, 0, 0, 0, 0, 'Report a Problem', NULL, 'Product, service, or equipment related issues', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(11, 10, 1, 0, 2, 0, 3, 0, 0, 0, 1, 0, 0, 1, 'Access Issue', NULL, 'Report an inability access a physical or virtual asset', '2023-07-11 20:57:15', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_help_topic_form`
--

CREATE TABLE `tb_help_topic_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `extra` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_help_topic_form`
--

INSERT INTO `tb_help_topic_form` (`id`, `topic_id`, `form_id`, `sort`, `extra`) VALUES
(1, 1, 2, 1, '{\"disable\":[]}'),
(2, 2, 2, 1, '{\"disable\":[]}'),
(3, 10, 2, 1, '{\"disable\":[]}'),
(4, 11, 2, 1, '{\"disable\":[]}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_list`
--

CREATE TABLE `tb_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_plural` varchar(255) DEFAULT NULL,
  `sort_mode` enum('Alpha','-Alpha','SortCol') NOT NULL DEFAULT 'Alpha',
  `masks` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(16) DEFAULT NULL,
  `configuration` text NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_list`
--

INSERT INTO `tb_list` (`id`, `name`, `name_plural`, `sort_mode`, `masks`, `type`, `configuration`, `notes`, `created`, `updated`) VALUES
(1, 'Ticket Status', 'Ticket Statuses', 'SortCol', 13, 'ticket-status', '{\"handler\":\"TicketStatusList\"}', 'Ticket statuses', '2023-07-11 20:57:15', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_list_items`
--

CREATE TABLE `tb_list_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) DEFAULT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `value` varchar(255) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 1,
  `properties` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_lock`
--

CREATE TABLE `tb_lock` (
  `lock_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expire` datetime DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_note`
--

CREATE TABLE `tb_note` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ext_id` varchar(10) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_organization`
--

CREATE TABLE `tb_organization` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `manager` varchar(16) NOT NULL DEFAULT '',
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `domain` varchar(256) NOT NULL DEFAULT '',
  `extra` text DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_organization`
--

INSERT INTO `tb_organization` (`id`, `name`, `manager`, `status`, `domain`, `extra`, `created`, `updated`) VALUES
(1, 'osTicket', '', 8, '', NULL, '2023-07-11 23:57:15', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_organization__cdata`
--

CREATE TABLE `tb_organization__cdata` (
  `org_id` int(11) UNSIGNED NOT NULL,
  `name` mediumtext DEFAULT NULL,
  `address` mediumtext DEFAULT NULL,
  `phone` mediumtext DEFAULT NULL,
  `website` mediumtext DEFAULT NULL,
  `notes` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_plugin`
--

CREATE TABLE `tb_plugin` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `install_path` varchar(60) NOT NULL,
  `isphar` tinyint(1) NOT NULL DEFAULT 0,
  `isactive` tinyint(1) NOT NULL DEFAULT 0,
  `version` varchar(64) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `installed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_plugin_instance`
--

CREATE TABLE `tb_plugin_instance` (
  `id` int(11) UNSIGNED NOT NULL,
  `plugin_id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_queue`
--

CREATE TABLE `tb_queue` (
  `id` int(11) UNSIGNED NOT NULL,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `columns_id` int(11) UNSIGNED DEFAULT NULL,
  `sort_id` int(11) UNSIGNED DEFAULT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(60) DEFAULT NULL,
  `config` text DEFAULT NULL,
  `filter` varchar(64) DEFAULT NULL,
  `root` varchar(32) DEFAULT NULL,
  `path` varchar(80) NOT NULL DEFAULT '/',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_queue`
--

INSERT INTO `tb_queue` (`id`, `parent_id`, `columns_id`, `sort_id`, `flags`, `staff_id`, `sort`, `title`, `config`, `filter`, `root`, `path`, `created`, `updated`) VALUES
(1, 0, NULL, 1, 3, 0, 1, 'Open', '[[\"status__state\",\"includes\",{\"open\":\"Open\"}]]', NULL, 'T', '/', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(2, 1, NULL, 4, 43, 0, 1, 'Open', '{\"criteria\":[[\"isanswered\",\"nset\",null]],\"conditions\":[]}', NULL, 'T', '/', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(3, 1, NULL, 4, 43, 0, 2, 'Answered', '{\"criteria\":[[\"isanswered\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(4, 1, NULL, 4, 43, 0, 3, 'Overdue', '{\"criteria\":[[\"isoverdue\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(5, 0, NULL, 3, 3, 0, 3, 'My Tickets', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\",\"T\":\"One of my teams\"}],[\"status__state\",\"includes\",{\"open\":\"Open\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(6, 5, NULL, NULL, 43, 0, 1, 'Assigned to Me', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(7, 5, NULL, NULL, 43, 0, 2, 'Assigned to Teams', '{\"criteria\":[[\"assignee\",\"!includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(8, 0, NULL, 5, 3, 0, 4, 'Closed', '{\"criteria\":[[\"status__state\",\"includes\",{\"closed\":\"Closed\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(9, 8, NULL, 5, 43, 0, 1, 'Today', '{\"criteria\":[[\"closed\",\"period\",\"td\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(10, 8, NULL, 5, 43, 0, 2, 'Yesterday', '{\"criteria\":[[\"closed\",\"period\",\"yd\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(11, 8, NULL, 5, 43, 0, 3, 'This Week', '{\"criteria\":[[\"closed\",\"period\",\"tw\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(12, 8, NULL, 5, 43, 0, 4, 'This Month', '{\"criteria\":[[\"closed\",\"period\",\"tm\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(13, 8, NULL, 6, 43, 0, 5, 'This Quarter', '{\"criteria\":[[\"closed\",\"period\",\"tq\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(14, 8, NULL, 7, 43, 0, 6, 'This Year', '{\"criteria\":[[\"closed\",\"period\",\"ty\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-07-11 20:57:15', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_queue_column`
--

CREATE TABLE `tb_queue_column` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL DEFAULT '',
  `primary` varchar(64) NOT NULL DEFAULT '',
  `secondary` varchar(64) DEFAULT NULL,
  `filter` varchar(32) DEFAULT NULL,
  `truncate` varchar(16) DEFAULT NULL,
  `annotations` text DEFAULT NULL,
  `conditions` text DEFAULT NULL,
  `extra` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_queue_column`
--

INSERT INTO `tb_queue_column` (`id`, `flags`, `name`, `primary`, `secondary`, `filter`, `truncate`, `annotations`, `conditions`, `extra`) VALUES
(1, 0, 'Ticket #', 'number', NULL, 'link:ticketP', 'wrap', '[{\"c\":\"TicketSourceDecoration\",\"p\":\"b\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(2, 0, 'Date Created', 'created', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(3, 0, 'Subject', 'cdata__subject', NULL, 'link:ticket', 'ellipsis', '[{\"c\":\"TicketThreadCount\",\"p\":\">\"},{\"c\":\"ThreadAttachmentCount\",\"p\":\"a\"},{\"c\":\"OverdueFlagDecoration\",\"p\":\"<\"},{\"c\":\"LockDecoration\",\"p\":\"<\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(4, 0, 'User Name', 'user__name', NULL, NULL, 'wrap', '[{\"c\":\"ThreadCollaboratorCount\",\"p\":\">\"}]', '[]', NULL),
(5, 0, 'Priority', 'cdata__priority', NULL, NULL, 'wrap', '[]', '[]', NULL),
(6, 0, 'Status', 'status__id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(7, 0, 'Close Date', 'closed', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(8, 0, 'Assignee', 'assignee', NULL, NULL, 'wrap', '[]', '[]', NULL),
(9, 0, 'Due Date', 'duedate', 'est_duedate', 'date:human', 'wrap', '[]', '[]', NULL),
(10, 0, 'Last Updated', 'lastupdate', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(11, 0, 'Department', 'dept_id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(12, 0, 'Last Message', 'thread__lastmessage', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(13, 0, 'Last Response', 'thread__lastresponse', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(14, 0, 'Team', 'team_id', NULL, NULL, 'wrap', '[]', '[]', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_queue_columns`
--

CREATE TABLE `tb_queue_columns` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `column_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `bits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `heading` varchar(64) DEFAULT NULL,
  `width` int(10) UNSIGNED NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_queue_columns`
--

INSERT INTO `tb_queue_columns` (`queue_id`, `column_id`, `staff_id`, `bits`, `sort`, `heading`, `width`) VALUES
(1, 1, 0, 1, 1, 'Ticket', 100),
(1, 3, 0, 1, 3, 'Subject', 300),
(1, 4, 0, 1, 4, 'From', 185),
(1, 5, 0, 1, 5, 'Priority', 85),
(1, 8, 0, 1, 6, 'Assigned To', 160),
(1, 10, 0, 1, 2, 'Last Updated', 150),
(2, 1, 0, 1, 1, 'Ticket', 100),
(2, 3, 0, 1, 3, 'Subject', 300),
(2, 4, 0, 1, 4, 'From', 185),
(2, 5, 0, 1, 5, 'Priority', 85),
(2, 8, 0, 1, 6, 'Assigned To', 160),
(2, 10, 0, 1, 2, 'Last Updated', 150),
(3, 1, 0, 1, 1, 'Ticket', 100),
(3, 3, 0, 1, 3, 'Subject', 300),
(3, 4, 0, 1, 4, 'From', 185),
(3, 5, 0, 1, 5, 'Priority', 85),
(3, 8, 0, 1, 6, 'Assigned To', 160),
(3, 10, 0, 1, 2, 'Last Updated', 150),
(4, 1, 0, 1, 1, 'Ticket', 100),
(4, 3, 0, 1, 3, 'Subject', 300),
(4, 4, 0, 1, 4, 'From', 185),
(4, 5, 0, 1, 5, 'Priority', 85),
(4, 8, 0, 1, 6, 'Assigned To', 160),
(4, 9, 0, 1, 9, 'Due Date', 150),
(5, 1, 0, 1, 1, 'Ticket', 100),
(5, 3, 0, 1, 3, 'Subject', 300),
(5, 4, 0, 1, 4, 'From', 185),
(5, 5, 0, 1, 5, 'Priority', 85),
(5, 10, 0, 1, 2, 'Last Update', 150),
(5, 11, 0, 1, 6, 'Department', 160),
(6, 1, 0, 1, 1, 'Ticket', 100),
(6, 3, 0, 1, 3, 'Subject', 300),
(6, 4, 0, 1, 4, 'From', 185),
(6, 5, 0, 1, 5, 'Priority', 85),
(6, 10, 0, 1, 2, 'Last Update', 150),
(6, 11, 0, 1, 6, 'Department', 160),
(7, 1, 0, 1, 1, 'Ticket', 100),
(7, 3, 0, 1, 3, 'Subject', 300),
(7, 4, 0, 1, 4, 'From', 185),
(7, 5, 0, 1, 5, 'Priority', 85),
(7, 10, 0, 1, 2, 'Last Update', 150),
(7, 14, 0, 1, 6, 'Team', 160),
(8, 1, 0, 1, 1, 'Ticket', 100),
(8, 3, 0, 1, 3, 'Subject', 300),
(8, 4, 0, 1, 4, 'From', 185),
(8, 7, 0, 1, 2, 'Date Closed', 150),
(8, 8, 0, 1, 6, 'Closed By', 160),
(9, 1, 0, 1, 1, 'Ticket', 100),
(9, 3, 0, 1, 3, 'Subject', 300),
(9, 4, 0, 1, 4, 'From', 185),
(9, 7, 0, 1, 2, 'Date Closed', 150),
(9, 8, 0, 1, 6, 'Closed By', 160),
(10, 1, 0, 1, 1, 'Ticket', 100),
(10, 3, 0, 1, 3, 'Subject', 300),
(10, 4, 0, 1, 4, 'From', 185),
(10, 7, 0, 1, 2, 'Date Closed', 150),
(10, 8, 0, 1, 6, 'Closed By', 160),
(11, 1, 0, 1, 1, 'Ticket', 100),
(11, 3, 0, 1, 3, 'Subject', 300),
(11, 4, 0, 1, 4, 'From', 185),
(11, 7, 0, 1, 2, 'Date Closed', 150),
(11, 8, 0, 1, 6, 'Closed By', 160),
(12, 1, 0, 1, 1, 'Ticket', 100),
(12, 3, 0, 1, 3, 'Subject', 300),
(12, 4, 0, 1, 4, 'From', 185),
(12, 7, 0, 1, 2, 'Date Closed', 150),
(12, 8, 0, 1, 6, 'Closed By', 160),
(13, 1, 0, 1, 1, 'Ticket', 100),
(13, 3, 0, 1, 3, 'Subject', 300),
(13, 4, 0, 1, 4, 'From', 185),
(13, 7, 0, 1, 2, 'Date Closed', 150),
(13, 8, 0, 1, 6, 'Closed By', 160),
(14, 1, 0, 1, 1, 'Ticket', 100),
(14, 3, 0, 1, 3, 'Subject', 300),
(14, 4, 0, 1, 4, 'From', 185),
(14, 7, 0, 1, 2, 'Date Closed', 150),
(14, 8, 0, 1, 6, 'Closed By', 160);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_queue_config`
--

CREATE TABLE `tb_queue_config` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `setting` text DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_queue_export`
--

CREATE TABLE `tb_queue_export` (
  `id` int(11) UNSIGNED NOT NULL,
  `queue_id` int(11) UNSIGNED NOT NULL,
  `path` varchar(64) NOT NULL DEFAULT '',
  `heading` varchar(64) DEFAULT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_queue_sort`
--

CREATE TABLE `tb_queue_sort` (
  `id` int(11) UNSIGNED NOT NULL,
  `root` varchar(32) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `columns` text DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_queue_sort`
--

INSERT INTO `tb_queue_sort` (`id`, `root`, `name`, `columns`, `updated`) VALUES
(1, NULL, 'Priority + Most Recently Updated', '[\"-cdata__priority\",\"-lastupdate\"]', '2023-07-11 20:57:15'),
(2, NULL, 'Priority + Most Recently Created', '[\"-cdata__priority\",\"-created\"]', '2023-07-11 20:57:15'),
(3, NULL, 'Priority + Due Date', '[\"-cdata__priority\",\"-est_duedate\"]', '2023-07-11 20:57:15'),
(4, NULL, 'Due Date', '[\"-est_duedate\"]', '2023-07-11 20:57:15'),
(5, NULL, 'Closed Date', '[\"-closed\"]', '2023-07-11 20:57:15'),
(6, NULL, 'Create Date', '[\"-created\"]', '2023-07-11 20:57:15'),
(7, NULL, 'Update Date', '[\"-lastupdate\"]', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_queue_sorts`
--

CREATE TABLE `tb_queue_sorts` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `sort_id` int(11) UNSIGNED NOT NULL,
  `bits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_queue_sorts`
--

INSERT INTO `tb_queue_sorts` (`queue_id`, `sort_id`, `bits`, `sort`) VALUES
(1, 1, 0, 0),
(1, 2, 0, 0),
(1, 3, 0, 0),
(1, 4, 0, 0),
(1, 6, 0, 0),
(1, 7, 0, 0),
(5, 1, 0, 0),
(5, 2, 0, 0),
(5, 3, 0, 0),
(5, 4, 0, 0),
(5, 6, 0, 0),
(5, 7, 0, 0),
(6, 1, 0, 0),
(6, 2, 0, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(7, 1, 0, 0),
(7, 2, 0, 0),
(7, 3, 0, 0),
(7, 4, 0, 0),
(7, 6, 0, 0),
(7, 7, 0, 0),
(8, 1, 0, 0),
(8, 2, 0, 0),
(8, 3, 0, 0),
(8, 4, 0, 0),
(8, 5, 0, 0),
(8, 6, 0, 0),
(8, 7, 0, 0),
(9, 1, 0, 0),
(9, 2, 0, 0),
(9, 3, 0, 0),
(9, 4, 0, 0),
(9, 5, 0, 0),
(9, 6, 0, 0),
(9, 7, 0, 0),
(10, 1, 0, 0),
(10, 2, 0, 0),
(10, 3, 0, 0),
(10, 4, 0, 0),
(10, 5, 0, 0),
(10, 6, 0, 0),
(10, 7, 0, 0),
(11, 1, 0, 0),
(11, 2, 0, 0),
(11, 3, 0, 0),
(11, 4, 0, 0),
(11, 5, 0, 0),
(11, 6, 0, 0),
(11, 7, 0, 0),
(12, 1, 0, 0),
(12, 2, 0, 0),
(12, 3, 0, 0),
(12, 4, 0, 0),
(12, 5, 0, 0),
(12, 6, 0, 0),
(12, 7, 0, 0),
(13, 1, 0, 0),
(13, 2, 0, 0),
(13, 3, 0, 0),
(13, 4, 0, 0),
(13, 5, 0, 0),
(13, 6, 0, 0),
(13, 7, 0, 0),
(14, 1, 0, 0),
(14, 2, 0, 0),
(14, 3, 0, 0),
(14, 4, 0, 0),
(14, 5, 0, 0),
(14, 6, 0, 0),
(14, 7, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_role`
--

CREATE TABLE `tb_role` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(64) DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_role`
--

INSERT INTO `tb_role` (`id`, `flags`, `name`, `permissions`, `notes`, `created`, `updated`) VALUES
(1, 1, 'All Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.delete\":1,\"ticket.edit\":1,\"thread.edit\":1,\"ticket.link\":1,\"ticket.markanswered\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.delete\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with unlimited access', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(2, 1, 'Expanded Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.edit\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with expanded access', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(3, 1, 'Limited Access', '{\"ticket.assign\":1,\"ticket.create\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.reply\":1,\"task.transfer\":1}', 'Role with limited access', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(4, 1, 'View only', NULL, 'Simple role with no permissions', '2023-07-11 20:57:15', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_schedule`
--

CREATE TABLE `tb_schedule` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_schedule`
--

INSERT INTO `tb_schedule` (`id`, `flags`, `name`, `timezone`, `description`, `created`, `updated`) VALUES
(1, 1, 'Monday - Friday 8am - 5pm with U.S. Holidays', NULL, '', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(2, 1, '24/7', NULL, '', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(3, 1, '24/5', NULL, '', '2023-07-11 20:57:15', '2023-07-11 20:57:15'),
(4, 0, 'U.S. Holidays', NULL, '', '2023-07-11 20:57:15', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_schedule_entry`
--

CREATE TABLE `tb_schedule_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `repeats` varchar(16) NOT NULL DEFAULT 'never',
  `starts_on` date DEFAULT NULL,
  `starts_at` time DEFAULT NULL,
  `ends_on` date DEFAULT NULL,
  `ends_at` time DEFAULT NULL,
  `stops_on` datetime DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `week` tinyint(4) DEFAULT NULL,
  `month` tinyint(4) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_schedule_entry`
--

INSERT INTO `tb_schedule_entry` (`id`, `schedule_id`, `flags`, `sort`, `name`, `repeats`, `starts_on`, `starts_at`, `ends_on`, `ends_at`, `stops_on`, `day`, `week`, `month`, `created`, `updated`) VALUES
(1, 1, 0, 0, 'Monday', 'weekly', '2019-01-07', '08:00:00', '2019-01-07', '17:00:00', NULL, 1, NULL, NULL, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(2, 1, 0, 0, 'Tuesday', 'weekly', '2019-01-08', '08:00:00', '2019-01-08', '17:00:00', NULL, 2, NULL, NULL, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(3, 1, 0, 0, 'Wednesday', 'weekly', '2019-01-09', '08:00:00', '2019-01-09', '17:00:00', NULL, 3, NULL, NULL, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(4, 1, 0, 0, 'Thursday', 'weekly', '2019-01-10', '08:00:00', '2019-01-10', '17:00:00', NULL, 4, NULL, NULL, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(5, 1, 0, 0, 'Friday', 'weekly', '2019-01-11', '08:00:00', '2019-01-11', '17:00:00', NULL, 5, NULL, NULL, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(6, 2, 0, 0, 'Daily', 'daily', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(7, 3, 0, 0, 'Weekdays', 'weekdays', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(8, 4, 0, 0, 'New Year\'s Day', 'yearly', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, 1, NULL, 1, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(9, 4, 0, 0, 'MLK Day', 'yearly', '2019-01-21', '00:00:00', '2019-01-21', '23:59:59', NULL, 1, 3, 1, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(10, 4, 0, 0, 'Memorial Day', 'yearly', '2019-05-27', '00:00:00', '2019-05-27', '23:59:59', NULL, 1, -1, 5, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(11, 4, 0, 0, 'Independence Day (4th of July)', 'yearly', '2019-07-04', '00:00:00', '2019-07-04', '23:59:59', NULL, 4, NULL, 7, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(12, 4, 0, 0, 'Labor Day', 'yearly', '2019-09-02', '00:00:00', '2019-09-02', '23:59:59', NULL, 1, 1, 9, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(13, 4, 0, 0, 'Indigenous Peoples\' Day (Whodat Columbus)', 'yearly', '2019-10-14', '00:00:00', '2019-10-14', '23:59:59', NULL, 1, 2, 10, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(14, 4, 0, 0, 'Veterans Day', 'yearly', '2019-11-11', '00:00:00', '2019-11-11', '23:59:59', NULL, 11, NULL, 11, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(15, 4, 0, 0, 'Thanksgiving Day', 'yearly', '2019-11-28', '00:00:00', '2019-11-28', '23:59:59', NULL, 4, 4, 11, '0000-00-00 00:00:00', '2023-07-11 20:57:15'),
(16, 4, 0, 0, 'Christmas Day', 'yearly', '2019-11-25', '00:00:00', '2019-11-25', '23:59:59', NULL, 25, NULL, 12, '0000-00-00 00:00:00', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_sequence`
--

CREATE TABLE `tb_sequence` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `flags` int(10) UNSIGNED DEFAULT NULL,
  `next` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `increment` int(11) DEFAULT 1,
  `padding` char(1) DEFAULT '0',
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_sequence`
--

INSERT INTO `tb_sequence` (`id`, `name`, `flags`, `next`, `increment`, `padding`, `updated`) VALUES
(1, 'General Tickets', 1, 1, 1, '0', '0000-00-00 00:00:00'),
(2, 'Tasks Sequence', 1, 2, 1, '0', '2023-07-12 15:52:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_session`
--

CREATE TABLE `tb_session` (
  `session_id` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `session_data` blob DEFAULT NULL,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` varchar(16) NOT NULL DEFAULT '0' COMMENT 'osTicket staff/client ID',
  `user_ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Despejando dados para a tabela `tb_session`
--

INSERT INTO `tb_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('04q0qo2cgenn4dhvcjf8tr0vn0', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265623936316463613266323963376164333735666433396265393730313761376562323435646261223b733a343a2274696d65223b693a313638393139323130373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33323a222f6f735469636b65742f7075626c69632f7363702f7469636b6574732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2262356463626431303130383233336332323438363239613534356630373163343a313638393139323130373a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393139323131373b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30372d31312032303a35373a3135223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a323b733a323a227132223b643a303b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a323b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a323b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393139323130373b7d7d6c61737463726f6e63616c6c7c693a313638393139323130373b5454447c693a313638393139323235353b, '2023-07-12 17:04:15', '2023-07-12 17:02:15', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('1c50sl7fedbnoddck7h98u99lf', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262646262373037643130313039653031633230666562393264346131333239663431376139643230223b733a343a2274696d65223b693a313638393234343533313b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33323a222f6f735469636b65742f7075626c69632f7363702f7469636b6574732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2236326163386539336238623230303064303835646530666138376235343430363a313638393234343531333a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393234363038343b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a333a22636f6c223b693a333b733a333a22646972223b693a313b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a31303b733a323a227132223b643a383b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a323b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a323b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393234343233393b7d7d6c61737463726f6e63616c6c7c693a313638393234343532313b, '2023-07-13 08:05:13', '2023-07-13 07:35:31', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('1s01aikbgts3hluv6jvq8ee422', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263663939653561343765386565353063373661646535306331663235376439303638323265336437223b733a343a2274696d65223b693a313638393138383135373b7d5f617574687c613a323a7b733a343a2275736572223b4e3b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32313a222f6f735469636b65742f7075626c69632f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2232393732373038326564323831636161626161346333663037343162383135303a313638393138383134313a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393138393032373b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30372d31312032303a35373a3135223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a323b733a323a227132223b643a303b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a323b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a323b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393138373935373b7d7d6c61737463726f6e63616c6c7c693a313638393138373936363b3a6d7367737c613a303a7b7d, '2023-07-12 16:25:41', '2023-07-12 15:55:57', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('2b4pmjq36lbnrrsoqm3uo88q9l', 0x637372667c4e3b, '2023-07-14 12:38:48', '2023-07-13 12:38:48', '0', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('3i5h2nh69s809robnodu8irol1', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239656333326162356434343765356439386533643562303536356333363436346561336237623963223b733a343a2274696d65223b693a313638393232353436333b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33373a222f6f735469636b65742f7075626c69632f7363702f7469636b6574732e7068703f69643d31223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2237353065616262386136396366643735333338343732346463333933636530393a313638393232353435373a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393232353436373b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d6c61737463726f6e63616c6c7c693a313638393232353435383b71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a393b733a323a227132223b643a373b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a323b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a323b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393232353436303b7d7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30372d31312032303a35373a3135223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d5454447c693a313638393232353630333b, '2023-07-13 02:20:03', '2023-07-13 02:18:03', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('87hvrphj2pt59dooik3guus3q0', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238393331386163326138663339623737366639343530383230666133643232356239613432386139223b733a343a2274696d65223b693a313638393132353939373b7d, '2023-07-12 22:39:57', '2023-07-11 22:39:57', '0', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('aisaj0k6sp8esqfm7a35b3jgi9', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262646262373037643130313039653031633230666562393264346131333239663431376139643230223b733a343a2274696d65223b693a313638393234343234363b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33323a222f6f735469636b65742f7075626c69632f7363702f7469636b6574732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2264333734616134313230373064613562333631653730313763623635373463643a313638393234343233363a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393234343234393b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30372d31312032303a35373a3135223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a31303b733a323a227132223b643a383b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a323b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a323b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393234343233393b7d7d6c61737463726f6e63616c6c7c693a313638393234343233393b5454447c693a313638393234343430343b, '2023-07-13 07:33:24', '2023-07-13 07:31:24', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('dbkfk17f65q8efrs2477h2eir4', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233343264643838333365376139313764383530633936346534356131383762313835646531623539223b733a343a2274696d65223b693a313638393230383339373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33373a222f6f735469636b65742f7075626c69632f7363702f7469636b6574732e7068703f69643d31223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2230623238303861626562616232653862373130623862323236653439353339613a313638393230383339373a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393231303034313b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d6c61737463726f6e63616c6c7c693a313638393230383237313b71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a343b733a323a227132223b643a323b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a323b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a323b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393230383237313b7d7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30372d31312032303a35373a3135223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d5454447c693a313638393231303239313b, '2023-07-12 22:04:51', '2023-07-12 22:02:51', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('dre5dvin2n37huk1jiucl1lh7q', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233343264643838333365376139313764383530633936346534356131383762313835646531623539223b733a343a2274696d65223b693a313638393230343838343b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33373a222f6f735469636b65742f7075626c69632f7363702f7469636b6574732e7068703f69643d31223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2231613734653734613735373632316637333866643134393637383561663063323a313638393230343835393a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393230363132353b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d6c61737463726f6e63616c6c7c693a313638393230343838323b71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a333b733a323a227132223b643a313b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a323b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a323b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393230343838323b7d7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30372d31312032303a35373a3135223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d5454447c693a313638393230363439373b, '2023-07-12 21:01:37', '2023-07-12 20:59:37', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('ea5asuge55o9ps53voso74bcj4', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265623936316463613266323963376164333735666433396265393730313761376562323435646261223b733a343a2274696d65223b693a313638393139323837373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33323a222f6f735469636b65742f7075626c69632f7363702f7469636b6574732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2266353939613265346331646138336139336464366430663734616565633863643a313638393139323837373a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393139333933353b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30372d31312032303a35373a3135223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a323b733a323a227132223b643a303b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a323b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a323b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393139323832333b7d7d6c61737463726f6e63616c6c7c693a313638393139323831363b3a63616e6e656446696c65737c613a313a7b693a323b733a31323a226f735469636b65742e747874223b7d3a6d7367737c613a303a7b7d, '2023-07-12 17:44:37', '2023-07-12 17:14:37', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('jr4f0r3hs80ts4mjmcr2jf8vfh', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232323166316563613531623466366631393130373836643538333161396230363263336339663030223b733a343a2274696d65223b693a313638393131393934313b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33303a222f6f735469636b65742f7075626c69632f7363702f61646d696e2e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2236313461303463393630323436313636353237373531616262356362613832663a313638393131393933363a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393131393934363b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d6c61737463726f6e63616c6c7c693a313638393131393933363b5454447c693a313638393132303036393b, '2023-07-11 21:01:09', '2023-07-11 20:59:09', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('k9sof9grtm4d872mp82tojgbnl', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262396666613063353431623262623338633831393663656639323232333638616266363134663138223b733a343a2274696d65223b693a313638393133393837373b7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b613a323a7b733a373a22737472696b6573223b693a353b733a31303a226c617374737472696b65223b693a313638393133393735373b7d7d, '2023-07-13 02:16:19', '2023-07-12 02:31:17', '0', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('kt0t2m0kmcgrr0ou2utstp3scn', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238333033333334323666333435613232333164633030343632396465643337313139633136383166223b733a343a2274696d65223b693a313638393132343736343b7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2236636566633032343435366639323435333031663438653030333263333561313a313638393132333538313a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393132333539313b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a333a22636f6c223b693a333b733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a303b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a313b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393132333538313b7d7d6c61737463726f6e63616c6c7c693a313638393132333538313b, '2023-07-12 21:59:34', '2023-07-11 22:19:24', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('lodueoeiaopnr0vj81ijl5e6r1', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233343264643838333365376139313764383530633936346534356131383762313835646531623539223b733a343a2274696d65223b693a313638393230343331393b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33373a222f6f735469636b65742f7075626c69632f7363702f7469636b6574732e7068703f69643d31223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2233643862393264353264313036616630323939306662653864306162363539623a313638393230343331343a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393230343332343b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d6c61737463726f6e63616c6c7c693a313638393230343331343b71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a323b733a323a227132223b643a303b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a323b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a323b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393230343331383b7d7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30372d31312032303a35373a3135223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d5454447c693a313638393230343434353b, '2023-07-12 20:27:25', '2023-07-12 20:25:25', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('nc8pdslk7b76esidao7o0klg7d', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233343264643838333365376139313764383530633936346534356131383762313835646531623539223b733a343a2274696d65223b693a313638393230383133393b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33373a222f6f735469636b65742f7075626c69632f7363702f7469636b6574732e7068703f69643d31223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2230663534363135326238336337316562353537373562613134356434306432363a313638393230383038393a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393230383137373b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d6c61737463726f6e63616c6c7c693a313638393230363337383b71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a343b733a323a227132223b643a323b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a323b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a323b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393230363337383b7d7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30372d31312032303a35373a3135223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d5454447c693a313638393230383336313b, '2023-07-12 21:32:41', '2023-07-12 21:30:41', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('s7v5k5q6rn9ebb21h1dfluu749', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266613634636430623536653861643033323839343863626466633161363638323763626538313262223b733a343a2274696d65223b693a313638393231353530323b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33373a222f6f735469636b65742f7075626c69632f7363702f7469636b6574732e7068703f69643d31223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2239666161616564303237633630646166393635623130633539333338343966313a313638393231353530323a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393231353531323b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d6c61737463726f6e63616c6c7c693a313638393231353530323b, '2023-07-13 23:31:36', '2023-07-12 23:31:42', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('sq3rrukqet8e6tkj2cidvprt9g', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233343264643838333365376139313764383530633936346534356131383762313835646531623539223b733a343a2274696d65223b693a313638393231303339303b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33373a222f6f735469636b65742f7075626c69632f7363702f7469636b6574732e7068703f69643d31223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2234646164373331373762393831663335663366623935646364366666346663353a313638393231303339303a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393231313937313b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d6c61737463726f6e63616c6c7c693a313638393231303230363b71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a383b733a323a227132223b643a363b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a323b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a323b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393231303230363b7d7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30372d31312032303a35373a3135223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d, '2023-07-12 22:36:30', '2023-07-12 22:06:30', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('t1qtkj990oiaa2om6h2fhu1fs4', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239656333326162356434343765356439386533643562303536356333363436346561336237623963223b733a343a2274696d65223b693a313638393232353438333b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33373a222f6f735469636b65742f7075626c69632f7363702f7469636b6574732e7068703f69643d31223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2237353065616262386136396366643735333338343732346463333933636530393a313638393232353435373a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393232373238333b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d6c61737463726f6e63616c6c7c693a313638393232353435383b71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a393b733a323a227132223b643a373b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a323b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a323b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393232353436303b7d7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30372d31312032303a35373a3135223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d, '2023-07-13 02:48:03', '2023-07-13 02:18:03', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('tkhe4s3oa89qbmhmmo7d2stl56', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233306138633965653030353935313839623966333962373364353562363466316135626163376538223b733a343a2274696d65223b693a313638393133383836313b7d5f617574687c613a333a7b733a343a2275736572223b613a313a7b733a373a22737472696b6573223b693a313b7d733a31313a22757365722d7469636b6574223b733a363a22383231393137223b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a323a7b733a363a22636c69656e74223b733a37363a2238373733626361363634383636656262313839373863366663386634396237383a313638393133383138343a3833376563353735346635303363666161656530393239666434383937346537223b733a353a227374616666223b733a37363a2239333164636136306565666331313233396338383337386266646139346430623a313638393133383835363a3833376563353735346635303363666161656530393239666434383937346537223b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32313a222f6f735469636b65742f7075626c69632f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d54494d455f424f4d427c693a313638393133383836363b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30372d31312032303a35373a3135223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a323b733a323a227132223b643a313b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a313b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393133383835363b7d7d6c61737463726f6e63616c6c7c693a313638393133383835363b3a513a75736572737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d5454447c693a313638393133383938373b, '2023-07-12 02:16:27', '2023-07-12 02:14:27', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('tuita28s9d4ocqmvnklnmislpn', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263663939653561343765386565353063373661646535306331663235376439303638323265336437223b733a343a2274696d65223b693a313638393138373035333b7d5f617574687c613a323a7b733a343a2275736572223b4e3b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32313a222f6f735469636b65742f7075626c69632f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2237303334616633316433376461323235636538613335646430636139343766643a313638393138373035323a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393138373036323b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30372d31312032303a35373a3135223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a323b733a323a227132223b643a313b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a313b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393138373035333b7d7d6c61737463726f6e63616c6c7c693a313638393138373035333b5454447c693a313638393138373334373b, '2023-07-12 15:42:27', '2023-07-12 15:40:27', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
('vrvji5f896ljofg35euoveoosm', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232323166316563613531623466366631393130373836643538333161396230363263336339663030223b733a343a2274696d65223b693a313638393132303132313b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33303a222f6f735469636b65742f7075626c69632f7363702f61646d696e2e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a616c6973736f6e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2231616536623164303332373730396636386439333532626531383065373161353a313638393132303132303a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313638393132313734393b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a33303a22416d65726963612f417267656e74696e612f4275656e6f735f4169726573223b7d6c61737463726f6e63616c6c7c693a313638393131393933363b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30372d31312032303a35373a3135223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e4a3451566e6f417a6a4b333555315653787750747a61456f656151446e5a3d46223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313638393131393937333b7d7d3a6d7367737c4f3a31303a224c6973744f626a656374223a323a7b693a303b4f3a31333a2253696d706c654d657373616765223a333a7b733a343a2274616773223b4e3b733a353a226c6576656c223b693a33303b733a333a226d7367223b733a38373a225469636b657420233c6120687265663d227469636b6574732e7068703f69643d31223e3c623e3438343536353c2f623e3c2f613e3a20496e7465726e616c206e6f746520706f73746564207375636365737366756c6c79223b7d693a313b4f3a31333a2253696d706c654d657373616765223a333a7b733a343a2274616773223b4e3b733a353a226c6576656c223b693a33303b733a333a226d7367223b733a37393a225469636b657420233c6120687265663d227469636b6574732e7068703f69643d31223e3c623e3438343536353c2f623e3c2f613e3a205265706c7920706f73746564207375636365737366756c6c79223b7d7d3a666f726d2d646174617c613a343a7b733a333a22746964223b693a313b733a333a22656964223b693a323b733a393a2274696d657374616d70223b733a31393a22323032332d30372d31312032313a30303a3134223b733a343a2274797065223b733a313a2254223b7d, '2023-07-11 21:32:00', '2023-07-11 21:04:02', '1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_sla`
--

CREATE TABLE `tb_sla` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 3,
  `grace_period` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_sla`
--

INSERT INTO `tb_sla` (`id`, `schedule_id`, `flags`, `grace_period`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 3, 18, 'Default SLA', NULL, '2023-07-11 20:57:15', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_staff`
--

CREATE TABLE `tb_staff` (
  `staff_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT 1,
  `isadmin` tinyint(1) NOT NULL DEFAULT 0,
  `isvisible` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `onvacation` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `assigned_only` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `show_assigned_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `change_passwd` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `max_page_size` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `auto_refresh_rate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `extra` text DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_staff`
--

INSERT INTO `tb_staff` (`staff_id`, `dept_id`, `role_id`, `username`, `firstname`, `lastname`, `passwd`, `backend`, `email`, `phone`, `phone_ext`, `mobile`, `signature`, `lang`, `timezone`, `locale`, `notes`, `isactive`, `isadmin`, `isvisible`, `onvacation`, `assigned_only`, `show_assigned_tickets`, `change_passwd`, `max_page_size`, `auto_refresh_rate`, `default_signature_type`, `default_paper_size`, `extra`, `permissions`, `created`, `lastlogin`, `passwdreset`, `updated`) VALUES
(1, 1, 1, 'alisson', 'Alisson', 'Guedes', '$2a$08$b45wODeBQHKa4S0Zrl2qQ.NYPU36JCRlTQ4UDrvSJ5uKLPkdfDbLy', NULL, 'alissonguedes87@gmail.com', '', NULL, '', '', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 25, 0, 'none', 'Letter', '{\"browser_lang\":\"en_US\"}', '{\"user.create\":1,\"user.delete\":1,\"user.edit\":1,\"user.manage\":1,\"user.dir\":1,\"org.create\":1,\"org.delete\":1,\"org.edit\":1,\"faq.manage\":1,\"visibility.agents\":1,\"emails.banlist\":1,\"visibility.departments\":1}', '2023-07-11 20:57:15', '2023-07-13 07:30:39', '2023-07-11 20:57:15', '2023-07-13 07:30:39'),
(2, 1, 1, 'dev', 'Alisson', 'Guedes', '$2a$08$b45wODeBQHKa4S0Zrl2qQ.NYPU36JCRlTQ4UDrvSJ5uKLPkdfDbLy', NULL, 'alissondevel@gmail.com', '', NULL, '', '', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 25, 0, 'none', 'Letter', '{\"browser_lang\":\"en_US\"}', '{\"user.create\":1,\"user.delete\":1,\"user.edit\":1,\"user.manage\":1,\"user.dir\":1,\"org.create\":1,\"org.delete\":1,\"org.edit\":1,\"faq.manage\":1,\"visibility.agents\":1,\"emails.banlist\":1,\"visibility.departments\":1}', '2023-07-11 20:57:15', '2023-07-12 02:14:16', '2023-07-11 20:57:15', '2023-07-12 02:14:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_staff_dept_access`
--

CREATE TABLE `tb_staff_dept_access` (
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_staff_dept_access`
--

INSERT INTO `tb_staff_dept_access` (`staff_id`, `dept_id`, `role_id`, `flags`) VALUES
(1, 2, 1, 1),
(1, 3, 1, 1),
(2, 2, 1, 1),
(2, 3, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_syslog`
--

CREATE TABLE `tb_syslog` (
  `log_id` int(11) UNSIGNED NOT NULL,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_syslog`
--

INSERT INTO `tb_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(1, 'Debug', 'osTicket installed!', 'Congratulations osTicket basic installation completed!\n\nThank you for choosing osTicket!', '', '::1', '2023-07-11 20:57:16', '2023-07-11 20:57:16'),
(2, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [47ab56f4626c6cc3306e2792a90c2cd13de13809] on http://localhost/osTicket/public/login.php', '', '::1', '2023-07-12 02:13:10', '2023-07-12 02:13:10'),
(3, 'Warning', 'Failed login attempt (user)', 'Username: alissondevel@gmail.com IP: ::1 Time: Jul 12, 2023, 5:19 am UTC Attempts: 3', '', '::1', '2023-07-12 02:19:35', '2023-07-12 02:19:35'),
(4, 'Error', 'Excessive login attempts (user)', 'Excessive login attempts by a user. Username: alissondevel@gmail.com IP: ::1 Time: Jul 12, 2023, 5:28 am UTC Attempts: 5', '', '::1', '2023-07-12 02:28:22', '2023-07-12 02:28:22'),
(5, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [65bbb813e2e2d47a1b867ce9a62a24265c9418d1] on http://localhost/osTicket/public/login.php', '', '::1', '2023-07-12 02:29:03', '2023-07-12 02:29:03'),
(6, 'Error', 'Excessive login attempts (user)', 'Excessive login attempts by a user. Username: dev IP: ::1 Time: Jul 12, 2023, 5:29 am UTC Attempts: 5', '', '::1', '2023-07-12 02:29:17', '2023-07-12 02:29:17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_task`
--

CREATE TABLE `tb_task` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `object_type` char(1) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lock_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `duedate` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_task`
--

INSERT INTO `tb_task` (`id`, `object_id`, `object_type`, `number`, `dept_id`, `staff_id`, `team_id`, `lock_id`, `flags`, `duedate`, `closed`, `created`, `updated`) VALUES
(1, 2, 'T', '1', 1, 1, 0, 0, 1, '2023-07-14 08:00:00', NULL, '2023-07-12 15:52:31', '2023-07-12 15:52:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_task__cdata`
--

CREATE TABLE `tb_task__cdata` (
  `task_id` int(11) UNSIGNED NOT NULL,
  `title` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_task__cdata`
--

INSERT INTO `tb_task__cdata` (`task_id`, `title`) VALUES
(1, 'Tarefa do ticket 821917');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_team`
--

CREATE TABLE `tb_team` (
  `team_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_team`
--

INSERT INTO `tb_team` (`team_id`, `lead_id`, `flags`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'Level I Support', 'Tier 1 support, responsible for the initial iteraction with customers', '2023-07-11 20:57:15', '2023-07-11 20:57:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_team_member`
--

CREATE TABLE `tb_team_member` (
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_thread`
--

CREATE TABLE `tb_thread` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `extra` text DEFAULT NULL,
  `lastresponse` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_thread`
--

INSERT INTO `tb_thread` (`id`, `object_id`, `object_type`, `extra`, `lastresponse`, `lastmessage`, `created`) VALUES
(1, 1, 'T', NULL, '2023-07-12 17:11:35', '2023-07-11 20:57:16', '2023-07-11 20:57:16'),
(2, 2, 'T', NULL, '2023-07-12 15:42:31', '2023-07-11 22:17:23', '2023-07-11 22:17:23'),
(3, 1, 'A', NULL, NULL, NULL, '2023-07-12 15:52:31'),
(4, 3, 'T', NULL, NULL, '2023-07-12 20:25:01', '2023-07-12 20:25:01'),
(5, 4, 'T', NULL, NULL, '2023-07-12 20:55:15', '2023-07-12 20:55:15'),
(6, 5, 'T', NULL, NULL, '2023-07-12 21:39:00', '2023-07-12 21:39:00'),
(7, 6, 'T', NULL, NULL, '2023-07-12 21:44:30', '2023-07-12 21:44:30'),
(8, 7, 'T', NULL, NULL, '2023-07-12 21:46:15', '2023-07-12 21:46:15'),
(9, 8, 'T', NULL, NULL, '2023-07-12 21:50:41', '2023-07-12 21:50:41'),
(10, 9, 'T', NULL, NULL, '2023-07-13 02:10:58', '2023-07-13 02:10:58'),
(11, 10, 'T', NULL, NULL, '2023-07-13 07:18:06', '2023-07-13 07:18:06'),
(12, 11, 'T', NULL, NULL, '2023-07-13 07:19:36', '2023-07-13 07:19:36'),
(13, 12, 'T', NULL, NULL, '2023-07-13 07:19:52', '2023-07-13 07:19:52'),
(14, 13, 'T', NULL, NULL, '2023-07-13 07:21:00', '2023-07-13 07:21:00'),
(15, 14, 'T', NULL, NULL, '2023-07-14 09:37:35', '2023-07-14 09:37:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_thread_collaborator`
--

CREATE TABLE `tb_thread_collaborator` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `role` char(1) NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_thread_entry`
--

CREATE TABLE `tb_thread_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `type` char(1) NOT NULL DEFAULT '',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `poster` varchar(128) NOT NULL DEFAULT '',
  `editor` int(10) UNSIGNED DEFAULT NULL,
  `editor_type` char(1) DEFAULT NULL,
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `format` varchar(16) NOT NULL DEFAULT 'html',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `extra` text DEFAULT NULL,
  `recipients` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_thread_entry`
--

INSERT INTO `tb_thread_entry` (`id`, `pid`, `thread_id`, `staff_id`, `user_id`, `type`, `flags`, `poster`, `editor`, `editor_type`, `source`, `title`, `body`, `format`, `ip_address`, `extra`, `recipients`, `created`, `updated`) VALUES
(1, 0, 1, 0, 1, 'M', 65, 'osTicket Team', NULL, NULL, 'Web', 'osTicket Installed!', ' <p>Thank you for choosing osTicket. </p> <p>Please make sure you join the <a href=\"https://forum.osticket.com\">osTicket forums</a> and our <a href=\"https://osticket.com\">mailing list</a> to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the <a href=\"https://docs.osticket.com\">osTicket Docs</a> provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. </p> <p>If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. </p> <p>If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at <a href=\"https://supportsystem.com\">https://supportsystem.com/</a> -- no installation required and we can import your data! With SupportSystem\'s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. </p> <p>Cheers, </p> <p>-<br /> osTicket Team - https://osticket.com/ </p> <p><strong>PS.</strong> Don\'t just make customers happy, make happy customers! </p>', 'html', '::1', NULL, NULL, '2023-07-11 20:57:16', '0000-00-00 00:00:00'),
(2, 0, 1, 1, 0, 'N', 64, 'Alisson Guedes', NULL, NULL, '', 'Teste', '<p>Teste</p>', 'html', '::1', NULL, NULL, '2023-07-11 21:00:14', '0000-00-00 00:00:00'),
(3, 1, 1, 1, 0, 'R', 576, 'Alisson Guedes', NULL, NULL, '', NULL, '<p>Nova resposta</p>', 'html', '::1', NULL, '{\"to\":{\"1\":\"osTicket Team <feedback@osticket.com>\"}}', '2023-07-11 21:02:01', '0000-00-00 00:00:00'),
(4, 0, 2, 0, 2, 'M', 65, 'Alisson Guedes Pereira', NULL, NULL, '', NULL, '<p>Olá, eu gostaria de solicitar a restituição do valor pelo tempo de indisponibilidade tratado no ticket de número [183192].</p> <p>Desde já, agradeço a compreensão e ajuda de vocês!</p>', 'html', '::1', NULL, NULL, '2023-07-11 22:17:23', '0000-00-00 00:00:00'),
(5, 4, 2, 1, 0, 'R', 576, 'Alisson Guedes', NULL, NULL, '', NULL, '<p>Teste</p>', 'html', '::1', NULL, '{\"to\":{\"2\":\"Alisson Guedes Pereira <alissonguedes87@gmail.com>\"}}', '2023-07-12 15:42:31', '0000-00-00 00:00:00'),
(6, 0, 3, 1, 0, 'M', 65, 'Alisson Guedes', NULL, NULL, '', NULL, '<p>Nova tarefa</p>', 'html', '::1', NULL, NULL, '2023-07-12 15:52:31', '0000-00-00 00:00:00'),
(7, 1, 1, 1, 0, 'R', 576, 'Alisson Guedes', NULL, NULL, '', NULL, '<p>Hi osTicket,</p> <p>osTicket is a widely-used open source support ticket system, an<br />attractive alternative to higher-cost and complex customer support<br />systems - simple, lightweight, reliable, open source, web-based and easy<br />to setup and use.Hi osTicket,<br /><br /><br /><br /><br />Your ticket #484565 created on 7/11/23 8:57 PM is in<br />Support department.<br /></p> <p><br /></p> <p>Your ticket #484565 created on 7/11/23 8:57 PM is in</p> <p>Support department.</p>', 'html', '::1', NULL, '{\"to\":{\"1\":\"osTicket Team <feedback@osticket.com>\"}}', '2023-07-12 17:11:35', '0000-00-00 00:00:00'),
(8, 0, 4, 1, 0, 'T', 65, 'Alisson Guedes', NULL, NULL, '', NULL, '<p>Teste</p>', 'html', '', NULL, NULL, '2023-07-12 20:26:00', '0000-00-00 00:00:00'),
(9, 0, 5, 0, 0, 'M', 0, 'Alisson Guedes', NULL, NULL, '', NULL, '<h3><strong>Passagem padrão original de Lorem Ipsum, usada desde o século XVI.</strong></h3><p class=\"ql-align-justify\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3><strong>Seção 1.10.32 de \"de Finibus Bonorum et Malorum\", escrita por Cícero em 45 AC</strong></h3><p class=\"ql-align-justify\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3><strong>Tradução para o inglês por H. Rackha, feita em 1914</strong></h3><p class=\"ql-align-justify\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3><strong>Seção 1.10.33 de \"de Finibus Bonorum et Malorum\", escrita por Cícero em 45 AC</strong></h3><p class=\"ql-align-justify\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3><strong>Tradução para o inglês por H. Rackha, feita em 1914</strong></h3><p class=\"ql-align-justify\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', 'html', '', NULL, NULL, '2023-07-12 20:59:17', '0000-00-00 00:00:00'),
(10, 0, 6, 0, 0, 'M', 0, 'Alisson Guedes', NULL, NULL, '', NULL, '<p>teste</p>', 'html', '', NULL, NULL, '2023-07-12 21:42:13', '0000-00-00 00:00:00'),
(11, 0, 7, 0, 0, 'M', 0, 'Alisson Guedes', NULL, NULL, '', NULL, '<p>asdfasdfasdfasdfasdf</p>', 'html', '', NULL, NULL, '2023-07-12 21:44:54', '0000-00-00 00:00:00'),
(12, 0, 8, 0, 0, 'M', 0, 'Alisson Guedes', NULL, NULL, '', NULL, '<p>kkkk	</p>', 'html', '', NULL, NULL, '2023-07-12 21:47:17', '0000-00-00 00:00:00'),
(13, 0, 9, 0, 1, 'M', 0, 'Alisson Guedes', NULL, NULL, '', NULL, '<p>fffffffffffffffff</p>', 'html', '', NULL, NULL, '2023-07-12 21:52:18', '0000-00-00 00:00:00'),
(14, 0, 10, 0, 1, 'M', 0, 'Alisson Guedes', NULL, NULL, '', NULL, '<p>Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...</p><p>Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...</p><p><br></p><p>Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...</p><p>Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...</p><p>Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...</p><p><br></p><p>Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...</p>', 'html', '', NULL, NULL, '2023-07-13 02:13:54', '0000-00-00 00:00:00'),
(15, 0, 14, 0, 1, 'M', 0, 'Alisson Guedes', NULL, NULL, '', NULL, '<p>Alisson Guedes Pereira	</p>', 'html', '', NULL, NULL, '2023-07-13 07:21:16', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_thread_entry_email`
--

CREATE TABLE `tb_thread_entry_email` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_entry_id` int(11) UNSIGNED NOT NULL,
  `email_id` int(11) UNSIGNED DEFAULT NULL,
  `mid` varchar(255) NOT NULL,
  `headers` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_thread_entry_merge`
--

CREATE TABLE `tb_thread_entry_merge` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_entry_id` int(11) UNSIGNED NOT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_thread_event`
--

CREATE TABLE `tb_thread_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `thread_type` char(1) NOT NULL DEFAULT '',
  `event_id` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `team_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL,
  `data` varchar(1024) DEFAULT NULL COMMENT 'Encoded differences',
  `username` varchar(128) NOT NULL DEFAULT 'SYSTEM',
  `uid` int(11) UNSIGNED DEFAULT NULL,
  `uid_type` char(1) NOT NULL DEFAULT 'S',
  `annulled` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_thread_event`
--

INSERT INTO `tb_thread_event` (`id`, `thread_id`, `thread_type`, `event_id`, `staff_id`, `team_id`, `dept_id`, `topic_id`, `data`, `username`, `uid`, `uid_type`, `annulled`, `timestamp`) VALUES
(1, 1, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 1, 'U', 0, '2023-07-11 20:57:16'),
(2, 2, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 2, 'U', 0, '2023-07-11 22:17:23'),
(3, 3, 'A', 1, 0, 0, 1, 0, NULL, 'alisson', 1, 'S', 0, '2023-07-12 15:52:31'),
(4, 3, 'A', 4, 1, 0, 1, 0, '{\"claim\":true}', 'alisson', 1, 'S', 0, '2023-07-12 15:52:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_thread_referral`
--

CREATE TABLE `tb_thread_referral` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_ticket`
--

CREATE TABLE `tb_ticket` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `ticket_pid` int(11) UNSIGNED DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_email_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `lock_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `source_extra` varchar(40) DEFAULT NULL,
  `isoverdue` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `isanswered` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `duedate` datetime DEFAULT NULL,
  `est_duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_ticket`
--

INSERT INTO `tb_ticket` (`ticket_id`, `ticket_pid`, `number`, `user_id`, `user_email_id`, `status_id`, `dept_id`, `sla_id`, `topic_id`, `staff_id`, `team_id`, `email_id`, `lock_id`, `flags`, `sort`, `ip_address`, `source`, `source_extra`, `isoverdue`, `isanswered`, `duedate`, `est_duedate`, `reopened`, `closed`, `lastupdate`, `created`, `updated`) VALUES
(1, NULL, '484565', 1, 0, 1, 1, 1, 1, 1, 0, 0, 5, 0, 0, '::1', 'Web', NULL, 0, 1, NULL, '2023-07-14 08:00:00', NULL, NULL, '2023-07-11 20:57:16', '2023-07-11 20:57:16', '2023-07-12 17:14:27'),
(2, NULL, '821917', 2, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, '::1', 'Web', NULL, 0, 1, NULL, '2023-07-14 08:00:00', NULL, NULL, '2023-07-11 22:17:23', '2023-07-11 22:17:23', '2023-07-12 15:44:31'),
(3, NULL, '196089', 1, 0, 1, 3, 1, 11, 0, 0, 0, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-07-12 20:26:00', '2023-07-12 20:25:01', '2023-07-12 20:26:00'),
(4, NULL, '826891', 1, 0, 1, 2, 1, 11, 0, 0, 0, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-07-12 20:59:17', '2023-07-12 20:55:15', '2023-07-12 20:59:17'),
(5, NULL, '553676', 1, 0, 1, 3, 1, 11, 0, 0, 0, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-07-12 21:42:13', '2023-07-12 21:39:00', '2023-07-12 21:42:13'),
(6, NULL, '910606', 1, 0, 1, 3, 1, 11, 0, 0, 0, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-07-12 21:44:54', '2023-07-12 21:44:30', '2023-07-12 21:44:54'),
(7, NULL, '947190', 1, 0, 1, 2, 1, 11, 0, 0, 0, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-07-12 21:47:17', '2023-07-12 21:46:15', '2023-07-12 21:47:17'),
(8, NULL, '930432', 1, 0, 1, 3, 1, 11, 0, 0, 0, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-07-12 21:52:18', '2023-07-12 21:50:41', '2023-07-12 21:52:18'),
(9, NULL, '931257', 1, 0, 1, 3, 1, 11, 0, 0, 0, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-07-13 02:13:54', '2023-07-13 02:10:58', '2023-07-13 02:13:54'),
(10, NULL, '539441', 1, 0, 6, 3, 1, 11, 0, 0, 0, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-07-13 07:18:06', '2023-07-13 07:18:06', '2023-07-13 07:18:06'),
(11, NULL, '797511', 1, 0, 6, 3, 1, 11, 0, 0, 0, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-07-13 07:19:36', '2023-07-13 07:19:36', '2023-07-13 07:19:36'),
(12, NULL, '204859', 1, 0, 6, 3, 1, 11, 0, 0, 0, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-07-13 07:19:52', '2023-07-13 07:19:52', '2023-07-13 07:19:52'),
(13, NULL, '954147', 1, 0, 1, 3, 1, 11, 0, 0, 0, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-07-13 07:21:16', '2023-07-13 07:21:00', '2023-07-13 07:21:15'),
(14, NULL, '575787', 1, 0, 6, 3, 1, 11, 0, 0, 0, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-07-14 09:37:35', '2023-07-14 09:37:35', '2023-07-14 09:37:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_ticket_priority`
--

CREATE TABLE `tb_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(255) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ispublic` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_ticket_priority`
--

INSERT INTO `tb_ticket_priority` (`priority_id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`) VALUES
(1, 'low', 'Low', '#DDFFDD', 4, 1),
(2, 'normal', 'Normal', 'var(--blue)', 3, 1),
(3, 'high', 'High', 'var(--orange)', 2, 1),
(4, 'emergency', 'Emergency', 'var(--red)', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_ticket_status`
--

CREATE TABLE `tb_ticket_status` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `state` varchar(16) DEFAULT NULL,
  `mode` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `properties` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_ticket_status`
--

INSERT INTO `tb_ticket_status` (`id`, `name`, `state`, `mode`, `flags`, `sort`, `properties`, `created`, `updated`) VALUES
(1, 'Open', 'open', 3, 0, 1, '{\"description\":\"Open tickets.\"}', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(2, 'Resolved', 'closed', 1, 0, 2, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Resolved tickets\"}', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(3, 'Closed', 'closed', 3, 0, 3, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Closed tickets. Tickets will still be accessible on client and staff panels.\"}', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(4, 'Archived', 'archived', 3, 0, 4, '{\"description\":\"Tickets only adminstratively available but no longer accessible on ticket queues and client panel.\"}', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(5, 'Deleted', 'deleted', 3, 0, 5, '{\"description\":\"Tickets queued for deletion. Not accessible on ticket queues.\"}', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(6, 'Draft', 'draft', 3, 0, 6, '{\"description\":\"Draft.\"}', '2023-07-11 20:57:15', '0000-00-00 00:00:00'),
(7, 'In Progress', 'in-progress', 3, 0, 6, '{\"description\":\"In Progress.\"}', '2023-07-11 20:57:15', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_ticket__cdata`
--

CREATE TABLE `tb_ticket__cdata` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `subject` mediumtext DEFAULT NULL,
  `priority` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_ticket__cdata`
--

INSERT INTO `tb_ticket__cdata` (`ticket_id`, `subject`, `priority`) VALUES
(1, 'osTicket Installed!', ''),
(2, 'Restituição de valor serviço Cloud', '2'),
(3, 'Médicus Teste', NULL),
(4, 'Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...', NULL),
(5, 'TEste', NULL),
(6, 'asdfasdfasdfasdfasdfasdfasdfasdf', NULL),
(7, 'kkkk', NULL),
(8, 'ffffffffffffffff', NULL),
(9, 'Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...', NULL),
(13, 'Não há ninguém que ame a dor por si só, que a busque e queira tê-la, simplesmente por ser dor...', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_translation`
--

CREATE TABLE `tb_translation` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_hash` char(16) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `type` enum('phrase','article','override') DEFAULT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `revision` int(11) UNSIGNED DEFAULT NULL,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lang` varchar(16) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `source_text` text DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `org_id` int(10) UNSIGNED NOT NULL,
  `default_email_id` int(10) NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_user`
--

INSERT INTO `tb_user` (`id`, `org_id`, `default_email_id`, `status`, `name`, `created`, `updated`) VALUES
(1, 1, 1, 0, 'osTicket Team', '2023-07-11 20:57:16', '2023-07-11 20:57:16'),
(2, 0, 2, 0, 'Alisson Guedes Pereira', '2023-07-11 22:17:23', '2023-07-11 22:17:23'),
(3, 1, 3, 0, 'Alisson', '2023-07-12 02:15:10', '2023-07-12 02:15:10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_user_account`
--

CREATE TABLE `tb_user_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `timezone` varchar(64) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `passwd` varchar(128) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `extra` text DEFAULT NULL,
  `registered` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_user_email`
--

CREATE TABLE `tb_user_email` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_user_email`
--

INSERT INTO `tb_user_email` (`id`, `user_id`, `flags`, `address`) VALUES
(1, 1, 0, 'feedback@osticket.com'),
(2, 2, 0, 'alissonguedes87@gmail.com'),
(3, 3, 0, 'alissondevel@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_user__cdata`
--

CREATE TABLE `tb_user__cdata` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `email` mediumtext DEFAULT NULL,
  `name` mediumtext DEFAULT NULL,
  `phone` mediumtext DEFAULT NULL,
  `notes` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_user__cdata`
--

INSERT INTO `tb_user__cdata` (`user_id`, `email`, `name`, `phone`, `notes`) VALUES
(2, NULL, NULL, '83987752444', ''),
(3, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb__search`
--

CREATE TABLE `tb__search` (
  `object_type` varchar(8) NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb__search`
--

INSERT INTO `tb__search` (`object_type`, `object_id`, `title`, `content`) VALUES
('H', 1, 'osTicket Installed!', 'Thank you for choosing osTicket. Please make sure you join the osTicket forums and our mailing list to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket Docs provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at https://supportsystem.com/ -- no installation required and we can import your data! With SupportSystem\'s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. Cheers, - osTicket Team - https://osticket.com/ PS. Don\'t just make customers happy, make happy customers!'),
('H', 2, 'Teste', 'Teste'),
('H', 3, '', 'Nova resposta'),
('H', 4, '', 'Olá, eu gostaria de solicitar a restituição do valor pelo tempo de indisponibilidade tratado no ticket de número [183192]. Desde já, agradeço a compreensão e ajuda de vocês!'),
('H', 5, '', 'Teste'),
('H', 6, '', 'Nova tarefa'),
('H', 7, '', 'Hi osTicket, osTicket is a widely-used open source support ticket system, an attractive alternative to higher-cost and complex customer support systems - simple, lightweight, reliable, open source, web-based and easy to setup and use.Hi osTicket, Your ticket #484565 created on 7/11/23 8:57 PM is in Support department. Your ticket #484565 created on 7/11/23 8:57 PM is in Support department.'),
('O', 1, 'osTicket', ''),
('T', 1, '484565 osTicket Installed!', 'osTicket Installed!'),
('T', 2, '821917 Restituição de valor serviço Cloud', 'Restituição de valor serviço Cloud'),
('U', 1, 'osTicket Team', 'feedback@osticket.com'),
('U', 2, 'Alisson Guedes Pereira', '83987752444 alissonguedes87@gmail.com\nalissonguedes87@gmail.com'),
('U', 3, 'Alisson', ' alissondevel@gmail.com\nalissondevel@gmail.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_api_key`
--
ALTER TABLE `tb_api_key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apikey` (`apikey`),
  ADD KEY `ipaddr` (`ipaddr`);

--
-- Índices de tabela `tb_attachment`
--
ALTER TABLE `tb_attachment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file-type` (`object_id`,`file_id`,`type`),
  ADD UNIQUE KEY `file_object` (`file_id`,`object_id`);

--
-- Índices de tabela `tb_canned_response`
--
ALTER TABLE `tb_canned_response`
  ADD PRIMARY KEY (`canned_id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `active` (`isenabled`);

--
-- Índices de tabela `tb_config`
--
ALTER TABLE `tb_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `namespace` (`namespace`,`key`);

--
-- Índices de tabela `tb_content`
--
ALTER TABLE `tb_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `tb_department`
--
ALTER TABLE `tb_department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`pid`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `autoresp_email_id` (`autoresp_email_id`),
  ADD KEY `tpl_id` (`tpl_id`),
  ADD KEY `flags` (`flags`);

--
-- Índices de tabela `tb_draft`
--
ALTER TABLE `tb_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `namespace` (`namespace`);

--
-- Índices de tabela `tb_email`
--
ALTER TABLE `tb_email`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Índices de tabela `tb_email_account`
--
ALTER TABLE `tb_email_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`),
  ADD KEY `type` (`type`);

--
-- Índices de tabela `tb_email_template`
--
ALTER TABLE `tb_email_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_lookup` (`tpl_id`,`code_name`);

--
-- Índices de tabela `tb_email_template_group`
--
ALTER TABLE `tb_email_template_group`
  ADD PRIMARY KEY (`tpl_id`);

--
-- Índices de tabela `tb_event`
--
ALTER TABLE `tb_event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `tb_faq`
--
ALTER TABLE `tb_faq`
  ADD PRIMARY KEY (`faq_id`),
  ADD UNIQUE KEY `question` (`question`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `ispublished` (`ispublished`);

--
-- Índices de tabela `tb_faq_category`
--
ALTER TABLE `tb_faq_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Índices de tabela `tb_faq_topic`
--
ALTER TABLE `tb_faq_topic`
  ADD PRIMARY KEY (`faq_id`,`topic_id`);

--
-- Índices de tabela `tb_file`
--
ALTER TABLE `tb_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ft` (`ft`),
  ADD KEY `key` (`key`),
  ADD KEY `signature` (`signature`),
  ADD KEY `type` (`type`),
  ADD KEY `created` (`created`),
  ADD KEY `size` (`size`);

--
-- Índices de tabela `tb_file_chunk`
--
ALTER TABLE `tb_file_chunk`
  ADD PRIMARY KEY (`file_id`,`chunk_id`);

--
-- Índices de tabela `tb_filter`
--
ALTER TABLE `tb_filter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `email_id` (`email_id`);

--
-- Índices de tabela `tb_filter_action`
--
ALTER TABLE `tb_filter_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Índices de tabela `tb_filter_rule`
--
ALTER TABLE `tb_filter_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Índices de tabela `tb_form`
--
ALTER TABLE `tb_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Índices de tabela `tb_form_entry`
--
ALTER TABLE `tb_form_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_lookup` (`object_type`,`object_id`);

--
-- Índices de tabela `tb_form_entry_values`
--
ALTER TABLE `tb_form_entry_values`
  ADD PRIMARY KEY (`entry_id`,`field_id`);

--
-- Índices de tabela `tb_form_field`
--
ALTER TABLE `tb_form_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`),
  ADD KEY `sort` (`sort`);

--
-- Índices de tabela `tb_group`
--
ALTER TABLE `tb_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Índices de tabela `tb_help_topic`
--
ALTER TABLE `tb_help_topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD UNIQUE KEY `topic` (`topic`,`topic_pid`),
  ADD KEY `topic_pid` (`topic_pid`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`,`team_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `page_id` (`page_id`);

--
-- Índices de tabela `tb_help_topic_form`
--
ALTER TABLE `tb_help_topic_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic-form` (`topic_id`,`form_id`);

--
-- Índices de tabela `tb_list`
--
ALTER TABLE `tb_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Índices de tabela `tb_list_items`
--
ALTER TABLE `tb_list_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_item_lookup` (`list_id`);

--
-- Índices de tabela `tb_lock`
--
ALTER TABLE `tb_lock`
  ADD PRIMARY KEY (`lock_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Índices de tabela `tb_note`
--
ALTER TABLE `tb_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ext_id` (`ext_id`);

--
-- Índices de tabela `tb_organization`
--
ALTER TABLE `tb_organization`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_organization__cdata`
--
ALTER TABLE `tb_organization__cdata`
  ADD PRIMARY KEY (`org_id`);

--
-- Índices de tabela `tb_plugin`
--
ALTER TABLE `tb_plugin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `install_path` (`install_path`);

--
-- Índices de tabela `tb_plugin_instance`
--
ALTER TABLE `tb_plugin_instance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plugin_id` (`plugin_id`);

--
-- Índices de tabela `tb_queue`
--
ALTER TABLE `tb_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Índices de tabela `tb_queue_column`
--
ALTER TABLE `tb_queue_column`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_queue_columns`
--
ALTER TABLE `tb_queue_columns`
  ADD PRIMARY KEY (`queue_id`,`column_id`,`staff_id`);

--
-- Índices de tabela `tb_queue_config`
--
ALTER TABLE `tb_queue_config`
  ADD PRIMARY KEY (`queue_id`,`staff_id`);

--
-- Índices de tabela `tb_queue_export`
--
ALTER TABLE `tb_queue_export`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_id` (`queue_id`);

--
-- Índices de tabela `tb_queue_sort`
--
ALTER TABLE `tb_queue_sort`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_queue_sorts`
--
ALTER TABLE `tb_queue_sorts`
  ADD PRIMARY KEY (`queue_id`,`sort_id`);

--
-- Índices de tabela `tb_role`
--
ALTER TABLE `tb_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `tb_schedule`
--
ALTER TABLE `tb_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_schedule_entry`
--
ALTER TABLE `tb_schedule_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `repeats` (`repeats`);

--
-- Índices de tabela `tb_sequence`
--
ALTER TABLE `tb_sequence`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_session`
--
ALTER TABLE `tb_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `updated` (`session_updated`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `tb_sla`
--
ALTER TABLE `tb_sla`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `tb_staff`
--
ALTER TABLE `tb_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `issuperuser` (`isadmin`),
  ADD KEY `isactive` (`isactive`),
  ADD KEY `onvacation` (`onvacation`);

--
-- Índices de tabela `tb_staff_dept_access`
--
ALTER TABLE `tb_staff_dept_access`
  ADD PRIMARY KEY (`staff_id`,`dept_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Índices de tabela `tb_syslog`
--
ALTER TABLE `tb_syslog`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_type` (`log_type`);

--
-- Índices de tabela `tb_task`
--
ALTER TABLE `tb_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `created` (`created`),
  ADD KEY `object` (`object_id`,`object_type`),
  ADD KEY `flags` (`flags`);

--
-- Índices de tabela `tb_task__cdata`
--
ALTER TABLE `tb_task__cdata`
  ADD PRIMARY KEY (`task_id`);

--
-- Índices de tabela `tb_team`
--
ALTER TABLE `tb_team`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Índices de tabela `tb_team_member`
--
ALTER TABLE `tb_team_member`
  ADD PRIMARY KEY (`team_id`,`staff_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Índices de tabela `tb_thread`
--
ALTER TABLE `tb_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `object_type` (`object_type`);

--
-- Índices de tabela `tb_thread_collaborator`
--
ALTER TABLE `tb_thread_collaborator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collab` (`thread_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `tb_thread_entry`
--
ALTER TABLE `tb_thread_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `thread_id` (`thread_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `type` (`type`);

--
-- Índices de tabela `tb_thread_entry_email`
--
ALTER TABLE `tb_thread_entry_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `email_id` (`email_id`);

--
-- Índices de tabela `tb_thread_entry_merge`
--
ALTER TABLE `tb_thread_entry_merge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`);

--
-- Índices de tabela `tb_thread_event`
--
ALTER TABLE `tb_thread_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_state` (`thread_id`,`event_id`,`timestamp`),
  ADD KEY `ticket_stats` (`timestamp`,`event_id`);

--
-- Índices de tabela `tb_thread_referral`
--
ALTER TABLE `tb_thread_referral`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref` (`object_id`,`object_type`,`thread_id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Índices de tabela `tb_ticket`
--
ALTER TABLE `tb_ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created` (`created`),
  ADD KEY `closed` (`closed`),
  ADD KEY `duedate` (`duedate`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `ticket_pid` (`ticket_pid`);

--
-- Índices de tabela `tb_ticket_priority`
--
ALTER TABLE `tb_ticket_priority`
  ADD PRIMARY KEY (`priority_id`),
  ADD UNIQUE KEY `priority` (`priority`),
  ADD KEY `priority_urgency` (`priority_urgency`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Índices de tabela `tb_ticket_status`
--
ALTER TABLE `tb_ticket_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `state` (`state`);

--
-- Índices de tabela `tb_ticket__cdata`
--
ALTER TABLE `tb_ticket__cdata`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Índices de tabela `tb_translation`
--
ALTER TABLE `tb_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`lang`),
  ADD KEY `object_hash` (`object_hash`);

--
-- Índices de tabela `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_id` (`org_id`),
  ADD KEY `default_email_id` (`default_email_id`),
  ADD KEY `name` (`name`);

--
-- Índices de tabela `tb_user_account`
--
ALTER TABLE `tb_user_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `tb_user_email`
--
ALTER TABLE `tb_user_email`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address` (`address`),
  ADD KEY `user_email_lookup` (`user_id`);

--
-- Índices de tabela `tb_user__cdata`
--
ALTER TABLE `tb_user__cdata`
  ADD PRIMARY KEY (`user_id`);

--
-- Índices de tabela `tb__search`
--
ALTER TABLE `tb__search`
  ADD PRIMARY KEY (`object_type`,`object_id`);
ALTER TABLE `tb__search` ADD FULLTEXT KEY `search` (`title`,`content`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_api_key`
--
ALTER TABLE `tb_api_key`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_attachment`
--
ALTER TABLE `tb_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `tb_canned_response`
--
ALTER TABLE `tb_canned_response`
  MODIFY `canned_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_config`
--
ALTER TABLE `tb_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT de tabela `tb_content`
--
ALTER TABLE `tb_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `tb_department`
--
ALTER TABLE `tb_department`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_draft`
--
ALTER TABLE `tb_draft`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tb_email`
--
ALTER TABLE `tb_email`
  MODIFY `email_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_email_account`
--
ALTER TABLE `tb_email_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_email_template`
--
ALTER TABLE `tb_email_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `tb_email_template_group`
--
ALTER TABLE `tb_email_template_group`
  MODIFY `tpl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_event`
--
ALTER TABLE `tb_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `tb_faq`
--
ALTER TABLE `tb_faq`
  MODIFY `faq_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_faq_category`
--
ALTER TABLE `tb_faq_category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_file`
--
ALTER TABLE `tb_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_filter`
--
ALTER TABLE `tb_filter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_filter_action`
--
ALTER TABLE `tb_filter_action`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_filter_rule`
--
ALTER TABLE `tb_filter_rule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_form`
--
ALTER TABLE `tb_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tb_form_entry`
--
ALTER TABLE `tb_form_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tb_form_field`
--
ALTER TABLE `tb_form_field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `tb_group`
--
ALTER TABLE `tb_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_help_topic`
--
ALTER TABLE `tb_help_topic`
  MODIFY `topic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `tb_help_topic_form`
--
ALTER TABLE `tb_help_topic_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_list`
--
ALTER TABLE `tb_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_list_items`
--
ALTER TABLE `tb_list_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_lock`
--
ALTER TABLE `tb_lock`
  MODIFY `lock_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_note`
--
ALTER TABLE `tb_note`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_organization`
--
ALTER TABLE `tb_organization`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_plugin`
--
ALTER TABLE `tb_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_plugin_instance`
--
ALTER TABLE `tb_plugin_instance`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_queue`
--
ALTER TABLE `tb_queue`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `tb_queue_column`
--
ALTER TABLE `tb_queue_column`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `tb_queue_export`
--
ALTER TABLE `tb_queue_export`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_queue_sort`
--
ALTER TABLE `tb_queue_sort`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_role`
--
ALTER TABLE `tb_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_schedule`
--
ALTER TABLE `tb_schedule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_schedule_entry`
--
ALTER TABLE `tb_schedule_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `tb_sequence`
--
ALTER TABLE `tb_sequence`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_sla`
--
ALTER TABLE `tb_sla`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_staff`
--
ALTER TABLE `tb_staff`
  MODIFY `staff_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_syslog`
--
ALTER TABLE `tb_syslog`
  MODIFY `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tb_task`
--
ALTER TABLE `tb_task`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_team`
--
ALTER TABLE `tb_team`
  MODIFY `team_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_thread`
--
ALTER TABLE `tb_thread`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tb_thread_collaborator`
--
ALTER TABLE `tb_thread_collaborator`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_thread_entry`
--
ALTER TABLE `tb_thread_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tb_thread_entry_email`
--
ALTER TABLE `tb_thread_entry_email`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_thread_entry_merge`
--
ALTER TABLE `tb_thread_entry_merge`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_thread_event`
--
ALTER TABLE `tb_thread_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_thread_referral`
--
ALTER TABLE `tb_thread_referral`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_ticket`
--
ALTER TABLE `tb_ticket`
  MODIFY `ticket_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `tb_ticket_priority`
--
ALTER TABLE `tb_ticket_priority`
  MODIFY `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_ticket_status`
--
ALTER TABLE `tb_ticket_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_translation`
--
ALTER TABLE `tb_translation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_user_account`
--
ALTER TABLE `tb_user_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_user_email`
--
ALTER TABLE `tb_user_email`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
