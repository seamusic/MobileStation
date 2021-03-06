USE [appstore]
GO
/****** Object:  Table [dbo].[ActionPermission]    Script Date: 2014/5/31 1:26:22 ******/
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
	[IsAllowed] [bit] NOT NULL,
 CONSTRAINT [PK_ActionPermission] PRIMARY KEY CLUSTERED 
(
	[ActionPermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ActionPermissionRole]    Script Date: 2014/5/31 1:26:22 ******/
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
	[ActionPermissionId] [varchar](36) NOT NULL,
 CONSTRAINT [PK_ActionPermissionRole] PRIMARY KEY CLUSTERED 
(
	[ActionPermissionRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Application]    Script Date: 2014/5/31 1:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Application](
	[ApplicationID] [varchar](36) NOT NULL,
	[BrandID] [varchar](36) NULL,
	[AppType] [int] NOT NULL,
	[ApplicationName] [varchar](100) NOT NULL,
	[PictureUrl] [varchar](200) NULL,
	[Version] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
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
	[CreateTime] [datetime] NULL,
	[AutoDownload] [bit] NOT NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ApplicationCategory]    Script Date: 2014/5/31 1:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApplicationCategory](
	[Application_ApplicationID] [varchar](36) NOT NULL,
	[Category_CategoryID] [varchar](36) NOT NULL,
 CONSTRAINT [PK_ApplicationCategory] PRIMARY KEY CLUSTERED 
(
	[Application_ApplicationID] ASC,
	[Category_CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ApplicationEvaluate]    Script Date: 2014/5/31 1:26:22 ******/
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
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_ApplicationEvaluate] PRIMARY KEY CLUSTERED 
(
	[ApplicationEvaluateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ApplicationTag]    Script Date: 2014/5/31 1:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApplicationTag](
	[TagID] [varchar](36) NOT NULL,
	[ApplicationID] [varchar](36) NOT NULL,
 CONSTRAINT [PK_ApplicationTag] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC,
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppType]    Script Date: 2014/5/31 1:26:22 ******/
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
	[Description] [varchar](2000) NULL,
 CONSTRAINT [PK_AppType] PRIMARY KEY CLUSTERED 
(
	[AppTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppUser]    Script Date: 2014/5/31 1:26:22 ******/
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
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_AppUser] PRIMARY KEY CLUSTERED 
(
	[AppUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 2014/5/31 1:26:22 ******/
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
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2014/5/31 1:26:22 ******/
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
	[ENName] [varchar](256) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 2014/5/31 1:26:22 ******/
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
	[Description] [varchar](2000) NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mobile]    Script Date: 2014/5/31 1:26:22 ******/
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
	[VID] [varchar](256) NULL,
 CONSTRAINT [PK_Mobile] PRIMARY KEY CLUSTERED 
(
	[MobileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MobileApp]    Script Date: 2014/5/31 1:26:22 ******/
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
	[Frequency] [int] NULL,
 CONSTRAINT [PK_MobileApp] PRIMARY KEY CLUSTERED 
(
	[MobileAppID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MobileApplication]    Script Date: 2014/5/31 1:26:22 ******/
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
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_MobileApplication] PRIMARY KEY CLUSTERED 
(
	[MobileApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MobileClient]    Script Date: 2014/5/31 1:26:22 ******/
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
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_MobileClient] PRIMARY KEY CLUSTERED 
(
	[MobileClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCApp]    Script Date: 2014/5/31 1:26:22 ******/
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
	[InstallCount] [int] NULL,
 CONSTRAINT [PK_PCApp] PRIMARY KEY CLUSTERED 
(
	[PCAppID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCClient]    Script Date: 2014/5/31 1:26:22 ******/
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
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_PCClient] PRIMARY KEY CLUSTERED 
(
	[PCClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCInstallLog]    Script Date: 2014/5/31 1:26:22 ******/
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
	[Message] [varchar](1000) NULL,
 CONSTRAINT [PK_PCInstallLog] PRIMARY KEY CLUSTERED 
(
	[MobileClientID] ASC,
	[PCAppID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhoneModel]    Script Date: 2014/5/31 1:26:22 ******/
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
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_PhoneModel] PRIMARY KEY CLUSTERED 
(
	[PhoneModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Picture]    Script Date: 2014/5/31 1:26:22 ******/
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
	[Height] [int] NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[PictureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2014/5/31 1:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [varchar](36) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](2000) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RunLog]    Script Date: 2014/5/31 1:26:22 ******/
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
	[TotalTime] [bigint] NULL,
 CONSTRAINT [PK_RunLog] PRIMARY KEY CLUSTERED 
(
	[RunLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Statistics]    Script Date: 2014/5/31 1:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Statistics](
	[StatisticsID] [varchar](36) NOT NULL,
	[Action] [int] NOT NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_Statistics] PRIMARY KEY CLUSTERED 
(
	[StatisticsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 2014/5/31 1:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tag](
	[TagID] [varchar](36) NOT NULL,
	[TagName] [varchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 2014/5/31 1:26:22 ******/
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
	[Telephone] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserMobile]    Script Date: 2014/5/31 1:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserMobile](
	[PhoneModelID] [varchar](36) NOT NULL,
	[UserID] [varchar](36) NOT NULL,
 CONSTRAINT [PK_UserMobile] PRIMARY KEY CLUSTERED 
(
	[PhoneModelID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2014/5/31 1:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleId] [varchar](36) NOT NULL,
	[UserId] [varchar](36) NOT NULL,
	[RoleId] [varchar](36) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'12182d2e-8943-4cd4-bd8d-64ba975d8a8c', NULL, NULL, 0, 0, 0, N'System', N'UserEdit', N'用户查看', 0, CAST(0x0000A30C005F417D AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'1a6f2c0b-87c0-4b0c-b175-1a01383d6312', NULL, NULL, 0, 0, 0, N'Application', N'CategoryList', N'应用列表', 0, CAST(0x0000A30C005F4178 AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'24cb3e43-c325-4d10-868a-62c418d9e0d9', NULL, NULL, 0, 0, 0, N'System', N'Driver', N'驱动编辑', 0, CAST(0x0000A30C005F417C AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'25641dac-6ff6-4aff-9130-d7468e809b14', NULL, NULL, 0, 0, 0, N'System', N'BrandEdit', N'品牌查看', 0, CAST(0x0000A30C005F417C AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'2ad8e6cf-085d-4115-a40a-1dc2f0205289', NULL, NULL, 0, 0, 0, N'Statistics', N'Stores', N'装机店统计', 0, CAST(0x0000A30C005F4179 AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'2c926588-8edf-4708-9f37-3fe07e9a8466', NULL, NULL, 0, 0, 0, N'Application', N'Index', N'应用管理首页', 0, CAST(0x0000A30C005F4161 AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'35a33510-2115-404a-8daa-8e0cb5d1172a', NULL, NULL, 0, 0, 0, N'System', N'PCClientEdit', N'装机店编辑', 0, CAST(0x0000A30C005F417F AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'38c9553e-0cc3-49a1-89dd-af0d4ba462e1', NULL, NULL, 0, 0, 0, N'Statistics', N'StoreDetail', N'装机店明细', 0, CAST(0x0000A30C005F4179 AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'49e44604-8ec1-430f-a2d2-8e870eaba4d1', NULL, NULL, 0, 0, 0, N'System', N'MobileClientList', N'手机端列表', 0, CAST(0x0000A30C005F417F AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'4ec9a13f-8a77-4f3f-a96a-83e6f9e9a4b6', NULL, NULL, 0, 0, 0, N'Statistics', N'Clients', N'手机端统计', 0, CAST(0x0000A30C005F417A AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'51e104dd-38b9-4668-a953-4c1b2403b400', NULL, NULL, 0, 0, 0, N'System', N'MobileClientEdit', N'手机端编辑', 0, CAST(0x0000A30C005F4180 AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'630c37e5-d536-4efc-96e2-a4c2f82e33ba', NULL, NULL, 0, 0, 0, N'Statistics', N'Apps', N'应用统计', 0, CAST(0x0000A30C005F417A AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'6dd2fb37-7fa0-44d4-a4cf-0db3778a31c0', NULL, NULL, 0, 0, 0, N'System', N'MobileClientEdit', N'手机端查看', 0, CAST(0x0000A30C005F4180 AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'72302591-a6f4-4992-a9da-83d1f556264d', NULL, NULL, 0, 0, 0, N'System', N'Driver', N'驱动查看', 0, CAST(0x0000A30C005F417C AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'74a6ca3b-56a4-4d53-8cc4-e0591d7086f7', NULL, NULL, 0, 0, 0, N'System', N'BrandEdit', N'品牌编辑', 0, CAST(0x0000A30C005F417D AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'769b8e84-6321-48ae-b4e0-8adf4a013e9a', NULL, NULL, 0, 0, 0, N'Application', N'CategoryEdit', N'编辑应用分类', 0, CAST(0x0000A30C005F4179 AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'7f9215d9-79ce-4f68-aa17-2b6339cfd24e', NULL, NULL, 0, 0, 0, N'System', N'PCClientList', N'装机店列表', 0, CAST(0x0000A30C005F417E AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'8da95c38-e25c-4f17-ad3b-b45bbd0e5225', NULL, NULL, 0, 0, 0, N'Statistics', N'Index', N'统计首页', 0, CAST(0x0000A30C005F4179 AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'9cf5d620-41af-429c-bc7a-3e1ccd6a7ed2', NULL, NULL, 0, 0, 0, N'System', N'UserList', N'用户列表', 0, CAST(0x0000A30C005F417E AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'9d3595e6-48cf-4da3-a5db-9e17a6f2ef8e', NULL, NULL, 0, 0, 0, N'Application', N'ApplicationEdit', N'编辑应用', 0, CAST(0x0000A30C005F4179 AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'a0e05e00-338c-460a-a76d-8d90fe8b047e', NULL, NULL, 0, 0, 0, N'Application', N'CategoryEdit', N'查看应用分类', 0, CAST(0x0000A30C005F4179 AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'a1500cf5-8d97-4ca0-96d1-c72f330b959c', NULL, NULL, 0, 0, 0, N'Application', N'ApplicationEdit', N'查看应用', 0, CAST(0x0000A30C005F4179 AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'a57fb14a-0599-4709-90e3-0c882d0bbcea', NULL, NULL, 0, 0, 0, N'System', N'PCClientEdit', N'装机店查看', 0, CAST(0x0000A30C005F417F AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'a8319b2a-4dd6-4808-92f4-8dfb56e93503', NULL, NULL, 0, 0, 0, N'Home', N'Index', N'后台管理首页', 0, CAST(0x0000A30C005F4179 AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'a961e7a3-301c-473e-a367-331bb34c219f', NULL, NULL, 0, 0, 0, N'System', N'BrandList', N'品牌列表', 0, CAST(0x0000A30C005F417C AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'acb3f2e7-3499-4587-89f2-e93ceedbc096', NULL, NULL, 0, 0, 0, N'System', N'UserEdit', N'用户编辑', 0, CAST(0x0000A30C005F417E AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'b109676f-cb58-47b4-b82f-93dd6d52344c', NULL, NULL, 0, 0, 0, N'System', N'DriverList', N'驱动列表', 0, CAST(0x0000A30C005F417C AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'b760175f-ad32-419e-84f8-21336d2be82a', NULL, NULL, 0, 0, 0, N'System', N'Mobile', N'手机查看', 0, CAST(0x0000A30C005F417B AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'd96f5d41-ad1f-469a-8537-5e145d3c7715', NULL, NULL, 0, 0, 0, N'System', N'MobileList', N'手机列表', 0, CAST(0x0000A30C005F417B AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'edacfbaa-020f-4275-b97d-758e1eb8409b', NULL, NULL, 0, 0, 0, N'Statistics', N'ClientDetail', N'手机端明细', 0, CAST(0x0000A30C005F417A AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'f013cfd5-283f-49f1-8a1f-1fccb354f663', NULL, NULL, 0, 0, 0, N'System', N'Mobile', N'手机修改', 0, CAST(0x0000A30C005F417B AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'f4ec0058-ffbb-47d7-9264-57bac83e7e5a', NULL, NULL, 0, 0, 0, N'System', N'Index', N'系统管理首页', 0, CAST(0x0000A30C005F417A AS DateTime), 1)
INSERT [dbo].[ActionPermission] ([ActionPermissionId], [ParentId], [Name], [IsController], [IsAllowedNoneRoles], [IsAllowedAllRoles], [ControlName], [ActionName], [Description], [Permission], [CreateTime], [IsAllowed]) VALUES (N'fb97e961-d4cb-4695-917f-e20e912e5366', NULL, NULL, 0, 0, 0, N'Statistics', N'AppDetail', N'应用统计明细', 0, CAST(0x0000A30C005F417A AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'0e8d67cf-079a-4916-8429-41570c45f69d', NULL, 1, N'网易新闻', N'androids/com.netease.newsreader.activity/20140528222747.jpg', N'3.9.0', N'38295', N'<span style="color:#555555;font-family:Arial;line-height:25px;">网易新闻客户端与您一起关注世事最新动态！</span><br />
<br />
<span style="color:#555555;font-family:Arial;line-height:25px;">网易新闻客户端是中文资讯领军者，因新闻最快速、评论最犀利、体验最流畅而备受推崇，目前用户数超2亿，日均活跃用户超5000万。</span><br />
<br />
<span style="color:#555555;font-family:Arial;line-height:25px;">网易新闻客户端提供极具特色的新闻阅读收听、积分商城、精品订阅、跟贴盖楼、本地服务、话题投票、要闻推送、离线阅读、流量提醒等功能，充分满足网友多种资讯需求。其中，“每日轻松一刻”作为王牌定制栏目，拥有众多粉丝；“无跟帖，不新闻”，“跟贴盖楼”已成为网易新闻最具特色的文化。</span><br />
<br />
<span style="color:#555555;font-family:Arial;line-height:25px;">唤醒洞悉世界的双眼---</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">明媚清晨或是午间餐桌，新鲜资讯皆一手掌控，网易新闻为你推送每一个世界聚焦的瞬间。</span><br />
<br />
<span style="color:#555555;font-family:Arial;line-height:25px;">有态度更要敢表达---</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">新闻讲述世间冷暖，跟贴表达内心态度。汇聚亿万网友智慧的跟贴文化，只在网易呈现。</span><br />
<br />
<span style="color:#555555;font-family:Arial;line-height:25px;">因为懂你所以喜欢---</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">网易新闻是你获取所有资讯的最佳选择。不仅有千万内容供你订阅，更有智能推荐懂你口味。</span><br />
<br />
<span style="color:#555555;font-family:Arial;line-height:25px;">捞尽不经意的惊喜---</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">看新闻更能赢大奖！网易积分商城豪掷千金回馈亿万用户，丰富兑换好礼，尽享时尚生活。</span>', NULL, N'Androids/com.netease.newsreader.activity/android_3.9.0.apk', 1, CAST(0x0000A33901726179 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.netease.newsreader.activity', N'[object Object]', NULL, N'Androids/com.netease.newsreader.activity/android_3.9.0.apk', N'2.3.3', N'9', N'androids/com.netease.newsreader.activity/20140528222739.png', NULL, CAST(0x0000A33901726179 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'1398ab8e-d6d2-4bbf-ba30-e90192640e8e', NULL, 1, N'QQ空间', N'androids/20131225023726.jpg', N'4.2.3.103', N'14641486', N'qq', NULL, N'Androids/com.qzone/android_4.2.3.103.apk', 1, CAST(0x0000A29F002B4F4C AS DateTime), 1, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.qzone', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.qzone\android_4.2.3.103.apk', N'Androids/com.qzone/android_4.2.3.103.apk', NULL, NULL, N'androids/20131225023705.png', 9, CAST(0x0000A29F002B4F4C AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'24c0d51a-afbd-4cbe-b2cb-d4ea1e8e1695', NULL, 1, N'优酷', NULL, N'3.8.2', N'600349', N'0', NULL, N'Androids/com.youku.phone/android_3.8.2.apk', 1, CAST(0x0000A33801810B05 AS DateTime), 0, 1, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.youku.phone', N'[object Object]', NULL, N'Androids/com.youku.phone/android_3.8.2.apk', N'2.2', N'8', N'androids/com.youku.phone/20140527232133.png', NULL, CAST(0x0000A33801810B05 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'278F4841-5E47-4B5E-A3A1-2BFCFA411FA0', NULL, 1, N'QQ', N'androids/com.tencent.mobileqq/20131224100605.jpg', N'4.5.2', N'28608733', N'<span style="color:#555555;">手机QQ是由腾讯公司打造的移动互联网应用,提供免费的多媒体沟通服务,方便用户在移动设备上通过语音,图片,视频等方式轻松交流.手机QQ,只想与你更接近.&nbsp;</span>', NULL, NULL, 1, CAST(0x0000A29E00A67E66 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.tencent.mobileqq', NULL, N'D:\Projects\PartTime\应用商城\src\AppStore\AppStore.Manage\Content\UploadFile\Androids\com.tencent.mobileqq\android_4.5.2.apk', N'Androids/com.tencent.mobileqq/android_4.5.2.apk', NULL, NULL, N'androids/com.tencent.mobileqq/20131224100547.png', 4, CAST(0x0000A29E00A67E66 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'354bd717-4fc9-4672-b671-c31969a58295', NULL, 1, N'人人网', N'androids/com.renren.mobile.android/20140528222125.png', N'7.5.3', N'832399', N'<span style="color:#555555;font-family:Arial;line-height:25px;">2005-2014&nbsp;你的校园一直在这儿。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">中国最大的实名制SNS网络平台，大学生必备网络社交应用。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">-------我们好像在哪儿见过-------</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">?&nbsp;&nbsp;&nbsp;&nbsp;早春发芽，我在人人通过姓名，学校，找到了从小到大的同学，并加入了校园新圈子</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">?&nbsp;&nbsp;&nbsp;&nbsp;花开半夏，在新鲜事里和好友分享彼此的生活点滴，我们渺小如星辰，却真实存在着</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">?&nbsp;&nbsp;&nbsp;&nbsp;花花世界，这里的人貌似不疯不成活，蛇精病短视频、激萌语音照片，芝麻烂谷飚日志</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">?&nbsp;&nbsp;&nbsp;&nbsp;一叶知秋，喜欢上了每天看人人话题、看世界，公共主页、我知道这个世界有多大我们就得担负多大。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">?&nbsp;&nbsp;&nbsp;&nbsp;漫天雪花：不知什么时候，习惯上了回顾过去，三千前，五年前，我们无知无畏，无所不能，每个样子，都好像在哪儿见过。</span><br />
<br />
<span style="color:#555555;font-family:Arial;line-height:25px;">【版本7.5.3中的更新】</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">-校园广场：好友匿名爆料，酷炫好玩的掌上校园。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">-短视频二期：本地上传，智能转换，精彩时刻想发就发。</span>', NULL, N'Androids/com.renren.mobile.android/android_7.5.3.apk', 1, CAST(0x0000A339017091E2 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.renren.mobile.android', N'[object Object]', NULL, N'Androids/com.renren.mobile.android/android_7.5.3.apk', N'2.3.3', N'9', N'androids/com.renren.mobile.android/20140528222112.png', NULL, CAST(0x0000A339017091E2 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'3ac1c259-6962-4a22-859d-3f744d9c9733', NULL, 1, N'金山电池医生', N'androids/com.ijinshan.kbatterydoctor/20140528221607.jpg', N'4.9.1', N'412094', N'<span style="color:#555555;font-family:Arial;line-height:25px;">金山电池医生，可延长手机1倍待机时间。专业充电，智能省电，精准预测可用时间，超过一亿安卓手机用户使用。</span><br />
<br />
<span style="color:#555555;font-family:Arial;line-height:25px;">主要功能：</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">1.&nbsp;耗电评分，权威全球首发，数十项标准，涵盖手机硬件系统、用户使用习惯、应用耗电性能等，手机耗电一目了然。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">2.&nbsp;省电，只需一键关闭耗电应用、优化硬件设置、深度省电，只需一键。更多省电功能、省电秘籍，让省电更全面。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">3.&nbsp;专业充电，酷炫专业的三段式充电，支持随用随充，电量更饱满，待机更持久。酷炫充电屏保，充电不再枯燥。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">4.&nbsp;可用时间预测，精准基于千万用户海量数据分析，结合当前用户手机使用习惯，自学习的可用时间预测模型，越用越精准。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">5.&nbsp;智能省电，效果看得见快速省电、超级省电、模式切换、低电量提醒、内存清理，全方位智能省电，让爱机更持久。</span>', NULL, N'Androids/com.ijinshan.kbatterydoctor/android_4.9.1.apk', 1, CAST(0x0000A339016F02B0 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.ijinshan.kbatterydoctor', N'[object Object]', NULL, N'Androids/com.ijinshan.kbatterydoctor/android_4.9.1.apk', NULL, N'7', N'androids/com.ijinshan.kbatterydoctor/20140528221559.png', NULL, CAST(0x0000A339016F02B0 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'3f9c9236-da36-44ad-8d7d-5b1957137d99', NULL, 1, N'搜狐視頻', N'androids/com.sohu.sohuvideo/20140528221352.jpg', N'4.1', N'831572', N'<span style="color:#555555;font-family:Arial;line-height:25px;">搜狐视频——随时随地，搜狐有戏！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">你造吗？搜狐视频是中国最全美剧播放平台！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">你造吗？搜狐视频是中国最快综艺播放平台！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">你造吗？搜狐视频是中国最强动漫播放平台！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">海量剧集，热门独播，超清视觉体验，还有给力的烫手娱乐资讯！不论是#周一见#还是#上头条#，搜狐视频都会第一时间为您送出！在线看，离线看，怎么看都极速！美剧，韩剧，日剧，综艺，动漫，统统都有独家版权！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">【本期热播剧】&nbsp;</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">独家大剧：《步步惊情》《纸牌屋2》</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">美剧：《生活大爆炸第7季》《汉尼拔第二季》《蛇蝎女佣2》</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">韩剧：《密会》《山蒜酱汤：12年后的重逢》</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">日剧：《孤独的美食家》《麻辣教师》</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">电视：《金玉良缘》《宫锁连城》</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">动漫：《海贼王》《妖精的尾巴》《全职猎人》</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">综艺：《舌尖上的中国2》《艾伦秀》</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">自制：《隐秘而伟大》《刷兵男的搞笑剧场》《屌丝男士》</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">【软件特点】&nbsp;</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">全网搜索：聚合优土、爱奇艺、乐视、腾讯、PPTV、PPS等视频资源！&nbsp;</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">后台下载：遍布全国CDN网络，确保下载速度畅通！支持锁屏及后台下载，不限制下载视频数量！&nbsp;</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">原画画质：720P画质超清体验！&nbsp;</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">终极杀招：海量独播内容，涵盖电视、美剧、动漫、综艺等！&nbsp;</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">多屏互动：支持Apple&nbsp;TV、安卓盒子的AirPlay、DLNA协议，实现多屏互动！&nbsp;</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">浮窗播放：视频窗口漂浮于手机桌面，看视频发短信两不误！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">硬解播放器：国内首家硬解播放器，画面高清且省电！&nbsp;</span>', NULL, N'Androids/com.sohu.sohuvideo/android_4.1.apk', 1, CAST(0x0000A339016E62F9 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.sohu.sohuvideo', N'[object Object]', NULL, N'Androids/com.sohu.sohuvideo/android_4.1.apk', NULL, N'5', N'androids/com.sohu.sohuvideo/20140528221343.png', NULL, CAST(0x0000A339016E62F9 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'4657e5c8-ce93-406b-a3d9-1e4f941cdd2f', NULL, 2, N'关灯', N'androids/20131225022039.jpg', N'1.2.89', N'1444149', N'<span style="color:#555555;font-family:Arial;line-height:25px;">中国最大的手机游戏平台，让您尽享指尖上的快乐！</span>', NULL, N'Androids/com.czy.guandeng/android_1.2.89.apk', 1, CAST(0x0000A29F0026B70C AS DateTime), 0, 1, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.czy.guandeng', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.czy.guandeng\android_1.2.89.apk', N'Androids/com.czy.guandeng/android_1.2.89.apk', NULL, NULL, N'androids/20131225022029.png', 9, CAST(0x0000A29F0026B70C AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'4acae024-6791-4ab6-ac50-f633b4202d20', NULL, 3, N'百度地图', N'androids/20131225024231.JPG', N'6.5.1', N'13508674', N'<span style="color:#555555;font-family:Arial;line-height:25px;">用百度地图，快速定位你的位置，探索周边美食娱乐。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">不但可以找位置，还能帮你“到那去“，公交、驾车、步行三种出行方式任你选择，还有蚯蚓路线、免费语音导航、时间胶囊让你出行无忧</span>', NULL, N'Androids/com.baidu.BaiduMap/android_6.5.1.apk', 1, CAST(0x0000A29F002CC419 AS DateTime), 2, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.baidu.BaiduMap', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.baidu.BaiduMap\android_6.5.1.apk', N'Androids/com.baidu.BaiduMap/android_6.5.1.apk', NULL, NULL, N'androids/20131225024041.png', 6, CAST(0x0000A29F002CC419 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'4D0CB6EC-9671-42CD-B532-BF723EB08CCA', NULL, 1, N'微信', N'androids/com.zecurisoft.mhc1202/20131225015931.jpg', N'2.3.196', N'650766', N'<div class="font16 soft_pad_f" style="margin:0px;padding:20px 0px 10px;font-size:16px;color:#333333;font-family:微软雅黑;">
	软件介绍
</div>
<div class="font12 soft_introbox autoHeight" style="margin:0px;padding:0px;color:#555555;font-family:Arial;">
	<div id="soft_introduce" style="margin:0px;padding:0px;">
		应用介绍：<br />
1.可以发语音、文字消息、表情、图片、视频。30M流量可以收发上千条语音，省电省流量。<br />
2.朋友圈，跟朋友们分享生活点滴。<br />
3.摇一摇、查看附近的人，世界不再有陌生人。<br />
4.扫一扫，可以扫商品条码、图书封面、CD封面，甚至扫描英文单词来翻译成中文。<br />
5.公众帐号，用微信关注明星、看新闻、设提醒…<br />
6.游戏中心，和朋友们一起玩游戏。<br />
7.表情商店，有趣好玩的表情在这里。<br />
特别说明：微信只消耗网络流量，不产生短信电话费用。&nbsp;
	</div>
</div>', NULL, NULL, 1, CAST(0x0000A29F002109AA AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.zecurisoft.mhc1202', N'[object Object]', NULL, NULL, NULL, NULL, N'androids/com.zecurisoft.mhc1202/20131224103112.png', 6, CAST(0x0000A29F002109AA AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'4e24970f-32a4-4075-99f9-914f41dde52a', NULL, 1, N'搜狗输入法', N'androids/20131225022848.jpg', N'5.2', N'11958385', N'<span style="color:#555555;font-family:Arial;line-height:25px;">搜狗手机输入法以提升用户体验为宗旨，致力于为亿万手机用户提供手机端最智能、最易用的输入法产品。拥有40万超大词库、算法智能、首选率高、响应速度快等优秀基础品质。搜狗工具箱新增多项扩展功能，全方位拓展输入内容。同时，支持整句输入、英文候选、智能云输入、多媒体输入、二维码识别、表情输入等众多特色功能；且兼容PC皮肤，电脑有多炫，手机就有多炫！完美兼容不同手机及PAD型号。手机输入，依然搜狗！</span>', NULL, N'Androids/com.sohu.inputmethod.sogou/android_5.2.apk', 1, CAST(0x0000A29F0028FC0A AS DateTime), 0, 0, 1, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.sohu.inputmethod.sogou', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.sohu.inputmethod.sogou\android_5.2.apk', N'Androids/com.sohu.inputmethod.sogou/android_5.2.apk', NULL, NULL, N'androids/20131225022834.png', 8, CAST(0x0000A29F0028FC0A AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'4EB67F60-376F-458D-B337-1BDBF7041421', NULL, 1, N'日程记事本', N'androids/20131225020403.jpg', N'1.1', N'1976810', N'<span style="color:#555555;font-family:Arial;line-height:25px;">又是一年圣诞节，你有没有收到心仪的礼物？小虾米为你精心准备的圣诞大礼－全新的虾米音乐2014版诚邀下载体验啦！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">&nbsp;</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">这一年来，虾米始终秉承着对音乐的高品质追求,期望以此满足最亲爱的你能遇见更多的好音乐。</span><br />', N'dsf', NULL, 1, CAST(0x0000A29F00225528 AS DateTime), 3, 1, 1, CAST(5.00 AS Decimal(5, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'androids/20131225020351.png', 7, CAST(0x0000A29F00225528 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'6338B9D6-CA94-41E3-8AEA-365AE595F772', NULL, 1, N'DGT GTD', NULL, N'0.0.78', N'1766028', N'cc', NULL, N'Androids/com.dg.gtd.android.lite/android_0.0.78.apk', 1, CAST(0x0000A298000DBDC1 AS DateTime), 0, 1, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.dg.gtd.android.lite', NULL, N'D:\Projects\Parttime\应用商城\src\AppStore\AppStore.Manage\Content\UploadFile\Androids\com.dg.gtd.android.lite\android_0.0.78.apk', N'Androids/com.dg.gtd.android.lite/android_0.0.78.apk', NULL, NULL, NULL, 3, CAST(0x0000A298000DBDC1 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'643f9b7d-5fa9-48ee-926a-70301840e7df', NULL, 1, N'Youni有你', N'androids/com.snda.youni/20140528003856.jpg', N'4.6.7.2', N'552623', N'<span style="color:#555555;">Youni&nbsp;有你是一款创新的手机社交app应用，Youni让每个用户的手机号码成为短信、即时通信、社交和移动支付的唯一账号标识，安全的账户体系可以让你便捷地实现免费实时转账，独特的“打赏”文化让你在Youni社交圈体验到无处不在的“领赏“的乐趣和“打赏”的豪气，标志性的“大王有赏”声音绝对让你过耳不忘也让你身边的人对你刮目相看，便捷的发帖、分享和“打赏”文化完美融合让文字、图片不再无聊、枯燥，&nbsp;想成为像“都教授“一样的星星人类吗？想和其他一亿youni用户一起分享“领赏和打赏“的快乐吗？&nbsp;快来Youni吧，不一样社交体验就在Youni！</span><br />
<br />
<span style="color:#555555;">【分享有赏】分享还能领赏金，随时随地来赚钱</span><br />
<span style="color:#555555;">【打赏】社交圈里玩打赏，让懂你的人用“薪”赏你</span><br />
<span style="color:#555555;">Youni钱包：便捷、安全的小额支付电子钱包&nbsp;</span><br />
<span style="color:#555555;">【便捷收钱】拥有手机号即可像收消息一样轻松收钱&nbsp;</span><br />
<span style="color:#555555;">【便捷发钱】知道对方手机号即可像发消息一样轻松发钱&nbsp;</span><br />
<span style="color:#555555;">【便捷存钱】绑定好银行卡后即可像存消息一样轻松存钱&nbsp;</span><br />
<span style="color:#555555;">【便捷表达】数款创意钞票让收钱发钱的同时也可以传情达意&nbsp;</span><br />
<span style="color:#555555;">Youni聊天：好玩、好用的聊天工具</span><br />
<span style="color:#555555;">【智能切换】普通短信和免费消息无缝结合，没有网络照样收发消息</span><br />
<span style="color:#555555;">【网页版】坐在电脑面前发短信，畅快打字</span><br />
<br />
<span style="color:#555555;">主页：y.sdo.com</span><br />
<span style="color:#555555;">邮箱：youni@sdo-service.com</span><br />
<span style="color:#555555;">24小时客服热线：4008882211；未开通400地区或海外用户请拨&nbsp;+86-21-51942756</span><br />
<span style="color:#555555;">友情提示：</span><br />
<span style="color:#555555;">1、如果您无法更新版本，请尝试卸载原版本，再安装新版本。</span><br />
<span style="color:#555555;">2、建议您使用wifi网络或运营商提供的流量套餐。</span><br />
<span style="color:#555555;">3、普通短信费用以运营商资费标准为准，由运营商收取。</span><br />
<span style="color:#555555;">4、适用于android2.3及以上系统。</span>', NULL, N'Androids/com.snda.youni/android_4.6.7.2.apk', 1, CAST(0x0000A339000AE451 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.snda.youni', N'[object Object]', NULL, N'Androids/com.snda.youni/android_4.6.7.2.apk', N'2.2', N'8', N'androids/com.snda.youni/20140528003845.png', NULL, CAST(0x0000A339000AE451 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'6812e5a2-18e9-4347-9993-0e6602c11186', NULL, 2, N'挖宝精英', N'androids/com.xygame.wbjy/20140528224823.jpg', N'2.3', N'173416', N'<span style="color:#555555;font-family:Arial;line-height:25px;"><span style="color:#555555;font-family:Arial;line-height:25px;">&nbsp;《挖宝精英》是继承了经典三消玩法，采用了探险的题材和欧美FLASH画风相结合研发成创新型的宝石类消除游戏。游戏玩点以闯关形式制作，共4大地图96小关。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">亮点是每关的星级荣誉追求外还会收集丰富神秘的宝藏。共32个独特设计的宝物。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">游戏内采用新粒子技术制作酷炫的爆破效果与配合立体的音乐。让玩家体验消除游戏中另外一番别致爽快的感觉。</span></span>', NULL, N'Androids/com.xygame.wbjy/android_2.3.apk', 1, CAST(0x0000A3390177EE7F AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.xygame.wbjy', N'[object Object]', NULL, N'Androids/com.xygame.wbjy/android_2.3.apk', N'2.2', N'8', N'androids/com.xygame.wbjy/20140528224802.png', NULL, CAST(0x0000A3390177EE7F AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'76ADBC47-A689-4369-A4B0-27EEA3AE3F8F', NULL, 1, N'DGT', NULL, N'0.0.78', N'1766028', N'564165494546549846546546', NULL, N'Androids/com.dg.gtd.android.lite/android_0.0.78.apk', 1, CAST(0x0000A28E00EB5AAF AS DateTime), 0, 0, 1, CAST(5.00 AS Decimal(5, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(0x0000A28E00EB5AAF AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'77a35746-a816-473b-a988-e3f740733322', NULL, 1, N'支付宝钱包', N'androids/20140528221808.jpg', N'8.1.0.043001', N'251075', N'<span style="color:#555555;font-family:Arial;line-height:25px;">一分钱领五元红包！即日起至5月31日，支付宝未绑定银行卡且未快捷支付过的用户登录支付宝钱包，即可参加支付1分钱绑卡得5元通用红包活动；</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">红包使用说明：5元通用红包，单笔订单金额大于红包金额时才可使用该红包。红包支持淘宝天猫购物。使用有效期为领取红包之日起30天内。</span><br />
<br />
<br />
<br />
<br />
<span style="color:#555555;font-family:Arial;line-height:25px;">【主要功能】</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">1、支持余额宝，理财收益随时查看；</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">2、随时随地查询淘宝账单、账户余额、物流信息；</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">3、免费异地跨行转账，信用卡还款、充值、缴水电煤气费；</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">4、还信用卡、付款、缴费、充话费、卡券信息智能提醒；</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">5、提供众多银行和品牌商家的精品服务；</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">6、AA收款，让聚会吃饭更省心；</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">7、开放平台，支持精品应用一键安全登录；</span>', NULL, N'Androids/com.eg.android.AlipayGphone/android_8.1.0.043001.apk', 1, CAST(0x0000A339016FCE11 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.eg.android.AlipayGphone', N'[object Object]', NULL, N'Androids/com.eg.android.AlipayGphone/android_8.1.0.043001.apk', N'2.3.3', N'9', N'androids/com.eg.android.AlipayGphone/20140528221841.png', NULL, CAST(0x0000A339016FCE11 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'80857fe1-0c36-4eee-ab4b-820d729b7f45', NULL, 1, N'老虎地图', N'androids/com.tigerknows/20140528223009.jpg', N'5.8.3.20140516A', N'885251', N'<span style="color:#555555;font-family:Arial;line-height:25px;">更快、更准、更省，用户满意度最高的手机地图！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">更快——运行快，定位快，地图快！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">更准——定位准，数据准，公交准！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">更省——省流量，省电量，省内存！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">更全——生活信息全，酒店、团购、优惠全覆盖！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">更干净——不后台运行，不读用户隐私，做绿色安全的地图！</span>', NULL, N'Androids/com.tigerknows/android_5.8.3.20140516A.apk', 1, CAST(0x0000A3390172E8D6 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.tigerknows', N'[object Object]', NULL, N'Androids/com.tigerknows/android_5.8.3.20140516A.apk', NULL, N'5', N'androids/com.tigerknows/20140528222958.png', NULL, CAST(0x0000A3390172E8D6 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'831d3a29-1098-4cc5-904f-5164799d7b68', NULL, 1, N'淘寶', N'androids/com.taobao.taobao/20140528000327.jpg', N'4.2.2', N'522921', N'<span style="color:#555555;">淘宝客户端：阿里巴巴集团旗下淘宝官方应用（http://m.taobao.com）</span><br />
<span style="color:#555555;">淘宝网数十亿优质商品，任你筛选；</span><br />
<span style="color:#555555;">优惠活动“全年无休”，海量精品折扣，帮助您聪明淘宝，愉快购物；</span><br />
<span style="color:#555555;">新版优化的产品功能，购物浏览更便捷，支付体验更顺畅。</span>', NULL, N'Androids/com.taobao.taobao/android_4.2.2.apk', 1, CAST(0x0000A339000105C3 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.taobao.taobao', N'[object Object]', NULL, N'Androids/com.taobao.taobao/android_4.2.2.apk', N'2.3.3', N'9', N'androids/com.taobao.taobao/20140528000319.png', NULL, CAST(0x0000A339000105C3 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'834a983e-e239-49ec-815a-6ad6a3ff06e8', NULL, 1, N'手机管家', N'androids/com.tencent.qqpimsecure/20140527233053.jpg', N'4.8.0', N'489851', N'0', NULL, N'Androids/com.tencent.qqpimsecure/android_4.8.0.apk', 1, CAST(0x0000A33801839061 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.tencent.qqpimsecure', N'[object Object]', NULL, N'Androids/com.tencent.qqpimsecure/android_4.8.0.apk', NULL, N'7', N'androids/com.tencent.qqpimsecure/20140527233040.png', NULL, CAST(0x0000A33801838FCC AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'94ebdd4b-cca4-4a36-9557-a85aee42ee66', NULL, 3, N'讯飞输入法手机版', N'androids/20131225023333.jpg', N'4.0.1456', N'6972559', N'<span style="color:#555555;font-family:Arial;line-height:25px;">最受用户好评的手机输入法，1亿用户正在使用，Android手机装机必备软件！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">全球首创“蜂巢”输入模型，独家支持拼音、手写、语音“云+端”立体输入引擎！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">采用第三代离线语音识别引擎，语音输入无需流量，识别准确率、速度全面提升！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">思想有多快，输入就有多快！讯飞输入法，创造极致输入体验。</span>', NULL, N'Androids/com.iflytek.inputmethod/android_4.0.1456.apk', 1, CAST(0x0000A29F002A6020 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.iflytek.inputmethod', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.iflytek.inputmethod\android_4.0.1456.apk', N'Androids/com.iflytek.inputmethod/android_4.0.1456.apk', NULL, NULL, N'androids/20131225023312.png', 5, CAST(0x0000A29F002A6020 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'9f4f5b65-95c3-463c-9938-8ba15af5b4bd', NULL, 3, N'139邮箱', N'androids/20131225022433.jpg', N'5.81', N'6357799', N'<span style="color:#555555;font-family:Arial;line-height:25px;">产品介绍：</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">1.手机变邮箱，沟通更方便!139邮箱手机客户端让您在手机上轻松完成邮件收发、回复及转发等操作，速度快，省流量，支持多种格式附件下载与上传。脱离电脑也能收发自如。</span>', NULL, N'Androids/cn.cj.pe/android_5.81.apk', 1, CAST(0x0000A29F0027CF20 AS DateTime), 0, 1, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'cn.cj.pe', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\cn.cj.pe\android_5.81.apk', N'Androids/cn.cj.pe/android_5.81.apk', NULL, NULL, N'androids/20131225022414.png', 2, CAST(0x0000A29F0027CF20 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'a1915d0f-1078-4a78-87ca-45df70786cfa', NULL, 3, N'1号店', N'androids/20131225022544.png', N'3.1.0', N'8083888', N'<span style="color:#555555;font-family:Arial;line-height:25px;">网购神器——掌上1号店手机客户端3.1版本华丽登场！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">把一座大型超市轻松地装进你的手机，美食、百货、3C数码、服装样样齐全，动动手指就送到您家，为您省钱省力更省时间！</span>', NULL, N'Androids/com.thestore.main/android_3.1.0.apk', 1, CAST(0x0000A29F00282371 AS DateTime), 0, 1, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.thestore.main', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.thestore.main\android_3.1.0.apk', N'Androids/com.thestore.main/android_3.1.0.apk', NULL, NULL, N'androids/20131225022530.png', 1, CAST(0x0000A29F00282371 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'ace71cc4-af3a-4518-a800-79d4bc31b875', NULL, 2, N'QQGame', N'androids/20131225021932.jpg', N'2.4.2', N'4749197', N'<span style="color:#555555;font-family:Arial;line-height:25px;">QQ游戏2.3全新改版，快乐继续！&nbsp;QQ游戏，中国手机游戏第一入口！&nbsp;全新精品游戏平台2.0华丽蜕变！&nbsp;手机在变，游戏在变，快乐未曾改变！</span>', NULL, N'Androids/com.tencent.qqgame/android_2.4.2.apk', 1, CAST(0x0000A29F0026DF7A AS DateTime), 0, 1, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.tencent.qqgame', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.tencent.qqgame\android_2.4.2.apk', N'Androids/com.tencent.qqgame/android_2.4.2.apk', NULL, NULL, N'androids/com.tencent.qqgame/20131225022128.png', 10, CAST(0x0000A29F0026DF7A AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'bdb7ddcf-ccf6-4ae5-8e9e-9283fddfe6f5', NULL, 2, N'3D桌球', N'androids/com.kb.Carrom3DFull/20140528223450.jpg', N'2.5.1', N'79274', N'<span style="color:#555555;font-family:Arial;line-height:25px;">《3D台球&nbsp;Pool&nbsp;Break&nbsp;Pro》也叫凯勒姆撞球，台球源于英国，它是一项在国际上广泛流行的高雅室内体育运动。是一种用球杆在台上击球、依靠计算得分确定比赛胜负的室内娱乐体育项目。台球也叫桌球（港澳的叫法）、撞球（台湾的叫法）。台球流行于世界各国，从不同的角度有不同的分类方法，可以从国度、台球的数量以及台球的击球技巧进行分类。按有无袋口分：落袋台球、开伦台球(carom&nbsp;billiard)。按国度分：法式台球、英式台球、美式台球、中式斯诺克台球。按规则及打法分：斯诺克台球、8球、9球、14.1、15球积分、3球开伦、4球开伦。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">　　台球的种类很多，除了大家熟悉的斯诺克台球以外，还有很多打法都在国内和世界上流行，并且都有各自的世界大赛，在一些综合性的大赛中，台球项目也设立了很多小项。为了使大家能了解台球运动在世界上的发展，这里介绍几种目前世界上流行的台球打法。</span>', NULL, N'Androids/com.kb.Carrom3DFull/android_2.5.1.apk', 1, CAST(0x0000A33901743947 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.kb.Carrom3DFull', N'[object Object]', NULL, N'Androids/com.kb.Carrom3DFull/android_2.5.1.apk', N'2.3.3', N'9', N'androids/com.kb.Carrom3DFull/20140528223443.png', NULL, CAST(0x0000A33901743947 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'be9f0398-bd13-4d9d-b0ac-c101e09676c5', NULL, 1, N'优酷', N'androids/com.youku.phone/20140527231553.jpg', N'3.8.2', N'600349', N'x', NULL, N'Androids/com.youku.phone/android_3.8.2.apk', 1, CAST(0x0000A338017FA1A7 AS DateTime), 0, 1, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.youku.phone', N'[object Object]', NULL, N'Androids/com.youku.phone/android_3.8.2.apk', N'2.2', N'8', N'androids/com.youku.phone/20140527231542.png', NULL, CAST(0x0000A338017FA115 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'bfe1e22c-b89e-448c-b5bb-df5b745e6433', NULL, 1, N'QQ同步助手', N'androids/com.tencent.qqpim/20140528222414.jpg', N'4.7.5', N'905421', N'<span style="color:#555555;font-family:Arial;line-height:25px;">QQ同步助手，是在苹果app&nbsp;store及google&nbsp;play均排名第一的备份软件！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">QQ同步助手，备份您的手机生活，实现通讯录永不丢失。更支持web云端（ic.qq.com）管理通讯录。对于经常刷机或拥有多台手机的用户来说，是一款不得不推荐的必备工具。主要特色功能如下：</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">1、备份全面：通讯录，短信，通话记录，一键备份/恢复，省时省力省流量；</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">2、安全保障：数字证书加密传输，保证您的通讯信息绝对安全，永不丢失；</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">3、管理便捷：登入ic.qq.com，管理专属云端资料，一键更新至手机；</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">4、更多亮点：联系人去重，时光机还原等更多功能，用心顾及您使用中的方方面面。</span>', NULL, N'Androids/com.tencent.qqpim/android_4.7.5.apk', 1, CAST(0x0000A3390171464D AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.tencent.qqpim', N'[object Object]', NULL, N'Androids/com.tencent.qqpim/android_4.7.5.apk', NULL, N'4', N'androids/com.tencent.qqpim/20140528222404.png', NULL, CAST(0x0000A3390171464D AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'c589dd29-5635-4487-ac64-f3e536699696', NULL, 2, N'一笔画成', N'androids/com.ecapycsw.onetouchdrawing/20140528225240.jpg', N'2.2.5', N'136452', N'<span style="color:#555555;font-family:Arial;line-height:25px;">3000万以上用户所选择的游戏!</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">有益于智力发展的Ecapyc游戏,</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">请尽情享受“一笔画”!</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">一笔画的所有内容免费!</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">★★&nbsp;Google&nbsp;Play&nbsp;Records&nbsp;★★</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">Top&nbsp;10&nbsp;Brain&nbsp;＆&nbsp;Puzzle&nbsp;Game&nbsp;in&nbsp;30&nbsp;countries.</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">★★&nbsp;App&nbsp;Store&nbsp;Records</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">★★Top&nbsp;10&nbsp;free&nbsp;game&nbsp;in&nbsp;60&nbsp;countries.</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">想必大家在学生时代都接触过一笔画。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">游戏规则非常简单。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">笔一次不脱手根据图形画出所有的图即可。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">但是经过一次的线不可以重复经过。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">当通过一个个关卡,越往后游戏难度将会越大。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">游戏中会给出一些特别的规定,</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">比如需要经过两次的线,只能从一个方向经过的线,</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">还有一下子移动到另一个点的跳跃点等规则。</span>', NULL, N'Androids/com.ecapycsw.onetouchdrawing/android_2.2.5.apk', 1, CAST(0x0000A33901790C60 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.ecapycsw.onetouchdrawing', N'[object Object]', NULL, N'Androids/com.ecapycsw.onetouchdrawing/android_2.2.5.apk', N'2.3.7', N'10', N'androids/com.ecapycsw.onetouchdrawing/20140528225228.png', NULL, CAST(0x0000A33901790C60 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'cbc93c32-f410-4403-badd-f00edb52a36f', NULL, 3, N'酷讯机票', N'androids/20131225023111.jpg', N'4.4.4', N'5978078', N'0.0', NULL, N'Androids/com.kuxun.scliang.plane/android_4.4.4.apk', 1, CAST(0x0000A29F002991CD AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.kuxun.scliang.plane', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.kuxun.scliang.plane\android_4.4.4.apk', N'Androids/com.kuxun.scliang.plane/android_4.4.4.apk', NULL, NULL, N'androids/20131225023042.png', 4, CAST(0x0000A29F002991CD AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'D46899BE-78DF-4A7D-A618-143CB7268843', NULL, 1, N'WeSync', NULL, N'4.5', N'2420374', NULL, NULL, N'', 1, CAST(0x0000A28E012573B9 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.tencent.qqpim', NULL, N'D:\Projects\PartTime\应用商城\src\AppStore\AppStore.Manage\Content\Upload\APK\com.tencent.qqpim\com.tencent.qqpim_4.5.apk', NULL, NULL, NULL, NULL, 2, CAST(0x0000A28E012573B9 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'e64504e8-45b5-4ab7-8926-ff182baf7513', NULL, 3, N'优酷', N'androids/20131225024359.JPG', N'3.5.1', N'14762031', N'<span style="color:#555555;font-family:Arial;line-height:25px;">优酷—中国第一视频网站，为你提供电视剧,电影,动漫,音乐,新闻,娱乐,游戏,搞笑等海量影视，高清流畅播放&nbsp;极速离线缓存，支持微博、微信、朋友圈一键分享。新版App增加全网搜索功能，土豆、奇艺、搜狐、腾讯、PPS、PPTV等精彩视频360度全方位一手掌握！</span>', NULL, N'Androids/com.youku.phone/android_3.5.1.apk', 1, CAST(0x0000A29F002D193A AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.youku.phone', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.youku.phone\android_3.5.1.apk', N'Androids/com.youku.phone/android_3.5.1.apk', NULL, NULL, N'androids/20131225024333.png', 3, CAST(0x0000A29F002D193A AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'ebf14ddf-4d89-45e2-9958-ec7a75686306', NULL, 3, N'手机驿站', NULL, N'2.0', N'510452', N'<p>
	手机驿站
</p>', NULL, N'Androids/com.mobilestation/android_2.0.apk', 1, CAST(0x0000A2A901280930 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.mobilestation', N'[object Object]', NULL, N'Androids/com.mobilestation/android_2.0.apk', N'2.2', N'8', NULL, 20, CAST(0x0000A2A901280930 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'F29E07D6-CE5F-4F1F-A71B-A57A7A841391', NULL, 1, N'微博', NULL, N'4.1.5', N'21048499', N'<span style="color:#555555;font-family:Arial;line-height:25px;"><span style="color:#666666;font-family:宋体;line-height:22px;background-color:#F6F6F6;">新浪微博是一个由新浪网推出，提供微型博客服务的类Twitter网站。用户可以通过手机客户端发布消息或上传图片。可以把微博理解为''微型博客''或者''一句话博客''。用户可以将看到的、听到的、想到的事情写成一句话，或发一张图片，通过电脑或者手机随时随地分享给朋友，一起分享、讨论；还可以关注朋友，即时看到朋友们发布的信息。 </span><br />
<br />
<span style="color:#666666;font-family:宋体;line-height:22px;background-color:#F6F6F6;">v4.1.5更新：&nbsp;</span><br />
<span style="color:#666666;font-family:宋体;line-height:22px;background-color:#F6F6F6;">1.分享到微信朋友圈和来往。</span><br />
<span style="color:#666666;font-family:宋体;line-height:22px;background-color:#F6F6F6;">2.支持删除未关注人私信。</span><br />
<span style="color:#666666;font-family:宋体;line-height:22px;background-color:#F6F6F6;">3.新增未关注人私信消息提醒开关。</span><br />
<span style="color:#666666;font-family:宋体;line-height:22px;background-color:#F6F6F6;">4.修复部分音乐分享失败的问题。</span></span>', NULL, NULL, 1, CAST(0x0000A29E00ABF60E AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.sina.weibo', NULL, N'D:\Projects\PartTime\应用商城\src\AppStore\AppStore.Manage\Content\UploadFile\Androids\com.sina.weibo\android_4.1.5.apk', N'Androids/com.sina.weibo/android_4.1.5.apk', NULL, NULL, N'androids/com.sina.weibo/20131224102602.png', 5, CAST(0x0000A29E00ABF60E AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'f3d1dc44-5303-4d93-b0e9-72a17c4e6b8e', NULL, 2, N'Fruit Ninja', N'androids/20131225023556.JPG', N'1.8.8.2', N'24364967', N'<span style="color:#555555;font-family:Arial;line-height:25px;">人人都爱切水果！国民级休闲手游《水果忍者》迎来三周年华诞，全新乐逗定制版华丽登场。万人狂欢的任务系统，神秘非凡的庆典水果，只要集齐刻有特殊字体的庆典水果就可以获得丰厚的游戏奖励，集齐金色苹果更有机会参与抽奖，赢取“土豪金”iPhone5s大奖！……这一切都汇聚成《水果忍者》三周年特别版。</span>', NULL, N'Androids/com.halfbrick.fruitninja/android_1.8.8.2.apk', 1, CAST(0x0000A29F002AFB32 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.halfbrick.fruitninja', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.halfbrick.fruitninja\android_1.8.8.2.apk', N'Androids/com.halfbrick.fruitninja/android_1.8.8.2.apk', NULL, NULL, N'androids/20131225023540.png', 16, CAST(0x0000A29F002AFB32 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'f530f867-46d6-44c7-8b49-7203ed245e0c', NULL, 2, N'快乐斗地主', N'androids/com.coolplay.ddz.cmge/20140528224016.jpg', N'1.3.6.1', N'611435', N'<span style="color:#555555;font-family:Arial;line-height:25px;">“快乐斗地主”是一款全免费的斗地主游戏，不仅提供丰富的游戏模式，还有丰厚的礼品任你挑选，实惠金币每天送，还可以随时换取手机话费，让大家在游戏中玩得开心，玩得刺激。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">相比于普通游戏，本游戏采用了华丽的中国风设计元素，红色等喜庆色调，更符合中国人喜欢热闹的气氛。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">游戏极具趣味性，游戏中增加每局任务，在玩牌的过程，增加了玩牌的紧张感。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">游戏中有兑换功能，在玩牌的过程中，通过任务，可以获得一定的奖励，增加了游戏的吸引力。</span>', NULL, N'Androids/com.coolplay.ddz.cmge/android_1.3.6.1.apk', 1, CAST(0x0000A3390175A2D4 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.coolplay.ddz.cmge', N'[object Object]', NULL, N'Androids/com.coolplay.ddz.cmge/android_1.3.6.1.apk', N'2.2', N'8', N'androids/com.coolplay.ddz.cmge/20140528224010.png', NULL, CAST(0x0000A3390175A2D4 AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'fe78dad1-a412-47c6-ba22-167a1c5167cd', NULL, 2, N'Nipple', NULL, N'1.0.1', N'3132515', N'压根34234234', NULL, NULL, 1, CAST(0x0000A28E00EAD56B AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(0x0000A28E00EAD56B AS DateTime), 1)
INSERT [dbo].[Application] ([ApplicationID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime], [AutoDownload]) VALUES (N'ff0a7d98-0530-4005-b9cf-af8be1a24aea', NULL, 2, N'消灭星星', N'androids/com.admob.fcxx/20140528223742.jpg', N'3.5', N'874352', N'<span style="color:#555555;font-family:Arial;line-height:25px;">消灭星星是一款移植自IOS平台的消消看游戏，一旦你开始玩，就不会再放手!&nbsp;消灭星星是一个很锻炼脑力的游戏。&nbsp;点击两个或更多相同的星星可以消除它们。&nbsp;</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">现在从谷歌市场登录安卓市场！</span>', NULL, N'Androids/com.admob.fcxx/android_3.5.apk', 1, CAST(0x0000A339017500CC AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.admob.fcxx', N'[object Object]', NULL, N'Androids/com.admob.fcxx/android_3.5.apk', NULL, N'4', N'androids/com.admob.fcxx/20140528223735.png', NULL, CAST(0x0000A339017500CC AS DateTime), 1)
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'1398ab8e-d6d2-4bbf-ba30-e90192640e8e', N'4A73829C-E487-4642-9D65-0B4F0E14D780')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'278F4841-5E47-4B5E-A3A1-2BFCFA411FA0', N'4A73829C-E487-4642-9D65-0B4F0E14D780')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'3ac1c259-6962-4a22-859d-3f744d9c9733', N'4A73829C-E487-4642-9D65-0B4F0E14D780')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'4D0CB6EC-9671-42CD-B532-BF723EB08CCA', N'4A73829C-E487-4642-9D65-0B4F0E14D780')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'4e24970f-32a4-4075-99f9-914f41dde52a', N'4A73829C-E487-4642-9D65-0B4F0E14D780')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'6338B9D6-CA94-41E3-8AEA-365AE595F772', N'4A73829C-E487-4642-9D65-0B4F0E14D780')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'76ADBC47-A689-4369-A4B0-27EEA3AE3F8F', N'4A73829C-E487-4642-9D65-0B4F0E14D780')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'834a983e-e239-49ec-815a-6ad6a3ff06e8', N'4A73829C-E487-4642-9D65-0B4F0E14D780')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'D46899BE-78DF-4A7D-A618-143CB7268843', N'4A73829C-E487-4642-9D65-0B4F0E14D780')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'F29E07D6-CE5F-4F1F-A71B-A57A7A841391', N'4A73829C-E487-4642-9D65-0B4F0E14D780')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'24c0d51a-afbd-4cbe-b2cb-d4ea1e8e1695', N'54aa4130-4226-4e22-9cc9-eb81b89c721e')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'3f9c9236-da36-44ad-8d7d-5b1957137d99', N'54aa4130-4226-4e22-9cc9-eb81b89c721e')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'be9f0398-bd13-4d9d-b0ac-c101e09676c5', N'54aa4130-4226-4e22-9cc9-eb81b89c721e')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'4acae024-6791-4ab6-ac50-f633b4202d20', N'58e69005-64c2-4a64-b72b-65b2916e0506')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'94ebdd4b-cca4-4a36-9557-a85aee42ee66', N'58e69005-64c2-4a64-b72b-65b2916e0506')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'9f4f5b65-95c3-463c-9938-8ba15af5b4bd', N'58e69005-64c2-4a64-b72b-65b2916e0506')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'a1915d0f-1078-4a78-87ca-45df70786cfa', N'58e69005-64c2-4a64-b72b-65b2916e0506')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'cbc93c32-f410-4403-badd-f00edb52a36f', N'58e69005-64c2-4a64-b72b-65b2916e0506')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'e64504e8-45b5-4ab7-8926-ff182baf7513', N'58e69005-64c2-4a64-b72b-65b2916e0506')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'ebf14ddf-4d89-45e2-9958-ec7a75686306', N'58e69005-64c2-4a64-b72b-65b2916e0506')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'c589dd29-5635-4487-ac64-f3e536699696', N'8cc187c0-6a95-49b5-96fb-0ddab5a27ce5')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'0e8d67cf-079a-4916-8429-41570c45f69d', N'a954360c-a320-4221-b760-3a2b063ebf33')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'831d3a29-1098-4cc5-904f-5164799d7b68', N'a954360c-a320-4221-b760-3a2b063ebf33')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'77a35746-a816-473b-a988-e3f740733322', N'bdc77592-3634-43f4-8d09-03b54ced2a8c')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'bfe1e22c-b89e-448c-b5bb-df5b745e6433', N'bdc77592-3634-43f4-8d09-03b54ced2a8c')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'80857fe1-0c36-4eee-ab4b-820d729b7f45', N'd0f65176-7298-4acb-bf29-b3d80aa4c430')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'354bd717-4fc9-4672-b671-c31969a58295', N'eb8e1162-3e47-4757-a9e8-96414be13a83')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'4EB67F60-376F-458D-B337-1BDBF7041421', N'eb8e1162-3e47-4757-a9e8-96414be13a83')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'643f9b7d-5fa9-48ee-926a-70301840e7df', N'eb8e1162-3e47-4757-a9e8-96414be13a83')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'4657e5c8-ce93-406b-a3d9-1e4f941cdd2f', N'EE7BD005-18F6-44D6-959D-20C4455F9C99')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'6812e5a2-18e9-4347-9993-0e6602c11186', N'EE7BD005-18F6-44D6-959D-20C4455F9C99')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'ace71cc4-af3a-4518-a800-79d4bc31b875', N'EE7BD005-18F6-44D6-959D-20C4455F9C99')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'bdb7ddcf-ccf6-4ae5-8e9e-9283fddfe6f5', N'EE7BD005-18F6-44D6-959D-20C4455F9C99')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'f3d1dc44-5303-4d93-b0e9-72a17c4e6b8e', N'EE7BD005-18F6-44D6-959D-20C4455F9C99')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'f530f867-46d6-44c7-8b49-7203ed245e0c', N'EE7BD005-18F6-44D6-959D-20C4455F9C99')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'fe78dad1-a412-47c6-ba22-167a1c5167cd', N'EE7BD005-18F6-44D6-959D-20C4455F9C99')
INSERT [dbo].[ApplicationCategory] ([Application_ApplicationID], [Category_CategoryID]) VALUES (N'ff0a7d98-0530-4005-b9cf-af8be1a24aea', N'EE7BD005-18F6-44D6-959D-20C4455F9C99')
INSERT [dbo].[AppType] ([AppTypeID], [AppTypeName], [Count], [Description]) VALUES (1, N'应用工具', 0, NULL)
INSERT [dbo].[AppType] ([AppTypeID], [AppTypeName], [Count], [Description]) VALUES (2, N'游戏娱乐', 0, NULL)
INSERT [dbo].[AppType] ([AppTypeID], [AppTypeName], [Count], [Description]) VALUES (3, N'装机必备', 0, NULL)
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'251fc9da-f0d1-43a1-8b53-7c5c75ce076a', N'Miui/小米', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A295003124DA AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'3649dd5c-1cb8-4eac-98be-17328a984d63', N'Bbk/步步高', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A2950030BE59 AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'5f2853f1-f445-41f1-b1c0-ec1778e426aa', N'Coolpad/酷派', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A2950030AD78 AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'87b30516-021c-47c0-9776-2885ea737998', N'Meizu/魅族', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A29500315598 AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'925296a3-db4c-48fb-bd4d-6865edd17e20', N'Motorola/摩托罗拉', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A295003115B6 AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'a221427f-a15d-4176-a76c-4ea8d0530efa', N'Samsung/三星', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A29500310261 AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'ad1a018e-127b-47a2-bb3c-adf370a787f9', N'Huawei/华为', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A2950030E5F7 AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'b190582b-ffac-488e-8cc4-d6109b43b142', N'Nokia/诺基亚', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A295003139CD AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'ced539a1-8f8e-4c09-aea4-59afb60abdb8', N'Lenovo/联想', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A29500314807 AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'd3204542-4510-4e09-bf51-e5809e4cd750', N'Sony/索尼', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A29500309E6B AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'e908f7ae-6770-4347-b94e-0ac26f4b7ac6', N'K-Touch/天语', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A2950030CF3B AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'eca334a8-3b84-4750-9224-c5cd80a2a4c1', N'ZTE/中兴', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A295004576BD AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'f644706b-2ea8-4fc5-9cd1-84dd084f409c', N'HTC/宏达电', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A2950030F4F6 AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'4A73829C-E487-4642-9D65-0B4F0E14D780', 1, N'系统管理', NULL, 0, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'52bc0731-d383-4f1f-be60-338865c9443f', 2, N'RPG冒险', NULL, 3, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'532fbff5-d696-4342-9ba2-29660ae4a669', 3, N'手机生活', NULL, 2, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'54aa4130-4226-4e22-9cc9-eb81b89c721e', 1, N'影音娱乐', NULL, 5, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'5891d0aa-c015-4881-8100-46d997feba2e', 2, N'动作射击', NULL, 4, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'58e69005-64c2-4a64-b72b-65b2916e0506', 3, N'快速装机', NULL, 1, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'6cf25e1b-2bbf-4ec5-a4bb-a4b4a2482479', 2, N'竞速体育', NULL, 6, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'763a429a-028e-4e82-8ed1-97ef095eff58', 3, N'男生必备', NULL, 4, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'76cb7c01-d1d5-4543-8133-fd7cb80e81a9', 2, N'单机游戏', NULL, 7, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'7e18ed61-c2c4-4682-bc58-8ef4be33e018', 1, N'健康生活', NULL, 7, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'8cc187c0-6a95-49b5-96fb-0ddab5a27ce5', 2, N'策略益智', NULL, 5, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'a3d3be1d-ea35-4859-8724-dd6d6a1a4034', 3, N'单机游戏', NULL, 5, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'a954360c-a320-4221-b760-3a2b063ebf33', 1, N'手机生活', NULL, 6, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'b812423c-4275-4f83-b04f-6d4d2c6b33b4', 3, N'女生必备', NULL, 3, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'bdc77592-3634-43f4-8d09-03b54ced2a8c', 1, N'实用工具', NULL, 3, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'd0f65176-7298-4acb-bf29-b3d80aa4c430', 1, N'地图导航', NULL, 4, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'eb8e1162-3e47-4757-a9e8-96414be13a83', 1, N'社交聊天', NULL, 2, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'EE7BD005-18F6-44D6-959D-20C4455F9C99', 2, N'休闲娱乐', NULL, 0, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'eeb2be68-0088-4c0c-a2f6-3ed5a5140d65', 2, N'棋牌桌游', NULL, 1, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'14F1A42A-1DCF-419A-9B01-A53717060ABE', N'Samsung Simmental', N'Drivers/samsung/Samsung_Simmental.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'152B9B04-FFBD-41AF-A050-62D6C402AF07', N'Meizu', N'Drivers/Meizu/MeizuUSB.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'1A082BBC-9E71-46D8-855D-5E6774D0F234', N'联想 P709', N'Drivers/Lenovo/lenovo_P709.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'237A653E-9854-4B99-A97F-EC378FA9E26F', N'Samsung Hsp Plus', N'Drivers/samsung/Samsung_HSP_Plus_Default.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'2518E524-67B2-43FB-986C-584B8FAB117E', N'Samsung Siberian', N'Drivers/samsung/Samsung_Siberian.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'3942E053-F395-4781-9DFB-B3180EDB3001', N'联想 I380', N'Drivers/Lenovo/lenovo_i380_drivers107.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'3A675D08-6D03-4939-A0FA-4D15EF2FAE3F', N'Samsung Schorl', N'Drivers/samsung/Samsung_Schorl.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'3C403D58-3D97-4D34-B83F-270C61E265F1', N'Samsung Hsp', N'Drivers/samsung/Samsung_Hsp.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'40FF20AA-C299-416E-A242-0BA204CC5F5A', N'Samsung adb 1.7', N'Drivers/samsung/samsung_adb_1.7.exe', N'1.7', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'46D62AB8-836A-459B-A731-2E0741665045', N'Samsung Spencer', N'Drivers/samsung/Samsung_Spencer.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'4C2E3B7E-8020-4779-B433-3A7345E04BB5', N'Samsung EMP Chipset', N'Drivers/samsung/Samsung_EMPChipset.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'5FF16DB7-7609-4AAD-9379-E962641F9DB6', N'Samsung Zinia Seral', N'Drivers/samsung/Samsung_Zinia_Serial_Driver.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'6855034A-F905-4A85-A0CD-306E366ED46A', N'Samsung Android 4.0', N'Drivers/samsung/Samsung_Android_4.0_usbdrivers.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'696E5A54-DCA7-4F2D-8215-CFB2662FD021', N'HTC', N'Drivers/HTC/htc_drv_200070014_32.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'79A4F7B8-DE87-4428-961E-2A220004336C', N'Samsung Swallotail', N'Drivers/samsung/Samsung_Swallowtail.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'83ECE841-6E6D-405E-A14E-6F994D9BBA40', N'Samsung Searsburg', N'Drivers/samsung/Samsung_Searsburg.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'9664F4D2-6510-467E-B6DA-D48EE5CC1255', N'Coolpad E230', N'Drivers/hawei/Coolpad_E230_110524.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'9D7E5A3C-E626-4C7B-BF60-86BEA324CD52', N'Hawei U8650', N'Drivers/hawei/pc6-hwU8650qd.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'AB904EA2-3E42-4910-BF01-378B68D8D07F', N'Google NS', N'Drivers/Google/ns_driver.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'B06C04AA-6327-4E8C-946B-2EA219876E0E', N'Google Nexus_Universal', N'Drivers/Google/Nexus_Universal_Naked_Driver.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'B0DFD71F-E4A4-41B0-8379-9CAD88C531C7', N'Hawei t8600', N'Drivers/hawei/T8600_OMS_Driver_1.0.0.10.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'B163B6E7-FF33-4965-9BD2-9D8201C1C8B4', N'Samsung EMP Chipset2', N'Drivers/samsung/Samsung_EMP_Chipset2.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'B704B5EC-FE6C-4F58-BBAC-B0C64AB9E0B8', N'联想 UsbModem', N'Drivers/Lenovo/LenovoUsbModem.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'BC8DFC15-F90E-4A4D-BAA2-BD8C834E796F', N'Samsung Sloan', N'Drivers/samsung/Samsung_Sloan.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'd09ca78d-efab-4651-a387-274de0a241a5', N'三星S2', N'Drivers/d09ca78d-efab-4651-a387-274de0a241a5/SAMSUNGUSBDriverSetUp.exe', N'1.1.1', CAST(0x0000A2A9012C023F AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'D1DFD8E6-6C2C-4DB0-891A-85371DE52154', N'步步高 MT', N'Drivers/Vivo/vivo_MT.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'D8C8CBBA-8CF0-4D5C-978E-668144D10E0B', N'步步高 Qualcomm', N'Drivers/Vivo/vivo_Qualcomm.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'DA950176-927C-4C5C-8952-8E641D18DC6A', N'Samsung Shrewsbury', N'Drivers/samsung/Samsung_Shrewsbury.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'DB55377C-9D93-4FD0-8390-477DB8CFC270', N'Hawei hwu8150', N'Drivers/hawei/hwu8150.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'E1C8F898-5142-49F4-B29C-A17B022BC1D6', N'联想 UsbHub', N'Drivers/Lenovo/LenovoUsbHub.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'EBF87FCC-D341-4BA8-AAF3-50A36C48DD2E', N'Samsung WiMax', N'Drivers/samsung/Samsung_WiBro_WiMAX.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'F5996D71-6005-48D8-BFB1-D45E29E3FC06', N'Coolpad N930', N'Drivers/hawei/Coolpad_N930_110524.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'FB7A9401-AF3C-4A77-BC0B-CF3068BDB45E', N'Coolpad D530', N'Drivers/hawei/coolpadd530.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'FC0EB244-A92B-4364-8D9D-23DB551448BA', N'联想 USBEts', N'Drivers/Lenovo/LenovoUsbEts.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Mobile] ([MobileID], [DriverID], [MobileName], [Brand], [Model], [System], [Version], [PictureUrl], [MemorySize], [CPU], [ScreenSize], [Resolution], [UpdateTime], [PID], [VID]) VALUES (N'930d1d63-9692-4253-9b7d-6a438f1f8cf8', N'd09ca78d-efab-4651-a387-274de0a241a5', N'三星S1', NULL, N'66', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A29500283E11 AS DateTime), N'681c', N'04e8')
INSERT [dbo].[MobileApp] ([MobileAppID], [ApplicationID], [MobileClientID], [Installer], [CreateTime], [FirstTime], [SecondTime], [Totaltime], [UpdateTime], [AddTime], [RemoveTime], [PackageName], [IsSync], [IsSys], [Frequency]) VALUES (N'096f1161-5677-48eb-b1c1-b25f58ab8853', N'9f4f5b65-95c3-463c-9938-8ba15af5b4bd', N'5c5d5f08-3cca-4a48-8ee3-35f46af8c3b6', N'PC', CAST(0x0000A2A9016960D0 AS DateTime), NULL, NULL, 0, CAST(0x0000A2AA017E17FD AS DateTime), CAST(0x0000A2AA00F97C5C AS DateTime), NULL, N'cn.cj.pe', 1, 1, 0)
INSERT [dbo].[MobileApp] ([MobileAppID], [ApplicationID], [MobileClientID], [Installer], [CreateTime], [FirstTime], [SecondTime], [Totaltime], [UpdateTime], [AddTime], [RemoveTime], [PackageName], [IsSync], [IsSys], [Frequency]) VALUES (N'289ddac3-01aa-4bd4-bb72-4edab71963b2', N'94ebdd4b-cca4-4a36-9557-a85aee42ee66', N'5c5d5f08-3cca-4a48-8ee3-35f46af8c3b6', N'PC', CAST(0x0000A2A9016995E5 AS DateTime), NULL, NULL, 0, CAST(0x0000A2AA017E17FE AS DateTime), CAST(0x0000A2AA00F97C5C AS DateTime), NULL, N'com.iflytek.inputmethod', 1, 1, 0)
INSERT [dbo].[MobileApp] ([MobileAppID], [ApplicationID], [MobileClientID], [Installer], [CreateTime], [FirstTime], [SecondTime], [Totaltime], [UpdateTime], [AddTime], [RemoveTime], [PackageName], [IsSync], [IsSys], [Frequency]) VALUES (N'414e299e-6cfb-48c9-ae51-c0ee68ca00a3', N'e64504e8-45b5-4ab7-8926-ff182baf7513', N'5c5d5f08-3cca-4a48-8ee3-35f46af8c3b6', N'PC', CAST(0x0000A2A901697486 AS DateTime), NULL, NULL, 0, CAST(0x0000A2AA017E17FD AS DateTime), CAST(0x0000A2AA00F97C5C AS DateTime), NULL, N'com.youku.phone', 1, 1, 0)
INSERT [dbo].[MobileApp] ([MobileAppID], [ApplicationID], [MobileClientID], [Installer], [CreateTime], [FirstTime], [SecondTime], [Totaltime], [UpdateTime], [AddTime], [RemoveTime], [PackageName], [IsSync], [IsSys], [Frequency]) VALUES (N'4c22be99-1b96-46b3-8b3a-645798d9bc62', N'a1915d0f-1078-4a78-87ca-45df70786cfa', N'5c5d5f08-3cca-4a48-8ee3-35f46af8c3b6', N'PC', CAST(0x0000A2A90169569A AS DateTime), NULL, NULL, 0, CAST(0x0000A2AA017E17FC AS DateTime), CAST(0x0000A2AA00F97C5C AS DateTime), NULL, N'com.thestore.main', 1, 1, 0)
INSERT [dbo].[MobileApp] ([MobileAppID], [ApplicationID], [MobileClientID], [Installer], [CreateTime], [FirstTime], [SecondTime], [Totaltime], [UpdateTime], [AddTime], [RemoveTime], [PackageName], [IsSync], [IsSys], [Frequency]) VALUES (N'790cacfb-60c1-4b24-9604-fc979f643c2a', N'4acae024-6791-4ab6-ac50-f633b4202d20', N'5c5d5f08-3cca-4a48-8ee3-35f46af8c3b6', N'PC', CAST(0x0000A2A9016988FE AS DateTime), NULL, NULL, 0, CAST(0x0000A2AA017E17FD AS DateTime), CAST(0x0000A2AA00F97C5C AS DateTime), NULL, N'com.baidu.BaiduMap', 1, 1, 0)
INSERT [dbo].[MobileApp] ([MobileAppID], [ApplicationID], [MobileClientID], [Installer], [CreateTime], [FirstTime], [SecondTime], [Totaltime], [UpdateTime], [AddTime], [RemoveTime], [PackageName], [IsSync], [IsSys], [Frequency]) VALUES (N'7e35644a-b10e-42d1-b3d0-7e6a6b3af6c0', N'cbc93c32-f410-4403-badd-f00edb52a36f', N'5c5d5f08-3cca-4a48-8ee3-35f46af8c3b6', N'PC', CAST(0x0000A2A90169B47D AS DateTime), NULL, NULL, 0, CAST(0x0000A2AA017E17FE AS DateTime), CAST(0x0000A2AA00F97C5C AS DateTime), NULL, N'com.kuxun.scliang.plane', 1, 1, 0)
INSERT [dbo].[MobileClient] ([MobileClientID], [PhoneModelID], [PCClientID], [ClientName], [ClientMac], [ClientKey], [Description], [UpdateTime], [CreateTime]) VALUES (N'5c5d5f08-3cca-4a48-8ee3-35f46af8c3b6', NULL, N'6328b4dd-cb83-4910-ac16-2f8391c83ede', N'系统版本:4.2.2,厂商HTC', NULL, N'356299048187817', NULL, CAST(0x0000A2A90169B47D AS DateTime), CAST(0x0000A2A901687A30 AS DateTime))
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'000376ef-4287-40d5-b8b9-ab557d6696e0', N'4EB67F60-376F-458D-B337-1BDBF7041421', N'androids/20131225020403.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'057df841-bfef-4702-91d1-b0cf7b1fc087', N'77a35746-a816-473b-a988-e3f740733322', N'androids/20140528221808.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'093f0918-6721-4e94-ad1e-ebb448cfab85', N'77a35746-a816-473b-a988-e3f740733322', N'androids/20140528221810.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'0b3accab-c19b-4466-b335-1300a8c0ecbc', N'4D0CB6EC-9671-42CD-B532-BF723EB08CCA', N'androids/com.zecurisoft.mhc1202/20131225015934.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'0e93e693-7a16-4b7a-81c4-ac507e74f002', N'ff0a7d98-0530-4005-b9cf-af8be1a24aea', N'androids/com.admob.fcxx/20140528223742.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'0ff691ef-5ac5-4a4e-8c7f-8c673a61584d', N'bdb7ddcf-ccf6-4ae5-8e9e-9283fddfe6f5', N'androids/com.kb.Carrom3DFull/20140528223451.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'107ce39b-0d38-4f6b-aa10-656d0d02429c', N'be9f0398-bd13-4d9d-b0ac-c101e09676c5', N'androids/com.youku.phone/20140527231553.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'142d9479-d9cc-4aa4-ba84-2b662b567772', N'278F4841-5E47-4B5E-A3A1-2BFCFA411FA0', N'androids/com.tencent.mobileqq/20131224100606.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'15faeebe-b8bb-4097-8d88-c1c28123016f', N'6338B9D6-CA94-41E3-8AEA-365AE595F772', N'androids/com.dg.gtd.android.lite/20131214201434.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'1943a959-6f8c-42d4-be97-ce9440893186', N'cbc93c32-f410-4403-badd-f00edb52a36f', N'androids/20131225023112.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'1a04138a-7597-4af0-bfde-08c45e71a4f3', N'0e8d67cf-079a-4916-8429-41570c45f69d', N'androids/com.netease.newsreader.activity/20140528222747.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'1c9ec702-c653-4ddf-8866-8e9bae1b7c51', N'1398ab8e-d6d2-4bbf-ba30-e90192640e8e', N'androids/20131225023727.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'2297a83a-5668-4b84-91ce-a0990ceedd6a', N'3ac1c259-6962-4a22-859d-3f744d9c9733', N'androids/com.ijinshan.kbatterydoctor/20140528221609.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'243a35bf-111e-4fb3-b5a9-e4a30444edea', N'4acae024-6791-4ab6-ac50-f633b4202d20', N'androids/20131225024231.JPG', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'28d358ba-a63d-4040-9cda-8fd2e7ab6e0a', N'80857fe1-0c36-4eee-ab4b-820d729b7f45', N'androids/com.tigerknows/20140528223010.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'2a742dee-4209-4e44-b1f5-e630224e6516', N'a1915d0f-1078-4a78-87ca-45df70786cfa', N'androids/20131225022545.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'2c5bb7e9-875c-4936-9734-7e016803426c', N'3f9c9236-da36-44ad-8d7d-5b1957137d99', N'androids/com.sohu.sohuvideo/20140528221352.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'2d929015-bdde-4c8d-aa08-02838f745bb0', N'6338B9D6-CA94-41E3-8AEA-365AE595F772', N'androids/com.dg.gtd.android.lite/20131214201433.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'2d9c18a9-30e8-4153-99b7-e68c552d45c1', N'e64504e8-45b5-4ab7-8926-ff182baf7513', N'androids/20131225024400.JPG', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'301ba3da-54ad-44ca-a1de-47596703741e', N'831d3a29-1098-4cc5-904f-5164799d7b68', N'androids/com.taobao.taobao/20140528000329.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'311fca65-6218-420a-ad5b-a9d94d9eacc7', N'ff0a7d98-0530-4005-b9cf-af8be1a24aea', N'androids/com.admob.fcxx/20140528223744.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'314d5289-3a36-4ee8-af5a-e67946d1b473', N'4D0CB6EC-9671-42CD-B532-BF723EB08CCA', N'androids/com.zecurisoft.mhc1202/20131225015932.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'37744646-c6a7-435f-976e-709bfdce5083', N'834a983e-e239-49ec-815a-6ad6a3ff06e8', N'androids/com.tencent.qqpimsecure/20140527233053.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'38d51cfb-0575-4a53-88d7-596adfd3896c', N'a1915d0f-1078-4a78-87ca-45df70786cfa', N'androids/20131225022544.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'3c7c455c-3278-49d3-b345-689f2cdfcf73', N'cbc93c32-f410-4403-badd-f00edb52a36f', N'androids/20131225023111.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'3c9a27a8-a9a9-4c94-b9ac-55e7d390bee9', N'c589dd29-5635-4487-ac64-f3e536699696', N'androids/com.ecapycsw.onetouchdrawing/20140528225241.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'3cb72098-6a8c-42e4-811b-5b0955f99a4f', N'77a35746-a816-473b-a988-e3f740733322', N'androids/com.eg.android.AlipayGphone/20140528221852.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'3db6aa14-9fbe-4e02-9d04-3ed71ca7b0de', N'0e8d67cf-079a-4916-8429-41570c45f69d', N'androids/com.netease.newsreader.activity/20140528222749.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'46d307ab-c9eb-4487-ab57-37710693b955', N'354bd717-4fc9-4672-b671-c31969a58295', N'androids/com.renren.mobile.android/20140528222125.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'46d94cb0-ee54-446d-a294-a0741ab2e590', N'278F4841-5E47-4B5E-A3A1-2BFCFA411FA0', N'androids/com.tencent.mobileqq/20131224100608.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'47b39431-0503-485a-b516-4afc14b5ad38', N'bfe1e22c-b89e-448c-b5bb-df5b745e6433', N'androids/com.tencent.qqpim/20140528222416.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'4881f72c-3e1b-44b8-aac8-41fc59247d72', N'3f9c9236-da36-44ad-8d7d-5b1957137d99', N'androids/com.sohu.sohuvideo/20140528221354.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'4981d2a3-3909-44e7-9dd7-18ba4f0a510b', N'643f9b7d-5fa9-48ee-926a-70301840e7df', N'androids/com.snda.youni/20140528003856.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'4f3eb349-1149-45b0-8b45-277042e8daf1', N'3ac1c259-6962-4a22-859d-3f744d9c9733', N'androids/com.ijinshan.kbatterydoctor/20140528221608.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'5051ac6e-ab90-476c-9842-2e0400fcd526', N'354bd717-4fc9-4672-b671-c31969a58295', N'androids/com.renren.mobile.android/20140528222126.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'53a420c2-7732-4b96-b910-22cf5a1d2d6d', N'6812e5a2-18e9-4347-9993-0e6602c11186', N'androids/com.xygame.wbjy/20140528224823.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'5663346f-df75-4525-9287-859a06214cfd', N'6338B9D6-CA94-41E3-8AEA-365AE595F772', N'androids/com.dg.gtd.android.lite/20131214201431.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'58a43697-d187-4c5b-b226-c1ca6ad0227c', N'354bd717-4fc9-4672-b671-c31969a58295', N'androids/com.renren.mobile.android/20140528222125.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'5ae60801-797a-4bec-8b36-20de59eb5f35', N'9f4f5b65-95c3-463c-9938-8ba15af5b4bd', N'androids/20131225022433.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'60fd84b3-f349-42aa-8a7c-49e5f670a498', N'be9f0398-bd13-4d9d-b0ac-c101e09676c5', N'androids/com.youku.phone/20140527231554.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'612c6bae-e52a-4641-bc16-fce8057108ea', N'94ebdd4b-cca4-4a36-9557-a85aee42ee66', N'androids/20131225023333.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'61803e79-11c7-4bba-8478-5d6ac4e42b4c', N'4e24970f-32a4-4075-99f9-914f41dde52a', N'androids/20131225022848.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'664b60ce-03b2-4f48-8461-cd11e9f58061', N'bdb7ddcf-ccf6-4ae5-8e9e-9283fddfe6f5', N'androids/com.kb.Carrom3DFull/20140528223450.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'666dd3f9-5239-4b2f-b677-b7dbc1da5d39', N'4D0CB6EC-9671-42CD-B532-BF723EB08CCA', N'androids/com.zecurisoft.mhc1202/20131225015932.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'6777d1e9-e7ed-4894-8ddc-d170ccf4b3d0', N'3ac1c259-6962-4a22-859d-3f744d9c9733', N'androids/com.ijinshan.kbatterydoctor/20140528221607.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'679fc580-7d3c-4f70-b735-39f6acf45fdd', N'c589dd29-5635-4487-ac64-f3e536699696', N'androids/com.ecapycsw.onetouchdrawing/20140528225240.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'6b51a7f4-c55b-4e1e-bca9-10a1fd1684b5', N'bfe1e22c-b89e-448c-b5bb-df5b745e6433', N'androids/com.tencent.qqpim/20140528222415.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'6ef50de9-a342-49f1-920b-67b5363fae01', N'bdb7ddcf-ccf6-4ae5-8e9e-9283fddfe6f5', N'androids/com.kb.Carrom3DFull/20140528223451.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'70f1a74e-b4a5-4c8e-9511-afaf64374c41', N'bfe1e22c-b89e-448c-b5bb-df5b745e6433', N'androids/com.tencent.qqpim/20140528222416.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'73e12883-c4dd-43a9-93e6-eda70fbaef89', N'0e8d67cf-079a-4916-8429-41570c45f69d', N'androids/com.netease.newsreader.activity/20140528222749.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'74051845-dc4b-4914-ac97-c958c8bae1c0', N'643f9b7d-5fa9-48ee-926a-70301840e7df', N'androids/com.snda.youni/20140528003857.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'7887b41c-3bd8-4e63-a832-053c65748676', N'4acae024-6791-4ab6-ac50-f633b4202d20', N'androids/20131225024233.JPG', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'788e11fa-1d25-4155-94ce-a1c0b86058e5', N'bfe1e22c-b89e-448c-b5bb-df5b745e6433', N'androids/com.tencent.qqpim/20140528222415.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'7b19fbf5-9745-4781-a740-d363897ca985', N'f530f867-46d6-44c7-8b49-7203ed245e0c', N'androids/com.coolplay.ddz.cmge/20140528224018.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'7cd5668f-b617-40f5-92a1-553c16b6ae14', N'6812e5a2-18e9-4347-9993-0e6602c11186', N'androids/com.xygame.wbjy/20140528224824.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'7e8e1b57-c8f3-433c-ad9f-a9bc809c1a0d', N'3ac1c259-6962-4a22-859d-3f744d9c9733', N'androids/com.ijinshan.kbatterydoctor/20140528221607.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'819dc1f1-566c-4fea-94b4-37df34a78b8d', N'4e24970f-32a4-4075-99f9-914f41dde52a', N'androids/20131225022850.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'83e99ecf-d236-4c79-8995-2d09b9ee3d9e', N'4acae024-6791-4ab6-ac50-f633b4202d20', N'androids/20131225024232.JPG', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'85801003-ce98-46aa-a3cd-4657a391a409', N'ff0a7d98-0530-4005-b9cf-af8be1a24aea', N'androids/com.admob.fcxx/20140528223742.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'85c2ffa7-d6fa-43f2-969b-1a58acb4dd58', N'f530f867-46d6-44c7-8b49-7203ed245e0c', N'androids/com.coolplay.ddz.cmge/20140528224016.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'8660c654-d00c-4eb3-bd52-7335ec145d11', N'4D0CB6EC-9671-42CD-B532-BF723EB08CCA', N'androids/com.zecurisoft.mhc1202/20131225015931.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'891c1077-38c3-4406-b740-41245e570e2d', N'0e8d67cf-079a-4916-8429-41570c45f69d', N'androids/com.netease.newsreader.activity/20140528222748.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'8992de79-99bf-455d-8520-018e34caf246', N'e64504e8-45b5-4ab7-8926-ff182baf7513', N'androids/20131225024400.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'8bb3bb27-f4fa-4724-ba73-1bead02a6f08', N'1398ab8e-d6d2-4bbf-ba30-e90192640e8e', N'androids/20131225023726.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'8e4add45-074a-470b-a591-8fbd770d0ac0', N'354bd717-4fc9-4672-b671-c31969a58295', N'androids/com.renren.mobile.android/20140528222127.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'920781dd-8930-4086-bbd9-4fc46d238532', N'77a35746-a816-473b-a988-e3f740733322', N'androids/20140528221810.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'92b73a4a-5b58-4754-a8bf-7bb1ed47ead0', N'80857fe1-0c36-4eee-ab4b-820d729b7f45', N'androids/com.tigerknows/20140528223011.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'94721d1e-3192-4b77-bffe-1d0540475308', N'c589dd29-5635-4487-ac64-f3e536699696', N'androids/com.ecapycsw.onetouchdrawing/20140528225243.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'9997d8d3-0356-4fe4-884c-c3b429019f0a', N'4657e5c8-ce93-406b-a3d9-1e4f941cdd2f', N'androids/20131225022040.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'9b9a5700-93b6-404f-a235-ab970ab47384', N'c589dd29-5635-4487-ac64-f3e536699696', N'androids/com.ecapycsw.onetouchdrawing/20140528225241.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'9fb35faf-e07b-478e-b806-32dc78b44aa9', N'3f9c9236-da36-44ad-8d7d-5b1957137d99', N'androids/com.sohu.sohuvideo/20140528221352.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'a071db3c-fadd-4e0f-89ad-d5c15d279b8d', N'4657e5c8-ce93-406b-a3d9-1e4f941cdd2f', N'androids/20131225022039.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'a0f03f30-8470-4191-b623-f8bd15ded940', N'a1915d0f-1078-4a78-87ca-45df70786cfa', N'androids/20131225022546.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'a25f1aeb-ea76-46b0-b81a-6e351e6e76b6', N'3f9c9236-da36-44ad-8d7d-5b1957137d99', N'androids/com.sohu.sohuvideo/20140528221353.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'a45a8904-1591-4ee5-818a-e9ddef4d54a9', N'be9f0398-bd13-4d9d-b0ac-c101e09676c5', N'androids/com.youku.phone/20140527231555.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'a53b9b35-898e-4a25-a70b-6094e8d3c028', N'9f4f5b65-95c3-463c-9938-8ba15af5b4bd', N'androids/20131225022435.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'a6972f7b-549b-48d1-a7ce-e5523bcda37d', N'4657e5c8-ce93-406b-a3d9-1e4f941cdd2f', N'androids/20131225022040.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'a83cde20-b626-4d2f-96d6-738e42f15a60', N'4D0CB6EC-9671-42CD-B532-BF723EB08CCA', N'androids/com.zecurisoft.mhc1202/20131225015933.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'a8ce86fc-fe4b-49db-88d4-47c71c9c4ea3', N'831d3a29-1098-4cc5-904f-5164799d7b68', N'androids/com.taobao.taobao/20140528000327.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'aac1e813-147e-411e-a282-7dfbeae038fa', N'9f4f5b65-95c3-463c-9938-8ba15af5b4bd', N'androids/20131225022435.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'ae2cf706-1a0e-416d-8c00-883cc7073b2f', N'643f9b7d-5fa9-48ee-926a-70301840e7df', N'androids/com.snda.youni/20140528003856.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b1f0ca66-07a0-4ab8-b028-fa2bd07ed77e', N'4EB67F60-376F-458D-B337-1BDBF7041421', N'androids/20131225020404.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b2b5b63b-23ae-4cee-aa1c-a782804637e0', N'831d3a29-1098-4cc5-904f-5164799d7b68', N'androids/com.taobao.taobao/20140528000330.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b2f51d45-4c03-4eeb-93d0-6f19672df705', N'643f9b7d-5fa9-48ee-926a-70301840e7df', N'androids/com.snda.youni/20140528003858.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b5efb2c7-d640-46d6-a438-67a6859a67bc', N'80857fe1-0c36-4eee-ab4b-820d729b7f45', N'androids/com.tigerknows/20140528223009.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b5f69008-4cad-46f6-8e84-2114d445b350', N'1398ab8e-d6d2-4bbf-ba30-e90192640e8e', N'androids/20131225023727.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b68ad47c-0af8-4d70-8c66-7e50e66c2875', N'cbc93c32-f410-4403-badd-f00edb52a36f', N'androids/20131225023111.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b6c3f277-a440-4184-8742-25f306f4bdf8', N'643f9b7d-5fa9-48ee-926a-70301840e7df', N'androids/com.snda.youni/20140528003858.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b6e0eede-8401-4b0d-b93f-104800536265', N'9f4f5b65-95c3-463c-9938-8ba15af5b4bd', N'androids/20131225022434.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b7814d56-2edb-410f-8282-9ae386e2f8c7', N'831d3a29-1098-4cc5-904f-5164799d7b68', N'androids/com.taobao.taobao/20140528000328.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b7e62f49-fcdc-414a-9a02-607001f1ebfb', N'3f9c9236-da36-44ad-8d7d-5b1957137d99', N'androids/com.sohu.sohuvideo/20140528221353.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b888e0ea-f28b-4fec-882f-40822dd45fe6', N'834a983e-e239-49ec-815a-6ad6a3ff06e8', N'androids/com.tencent.qqpimsecure/20140527233053.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b8ad9464-7f60-4c74-a42d-910c7cf08cd3', N'77a35746-a816-473b-a988-e3f740733322', N'androids/com.eg.android.AlipayGphone/20140528221853.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'be78202c-182a-44db-83bd-2092c171041a', N'0e8d67cf-079a-4916-8429-41570c45f69d', N'androids/com.netease.newsreader.activity/20140528222748.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'c028a8b6-d037-4726-896f-17aa1e6d53a5', N'4EB67F60-376F-458D-B337-1BDBF7041421', N'androids/20131225020404.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'c2f0990d-e5f5-48b8-9223-6732e76727a6', N'4e24970f-32a4-4075-99f9-914f41dde52a', N'androids/20131225022849.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'c2f989c3-a094-4319-96a6-9605d3fe90ec', N'77a35746-a816-473b-a988-e3f740733322', N'androids/com.eg.android.AlipayGphone/20140528221854.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'c377a435-547b-48c8-81bc-2f011dfd1f71', N'354bd717-4fc9-4672-b671-c31969a58295', N'androids/com.renren.mobile.android/20140528222126.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'c3b71eed-d8f3-411a-a52f-2ab87af54513', N'831d3a29-1098-4cc5-904f-5164799d7b68', N'androids/com.taobao.taobao/20140528000329.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'c7024db6-ff6c-45af-bd34-3415c405cccc', N'6338B9D6-CA94-41E3-8AEA-365AE595F772', N'androids/com.dg.gtd.android.lite/20131214201432.png', NULL, NULL, NULL)
GO
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'c7969b9f-7d66-4356-8805-e18731c7e96a', N'77a35746-a816-473b-a988-e3f740733322', N'androids/com.eg.android.AlipayGphone/20140528221854.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'caaa8ec4-6e23-403b-a2a8-44eb75e248e1', N'6812e5a2-18e9-4347-9993-0e6602c11186', N'androids/com.xygame.wbjy/20140528224825.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'd96500b8-a075-4c7c-921b-1d3736d26890', N'278F4841-5E47-4B5E-A3A1-2BFCFA411FA0', N'androids/com.tencent.mobileqq/20131224100605.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'dc7f2713-4235-4862-a26a-177948f06d51', N'834a983e-e239-49ec-815a-6ad6a3ff06e8', N'androids/com.tencent.qqpimsecure/20140527233053.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'ddeb61e9-625c-462d-acbe-0d8455a83eab', N'80857fe1-0c36-4eee-ab4b-820d729b7f45', N'androids/com.tigerknows/20140528223011.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'e0fbd7e9-ed73-41b0-860a-bf47c7f685af', N'80857fe1-0c36-4eee-ab4b-820d729b7f45', N'androids/com.tigerknows/20140528223009.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'e24dd273-b688-4f97-965d-12803f3983c3', N'94ebdd4b-cca4-4a36-9557-a85aee42ee66', N'androids/20131225023334.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'e3ed4524-07bf-40e3-95e4-321c48b12354', N'bfe1e22c-b89e-448c-b5bb-df5b745e6433', N'androids/com.tencent.qqpim/20140528222414.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'e3fd5dcf-8d0c-4039-9382-c52c6368535f', N'f530f867-46d6-44c7-8b49-7203ed245e0c', N'androids/com.coolplay.ddz.cmge/20140528224017.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'e5d96d72-572b-4305-bba0-e3fb2f6478e5', N'ff0a7d98-0530-4005-b9cf-af8be1a24aea', N'androids/com.admob.fcxx/20140528223743.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'e89efa36-36d8-438a-94ca-f57c07dddb2e', N'77a35746-a816-473b-a988-e3f740733322', N'androids/20140528221811.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'e9c83520-bdbd-42e1-af30-098f9071754b', N'e64504e8-45b5-4ab7-8926-ff182baf7513', N'androids/20131225024359.JPG', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'eb2d17d6-bed0-4913-a8eb-8a4f12709251', N'6338B9D6-CA94-41E3-8AEA-365AE595F772', N'androids/com.dg.gtd.android.lite/20131214201433.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'ec1d2be9-3c78-4fa2-a573-ab05e12779fc', N'f530f867-46d6-44c7-8b49-7203ed245e0c', N'androids/com.coolplay.ddz.cmge/20140528224018.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'ef7c42ed-5287-4b69-845d-ddcbfc345d50', N'77a35746-a816-473b-a988-e3f740733322', N'androids/20140528221809.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'ef89ad28-8257-45e1-a23c-cae9545bb867', N'6812e5a2-18e9-4347-9993-0e6602c11186', N'androids/com.xygame.wbjy/20140528224826.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'f46561f3-1bb4-41bc-aa4c-9b0c5410f4f6', N'77a35746-a816-473b-a988-e3f740733322', N'androids/com.eg.android.AlipayGphone/20140528221852.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'fa5a02a7-249c-459d-b4cb-3d85c3c08b14', N'6812e5a2-18e9-4347-9993-0e6602c11186', N'androids/com.xygame.wbjy/20140528224824.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'fd21457e-7ba7-4be7-b61c-00e9094a8846', N'834a983e-e239-49ec-815a-6ad6a3ff06e8', N'androids/com.tencent.qqpimsecure/20140527233053.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'ff097ae2-8478-432d-b7b0-f4ceab3ade5b', N'c589dd29-5635-4487-ac64-f3e536699696', N'androids/com.ecapycsw.onetouchdrawing/20140528225242.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'ff0d3927-f5d8-42eb-8cd4-74345d1a98de', N'be9f0398-bd13-4d9d-b0ac-c101e09676c5', N'androids/com.youku.phone/20140527231553.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'ffb5b69d-32ec-447f-98ef-224ace969170', N'94ebdd4b-cca4-4a36-9557-a85aee42ee66', N'androids/20131225023335.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'ffbc536d-5700-4c03-b817-6c1683ec77a7', N'4e24970f-32a4-4075-99f9-914f41dde52a', N'androids/20131225022850.jpg', NULL, NULL, NULL)
INSERT [dbo].[Role] ([RoleID], [Name], [Description]) VALUES (N'8C6945DC-362B-4612-BA6B-D959430164DF', N'系统管理员', NULL)
INSERT [dbo].[Role] ([RoleID], [Name], [Description]) VALUES (N'F39AA005-0E84-412F-B6D5-A0791BDDCD6F', N'普通用户', NULL)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'17D46C66-D7B4-4CBC-A705-AF8E806E23D9', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 3, CAST(0x0000A2E900F84828 AS DateTime), N'被异常终止', N'com.youku.phone', CAST(0x0000A2E900F7C4E8 AS DateTime), CAST(0x0000A2EA0115560C AS DateTime), 112)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'18F48CB5-E303-452F-A4A3-F45426402E00', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 3, CAST(0x0000A2E900F7CF74 AS DateTime), NULL, N'com.youku.phone', CAST(0x0000A2E900F7C4E8 AS DateTime), NULL, 9)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'1F988669-4DDB-4503-A19A-C04EDDE5E6C9', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 3, CAST(0x0000A2EA01155864 AS DateTime), N'正在运行', N'com.youku.phone', CAST(0x0000A2EA01155738 AS DateTime), NULL, 1)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'22EF8205-25E7-4B53-8496-B88D16DADD19', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 1, CAST(0x0000A2E900F4A5B0 AS DateTime), N'程序安装', N'com.youku.phone', CAST(0x0000A2E900F4A5B0 AS DateTime), CAST(0x0000A2E900F4A5B0 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'2AB360C4-2551-44E5-8312-E36497581FD5', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 2, CAST(0x0000A2EA0115560C AS DateTime), N'程序开始', N'com.youku.phone', CAST(0x0000A2EA0115560C AS DateTime), CAST(0x0000A2EA0115560C AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'435DC5B9-291F-4396-AF93-C107FBBA422F', N'ce839963-1436-4ef1-b121-e9586e6ab978', 1, CAST(0x0000A2E800FB4690 AS DateTime), N'程序安装', N'com.kuxun.scliang.plane', CAST(0x0000A2E800FB4690 AS DateTime), CAST(0x0000A2E800FB4690 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'438E7FBC-F933-47B8-A886-E7DD6CDC8D66', N'c0c8cb80-484a-4f08-8eaf-e1df9dbf7aa6', 1, CAST(0x0000A2EA0154C4B8 AS DateTime), N'被异常终止', N'com.czy.guandeng', CAST(0x0000A2EA0154C4B8 AS DateTime), CAST(0x0000A2EA0154D8A4 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'5B15EE9F-685E-4877-83D6-33B14394AA44', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 3, CAST(0x0000A2E900F84828 AS DateTime), N'正常停止', N'com.youku.phone', CAST(0x0000A2E900F7C4E8 AS DateTime), CAST(0x0000A2E900F84828 AS DateTime), 112)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'69FAB62A-7784-40C2-85DB-50A5397022A9', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 5, CAST(0x0000A2ED010CFEE4 AS DateTime), N'程序被移除', N'com.youku.phone', CAST(0x0000A2ED010CFEE4 AS DateTime), CAST(0x0000A2ED010CFEE4 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'84C5DDDF-5C80-40F5-8CB2-85C4C6BACF4D', N'ce839963-1436-4ef1-b121-e9586e6ab978', 1, CAST(0x0000A2E800FAFA64 AS DateTime), N'程序安装', N'com.kuxun.scliang.plane', CAST(0x0000A2E800FAFA64 AS DateTime), CAST(0x0000A2E800FAFA64 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'85385EC6-1815-49CC-9746-BD9CA65548F8', N'c0c8cb80-484a-4f08-8eaf-e1df9dbf7aa6', 3, CAST(0x0000A2EA0154FE24 AS DateTime), N'正在运行', N'com.czy.guandeng', CAST(0x0000A2EA0154D8A4 AS DateTime), NULL, 32)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'8572FF8D-F6F1-4076-8C15-F15856AAB019', N'ce839963-1436-4ef1-b121-e9586e6ab978', 5, CAST(0x0000A2E800FB430C AS DateTime), N'被异常终止', N'com.kuxun.scliang.plane', CAST(0x0000A2E800FB430C AS DateTime), CAST(0x0000A2E800FB4690 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'997348BC-9834-498C-9129-D25E3218407F', N'ce839963-1436-4ef1-b121-e9586e6ab978', 1, CAST(0x0000A2E800FAFA64 AS DateTime), N'被异常终止', N'com.kuxun.scliang.plane', CAST(0x0000A2E800FAFA64 AS DateTime), CAST(0x0000A2E800FB430C AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'9DA344A3-7533-4966-BA29-1026FF946E00', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 1, CAST(0x0000A2E900F4A5B0 AS DateTime), N'被异常终止', N'com.youku.phone', CAST(0x0000A2E900F4A5B0 AS DateTime), CAST(0x0000A2E900F7C4E8 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'C679F3AB-8917-46DE-AA2D-73FBDCC3C909', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 2, CAST(0x0000A2E900F7C4E8 AS DateTime), N'程序开始', N'com.youku.phone', CAST(0x0000A2E900F7C4E8 AS DateTime), CAST(0x0000A2E900F7C4E8 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'F9E989B8-F2F5-408D-8493-8CA5AE719CAE', N'c0c8cb80-484a-4f08-8eaf-e1df9dbf7aa6', 2, CAST(0x0000A2EA0154D8A4 AS DateTime), N'程序开始', N'com.czy.guandeng', CAST(0x0000A2EA0154D8A4 AS DateTime), CAST(0x0000A2EA0154D8A4 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'FAA5221F-62F1-4254-9BDC-0E79A90E71FE', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 3, CAST(0x0000A2EA01155864 AS DateTime), N'被异常终止', N'com.youku.phone', CAST(0x0000A2EA01155738 AS DateTime), CAST(0x0000A2ED010CFDB8 AS DateTime), 1)
INSERT [dbo].[User] ([UserId], [UserName], [LoginId], [Password], [RegTime], [LastLoginTime], [ErrorCount], [IsValid], [UpdateTime], [Mobile], [Telephone]) VALUES (N'C113B03E-4F41-42C2-A0DC-ED253A94C659', N'admin', N'admin', N'21232f297a57a5a743894a0e4a801fc3', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A2A600000000 AS DateTime), 0, 1, CAST(0x0000A2A600000000 AS DateTime), N'1', N'1')
INSERT [dbo].[User] ([UserId], [UserName], [LoginId], [Password], [RegTime], [LastLoginTime], [ErrorCount], [IsValid], [UpdateTime], [Mobile], [Telephone]) VALUES (N'D7D322B7-45E4-45BE-A650-28E3D7658614', N'user', N'user', N'21232F297A57A5A743894A0E4A801FC3', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A2A600000000 AS DateTime), 0, 1, CAST(0x0000A329016535C6 AS DateTime), N'1', N'1')
INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId]) VALUES (N'3E063212-6D54-4437-BF25-72DA7670699F', N'C113B03E-4F41-42C2-A0DC-ED253A94C659', N'8C6945DC-362B-4612-BA6B-D959430164DF')
INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId]) VALUES (N'505F0FBB-12FE-4362-8EB6-812C555C87B6', N'D7D322B7-45E4-45BE-A650-28E3D7658614', N'F39AA005-0E84-412F-B6D5-A0791BDDCD6F')
ALTER TABLE [dbo].[ActionPermissionRole]  WITH CHECK ADD  CONSTRAINT [FK_ControllerActionRole_ControllerAction] FOREIGN KEY([ActionPermissionId])
REFERENCES [dbo].[ActionPermission] ([ActionPermissionId])
GO
ALTER TABLE [dbo].[ActionPermissionRole] CHECK CONSTRAINT [FK_ControllerActionRole_ControllerAction]
GO
ALTER TABLE [dbo].[ActionPermissionRole]  WITH CHECK ADD  CONSTRAINT [FK_ControllerActionRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[ActionPermissionRole] CHECK CONSTRAINT [FK_ControllerActionRole_Role]
GO
ALTER TABLE [dbo].[ApplicationCategory]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationCategory_Application] FOREIGN KEY([Application_ApplicationID])
REFERENCES [dbo].[Application] ([ApplicationID])
GO
ALTER TABLE [dbo].[ApplicationCategory] CHECK CONSTRAINT [FK_ApplicationCategory_Application]
GO
ALTER TABLE [dbo].[ApplicationCategory]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationCategory_Category] FOREIGN KEY([Category_CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[ApplicationCategory] CHECK CONSTRAINT [FK_ApplicationCategory_Category]
GO
ALTER TABLE [dbo].[PCClient]  WITH CHECK ADD  CONSTRAINT [FK_PCClient_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[PCClient] CHECK CONSTRAINT [FK_PCClient_User]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
