-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 24/05/2023 às 13:43
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
-- Banco de dados: `medicus_sistema_estrutura`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_grupo`
--

CREATE TABLE `tb_acl_grupo` (
  `id` int(11) UNSIGNED NOT NULL,
  `grupo` varchar(25) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `permissao` smallint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 1111,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de grupos de usuários.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_menu`
--

CREATE TABLE `tb_acl_menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_grupo` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `editavel` enum('0','1') NOT NULL DEFAULT '1',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de grupos de menus';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_menu_descricao`
--

CREATE TABLE `tb_acl_menu_descricao` (
  `id_menu` int(11) UNSIGNED NOT NULL,
  `id_idioma` int(11) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_menu_grupo`
--

CREATE TABLE `tb_acl_menu_grupo` (
  `id_grupo` int(11) UNSIGNED NOT NULL,
  `id_menu` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para atribuir menus a grupos de usuários';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_menu_item`
--

CREATE TABLE `tb_acl_menu_item` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_controller` int(11) UNSIGNED NOT NULL COMMENT 'Referencia a tabela (tb_acl_modulo_controller ou tb_acl_modulo_post) para a qual aponta o menu',
  `id_parent` int(11) UNSIGNED DEFAULT NULL COMMENT 'Campo para hierarquia do menu',
  `id_route` int(11) NOT NULL DEFAULT 0,
  `descricao` varchar(50) DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL COMMENT 'É o nome da tabela referenciada. Seria a tb_acl_modulo_controller (controller) ou tb_acl_modulo_post (post)',
  `link` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `target` varchar(20) DEFAULT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `permissao` smallint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 1111,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `divider` tinyint(1) NOT NULL DEFAULT 0,
  `editavel` enum('0','1') NOT NULL DEFAULT '1',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de itens do menus';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_menu_item_descricao`
--

CREATE TABLE `tb_acl_menu_item_descricao` (
  `id_item` int(11) UNSIGNED NOT NULL,
  `id_idioma` int(11) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_menu_item_menu`
--

CREATE TABLE `tb_acl_menu_item_menu` (
  `id_menu` int(11) UNSIGNED NOT NULL,
  `id_item` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_menu_secao`
--

CREATE TABLE `tb_acl_menu_secao` (
  `id` int(11) UNSIGNED NOT NULL,
  `secao` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de seções de menus. Seções correspondem ao local onde o menu se localizará: sidebar, header, footer, etc...';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_modulo`
--

CREATE TABLE `tb_acl_modulo` (
  `id` int(11) UNSIGNED NOT NULL,
  `modulo` varchar(50) NOT NULL,
  `path` varchar(50) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `permissao` smallint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 1111,
  `descricao` varchar(200) DEFAULT NULL,
  `homepage` int(11) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `restrict` enum('yes','no') NOT NULL DEFAULT 'no',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de módulos. Módulos correspondem aos diretórios da aplicação: main, admin, etc...';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_modulo_controller`
--

CREATE TABLE `tb_acl_modulo_controller` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_modulo` int(11) UNSIGNED NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `controller` varchar(100) NOT NULL,
  `use_as` varchar(100) DEFAULT NULL,
  `permissao` smallint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 1111,
  `restrict` enum('yes','no') NOT NULL DEFAULT 'no',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_modulo_controller_descricao`
--

CREATE TABLE `tb_acl_modulo_controller_descricao` (
  `id_controller` int(11) UNSIGNED NOT NULL,
  `id_idioma` int(11) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_modulo_grupo`
--

CREATE TABLE `tb_acl_modulo_grupo` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_grupo` int(11) UNSIGNED NOT NULL,
  `id_modulo` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para atribuições de menus a grupos de usuários.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_modulo_grupo_menu`
--

CREATE TABLE `tb_acl_modulo_grupo_menu` (
  `id_modulo_grupo` int(11) UNSIGNED NOT NULL,
  `id_menu` int(11) UNSIGNED NOT NULL,
  `status` enum('0','1') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_modulo_routes`
--

CREATE TABLE `tb_acl_modulo_routes` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `id_controller` int(11) UNSIGNED NOT NULL,
  `id_parent` int(11) UNSIGNED DEFAULT NULL,
  `type` enum('any','get','post','put','head','options','delete','patch','match','resource','map','group') NOT NULL DEFAULT 'get',
  `route` varchar(255) NOT NULL,
  `action` varchar(100) NOT NULL,
  `filter` longtext DEFAULT NULL,
  `permissao` smallint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 1111,
  `restrict` enum('yes','no','inherit') NOT NULL DEFAULT 'inherit',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de rotas de menus.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_pacote`
--

CREATE TABLE `tb_acl_pacote` (
  `id` int(11) UNSIGNED NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_pacote_modulo`
--

CREATE TABLE `tb_acl_pacote_modulo` (
  `id_pacote` int(11) UNSIGNED NOT NULL,
  `id_modulo` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_usuario`
--

CREATE TABLE `tb_acl_usuario` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_grupo` int(11) UNSIGNED NOT NULL,
  `id_funcionario` int(11) UNSIGNED DEFAULT NULL,
  `id_gestor` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `permissao` smallint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 1111,
  `ultimo_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de usuários';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_usuario_config`
--

CREATE TABLE `tb_acl_usuario_config` (
  `id_usuario` int(11) UNSIGNED NOT NULL COMMENT 'Número sequencial da tabela.',
  `id_modulo` int(11) UNSIGNED NOT NULL,
  `id_config` int(11) UNSIGNED NOT NULL,
  `value` longtext DEFAULT NULL COMMENT 'Endereço do website',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de configurações do site';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_usuario_imagem`
--

CREATE TABLE `tb_acl_usuario_imagem` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `privada` enum('0','1') NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_usuario_session`
--

CREATE TABLE `tb_acl_usuario_session` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `id_modulo` int(11) UNSIGNED NOT NULL,
  `token` varchar(60) DEFAULT NULL,
  `ip` varchar(39) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `started_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expired_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_sys_config`
--

CREATE TABLE `tb_sys_config` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Número sequencial da tabela.',
  `id_modulo` int(11) UNSIGNED NOT NULL,
  `config` varchar(255) NOT NULL,
  `value` longtext DEFAULT NULL COMMENT 'Endereço do website',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de configurações do site';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_sys_dicionario`
--

CREATE TABLE `tb_sys_dicionario` (
  `id` int(11) UNSIGNED NOT NULL,
  `palavra` text NOT NULL,
  `definicao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_sys_idioma`
--

CREATE TABLE `tb_sys_idioma` (
  `id` int(11) UNSIGNED NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `sigla` varchar(7) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_sys_idioma_dicionario`
--

CREATE TABLE `tb_sys_idioma_dicionario` (
  `id_idioma` int(11) UNSIGNED NOT NULL,
  `id_palavra` int(11) UNSIGNED NOT NULL,
  `traducao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_acl_grupo`
--
ALTER TABLE `tb_acl_grupo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `grupo` (`grupo`);

--
-- Índices de tabela `tb_acl_menu`
--
ALTER TABLE `tb_acl_menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_acl_menu_descricao`
--
ALTER TABLE `tb_acl_menu_descricao`
  ADD PRIMARY KEY (`id_idioma`,`id_menu`),
  ADD KEY `fk_tb_produto_descricao_tb_produto1_idx` (`id_menu`),
  ADD KEY `fk_tb_produto_descricao_tb_sys_idioma1_idx` (`id_idioma`);

--
-- Índices de tabela `tb_acl_menu_grupo`
--
ALTER TABLE `tb_acl_menu_grupo`
  ADD PRIMARY KEY (`id_grupo`,`id_menu`),
  ADD KEY `fk_tb_acl_menu_grupo_tb_acl_menu_id_menu` (`id_menu`);

--
-- Índices de tabela `tb_acl_menu_item`
--
ALTER TABLE `tb_acl_menu_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_menu_item_id_item_post` (`id_controller`),
  ADD KEY `fk_tb_acl_menu_item_id_parent` (`id_parent`);

--
-- Índices de tabela `tb_acl_menu_item_descricao`
--
ALTER TABLE `tb_acl_menu_item_descricao`
  ADD PRIMARY KEY (`id_idioma`,`id_item`),
  ADD KEY `fk_tb_menu_item_descricao_id_item` (`id_item`),
  ADD KEY `fk_tb_menu_item_descricao_id_idioma` (`id_idioma`);

--
-- Índices de tabela `tb_acl_menu_item_menu`
--
ALTER TABLE `tb_acl_menu_item_menu`
  ADD PRIMARY KEY (`id_item`,`id_menu`),
  ADD KEY `fk_tb_acl_menu_item_menu_id_menu` (`id_menu`);

--
-- Índices de tabela `tb_acl_menu_secao`
--
ALTER TABLE `tb_acl_menu_secao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_acl_modulo`
--
ALTER TABLE `tb_acl_modulo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modulo` (`modulo`),
  ADD UNIQUE KEY `diretorio` (`path`),
  ADD KEY `fk_tb_acl_modulo_homepage` (`homepage`);

--
-- Índices de tabela `tb_acl_modulo_controller`
--
ALTER TABLE `tb_acl_modulo_controller`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id_modulo_controller` (`controller`,`id_modulo`),
  ADD UNIQUE KEY `use_as` (`use_as`),
  ADD KEY `fk_tb_acl_modulo_classe_tb_acl_modulo1_idx` (`id_modulo`);

--
-- Índices de tabela `tb_acl_modulo_controller_descricao`
--
ALTER TABLE `tb_acl_modulo_controller_descricao`
  ADD PRIMARY KEY (`id_idioma`,`id_controller`),
  ADD KEY `fk_tb_acl_modulo_controller_descricao_id_controller_id_item` (`id_controller`,`id_idioma`);

--
-- Índices de tabela `tb_acl_modulo_grupo`
--
ALTER TABLE `tb_acl_modulo_grupo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_acl_modulo_grupo_id_grupo_id_modulo_UNIQUE` (`id_grupo`,`id_modulo`) USING BTREE,
  ADD KEY `fk_tb_acl_modulo_grupo_id_grupo` (`id_grupo`),
  ADD KEY `fk_tb_acl_modulo_grupo_tb_acl_modulo1_idx` (`id_modulo`);

--
-- Índices de tabela `tb_acl_modulo_grupo_menu`
--
ALTER TABLE `tb_acl_modulo_grupo_menu`
  ADD PRIMARY KEY (`id_menu`,`id_modulo_grupo`) USING BTREE,
  ADD KEY `tb_acl_modulo_menu_id_menu_id_modulo_UNIQUE` (`id_menu`,`id_modulo_grupo`),
  ADD KEY `fk_tb_acl_modulo_menu_id_modulo_idx` (`id_modulo_grupo`);

--
-- Índices de tabela `tb_acl_modulo_routes`
--
ALTER TABLE `tb_acl_modulo_routes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `route_controller_action_name_UNIQUE` (`type`,`route`,`action`,`name`) USING BTREE,
  ADD KEY `fk_tb_acl_rotas_tb_acl_modulo_classe1_idx` (`id_controller`),
  ADD KEY `fk_tb_acl_modulo_routes_id_parent` (`id_parent`);

--
-- Índices de tabela `tb_acl_pacote`
--
ALTER TABLE `tb_acl_pacote`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `titulo` (`titulo`);

--
-- Índices de tabela `tb_acl_pacote_modulo`
--
ALTER TABLE `tb_acl_pacote_modulo`
  ADD PRIMARY KEY (`id_pacote`,`id_modulo`),
  ADD KEY `fk_tb_pacote_modulo_id_modulo` (`id_modulo`),
  ADD KEY `fk_tb_acl_pacote_modulo_id_pacote` (`id_pacote`) USING BTREE;

--
-- Índices de tabela `tb_acl_usuario`
--
ALTER TABLE `tb_acl_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `fk_tb_acl_usuario_id_grupo` (`id_grupo`),
  ADD KEY `fk_tb_acl_usuario_id_funcionario` (`id_funcionario`);

--
-- Índices de tabela `tb_acl_usuario_config`
--
ALTER TABLE `tb_acl_usuario_config`
  ADD PRIMARY KEY (`id_usuario`,`id_config`),
  ADD KEY `fk_tb_acl_usuario_config_id_config` (`id_config`),
  ADD KEY `fk_tb_acl_usuario_config_id_modulo` (`id_modulo`);

--
-- Índices de tabela `tb_acl_usuario_imagem`
--
ALTER TABLE `tb_acl_usuario_imagem`
  ADD PRIMARY KEY (`id`,`id_usuario`),
  ADD KEY `tb_acl_usuario_imagem_id_usuario` (`id_usuario`);

--
-- Índices de tabela `tb_acl_usuario_session`
--
ALTER TABLE `tb_acl_usuario_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_acl_usuario_session_id_usuario` (`id_usuario`),
  ADD KEY `fk_tb_acl_usuario_session_id_modulo` (`id_modulo`);

--
-- Índices de tabela `tb_sys_config`
--
ALTER TABLE `tb_sys_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`config`),
  ADD KEY `fk_tb_sys_config_id_modulo` (`id_modulo`);

--
-- Índices de tabela `tb_sys_dicionario`
--
ALTER TABLE `tb_sys_dicionario`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_sys_idioma`
--
ALTER TABLE `tb_sys_idioma`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sigla` (`sigla`);

--
-- Índices de tabela `tb_sys_idioma_dicionario`
--
ALTER TABLE `tb_sys_idioma_dicionario`
  ADD PRIMARY KEY (`id_idioma`,`id_palavra`),
  ADD KEY `fk_tb_sys_idioma_id_palavra` (`id_palavra`),
  ADD KEY `fk_tb_sys_idioma_id_idioma` (`id_idioma`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_acl_grupo`
--
ALTER TABLE `tb_acl_grupo`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_acl_menu`
--
ALTER TABLE `tb_acl_menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tb_acl_menu_item`
--
ALTER TABLE `tb_acl_menu_item`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `tb_acl_menu_secao`
--
ALTER TABLE `tb_acl_menu_secao`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_acl_modulo`
--
ALTER TABLE `tb_acl_modulo`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_acl_modulo_controller`
--
ALTER TABLE `tb_acl_modulo_controller`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `tb_acl_modulo_grupo`
--
ALTER TABLE `tb_acl_modulo_grupo`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `tb_acl_modulo_routes`
--
ALTER TABLE `tb_acl_modulo_routes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT de tabela `tb_acl_usuario`
--
ALTER TABLE `tb_acl_usuario`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `tb_acl_usuario_config`
--
ALTER TABLE `tb_acl_usuario_config`
  MODIFY `id_usuario` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Número sequencial da tabela.', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_acl_usuario_imagem`
--
ALTER TABLE `tb_acl_usuario_imagem`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_acl_usuario_session`
--
ALTER TABLE `tb_acl_usuario_session`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de tabela `tb_sys_config`
--
ALTER TABLE `tb_sys_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Número sequencial da tabela.', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `tb_sys_dicionario`
--
ALTER TABLE `tb_sys_dicionario`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_sys_idioma`
--
ALTER TABLE `tb_sys_idioma`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_acl_menu_descricao`
--
ALTER TABLE `tb_acl_menu_descricao`
  ADD CONSTRAINT `tb_acl_menu_descricao_id_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_acl_menu_descricao_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `tb_acl_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_menu_grupo`
--
ALTER TABLE `tb_acl_menu_grupo`
  ADD CONSTRAINT `fk_tb_acl_menu_grupo_tb_acl_grupo_id_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `tb_acl_grupo` (`id`),
  ADD CONSTRAINT `fk_tb_acl_menu_grupo_tb_acl_menu_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `tb_acl_menu` (`id`);

--
-- Restrições para tabelas `tb_acl_menu_item`
--
ALTER TABLE `tb_acl_menu_item`
  ADD CONSTRAINT `fk_tb_acl_menu_item_id_parent` FOREIGN KEY (`id_parent`) REFERENCES `tb_acl_menu_item` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_tb_menu_item_id_controller` FOREIGN KEY (`id_controller`) REFERENCES `tb_acl_modulo_controller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_menu_item_descricao`
--
ALTER TABLE `tb_acl_menu_item_descricao`
  ADD CONSTRAINT `tb_acl_menu_item_descricao_id_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_acl_menu_item_descricao_id_item` FOREIGN KEY (`id_item`) REFERENCES `tb_acl_menu_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_menu_item_menu`
--
ALTER TABLE `tb_acl_menu_item_menu`
  ADD CONSTRAINT `fk_tb_acl_menu_item_menu_id_item` FOREIGN KEY (`id_item`) REFERENCES `tb_acl_menu_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_acl_menu_item_menu_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `tb_acl_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_modulo`
--
ALTER TABLE `tb_acl_modulo`
  ADD CONSTRAINT `fk_tb_acl_modulo_homepage` FOREIGN KEY (`homepage`) REFERENCES `tb_acl_modulo_routes` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Restrições para tabelas `tb_acl_modulo_controller`
--
ALTER TABLE `tb_acl_modulo_controller`
  ADD CONSTRAINT `fk_tb_acl_modulo_classe_tb_acl_modulo1` FOREIGN KEY (`id_modulo`) REFERENCES `tb_acl_modulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_modulo_controller_descricao`
--
ALTER TABLE `tb_acl_modulo_controller_descricao`
  ADD CONSTRAINT `fk_tb_acl_modulo_controller_descricao_id_controller` FOREIGN KEY (`id_controller`) REFERENCES `tb_acl_modulo_controller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_acl_modulo_controller_descricao_id_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_modulo_grupo`
--
ALTER TABLE `tb_acl_modulo_grupo`
  ADD CONSTRAINT `fk_tb_acl_menu_grupo_id_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `tb_acl_grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_acl_modulo_grupo_tb_acl_modulo1` FOREIGN KEY (`id_modulo`) REFERENCES `tb_acl_modulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_modulo_grupo_menu`
--
ALTER TABLE `tb_acl_modulo_grupo_menu`
  ADD CONSTRAINT `fk_tb_acl_modulo_menu_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `tb_acl_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_acl_modulo_menu_id_modulo` FOREIGN KEY (`id_modulo_grupo`) REFERENCES `tb_acl_modulo_grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_modulo_routes`
--
ALTER TABLE `tb_acl_modulo_routes`
  ADD CONSTRAINT `fk_tb_acl_modulo_routes_id_parent` FOREIGN KEY (`id_parent`) REFERENCES `tb_acl_modulo_routes` (`id`),
  ADD CONSTRAINT `fk_tb_acl_rotas_tb_acl_modulo_classe1` FOREIGN KEY (`id_controller`) REFERENCES `tb_acl_modulo_controller` (`id`);

--
-- Restrições para tabelas `tb_acl_pacote_modulo`
--
ALTER TABLE `tb_acl_pacote_modulo`
  ADD CONSTRAINT `fk_tb_pacote_modulo_id_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `tb_acl_modulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_pacote_modulo_id_pacote` FOREIGN KEY (`id_pacote`) REFERENCES `tb_acl_pacote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_usuario`
--
ALTER TABLE `tb_acl_usuario`
  ADD CONSTRAINT `fk_tb_acl_usuario_id_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `tb_acl_grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_usuario_config`
--
ALTER TABLE `tb_acl_usuario_config`
  ADD CONSTRAINT `fk_tb_acl_usuario_config_id_config` FOREIGN KEY (`id_config`) REFERENCES `tb_sys_config` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_acl_usuario_config_id_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `tb_acl_modulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_acl_usuario_config_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_acl_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_usuario_imagem`
--
ALTER TABLE `tb_acl_usuario_imagem`
  ADD CONSTRAINT `tb_acl_usuario_imagem_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_acl_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_usuario_session`
--
ALTER TABLE `tb_acl_usuario_session`
  ADD CONSTRAINT `fk_tb_acl_usuario_session_id_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `tb_acl_modulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_acl_usuario_session_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_acl_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_sys_config`
--
ALTER TABLE `tb_sys_config`
  ADD CONSTRAINT `fk_tb_sys_config_id_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `tb_acl_modulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_sys_idioma_dicionario`
--
ALTER TABLE `tb_sys_idioma_dicionario`
  ADD CONSTRAINT `fk_tb_sys_idioma_id_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_sys_idioma_id_palavra` FOREIGN KEY (`id_palavra`) REFERENCES `tb_sys_dicionario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
