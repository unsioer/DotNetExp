/*
 Navicat Premium Data Transfer

 Source Server         : localSQLServer
 Source Server Type    : SQL Server
 Source Server Version : 15002070
 Source Host           : localhost:1433
 Source Catalog        : dotnetexp
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15002070
 File Encoding         : 65001

 Date: 05/12/2020 11:30:34
*/


-- ----------------------------
-- Table structure for admin
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[admin]') AND type IN ('U'))
	DROP TABLE [dbo].[admin]
GO

CREATE TABLE [dbo].[admin] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [username] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [fullname] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [password] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [is_deleted] int  NULL
)
GO

ALTER TABLE [dbo].[admin] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of admin
-- ----------------------------
SET IDENTITY_INSERT [dbo].[admin] ON
GO

INSERT INTO [dbo].[admin] ([id], [username], [fullname], [password], [is_deleted]) VALUES (N'1', N'admin', N'平台管理员', N'test1234', N'0')
GO

SET IDENTITY_INSERT [dbo].[admin] OFF
GO


-- ----------------------------
-- Table structure for course
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[course]') AND type IN ('U'))
	DROP TABLE [dbo].[course]
GO

CREATE TABLE [dbo].[course] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [no] bigint  NULL,
  [name] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [type] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [open_term] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [hours] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [credit] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[course] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of course
-- ----------------------------
SET IDENTITY_INSERT [dbo].[course] ON
GO

INSERT INTO [dbo].[course] ([id], [no], [name], [type], [open_term], [hours], [credit]) VALUES (N'1', N'20200001', N'软件工程导论', N'学科通修', N'202001', N'16', N'3')
GO

INSERT INTO [dbo].[course] ([id], [no], [name], [type], [open_term], [hours], [credit]) VALUES (N'2', N'20200002', N'面向对象分析与设计', N'学科通修', N'202001', N'16', N'3')
GO

INSERT INTO [dbo].[course] ([id], [no], [name], [type], [open_term], [hours], [credit]) VALUES (N'3', N'20200003', N'实用操作系统', N'学科通修', N'202001', N'16', N'3')
GO

INSERT INTO [dbo].[course] ([id], [no], [name], [type], [open_term], [hours], [credit]) VALUES (N'4', N'20200004', N'.NET程序设计', N'专业选修', N'202001', N'16', N'2')
GO

INSERT INTO [dbo].[course] ([id], [no], [name], [type], [open_term], [hours], [credit]) VALUES (N'5', N'20200005', N'J2EE程序设计', N'专业选修', N'202001', N'16', N'2')
GO

SET IDENTITY_INSERT [dbo].[course] OFF
GO


-- ----------------------------
-- Table structure for seminar
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[seminar]') AND type IN ('U'))
	DROP TABLE [dbo].[seminar]
GO

CREATE TABLE [dbo].[seminar] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [course_no] bigint  NOT NULL,
  [name] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [time] datetime  NULL,
  [quota] int  NULL,
  [is_deleted] int  NULL
)
GO

ALTER TABLE [dbo].[seminar] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of seminar
-- ----------------------------
SET IDENTITY_INSERT [dbo].[seminar] ON
GO

INSERT INTO [dbo].[seminar] ([id], [course_no], [name], [time], [quota], [is_deleted]) VALUES (N'1', N'20200001', N'需求规格说明书讨论课', N'2020-11-30 08:00:00.000', N'6', N'0')
GO

INSERT INTO [dbo].[seminar] ([id], [course_no], [name], [time], [quota], [is_deleted]) VALUES (N'2', N'20200005', N'低效的异常讨论课', N'2020-11-29 08:00:00.000', N'7', N'0')
GO

INSERT INTO [dbo].[seminar] ([id], [course_no], [name], [time], [quota], [is_deleted]) VALUES (N'3', N'20200005', N'瓶颈分析', N'2020-11-30 09:10:00.000', N'7', N'0')
GO

SET IDENTITY_INSERT [dbo].[seminar] OFF
GO


-- ----------------------------
-- Table structure for seminar_student
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[seminar_student]') AND type IN ('U'))
	DROP TABLE [dbo].[seminar_student]
GO

CREATE TABLE [dbo].[seminar_student] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [seminar_id] bigint  NOT NULL,
  [student_id] bigint  NULL,
  [enroll_time] datetime  NULL,
  [is_deleted] int  NULL,
  [question] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[seminar_student] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of seminar_student
-- ----------------------------
SET IDENTITY_INSERT [dbo].[seminar_student] ON
GO

INSERT INTO [dbo].[seminar_student] ([id], [seminar_id], [student_id], [enroll_time], [is_deleted], [question]) VALUES (N'1', N'1', N'1', N'2020-11-26 16:00:00.000', N'0', NULL)
GO

INSERT INTO [dbo].[seminar_student] ([id], [seminar_id], [student_id], [enroll_time], [is_deleted], [question]) VALUES (N'2', N'2', N'4', N'2020-11-26 16:12:00.000', N'1', NULL)
GO

