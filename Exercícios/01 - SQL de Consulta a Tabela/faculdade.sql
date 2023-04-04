-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Abr-2023 às 04:49
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `faculdade`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `CPF` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `Turno` varchar(10) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`Id`, `Nome`, `CPF`, `Turno`) VALUES
(1, 'Arthur', '12345678901', 'Manhã'),
(2, 'Gustavo', '09876543211', 'Manhã'),
(3, 'Leandro', '09862537185', 'Manhã'),
(4, 'André', '15367492081', 'Noite'),
(5, 'Juan', '10364728957', 'Noite'),
(6, 'Amanda', '72830183643', 'Noite');

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunoturma`
--

CREATE TABLE `alunoturma` (
  `IdAluno` int(11) NOT NULL,
  `IdTurma` int(11) NOT NULL,
  `AV1` int(11) NOT NULL,
  `AV2` int(11) NOT NULL,
  `Media` int(11) NOT NULL,
  `Falta` int(11) NOT NULL,
  `Status` varchar(10) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `alunoturma`
--

INSERT INTO `alunoturma` (`IdAluno`, `IdTurma`, `AV1`, `AV2`, `Media`, `Falta`, `Status`) VALUES
(1, 1, 7, 9, 8, 8, 'Ativo'),
(2, 1, 9, 9, 9, 4, 'Ativo'),
(3, 1, 0, 0, 0, 0, 'Inativo'),
(4, 7, 7, 5, 6, 12, 'Ativo'),
(5, 7, 0, 0, 0, 0, 'Inativo'),
(6, 7, 10, 6, 8, 4, 'Inativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `Id` int(11) NOT NULL,
  `Curso` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Turno` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `Professor` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`Id`, `Curso`, `Turno`, `Professor`) VALUES
(1, 'José', '1FAC', 'Manhã'),
(2, 'Maria', '1IHM', 'Manhã'),
(3, 'Roberta', '1MAC', 'Manhã'),
(4, 'Stefanne', '1ORG', 'Manhã'),
(5, 'José', '1IHM', 'Noite'),
(6, 'Michel', '1ORG', 'Noite'),
(7, 'Maycon', '1FAC', 'Noite'),
(8, 'Isabela', '1MAC', 'Noite');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `alunoturma`
--
ALTER TABLE `alunoturma`
  ADD PRIMARY KEY (`IdAluno`,`IdTurma`),
  ADD KEY `IdTurma` (`IdTurma`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alunoturma`
--
ALTER TABLE `alunoturma`
  ADD CONSTRAINT `alunoturma_ibfk_1` FOREIGN KEY (`IdAluno`) REFERENCES `aluno` (`Id`),
  ADD CONSTRAINT `alunoturma_ibfk_2` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
