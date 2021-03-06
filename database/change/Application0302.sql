/*
   2014年3月2日1:23:41
   用户: 
   服务器: (local)
   数据库: appstore
   应用程序: 
*/

/* 为了防止任何可能出现的数据丢失问题，您应该先仔细检查此脚本，然后再在数据库设计器的上下文之外运行此脚本。*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Application ADD
	Seq int NULL,
	CreateTime datetime NULL
GO
ALTER TABLE dbo.Application SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
