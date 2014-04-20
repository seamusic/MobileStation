USE [appstore]
GO

/****** Object:  Table [dbo].[ActionPermission]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[ActionPermission]
GO

/****** Object:  Table [dbo].[ActionPermissionRole]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[ActionPermissionRole]
GO

/****** Object:  Table [dbo].[UserRole]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[UserRole]
GO

/****** Object:  Table [dbo].[Application]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[Application]
GO

/****** Object:  Table [dbo].[ApplicationEvaluate]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[ApplicationEvaluate]
GO

/****** Object:  Table [dbo].[ApplicationTag]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[ApplicationTag]
GO

/****** Object:  Table [dbo].[AppType]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[AppType]
GO

/****** Object:  Table [dbo].[AppUser]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[AppUser]
GO

/****** Object:  Table [dbo].[Brand]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[Brand]
GO

/****** Object:  Table [dbo].[Category]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[Category]
GO

/****** Object:  Table [dbo].[Driver]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[Driver]
GO

/****** Object:  Table [dbo].[Mobile]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[Mobile]
GO

/****** Object:  Table [dbo].[MobileApp]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[MobileApp]
GO

/****** Object:  Table [dbo].[MobileApplication]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[MobileApplication]
GO

/****** Object:  Table [dbo].[MobileClient]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[MobileClient]
GO

/****** Object:  Table [dbo].[PCApp]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[PCApp]
GO

/****** Object:  Table [dbo].[PCClient]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[PCClient]
GO

/****** Object:  Table [dbo].[PCInstallLog]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[PCInstallLog]
GO

/****** Object:  Table [dbo].[PhoneModel]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[PhoneModel]
GO

/****** Object:  Table [dbo].[Picture]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[Picture]
GO

/****** Object:  Table [dbo].[Role]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[Role]
GO

/****** Object:  Table [dbo].[RunLog]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[RunLog]
GO

/****** Object:  Table [dbo].[Statistics]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[Statistics]
GO

/****** Object:  Table [dbo].[Tag]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[Tag]
GO

/****** Object:  Table [dbo].[User]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[User]
GO

/****** Object:  Table [dbo].[UserMobile]    Script Date: 2014/4/15 2:41:59 ******/
DROP TABLE [dbo].[UserMobile]
GO