INSERT INTO [dbo].[seminar_student] ([id], [seminar_id], [student_id], [enroll_time], [is_deleted], [question]) VALUES (N'3', N'1', N'4', N'2020-11-26 16:13:05.000', N'1', NULL)
GO

INSERT INTO [dbo].[seminar_student] ([id], [seminar_id], [student_id], [enroll_time], [is_deleted], [question]) VALUES (N'4', N'2', N'4', N'2020-11-26 16:14:00.000', N'1', NULL)
GO

INSERT INTO [dbo].[seminar_student] ([id], [seminar_id], [student_id], [enroll_time], [is_deleted], [question]) VALUES (N'5', N'1', N'4', N'2020-11-26 16:18:00.000', N'1', NULL)
GO

INSERT INTO [dbo].[seminar_student] ([id], [seminar_id], [student_id], [enroll_time], [is_deleted], [question]) VALUES (N'6', N'2', N'4', N'2020-11-26 16:19:00.000', N'1', N'1.什么是低效的异常？')
GO

INSERT INTO [dbo].[seminar_student] ([id], [seminar_id], [student_id], [enroll_time], [is_deleted], [question]) VALUES (N'7', N'3', N'4', N'2020-11-26 16:31:00.000', N'1', NULL)
GO

INSERT INTO [dbo].[seminar_student] ([id], [seminar_id], [student_id], [enroll_time], [is_deleted], [question]) VALUES (N'8', N'1', N'4', N'2020-11-27 18:10:35.560', N'1', NULL)
GO

INSERT INTO [dbo].[seminar_student] ([id], [seminar_id], [student_id], [enroll_time], [is_deleted], [question]) VALUES (N'9', N'1', N'4', N'2020-11-27 18:18:22.973', N'0', NULL)
GO

INSERT INTO [dbo].[seminar_student] ([id], [seminar_id], [student_id], [enroll_time], [is_deleted], [question]) VALUES (N'10', N'2', N'4', N'2020-11-28 18:10:24.317', N'0', NULL)
GO

INSERT INTO [dbo].[seminar_student] ([id], [seminar_id], [student_id], [enroll_time], [is_deleted], [question]) VALUES (N'11', N'3', N'4', N'2020-11-28 18:10:37.037', N'0', N'hjdjkh?')
GO

INSERT INTO [dbo].[seminar_student] ([id], [seminar_id], [student_id], [enroll_time], [is_deleted], [question]) VALUES (N'12', N'1', N'5', N'2020-12-05 11:24:05.803', N'0', NULL)
GO

SET IDENTITY_INSERT [dbo].[seminar_student] OFF
GO


-- ----------------------------
-- Table structure for student
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[student]') AND type IN ('U'))
	DROP TABLE [dbo].[student]
GO

CREATE TABLE [dbo].[student] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [username] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [fullname] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [password] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [email] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [is_deleted] int  NULL,
  [is_activated] int  NULL
)
GO

ALTER TABLE [dbo].[student] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of student
-- ----------------------------
SET IDENTITY_INSERT [dbo].[student] ON
GO

INSERT INTO [dbo].[student] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'1', N'24000000', N'hhh', N'6667777', N'563178232357@qq.com', N'0', N'1')
GO

INSERT INTO [dbo].[student] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'2', N'24000001', N'xixi', N'haha999', N'haha@stu.xmu.edu.cn', N'0', N'1')
GO

INSERT INTO [dbo].[student] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'3', N'24000002', N'test二', N'test999', N'', N'0', N'0')
GO

INSERT INTO [dbo].[student] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'4', N'100', N'hjh', N'hjh', N'hjh@qq.com', N'0', N'1')
GO

INSERT INTO [dbo].[student] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'5', N'24000004', N'abeng', N'ab1234', N'abeng@stu.xmu.edu.cn', N'0', N'1')
GO

INSERT INTO [dbo].[student] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'6', N'24000005', N'TT', N'44', N'', N'1', N'0')
GO

INSERT INTO [dbo].[student] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'7', N'24000006', N'张三', N'123456', N'zhangsan@stu.xmu.edu.cn', N'0', N'1')
GO

INSERT INTO [dbo].[student] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'8', N'666', N'六', N'123456', N'', N'1', N'0')
GO

SET IDENTITY_INSERT [dbo].[student] OFF
GO


-- ----------------------------
-- Table structure for teacher
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[teacher]') AND type IN ('U'))
	DROP TABLE [dbo].[teacher]
GO

CREATE TABLE [dbo].[teacher] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [username] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [fullname] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [password] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [email] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [is_deleted] int  NULL,
  [is_activated] int  NULL
)
GO

ALTER TABLE [dbo].[teacher] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of teacher
-- ----------------------------
SET IDENTITY_INSERT [dbo].[teacher] ON
GO

