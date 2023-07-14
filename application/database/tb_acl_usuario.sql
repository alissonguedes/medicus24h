-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 11-Jul-2023 às 12:15
-- Versão do servidor: 10.3.35-MariaDB
-- versão do PHP: 8.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `medicus_sistema-bkp-11-07_9h`
--

--
-- Extraindo dados da tabela `tb_acl_usuario`
--

INSERT INTO `tb_acl_usuario` (`id`, `id_grupo`, `id_funcionario`, `id_gestor`, `nome`, `email`, `login`, `senha`, `salt`, `token`, `permissao`, `ultimo_login`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, NULL, 0, 'Alisson Guedes', 'alissonguedes87@gmail.com', 'alisson', '3d536bf0be85f3dec621dce1b12db8c1977bf276bd7f3778e7eb7cb459dc48b8a5c30a7a57e6d', NULL, 'eyJ0aW1lc3RhbXAiOjE2ODU2MTMzNDYsImV4cGlyZXMiOjE2ODU2MjA1NDYsIm1vZHVsbyI6Mn0=', 1111, '2023-07-11 08:59:43', '2022-06-24 05:43:09', '2023-07-03 06:04:19', '1'),
(2, 2, NULL, 0, 'Déborah Chianca', 'deborahchianca@medicus24h.com.br', 'deborahchianca@medicus24h.com.br', '3ffbf99945de7a986ed29db1701b54a3a9973de76912a954ae45f9014059cfae97ea90ddc437d', NULL, 'eyJ0aW1lc3RhbXAiOjE2ODQ5NTQ5NzAsImV4cGlyZXMiOjE2ODQ5NjIxNzAsIm1vZHVsbyI6NX0=', 1111, '2023-05-25 14:02:07', '2023-01-28 19:12:58', '2023-05-24 19:25:19', '1'),
(3, 2, NULL, 0, 'Tatiana', 'gestao@medicus24h.com.br', 'tatiana', '1d4aa2e76b81177494333f8c4d05b75f492faae23c3b7658231aa61b42f5bd00988ea64dcf960', NULL, NULL, 1111, '2023-07-03 01:25:47', '2023-01-28 19:52:08', NULL, '1'),
(6, 2, NULL, 0, 'Edinilton', 'edinilton.souza@medicus24h.com.br', 'edinilton', '4b0073f96547546b699c59f16c77c603a46c28e5e0ad787fda2b8015f0e3dd232306cf076e262', NULL, NULL, 1111, '2023-07-03 01:48:51', '2023-03-04 23:19:06', '2023-03-07 01:00:22', '1'),
(7, 2, NULL, 0, 'Gleizer', 'gleizermedicus24h@gmail.com', 'gleizermedicus24h@gmail.com', '0cce35184a2bbfd4d97536f7df2b5c89456429485e6934b3dd279cbbfe889bc51122a4036f5e3', NULL, NULL, 1111, '2023-04-12 09:57:58', '2023-03-28 19:35:02', '2023-03-28 23:55:16', '1'),
(9, 2, NULL, 0, 'Cristiani Lordes', 'cris@medicus24.com.br', 'cristiani.lordes', '32c260b9b5c7e6ebe076981e70c945fb41f4018987c6b892178c1e28cbc28b647cf7f03aa1fbc', NULL, NULL, 1111, '2023-07-03 11:52:25', '2023-06-20 01:16:56', '2023-07-03 14:51:26', '1');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
