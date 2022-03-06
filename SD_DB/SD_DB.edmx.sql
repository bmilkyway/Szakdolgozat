
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/06/2022 18:03:26
-- Generated from EDMX file: C:\Users\bajar\OneDrive\szakdolgozat\SDSOFT\SD_DB\SD_DB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [C:\USERS\BAJAR\ONEDRIVE\SZAKDOLGOZAT\SDSOFT\SD_DB\USERS.MDF];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Felhasznalok'
CREATE TABLE [dbo].[Felhasznalok] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Felhasznalonev] nvarchar(max)  NOT NULL,
    [Jelszo] nvarchar(max)  NOT NULL,
    [Nev] nvarchar(max)  NOT NULL,
    [SzulDat] nvarchar(max)  NOT NULL,
    [Telefonszam] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Lakcim] nvarchar(max)  NOT NULL,
    [Kinezet_Id] int  NOT NULL
);
GO

-- Creating table 'Kinezetek'
CREATE TABLE [dbo].[Kinezetek] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Kulso] nvarchar(max)  NOT NULL,
    [Belso] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'TargyInfok'
CREATE TABLE [dbo].[TargyInfok] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nev] nvarchar(max)  NOT NULL,
    [Tipus] nvarchar(max)  NOT NULL,
    [Kredit] nvarchar(max)  NOT NULL,
    [Kovetelmeny] nvarchar(max)  NOT NULL,
    [Ponthatar] nvarchar(max)  NOT NULL,
    [Vizsga] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Targyak'
CREATE TABLE [dbo].[Targyak] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nev] nvarchar(max)  NOT NULL,
    [ZH] nvarchar(max)  NOT NULL,
    [Beadando] nvarchar(max)  NOT NULL,
    [Pluszpont] nvarchar(max)  NOT NULL,
    [TargyID] nvarchar(max)  NOT NULL,
    [Felhasznalo_Id] int  NOT NULL,
    [TargyInfo_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Felhasznalok'
ALTER TABLE [dbo].[Felhasznalok]
ADD CONSTRAINT [PK_Felhasznalok]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Kinezetek'
ALTER TABLE [dbo].[Kinezetek]
ADD CONSTRAINT [PK_Kinezetek]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TargyInfok'
ALTER TABLE [dbo].[TargyInfok]
ADD CONSTRAINT [PK_TargyInfok]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Targyak'
ALTER TABLE [dbo].[Targyak]
ADD CONSTRAINT [PK_Targyak]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Kinezet_Id] in table 'Felhasznalok'
ALTER TABLE [dbo].[Felhasznalok]
ADD CONSTRAINT [FK_FelhasznaloKinezet]
    FOREIGN KEY ([Kinezet_Id])
    REFERENCES [dbo].[Kinezetek]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FelhasznaloKinezet'
CREATE INDEX [IX_FK_FelhasznaloKinezet]
ON [dbo].[Felhasznalok]
    ([Kinezet_Id]);
GO

-- Creating foreign key on [Felhasznalo_Id] in table 'Targyak'
ALTER TABLE [dbo].[Targyak]
ADD CONSTRAINT [FK_FelhasznaloTargy]
    FOREIGN KEY ([Felhasznalo_Id])
    REFERENCES [dbo].[Felhasznalok]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FelhasznaloTargy'
CREATE INDEX [IX_FK_FelhasznaloTargy]
ON [dbo].[Targyak]
    ([Felhasznalo_Id]);
GO

-- Creating foreign key on [TargyInfo_Id] in table 'Targyak'
ALTER TABLE [dbo].[Targyak]
ADD CONSTRAINT [FK_TargyTargyInfo]
    FOREIGN KEY ([TargyInfo_Id])
    REFERENCES [dbo].[TargyInfok]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TargyTargyInfo'
CREATE INDEX [IX_FK_TargyTargyInfo]
ON [dbo].[Targyak]
    ([TargyInfo_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------