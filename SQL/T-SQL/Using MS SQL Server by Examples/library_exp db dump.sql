USE [master]
GO

-- Create database with docker-friendly file paths
CREATE DATABASE [library_exp]
 ON  PRIMARY
( NAME = N'library_exp', FILENAME = N'/var/opt/mssql/data/library_exp.mdf' , SIZE = 8192KB , MAXSIZE = 51200MB, FILEGROWTH = 65536KB )
 LOG ON
( NAME = N'library_exp_log', FILENAME = N'/var/opt/mssql/data/library_exp_log.ldf' , SIZE = 8192KB , MAXSIZE = 1048576KB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [library_exp] SET COMPATIBILITY_LEVEL = 150
GO

USE [library_exp]
GO

-- Create tables
CREATE TABLE [dbo].[authors](
	[a_id] [int] IDENTITY(1,1) NOT NULL,
	[a_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_authors] PRIMARY KEY CLUSTERED ([a_id] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[books](
	[b_id] [int] IDENTITY(1,1) NOT NULL,
	[b_name] [nvarchar](150) NOT NULL,
	[b_year] [smallint] NOT NULL,
	[b_quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED ([b_id] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[genres](
	[g_id] [int] IDENTITY(1,1) NOT NULL,
	[g_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_genres] PRIMARY KEY CLUSTERED ([g_id] ASC),
 CONSTRAINT [UQ_genres_g_name] UNIQUE NONCLUSTERED ([g_name] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[m2m_books_authors](
	[b_id] [int] NOT NULL,
	[a_id] [int] NOT NULL,
 CONSTRAINT [PK_m2m_books_authors] PRIMARY KEY CLUSTERED ([b_id] ASC, [a_id] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[m2m_books_genres](
	[b_id] [int] NOT NULL,
	[g_id] [int] NOT NULL,
 CONSTRAINT [PK_m2m_books_genres] PRIMARY KEY CLUSTERED ([b_id] ASC, [g_id] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[subscribers](
	[s_id] [int] IDENTITY(1,1) NOT NULL,
	[s_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_subscribers] PRIMARY KEY CLUSTERED ([s_id] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[subscriptions](
	[sb_id] [int] IDENTITY(1,1) NOT NULL,
	[sb_subscriber] [int] NOT NULL,
	[sb_book] [int] NOT NULL,
	[sb_start] [date] NOT NULL,
	[sb_finish] [date] NOT NULL,
	[sb_is_active] [char](1) NOT NULL,
 CONSTRAINT [PK_subscriptions] PRIMARY KEY CLUSTERED ([sb_id] ASC)
) ON [PRIMARY]
GO

-- Create foreign key constraints
ALTER TABLE [dbo].[m2m_books_authors] ADD CONSTRAINT [FK_m2m_books_authors_authors]
FOREIGN KEY([a_id]) REFERENCES [dbo].[authors] ([a_id]) ON UPDATE CASCADE ON DELETE CASCADE
GO

ALTER TABLE [dbo].[m2m_books_authors] ADD CONSTRAINT [FK_m2m_books_authors_books]
FOREIGN KEY([b_id]) REFERENCES [dbo].[books] ([b_id]) ON UPDATE CASCADE ON DELETE CASCADE
GO

ALTER TABLE [dbo].[m2m_books_genres] ADD CONSTRAINT [FK_m2m_books_genres_books]
FOREIGN KEY([b_id]) REFERENCES [dbo].[books] ([b_id]) ON UPDATE CASCADE ON DELETE CASCADE
GO

ALTER TABLE [dbo].[m2m_books_genres] ADD CONSTRAINT [FK_m2m_books_genres_genres]
FOREIGN KEY([g_id]) REFERENCES [dbo].[genres] ([g_id]) ON UPDATE CASCADE ON DELETE CASCADE
GO

ALTER TABLE [dbo].[subscriptions] ADD CONSTRAINT [FK_subscriptions_books]
FOREIGN KEY([sb_book]) REFERENCES [dbo].[books] ([b_id]) ON UPDATE CASCADE ON DELETE CASCADE
GO

ALTER TABLE [dbo].[subscriptions] ADD CONSTRAINT [FK_subscriptions_subscribers]
FOREIGN KEY([sb_subscriber]) REFERENCES [dbo].[subscribers] ([s_id]) ON UPDATE CASCADE ON DELETE CASCADE
GO

ALTER TABLE [dbo].[subscriptions] ADD CONSTRAINT [check_enum]
CHECK (([sb_is_active]='N' OR [sb_is_active]='Y'))
GO