/****** Object:  Table [dbo].[UserMobile]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[UserMobile](
	[PhoneModelID] [varchar](36) NOT NULL,
	[UserID] [varchar](36) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[User]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[User](
	[UserId] [varchar](36) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[LoginId] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RegTime] [datetime] NULL,
	[LastLoginTime] [datetime] NULL,
	[ErrorCount] [int] NULL,
	[IsValid] [bit] NULL,
	[UpdateTime] [datetime] NULL,
	[Mobile] [varchar](50) NULL,
	[Telephone] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Tag]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Tag](
	[TagID] [varchar](36) NOT NULL,
	[TagName] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Statistics]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Statistics](
	[StatisticsID] [varchar](36) NOT NULL,
	[Action] [int] NOT NULL,
	[UpdateTime] [datetime] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[RunLog]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RunLog](
	[RunLogID] [varchar](36) NOT NULL,
	[MobileAppID] [varchar](36) NULL,
	[Action] [int] NOT NULL,
	[UpdateTime] [datetime] NULL,
	[Message] [varchar](1000) NULL,
	[PackageName] [varchar](200) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[TotalTime] [bigint] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Role]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Role](
	[RoleID] [varchar](36) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](2000) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Picture]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Picture](
	[PictureID] [varchar](36) NOT NULL,
	[ApplicationID] [varchar](36) NULL,
	[Path] [varchar](200) NULL,
	[Size] [int] NULL,
	[Width] [int] NULL,
	[Height] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[PhoneModel]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PhoneModel](
	[PhoneModelID] [varchar](36) NOT NULL,
	[DriverID] [varchar](36) NULL,
	[BrandID] [varchar](36) NULL,
	[ModelName] [varchar](100) NOT NULL,
	[System] [varchar](50) NULL,
	[Version] [varchar](50) NULL,
	[PictureUrl] [varchar](200) NULL,
	[MemorySize] [varchar](50) NULL,
	[CPU] [varchar](50) NULL,
	[ScreenSize] [varchar](100) NULL,
	[Resolution] [varchar](50) NULL,
	[UpdateTime] [datetime] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[PCInstallLog]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PCInstallLog](
	[MobileClientID] [varchar](36) NOT NULL,
	[PCAppID] [varchar](36) NOT NULL,
	[UpdateTime] [datetime] NULL,
	[Message] [varchar](1000) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[PCClient]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PCClient](
	[PCClientID] [varchar](36) NOT NULL,
	[UserID] [varchar](36) NULL,
	[ClientName] [varchar](50) NULL,
	[ClientKey] [varchar](128) NULL,
	[ClientMac] [varchar](36) NULL,
	[Description] [varchar](2000) NULL,
	[UpdateTime] [datetime] NULL,
	[CreateTime] [datetime] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[PCApp]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PCApp](
	[PCAppID] [varchar](36) NOT NULL,
	[ApplicationID] [varchar](36) NOT NULL,
	[PCClientID] [varchar](36) NOT NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[InstallCount] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[MobileClient]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[MobileClient](
	[MobileClientID] [varchar](36) NOT NULL,
	[PhoneModelID] [varchar](36) NULL,
	[PCClientID] [varchar](36) NULL,
	[ClientName] [varchar](50) NULL,
	[ClientMac] [varchar](36) NULL,
	[ClientKey] [varchar](128) NULL,
	[Description] [varchar](2000) NULL,
	[UpdateTime] [datetime] NULL,
	[CreateTime] [datetime] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[MobileApplication]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[MobileApplication](
	[MobileApplicationID] [varchar](36) NOT NULL,
	[ApplicationID] [varchar](36) NULL,
	[ClientType] [int] NULL,
	[ClientID] [varchar](36) NULL,
	[UpdateTime] [datetime] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[MobileApp]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[MobileApp](
	[MobileAppID] [varchar](36) NOT NULL,
	[ApplicationID] [varchar](36) NOT NULL,
	[MobileClientID] [varchar](36) NOT NULL,
	[Installer] [varchar](36) NULL,
	[CreateTime] [datetime] NULL,
	[FirstTime] [datetime] NULL,
	[SecondTime] [datetime] NULL,
	[Totaltime] [bigint] NULL,
	[UpdateTime] [datetime] NULL,
	[AddTime] [datetime] NULL,
	[RemoveTime] [datetime] NULL,
	[PackageName] [varchar](50) NULL,
	[IsSync] [bit] NULL,
	[IsSys] [bit] NULL,
	[Frequency] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Mobile]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Mobile](
	[MobileID] [varchar](36) NOT NULL,
	[DriverID] [varchar](36) NULL,
	[MobileName] [varchar](100) NOT NULL,
	[Brand] [varchar](100) NULL,
	[Model] [varchar](50) NULL,
	[System] [varchar](50) NULL,
	[Version] [varchar](50) NULL,
	[PictureUrl] [varchar](200) NULL,
	[MemorySize] [varchar](50) NULL,
	[CPU] [varchar](50) NULL,
	[ScreenSize] [varchar](100) NULL,
	[Resolution] [varchar](50) NULL,
	[UpdateTime] [datetime] NULL,
	[PID] [varchar](256) NULL,
	[VID] [varchar](256) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Driver]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Driver](
	[DriverID] [varchar](36) NOT NULL,
	[DriverName] [varchar](200) NOT NULL,
	[DownloadUrl] [varchar](200) NOT NULL,
	[Version] [varchar](50) NULL,
	[UpdateTime] [datetime] NULL,
	[Description] [varchar](2000) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Category]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Category](
	[CategoryID] [varchar](36) NOT NULL,
	[AppTypeID] [int] NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
	[ParentID] [varchar](36) NULL,
	[Seq] [int] NULL,
	[ENName] [varchar](256) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Brand]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Brand](
	[BrandID] [varchar](36) NOT NULL,
	[BrandName] [varchar](50) NOT NULL,
	[BrandType] [int] NOT NULL,
	[Mobile] [varchar](50) NULL,
	[Telephone] [varchar](50) NULL,
	[Addr] [varchar](100) NULL,
	[Url] [varchar](200) NULL,
	[Linkman] [varchar](50) NULL,
	[Description] [varchar](2000) NULL,
	[UpdateTime] [datetime] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[AppUser]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AppUser](
	[AppUserID] [varchar](36) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[LoginID] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RegTime] [datetime] NULL,
	[LastLoginTime] [datetime] NULL,
	[ErrorCount] [int] NULL,
	[IsValid] [bit] NULL,
	[UpdateTime] [datetime] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[AppType]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AppType](
	[AppTypeID] [int] NOT NULL,
	[AppTypeName] [varchar](50) NULL,
	[Count] [int] NULL,
	[Description] [varchar](2000) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ApplicationTag]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ApplicationTag](
	[TagID] [varchar](36) NOT NULL,
	[ApplicationID] [varchar](36) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ApplicationEvaluate]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ApplicationEvaluate](
	[ApplicationEvaluateID] [char](10) NOT NULL,
	[UserID] [varchar](36) NULL,
	[ApplicationID] [varchar](36) NOT NULL,
	[Content] [char](10) NULL,
	[Score] [decimal](5, 2) NULL,
	[UpdateTime] [datetime] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Application]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Application](
	[ApplicationID] [varchar](36) NOT NULL,
	[CategoryID] [varchar](36) NOT NULL,
	[BrandID] [varchar](36) NULL,
	[AppType] [int] NOT NULL,
	[ApplicationName] [varchar](100) NOT NULL,
	[PictureUrl] [varchar](200) NULL,
	[Version] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
	[Description] [text] NULL,
	[OfficialWebsite] [varchar](200) NULL,
	[DownloadUrl] [varchar](200) NULL,
	[IsValid] [bit] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[Total] [int] NOT NULL,
	[IsRecommend] [bit] NOT NULL,
	[IsNecessary] [bit] NOT NULL,
	[Score] [decimal](5, 2) NOT NULL,
	[Checksum] [varchar](128) NULL,
	[PackageName] [varchar](256) NULL,
	[ApkInfo] [varchar](1000) NULL,
	[ServerPath] [varchar](256) NULL,
	[RelativePath] [varchar](256) NULL,
	[OSVersion] [varchar](36) NULL,
	[SDKVersion] [varchar](36) NULL,
	[Icon] [varchar](256) NULL,
	[Seq] [int] NULL,
	[CreateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[UserRole]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[UserRole](
	[UserRoleId] [varchar](36) NOT NULL,
	[UserId] [varchar](36) NOT NULL,
	[RoleId] [varchar](36) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ActionPermissionRole]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ActionPermissionRole](
	[ActionPermissionRoleId] [varchar](36) NOT NULL,
	[IsAllowed] [bit] NOT NULL,
	[RoleId] [varchar](36) NOT NULL,
	[ActionPermissionId] [varchar](36) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ActionPermission]    Script Date: 2014/4/15 2:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ActionPermission](
	[ActionPermissionId] [varchar](36) NOT NULL,
	[ParentId] [varchar](36) NULL,
	[Name] [varchar](100) NULL,
	[IsController] [bit] NOT NULL,
	[IsAllowedNoneRoles] [bit] NOT NULL,
	[IsAllowedAllRoles] [bit] NOT NULL,
	[ControlName] [varchar](50) NOT NULL,
	[ActionName] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
	[Permission] [int] NULL,
	[CreateTime] [datetime] NOT NULL,
	[IsAllowed] [bit] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


