
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/04/2022 12:34:44
-- Generated from EDMX file: C:\Users\bajar\OneDrive\szakdolgozat\SD_SOFT_DAL\SD_SOFT_DAL\edmSDSOFT.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [C:\USERS\BAJAR\ONEDRIVE\SZAKDOLGOZAT\SD_SOFT_DAL\SD_SOFT_DAL\SD_SOFT_DB.MDF];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_enKinezetenFelhasznalo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[enKinezetek] DROP CONSTRAINT [FK_enKinezetenFelhasznalo];
GO
IF OBJECT_ID(N'[dbo].[FK_enTargyenFelvettTargy]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[enTargyak] DROP CONSTRAINT [FK_enTargyenFelvettTargy];
GO
IF OBJECT_ID(N'[dbo].[FK_enFelhasznaloenFelvettTargy]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[enFelvettTargyak] DROP CONSTRAINT [FK_enFelhasznaloenFelvettTargy];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[enFelhasznalok]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enFelhasznalok];
GO
IF OBJECT_ID(N'[dbo].[enKinezetek]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enKinezetek];
GO
IF OBJECT_ID(N'[dbo].[enTargyak]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enTargyak];
GO
IF OBJECT_ID(N'[dbo].[enFelvettTargyak]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enFelvettTargyak];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'enFelhasznalok'
CREATE TABLE [dbo].[enFelhasznalok] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Jogosultsag] nvarchar(max)  NOT NULL,
    [Felhasznalonev] nvarchar(max)  NOT NULL,
    [Jelszo] nvarchar(max)  NOT NULL,
    [Nev] nvarchar(max)  NOT NULL,
    [SzulDat] datetime  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Kinezet] nvarchar(max)  NOT NULL,
    [Lakcim] nvarchar(max)  NOT NULL,
    [Egyetem] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'enKinezetek'
CREATE TABLE [dbo].[enKinezetek] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Belso] nvarchar(max)  NOT NULL,
    [Kulso] nvarchar(max)  NOT NULL,
    [Kep] nvarchar(max)  NOT NULL,
    [Link] nvarchar(max)  NOT NULL,
    [enFelhasznalo_Id] int  NOT NULL
);
GO

-- Creating table 'enTargyak'
CREATE TABLE [dbo].[enTargyak] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nev] nvarchar(max)  NOT NULL,
    [Kredit] nvarchar(max)  NOT NULL,
    [Tipus] nvarchar(max)  NOT NULL,
    [Kovetelmeny] nvarchar(max)  NOT NULL,
    [VizsgaId] nvarchar(max)  NOT NULL,
    [PonthatarId] nvarchar(max)  NOT NULL,
    [enFelvettTargy_Id] int  NOT NULL
);
GO

-- Creating table 'enFelvettTargyak'
CREATE TABLE [dbo].[enFelvettTargyak] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [KurzusId] nvarchar(max)  NOT NULL,
    [FelhasznaloId] nvarchar(max)  NOT NULL,
    [Zh] nvarchar(max)  NOT NULL,
    [Beadando] nvarchar(max)  NOT NULL,
    [Pluszpont] nvarchar(max)  NOT NULL,
    [enFelhasznalo_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'enFelhasznalok'
ALTER TABLE [dbo].[enFelhasznalok]
ADD CONSTRAINT [PK_enFelhasznalok]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'enKinezetek'
ALTER TABLE [dbo].[enKinezetek]
ADD CONSTRAINT [PK_enKinezetek]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'enTargyak'
ALTER TABLE [dbo].[enTargyak]
ADD CONSTRAINT [PK_enTargyak]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'enFelvettTargyak'
ALTER TABLE [dbo].[enFelvettTargyak]
ADD CONSTRAINT [PK_enFelvettTargyak]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [enFelhasznalo_Id] in table 'enKinezetek'
ALTER TABLE [dbo].[enKinezetek]
ADD CONSTRAINT [FK_enKinezetenFelhasznalo]
    FOREIGN KEY ([enFelhasznalo_Id])
    REFERENCES [dbo].[enFelhasznalok]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enKinezetenFelhasznalo'
CREATE INDEX [IX_FK_enKinezetenFelhasznalo]
ON [dbo].[enKinezetek]
    ([enFelhasznalo_Id]);
GO

-- Creating foreign key on [enFelvettTargy_Id] in table 'enTargyak'
ALTER TABLE [dbo].[enTargyak]
ADD CONSTRAINT [FK_enTargyenFelvettTargy]
    FOREIGN KEY ([enFelvettTargy_Id])
    REFERENCES [dbo].[enFelvettTargyak]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enTargyenFelvettTargy'
CREATE INDEX [IX_FK_enTargyenFelvettTargy]
ON [dbo].[enTargyak]
    ([enFelvettTargy_Id]);
GO

-- Creating foreign key on [enFelhasznalo_Id] in table 'enFelvettTargyak'
ALTER TABLE [dbo].[enFelvettTargyak]
ADD CONSTRAINT [FK_enFelhasznaloenFelvettTargy]
    FOREIGN KEY ([enFelhasznalo_Id])
    REFERENCES [dbo].[enFelhasznalok]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enFelhasznaloenFelvettTargy'
CREATE INDEX [IX_FK_enFelhasznaloenFelvettTargy]
ON [dbo].[enFelvettTargyak]
    ([enFelhasznalo_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------