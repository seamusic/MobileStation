USE [appstore]
GO
/****** Object:  Table [dbo].[ActionPermission]    Script Date: 2014/5/12 21:20:33 ******/
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
 CONSTRAINT [PK_ControllerAction] PRIMARY KEY CLUSTERED 
(
	[ActionPermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ActionPermissionRole]    Script Date: 2014/5/12 21:20:33 ******/
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
 CONSTRAINT [PK_ControllerActionRole] PRIMARY KEY CLUSTERED 
(
	[ActionPermissionRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Application]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[ApplicationEvaluate]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[ApplicationTag]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[AppType]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[AppUser]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[Driver]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[Mobile]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[MobileApp]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[MobileApplication]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[MobileClient]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[PCApp]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[PCClient]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[PCInstallLog]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[PhoneModel]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[Picture]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[RunLog]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[Statistics]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[Tag]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[UserMobile]    Script Date: 2014/5/12 21:20:33 ******/
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 2014/5/12 21:20:33 ******/
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
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'0DE01BAA-F7E5-4D95-94C8-BE8F7FA67A52', 1, N'F39AA005-0E84-412F-B6D5-A0791BDDCD6F', N'4ec9a13f-8a77-4f3f-a96a-83e6f9e9a4b6')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'26e2648f-bf0c-451f-9c44-cb62177693b6', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'35a33510-2115-404a-8daa-8e0cb5d1172a')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'3cf013a8-a669-4525-8ef7-f971eaa0d176', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'38c9553e-0cc3-49a1-89dd-af0d4ba462e1')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'4625B167-64EA-41DD-8FB3-635D328A1CEA', 1, N'F39AA005-0E84-412F-B6D5-A0791BDDCD6F', N'630c37e5-d536-4efc-96e2-a4c2f82e33ba')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'4aa00f02-5bab-4a7e-9cde-784f43da0206', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'25641dac-6ff6-4aff-9130-d7468e809b14')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'4cad79ff-c998-4fb8-90dc-38c319f5ae2b', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'f013cfd5-283f-49f1-8a1f-1fccb354f663')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'510108d9-1566-4f34-99aa-2bcc87b5fa16', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'8da95c38-e25c-4f17-ad3b-b45bbd0e5225')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'5ce4683c-913e-479e-b651-d6cb55b30bae', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'a57fb14a-0599-4709-90e3-0c882d0bbcea')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'648eb23b-6e1c-4f20-9b99-371ed342571f', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'fb97e961-d4cb-4695-917f-e20e912e5366')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'6514a9aa-ce5f-48ea-9e0a-b1b59733dd07', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'2c926588-8edf-4708-9f37-3fe07e9a8466')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'66819128-9632-4671-9CC5-3D99E4B4B9BF', 1, N'F39AA005-0E84-412F-B6D5-A0791BDDCD6F', N'2ad8e6cf-085d-4115-a40a-1dc2f0205289')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'6BA88154-F526-41F4-A794-6E2EB6F04B9F', 1, N'F39AA005-0E84-412F-B6D5-A0791BDDCD6F', N'38c9553e-0cc3-49a1-89dd-af0d4ba462e1')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'72cf4a3c-e2dd-4edb-b968-ff96901f70bc', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'72302591-a6f4-4992-a9da-83d1f556264d')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'76cc7169-7c07-4110-8631-27d52d6b8add', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'a8319b2a-4dd6-4808-92f4-8dfb56e93503')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'7ce55de1-6b29-4028-8aca-00587ea15fc3', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'acb3f2e7-3499-4587-89f2-e93ceedbc096')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'7dfa18e0-496f-44a7-9346-f15d68c25cf9', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'4ec9a13f-8a77-4f3f-a96a-83e6f9e9a4b6')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'84bbdbca-6619-4248-abce-979a0503cb9b', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'6dd2fb37-7fa0-44d4-a4cf-0db3778a31c0')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'8716e091-c252-495b-b120-260c38a4badc', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'630c37e5-d536-4efc-96e2-a4c2f82e33ba')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'9269b9c6-1eb6-4e05-82a0-0f612c964b63', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'9cf5d620-41af-429c-bc7a-3e1ccd6a7ed2')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'95097f71-662f-4b22-b1ce-871c619bd4d7', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'2ad8e6cf-085d-4115-a40a-1dc2f0205289')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'9a167212-4900-48a8-811a-6b3e451f7f15', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'49e44604-8ec1-430f-a2d2-8e870eaba4d1')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'9acee314-16ae-4070-9f30-1e56a1ff4614', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'a1500cf5-8d97-4ca0-96d1-c72f330b959c')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'a88b6eae-f284-4314-8532-cb839b50492d', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'a961e7a3-301c-473e-a367-331bb34c219f')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'ab14eb44-76b4-46bc-8074-c784e5159ba3', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'74a6ca3b-56a4-4d53-8cc4-e0591d7086f7')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'b07993a6-85f8-40a5-ab70-48bc42d34cb2', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'edacfbaa-020f-4275-b97d-758e1eb8409b')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'b52d13cc-afb9-464c-815d-4095b2fba2a7', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'7f9215d9-79ce-4f68-aa17-2b6339cfd24e')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'baddd150-b847-4ecc-9123-3262181c273c', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'9d3595e6-48cf-4da3-a5db-9e17a6f2ef8e')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'bb746d7a-cbf3-425f-a2ed-0593bd3c0997', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'b760175f-ad32-419e-84f8-21336d2be82a')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'bb75cab5-f034-4583-a830-8779d660f01e', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'd96f5d41-ad1f-469a-8537-5e145d3c7715')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'c00d857b-6e0a-4f61-bf75-3ce721220c95', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'a0e05e00-338c-460a-a76d-8d90fe8b047e')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'c4dc94ca-a846-48ae-9eea-74a392cb066e', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'f4ec0058-ffbb-47d7-9264-57bac83e7e5a')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'c6a2f17e-d89b-4257-bbdc-1e3f694faac0', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'769b8e84-6321-48ae-b4e0-8adf4a013e9a')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'D0FABF65-86D3-4D50-A61F-ED4DF55EFBF6', 1, N'F39AA005-0E84-412F-B6D5-A0791BDDCD6F', N'8da95c38-e25c-4f17-ad3b-b45bbd0e5225')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'D5CB2D55-EE3B-4975-8E44-C7116324169B', 1, N'F39AA005-0E84-412F-B6D5-A0791BDDCD6F', N'fb97e961-d4cb-4695-917f-e20e912e5366')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'd7d06787-5f41-4722-b159-d7b4066313d4', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'24cb3e43-c325-4d10-868a-62c418d9e0d9')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'd9fa8ee3-b0ef-470d-a18e-5058b8ff1a85', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'51e104dd-38b9-4668-a953-4c1b2403b400')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'da69b600-71a8-4efc-90af-b02d77578ab8', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'1a6f2c0b-87c0-4b0c-b175-1a01383d6312')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'f3989d69-7836-45a9-b607-40ad7895b120', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'b109676f-cb58-47b4-b82f-93dd6d52344c')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'fa9f1c8f-d934-4e2a-996a-a4ef4208e793', 1, N'8C6945DC-362B-4612-BA6B-D959430164DF', N'12182d2e-8943-4cd4-bd8d-64ba975d8a8c')
INSERT [dbo].[ActionPermissionRole] ([ActionPermissionRoleId], [IsAllowed], [RoleId], [ActionPermissionId]) VALUES (N'FBD836C7-48B0-414A-8F78-FD12563DB8BC', 1, N'F39AA005-0E84-412F-B6D5-A0791BDDCD6F', N'edacfbaa-020f-4275-b97d-758e1eb8409b')
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'4EB67F60-376F-458D-B337-1BDBF7041421', N'eb8e1162-3e47-4757-a9e8-96414be13a83', NULL, 1, N'日程记事本', N'androids/20131225020403.jpg', N'1.1', N'1976810', N'<span style="color:#555555;font-family:Arial;line-height:25px;">又是一年圣诞节，你有没有收到心仪的礼物？小虾米为你精心准备的圣诞大礼－全新的虾米音乐2014版诚邀下载体验啦！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">&nbsp;</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">这一年来，虾米始终秉承着对音乐的高品质追求,期望以此满足最亲爱的你能遇见更多的好音乐。</span><br />', N'dsf', NULL, 1, CAST(0x0000A29F00225528 AS DateTime), 0, 1, 1, CAST(5.00 AS Decimal(5, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'androids/20131225020351.png', 7, CAST(0x0000A29F00225528 AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'4D0CB6EC-9671-42CD-B532-BF723EB08CCA', N'4A73829C-E487-4642-9D65-0B4F0E14D780', NULL, 1, N'微信', N'androids/com.zecurisoft.mhc1202/20131225015931.jpg', N'2.3.196', N'650766', N'<div class="font16 soft_pad_f" style="margin:0px;padding:20px 0px 10px;font-size:16px;color:#333333;font-family:微软雅黑;">
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
</div>', NULL, NULL, 1, CAST(0x0000A29F002109AA AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.zecurisoft.mhc1202', N'[object Object]', NULL, NULL, NULL, NULL, N'androids/com.zecurisoft.mhc1202/20131224103112.png', 6, CAST(0x0000A29F002109AA AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'76ADBC47-A689-4369-A4B0-27EEA3AE3F8F', N'4A73829C-E487-4642-9D65-0B4F0E14D780', NULL, 1, N'DGT', NULL, N'0.0.78', N'1766028', N'564165494546549846546546', NULL, N'Androids/com.dg.gtd.android.lite/android_0.0.78.apk', 1, CAST(0x0000A28E00EB5AAF AS DateTime), 0, 0, 1, CAST(5.00 AS Decimal(5, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(0x0000A28E00EB5AAF AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'D46899BE-78DF-4A7D-A618-143CB7268843', N'4A73829C-E487-4642-9D65-0B4F0E14D780', NULL, 1, N'WeSync', NULL, N'4.5', N'2420374', NULL, NULL, N'', 1, CAST(0x0000A28E012573B9 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.tencent.qqpim', NULL, N'D:\Projects\PartTime\应用商城\src\AppStore\AppStore.Manage\Content\Upload\APK\com.tencent.qqpim\com.tencent.qqpim_4.5.apk', NULL, NULL, NULL, NULL, 2, CAST(0x0000A28E012573B9 AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'6338B9D6-CA94-41E3-8AEA-365AE595F772', N'4A73829C-E487-4642-9D65-0B4F0E14D780', NULL, 1, N'DGT GTD', NULL, N'0.0.78', N'1766028', N'cc', NULL, N'Androids/com.dg.gtd.android.lite/android_0.0.78.apk', 1, CAST(0x0000A298000DBDC1 AS DateTime), 0, 1, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.dg.gtd.android.lite', NULL, N'D:\Projects\Parttime\应用商城\src\AppStore\AppStore.Manage\Content\UploadFile\Androids\com.dg.gtd.android.lite\android_0.0.78.apk', N'Androids/com.dg.gtd.android.lite/android_0.0.78.apk', NULL, NULL, NULL, 3, CAST(0x0000A298000DBDC1 AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'F29E07D6-CE5F-4F1F-A71B-A57A7A841391', N'4A73829C-E487-4642-9D65-0B4F0E14D780', NULL, 1, N'微博', NULL, N'4.1.5', N'21048499', N'<span style="color:#555555;font-family:Arial;line-height:25px;"><span style="color:#666666;font-family:宋体;line-height:22px;background-color:#F6F6F6;">新浪微博是一个由新浪网推出，提供微型博客服务的类Twitter网站。用户可以通过手机客户端发布消息或上传图片。可以把微博理解为''微型博客''或者''一句话博客''。用户可以将看到的、听到的、想到的事情写成一句话，或发一张图片，通过电脑或者手机随时随地分享给朋友，一起分享、讨论；还可以关注朋友，即时看到朋友们发布的信息。 </span><br />
<br />
<span style="color:#666666;font-family:宋体;line-height:22px;background-color:#F6F6F6;">v4.1.5更新：&nbsp;</span><br />
<span style="color:#666666;font-family:宋体;line-height:22px;background-color:#F6F6F6;">1.分享到微信朋友圈和来往。</span><br />
<span style="color:#666666;font-family:宋体;line-height:22px;background-color:#F6F6F6;">2.支持删除未关注人私信。</span><br />
<span style="color:#666666;font-family:宋体;line-height:22px;background-color:#F6F6F6;">3.新增未关注人私信消息提醒开关。</span><br />
<span style="color:#666666;font-family:宋体;line-height:22px;background-color:#F6F6F6;">4.修复部分音乐分享失败的问题。</span></span>', NULL, NULL, 1, CAST(0x0000A29E00ABF60E AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.sina.weibo', NULL, N'D:\Projects\PartTime\应用商城\src\AppStore\AppStore.Manage\Content\UploadFile\Androids\com.sina.weibo\android_4.1.5.apk', N'Androids/com.sina.weibo/android_4.1.5.apk', NULL, NULL, N'androids/com.sina.weibo/20131224102602.png', 5, CAST(0x0000A29E00ABF60E AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'278F4841-5E47-4B5E-A3A1-2BFCFA411FA0', N'4A73829C-E487-4642-9D65-0B4F0E14D780', NULL, 1, N'QQ', N'androids/com.tencent.mobileqq/20131224100605.jpg', N'4.5.2', N'28608733', N'<span style="color:#555555;">手机QQ是由腾讯公司打造的移动互联网应用,提供免费的多媒体沟通服务,方便用户在移动设备上通过语音,图片,视频等方式轻松交流.手机QQ,只想与你更接近.&nbsp;</span>', NULL, NULL, 1, CAST(0x0000A29E00A67E66 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.tencent.mobileqq', NULL, N'D:\Projects\PartTime\应用商城\src\AppStore\AppStore.Manage\Content\UploadFile\Androids\com.tencent.mobileqq\android_4.5.2.apk', N'Androids/com.tencent.mobileqq/android_4.5.2.apk', NULL, NULL, N'androids/com.tencent.mobileqq/20131224100547.png', 4, CAST(0x0000A29E00A67E66 AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'fe78dad1-a412-47c6-ba22-167a1c5167cd', N'EE7BD005-18F6-44D6-959D-20C4455F9C99', NULL, 2, N'Nipple', NULL, N'1.0.1', N'3132515', N'压根34234234', NULL, NULL, 1, CAST(0x0000A28E00EAD56B AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(0x0000A28E00EAD56B AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'ace71cc4-af3a-4518-a800-79d4bc31b875', N'EE7BD005-18F6-44D6-959D-20C4455F9C99', NULL, 2, N'QQGame', N'androids/20131225021932.jpg', N'2.4.2', N'4749197', N'<span style="color:#555555;font-family:Arial;line-height:25px;">QQ游戏2.3全新改版，快乐继续！&nbsp;QQ游戏，中国手机游戏第一入口！&nbsp;全新精品游戏平台2.0华丽蜕变！&nbsp;手机在变，游戏在变，快乐未曾改变！</span>', NULL, N'Androids/com.tencent.qqgame/android_2.4.2.apk', 1, CAST(0x0000A29F0026DF7A AS DateTime), 0, 1, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.tencent.qqgame', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.tencent.qqgame\android_2.4.2.apk', N'Androids/com.tencent.qqgame/android_2.4.2.apk', NULL, NULL, N'androids/com.tencent.qqgame/20131225022128.png', 10, CAST(0x0000A29F0026DF7A AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'4657e5c8-ce93-406b-a3d9-1e4f941cdd2f', N'EE7BD005-18F6-44D6-959D-20C4455F9C99', NULL, 2, N'关灯', N'androids/20131225022039.jpg', N'1.2.89', N'1444149', N'<span style="color:#555555;font-family:Arial;line-height:25px;">中国最大的手机游戏平台，让您尽享指尖上的快乐！</span>', NULL, N'Androids/com.czy.guandeng/android_1.2.89.apk', 1, CAST(0x0000A29F0026B70C AS DateTime), 0, 1, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.czy.guandeng', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.czy.guandeng\android_1.2.89.apk', N'Androids/com.czy.guandeng/android_1.2.89.apk', NULL, NULL, N'androids/20131225022029.png', 9, CAST(0x0000A29F0026B70C AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'9f4f5b65-95c3-463c-9938-8ba15af5b4bd', N'58e69005-64c2-4a64-b72b-65b2916e0506', NULL, 3, N'139邮箱', N'androids/20131225022433.jpg', N'5.81', N'6357799', N'<span style="color:#555555;font-family:Arial;line-height:25px;">产品介绍：</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">1.手机变邮箱，沟通更方便!139邮箱手机客户端让您在手机上轻松完成邮件收发、回复及转发等操作，速度快，省流量，支持多种格式附件下载与上传。脱离电脑也能收发自如。</span>', NULL, N'Androids/cn.cj.pe/android_5.81.apk', 1, CAST(0x0000A29F0027CF20 AS DateTime), 0, 1, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'cn.cj.pe', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\cn.cj.pe\android_5.81.apk', N'Androids/cn.cj.pe/android_5.81.apk', NULL, NULL, N'androids/20131225022414.png', 2, CAST(0x0000A29F0027CF20 AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'a1915d0f-1078-4a78-87ca-45df70786cfa', N'58e69005-64c2-4a64-b72b-65b2916e0506', NULL, 3, N'1号店', N'androids/20131225022544.png', N'3.1.0', N'8083888', N'<span style="color:#555555;font-family:Arial;line-height:25px;">网购神器——掌上1号店手机客户端3.1版本华丽登场！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">把一座大型超市轻松地装进你的手机，美食、百货、3C数码、服装样样齐全，动动手指就送到您家，为您省钱省力更省时间！</span>', NULL, N'Androids/com.thestore.main/android_3.1.0.apk', 1, CAST(0x0000A29F00282371 AS DateTime), 0, 1, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.thestore.main', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.thestore.main\android_3.1.0.apk', N'Androids/com.thestore.main/android_3.1.0.apk', NULL, NULL, N'androids/20131225022530.png', 1, CAST(0x0000A29F00282371 AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'4e24970f-32a4-4075-99f9-914f41dde52a', N'4A73829C-E487-4642-9D65-0B4F0E14D780', NULL, 1, N'搜狗输入法', N'androids/20131225022848.jpg', N'5.2', N'11958385', N'<span style="color:#555555;font-family:Arial;line-height:25px;">搜狗手机输入法以提升用户体验为宗旨，致力于为亿万手机用户提供手机端最智能、最易用的输入法产品。拥有40万超大词库、算法智能、首选率高、响应速度快等优秀基础品质。搜狗工具箱新增多项扩展功能，全方位拓展输入内容。同时，支持整句输入、英文候选、智能云输入、多媒体输入、二维码识别、表情输入等众多特色功能；且兼容PC皮肤，电脑有多炫，手机就有多炫！完美兼容不同手机及PAD型号。手机输入，依然搜狗！</span>', NULL, N'Androids/com.sohu.inputmethod.sogou/android_5.2.apk', 1, CAST(0x0000A29F0028FC0A AS DateTime), 0, 0, 1, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.sohu.inputmethod.sogou', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.sohu.inputmethod.sogou\android_5.2.apk', N'Androids/com.sohu.inputmethod.sogou/android_5.2.apk', NULL, NULL, N'androids/20131225022834.png', 8, CAST(0x0000A29F0028FC0A AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'cbc93c32-f410-4403-badd-f00edb52a36f', N'58e69005-64c2-4a64-b72b-65b2916e0506', NULL, 3, N'酷讯机票', N'androids/20131225023111.jpg', N'4.4.4', N'5978078', N'0.0', NULL, N'Androids/com.kuxun.scliang.plane/android_4.4.4.apk', 1, CAST(0x0000A29F002991CD AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.kuxun.scliang.plane', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.kuxun.scliang.plane\android_4.4.4.apk', N'Androids/com.kuxun.scliang.plane/android_4.4.4.apk', NULL, NULL, N'androids/20131225023042.png', 4, CAST(0x0000A29F002991CD AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'94ebdd4b-cca4-4a36-9557-a85aee42ee66', N'58e69005-64c2-4a64-b72b-65b2916e0506', NULL, 3, N'讯飞输入法手机版', N'androids/20131225023333.jpg', N'4.0.1456', N'6972559', N'<span style="color:#555555;font-family:Arial;line-height:25px;">最受用户好评的手机输入法，1亿用户正在使用，Android手机装机必备软件！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">全球首创“蜂巢”输入模型，独家支持拼音、手写、语音“云+端”立体输入引擎！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">采用第三代离线语音识别引擎，语音输入无需流量，识别准确率、速度全面提升！</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">思想有多快，输入就有多快！讯飞输入法，创造极致输入体验。</span>', NULL, N'Androids/com.iflytek.inputmethod/android_4.0.1456.apk', 1, CAST(0x0000A29F002A6020 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.iflytek.inputmethod', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.iflytek.inputmethod\android_4.0.1456.apk', N'Androids/com.iflytek.inputmethod/android_4.0.1456.apk', NULL, NULL, N'androids/20131225023312.png', 5, CAST(0x0000A29F002A6020 AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'f3d1dc44-5303-4d93-b0e9-72a17c4e6b8e', N'EE7BD005-18F6-44D6-959D-20C4455F9C99', NULL, 2, N'Fruit Ninja', N'androids/20131225023556.JPG', N'1.8.8.2', N'24364967', N'<span style="color:#555555;font-family:Arial;line-height:25px;">人人都爱切水果！国民级休闲手游《水果忍者》迎来三周年华诞，全新乐逗定制版华丽登场。万人狂欢的任务系统，神秘非凡的庆典水果，只要集齐刻有特殊字体的庆典水果就可以获得丰厚的游戏奖励，集齐金色苹果更有机会参与抽奖，赢取“土豪金”iPhone5s大奖！……这一切都汇聚成《水果忍者》三周年特别版。</span>', NULL, N'Androids/com.halfbrick.fruitninja/android_1.8.8.2.apk', 1, CAST(0x0000A29F002AFB32 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.halfbrick.fruitninja', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.halfbrick.fruitninja\android_1.8.8.2.apk', N'Androids/com.halfbrick.fruitninja/android_1.8.8.2.apk', NULL, NULL, N'androids/20131225023540.png', 16, CAST(0x0000A29F002AFB32 AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'ebf14ddf-4d89-45e2-9958-ec7a75686306', N'58e69005-64c2-4a64-b72b-65b2916e0506', NULL, 3, N'手机驿站', NULL, N'2.0', N'510452', N'<p>
	手机驿站
</p>', NULL, N'Androids/com.mobilestation/android_2.0.apk', 0, CAST(0x0000A2A901280930 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.mobilestation', N'[object Object]', NULL, N'Androids/com.mobilestation/android_2.0.apk', N'2.2', N'8', NULL, 20, CAST(0x0000A2A901280930 AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'1398ab8e-d6d2-4bbf-ba30-e90192640e8e', N'4A73829C-E487-4642-9D65-0B4F0E14D780', NULL, 1, N'QQ空间', N'androids/20131225023726.jpg', N'4.2.3.103', N'14641486', N'qq', NULL, N'Androids/com.qzone/android_4.2.3.103.apk', 1, CAST(0x0000A29F002B4F4C AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.qzone', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.qzone\android_4.2.3.103.apk', N'Androids/com.qzone/android_4.2.3.103.apk', NULL, NULL, N'androids/20131225023705.png', 9, CAST(0x0000A29F002B4F4C AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'4acae024-6791-4ab6-ac50-f633b4202d20', N'58e69005-64c2-4a64-b72b-65b2916e0506', NULL, 3, N'百度地图', N'androids/20131225024231.JPG', N'6.5.1', N'13508674', N'<span style="color:#555555;font-family:Arial;line-height:25px;">用百度地图，快速定位你的位置，探索周边美食娱乐。</span><br />
<span style="color:#555555;font-family:Arial;line-height:25px;">不但可以找位置，还能帮你“到那去“，公交、驾车、步行三种出行方式任你选择，还有蚯蚓路线、免费语音导航、时间胶囊让你出行无忧</span>', NULL, N'Androids/com.baidu.BaiduMap/android_6.5.1.apk', 1, CAST(0x0000A29F002CC419 AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.baidu.BaiduMap', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.baidu.BaiduMap\android_6.5.1.apk', N'Androids/com.baidu.BaiduMap/android_6.5.1.apk', NULL, NULL, N'androids/20131225024041.png', 6, CAST(0x0000A29F002CC419 AS DateTime))
INSERT [dbo].[Application] ([ApplicationID], [CategoryID], [BrandID], [AppType], [ApplicationName], [PictureUrl], [Version], [Size], [Description], [OfficialWebsite], [DownloadUrl], [IsValid], [UpdateTime], [Total], [IsRecommend], [IsNecessary], [Score], [Checksum], [PackageName], [ApkInfo], [ServerPath], [RelativePath], [OSVersion], [SDKVersion], [Icon], [Seq], [CreateTime]) VALUES (N'e64504e8-45b5-4ab7-8926-ff182baf7513', N'58e69005-64c2-4a64-b72b-65b2916e0506', NULL, 3, N'优酷', N'androids/20131225024359.JPG', N'3.5.1', N'14762031', N'<span style="color:#555555;font-family:Arial;line-height:25px;">优酷—中国第一视频网站，为你提供电视剧,电影,动漫,音乐,新闻,娱乐,游戏,搞笑等海量影视，高清流畅播放&nbsp;极速离线缓存，支持微博、微信、朋友圈一键分享。新版App增加全网搜索功能，土豆、奇艺、搜狐、腾讯、PPS、PPTV等精彩视频360度全方位一手掌握！</span>', NULL, N'Androids/com.youku.phone/android_3.5.1.apk', 1, CAST(0x0000A29F002D193A AS DateTime), 0, 0, 0, CAST(5.00 AS Decimal(5, 2)), NULL, N'com.youku.phone', N'[object Object]', N'D:\IISWeb\AppStore\Manage\Content\UploadFile\Androids\com.youku.phone\android_3.5.1.apk', N'Androids/com.youku.phone/android_3.5.1.apk', NULL, NULL, N'androids/20131225024333.png', 3, CAST(0x0000A29F002D193A AS DateTime))
INSERT [dbo].[AppType] ([AppTypeID], [AppTypeName], [Count], [Description]) VALUES (1, N'应用工具', 0, NULL)
INSERT [dbo].[AppType] ([AppTypeID], [AppTypeName], [Count], [Description]) VALUES (2, N'游戏娱乐', 0, NULL)
INSERT [dbo].[AppType] ([AppTypeID], [AppTypeName], [Count], [Description]) VALUES (3, N'装机必备', 0, NULL)
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'f644706b-2ea8-4fc5-9cd1-84dd084f409c', N'HTC/宏达电', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A2950030F4F6 AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'a221427f-a15d-4176-a76c-4ea8d0530efa', N'Samsung/三星', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A29500310261 AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'b190582b-ffac-488e-8cc4-d6109b43b142', N'Nokia/诺基亚', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A295003139CD AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'ad1a018e-127b-47a2-bb3c-adf370a787f9', N'Huawei/华为', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A2950030E5F7 AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'eca334a8-3b84-4750-9224-c5cd80a2a4c1', N'ZTE/中兴', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A295004576BD AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'251fc9da-f0d1-43a1-8b53-7c5c75ce076a', N'Miui/小米', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A295003124DA AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'87b30516-021c-47c0-9776-2885ea737998', N'Meizu/魅族', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A29500315598 AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'ced539a1-8f8e-4c09-aea4-59afb60abdb8', N'Lenovo/联想', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A29500314807 AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'd3204542-4510-4e09-bf51-e5809e4cd750', N'Sony/索尼', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A29500309E6B AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'5f2853f1-f445-41f1-b1c0-ec1778e426aa', N'Coolpad/酷派', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A2950030AD78 AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'3649dd5c-1cb8-4eac-98be-17328a984d63', N'Bbk/步步高', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A2950030BE59 AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'e908f7ae-6770-4347-b94e-0ac26f4b7ac6', N'K-Touch/天语', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A2950030CF3B AS DateTime))
INSERT [dbo].[Brand] ([BrandID], [BrandName], [BrandType], [Mobile], [Telephone], [Addr], [Url], [Linkman], [Description], [UpdateTime]) VALUES (N'925296a3-db4c-48fb-bd4d-6865edd17e20', N'Motorola/摩托罗拉', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A295003115B6 AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'4A73829C-E487-4642-9D65-0B4F0E14D780', 1, N'系统管理', NULL, 0, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'EE7BD005-18F6-44D6-959D-20C4455F9C99', 2, N'休闲娱乐', NULL, 0, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'eeb2be68-0088-4c0c-a2f6-3ed5a5140d65', 2, N'棋牌桌游', NULL, 1, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'eb8e1162-3e47-4757-a9e8-96414be13a83', 1, N'社交聊天', NULL, 2, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'58e69005-64c2-4a64-b72b-65b2916e0506', 3, N'快速装机', NULL, 1, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'532fbff5-d696-4342-9ba2-29660ae4a669', 3, N'手机生活', NULL, 2, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'b812423c-4275-4f83-b04f-6d4d2c6b33b4', 3, N'女生必备', NULL, 3, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'763a429a-028e-4e82-8ed1-97ef095eff58', 3, N'男生必备', NULL, 4, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'a3d3be1d-ea35-4859-8724-dd6d6a1a4034', 3, N'单机游戏', NULL, 5, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'bdc77592-3634-43f4-8d09-03b54ced2a8c', 1, N'实用工具', NULL, 3, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'd0f65176-7298-4acb-bf29-b3d80aa4c430', 1, N'地图导航', NULL, 4, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'54aa4130-4226-4e22-9cc9-eb81b89c721e', 1, N'影音娱乐', NULL, 5, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'a954360c-a320-4221-b760-3a2b063ebf33', 1, N'手机生活', NULL, 6, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'7e18ed61-c2c4-4682-bc58-8ef4be33e018', 1, N'健康生活', NULL, 7, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'52bc0731-d383-4f1f-be60-338865c9443f', 2, N'RPG冒险', NULL, 3, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'5891d0aa-c015-4881-8100-46d997feba2e', 2, N'动作射击', NULL, 4, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'8cc187c0-6a95-49b5-96fb-0ddab5a27ce5', 2, N'策略益智', NULL, 5, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'6cf25e1b-2bbf-4ec5-a4bb-a4b4a2482479', 2, N'竞速体育', NULL, 6, NULL)
INSERT [dbo].[Category] ([CategoryID], [AppTypeID], [CategoryName], [ParentID], [Seq], [ENName]) VALUES (N'76cb7c01-d1d5-4543-8133-fd7cb80e81a9', 2, N'单机游戏', NULL, 7, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'd09ca78d-efab-4651-a387-274de0a241a5', N'三星S2', N'Drivers/d09ca78d-efab-4651-a387-274de0a241a5/SAMSUNGUSBDriverSetUp.exe', N'1.1.1', CAST(0x0000A2A9012C023F AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'B06C04AA-6327-4E8C-946B-2EA219876E0E', N'Google Nexus_Universal', N'Drivers/Google/Nexus_Universal_Naked_Driver.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'AB904EA2-3E42-4910-BF01-378B68D8D07F', N'Google NS', N'Drivers/Google/ns_driver.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'696E5A54-DCA7-4F2D-8215-CFB2662FD021', N'HTC', N'Drivers/HTC/htc_drv_200070014_32.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'D1DFD8E6-6C2C-4DB0-891A-85371DE52154', N'步步高 MT', N'Drivers/Vivo/vivo_MT.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'D8C8CBBA-8CF0-4D5C-978E-668144D10E0B', N'步步高 Qualcomm', N'Drivers/Vivo/vivo_Qualcomm.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'DB55377C-9D93-4FD0-8390-477DB8CFC270', N'Hawei hwu8150', N'Drivers/hawei/hwu8150.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'9D7E5A3C-E626-4C7B-BF60-86BEA324CD52', N'Hawei U8650', N'Drivers/hawei/pc6-hwU8650qd.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'B0DFD71F-E4A4-41B0-8379-9CAD88C531C7', N'Hawei t8600', N'Drivers/hawei/T8600_OMS_Driver_1.0.0.10.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'9664F4D2-6510-467E-B6DA-D48EE5CC1255', N'Coolpad E230', N'Drivers/hawei/Coolpad_E230_110524.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'F5996D71-6005-48D8-BFB1-D45E29E3FC06', N'Coolpad N930', N'Drivers/hawei/Coolpad_N930_110524.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'FB7A9401-AF3C-4A77-BC0B-CF3068BDB45E', N'Coolpad D530', N'Drivers/hawei/coolpadd530.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'3942E053-F395-4781-9DFB-B3180EDB3001', N'联想 I380', N'Drivers/Lenovo/lenovo_i380_drivers107.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'1A082BBC-9E71-46D8-855D-5E6774D0F234', N'联想 P709', N'Drivers/Lenovo/lenovo_P709.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'FC0EB244-A92B-4364-8D9D-23DB551448BA', N'联想 USBEts', N'Drivers/Lenovo/LenovoUsbEts.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'E1C8F898-5142-49F4-B29C-A17B022BC1D6', N'联想 UsbHub', N'Drivers/Lenovo/LenovoUsbHub.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'B704B5EC-FE6C-4F58-BBAC-B0C64AB9E0B8', N'联想 UsbModem', N'Drivers/Lenovo/LenovoUsbModem.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'152B9B04-FFBD-41AF-A050-62D6C402AF07', N'Meizu', N'Drivers/Meizu/MeizuUSB.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'40FF20AA-C299-416E-A242-0BA204CC5F5A', N'Samsung adb 1.7', N'Drivers/samsung/samsung_adb_1.7.exe', N'1.7', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'6855034A-F905-4A85-A0CD-306E366ED46A', N'Samsung Android 4.0', N'Drivers/samsung/Samsung_Android_4.0_usbdrivers.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'B163B6E7-FF33-4965-9BD2-9D8201C1C8B4', N'Samsung EMP Chipset2', N'Drivers/samsung/Samsung_EMP_Chipset2.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'4C2E3B7E-8020-4779-B433-3A7345E04BB5', N'Samsung EMP Chipset', N'Drivers/samsung/Samsung_EMPChipset.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'3C403D58-3D97-4D34-B83F-270C61E265F1', N'Samsung Hsp', N'Drivers/samsung/Samsung_Hsp.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'237A653E-9854-4B99-A97F-EC378FA9E26F', N'Samsung Hsp Plus', N'Drivers/samsung/Samsung_HSP_Plus_Default.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'3A675D08-6D03-4939-A0FA-4D15EF2FAE3F', N'Samsung Schorl', N'Drivers/samsung/Samsung_Schorl.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'83ECE841-6E6D-405E-A14E-6F994D9BBA40', N'Samsung Searsburg', N'Drivers/samsung/Samsung_Searsburg.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'DA950176-927C-4C5C-8952-8E641D18DC6A', N'Samsung Shrewsbury', N'Drivers/samsung/Samsung_Shrewsbury.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'2518E524-67B2-43FB-986C-584B8FAB117E', N'Samsung Siberian', N'Drivers/samsung/Samsung_Siberian.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'14F1A42A-1DCF-419A-9B01-A53717060ABE', N'Samsung Simmental', N'Drivers/samsung/Samsung_Simmental.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'BC8DFC15-F90E-4A4D-BAA2-BD8C834E796F', N'Samsung Sloan', N'Drivers/samsung/Samsung_Sloan.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'46D62AB8-836A-459B-A731-2E0741665045', N'Samsung Spencer', N'Drivers/samsung/Samsung_Spencer.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'79A4F7B8-DE87-4428-961E-2A220004336C', N'Samsung Swallotail', N'Drivers/samsung/Samsung_Swallowtail.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'EBF87FCC-D341-4BA8-AAF3-50A36C48DD2E', N'Samsung WiMax', N'Drivers/samsung/Samsung_WiBro_WiMAX.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Driver] ([DriverID], [DriverName], [DownloadUrl], [Version], [UpdateTime], [Description]) VALUES (N'5FF16DB7-7609-4AAD-9379-E962641F9DB6', N'Samsung Zinia Seral', N'Drivers/samsung/Samsung_Zinia_Serial_Driver.exe', N'1.0', CAST(0x0000A2A3015BD8C9 AS DateTime), N'EW')
INSERT [dbo].[Mobile] ([MobileID], [DriverID], [MobileName], [Brand], [Model], [System], [Version], [PictureUrl], [MemorySize], [CPU], [ScreenSize], [Resolution], [UpdateTime], [PID], [VID]) VALUES (N'930d1d63-9692-4253-9b7d-6a438f1f8cf8', N'd09ca78d-efab-4651-a387-274de0a241a5', N'三星S1', NULL, N'66', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A29500283E11 AS DateTime), N'681c', N'04e8')
INSERT [dbo].[MobileApp] ([MobileAppID], [ApplicationID], [MobileClientID], [Installer], [CreateTime], [FirstTime], [SecondTime], [Totaltime], [UpdateTime], [AddTime], [RemoveTime], [PackageName], [IsSync], [IsSys], [Frequency]) VALUES (N'4c22be99-1b96-46b3-8b3a-645798d9bc62', N'a1915d0f-1078-4a78-87ca-45df70786cfa', N'5c5d5f08-3cca-4a48-8ee3-35f46af8c3b6', N'PC', CAST(0x0000A2A90169569A AS DateTime), NULL, NULL, 0, CAST(0x0000A2AA017E17FC AS DateTime), CAST(0x0000A2AA00F97C5C AS DateTime), NULL, N'com.thestore.main', 1, 1, 0)
INSERT [dbo].[MobileApp] ([MobileAppID], [ApplicationID], [MobileClientID], [Installer], [CreateTime], [FirstTime], [SecondTime], [Totaltime], [UpdateTime], [AddTime], [RemoveTime], [PackageName], [IsSync], [IsSys], [Frequency]) VALUES (N'096f1161-5677-48eb-b1c1-b25f58ab8853', N'9f4f5b65-95c3-463c-9938-8ba15af5b4bd', N'5c5d5f08-3cca-4a48-8ee3-35f46af8c3b6', N'PC', CAST(0x0000A2A9016960D0 AS DateTime), NULL, NULL, 0, CAST(0x0000A2AA017E17FD AS DateTime), CAST(0x0000A2AA00F97C5C AS DateTime), NULL, N'cn.cj.pe', 1, 1, 0)
INSERT [dbo].[MobileApp] ([MobileAppID], [ApplicationID], [MobileClientID], [Installer], [CreateTime], [FirstTime], [SecondTime], [Totaltime], [UpdateTime], [AddTime], [RemoveTime], [PackageName], [IsSync], [IsSys], [Frequency]) VALUES (N'414e299e-6cfb-48c9-ae51-c0ee68ca00a3', N'e64504e8-45b5-4ab7-8926-ff182baf7513', N'5c5d5f08-3cca-4a48-8ee3-35f46af8c3b6', N'PC', CAST(0x0000A2A901697486 AS DateTime), NULL, NULL, 0, CAST(0x0000A2AA017E17FD AS DateTime), CAST(0x0000A2AA00F97C5C AS DateTime), NULL, N'com.youku.phone', 1, 1, 0)
INSERT [dbo].[MobileApp] ([MobileAppID], [ApplicationID], [MobileClientID], [Installer], [CreateTime], [FirstTime], [SecondTime], [Totaltime], [UpdateTime], [AddTime], [RemoveTime], [PackageName], [IsSync], [IsSys], [Frequency]) VALUES (N'790cacfb-60c1-4b24-9604-fc979f643c2a', N'4acae024-6791-4ab6-ac50-f633b4202d20', N'5c5d5f08-3cca-4a48-8ee3-35f46af8c3b6', N'PC', CAST(0x0000A2A9016988FE AS DateTime), NULL, NULL, 0, CAST(0x0000A2AA017E17FD AS DateTime), CAST(0x0000A2AA00F97C5C AS DateTime), NULL, N'com.baidu.BaiduMap', 1, 1, 0)
INSERT [dbo].[MobileApp] ([MobileAppID], [ApplicationID], [MobileClientID], [Installer], [CreateTime], [FirstTime], [SecondTime], [Totaltime], [UpdateTime], [AddTime], [RemoveTime], [PackageName], [IsSync], [IsSys], [Frequency]) VALUES (N'289ddac3-01aa-4bd4-bb72-4edab71963b2', N'94ebdd4b-cca4-4a36-9557-a85aee42ee66', N'5c5d5f08-3cca-4a48-8ee3-35f46af8c3b6', N'PC', CAST(0x0000A2A9016995E5 AS DateTime), NULL, NULL, 0, CAST(0x0000A2AA017E17FE AS DateTime), CAST(0x0000A2AA00F97C5C AS DateTime), NULL, N'com.iflytek.inputmethod', 1, 1, 0)
INSERT [dbo].[MobileApp] ([MobileAppID], [ApplicationID], [MobileClientID], [Installer], [CreateTime], [FirstTime], [SecondTime], [Totaltime], [UpdateTime], [AddTime], [RemoveTime], [PackageName], [IsSync], [IsSys], [Frequency]) VALUES (N'7e35644a-b10e-42d1-b3d0-7e6a6b3af6c0', N'cbc93c32-f410-4403-badd-f00edb52a36f', N'5c5d5f08-3cca-4a48-8ee3-35f46af8c3b6', N'PC', CAST(0x0000A2A90169B47D AS DateTime), NULL, NULL, 0, CAST(0x0000A2AA017E17FE AS DateTime), CAST(0x0000A2AA00F97C5C AS DateTime), NULL, N'com.kuxun.scliang.plane', 1, 1, 0)
INSERT [dbo].[MobileClient] ([MobileClientID], [PhoneModelID], [PCClientID], [ClientName], [ClientMac], [ClientKey], [Description], [UpdateTime], [CreateTime]) VALUES (N'5c5d5f08-3cca-4a48-8ee3-35f46af8c3b6', NULL, N'6328b4dd-cb83-4910-ac16-2f8391c83ede', N'系统版本:4.2.2,厂商HTC', NULL, N'356299048187817', NULL, CAST(0x0000A2A90169B47D AS DateTime), CAST(0x0000A2A901687A30 AS DateTime))
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'15faeebe-b8bb-4097-8d88-c1c28123016f', N'6338B9D6-CA94-41E3-8AEA-365AE595F772', N'androids/com.dg.gtd.android.lite/20131214201434.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'2d929015-bdde-4c8d-aa08-02838f745bb0', N'6338B9D6-CA94-41E3-8AEA-365AE595F772', N'androids/com.dg.gtd.android.lite/20131214201433.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'5663346f-df75-4525-9287-859a06214cfd', N'6338B9D6-CA94-41E3-8AEA-365AE595F772', N'androids/com.dg.gtd.android.lite/20131214201431.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'c7024db6-ff6c-45af-bd34-3415c405cccc', N'6338B9D6-CA94-41E3-8AEA-365AE595F772', N'androids/com.dg.gtd.android.lite/20131214201432.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'eb2d17d6-bed0-4913-a8eb-8a4f12709251', N'6338B9D6-CA94-41E3-8AEA-365AE595F772', N'androids/com.dg.gtd.android.lite/20131214201433.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'0b3accab-c19b-4466-b335-1300a8c0ecbc', N'4D0CB6EC-9671-42CD-B532-BF723EB08CCA', N'androids/com.zecurisoft.mhc1202/20131225015934.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'314d5289-3a36-4ee8-af5a-e67946d1b473', N'4D0CB6EC-9671-42CD-B532-BF723EB08CCA', N'androids/com.zecurisoft.mhc1202/20131225015932.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'142d9479-d9cc-4aa4-ba84-2b662b567772', N'278F4841-5E47-4B5E-A3A1-2BFCFA411FA0', N'androids/com.tencent.mobileqq/20131224100606.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'46d94cb0-ee54-446d-a294-a0741ab2e590', N'278F4841-5E47-4B5E-A3A1-2BFCFA411FA0', N'androids/com.tencent.mobileqq/20131224100608.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'd96500b8-a075-4c7c-921b-1d3736d26890', N'278F4841-5E47-4B5E-A3A1-2BFCFA411FA0', N'androids/com.tencent.mobileqq/20131224100605.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'666dd3f9-5239-4b2f-b677-b7dbc1da5d39', N'4D0CB6EC-9671-42CD-B532-BF723EB08CCA', N'androids/com.zecurisoft.mhc1202/20131225015932.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'8660c654-d00c-4eb3-bd52-7335ec145d11', N'4D0CB6EC-9671-42CD-B532-BF723EB08CCA', N'androids/com.zecurisoft.mhc1202/20131225015931.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'a83cde20-b626-4d2f-96d6-738e42f15a60', N'4D0CB6EC-9671-42CD-B532-BF723EB08CCA', N'androids/com.zecurisoft.mhc1202/20131225015933.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'000376ef-4287-40d5-b8b9-ab557d6696e0', N'4EB67F60-376F-458D-B337-1BDBF7041421', N'androids/20131225020403.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b1f0ca66-07a0-4ab8-b028-fa2bd07ed77e', N'4EB67F60-376F-458D-B337-1BDBF7041421', N'androids/20131225020404.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'c028a8b6-d037-4726-896f-17aa1e6d53a5', N'4EB67F60-376F-458D-B337-1BDBF7041421', N'androids/20131225020404.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'5ae60801-797a-4bec-8b36-20de59eb5f35', N'9f4f5b65-95c3-463c-9938-8ba15af5b4bd', N'androids/20131225022433.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'a53b9b35-898e-4a25-a70b-6094e8d3c028', N'9f4f5b65-95c3-463c-9938-8ba15af5b4bd', N'androids/20131225022435.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'aac1e813-147e-411e-a282-7dfbeae038fa', N'9f4f5b65-95c3-463c-9938-8ba15af5b4bd', N'androids/20131225022435.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'9997d8d3-0356-4fe4-884c-c3b429019f0a', N'4657e5c8-ce93-406b-a3d9-1e4f941cdd2f', N'androids/20131225022040.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'a071db3c-fadd-4e0f-89ad-d5c15d279b8d', N'4657e5c8-ce93-406b-a3d9-1e4f941cdd2f', N'androids/20131225022039.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'a6972f7b-549b-48d1-a7ce-e5523bcda37d', N'4657e5c8-ce93-406b-a3d9-1e4f941cdd2f', N'androids/20131225022040.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b6e0eede-8401-4b0d-b93f-104800536265', N'9f4f5b65-95c3-463c-9938-8ba15af5b4bd', N'androids/20131225022434.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'2a742dee-4209-4e44-b1f5-e630224e6516', N'a1915d0f-1078-4a78-87ca-45df70786cfa', N'androids/20131225022545.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'38d51cfb-0575-4a53-88d7-596adfd3896c', N'a1915d0f-1078-4a78-87ca-45df70786cfa', N'androids/20131225022544.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'a0f03f30-8470-4191-b623-f8bd15ded940', N'a1915d0f-1078-4a78-87ca-45df70786cfa', N'androids/20131225022546.png', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'61803e79-11c7-4bba-8478-5d6ac4e42b4c', N'4e24970f-32a4-4075-99f9-914f41dde52a', N'androids/20131225022848.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'819dc1f1-566c-4fea-94b4-37df34a78b8d', N'4e24970f-32a4-4075-99f9-914f41dde52a', N'androids/20131225022850.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'c2f0990d-e5f5-48b8-9223-6732e76727a6', N'4e24970f-32a4-4075-99f9-914f41dde52a', N'androids/20131225022849.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'ffbc536d-5700-4c03-b817-6c1683ec77a7', N'4e24970f-32a4-4075-99f9-914f41dde52a', N'androids/20131225022850.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'1943a959-6f8c-42d4-be97-ce9440893186', N'cbc93c32-f410-4403-badd-f00edb52a36f', N'androids/20131225023112.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'3c7c455c-3278-49d3-b345-689f2cdfcf73', N'cbc93c32-f410-4403-badd-f00edb52a36f', N'androids/20131225023111.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b68ad47c-0af8-4d70-8c66-7e50e66c2875', N'cbc93c32-f410-4403-badd-f00edb52a36f', N'androids/20131225023111.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'612c6bae-e52a-4641-bc16-fce8057108ea', N'94ebdd4b-cca4-4a36-9557-a85aee42ee66', N'androids/20131225023333.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'e24dd273-b688-4f97-965d-12803f3983c3', N'94ebdd4b-cca4-4a36-9557-a85aee42ee66', N'androids/20131225023334.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'ffb5b69d-32ec-447f-98ef-224ace969170', N'94ebdd4b-cca4-4a36-9557-a85aee42ee66', N'androids/20131225023335.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'1c9ec702-c653-4ddf-8866-8e9bae1b7c51', N'1398ab8e-d6d2-4bbf-ba30-e90192640e8e', N'androids/20131225023727.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'8bb3bb27-f4fa-4724-ba73-1bead02a6f08', N'1398ab8e-d6d2-4bbf-ba30-e90192640e8e', N'androids/20131225023726.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'b5f69008-4cad-46f6-8e84-2114d445b350', N'1398ab8e-d6d2-4bbf-ba30-e90192640e8e', N'androids/20131225023727.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'243a35bf-111e-4fb3-b5a9-e4a30444edea', N'4acae024-6791-4ab6-ac50-f633b4202d20', N'androids/20131225024231.JPG', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'7887b41c-3bd8-4e63-a832-053c65748676', N'4acae024-6791-4ab6-ac50-f633b4202d20', N'androids/20131225024233.JPG', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'83e99ecf-d236-4c79-8995-2d09b9ee3d9e', N'4acae024-6791-4ab6-ac50-f633b4202d20', N'androids/20131225024232.JPG', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'2d9c18a9-30e8-4153-99b7-e68c552d45c1', N'e64504e8-45b5-4ab7-8926-ff182baf7513', N'androids/20131225024400.JPG', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'8992de79-99bf-455d-8520-018e34caf246', N'e64504e8-45b5-4ab7-8926-ff182baf7513', N'androids/20131225024400.jpg', NULL, NULL, NULL)
INSERT [dbo].[Picture] ([PictureID], [ApplicationID], [Path], [Size], [Width], [Height]) VALUES (N'e9c83520-bdbd-42e1-af30-098f9071754b', N'e64504e8-45b5-4ab7-8926-ff182baf7513', N'androids/20131225024359.JPG', NULL, NULL, NULL)
INSERT [dbo].[Role] ([RoleID], [Name], [Description]) VALUES (N'8C6945DC-362B-4612-BA6B-D959430164DF', N'系统管理员', NULL)
INSERT [dbo].[Role] ([RoleID], [Name], [Description]) VALUES (N'F39AA005-0E84-412F-B6D5-A0791BDDCD6F', N'普通用户', NULL)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'435DC5B9-291F-4396-AF93-C107FBBA422F', N'ce839963-1436-4ef1-b121-e9586e6ab978', 1, CAST(0x0000A2E800FB4690 AS DateTime), N'程序安装', N'com.kuxun.scliang.plane', CAST(0x0000A2E800FB4690 AS DateTime), CAST(0x0000A2E800FB4690 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'8572FF8D-F6F1-4076-8C15-F15856AAB019', N'ce839963-1436-4ef1-b121-e9586e6ab978', 5, CAST(0x0000A2E800FB430C AS DateTime), N'被异常终止', N'com.kuxun.scliang.plane', CAST(0x0000A2E800FB430C AS DateTime), CAST(0x0000A2E800FB4690 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'997348BC-9834-498C-9129-D25E3218407F', N'ce839963-1436-4ef1-b121-e9586e6ab978', 1, CAST(0x0000A2E800FAFA64 AS DateTime), N'被异常终止', N'com.kuxun.scliang.plane', CAST(0x0000A2E800FAFA64 AS DateTime), CAST(0x0000A2E800FB430C AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'5B15EE9F-685E-4877-83D6-33B14394AA44', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 3, CAST(0x0000A2E900F84828 AS DateTime), N'正常停止', N'com.youku.phone', CAST(0x0000A2E900F7C4E8 AS DateTime), CAST(0x0000A2E900F84828 AS DateTime), 112)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'17D46C66-D7B4-4CBC-A705-AF8E806E23D9', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 3, CAST(0x0000A2E900F84828 AS DateTime), N'被异常终止', N'com.youku.phone', CAST(0x0000A2E900F7C4E8 AS DateTime), CAST(0x0000A2EA0115560C AS DateTime), 112)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'1F988669-4DDB-4503-A19A-C04EDDE5E6C9', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 3, CAST(0x0000A2EA01155864 AS DateTime), N'正在运行', N'com.youku.phone', CAST(0x0000A2EA01155738 AS DateTime), NULL, 1)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'2AB360C4-2551-44E5-8312-E36497581FD5', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 2, CAST(0x0000A2EA0115560C AS DateTime), N'程序开始', N'com.youku.phone', CAST(0x0000A2EA0115560C AS DateTime), CAST(0x0000A2EA0115560C AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'438E7FBC-F933-47B8-A886-E7DD6CDC8D66', N'c0c8cb80-484a-4f08-8eaf-e1df9dbf7aa6', 1, CAST(0x0000A2EA0154C4B8 AS DateTime), N'被异常终止', N'com.czy.guandeng', CAST(0x0000A2EA0154C4B8 AS DateTime), CAST(0x0000A2EA0154D8A4 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'85385EC6-1815-49CC-9746-BD9CA65548F8', N'c0c8cb80-484a-4f08-8eaf-e1df9dbf7aa6', 3, CAST(0x0000A2EA0154FE24 AS DateTime), N'正在运行', N'com.czy.guandeng', CAST(0x0000A2EA0154D8A4 AS DateTime), NULL, 32)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'F9E989B8-F2F5-408D-8493-8CA5AE719CAE', N'c0c8cb80-484a-4f08-8eaf-e1df9dbf7aa6', 2, CAST(0x0000A2EA0154D8A4 AS DateTime), N'程序开始', N'com.czy.guandeng', CAST(0x0000A2EA0154D8A4 AS DateTime), CAST(0x0000A2EA0154D8A4 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'69FAB62A-7784-40C2-85DB-50A5397022A9', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 5, CAST(0x0000A2ED010CFEE4 AS DateTime), N'程序被移除', N'com.youku.phone', CAST(0x0000A2ED010CFEE4 AS DateTime), CAST(0x0000A2ED010CFEE4 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'FAA5221F-62F1-4254-9BDC-0E79A90E71FE', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 3, CAST(0x0000A2EA01155864 AS DateTime), N'被异常终止', N'com.youku.phone', CAST(0x0000A2EA01155738 AS DateTime), CAST(0x0000A2ED010CFDB8 AS DateTime), 1)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'84C5DDDF-5C80-40F5-8CB2-85C4C6BACF4D', N'ce839963-1436-4ef1-b121-e9586e6ab978', 1, CAST(0x0000A2E800FAFA64 AS DateTime), N'程序安装', N'com.kuxun.scliang.plane', CAST(0x0000A2E800FAFA64 AS DateTime), CAST(0x0000A2E800FAFA64 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'22EF8205-25E7-4B53-8496-B88D16DADD19', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 1, CAST(0x0000A2E900F4A5B0 AS DateTime), N'程序安装', N'com.youku.phone', CAST(0x0000A2E900F4A5B0 AS DateTime), CAST(0x0000A2E900F4A5B0 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'18F48CB5-E303-452F-A4A3-F45426402E00', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 3, CAST(0x0000A2E900F7CF74 AS DateTime), NULL, N'com.youku.phone', CAST(0x0000A2E900F7C4E8 AS DateTime), NULL, 9)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'9DA344A3-7533-4966-BA29-1026FF946E00', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 1, CAST(0x0000A2E900F4A5B0 AS DateTime), N'被异常终止', N'com.youku.phone', CAST(0x0000A2E900F4A5B0 AS DateTime), CAST(0x0000A2E900F7C4E8 AS DateTime), 0)
INSERT [dbo].[RunLog] ([RunLogID], [MobileAppID], [Action], [UpdateTime], [Message], [PackageName], [StartTime], [EndTime], [TotalTime]) VALUES (N'C679F3AB-8917-46DE-AA2D-73FBDCC3C909', N'd7d3352e-a7cb-46aa-a2d5-08d85093e735', 2, CAST(0x0000A2E900F7C4E8 AS DateTime), N'程序开始', N'com.youku.phone', CAST(0x0000A2E900F7C4E8 AS DateTime), CAST(0x0000A2E900F7C4E8 AS DateTime), 0)
INSERT [dbo].[User] ([UserId], [UserName], [LoginId], [Password], [RegTime], [LastLoginTime], [ErrorCount], [IsValid], [UpdateTime], [Mobile], [Telephone]) VALUES (N'C113B03E-4F41-42C2-A0DC-ED253A94C659', N'admin', N'admin', N'21232f297a57a5a743894a0e4a801fc3', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A2A600000000 AS DateTime), 0, 1, CAST(0x0000A2A600000000 AS DateTime), N'1', N'1')
INSERT [dbo].[User] ([UserId], [UserName], [LoginId], [Password], [RegTime], [LastLoginTime], [ErrorCount], [IsValid], [UpdateTime], [Mobile], [Telephone]) VALUES (N'D7D322B7-45E4-45BE-A650-28E3D7658614', N'user', N'user', N'21232F297A57A5A743894A0E4A801FC3', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A2A600000000 AS DateTime), 0, 1, CAST(0x0000A3260005E98A AS DateTime), N'1', N'1')
INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId]) VALUES (N'3E063212-6D54-4437-BF25-72DA7670699F', N'C113B03E-4F41-42C2-A0DC-ED253A94C659', N'8C6945DC-362B-4612-BA6B-D959430164DF')
INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId]) VALUES (N'505F0FBB-12FE-4362-8EB6-812C555C87B6', N'D7D322B7-45E4-45BE-A650-28E3D7658614', N'F39AA005-0E84-412F-B6D5-A0791BDDCD6F')
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_APPLICATION]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [PK_APPLICATION] PRIMARY KEY NONCLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_APPLICATIONEVALUATE]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[ApplicationEvaluate] ADD  CONSTRAINT [PK_APPLICATIONEVALUATE] PRIMARY KEY NONCLUSTERED 
(
	[ApplicationEvaluateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_APPLICATIONTAG]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[ApplicationTag] ADD  CONSTRAINT [PK_APPLICATIONTAG] PRIMARY KEY NONCLUSTERED 
(
	[TagID] ASC,
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_APPTYPE]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[AppType] ADD  CONSTRAINT [PK_APPTYPE] PRIMARY KEY NONCLUSTERED 
(
	[AppTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_APPUSER]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[AppUser] ADD  CONSTRAINT [PK_APPUSER] PRIMARY KEY NONCLUSTERED 
(
	[AppUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BRAND]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [PK_BRAND] PRIMARY KEY NONCLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_CATEGORY]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [PK_CATEGORY] PRIMARY KEY NONCLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_DRIVER]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[Driver] ADD  CONSTRAINT [PK_DRIVER] PRIMARY KEY NONCLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_MOBILE]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[Mobile] ADD  CONSTRAINT [PK_MOBILE] PRIMARY KEY NONCLUSTERED 
(
	[MobileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_MOBILEAPP]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[MobileApp] ADD  CONSTRAINT [PK_MOBILEAPP] PRIMARY KEY NONCLUSTERED 
(
	[MobileAppID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_MOBILEAPPLICATION]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[MobileApplication] ADD  CONSTRAINT [PK_MOBILEAPPLICATION] PRIMARY KEY NONCLUSTERED 
(
	[MobileApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_MOBILECLIENT]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[MobileClient] ADD  CONSTRAINT [PK_MOBILECLIENT] PRIMARY KEY NONCLUSTERED 
(
	[MobileClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_PCAPP]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[PCApp] ADD  CONSTRAINT [PK_PCAPP] PRIMARY KEY NONCLUSTERED 
(
	[PCAppID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_PCCLIENT]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[PCClient] ADD  CONSTRAINT [PK_PCCLIENT] PRIMARY KEY NONCLUSTERED 
(
	[PCClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_PCINSTALLLOG]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[PCInstallLog] ADD  CONSTRAINT [PK_PCINSTALLLOG] PRIMARY KEY NONCLUSTERED 
(
	[MobileClientID] ASC,
	[PCAppID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_PHONEMODEL]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[PhoneModel] ADD  CONSTRAINT [PK_PHONEMODEL] PRIMARY KEY NONCLUSTERED 
(
	[PhoneModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_PICTURE]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[Picture] ADD  CONSTRAINT [PK_PICTURE] PRIMARY KEY NONCLUSTERED 
(
	[PictureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_ROLE]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [PK_ROLE] PRIMARY KEY NONCLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_RUNLOG]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[RunLog] ADD  CONSTRAINT [PK_RUNLOG] PRIMARY KEY NONCLUSTERED 
(
	[RunLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_STATISTICS]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[Statistics] ADD  CONSTRAINT [PK_STATISTICS] PRIMARY KEY NONCLUSTERED 
(
	[StatisticsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_TAG]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[Tag] ADD  CONSTRAINT [PK_TAG] PRIMARY KEY NONCLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_USER]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [PK_USER] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_USERMOBILE]    Script Date: 2014/5/12 21:20:33 ******/
ALTER TABLE [dbo].[UserMobile] ADD  CONSTRAINT [PK_USERMOBILE] PRIMARY KEY NONCLUSTERED 
(
	[PhoneModelID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1、手机品牌
   2、应用开发商
   3、分销商
   4、其它' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Brand', @level2type=N'COLUMN',@level2name=N'BrandType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1手机
   2PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileApplication', @level2type=N'COLUMN',@level2name=N'ClientType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 第一次启动
   2 第二次启动
   3 卸载' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RunLog', @level2type=N'COLUMN',@level2name=N'Action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 第一次启动
   2 第二次启动
   3 卸载' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statistics', @level2type=N'COLUMN',@level2name=N'Action'
GO