INSERT INTO [dbo].[teacher] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'1', N'2019005', N'huhu', N'123456', N'563178232357@qq.com', N'0', N'1')
GO

INSERT INTO [dbo].[teacher] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'2', N'2019002', N'xixi', N'hhhh', N'1278@qq.com', N'0', N'1')
GO

INSERT INTO [dbo].[teacher] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'3', N'2019003', N'张明明', N'zmm', N'zhangmm@xmu.edu.cn', N'0', N'1')
GO

INSERT INTO [dbo].[teacher] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'4', N'2020001', N'林雄', N'123456', N'xlin@xmu.edu.cn', N'0', N'0')
GO

INSERT INTO [dbo].[teacher] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'5', N'2020002', N'abeng', N'123456', N'', N'0', N'0')
GO

INSERT INTO [dbo].[teacher] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'6', N'2020003', N'TT', N'44', N'', N'1', N'1')
GO

INSERT INTO [dbo].[teacher] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'7', N'2020004', N'张三', N'123456', N'555@11', N'0', N'1')
GO

INSERT INTO [dbo].[teacher] ([id], [username], [fullname], [password], [email], [is_deleted], [is_activated]) VALUES (N'8', N'123', N'宋明', N'123456', N'123@qq.com', N'0', N'0')
GO

SET IDENTITY_INSERT [dbo].[teacher] OFF
GO


-- ----------------------------
-- Auto increment value for admin
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[admin]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table admin
-- ----------------------------
ALTER TABLE [dbo].[admin] ADD CONSTRAINT [PK__admin__3213E83FF49C5F78] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for course
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[course]', RESEED, 5)
GO


-- ----------------------------
-- Primary Key structure for table course
-- ----------------------------
ALTER TABLE [dbo].[course] ADD CONSTRAINT [PK__course__3213E83FD580366E] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for seminar
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[seminar]', RESEED, 3)
GO


-- ----------------------------
-- Auto increment value for seminar_student
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[seminar_student]', RESEED, 16)
GO


-- ----------------------------
-- Auto increment value for student
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[student]', RESEED, 12)
GO


-- ----------------------------
-- Primary Key structure for table student
-- ----------------------------
ALTER TABLE [dbo].[student] ADD CONSTRAINT [PK__teacher__3213E83F76F51B35_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for teacher
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[teacher]', RESEED, 12)
GO


-- ----------------------------
-- Primary Key structure for table teacher
-- ----------------------------
ALTER TABLE [dbo].[teacher] ADD CONSTRAINT [PK__teacher__3213E83F76F51B35] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Table structure for reset_student
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[reset_student]') AND type IN ('U'))
	DROP TABLE [dbo].[reset_student]
GO

CREATE TABLE [dbo].[reset_student] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [student_id] bigint  NULL,
  [reset_time] datetime  NULL,
  [token] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[reset_student] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of reset_student
-- ----------------------------
SET IDENTITY_INSERT [dbo].[reset_student] ON
GO

INSERT INTO [dbo].[reset_student] ([id], [student_id], [reset_time], [token]) VALUES (N'1', N'6', N'2020-12-11 17:16:52.960', N'49-08-F9-30-5F-24-B4-27-E9-E7-EA-C6-9F-4D-B5-51')
GO

INSERT INTO [dbo].[reset_student] ([id], [student_id], [reset_time], [token]) VALUES (N'2', N'6', N'2020-12-11 17:18:10.563', N'49-08-F9-30-5F-24-B4-27-E9-E7-EA-C6-9F-4C-B5-51')
GO

INSERT INTO [dbo].[reset_student] ([id], [student_id], [reset_time], [token]) VALUES (N'3', N'6', N'2020-12-11 17:25:53.177', N'49-08-F9-30-5F-24-B4-27-E9-E7-EA-C6-9F-4C-B5-51')
GO

INSERT INTO [dbo].[reset_student] ([id], [student_id], [reset_time], [token]) VALUES (N'4', N'6', N'2020-12-11 17:32:57.703', N'49-08-F9-30-5F-24-B4-27-E9-E7-EA-C6-9F-4C-B5-51')
GO

INSERT INTO [dbo].[reset_student] ([id], [student_id], [reset_time], [token]) VALUES (N'5', N'6', N'2020-12-11 17:56:32.873', N'7CC43AB2A5BD8786689360CADFC6C080')
GO

INSERT INTO [dbo].[reset_student] ([id], [student_id], [reset_time], [token]) VALUES (N'6', N'6', N'2020-12-11 18:03:49.123', N'888414057C57D9C295566F810F1214F1')
GO

INSERT INTO [dbo].[reset_student] ([id], [student_id], [reset_time], [token]) VALUES (N'7', N'6', N'2020-12-11 18:07:26.573', N'DBF8E60BD721FEDAD75D475B61478C31')
GO

SET IDENTITY_INSERT [dbo].[reset_student] OFF
GO


-- ----------------------------
-- Auto increment value for reset_student
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[reset_student]', RESEED, 7)
GO

