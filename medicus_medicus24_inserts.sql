-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 24-Maio-2023 às 17:03
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
-- Banco de dados: `medicus_medicus24h_dados_estrtutura`
--

--
-- Extraindo dados da tabela `tb_acomodacao`
--

INSERT INTO `tb_acomodacao` (`id`, `descricao`, `status`) VALUES
(1, 'Outros', '1'),
(2, 'Apartamento', '1'),
(3, 'Enfermaria', '1');

--
-- Extraindo dados da tabela `tb_atendimento_tipo`
--

INSERT INTO `tb_atendimento_tipo` (`id`, `tipo`, `descricao`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Primeira consulta', 'Quando o paciente visita pela primeira vez a clínica e solicita um atendimento.', '2023-01-03 12:19:44', NULL, '1'),
(2, 'Retorno', 'O paciente já foi atendido uma vez, e agora precisa remarcar um novo exame', '2023-01-03 12:19:44', NULL, '1');

--
-- Extraindo dados da tabela `tb_categoria`
--

INSERT INTO `tb_categoria` (`id`, `id_parent`, `imagem`, `color`, `text_color`, `ordem`, `created_at`, `updated_at`, `status`) VALUES
(1, 0, NULL, '#81c784', '#000000', 0, '2022-11-18 03:02:55', NULL, '1'),
(2, 0, NULL, '#42a5f5', '#000000', 0, '2022-11-18 03:02:59', NULL, '1'),
(3, 0, NULL, '#fff176', '#000000', 0, '2022-11-18 03:03:04', NULL, '1'),
(4, 0, NULL, '#ef9a9a', '#000000', 0, '2022-11-18 03:03:05', NULL, '1'),
(5, 2, NULL, '#42a5f5', NULL, 0, '2022-11-18 03:03:06', NULL, '1'),
(6, 2, NULL, '#42a5f5', NULL, 0, '2022-11-18 03:03:07', NULL, '1'),
(7, 2, NULL, '#42a5f5', NULL, 0, '2022-11-18 03:03:07', NULL, '1');

--
-- Extraindo dados da tabela `tb_categoria_descricao`
--

INSERT INTO `tb_categoria_descricao` (`id_categoria`, `id_idioma`, `titulo`, `descricao`, `meta_description`, `meta_title`, `meta_keywords`) VALUES
(1, 1, 'Consulta', '', '', '', ''),
(2, 1, 'Exame', '', '', '', ''),
(3, 1, 'Procedimento', '', '', '', ''),
(4, 1, 'Cirurgia', '', '', '', ''),
(5, 1, 'Laboratório', '', '', '', ''),
(6, 1, 'Imagem', '', '', '', ''),
(7, 1, 'Outros', '', '', '', '');

--
-- Extraindo dados da tabela `tb_convenio`
--

INSERT INTO `tb_convenio` (`id`, `id_parent`, `descricao`, `codigo`, `flag`, `status`) VALUES
(1, NULL, 'Sem convênio', '0', '', '1'),
(2, NULL, 'Médicus24h', '2', '', '1');

--
-- Extraindo dados da tabela `tb_convenio_planos`
--

INSERT INTO `tb_convenio_planos` (`id`, `id_convenio`, `descricao`, `flag`, `created_at`, `updated_at`, `status`) VALUES
(1, 2, 'Plano Bronze', 'linear-gradient(to right, #e48425, #ff7f00);', '2023-03-04 04:40:54', NULL, '1'),
(2, 2, 'Plano Silver', 'linear-gradient(to right, #c0c0c0, #ebebeb);', '2023-03-04 04:40:54', NULL, '1'),
(3, 2, 'Plano Gold', 'linear-gradient(to right, #f5d421, #ffd700);', '2023-03-04 04:40:54', NULL, '1'),
(4, 1, 'Particular', 'linear-gradient(to right, #e48425, #ff7f00);', '2023-03-04 04:40:54', NULL, '1');

--
-- Extraindo dados da tabela `tb_convenio_planos_servicos`
--

INSERT INTO `tb_convenio_planos_servicos` (`id`, `id_plano`, `id_servico`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 1, '2023-03-04 04:43:09', NULL, '1'),
(2, 1, 2, '2023-03-04 04:43:09', NULL, '1');

--
-- Extraindo dados da tabela `tb_departamento`
--

INSERT INTO `tb_departamento` (`id`, `titulo`, `descricao`, `created_at`, `updated_at`, `status`) VALUES
(8, 'Recepção', NULL, '2022-11-29 10:06:40', NULL, '1'),
(9, 'Pediatria', NULL, '2022-11-29 10:06:50', '2022-12-15 11:55:44', '1'),
(10, 'Bloco cirúrgico', NULL, '2022-11-29 10:07:07', '2023-01-12 05:08:09', '1'),
(11, 'Laboratório', NULL, '2023-05-16 10:17:29', '2023-05-17 18:02:48', '1'),
(12, 'Urgência e Emergência', NULL, '2023-05-16 10:17:57', '2023-05-17 18:03:28', '1'),
(13, 'Administração', NULL, '2023-05-16 10:18:07', '2023-05-17 18:03:37', '1'),
(14, 'Recursos Humanos', NULL, '2023-05-17 18:03:48', NULL, '1');

--
-- Extraindo dados da tabela `tb_departamento_empresa`
--

INSERT INTO `tb_departamento_empresa` (`id`, `id_departamento`, `id_empresa`, `status`) VALUES
(1, 13, 16, '1'),
(2, 10, 16, '1'),
(3, 11, 16, '1'),
(4, 9, 16, '1'),
(5, 8, 16, '1'),
(6, 14, 16, '1'),
(7, 12, 16, '1'),
(8, 13, 21, '1'),
(9, 10, 21, '1'),
(10, 11, 21, '1'),
(11, 9, 21, '1'),
(12, 8, 21, '1'),
(13, 14, 21, '1'),
(14, 12, 21, '1'),
(15, 13, 20, '1'),
(16, 10, 20, '1'),
(17, 11, 20, '1'),
(18, 9, 20, '1'),
(19, 8, 20, '1'),
(20, 14, 20, '1'),
(21, 12, 20, '1'),
(22, 13, 22, '1'),
(23, 10, 22, '1'),
(24, 11, 22, '1'),
(25, 9, 22, '1'),
(26, 8, 22, '1'),
(27, 14, 22, '1'),
(28, 12, 22, '1'),
(29, 13, 19, '1'),
(30, 10, 19, '1'),
(31, 11, 19, '1'),
(32, 9, 19, '1'),
(33, 8, 19, '1'),
(34, 14, 19, '1'),
(35, 12, 19, '1'),
(36, 13, 18, '1'),
(37, 10, 18, '1'),
(38, 11, 18, '1'),
(39, 9, 18, '1'),
(40, 8, 18, '1'),
(41, 14, 18, '1'),
(42, 12, 18, '1'),
(43, 13, 17, '1'),
(44, 10, 17, '1'),
(45, 11, 17, '1'),
(46, 9, 17, '1'),
(47, 8, 17, '1'),
(48, 14, 17, '1'),
(49, 12, 17, '1'),
(50, 13, 23, '1'),
(51, 10, 23, '1'),
(52, 11, 23, '1'),
(53, 9, 23, '1'),
(54, 8, 23, '1'),
(55, 14, 23, '1'),
(56, 12, 23, '1');

--
-- Extraindo dados da tabela `tb_empresa`
--

INSERT INTO `tb_empresa` (`id`, `titulo`, `nome_fantasia`, `razao_social`, `cnpj`, `inscricao_estadual`, `inscricao_municipal`, `cep`, `logradouro`, `numero`, `bairro`, `complemento`, `cidade`, `uf`, `pais`, `quem_somos`, `quem_somos_imagem`, `distribuidor_imagem`, `contato_imagem`, `telefone`, `celular`, `email`, `facebook`, `instagram`, `youtube`, `linkedin`, `github`, `gmaps`, `aliquota_imposto`, `tributacao`, `certificado`, `senha_certificado`, `ambiente`, `sequence_nfe`, `sequence_nfce`, `serie_nfe`, `serie_nfce`, `tokencsc`, `csc`, `matriz`, `created_at`, `updated_at`, `status`) VALUES
(16, 'ODONTOLOGIA URGENCIA E EMERGENCIA 24H', NULL, 'ALL SMILES INSTITUTO ODONTOLÓGICO LTDA', '31.806.287/0001-75', NULL, NULL, '58040-750', 'RUA DOUTOR OSORIO ABATH', '46', 'TORRE', NULL, 'JOAO PESSOA', 'PB', 'BRASIL', NULL, NULL, NULL, NULL, NULL, '(83) 986 878 331', 'institutoallsmiles@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '0.000', 'SIMPLES NACIONAL', NULL, NULL, '0', 0, 0, 00, 00, NULL, NULL, 'N', '2023-03-29 23:46:25', '2023-05-17 18:04:07', '1'),
(17, 'ISOMED EXAMES DE IMAGEM', NULL, 'INSTITUTO DE SAUDE OCUPACIONAL E MEDICINA', '28.185.950/0001-57', NULL, NULL, '58013-360', 'AVENIDA CAMILO DE HOLANDA', '478', 'CENTRO', 'SALA102', 'JOAO PESSOA', 'PB', 'BRASIL', NULL, NULL, NULL, NULL, '(83) 3506-1672', '(83) 998 695 732', 'contato@isomedjp.com', NULL, NULL, NULL, NULL, NULL, NULL, '0.000', 'SIMPLES NACIONAL', NULL, NULL, '0', 0, 0, 00, 00, NULL, NULL, 'N', '2023-03-29 23:51:27', '2023-05-17 18:06:02', '1'),
(18, 'INSTITUTO CLINAM MULTIPROFISSIONAIS.', NULL, 'INSTITUTO CLINAM LTDA', '46.600.770/0001-76', NULL, NULL, '58013-342', 'R. Borja Peregrino', '218', 'Centro', NULL, 'JOAO PESSOA', 'PB', 'BRASIL', NULL, NULL, NULL, NULL, '(83) 2106-8202', NULL, NULL, NULL, '@CLINAMSAUDE', NULL, NULL, NULL, NULL, '0.000', 'SIMPLES NACIONAL', NULL, NULL, '0', 0, 0, 00, 00, NULL, NULL, 'N', '2023-03-30 00:22:35', '2023-05-17 18:05:17', '1'),
(19, 'DELFIN- EXAMES DE IMAGEM', NULL, 'ECOCLINICA LTDA', '57.754.285/0001-73', NULL, NULL, '58013-240', 'AVENIDA CORALIO SOARES DA OLIVEIRA', '305', 'CENTRO', NULL, 'JOAO PESSOA', 'PB', 'BRASIL', NULL, NULL, NULL, NULL, '(83) 3049-4444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000', 'SIMPLES NACIONAL', NULL, NULL, '0', 0, 0, 00, 00, NULL, NULL, 'N', '2023-03-30 01:31:08', '2023-05-17 18:05:03', '1'),
(20, 'Consultório Particular', NULL, 'Consultório Particular', '00.000.000/0000-00', NULL, NULL, '58000-000', 'João Pessoa', '0', 'Centro', 'João Pessoa', 'João Pessoa', 'PB', 'Brasil', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000', 'SIMPLES NACIONAL', NULL, NULL, '0', 0, 0, 00, 00, NULL, NULL, 'N', '2023-03-30 22:24:43', '2023-05-17 19:25:57', '1'),
(21, 'PSICONEURO - SERVICOS DE PSICOLOGIA', NULL, 'CM SERVICOS DE PSICOLOGIA LTDA', '26.429.306/0001-51', NULL, NULL, '58013-430', 'AVENIDA COREMAS', '478', 'CENTRO', NULL, 'JOAO PESSOA', 'PB', 'BRASIL', NULL, NULL, NULL, NULL, '(83) 3506-0973', NULL, 'psiconeuro.ltda@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '0.000', 'SIMPLES NACIONAL', NULL, NULL, '0', 0, 0, 00, 00, NULL, NULL, 'N', '2023-03-30 23:23:35', '2023-05-17 18:04:21', '1'),
(22, 'POLICLINICA MED SAUDE', NULL, 'DR MENDONCA SERVICOS MEDICOS LTDA', '37.010.056/0001-37', NULL, NULL, '58040-440', 'AVENIDA DOM PEDRO II', '1270', 'TORRE', NULL, 'JOAO PESSOA', 'PB', 'BRASIL', NULL, NULL, NULL, NULL, '(83) 3508-4663', '(83) 965 676 46', 'adm.medsaudejp@gmail.com', NULL, '@medsaudejp', NULL, NULL, NULL, NULL, '0.000', 'SIMPLES NACIONAL', NULL, NULL, '0', 0, 0, 00, 00, NULL, NULL, 'N', '2023-03-30 23:29:37', '2023-05-17 18:04:48', '1'),
(23, 'Policlinica Emma', NULL, 'Policlinica Emma Saude Medica LTDA', '43.882.086/0001-36', NULL, NULL, '58056-010', 'Rua Elias Pereira de Araujo', '66', 'Mangabeira', NULL, 'JOAO PESSOA', 'PB', 'BRASIL', NULL, NULL, NULL, NULL, '(83) 3023-3333', NULL, 'emma.policlinica@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '0.000', 'SIMPLES NACIONAL', NULL, NULL, '0', 0, 0, 00, 00, NULL, NULL, 'N', '2023-03-30 23:33:49', '2023-05-17 18:06:15', '1');

--
-- Extraindo dados da tabela `tb_especialidade`
--

INSERT INTO `tb_especialidade` (`id`, `especialidade`, `descricao`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Otorrino', 'Médico especializado em tratamento de saúde de nariz, ouvido e garganta.', '2022-11-16 09:29:01', NULL, '1'),
(2, 'Cardiologista', 'Médico que cuida do coração.', '2022-11-16 09:29:01', '2022-11-25 09:33:20', '1'),
(3, 'Neurologista', 'Médico especializado em tratamento de saúde da cabeça e do sistema nervoso.', '2022-11-16 09:29:01', NULL, '1'),
(4, 'Pneumulogista', 'Médico especializado em tratamento de saúde do sistema respiratório.', '2022-11-16 09:29:01', NULL, '1'),
(5, 'Ortopedista', 'Médico especializado em problemas de ossos.', '2022-11-16 10:06:05', NULL, '1'),
(7, 'Psicólogo', NULL, '2022-11-16 11:50:24', NULL, '1'),
(8, 'Endocrinologista', 'Médico que cuida da saúde dos rins.', '2022-11-16 11:50:58', NULL, '1'),
(9, 'Dentista', 'Médico que cuida da saúde dos dentes.', '2022-11-16 12:02:33', NULL, '1'),
(10, 'Clínica médica', NULL, '2022-11-16 12:55:12', NULL, '1'),
(11, 'Geriatria', NULL, '2022-11-16 12:55:53', NULL, '1'),
(12, 'Oftalmologia', NULL, '2022-11-16 12:57:57', NULL, '1'),
(13, 'Medicina do exercício e do esporte', NULL, '2022-11-16 12:58:52', NULL, '1'),
(14, 'Oncologia', NULL, '2022-11-16 13:00:11', NULL, '1'),
(15, 'Dermatologia', NULL, '2022-11-16 13:01:35', NULL, '1'),
(16, 'Urgência e emergência', NULL, '2022-11-16 13:02:19', NULL, '1'),
(17, 'Infectologia', NULL, '2022-11-16 13:02:36', NULL, '1'),
(18, 'Cirurgia', NULL, '2022-11-16 13:03:11', '2023-01-11 19:49:35', '1'),
(19, 'Neurocirurgia', NULL, '2022-11-16 13:03:20', NULL, '1'),
(20, 'Cirurgia geral', NULL, '2022-11-16 13:03:34', '2023-01-11 19:49:31', '1'),
(21, 'Cirurgia plástica', NULL, '2022-11-16 13:03:41', '2023-01-11 19:49:26', '1'),
(22, 'Ortopedia', NULL, '2022-11-16 13:03:55', NULL, '1'),
(23, 'Anestesiologia', 'Médico responsável por aplicação de anestesias.', '2022-11-16 13:04:01', '2023-01-16 15:19:52', '1'),
(33, 'Fisioterapia', NULL, '2023-01-04 13:06:58', '2023-01-11 19:48:54', '1'),
(34, 'Obstetrícia', NULL, '2023-01-04 13:07:15', '2023-01-11 19:48:47', '1'),
(35, 'teste2', NULL, '2023-05-16 10:18:43', '2023-05-16 10:18:49', '1');

--
-- Extraindo dados da tabela `tb_estado_civil`
--

INSERT INTO `tb_estado_civil` (`id`, `descricao`) VALUES
(1, 'Solteiro'),
(2, 'Casado'),
(3, 'Separado'),
(4, 'Divorciado'),
(5, 'Viúvo');

--
-- Extraindo dados da tabela `tb_etnia`
--

INSERT INTO `tb_etnia` (`id`, `descricao`) VALUES
(1, 'Não informado'),
(2, 'Branca'),
(3, 'Preta'),
(4, 'Parda'),
(5, 'Amarela'),
(6, 'Indigena');

--
-- Extraindo dados da tabela `tb_exame`
--

INSERT INTO `tb_exame` (`id`, `id_categoria`, `titulo`, `descricao`, `valor`, `meta_description`, `meta_title`, `meta_keywords`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'BHCG', 'Exame de teste de gravidez', '100.000', '', '', '', '2023-05-23 21:09:14', NULL, '1');

--
-- Extraindo dados da tabela `tb_exame_categoria`
--

INSERT INTO `tb_exame_categoria` (`id`, `titulo`, `descricao`, `classificacao`, `meta_description`, `meta_title`, `meta_keywords`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Não definido', 'Não definido', 'Padrão', 'Não definido', 'Não definido', 'Não definido', '2023-04-20 02:00:35', '2023-04-20 02:01:30', '1');

--
-- Extraindo dados da tabela `tb_funcao`
--

INSERT INTO `tb_funcao` (`id`, `codigo`, `funcao`, `descricao`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'Recepcionista', 'Recepcionista', '2022-11-22 22:25:44', NULL, '1'),
(2, 2, 'Médico', 'Médico', '2022-11-22 22:25:44', NULL, '1');

--
-- Extraindo dados da tabela `tb_paciente`
--

INSERT INTO `tb_paciente` (`id`, `nome`, `imagem`, `codigo`, `associado`, `id_convenio`, `id_tipo_convenio`, `matricula`, `id_acomodacao`, `validade`, `id_estado_civil`, `id_etnia`, `sexo`, `data_nascimento`, `cpf`, `rg`, `cns`, `mae`, `pai`, `profissao`, `observacoes`, `notas_gerais`, `notas_alergias`, `notas_clinicas`, `logradouro`, `numero`, `complemento`, `cep`, `cidade`, `bairro`, `uf`, `pais`, `email`, `telefone`, `celular`, `created_at`, `updated_at`, `receber_sms`, `receber_email`, `receber_notificacoes`, `obito`, `datahora_obito`, `status`) VALUES
(1, 'EMANUEL BRAZ DA COSTA ARAUJO', NULL, '', 'yes', 2, 3, '808 934 703436 190', 1, '2024-03', 1, 1, 'M', '1953-05-17', '095.622.904-25', '247063', NULL, 'SEBASTIANA DA COSTA ARAUJO', 'DIÔGO BRAZ DE ARAUJO', NULL, NULL, NULL, NULL, NULL, 'AVENIDA INGÁ', '955', NULL, '58038-251', 'JOÃO PESSOA', 'MANAIRA', 'PB', 'BRASIL', 'rosa_mara2012@gmail.com', NULL, '(83) 988 059 137', '2023-03-07 23:44:27', '2023-03-10 00:33:17', 'on', 'off', 'on', '0', NULL, '1'),
(2, 'ISABEL CRISTINA MARTINS DANTAS', NULL, '', 'yes', 2, 3, '062 699 805357 823', 1, '2024-03', 1, 2, 'F', '1998-11-30', '062.653.333-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rua Violeta Formiga', 'SN', NULL, '58036-042', 'Joao Pessoa', 'Jardim Oceania', 'PB', 'Brasil', 'isabel_dantas02@hotmail.com', NULL, '(83) 982 021 998', '2023-03-07 23:55:45', '2023-03-10 00:30:29', 'on', 'on', 'on', '0', NULL, '1'),
(3, 'ROSA MARIA ARAUJO GUEDES DE CARVALHO', NULL, '', 'yes', 2, 3, '963 504 831301 813', 1, '2024-03', 2, 1, 'F', '1950-05-10', '094.442.114-87', '3032629', NULL, 'SEBASTIANA DA COSTA ARAUJO', 'DIOGO BRAZ DE ARAUJO', NULL, NULL, NULL, NULL, NULL, 'AVENIDA INGÁ', '955', NULL, '58038-251', 'JOÃO PESSOA', 'MANAIRA', 'PB', 'BRASIL', 'rosa_mara2012@hotmail.com', NULL, '(83) 988 059 137', '2023-03-09 20:50:33', '2023-03-10 00:42:13', 'on', 'off', 'on', '0', NULL, '1'),
(4, 'VAMBERTO AMARO GUEDES DE CARVALHO', NULL, '', 'yes', 2, 3, '740 879 558137 776', 1, '2024-03', 2, 1, 'M', '1947-11-01', '040.008.974-20', '115045', NULL, 'VANDA FREIRE GUEDES DE CARVALHO', 'ROBERTO LIMA DE CARVALHO', NULL, NULL, NULL, NULL, NULL, 'AVENIDA INGÁ', '955', NULL, '58038-251', 'JOÃO PESSOA', 'MANAIRA', 'PB', 'BRASIL', 'rosa_mara2012@hotmail.com', NULL, '(83) 988 059 137', '2023-03-09 20:58:12', '2023-04-18 22:06:17', 'on', 'off', 'on', '1', '2023-04-16 16:05:00', '0'),
(5, 'MICKAELLA RIBEIRO DE SOUZA', NULL, '', 'yes', 2, 1, '411 346 549747 715', 1, '2024-03', 1, 1, 'F', '2009-08-01', '175.085.027-36', '3810367', NULL, 'JOSIANE RIBEIRO MACHADO ASTROGILDO DE SOUZA', 'ERNANI MARTINS DE SOUZA', NULL, NULL, NULL, NULL, NULL, 'RUA ANTONIO TIRONE', '47', NULL, '29164-622', 'SERRA', 'GUARACIABA', 'ES', 'BRASIL', 'josizigui@hotmail.com', NULL, '(27) 998 925 152', '2023-03-09 21:31:04', '2023-03-10 00:43:08', 'on', 'off', 'on', '0', NULL, '1');

--
-- Extraindo dados da tabela `tb_servicos`
--

INSERT INTO `tb_servicos` (`id`, `id_parent`, `descricao`, `created_at`, `updated_at`, `status`) VALUES
(1, NULL, 'Assistência telemedicina 24h', '2023-03-04 04:49:09', NULL, '1'),
(2, NULL, 'Descontos em parceiros (farmácias, clínicas de estética, óticas)', '2023-03-04 04:49:09', NULL, '1'),
(3, NULL, 'Descontos em consultório e clinicas credenciadas', '2023-03-04 04:50:07', NULL, '1'),
(4, NULL, 'Atendimento odontológico 24h', '2023-03-04 04:50:07', NULL, '1'),
(5, NULL, 'Duas remoções ao ano', '2023-03-04 04:50:20', NULL, '1'),
(6, NULL, 'Urgência e Emergência em Traumatologia com (consulta + raio-x + imobilização) tudo incluso anualmente', '2023-03-04 04:52:50', NULL, '1'),
(7, NULL, 'Consultas na clínica Médicus e urgência com ponto de atendimento', '2023-03-04 04:52:50', NULL, '1'),
(8, NULL, 'Atendimento de urgência e emergência odontológico 24h', '2023-03-04 04:53:00', NULL, '1'),
(9, NULL, 'Assistência domiciliar 24h com a equipe de enfermagem e médico inclusos', '2023-03-04 04:53:16', NULL, '1'),
(10, NULL, 'Descontos em consultório e clinicas credenciadas\r\n', '2023-03-04 04:53:25', NULL, '1'),
(12, NULL, 'Exames Cardiológicos', '2023-03-04 04:57:56', NULL, '1'),
(13, 12, 'Eletrocardiograma', '2023-03-04 04:58:45', NULL, '1'),
(17, 12, 'Mapa', '2023-03-04 04:59:50', NULL, '1'),
(18, 12, 'Holter', '2023-03-04 04:59:50', NULL, '1'),
(19, 12, 'Troponina', '2023-03-04 04:59:50', NULL, '1');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
