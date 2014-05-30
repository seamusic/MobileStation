
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/31/2014 00:17:02
-- Generated from EDMX file: F:\Documents\GitHub\MobileStation\src\web\AppStore.Models\DB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [appstore];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ControllerActionRole_ControllerAction]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ActionPermissionRole] DROP CONSTRAINT [FK_ControllerActionRole_ControllerAction];
GO
IF OBJECT_ID(N'[dbo].[FK_ControllerActionRole_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ActionPermissionRole] DROP CONSTRAINT [FK_ControllerActionRole_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_PCClient_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PCClient] DROP CONSTRAINT [FK_PCClient_User];
GO
IF OBJECT_ID(N'[dbo].[FK_UserRole_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_UserRole_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ActionPermission]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ActionPermission];
GO
IF OBJECT_ID(N'[dbo].[ActionPermissionRole]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ActionPermissionRole];
GO
IF OBJECT_ID(N'[dbo].[Application]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Application];
GO
IF OBJECT_ID(N'[dbo].[ApplicationEvaluate]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ApplicationEvaluate];
GO
IF OBJECT_ID(N'[dbo].[ApplicationTag]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ApplicationTag];
GO
IF OBJECT_ID(N'[dbo].[AppType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AppType];
GO
IF OBJECT_ID(N'[dbo].[AppUser]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AppUser];
GO
IF OBJECT_ID(N'[dbo].[Brand]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Brand];
GO
IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[Driver]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Driver];
GO
IF OBJECT_ID(N'[dbo].[Mobile]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Mobile];
GO
IF OBJECT_ID(N'[dbo].[MobileApp]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MobileApp];
GO
IF OBJECT_ID(N'[dbo].[MobileApplication]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MobileApplication];
GO
IF OBJECT_ID(N'[dbo].[MobileClient]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MobileClient];
GO
IF OBJECT_ID(N'[dbo].[PCApp]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PCApp];
GO
IF OBJECT_ID(N'[dbo].[PCClient]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PCClient];
GO
IF OBJECT_ID(N'[dbo].[PCInstallLog]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PCInstallLog];
GO
IF OBJECT_ID(N'[dbo].[PhoneModel]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PhoneModel];
GO
IF OBJECT_ID(N'[dbo].[Picture]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Picture];
GO
IF OBJECT_ID(N'[dbo].[Role]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Role];
GO
IF OBJECT_ID(N'[dbo].[RunLog]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RunLog];
GO
IF OBJECT_ID(N'[dbo].[Statistics]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Statistics];
GO
IF OBJECT_ID(N'[dbo].[Tag]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tag];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO
IF OBJECT_ID(N'[dbo].[UserMobile]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserMobile];
GO
IF OBJECT_ID(N'[dbo].[UserRole]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserRole];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ActionPermission'
CREATE TABLE [dbo].[ActionPermission] (
    [ActionPermissionId] varchar(36)  NOT NULL,
    [ParentId] varchar(36)  NULL,
    [Name] varchar(100)  NULL,
    [IsController] bit  NOT NULL,
    [IsAllowedNoneRoles] bit  NOT NULL,
    [IsAllowedAllRoles] bit  NOT NULL,
    [ControlName] varchar(50)  NOT NULL,
    [ActionName] varchar(50)  NULL,
    [Description] varchar(100)  NULL,
    [Permission] int  NULL,
    [CreateTime] datetime  NOT NULL,
    [IsAllowed] bit  NOT NULL
);
GO

-- Creating table 'ActionPermissionRole'
CREATE TABLE [dbo].[ActionPermissionRole] (
    [ActionPermissionRoleId] varchar(36)  NOT NULL,
    [IsAllowed] bit  NOT NULL,
    [RoleId] varchar(36)  NOT NULL,
    [ActionPermissionId] varchar(36)  NOT NULL
);
GO

-- Creating table 'Application'
CREATE TABLE [dbo].[Application] (
    [ApplicationID] varchar(36)  NOT NULL,
    [BrandID] varchar(36)  NULL,
    [AppType] int  NOT NULL,
    [ApplicationName] varchar(100)  NOT NULL,
    [PictureUrl] varchar(200)  NULL,
    [Version] varchar(50)  NULL,
    [Size] varchar(50)  NULL,
    [Description] varchar(max)  NULL,
    [OfficialWebsite] varchar(200)  NULL,
    [DownloadUrl] varchar(200)  NULL,
    [IsValid] bit  NOT NULL,
    [UpdateTime] datetime  NOT NULL,
    [Total] int  NOT NULL,
    [IsRecommend] bit  NOT NULL,
    [IsNecessary] bit  NOT NULL,
    [Score] decimal(5,2)  NOT NULL,
    [Checksum] varchar(128)  NULL,
    [PackageName] varchar(256)  NULL,
    [ApkInfo] varchar(1000)  NULL,
    [ServerPath] varchar(256)  NULL,
    [RelativePath] varchar(256)  NULL,
    [OSVersion] varchar(36)  NULL,
    [SDKVersion] varchar(36)  NULL,
    [Icon] varchar(256)  NULL,
    [Seq] int  NULL,
    [CreateTime] datetime  NULL,
    [AutoDownload] bit  NOT NULL
);
GO

-- Creating table 'ApplicationEvaluate'
CREATE TABLE [dbo].[ApplicationEvaluate] (
    [ApplicationEvaluateID] char(10)  NOT NULL,
    [UserID] varchar(36)  NULL,
    [ApplicationID] varchar(36)  NOT NULL,
    [Content] char(10)  NULL,
    [Score] decimal(5,2)  NULL,
    [UpdateTime] datetime  NULL
);
GO

-- Creating table 'ApplicationTag'
CREATE TABLE [dbo].[ApplicationTag] (
    [TagID] varchar(36)  NOT NULL,
    [ApplicationID] varchar(36)  NOT NULL
);
GO

-- Creating table 'AppType'
CREATE TABLE [dbo].[AppType] (
    [AppTypeID] int  NOT NULL,
    [AppTypeName] varchar(50)  NULL,
    [Count] int  NULL,
    [Description] varchar(2000)  NULL
);
GO

-- Creating table 'AppUser'
CREATE TABLE [dbo].[AppUser] (
    [AppUserID] varchar(36)  NOT NULL,
    [UserName] varchar(100)  NOT NULL,
    [LoginID] varchar(50)  NOT NULL,
    [Password] varchar(50)  NOT NULL,
    [RegTime] datetime  NULL,
    [LastLoginTime] datetime  NULL,
    [ErrorCount] int  NULL,
    [IsValid] bit  NULL,
    [UpdateTime] datetime  NULL
);
GO

-- Creating table 'Brand'
CREATE TABLE [dbo].[Brand] (
    [BrandID] varchar(36)  NOT NULL,
    [BrandName] varchar(50)  NOT NULL,
    [BrandType] int  NOT NULL,
    [Mobile] varchar(50)  NULL,
    [Telephone] varchar(50)  NULL,
    [Addr] varchar(100)  NULL,
    [Url] varchar(200)  NULL,
    [Linkman] varchar(50)  NULL,
    [Description] varchar(2000)  NULL,
    [UpdateTime] datetime  NULL
);
GO

-- Creating table 'Category'
CREATE TABLE [dbo].[Category] (
    [CategoryID] varchar(36)  NOT NULL,
    [AppTypeID] int  NOT NULL,
    [CategoryName] varchar(100)  NOT NULL,
    [ParentID] varchar(36)  NULL,
    [Seq] int  NULL,
    [ENName] varchar(256)  NULL
);
GO

-- Creating table 'Driver'
CREATE TABLE [dbo].[Driver] (
    [DriverID] varchar(36)  NOT NULL,
    [DriverName] varchar(200)  NOT NULL,
    [DownloadUrl] varchar(200)  NOT NULL,
    [Version] varchar(50)  NULL,
    [UpdateTime] datetime  NULL,
    [Description] varchar(2000)  NULL
);
GO

-- Creating table 'Mobile'
CREATE TABLE [dbo].[Mobile] (
    [MobileID] varchar(36)  NOT NULL,
    [DriverID] varchar(36)  NULL,
    [MobileName] varchar(100)  NOT NULL,
    [Brand] varchar(100)  NULL,
    [Model] varchar(50)  NULL,
    [System] varchar(50)  NULL,
    [Version] varchar(50)  NULL,
    [PictureUrl] varchar(200)  NULL,
    [MemorySize] varchar(50)  NULL,
    [CPU] varchar(50)  NULL,
    [ScreenSize] varchar(100)  NULL,
    [Resolution] varchar(50)  NULL,
    [UpdateTime] datetime  NULL,
    [PID] varchar(256)  NULL,
    [VID] varchar(256)  NULL
);
GO

-- Creating table 'MobileApp'
CREATE TABLE [dbo].[MobileApp] (
    [MobileAppID] varchar(36)  NOT NULL,
    [ApplicationID] varchar(36)  NOT NULL,
    [MobileClientID] varchar(36)  NOT NULL,
    [Installer] varchar(36)  NULL,
    [CreateTime] datetime  NULL,
    [FirstTime] datetime  NULL,
    [SecondTime] datetime  NULL,
    [Totaltime] bigint  NULL,
    [UpdateTime] datetime  NULL,
    [AddTime] datetime  NULL,
    [RemoveTime] datetime  NULL,
    [PackageName] varchar(50)  NULL,
    [IsSync] bit  NULL,
    [IsSys] bit  NULL,
    [Frequency] int  NULL
);
GO

-- Creating table 'MobileApplication'
CREATE TABLE [dbo].[MobileApplication] (
    [MobileApplicationID] varchar(36)  NOT NULL,
    [ApplicationID] varchar(36)  NULL,
    [ClientType] int  NULL,
    [ClientID] varchar(36)  NULL,
    [UpdateTime] datetime  NULL
);
GO

-- Creating table 'MobileClient'
CREATE TABLE [dbo].[MobileClient] (
    [MobileClientID] varchar(36)  NOT NULL,
    [PhoneModelID] varchar(36)  NULL,
    [PCClientID] varchar(36)  NULL,
    [ClientName] varchar(50)  NULL,
    [ClientMac] varchar(36)  NULL,
    [ClientKey] varchar(128)  NULL,
    [Description] varchar(2000)  NULL,
    [UpdateTime] datetime  NULL,
    [CreateTime] datetime  NULL
);
GO

-- Creating table 'PCApp'
CREATE TABLE [dbo].[PCApp] (
    [PCAppID] varchar(36)  NOT NULL,
    [ApplicationID] varchar(36)  NOT NULL,
    [PCClientID] varchar(36)  NOT NULL,
    [CreateTime] datetime  NULL,
    [UpdateTime] datetime  NULL,
    [InstallCount] int  NULL
);
GO

-- Creating table 'PCClient'
CREATE TABLE [dbo].[PCClient] (
    [PCClientID] varchar(36)  NOT NULL,
    [UserID] varchar(36)  NULL,
    [ClientName] varchar(50)  NULL,
    [ClientKey] varchar(128)  NULL,
    [ClientMac] varchar(36)  NULL,
    [Description] varchar(2000)  NULL,
    [UpdateTime] datetime  NULL,
    [CreateTime] datetime  NULL
);
GO

-- Creating table 'PCInstallLog'
CREATE TABLE [dbo].[PCInstallLog] (
    [MobileClientID] varchar(36)  NOT NULL,
    [PCAppID] varchar(36)  NOT NULL,
    [UpdateTime] datetime  NULL,
    [Message] varchar(1000)  NULL
);
GO

-- Creating table 'PhoneModel'
CREATE TABLE [dbo].[PhoneModel] (
    [PhoneModelID] varchar(36)  NOT NULL,
    [DriverID] varchar(36)  NULL,
    [BrandID] varchar(36)  NULL,
    [ModelName] varchar(100)  NOT NULL,
    [System] varchar(50)  NULL,
    [Version] varchar(50)  NULL,
    [PictureUrl] varchar(200)  NULL,
    [MemorySize] varchar(50)  NULL,
    [CPU] varchar(50)  NULL,
    [ScreenSize] varchar(100)  NULL,
    [Resolution] varchar(50)  NULL,
    [UpdateTime] datetime  NULL
);
GO

-- Creating table 'Picture'
CREATE TABLE [dbo].[Picture] (
    [PictureID] varchar(36)  NOT NULL,
    [ApplicationID] varchar(36)  NULL,
    [Path] varchar(200)  NULL,
    [Size] int  NULL,
    [Width] int  NULL,
    [Height] int  NULL
);
GO

-- Creating table 'Role'
CREATE TABLE [dbo].[Role] (
    [RoleID] varchar(36)  NOT NULL,
    [Name] varchar(50)  NULL,
    [Description] varchar(2000)  NULL
);
GO

-- Creating table 'RunLog'
CREATE TABLE [dbo].[RunLog] (
    [RunLogID] varchar(36)  NOT NULL,
    [MobileAppID] varchar(36)  NULL,
    [Action] int  NOT NULL,
    [UpdateTime] datetime  NULL,
    [Message] varchar(1000)  NULL,
    [PackageName] varchar(200)  NULL,
    [StartTime] datetime  NULL,
    [EndTime] datetime  NULL,
    [TotalTime] bigint  NULL
);
GO

-- Creating table 'Statistics'
CREATE TABLE [dbo].[Statistics] (
    [StatisticsID] varchar(36)  NOT NULL,
    [Action] int  NOT NULL,
    [UpdateTime] datetime  NULL
);
GO

-- Creating table 'Tag'
CREATE TABLE [dbo].[Tag] (
    [TagID] varchar(36)  NOT NULL,
    [TagName] varchar(50)  NULL
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [UserId] varchar(36)  NOT NULL,
    [UserName] varchar(100)  NOT NULL,
    [LoginId] varchar(50)  NOT NULL,
    [Password] varchar(50)  NOT NULL,
    [RegTime] datetime  NULL,
    [LastLoginTime] datetime  NULL,
    [ErrorCount] int  NULL,
    [IsValid] bit  NULL,
    [UpdateTime] datetime  NULL,
    [Mobile] varchar(50)  NULL,
    [Telephone] varchar(50)  NULL
);
GO

-- Creating table 'UserMobile'
CREATE TABLE [dbo].[UserMobile] (
    [PhoneModelID] varchar(36)  NOT NULL,
    [UserID] varchar(36)  NOT NULL
);
GO

-- Creating table 'UserRole'
CREATE TABLE [dbo].[UserRole] (
    [UserRoleId] varchar(36)  NOT NULL,
    [UserId] varchar(36)  NOT NULL,
    [RoleId] varchar(36)  NOT NULL
);
GO

-- Creating table 'ApplicationCategory'
CREATE TABLE [dbo].[ApplicationCategory] (
    [Application_ApplicationID] varchar(36)  NOT NULL,
    [Category_CategoryID] varchar(36)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ActionPermissionId] in table 'ActionPermission'
ALTER TABLE [dbo].[ActionPermission]
ADD CONSTRAINT [PK_ActionPermission]
    PRIMARY KEY CLUSTERED ([ActionPermissionId] ASC);
GO

-- Creating primary key on [ActionPermissionRoleId] in table 'ActionPermissionRole'
ALTER TABLE [dbo].[ActionPermissionRole]
ADD CONSTRAINT [PK_ActionPermissionRole]
    PRIMARY KEY CLUSTERED ([ActionPermissionRoleId] ASC);
GO

-- Creating primary key on [ApplicationID] in table 'Application'
ALTER TABLE [dbo].[Application]
ADD CONSTRAINT [PK_Application]
    PRIMARY KEY CLUSTERED ([ApplicationID] ASC);
GO

-- Creating primary key on [ApplicationEvaluateID] in table 'ApplicationEvaluate'
ALTER TABLE [dbo].[ApplicationEvaluate]
ADD CONSTRAINT [PK_ApplicationEvaluate]
    PRIMARY KEY CLUSTERED ([ApplicationEvaluateID] ASC);
GO

-- Creating primary key on [TagID], [ApplicationID] in table 'ApplicationTag'
ALTER TABLE [dbo].[ApplicationTag]
ADD CONSTRAINT [PK_ApplicationTag]
    PRIMARY KEY CLUSTERED ([TagID], [ApplicationID] ASC);
GO

-- Creating primary key on [AppTypeID] in table 'AppType'
ALTER TABLE [dbo].[AppType]
ADD CONSTRAINT [PK_AppType]
    PRIMARY KEY CLUSTERED ([AppTypeID] ASC);
GO

-- Creating primary key on [AppUserID] in table 'AppUser'
ALTER TABLE [dbo].[AppUser]
ADD CONSTRAINT [PK_AppUser]
    PRIMARY KEY CLUSTERED ([AppUserID] ASC);
GO

-- Creating primary key on [BrandID] in table 'Brand'
ALTER TABLE [dbo].[Brand]
ADD CONSTRAINT [PK_Brand]
    PRIMARY KEY CLUSTERED ([BrandID] ASC);
GO

-- Creating primary key on [CategoryID] in table 'Category'
ALTER TABLE [dbo].[Category]
ADD CONSTRAINT [PK_Category]
    PRIMARY KEY CLUSTERED ([CategoryID] ASC);
GO

-- Creating primary key on [DriverID] in table 'Driver'
ALTER TABLE [dbo].[Driver]
ADD CONSTRAINT [PK_Driver]
    PRIMARY KEY CLUSTERED ([DriverID] ASC);
GO

-- Creating primary key on [MobileID] in table 'Mobile'
ALTER TABLE [dbo].[Mobile]
ADD CONSTRAINT [PK_Mobile]
    PRIMARY KEY CLUSTERED ([MobileID] ASC);
GO

-- Creating primary key on [MobileAppID] in table 'MobileApp'
ALTER TABLE [dbo].[MobileApp]
ADD CONSTRAINT [PK_MobileApp]
    PRIMARY KEY CLUSTERED ([MobileAppID] ASC);
GO

-- Creating primary key on [MobileApplicationID] in table 'MobileApplication'
ALTER TABLE [dbo].[MobileApplication]
ADD CONSTRAINT [PK_MobileApplication]
    PRIMARY KEY CLUSTERED ([MobileApplicationID] ASC);
GO

-- Creating primary key on [MobileClientID] in table 'MobileClient'
ALTER TABLE [dbo].[MobileClient]
ADD CONSTRAINT [PK_MobileClient]
    PRIMARY KEY CLUSTERED ([MobileClientID] ASC);
GO

-- Creating primary key on [PCAppID] in table 'PCApp'
ALTER TABLE [dbo].[PCApp]
ADD CONSTRAINT [PK_PCApp]
    PRIMARY KEY CLUSTERED ([PCAppID] ASC);
GO

-- Creating primary key on [PCClientID] in table 'PCClient'
ALTER TABLE [dbo].[PCClient]
ADD CONSTRAINT [PK_PCClient]
    PRIMARY KEY CLUSTERED ([PCClientID] ASC);
GO

-- Creating primary key on [MobileClientID], [PCAppID] in table 'PCInstallLog'
ALTER TABLE [dbo].[PCInstallLog]
ADD CONSTRAINT [PK_PCInstallLog]
    PRIMARY KEY CLUSTERED ([MobileClientID], [PCAppID] ASC);
GO

-- Creating primary key on [PhoneModelID] in table 'PhoneModel'
ALTER TABLE [dbo].[PhoneModel]
ADD CONSTRAINT [PK_PhoneModel]
    PRIMARY KEY CLUSTERED ([PhoneModelID] ASC);
GO

-- Creating primary key on [PictureID] in table 'Picture'
ALTER TABLE [dbo].[Picture]
ADD CONSTRAINT [PK_Picture]
    PRIMARY KEY CLUSTERED ([PictureID] ASC);
GO

-- Creating primary key on [RoleID] in table 'Role'
ALTER TABLE [dbo].[Role]
ADD CONSTRAINT [PK_Role]
    PRIMARY KEY CLUSTERED ([RoleID] ASC);
GO

-- Creating primary key on [RunLogID] in table 'RunLog'
ALTER TABLE [dbo].[RunLog]
ADD CONSTRAINT [PK_RunLog]
    PRIMARY KEY CLUSTERED ([RunLogID] ASC);
GO

-- Creating primary key on [StatisticsID] in table 'Statistics'
ALTER TABLE [dbo].[Statistics]
ADD CONSTRAINT [PK_Statistics]
    PRIMARY KEY CLUSTERED ([StatisticsID] ASC);
GO

-- Creating primary key on [TagID] in table 'Tag'
ALTER TABLE [dbo].[Tag]
ADD CONSTRAINT [PK_Tag]
    PRIMARY KEY CLUSTERED ([TagID] ASC);
GO

-- Creating primary key on [UserId] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [PhoneModelID], [UserID] in table 'UserMobile'
ALTER TABLE [dbo].[UserMobile]
ADD CONSTRAINT [PK_UserMobile]
    PRIMARY KEY CLUSTERED ([PhoneModelID], [UserID] ASC);
GO

-- Creating primary key on [UserRoleId] in table 'UserRole'
ALTER TABLE [dbo].[UserRole]
ADD CONSTRAINT [PK_UserRole]
    PRIMARY KEY CLUSTERED ([UserRoleId] ASC);
GO

-- Creating primary key on [Application_ApplicationID], [Category_CategoryID] in table 'ApplicationCategory'
ALTER TABLE [dbo].[ApplicationCategory]
ADD CONSTRAINT [PK_ApplicationCategory]
    PRIMARY KEY CLUSTERED ([Application_ApplicationID], [Category_CategoryID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ActionPermissionId] in table 'ActionPermissionRole'
ALTER TABLE [dbo].[ActionPermissionRole]
ADD CONSTRAINT [FK_ControllerActionRole_ControllerAction]
    FOREIGN KEY ([ActionPermissionId])
    REFERENCES [dbo].[ActionPermission]
        ([ActionPermissionId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ControllerActionRole_ControllerAction'
CREATE INDEX [IX_FK_ControllerActionRole_ControllerAction]
ON [dbo].[ActionPermissionRole]
    ([ActionPermissionId]);
GO

-- Creating foreign key on [RoleId] in table 'ActionPermissionRole'
ALTER TABLE [dbo].[ActionPermissionRole]
ADD CONSTRAINT [FK_ControllerActionRole_Role]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Role]
        ([RoleID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ControllerActionRole_Role'
CREATE INDEX [IX_FK_ControllerActionRole_Role]
ON [dbo].[ActionPermissionRole]
    ([RoleId]);
GO

-- Creating foreign key on [UserID] in table 'PCClient'
ALTER TABLE [dbo].[PCClient]
ADD CONSTRAINT [FK_PCClient_User]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[User]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PCClient_User'
CREATE INDEX [IX_FK_PCClient_User]
ON [dbo].[PCClient]
    ([UserID]);
GO

-- Creating foreign key on [RoleId] in table 'UserRole'
ALTER TABLE [dbo].[UserRole]
ADD CONSTRAINT [FK_UserRole_Role]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Role]
        ([RoleID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserRole_Role'
CREATE INDEX [IX_FK_UserRole_Role]
ON [dbo].[UserRole]
    ([RoleId]);
GO

-- Creating foreign key on [UserId] in table 'UserRole'
ALTER TABLE [dbo].[UserRole]
ADD CONSTRAINT [FK_UserRole_User]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[User]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserRole_User'
CREATE INDEX [IX_FK_UserRole_User]
ON [dbo].[UserRole]
    ([UserId]);
GO

-- Creating foreign key on [Application_ApplicationID] in table 'ApplicationCategory'
ALTER TABLE [dbo].[ApplicationCategory]
ADD CONSTRAINT [FK_ApplicationCategory_Application]
    FOREIGN KEY ([Application_ApplicationID])
    REFERENCES [dbo].[Application]
        ([ApplicationID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Category_CategoryID] in table 'ApplicationCategory'
ALTER TABLE [dbo].[ApplicationCategory]
ADD CONSTRAINT [FK_ApplicationCategory_Category]
    FOREIGN KEY ([Category_CategoryID])
    REFERENCES [dbo].[Category]
        ([CategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ApplicationCategory_Category'
CREATE INDEX [IX_FK_ApplicationCategory_Category]
ON [dbo].[ApplicationCategory]
    ([Category_CategoryID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------