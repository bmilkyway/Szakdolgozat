
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/15/2022 00:56:46
-- Generated from EDMX file: C:\Users\bajar\OneDrive\szakdolgozat\SDSOFT\SD_DB\SD_DB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [C:\USERS\BAJAR\ONEDRIVE\SZAKDOLGOZAT\SDSOFT\SD_DB\USER.MDF];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_FelhasznaloKinezet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Felhasznalok] DROP CONSTRAINT [FK_FelhasznaloKinezet];
GO
IF OBJECT_ID(N'[dbo].[FK_FelhasznaloTargy]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Targyak] DROP CONSTRAINT [FK_FelhasznaloTargy];
GO
IF OBJECT_ID(N'[dbo].[FK_TargyTargyInfo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Targyak] DROP CONSTRAINT [FK_TargyTargyInfo];
GO
IF OBJECT_ID(N'[dbo].[FK_TargyBeadando]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Beadandok] DROP CONSTRAINT [FK_TargyBeadando];
GO
IF OBJECT_ID(N'[dbo].[FK_TargyZH]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ZHk] DROP CONSTRAINT [FK_TargyZH];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Felhasznalok]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Felhasznalok];
GO
IF OBJECT_ID(N'[dbo].[Kinezetek]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Kinezetek];
GO
IF OBJECT_ID(N'[dbo].[TargyInfok]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TargyInfok];
GO
IF OBJECT_ID(N'[dbo].[Targyak]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Targyak];
GO
IF OBJECT_ID(N'[dbo].[Beadandok]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Beadandok];
GO
IF OBJECT_ID(N'[dbo].[ZHk]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ZHk];
GO

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
    [Kulso] nvarchar(max)  NULL,
    [Belso] nvarchar(max)  NULL
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
    [TargyId] nvarchar(max)  NOT NULL,
    [Felhasznalo_Id] int  NOT NULL,
    [TargyInfo_Id] int  NOT NULL
);
GO

-- Creating table 'Beadandok'
CREATE TABLE [dbo].[Beadandok] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MaxPont] int  NOT NULL,
    [SajatPont] int  NOT NULL,
    [Targy_Id] int  NOT NULL
);
GO

-- Creating table 'ZHk'
CREATE TABLE [dbo].[ZHk] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MaxPont] int  NOT NULL,
    [SajatPont] int  NOT NULL,
    [Targy_Id] int  NOT NULL
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

-- Creating primary key on [Id] in table 'Beadandok'
ALTER TABLE [dbo].[Beadandok]
ADD CONSTRAINT [PK_Beadandok]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ZHk'
ALTER TABLE [dbo].[ZHk]
ADD CONSTRAINT [PK_ZHk]
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

-- Creating foreign key on [Targy_Id] in table 'Beadandok'
ALTER TABLE [dbo].[Beadandok]
ADD CONSTRAINT [FK_TargyBeadando]
    FOREIGN KEY ([Targy_Id])
    REFERENCES [dbo].[Targyak]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TargyBeadando'
CREATE INDEX [IX_FK_TargyBeadando]
ON [dbo].[Beadandok]
    ([Targy_Id]);
GO

-- Creating foreign key on [Targy_Id] in table 'ZHk'
ALTER TABLE [dbo].[ZHk]
ADD CONSTRAINT [FK_TargyZH]
    FOREIGN KEY ([Targy_Id])
    REFERENCES [dbo].[Targyak]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TargyZH'
CREATE INDEX [IX_FK_TargyZH]
ON [dbo].[ZHk]
    ([Targy_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------