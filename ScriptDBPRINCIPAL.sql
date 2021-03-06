USE [master]
GO
/****** Object:  Database [PRINCIPAL]    Script Date: 08/06/2018 19:31:40 ******/
CREATE DATABASE [PRINCIPAL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRINCIPAL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PRINCIPAL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRINCIPAL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PRINCIPAL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PRINCIPAL] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRINCIPAL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRINCIPAL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRINCIPAL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRINCIPAL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRINCIPAL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRINCIPAL] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRINCIPAL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRINCIPAL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRINCIPAL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRINCIPAL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRINCIPAL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRINCIPAL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRINCIPAL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRINCIPAL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRINCIPAL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRINCIPAL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRINCIPAL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRINCIPAL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRINCIPAL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRINCIPAL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRINCIPAL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRINCIPAL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRINCIPAL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRINCIPAL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRINCIPAL] SET  MULTI_USER 
GO
ALTER DATABASE [PRINCIPAL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRINCIPAL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRINCIPAL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRINCIPAL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRINCIPAL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRINCIPAL] SET QUERY_STORE = OFF
GO
USE [PRINCIPAL]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PRINCIPAL]
GO
/****** Object:  Table [dbo].[tblPessoaFisica]    Script Date: 08/06/2018 19:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPessoaFisica](
	[id_pessoaFisica] [int] NOT NULL,
	[nome_pessoaFisica] [nvarchar](100) NOT NULL,
	[cpf_pessoaFisica] [nvarchar](14) NOT NULL,
	[dtNasc_pessoaFisica] [date] NULL,
 CONSTRAINT [PK_tblPessoaFisica] PRIMARY KEY CLUSTERED 
(
	[id_pessoaFisica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPessoaTipo]    Script Date: 08/06/2018 19:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPessoaTipo](
	[id_pessoaTipo] [int] NOT NULL,
	[descricao] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tlbPessoaTipo] PRIMARY KEY CLUSTERED 
(
	[id_pessoaTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPessoaJuridica]    Script Date: 08/06/2018 19:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPessoaJuridica](
	[id_pessoaJuridica] [int] NOT NULL,
	[razao_pessoaJuridica] [nvarchar](100) NOT NULL,
	[cnpj_pessoaJuridica] [nvarchar](18) NOT NULL,
 CONSTRAINT [PK_tblPessoaJuridica] PRIMARY KEY CLUSTERED 
(
	[id_pessoaJuridica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPessoa]    Script Date: 08/06/2018 19:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPessoa](
	[id_pessoa] [int] IDENTITY(1,1) NOT NULL,
	[id_pessoaTipo] [int] NOT NULL,
	[cep_pessoa] [nvarchar](9) NULL,
	[uf_pessoa] [nchar](2) NOT NULL,
	[cidade_pessoa] [nvarchar](max) NOT NULL,
	[endereco_pessoa] [nvarchar](max) NOT NULL,
	[numero_pessoa] [int] NULL,
	[bairro_pessoa] [nvarchar](max) NOT NULL,
	[telefone_pessoa] [nvarchar](13) NULL,
	[email_pessoa] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblPessoa] PRIMARY KEY CLUSTERED 
(
	[id_pessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[PessoaFisicaJuridica]    Script Date: 08/06/2018 19:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[PessoaFisicaJuridica]
AS
	SELECT 
		tblPessoa.id_pessoa,
		tblPessoa.id_pessoaTipo,
		tblPessoaFisica.dtNasc_pessoaFisica,
		tblPessoa.cep_pessoa,
		tblPessoa.uf_pessoa,
		tblPessoa.cidade_pessoa,
		tblPessoa.endereco_pessoa,
		tblPessoa.numero_pessoa,
		tblPessoa.bairro_pessoa,
		tblPessoa.email_pessoa,
		tblPessoa.telefone_pessoa,
		tblPessoaTipo.descricao,
	CASE
		WHEN tblPessoa.id_pessoaTipo = 1 THEN tblPessoaFisica.cpf_pessoaFisica
		ELSE tblPessoaJuridica.cnpj_pessoaJuridica
	END AS CPF_CNPJ,

	CASE
		WHEN tblPessoa.id_pessoaTipo = 1 THEN tblPessoaFisica.nome_pessoaFisica
		ELSE tblPessoaJuridica.razao_pessoaJuridica
	END AS Nome_Razao

	FROM tblPessoa
	JOIN
		tblPessoaTipo ON tblPessoa.id_pessoaTipo = tblPessoaTipo.id_pessoaTipo
	LEFT JOIN
		tblPessoaFisica ON tblPessoa.id_pessoa = tblPessoaFisica.id_pessoaFisica
	LEFT JOIN
		tblPessoaJuridica ON tblPessoa.id_pessoa = tblPessoaJuridica.id_pessoaJuridica
GO
/****** Object:  Table [dbo].[tblCliente]    Script Date: 08/06/2018 19:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCliente](
	[id_cliente] [int] NOT NULL,
 CONSTRAINT [PK_tblCliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstoque]    Script Date: 08/06/2018 19:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstoque](
	[id_estoque] [int] NOT NULL,
	[idItem_estoque] [int] NOT NULL,
	[qtd_estoque] [int] NOT NULL,
 CONSTRAINT [PK_tblEstoque] PRIMARY KEY CLUSTERED 
(
	[id_estoque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstoqueMovimentado]    Script Date: 08/06/2018 19:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstoqueMovimentado](
	[id_EM] [int] IDENTITY(1,1) NOT NULL,
	[idItem_EM] [int] NOT NULL,
	[qtd_EM] [int] NOT NULL,
	[dataHora_EM] [date] NOT NULL,
	[tipoMovimento_EM] [nchar](1) NOT NULL,
 CONSTRAINT [PK_tblEstoqueMovimentado] PRIMARY KEY CLUSTERED 
(
	[id_EM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstoqueReservado]    Script Date: 08/06/2018 19:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstoqueReservado](
	[idItem_ER] [int] NOT NULL,
	[qtd_ER] [int] NOT NULL,
 CONSTRAINT [PK_tblEstoqueReservado] PRIMARY KEY CLUSTERED 
(
	[idItem_ER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFornecedor]    Script Date: 08/06/2018 19:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFornecedor](
	[id_fornecedor] [int] NOT NULL,
 CONSTRAINT [PK_tblFornecedor] PRIMARY KEY CLUSTERED 
(
	[id_fornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFuncionario]    Script Date: 08/06/2018 19:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFuncionario](
	[id_funcionario] [int] NOT NULL,
	[salario_funcionario] [decimal](8, 2) NULL,
 CONSTRAINT [PK_tblFuncionario_1] PRIMARY KEY CLUSTERED 
(
	[id_funcionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblItem]    Script Date: 08/06/2018 19:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblItem](
	[id_item] [int] IDENTITY(1,1) NOT NULL,
	[descri_item] [nvarchar](100) NOT NULL,
	[categoria_item] [nvarchar](50) NULL,
	[codFornecedor_item] [int] NULL,
	[dtFabricacao_item] [date] NULL,
	[garantia_item] [int] NULL,
 CONSTRAINT [PK_tblItem] PRIMARY KEY CLUSTERED 
(
	[id_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOperacao]    Script Date: 08/06/2018 19:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOperacao](
	[id_operacao] [int] NOT NULL,
	[descricao_operacao] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblOperacao] PRIMARY KEY CLUSTERED 
(
	[id_operacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPedido]    Script Date: 08/06/2018 19:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPedido](
	[id_pedido] [int] IDENTITY(1,1) NOT NULL,
	[dataHora_pedido] [datetime] NOT NULL,
	[idOperacao_pedido] [int] NOT NULL,
	[idSituacao_pedido] [int] NOT NULL,
	[idFuncionario_pedido] [int] NOT NULL,
	[idCliente_pedido] [int] NOT NULL,
 CONSTRAINT [PK_tblPedido] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPedidoItem]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPedidoItem](
	[idPedido_PI] [int] NOT NULL,
	[idItem_PI] [int] NOT NULL,
	[quantidade_PI] [int] NOT NULL,
	[valorUnitario_PI] [decimal](8, 2) NOT NULL,
	[percentuaDesconto_PI] [decimal](3, 2) NOT NULL,
	[valorDesconto_PI] [decimal](8, 2) NOT NULL,
	[valorTotal_PI] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_tblPedidoItem] PRIMARY KEY CLUSTERED 
(
	[idPedido_PI] ASC,
	[idItem_PI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPrecoItem]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPrecoItem](
	[idItem_PcI] [int] NOT NULL,
	[preco_PcI] [decimal](8, 2) NULL,
 CONSTRAINT [PK_tblPrecoItem] PRIMARY KEY CLUSTERED 
(
	[idItem_PcI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSituacao]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSituacao](
	[id_situacao] [int] NOT NULL,
	[descricao_situacao] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblSituacao] PRIMARY KEY CLUSTERED 
(
	[id_situacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVenda]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVenda](
	[id_venda] [int] NOT NULL,
	[descricao_venda] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblVenda] PRIMARY KEY CLUSTERED 
(
	[id_venda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tblPessoaFisicaCPF]    Script Date: 08/06/2018 19:31:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblPessoaFisicaCPF] ON [dbo].[tblPessoaFisica]
(
	[cpf_pessoaFisica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tblPessoaJuridicaCNPJ]    Script Date: 08/06/2018 19:31:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblPessoaJuridicaCNPJ] ON [dbo].[tblPessoaJuridica]
(
	[cnpj_pessoaJuridica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPedido] ADD  CONSTRAINT [DF_tblPedido_dataHora_pedido]  DEFAULT (getdate()) FOR [dataHora_pedido]
GO
ALTER TABLE [dbo].[tblCliente]  WITH CHECK ADD  CONSTRAINT [FK_tblCliente_tblPessoa] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[tblPessoa] ([id_pessoa])
GO
ALTER TABLE [dbo].[tblCliente] CHECK CONSTRAINT [FK_tblCliente_tblPessoa]
GO
ALTER TABLE [dbo].[tblEstoque]  WITH CHECK ADD  CONSTRAINT [FK_tblEstoque_tblEstoqueReservado] FOREIGN KEY([idItem_estoque])
REFERENCES [dbo].[tblEstoqueReservado] ([idItem_ER])
GO
ALTER TABLE [dbo].[tblEstoque] CHECK CONSTRAINT [FK_tblEstoque_tblEstoqueReservado]
GO
ALTER TABLE [dbo].[tblEstoqueMovimentado]  WITH CHECK ADD  CONSTRAINT [FK_tblEstoqueMovimentado_tblItem] FOREIGN KEY([idItem_EM])
REFERENCES [dbo].[tblItem] ([id_item])
GO
ALTER TABLE [dbo].[tblEstoqueMovimentado] CHECK CONSTRAINT [FK_tblEstoqueMovimentado_tblItem]
GO
ALTER TABLE [dbo].[tblFornecedor]  WITH CHECK ADD  CONSTRAINT [FK_tblFornecedor_tblPessoa] FOREIGN KEY([id_fornecedor])
REFERENCES [dbo].[tblPessoa] ([id_pessoa])
GO
ALTER TABLE [dbo].[tblFornecedor] CHECK CONSTRAINT [FK_tblFornecedor_tblPessoa]
GO
ALTER TABLE [dbo].[tblFuncionario]  WITH CHECK ADD  CONSTRAINT [FK_tblFuncionario_tblPessoa] FOREIGN KEY([id_funcionario])
REFERENCES [dbo].[tblPessoa] ([id_pessoa])
GO
ALTER TABLE [dbo].[tblFuncionario] CHECK CONSTRAINT [FK_tblFuncionario_tblPessoa]
GO
ALTER TABLE [dbo].[tblItem]  WITH CHECK ADD  CONSTRAINT [FK_tblItem_tblFornecedor] FOREIGN KEY([codFornecedor_item])
REFERENCES [dbo].[tblFornecedor] ([id_fornecedor])
GO
ALTER TABLE [dbo].[tblItem] CHECK CONSTRAINT [FK_tblItem_tblFornecedor]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblOperacao] FOREIGN KEY([idOperacao_pedido])
REFERENCES [dbo].[tblOperacao] ([id_operacao])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblOperacao]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblPessoa] FOREIGN KEY([idFuncionario_pedido])
REFERENCES [dbo].[tblPessoa] ([id_pessoa])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblPessoa]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblPessoa1] FOREIGN KEY([idCliente_pedido])
REFERENCES [dbo].[tblPessoa] ([id_pessoa])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblPessoa1]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblSituacao] FOREIGN KEY([idSituacao_pedido])
REFERENCES [dbo].[tblSituacao] ([id_situacao])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblSituacao]
GO
ALTER TABLE [dbo].[tblPedidoItem]  WITH CHECK ADD  CONSTRAINT [FK_tblPedidoItem_tblItem] FOREIGN KEY([idItem_PI])
REFERENCES [dbo].[tblItem] ([id_item])
GO
ALTER TABLE [dbo].[tblPedidoItem] CHECK CONSTRAINT [FK_tblPedidoItem_tblItem]
GO
ALTER TABLE [dbo].[tblPedidoItem]  WITH CHECK ADD  CONSTRAINT [FK_tblPedidoItem_tblPedido] FOREIGN KEY([idPedido_PI])
REFERENCES [dbo].[tblPedido] ([id_pedido])
GO
ALTER TABLE [dbo].[tblPedidoItem] CHECK CONSTRAINT [FK_tblPedidoItem_tblPedido]
GO
ALTER TABLE [dbo].[tblPessoa]  WITH CHECK ADD  CONSTRAINT [FK_tblPessoa_tlbPessoaTipo] FOREIGN KEY([id_pessoaTipo])
REFERENCES [dbo].[tblPessoaTipo] ([id_pessoaTipo])
GO
ALTER TABLE [dbo].[tblPessoa] CHECK CONSTRAINT [FK_tblPessoa_tlbPessoaTipo]
GO
ALTER TABLE [dbo].[tblPessoaFisica]  WITH CHECK ADD  CONSTRAINT [FK_tblPessoaFisica_tblPessoa] FOREIGN KEY([id_pessoaFisica])
REFERENCES [dbo].[tblPessoa] ([id_pessoa])
GO
ALTER TABLE [dbo].[tblPessoaFisica] CHECK CONSTRAINT [FK_tblPessoaFisica_tblPessoa]
GO
ALTER TABLE [dbo].[tblPessoaJuridica]  WITH CHECK ADD  CONSTRAINT [FK_tblPessoaJuridica_tblPessoa] FOREIGN KEY([id_pessoaJuridica])
REFERENCES [dbo].[tblPessoa] ([id_pessoa])
GO
ALTER TABLE [dbo].[tblPessoaJuridica] CHECK CONSTRAINT [FK_tblPessoaJuridica_tblPessoa]
GO
ALTER TABLE [dbo].[tblPrecoItem]  WITH CHECK ADD  CONSTRAINT [FK_tblPrecoItem_tblItem] FOREIGN KEY([idItem_PcI])
REFERENCES [dbo].[tblItem] ([id_item])
GO
ALTER TABLE [dbo].[tblPrecoItem] CHECK CONSTRAINT [FK_tblPrecoItem_tblItem]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarClientePorCodigoNome]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarClientePorCodigoNome]
	@id_cli AS INT = NULL,
	@nome_cli AS NVARCHAR(100) = NULL
AS
BEGIN
	SELECT
		cli.id_cliente,
		pes.CPF_CNPJ,
		pes.Nome_Razao,
		pes.id_pessoaTipo,
		pes.dtNasc_pessoaFisica,
		pes.cep_pessoa,
		pes.uf_pessoa,
		pes.cidade_pessoa,
		pes.endereco_pessoa,
		pes.numero_pessoa,
		pes.bairro_pessoa,
		pes.telefone_pessoa,
		pes.email_pessoa
	FROM
		tblCliente AS cli
	JOIN
		PessoaFisicaJuridica AS pes ON
			cli.id_cliente = pes.id_pessoa
	WHERE
		(@id_cli IS NULL OR cli.id_cliente = @id_cli) AND
			(@nome_cli IS NULL OR pes.Nome_Razao LIKE '%' + @nome_cli + '%')
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarEstoqueDisponivel]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarEstoqueDisponivel]
	@id_item INT = NULL,
	@descri_item NVARCHAR(100) = NULL
AS
BEGIN
	DECLARE
		@estoque INT,
		@estoqueReservado INT,
		@estoqueDisponivel INT
	SET @estoque =
	(
		SELECT
			qtd_estoque
		FROM
			tblEstoque
		WHERE
			idItem_estoque = @id_item
	);
	SET @estoqueReservado =
	(
		SELECT
			qtd_ER
		FROM
			tblEstoqueReservado
		WHERE
			@id_item = idItem_ER
	);
	SET @estoqueDisponivel=
	(
		COALESCE(@estoque,0) - COALESCE(@estoqueReservado,0)
	);

	IF(@id_item IS NOT NULL)
	BEGIN
		SELECT
			ite.id_item AS Código,
			ite.descri_item AS Descrição,
			@estoqueDisponivel AS Quantidade
		FROM
			tblEstoque AS est
		JOIN
			tblItem AS ite ON
				ite.id_item = est.idItem_estoque
		WHERE
			ite.id_item = @id_item
	END
	ELSE IF(@descri_item IS NOT NULL)
	BEGIN
		SELECT
			ite.id_item AS id,
			ite.descri_item,
			@estoqueDisponivel AS Quantidade
		FROM
			tblEstoque AS est
		JOIN
			tblItem AS ite ON
				ite.id_item = est.idItem_estoque
		WHERE
			ite.descri_item = @descri_item
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarEstoquePorCodigoDescriItem]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarEstoquePorCodigoDescriItem]
	@id_item AS INT = NULL,
	@descri_item NVARCHAR(100) = NULL
AS
BEGIN
	IF(@id_item IS NOT NULL)
		BEGIN
			SELECT
				est.idItem_estoque,
				ite.descri_item,
				est.qtd_estoque
			FROM
				tblEstoque AS est
			JOIN
				tblItem AS ite ON
					est.idItem_estoque = ite.id_item
			WHERE
				est.idItem_estoque = @id_item
		END
	ELSE IF(@descri_item IS NOT NULL)
		BEGIN
			SELECT
				est.idItem_estoque,
				ite.descri_item,
				est.qtd_estoque
			FROM
				tblEstoque AS est
			JOIN
				tblItem AS ite ON
					est.idItem_estoque = ite.id_item
			WHERE
					ite.descri_item LIKE '%' + @descri_item + '%'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarEstoqueReservadoPorCodDescriItem]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarEstoqueReservadoPorCodDescriItem]
	@id_item INT = NULL,
	@descri_item NVARCHAR(100) = NULL
AS
BEGIN
	IF(@id_item IS NOT NULL)
		BEGIN
			SELECT
				er.idItem_ER,
				item.descri_item,
				er.qtd_ER
			FROM
				tblEstoqueReservado AS er
			JOIN
				tblItem AS item ON
					item.id_item = er.idItem_ER
			WHERE
				er.idItem_ER = @id_item
		END
	ELSE IF(@descri_item IS NOT NULL)
		BEGIN
			SELECT
				er.idItem_ER,
				item.descri_item,
				er.qtd_ER
			FROM
				tblEstoqueReservado AS er
			JOIN
				tblItem AS item ON
					item.id_item = er.idItem_ER
			WHERE
				item.descri_item = @descri_item
		END
	
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarFornecedorPorCodigoNome]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarFornecedorPorCodigoNome]
	@id_for INT = NULL,
	@nome_for NVARCHAR(100) = NULL
AS
BEGIN
		SELECT
			forn.id_fornecedor,
			pes.CPF_CNPJ,
			pes.Nome_Razao
		FROM
			tblFornecedor AS forn
		JOIN
			PessoaFisicaJuridica AS pes ON
				forn.id_fornecedor = pes.id_pessoa
		WHERE
			(@id_for IS NULL OR forn.id_fornecedor = @id_for) AND
			(@nome_for IS NULL OR pes.Nome_Razao LIKE '%' + @nome_for + '%')
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarFuncionarioPorCodigo]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarFuncionarioPorCodigo]
	@id_fun INT
AS
BEGIN
	SELECT 
		fun.id_funcionario,
		pes.CPF_CNPJ,
		pes.Nome_Razao
	FROM
		tblFuncionario AS fun
	JOIN
		PessoaFisicaJuridica AS pes ON
		 fun.id_funcionario = pes.id_pessoa
	WHERE
		fun.id_funcionario = @id_fun
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarFuncionarioPorNome]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarFuncionarioPorNome]
	@nome_fun nvarchar(100)
AS
BEGIN
	SELECT
		fun.id_funcionario,
		pes.CPF_CNPJ,
		pes.Nome_Razao,
		pes.id_pessoaTipo,
		pes.descricao
		
	FROM
		tblFuncionario AS fun
	JOIN
		PessoaFisicaJuridica AS pes ON
		 fun.id_funcionario = pes.id_pessoa
	WHERE
		pes.Nome_Razao LIKE '%' + @nome_fun + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarItemPorCodigoDescri]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarItemPorCodigoDescri]
	@id_item INT = NULL,
	@descri_item NVARCHAR(100) = NULL
AS
BEGIN
	IF(@id_item IS NOT NULL)
		BEGIN
			SELECT
				item.id_item,
				item.descri_item,
				pci.preco_PcI
			FROM
				tblItem AS item
			JOIN
				tblPrecoItem AS pci ON
					pci.idItem_PcI = item.id_item
			WHERE
				item.id_item = @id_item
		END
	ELSE IF(@descri_item IS NOT NULL)
		BEGIN
			SELECT
				item.id_item,
				item.descri_item,
				pci.preco_PcI
			FROM
				tblItem AS item
			JOIN
				tblPrecoItem AS pci ON
					pci.idItem_PcI = item.id_item
			WHERE
				item.descri_item LIKE '%' + @descri_item + '%'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarItensPedido]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarItensPedido]
	@id_pedido AS INT
AS
BEGIN
	SELECT
		pi.idItem_PI AS Id,
		pi.idItem_PI AS CódigoItem,
		ite.descri_item AS Descricao,
		pi.quantidade_PI,
		pi.valorUnitario_PI,
		pi.percentuaDesconto_PI,
		pi.valorDesconto_PI,
		pi.valorTotal_PI
	FROM
		tblPedidoItem AS pi
	JOIN
		tblItem AS ite ON
			pi.idItem_PI = ite.id_item
	WHERE
		pi.idPedido_PI = @id_pedido
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarPedidoPorData]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarPedidoPorData]
	@dataInicial date,
	@dataFinal date
AS
BEGIN
	SELECT
		ped.id_pedido AS Id,
		ped.dataHora_pedido,
		fun.Nome_Razao AS Funcionario,
		cli.Nome_Razao AS Cliente,
		op.descricao_operacao AS Operação,
		sit.descricao_situacao AS Situação
	FROM
		 tblPedido AS ped
	JOIN
		tblOperacao AS op ON
			op.id_operacao = ped.idOperacao_pedido
	JOIN
		tblSituacao AS sit ON
			ped.idSituacao_pedido = sit.id_situacao
	JOIN
		PessoaFisicaJuridica AS fun ON
			ped.idFuncionario_pedido = fun.id_pessoa
	JOIN
		PessoaFisicaJuridica AS cli ON
			ped.idCliente_pedido = cli.id_pessoa
	WHERE
		CAST(ped.dataHora_pedido AS DATE)
			BETWEEN   @dataInicial AND @dataFinal
END
GO
/****** Object:  StoredProcedure [dbo].[InserirCliente]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserirCliente]
		@id_cliente AS INT
	AS
	BEGIN
		BEGIN TRY
			BEGIN TRAN

				IF(EXISTS(SELECT @id_cliente FROM tblCliente WHERE id_cliente = @id_cliente))
					RAISERROR('Cliente ja cadastrado no banco de dados', 14, 1)

				INSERT INTO tblCliente
				(
				id_cliente
				)
				VALUES
				(
				@id_cliente
				);
			

				SELECT @id_cliente AS Retorno;

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[InserirFornecedor]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserirFornecedor]
		@id_fornecedor AS INT
	AS
	BEGIN
		BEGIN TRY
			BEGIN TRAN

				IF(EXISTS(SELECT @id_fornecedor FROM tblFornecedor WHERE id_fornecedor = @id_fornecedor))
					RAISERROR('Fornecedor ja cadastrado no banco de dados', 14, 1)

				INSERT INTO tblFornecedor
				(
				id_fornecedor
				)
				VALUES
				(
				@id_fornecedor
				);
			

				SELECT @id_fornecedor AS Retorno;

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[InserirFuncionario]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserirFuncionario]
		@id_funcionario AS INT,
		@salario_funcionario AS DECIMAL(8, 2)
	AS
	BEGIN
		BEGIN TRY
			BEGIN TRAN

				IF(EXISTS(SELECT @id_funcionario FROM tblFuncionario WHERE id_funcionario = @id_funcionario))
					RAISERROR('Funcionário ja cadastrado no banco de dados', 14, 1)

				INSERT INTO tblFuncionario
				(
				id_funcionario,
				salario_funcionario
				)
				VALUES
				(
				@id_funcionario,
				@salario_funcionario
				);
			

				SELECT @id_funcionario AS Retorno;

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[InserirItem]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserirItem]
		@descri_item AS NVARCHAR(100),
		@categoria_item AS NVARCHAR(50),
		@codFornecedor_item AS INT,
		@dtFabricacao_item AS DATE,
		@garantia_item AS INT
	AS
	BEGIN
		BEGIN TRY
			BEGIN TRAN

				IF(EXISTS(SELECT id_item FROM tblItem WHERE descri_item = @descri_item))
					RAISERROR('Item ja cadastrado com a mesma descrição', 14, 1)

				INSERT INTO tblItem
				(
				descri_item,
				categoria_item,
				codFornecedor_item,
				dtFabricacao_item,
				garantia_item
				)
				VALUES
				(
				@descri_item,
				@categoria_item,
				@codFornecedor_item,
				@dtFabricacao_item,
				@garantia_item
				);
			
				SELECT @@IDENTITY AS Retorno;

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[InserirItemPedido]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserirItemPedido]
	@idPedido_PI AS INT,
	@idItem_PI AS INT,
	@quantidade_PI AS INT,
	@valorUnitario_PI AS DECIMAL(8,2),
	@percentualDesconto_PI AS DECIMAL(3,2),
	@valorDesconto_PI AS DECIMAL(8,2),
	@valorTotal_PI AS DECIMAL(8,2)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			IF(EXISTS(SELECT idItem_PI FROM tblPedidoItem WHERE idItem_PI = @idItem_PI))
				RAISERROR('Este produto ja esta em outro pedido.', 14, 1);

			INSERT INTO tblPedidoItem
				(idPedido_PI, idItem_PI, quantidade_PI, valorUnitario_PI, percentuaDesconto_PI, valorDesconto_PI, valorTotal_PI)
			VALUES
			(@idPedido_PI, @idItem_PI, @quantidade_PI, @valorUnitario_PI, @percentualDesconto_PI, @valorDesconto_PI, @valorTotal_PI)

			SELECT @idItem_PI AS Retorno;

			COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[InserirPedido]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserirPedido]
	@idOperacao_pedido AS INT,
	@idSituacao_pedido AS INT,
	@idFuncionario_pedido AS INT,
	@idCliente_pedido AS INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO tblPedido
				(dataHora_pedido, idOperacao_pedido, idSituacao_pedido, idFuncionario_pedido, idCliente_pedido)
			VALUES
				(GETDATE(), @idOperacao_pedido, @idSituacao_pedido, @idFuncionario_pedido, @idCliente_pedido)

			SELECT @@IDENTITY AS Retorno;

			COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[InserirPessoaFisica]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserirPessoaFisica]
		@nome_pessoaFisica AS NVARCHAR(100),
		@cpf_pessoaFisica AS NVARCHAR(14),
		@dtNasc_pessoaFisica AS DATE,
		@cep_pessoa AS NVARCHAR(9),
		@uf_pessoa AS NCHAR(2),
		@cidade_pessoa AS NVARCHAR(MAX),
		@endereco_pessoa AS NVARCHAR(MAX),
		@numero_pessoa AS INT,
		@bairro_pessoa AS NVARCHAR(MAX),
		@telefone_pessoa AS NVARCHAR(13),
		@email_pessoa AS NVARCHAR(MAX)
	AS
	BEGIN
		BEGIN TRY
			BEGIN TRAN

				IF(EXISTS(SELECT id_pessoaFisica FROM tblPessoaFisica WHERE cpf_pessoaFisica = @cpf_pessoaFisica))
					RAISERROR('CPF já existe no banco de dados!', 14, 1)

				DECLARE @id_pessoa AS INT;

				INSERT INTO tblPessoa(id_pessoaTipo, cep_pessoa, uf_pessoa, cidade_pessoa, endereco_pessoa, numero_pessoa, bairro_pessoa, telefone_pessoa, email_pessoa)
				VALUES ( 1, @cep_pessoa, @uf_pessoa, @cidade_pessoa, @endereco_pessoa, @numero_pessoa, @bairro_pessoa, @telefone_pessoa, @email_pessoa);

				SET @id_pessoa = @@IDENTITY;

				INSERT INTO tblPessoaFisica(id_pessoaFisica, nome_pessoaFisica, cpf_pessoaFisica, dtNasc_pessoaFisica)
				VALUES ( @id_pessoa, @nome_pessoaFisica, @cpf_pessoaFisica, @dtNasc_pessoaFisica );

				SELECT @id_pessoa AS Retorno;

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[InserirPessoaJuridica]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserirPessoaJuridica]
		@razao_pessoaJuridica AS NVARCHAR(100),
		@cnpj_pessoaJuridica AS NVARCHAR(18),
		@cep_pessoa AS NVARCHAR(9),
		@uf_pessoa AS NCHAR(2),
		@cidade_pessoa AS NVARCHAR(MAX),
		@endereco_pessoa AS NVARCHAR(MAX),
		@numero_pessoa AS INT,
		@bairro_pessoa AS NVARCHAR(MAX),
		@telefone_pessoa AS NVARCHAR(13),
		@email_pessoa AS NVARCHAR(MAX)
	AS
	BEGIN
		BEGIN TRY
			BEGIN TRAN

				IF(EXISTS(SELECT id_pessoaJuridica FROM tblPessoaJuridica WHERE cnpj_pessoaJuridica = @cnpj_pessoaJuridica))
					RAISERROR('CNPJ já existe no banco de dados!', 14, 1)

				DECLARE @id_pessoa AS INT;

				INSERT INTO tblPessoa
				(
				id_pessoaTipo,
				cep_pessoa,
				uf_pessoa,
				cidade_pessoa,
				endereco_pessoa,
				numero_pessoa,
				bairro_pessoa,
				telefone_pessoa,
				email_pessoa
				)
				VALUES
				(
				2,
				@cep_pessoa,
				@uf_pessoa,
				@cidade_pessoa,
				@endereco_pessoa,
				@numero_pessoa,
				@bairro_pessoa,
				@telefone_pessoa,
				@email_pessoa
				);

				SET @id_pessoa = @@IDENTITY;

				INSERT INTO tblPessoaJuridica
				(
				id_pessoaJuridica,
				razao_pessoaJuridica,
				cnpj_pessoaJuridica
				)
				VALUES 
				(
				@id_pessoa,
				@razao_pessoaJuridica,
				@cnpj_pessoaJuridica
				);

				SELECT @id_pessoa AS Retorno;

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[ManterEstoque]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ManterEstoque]
	@idItem_estoque AS INT,
	@qtd_estoque AS INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			IF(EXISTS(SELECT idItem_estoque FROM tblEstoque WHERE idItem_estoque = @idItem_estoque))
				BEGIN
					--ALTERAR
					UPDATE tblEstoque
					SET qtd_estoque = qtd_estoque + @qtd_estoque
						WHERE idItem_estoque = @idItem_estoque
				END
			ELSE
				BEGIN
					--INSERIR
					INSERT INTO tblEstoque(idItem_estoque, qtd_estoque)
					VALUES (@idItem_estoque, @qtd_estoque)
				END

			--MOVIMENTAÇÃO DE ESTOQUE
			DECLARE @tipoMovimento AS NCHAR(1);

			IF(@qtd_estoque < 0)
				SET @tipoMovimento = 'S';
			ELSE
				SET @tipoMovimento = 'E';
					
			INSERT INTO tblEstoqueMovimentado
				(idItem_EM, qtd_EM, dataHora_EM, tipoMovimento_EM)
			VALUES
				(@idItem_estoque, @qtd_estoque, GETDATE(), @tipoMovimento)

			SELECT @idItem_estoque AS Retorno;

			COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ManterEstoqueReservado]    Script Date: 08/06/2018 19:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ManterEstoqueReservado]
	@idItem_ER AS INT,
	@qtd_ER AS INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			IF(EXISTS(SELECT idItem_ER FROM tblEstoqueReservado WHERE idItem_ER = @idItem_ER))
				BEGIN
					--ALTERAR
					UPDATE tblEstoqueReservado
					SET qtd_ER = qtd_ER + @qtd_ER
						WHERE idItem_ER = @idItem_ER
				END
			ELSE
				BEGIN
					--INSERIR
					INSERT INTO tblEstoqueReservado(idItem_ER, qtd_ER)
					VALUES (@idItem_ER, @qtd_ER)
				END

			SELECT @idItem_ER AS Retorno;

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [PRINCIPAL] SET  READ_WRITE 
GO
