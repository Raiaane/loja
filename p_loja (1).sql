-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 08-Out-2018 às 22:49
-- Versão do servidor: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `p_loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `categoria`) VALUES
(1, 'Infantil'),
(2, 'Feminino'),
(3, 'Masculino'),
(4, 'Esporte');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cpf` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `usuario`, `senha`, `email`, `cpf`) VALUES
(2, 'Raiane Nunes', 'ray', 'ray', 'costa_raiane23@hotmail.com', '135.456.789-70');

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagem`
--

CREATE TABLE `imagem` (
  `id` int(11) NOT NULL,
  `id_produto` int(50) NOT NULL,
  `imagem` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `imagem`
--

INSERT INTO `imagem` (`id`, `id_produto`, `imagem`) VALUES
(1, 2, '0.59491900 1538253948.jpg'),
(2, 2, '0fa8acb8a3979f9bc15fe3eb58d090ab.jpg'),
(3, 2, 'MC41OTQ5MTkwMCAxNTM4MjUzOTQ4.jpg'),
(4, 3, '0.98498000 1538254046.jpg'),
(5, 3, 'b8a6c26d6d4980b6223bc4ce99ec7fa8.jpg'),
(6, 3, 'MC45ODQ5ODAwMCAxNTM4MjU0MDQ2.jpg'),
(7, 10, '0.77200400 1538415274.jpg'),
(8, 10, '7e25d2e5d7cb72392299cda76d8a1096.jpg'),
(9, 10, 'MC43NzIwMDQwMCAxNTM4NDE1Mjc0.jpg'),
(10, 11, '0.01637500 1538415330.jpg'),
(11, 11, 'b11e846905916f6f368a07b8382a6848.jpg'),
(12, 11, 'MC4wMTg4NzUwMCAxNTM4NDE1MzMw.jpg'),
(13, 12, '0.55131600 1538415382.jpg'),
(14, 12, '8f5078e7537119861fc7c2f5ed547621.jpg'),
(15, 12, 'MC41NTEzMTYwMCAxNTM4NDE1Mzgy.png'),
(16, 13, '0.70556400 1538416896.jpg'),
(17, 13, '055614c4280a0eb8d10811d80851b1ec.jpg'),
(18, 13, 'MC43MDU1NjQwMCAxNTM4NDE2ODk2.jpg'),
(19, 14, '0.61937100 1538416939.jpg'),
(20, 14, '46466bc04ae37ffc13192300c1174677.jpg'),
(21, 14, 'MC42MTkzNzEwMCAxNTM4NDE2OTM5.jpg'),
(22, 15, '0.77219300 1538417022.jpg'),
(23, 15, 'c84046589145781aa1eab4524f300b3f.jpg'),
(24, 15, 'MC43NzIxOTMwMCAxNTM4NDE3MDIy.jpg'),
(25, 17, '54d01022c1ec487aa26e416ed1e8f9c4.jpg'),
(26, 17, '77f4723113f23dd398b95310af8d6047.jpg'),
(27, 17, '77f4723113f23dd398b95310af8d6047.jpg'),
(28, 19, '0.73632900 1538490750.jpg'),
(29, 19, '7fe3f67f160a93ee460fb57f239fa1c4.jpg'),
(30, 19, 'MC43MzYzMjkwMCAxNTM4NDkwNzUw.jpg'),
(31, 21, '0.32212400 1538490922.jpg'),
(32, 21, '72e77a98439507396821b3520481d0ff.jpg'),
(33, 21, 'MC4zMjIxMjQwMCAxNTM4NDkwOTIy.jpg'),
(34, 22, '0.75993200 1538491128.jpg'),
(35, 22, 'da7467ffb6ab30726f54977dd6a3bbc0.jpg'),
(36, 22, 'MC43NTk5MzIwMCAxNTM4NDkxMTI4.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `notificacoes`
--

INSERT INTO `notificacoes` (`id`, `id_user`, `status`) VALUES
(9, 21, '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `vetor` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `produto` varchar(100) NOT NULL,
  `quantidade` varchar(200) NOT NULL,
  `preco` varchar(50) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `cat` varchar(50) NOT NULL,
  `reviews` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `produto`, `quantidade`, `preco`, `descricao`, `cat`, `reviews`) VALUES
(2, 'calÃ§a jeans', '3', '80.00', 'a melhor qualidade de calÃ§a para o seu conforto e lazer...', 'Feminino', 8),
(3, 'Saia', '4', '20.00', 'Para cobrir as pernas com o melhor pano que existe..', 'Feminino', 8),
(10, 'blusa', '1', '30.00', 'lhdohdpoahpi', 'Masculino', 8),
(11, 'blusaFrio', '4', '50.00', 'ljaÂ´donapigdpÃ§knapog', 'Esporte', 8),
(12, 'blusa', '4', '20.00', 'uhsdbaodboa', 'Infantil', 8),
(13, 'blusa', '1', '20.00', 'ahospo', 'Infantil', 8),
(14, 'blusaFrio', '3', '40.00', 'ksndoanozndÃ¡onpanpsn', 'Feminino', 8),
(15, 'prato', '2', '20.00', 'ifbpdbfpwbfp', 'Infantil', 8),
(17, 'blusa', '3', '30.00', 'lÃ§soahs', 'Masculino', 8),
(19, 'blusaFrio', '1', '10.00', 'lsdnoÃ§an', 'Infantil', 8),
(21, 'blusa', '1', '55.00', 'Ã§knÃ§axh', 'Infantil', 8),
(22, 'blusa', '1', '55.00', 'Ã§knÃ§axh', 'Infantil', 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_admin`
--

CREATE TABLE `users_admin` (
  `id` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `urllmg` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `users_admin`
--

INSERT INTO `users_admin` (`id`, `usuario`, `senha`, `email`, `nome`, `urllmg`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', 'Administrador', 'avatar5.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `senha` (`senha`);

--
-- Indexes for table `imagem`
--
ALTER TABLE `imagem`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `users_admin`
--
ALTER TABLE `users_admin`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `imagem`
--
ALTER TABLE `imagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users_admin`
--
ALTER TABLE `users_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
