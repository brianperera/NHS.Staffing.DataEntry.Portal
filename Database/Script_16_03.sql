USE [master]
GO
/****** Object:  Database [NHSOperationsDatabase]    Script Date: 3/16/2014 8:05:44 AM ******/
CREATE DATABASE [NHSOperationsDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NHSOperationsDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\NHSOperationsDatabase.mdf' , SIZE = 4352KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NHSOperationsDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\NHSOperationsDatabase_log.LDF' , SIZE = 4672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NHSOperationsDatabase] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NHSOperationsDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NHSOperationsDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NHSOperationsDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NHSOperationsDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NHSOperationsDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NHSOperationsDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NHSOperationsDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [NHSOperationsDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [NHSOperationsDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NHSOperationsDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NHSOperationsDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NHSOperationsDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NHSOperationsDatabase', N'ON'
GO
USE [NHSOperationsDatabase]
GO
/****** Object:  DatabaseRole [aspnet_WebEvent_FullAccess]    Script Date: 3/16/2014 8:05:44 AM ******/
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_ReportingAccess]    Script Date: 3/16/2014 8:05:44 AM ******/
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_FullAccess]    Script Date: 3/16/2014 8:05:44 AM ******/
CREATE ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_BasicAccess]    Script Date: 3/16/2014 8:05:44 AM ******/
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_ReportingAccess]    Script Date: 3/16/2014 8:05:44 AM ******/
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_FullAccess]    Script Date: 3/16/2014 8:05:44 AM ******/
CREATE ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_BasicAccess]    Script Date: 3/16/2014 8:05:44 AM ******/
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_ReportingAccess]    Script Date: 3/16/2014 8:05:44 AM ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_FullAccess]    Script Date: 3/16/2014 8:05:44 AM ******/
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_BasicAccess]    Script Date: 3/16/2014 8:05:44 AM ******/
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_ReportingAccess]    Script Date: 3/16/2014 8:05:44 AM ******/
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_FullAccess]    Script Date: 3/16/2014 8:05:44 AM ******/
CREATE ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_BasicAccess]    Script Date: 3/16/2014 8:05:44 AM ******/
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
ALTER ROLE [aspnet_Roles_BasicAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Roles_ReportingAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Profile_BasicAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Profile_ReportingAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_BasicAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_ReportingAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Membership_BasicAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
ALTER ROLE [aspnet_Membership_ReportingAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteShiftDetailRecord]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,05-03-2014>
-- Description:	<Description,Update Shift Detail>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteShiftDetailRecord] 
			@WardCode varchar(50)
           ,@ShiftDate date
           ,@ShiftID int
AS
BEGIN
DELETE FROM [dbo].[ShiftDetails]
 WHERE [WardCode]=@WardCode AND [ShiftDate]=@ShiftDate AND [ShiftID]=@ShiftID
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteShiftType]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,05-03-2014>
-- Description:	<Description,Delete Shift Type>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteShiftType]
	@ShiftID int
AS
BEGIN
DELETE FROM [dbo].[ShiftTypes]
      WHERE [ShiftID]=@ShiftID
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteWard]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,05-03-2014>
-- Description:	<Description,Delete ward>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteWard]
	@WardCode varchar(50)
AS
BEGIN
DELETE FROM [dbo].[Wards]
      WHERE [WardCode]=@WardCode
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllShiftDetailRecords]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,01-03-2014>
-- Description:	<Description,Get all shift detail records>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllShiftDetailRecords] 
AS
BEGIN
SELECT [Index]
      ,w.[WardCode]
      ,w.[WardName]
      ,[ShiftDate]
      ,t.[Name] AS Shift
      ,s.[Beds]
      ,[OptimumStaffingRN]
      ,[OptimumStaffingHCA]
      ,[SafeStaffingRN]
      ,[SafeStaffingHCA]
      ,[TodayTrustRN]
      ,[TodayTrustHCA]
      ,[TodayBankRN]
      ,[TodayBankHCA]
      ,[TodayNonTrustRN]
      ,[TodayNonTrustHCA]
      ,[DataEntryBy]
      ,[IsSafe]
      ,[UnSafeMitigation]
      ,[SafeMitigation]
  FROM [dbo].[ShiftDetails] s 
  JOIN [dbo].[Wards] w ON(s.WardCode = w.WardCode )
  JOIN [dbo].[ShiftTypes] t ON(s.ShiftID = t.ShiftID)
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllShiftTypes]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,01-03-2014>
-- Description:	<Description,Get All Shift Types>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllShiftTypes]
AS
BEGIN
SELECT [ShiftID]
      ,[Name]
  FROM [dbo].[ShiftTypes]
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllWards]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,01-03-2014>
-- Description:	<Description,Get All Wards>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllWards]
AS
BEGIN
SELECT [WardCode]
      ,[WardName]
      ,[Beds]
  FROM [dbo].[Wards]
END


GO
/****** Object:  StoredProcedure [dbo].[GetRowShiftDetailByDate]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery21.sql|7|0|C:\Users\SampathD\AppData\Local\Temp\~vsAFEC.sql
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,01-03-2014>
-- Description:	<Description,Get shift details for date range>
-- =============================================
CREATE PROCEDURE [dbo].[GetRowShiftDetailByDate] 
			@StartDate date
           ,@EndDate date
AS
BEGIN
SELECT [Index]
      ,[WardCode]
      ,[ShiftDate]
      ,[ShiftID]
      ,[Beds]
      ,[OptimumStaffingRN]
      ,[OptimumStaffingHCA]
      ,[SafeStaffingRN]
      ,[SafeStaffingHCA]
      ,[TodayTrustRN]
      ,[TodayTrustHCA]
      ,[TodayBankRN]
      ,[TodayBankHCA]
      ,[TodayNonTrustRN]
      ,[TodayNonTrustHCA]
      ,[DataEntryBy]
      ,[IsSafe]
      ,[UnSafeMitigation]
      ,[SafeMitigation]
  FROM [dbo].[ShiftDetails] 
  WHERE ShiftDate >= @StartDate AND ShiftDate < @EndDate
  ORDER By [ShiftDate],[ShiftID]
END


GO
/****** Object:  StoredProcedure [dbo].[GetShiftDetailByCodeDataShiftID]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,01-03-2014>
-- Description:	<Description,Get all shift detail records>
-- =============================================
CREATE PROCEDURE [dbo].[GetShiftDetailByCodeDataShiftID] 
	        @WardCode varchar(50)
           ,@ShiftDate date
           ,@ShiftID int
AS
BEGIN
SELECT [Index]
      ,w.[WardCode]
      ,w.[WardName]
      ,[ShiftDate]
      ,t.[Name] AS Shift
      ,s.[Beds]
      ,[OptimumStaffingRN]
      ,[OptimumStaffingHCA]
      ,[SafeStaffingRN]
      ,[SafeStaffingHCA]
      ,[TodayTrustRN]
      ,[TodayTrustHCA]
      ,[TodayBankRN]
      ,[TodayBankHCA]
      ,[TodayNonTrustRN]
      ,[TodayNonTrustHCA]
      ,[DataEntryBy]
      ,[IsSafe]
      ,[UnSafeMitigation]
      ,[SafeMitigation]
  FROM [dbo].[ShiftDetails] s 
  JOIN [dbo].[Wards] w ON(s.WardCode = w.WardCode )
  JOIN [dbo].[ShiftTypes] t ON(s.ShiftID = t.ShiftID)
  WHERE s.WardCode = @WardCode AND s.ShiftDate = @ShiftDate AND s.ShiftID = @ShiftID
END


GO
/****** Object:  StoredProcedure [dbo].[GetShiftDetailByDate]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery21.sql|7|0|C:\Users\SampathD\AppData\Local\Temp\~vsAFEC.sql
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,01-03-2014>
-- Description:	<Description,Get shift details for date range>
-- =============================================
CREATE PROCEDURE [dbo].[GetShiftDetailByDate] 
			@StartDate date
           ,@EndDate date
AS
BEGIN
SELECT [Index]
      ,w.[WardCode]
      ,w.[WardName]
      ,[ShiftDate]
      ,t.[Name] AS Shift
	  ,s.[ShiftID]
      ,s.[Beds]
      ,[OptimumStaffingRN]
      ,[OptimumStaffingHCA]
      ,[SafeStaffingRN]
      ,[SafeStaffingHCA]
      ,[TodayTrustRN]
      ,[TodayTrustHCA]
      ,[TodayBankRN]
      ,[TodayBankHCA]
      ,[TodayNonTrustRN]
      ,[TodayNonTrustHCA]
      ,[DataEntryBy]
      ,[IsSafe]
      ,[UnSafeMitigation]
      ,[SafeMitigation]
  FROM [dbo].[ShiftDetails] s 
  JOIN [dbo].[Wards] w ON(s.WardCode = w.WardCode )
  JOIN [dbo].[ShiftTypes] t ON(s.ShiftID = t.ShiftID)
  WHERE s.ShiftDate >= @StartDate AND s.ShiftDate < @EndDate
  ORDER By [ShiftDate],[ShiftID]
END


GO
/****** Object:  StoredProcedure [dbo].[InsertShiftDetailRecord]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,01-03-2014>
-- Description:	<Description,Insert Shift Detail Record>
-- =============================================
CREATE PROCEDURE [dbo].[InsertShiftDetailRecord] 
	        @WardCode varchar(50)
           ,@ShiftDate date
           ,@ShiftID int
           ,@Beds int
           ,@OptimumStaffingRN int = NULL
           ,@OptimumStaffingHCA int = NULL
           ,@SafeStaffingRN int = NULL
           ,@SafeStaffingHCA int = NULL
           ,@TodayTrustRN int = NULL
           ,@TodayTrustHCA int = NULL
           ,@TodayBankRN int = NULL
           ,@TodayBankHCA int = NULL
           ,@TodayNonTrustRN int = NULL
           ,@TodayNonTrustHCA int = NULL
           ,@DataEntryBy varchar(50) = NULL
           ,@IsSafe bit = NULL
           ,@UnSafeMitigation varchar(1000) = NULL
           ,@SafeMitigation varchar(1000) = NULL
AS

DECLARE @CurrentShiftIndex int

SELECT @CurrentShiftIndex = [Index]
FROM [dbo].[ShiftDetails] 
WHERE [WardCode]=@WardCode AND [ShiftDate]=@ShiftDate AND [ShiftID]=@ShiftID

if @CurrentShiftIndex IS NULL
BEGIN
INSERT INTO [dbo].[ShiftDetails]
           ([WardCode]
           ,[ShiftDate]
           ,[ShiftID]
           ,[Beds]
           ,[OptimumStaffingRN]
           ,[OptimumStaffingHCA]
           ,[SafeStaffingRN]
           ,[SafeStaffingHCA]
           ,[TodayTrustRN]
           ,[TodayTrustHCA]
           ,[TodayBankRN]
           ,[TodayBankHCA]
           ,[TodayNonTrustRN]
           ,[TodayNonTrustHCA]
           ,[DataEntryBy]
           ,[IsSafe]
           ,[UnSafeMitigation]
           ,[SafeMitigation])
     VALUES
           (@WardCode
           ,@ShiftDate 
           ,@ShiftID 
           ,@Beds 
           ,@OptimumStaffingRN 
           ,@OptimumStaffingHCA 
           ,@SafeStaffingRN 
           ,@SafeStaffingHCA 
           ,@TodayTrustRN 
           ,@TodayTrustHCA 
           ,@TodayBankRN 
           ,@TodayBankHCA 
           ,@TodayNonTrustRN 
           ,@TodayNonTrustHCA 
           ,@DataEntryBy 
           ,@IsSafe 
           ,@UnSafeMitigation 
           ,@SafeMitigation)
END


GO
/****** Object:  StoredProcedure [dbo].[InsertShiftTypes]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,01-03-2014>
-- Description:	<Description,Insert Shift Types>
-- =============================================
CREATE PROCEDURE [dbo].[InsertShiftTypes]
		@ShiftID int
       ,@Name varchar(20)
AS
BEGIN
INSERT INTO [dbo].[ShiftTypes]
           ([ShiftID]
           ,[Name])
     VALUES
           (@ShiftID
           ,@Name)
END


GO
/****** Object:  StoredProcedure [dbo].[InsertWard]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,01-03-2014>
-- Description:	<Description,Insert Ward>
-- =============================================
CREATE PROCEDURE [dbo].[InsertWard]
		@WardCode varchar(50)
	   ,@WardName varchar(50)
       ,@Beds int
AS
BEGIN
INSERT INTO [dbo].[Wards]
           ([WardCode]
           ,[WardName]
           ,[Beds])
     VALUES
           (@WardCode
           ,@WardName
           ,@Beds)
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateShiftDetailRecord]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,01-03-2014>
-- Description:	<Description,Update Shift Detail>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateShiftDetailRecord] 
		    @WardCode varchar(50)
           ,@ShiftDate date
           ,@ShiftID int
           ,@Beds int
           ,@OptimumStaffingRN int = NULL
           ,@OptimumStaffingHCA int = NULL
           ,@SafeStaffingRN int = NULL
           ,@SafeStaffingHCA int = NULL
           ,@TodayTrustRN int = NULL
           ,@TodayTrustHCA int = NULL
           ,@TodayBankRN int = NULL
           ,@TodayBankHCA int = NULL
           ,@TodayNonTrustRN int = NULL
           ,@TodayNonTrustHCA int = NULL
           ,@DataEntryBy varchar(50) = NULL
           ,@IsSafe bit = NULL
           ,@UnSafeMitigation varchar(1000) = NULL
           ,@SafeMitigation varchar(1000) = NULL
AS
BEGIN
UPDATE [dbo].[ShiftDetails]
   SET [WardCode] = @WardCode
      ,[ShiftDate] = @ShiftDate
      ,[ShiftID] = @ShiftID
      ,[Beds] = @Beds
      ,[OptimumStaffingRN] = @OptimumStaffingRN
      ,[OptimumStaffingHCA] = @OptimumStaffingHCA
      ,[SafeStaffingRN] = @SafeStaffingRN
      ,[SafeStaffingHCA] = @SafeStaffingHCA
      ,[TodayTrustRN] = @TodayTrustRN
      ,[TodayTrustHCA] = @TodayTrustHCA
      ,[TodayBankRN] = @TodayBankRN
      ,[TodayBankHCA] = @TodayBankHCA
      ,[TodayNonTrustRN] = @TodayNonTrustRN
      ,[TodayNonTrustHCA] = @TodayNonTrustHCA
      ,[DataEntryBy] = @DataEntryBy
      ,[IsSafe] = @IsSafe
      ,[UnSafeMitigation] = @UnSafeMitigation
      ,[SafeMitigation] = @SafeMitigation
 WHERE [WardCode]=@WardCode AND [ShiftDate]=@ShiftDate AND [ShiftID]=@ShiftID
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateShiftType]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,05-03-2014>
-- Description:	<Description,Update ShiftType>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateShiftType]
	@ShiftID int,
	@Name varchar(50)
AS
BEGIN
UPDATE [dbo].[ShiftTypes]
   SET [Name] = @Name
 WHERE [ShiftID]=@ShiftID
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateWard]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Sampath>
-- Create date: <Create Date,05-03-2014>
-- Description:	<Description,Update Ward>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateWard]
	@WardCode varchar(50),
	@WardName varchar(50),
	@Beds int
AS
BEGIN
UPDATE [dbo].[Wards]
   SET [WardName] = @WardName,
	   [Beds]=@Beds
 WHERE [WardCode]=@WardCode
END


GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Operations]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operations](
	[Ward Code] [int] NULL,
	[Ward Name] [nchar](10) NULL,
	[Date] [date] NULL,
	[Day] [nchar](10) NULL,
	[Shift] [nchar](10) NULL,
	[Beds] [int] NULL,
	[Optimum Staffing RN] [int] NULL,
	[Optimum Staffing HCA] [int] NULL,
	[Safe Staffing RN] [int] NULL,
	[Safe Staffing HCA] [int] NULL,
	[Today Trust RN] [int] NULL,
	[Today Trust HCA] [int] NULL,
	[Today Bank RN] [int] NULL,
	[Today Bank HCA] [int] NULL,
	[Today Non Trust RN] [int] NULL,
	[Today Non Trust HCA] [int] NULL,
	[Data entry by] [int] NULL,
	[Safe? - Matron or bleep holder to complete] [nchar](10) NULL,
	[Mitigation action if UNSAFE  - Matron or bleep holder to complete] [nchar](10) NULL,
	[Mitigation action if SAFE  - Matron or bleep holder to complete] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShiftDetails]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShiftDetails](
	[Index] [int] IDENTITY(1,1) NOT NULL,
	[WardCode] [varchar](50) NOT NULL,
	[ShiftDate] [date] NOT NULL,
	[ShiftID] [int] NOT NULL,
	[Beds] [int] NOT NULL,
	[OptimumStaffingRN] [int] NULL,
	[OptimumStaffingHCA] [int] NULL,
	[SafeStaffingRN] [int] NULL,
	[SafeStaffingHCA] [int] NULL,
	[TodayTrustRN] [int] NULL,
	[TodayTrustHCA] [int] NULL,
	[TodayBankRN] [int] NULL,
	[TodayBankHCA] [int] NULL,
	[TodayNonTrustRN] [int] NULL,
	[TodayNonTrustHCA] [int] NULL,
	[DataEntryBy] [varchar](50) NULL,
	[IsSafe] [bit] NULL,
	[UnSafeMitigation] [varchar](1000) NULL,
	[SafeMitigation] [varchar](1000) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShiftTypes]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShiftTypes](
	[ShiftID] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ShiftTypes] PRIMARY KEY CLUSTERED 
(
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Staffing]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staffing](
	[Ward Code] [varchar](10) NULL,
	[Beds] [int] NULL,
	[Shift] [varchar](50) NULL,
	[Day] [varchar](50) NULL,
	[Optimum Staffing RN] [int] NULL,
	[Optimum Staffing HCA] [int] NULL,
	[Safe Staffing RN] [int] NULL,
	[Safe Staffing HCA] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StaffingData]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffingData](
	[StaffingDate] [date] NOT NULL,
	[OptimumRN] [int] NOT NULL,
	[OptimumHCA] [int] NOT NULL,
	[SafeRN] [int] NOT NULL,
	[SafeHCA] [int] NOT NULL,
 CONSTRAINT [PK_StaffingData] PRIMARY KEY CLUSTERED 
(
	[StaffingDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Wards]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Wards](
	[WardCode] [varchar](50) NOT NULL,
	[WardName] [varchar](50) NOT NULL,
	[Beds] [int] NULL,
	[Division] [varchar](50) NULL,
 CONSTRAINT [PK_Wards] PRIMARY KEY CLUSTERED 
(
	[WardCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 3/16/2014 8:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Applications_Index]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications]
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Membership_index]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership]
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Paths_index]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths]
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_index1]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Roles_index1]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles]
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Users_Index]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', N'49af13ec-0a1c-4866-bfaa-d030ab126a81', N'nra2cPhv/WvgnOiUa3gCHdmLwTU=', 1, N'xmOYM1sAvUy+fWkWe+RBFg==', NULL, N'briano_p@yahoo.com', N'briano_p@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A2E1012584A0 AS DateTime), CAST(0x0000A2EF0141F8EE AS DateTime), CAST(0x0000A2E1012584A0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', N'd68a0081-0191-4576-b6c0-07bb1a1aad98', N'jSaYFP8eJaSN2LHuiq9guvUruXk=', 1, N'D0gqg2HNGciJgTcj0wfStQ==', NULL, N'charitha@sdf.sdf', N'charitha@sdf.sdf', N'Question', N'tWVmsO2wvmdLwkx1J/zeWIdKfGw=', 1, 0, CAST(0x0000A2E9004E564C AS DateTime), CAST(0x0000A2E9004E564C AS DateTime), CAST(0x0000A2E9004E564C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', N'62432772-85ff-446d-bfa1-6a18a7476d8b', N'6pUp0An26A+Fm8rvctka7m9Fm7Y=', 1, N'KYExtxhpsaJPtB84id9srQ==', NULL, N'milinda@gmail.com', N'milinda@gmail.com', N'Question', N'JequVND9qUfBxN1PQb/YN2pGmEs=', 1, 0, CAST(0x0000A2E900570558 AS DateTime), CAST(0x0000A2E90066903A AS DateTime), CAST(0x0000A2E900570558 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', N'992e5661-21a4-4f6f-af15-21e17eab2425', N'vnqK3O4MXI4tRMWXk+E/XxsNTkI=', 1, N'EpTOowmylij3tMnxE11zRA==', NULL, N'pri@sd.sd', N'pri@sd.sd', N'Question', N'TqAm53lZAiSAuQ0KM85+oO5M+Q8=', 1, 0, CAST(0x0000A2E90060354C AS DateTime), CAST(0x0000A2E90066A1E9 AS DateTime), CAST(0x0000A2E90060354C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', N'bde82d4e-d05b-44af-bbd1-708675e5fdc3', N'wkzrmu466BPmY5cQBVDyz7esOz8=', 1, N'WfwvADvLyuZ0APajePetUw==', NULL, N'sampath@gmail.com', N'sampath@gmail.com', N'Question', N'WosaR6vZRy/IEB0OCaJniSxG6OU=', 1, 0, CAST(0x0000A2E9004B3F48 AS DateTime), CAST(0x0000A2E9004B3F48 AS DateTime), CAST(0x0000A2E9004B3F48 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', N'8eac8b45-69f3-4419-bb5b-d4e74a2eaa30', N'Admin', N'admin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', N'4c465211-1aa8-47b2-9dae-d2c58c1a3457', N'Data Entry Staff', N'data entry staff', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', N'f9f1ca4a-40f8-427b-84e1-b6c3ca619363', N'Super Admin', N'super admin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', N'58151624-22e8-4a0f-a872-8d0563e36514', N'View Only', N'view only', NULL)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', N'49af13ec-0a1c-4866-bfaa-d030ab126a81', N'Brian', N'brian', NULL, 0, CAST(0x0000A2EF01433D4A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', N'd68a0081-0191-4576-b6c0-07bb1a1aad98', N'charitha', N'charitha', NULL, 0, CAST(0x0000A2E9004E564C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', N'62432772-85ff-446d-bfa1-6a18a7476d8b', N'milinda', N'milinda', NULL, 0, CAST(0x0000A2E90066903A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', N'992e5661-21a4-4f6f-af15-21e17eab2425', N'pri', N'pri', NULL, 0, CAST(0x0000A2E90066A1E9 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'4b6a4bf8-d355-49b4-bca0-ea2acb5c9e52', N'bde82d4e-d05b-44af-bbd1-708675e5fdc3', N'sampath', N'sampath', NULL, 0, CAST(0x0000A2E9004B3F48 AS DateTime))
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'992e5661-21a4-4f6f-af15-21e17eab2425', N'f9f1ca4a-40f8-427b-84e1-b6c3ca619363')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'49af13ec-0a1c-4866-bfaa-d030ab126a81', N'f9f1ca4a-40f8-427b-84e1-b6c3ca619363')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'62432772-85ff-446d-bfa1-6a18a7476d8b', N'4c465211-1aa8-47b2-9dae-d2c58c1a3457')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'bde82d4e-d05b-44af-bbd1-708675e5fdc3', N'4c465211-1aa8-47b2-9dae-d2c58c1a3457')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd68a0081-0191-4576-b6c0-07bb1a1aad98', N'8eac8b45-69f3-4419-bb5b-d4e74a2eaa30')
INSERT [dbo].[Operations] ([Ward Code], [Ward Name], [Date], [Day], [Shift], [Beds], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA], [Today Trust RN], [Today Trust HCA], [Today Bank RN], [Today Bank HCA], [Today Non Trust RN], [Today Non Trust HCA], [Data entry by], [Safe? - Matron or bleep holder to complete], [Mitigation action if UNSAFE  - Matron or bleep holder to complete], [Mitigation action if SAFE  - Matron or bleep holder to complete]) VALUES (1, N'Demo      ', CAST(0x20380B00 AS Date), N'Sat       ', N'Early     ', 14, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Operations] ([Ward Code], [Ward Name], [Date], [Day], [Shift], [Beds], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA], [Today Trust RN], [Today Trust HCA], [Today Bank RN], [Today Bank HCA], [Today Non Trust RN], [Today Non Trust HCA], [Data entry by], [Safe? - Matron or bleep holder to complete], [Mitigation action if UNSAFE  - Matron or bleep holder to complete], [Mitigation action if SAFE  - Matron or bleep holder to complete]) VALUES (2, N'Demo      ', CAST(0x21380B00 AS Date), N'Sun       ', N'Early     ', 14, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ShiftDetails] ON 

INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (1, N'RXQ-DEMO', CAST(0x01380B00 AS Date), 1, 16, 12, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (2, N'RXQ-DEMO', CAST(0x01380B00 AS Date), 2, 15, 12, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (3, N'RXQ-DEMO', CAST(0x01380B00 AS Date), 3, 14, 12, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (4, N'RXQ-DEMO', CAST(0x02380B00 AS Date), 3, 17, 14, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (5, N'RXQ-DEMO', CAST(0x02380B00 AS Date), 2, 13, 15, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (6, N'RXQ-DEMO', CAST(0x02380B00 AS Date), 1, 15, 15, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (7, N'RXQ-DEMO', CAST(0x03380B00 AS Date), 1, 19, 15, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (8, N'RXQ-DEMO', CAST(0x03380B00 AS Date), 2, 19, 15, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (9, N'RXQ-DEMO', CAST(0x03380B00 AS Date), 3, 17, 14, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (10, N'RXQ-DEMO', CAST(0x46380B00 AS Date), 1, 5, 5, 5, 5, 7, 7, 9, 6, 7, 3, 2, NULL, 1, NULL, NULL)
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (11, N'RXQ-DEMO', CAST(0x45380B00 AS Date), 1, 5, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, N'brian : 3/10/2014 1:13:14 AM', 1, N'UnSafe Action 1', N'Safe Action 1')
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (12, N'RXQ-DEMO', CAST(0x45380B00 AS Date), 2, 23, 4, 5, 2, 8, 6, 2, 8, 7, 6, 10, N'brian : 3/10/2014 12:28:44 AM', 1, N'UnSafe Action 3', N'Safe Action 1')
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (13, N'RXQ-DEMO 02', CAST(0x47380B00 AS Date), 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'brian : 3/12/2014 11:32:27 PM', 1, N'UnSafe Action 3', N'Safe Action 2')
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (14, N'RXQ-AH HEB', CAST(0x4A380B00 AS Date), 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'brian : 3/15/2014 10:57:46 PM', 0, N'UnSafe Action 1', N'Safe Action 1')
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (15, N'RXQ-AH CHA Ward', CAST(0x4A380B00 AS Date), 1, 12, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, N'brian : 3/15/2014 11:15:11 PM', 1, N'UnSafe Action 1', N'Safe Action 1')
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (16, N'RXQ-SM CDU', CAST(0x00000000 AS Date), 1, 5, 3, 1, 4, 2, 5, 3, 6, 4, 7, 5, N'brian : 16/03/2014 00:56:10', 0, N'UnSafe Action 3', N'Safe Action 2')
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (17, N'RXQ-SM CDU', CAST(0x00000000 AS Date), 2, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'brian : 16/03/2014 01:02:38', 0, N'UnSafe Action 1', N'Safe Action 1')
INSERT [dbo].[ShiftDetails] ([Index], [WardCode], [ShiftDate], [ShiftID], [Beds], [OptimumStaffingRN], [OptimumStaffingHCA], [SafeStaffingRN], [SafeStaffingHCA], [TodayTrustRN], [TodayTrustHCA], [TodayBankRN], [TodayBankHCA], [TodayNonTrustRN], [TodayNonTrustHCA], [DataEntryBy], [IsSafe], [UnSafeMitigation], [SafeMitigation]) VALUES (18, N'RXQ-SM CDU', CAST(0x00000000 AS Date), 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'brian : 16/03/2014 01:06:52', 0, N'UnSafe Action 1', N'Safe Action 1')
SET IDENTITY_INSERT [dbo].[ShiftDetails] OFF
INSERT [dbo].[ShiftTypes] ([ShiftID], [Name]) VALUES (1, N'Early')
INSERT [dbo].[ShiftTypes] ([ShiftID], [Name]) VALUES (2, N'Late')
INSERT [dbo].[ShiftTypes] ([ShiftID], [Name]) VALUES (3, N'Night')
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ_AE', 26, N'Early', N'Monday', 10, 1, 9, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Late', N'Monday', 1, 1, 1, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Night', N'Monday', 10, 1, 9, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Early', N'Tuesday', 10, 1, 9, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Late', N'Tuesday', 1, 1, 1, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Night', N'Tuesday', 10, 1, 9, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Early', N'Wednesday', 10, 1, 9, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Late', N'Wednesday', 1, 1, 1, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Night', N'Wednesday', 10, 1, 9, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Early', N'Thursday', 10, 1, 9, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Late', N'Thursday', 1, 1, 1, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Night', N'Thursday', 10, 1, 9, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Early', N'Friday', 10, 1, 9, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Late', N'Friday', 1, 1, 1, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Night', N'Friday', 10, 1, 9, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Early', N'Saturday', 10, 1, 9, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Late', N'Saturday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Night', N'Saturday', 10, 1, 9, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Early', N'Sunday', 10, 1, 9, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Late', N'Sunday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Night', N'Sunday', 10, 1, 9, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-AH HEB', 17, N'Early', N'Monday', 3, 4, 2, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Late', N'Monday', 2, 3, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Night', N'Monday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Early', N'Tuesday', 3, 4, 2, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Late', N'Tuesday', 2, 3, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Night', N'Tuesday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Early', N'Wednesday', 3, 4, 2, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Late', N'Wednesday', 2, 3, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Night', N'Wednesday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Early', N'Thursday', 3, 4, 2, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Late', N'Thursday', 2, 3, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Night', N'Thursday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Early', N'Friday', 3, 4, 2, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Late', N'Friday', 2, 3, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Night', N'Friday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Early', N'Saturday', 3, 3, 2, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Late', N'Saturday', 2, 3, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Night', N'Saturday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Early', N'Sunday', 3, 3, 2, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Late', N'Sunday', 2, 3, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Night', N'Sunday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-AH CHA', 22, N'Early', N'Monday', 3, 4, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Monday', 3, 4, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Monday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Tuesday', 3, 4, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Tuesday', 3, 4, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Tuesday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Wednesday', 3, 4, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Wednesday', 3, 4, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Wednesday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Thursday', 3, 4, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Thursday', 3, 4, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Thursday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Friday', 3, 4, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Friday', 3, 4, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Friday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Saturday', 3, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Saturday', 3, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Saturday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Sunday', 3, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Sunday', 3, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Sunday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-FNH', 11, N'Early', N'Monday', 3, 2, 2, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Late', N'Monday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Night', N'Monday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Early', N'Tuesday', 3, 2, 2, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Late', N'Tuesday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Night', N'Tuesday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Early', N'Wednesday', 3, 2, 2, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Late', N'Wednesday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Night', N'Wednesday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Early', N'Thursday', 3, 2, 2, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Late', N'Thursday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Night', N'Thursday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Early', N'Friday', 3, 2, 2, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Late', N'Friday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Night', N'Friday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Early', N'Saturday', 3, 2, 2, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Late', N'Saturday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Night', N'Saturday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Early', N'Sunday', 3, 2, 2, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Late', N'Sunday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Night', N'Sunday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-MH War', 12, N'Early', N'Monday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Late', N'Monday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Night', N'Monday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Early', N'Tuesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Late', N'Tuesday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Night', N'Tuesday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Early', N'Wednesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Late', N'Wednesday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Night', N'Wednesday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Early', N'Thursday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Late', N'Thursday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Night', N'Thursday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Early', N'Friday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Late', N'Friday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Night', N'Friday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Early', N'Saturday', 2, 1, 2, 0)
GO
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Late', N'Saturday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Night', N'Saturday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Early', N'Sunday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Late', N'Sunday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Night', N'Sunday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM W10', 25, N'Early', N'Monday', 6, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Monday', 5, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Night', N'Monday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Early', N'Tuesday', 6, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Tuesday', 5, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Night', N'Tuesday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Early', N'Wednesday', 6, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Wednesday', 5, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Night', N'Wednesday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Early', N'Thursday', 6, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Thursday', 5, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Night', N'Thursday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Early', N'Friday', 6, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Friday', 5, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Night', N'Friday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Early', N'Saturday', 6, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Saturday', 5, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Night', N'Saturday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Early', N'Sunday', 6, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Sunday', 5, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Night', N'Sunday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM BUR', 6, N'Early', N'Monday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Night', N'Monday', 1, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Early', N'Tuesday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Night', N'Tuesday', 1, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Early', N'Wednesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Night', N'Wednesday', 1, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Early', N'Thursday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Night', N'Thursday', 1, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Early', N'Friday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Night', N'Friday', 1, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Early', N'Saturday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Night', N'Saturday', 1, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Early', N'Sunday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Night', N'Sunday', 1, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM CDU', 20, N'Early', N'Monday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Night', N'Monday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Early', N'Tuesday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Night', N'Tuesday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Early', N'Wednesday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Night', N'Wednesday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Early', N'Thursday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Night', N'Thursday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Early', N'Friday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Night', N'Friday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Early', N'Saturday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Night', N'Saturday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Early', N'Sunday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Night', N'Sunday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM PAE', 5, N'Early', N'Monday', 2, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 5, N'Night', N'Monday', 2, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 5, N'Early', N'Tuesday', 2, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 5, N'Night', N'Tuesday', 2, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 5, N'Early', N'Wednesday', 2, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 5, N'Night', N'Wednesday', 2, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 5, N'Early', N'Thursday', 2, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 5, N'Night', N'Thursday', 2, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 5, N'Early', N'Friday', 2, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 5, N'Night', N'Friday', 2, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 5, N'Early', N'Saturday', 2, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 5, N'Night', N'Saturday', 2, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 5, N'Early', N'Sunday', 2, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 5, N'Night', N'Sunday', 2, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM W15', 18, N'Early', N'Monday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Monday', 3, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Monday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Tuesday', 3, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Tuesday', 3, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Tuesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Wednesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Wednesday', 3, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Wednesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Thursday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Thursday', 3, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Thursday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Friday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Friday', 3, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Friday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Saturday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Saturday', 3, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Saturday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Sunday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Sunday', 3, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Sunday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM W9', 22, N'Early', N'Monday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Monday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Monday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Tuesday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Tuesday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Tuesday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Wednesday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Wednesday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Wednesday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Thursday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Thursday', 4, 2, 3, 1)
GO
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Thursday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Friday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Friday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Friday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Saturday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Saturday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Saturday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Sunday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Sunday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Sunday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM STA', 33, N'Early', N'Monday', 11, 4, 9, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM STP', 33, N'Late', N'Monday', 11, 4, 9, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Night', N'Monday', 11, 3, 9, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Early', N'Tuesday', 11, 4, 9, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Late', N'Tuesday', 11, 4, 9, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Night', N'Tuesday', 11, 3, 9, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Early', N'Wednesday', 11, 4, 9, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Late', N'Wednesday', 11, 4, 9, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Night', N'Wednesday', 11, 3, 9, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Early', N'Thursday', 11, 4, 9, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Late', N'Thursday', 11, 4, 9, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Night', N'Thursday', 11, 3, 9, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Early', N'Friday', 11, 4, 9, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Late', N'Friday', 11, 4, 9, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Night', N'Friday', 11, 3, 9, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Early', N'Saturday', 11, 4, 9, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Late', N'Saturday', 11, 4, 9, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Night', N'Saturday', 11, 3, 9, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Early', N'Sunday', 11, 4, 9, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Late', N'Sunday', 11, 4, 9, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 33, N'Night', N'Sunday', 11, 3, 9, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM STD', 23, N'Early', N'Monday', 4, 3, 4, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Monday', 4, 3, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Monday', 3, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Tuesday', 4, 3, 4, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Tuesday', 4, 3, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Tuesday', 3, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Wednesday', 4, 3, 4, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Wednesday', 4, 3, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Wednesday', 3, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Thursday', 4, 3, 4, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Thursday', 4, 3, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Thursday', 3, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Friday', 4, 3, 4, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Friday', 4, 3, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Friday', 3, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Saturday', 4, 3, 4, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Saturday', 4, 3, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Saturday', 3, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Sunday', 4, 3, 4, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Sunday', 4, 3, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Sunday', 3, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM STF', 9, N'Early', N'Monday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 9, N'Night', N'Monday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 9, N'Early', N'Tuesday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 9, N'Night', N'Tuesday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 9, N'Early', N'Wednesday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 9, N'Night', N'Wednesday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 9, N'Early', N'Thursday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 9, N'Night', N'Thursday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 9, N'Early', N'Friday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 9, N'Night', N'Friday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 9, N'Early', N'Saturday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 9, N'Night', N'Saturday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 9, N'Early', N'Sunday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 9, N'Night', N'Sunday', 3, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM STG', 23, N'Early', N'Monday', 4, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Monday', 4, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Monday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Tuesday', 4, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Tuesday', 4, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Tuesday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Wednesday', 4, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Wednesday', 4, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Wednesday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Thursday', 4, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Thursday', 4, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Thursday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Friday', 4, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Friday', 4, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Friday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Saturday', 4, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Saturday', 4, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Saturday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Sunday', 4, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Sunday', 4, 3, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Sunday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM STJ', 16, N'Early', N'Monday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Monday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Monday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Early', N'Tuesday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Tuesday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Tuesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Early', N'Wednesday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Wednesday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Wednesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Early', N'Thursday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Thursday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Thursday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Early', N'Friday', 3, 2, 2, 2)
GO
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Friday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Friday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Early', N'Saturday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Saturday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Saturday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Early', N'Sunday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Sunday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Sunday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM W1', 42, N'Early', N'Monday', 7, 5, 5, 4)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM W2', 42, N'Late', N'Monday', 6, 4, 5, 4)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Night', N'Monday', 5, 3, 4, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Early', N'Tuesday', 7, 5, 5, 4)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Late', N'Tuesday', 6, 4, 5, 4)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Night', N'Tuesday', 5, 3, 4, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Early', N'Wednesday', 7, 5, 5, 4)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Late', N'Wednesday', 6, 4, 5, 4)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Night', N'Wednesday', 5, 3, 4, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Early', N'Thursday', 7, 5, 5, 4)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Late', N'Thursday', 6, 4, 5, 4)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Night', N'Thursday', 5, 3, 4, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Early', N'Friday', 7, 5, 5, 4)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Late', N'Friday', 6, 4, 5, 4)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Night', N'Friday', 5, 3, 4, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Early', N'Saturday', 7, 5, 5, 4)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Late', N'Saturday', 6, 4, 5, 4)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Night', N'Saturday', 5, 3, 4, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Early', N'Sunday', 7, 5, 5, 4)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Late', N'Sunday', 6, 4, 5, 4)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 42, N'Night', N'Sunday', 5, 3, 4, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM W4', 23, N'Early', N'Monday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Monday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Monday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Tuesday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Tuesday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Tuesday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Wednesday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Wednesday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Wednesday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Thursday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Thursday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Thursday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Friday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Friday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Friday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Saturday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Saturday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Saturday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Sunday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Sunday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Sunday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM W5', 18, N'Early', N'Monday', 5, 1, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Monday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Monday', 3, 1, 3, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Tuesday', 5, 1, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Tuesday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Tuesday', 3, 1, 3, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Wednesday', 5, 1, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Wednesday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Wednesday', 3, 1, 3, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Thursday', 5, 1, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Thursday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Thursday', 3, 1, 3, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Friday', 5, 1, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Friday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Friday', 3, 1, 3, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Saturday', 5, 1, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Saturday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Saturday', 3, 1, 3, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Sunday', 5, 1, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Sunday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Sunday', 3, 1, 3, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM W6', 24, N'Early', N'Monday', 5, 3, 5, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Late', N'Monday', 5, 2, 5, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Monday', 4, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Early', N'Tuesday', 5, 3, 5, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Late', N'Tuesday', 5, 2, 5, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Tuesday', 4, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Early', N'Wednesday', 5, 3, 5, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Late', N'Wednesday', 5, 2, 5, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Wednesday', 4, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Early', N'Thursday', 5, 3, 5, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Late', N'Thursday', 5, 2, 5, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Thursday', 4, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Early', N'Friday', 5, 3, 5, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Late', N'Friday', 5, 2, 5, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Friday', 4, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Early', N'Saturday', 5, 3, 5, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Late', N'Saturday', 5, 2, 5, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Saturday', 4, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Early', N'Sunday', 5, 3, 5, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Late', N'Sunday', 5, 2, 5, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Sunday', 4, 2, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM W7', 19, N'Early', N'Monday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Late', N'Monday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Night', N'Monday', 3, 1, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Early', N'Tuesday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Late', N'Tuesday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Night', N'Tuesday', 3, 1, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Early', N'Wednesday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Late', N'Wednesday', 4, 1, 3, 1)
GO
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Night', N'Wednesday', 3, 1, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Early', N'Thursday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Late', N'Thursday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Night', N'Thursday', 3, 1, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Early', N'Friday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Late', N'Friday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Night', N'Friday', 3, 1, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Early', N'Saturday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Late', N'Saturday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Night', N'Saturday', 3, 1, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Early', N'Sunday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Late', N'Sunday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Night', N'Sunday', 3, 1, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM W8', 21, N'Early', N'Monday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Late', N'Monday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Night', N'Monday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Early', N'Tuesday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Late', N'Tuesday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Night', N'Tuesday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Early', N'Wednesday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Late', N'Wednesday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Night', N'Wednesday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Early', N'Thursday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Late', N'Thursday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Night', N'Thursday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Early', N'Friday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Late', N'Friday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Night', N'Friday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Early', N'Saturday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Late', N'Saturday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Night', N'Saturday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Early', N'Sunday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Late', N'Sunday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 21, N'Night', N'Sunday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM W16', 25, N'Early', N'Monday', 5, 3, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Monday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Night', N'Monday', 3, 2, 3, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Early', N'Tuesday', 5, 3, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Tuesday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Night', N'Tuesday', 3, 2, 3, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Early', N'Wednesday', 5, 3, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Wednesday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Night', N'Wednesday', 3, 2, 3, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Early', N'Thursday', 5, 3, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Thursday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Night', N'Thursday', 3, 2, 3, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Early', N'Friday', 5, 3, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Friday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Night', N'Friday', 3, 2, 3, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Early', N'Saturday', 4, 3, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Saturday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Night', N'Saturday', 3, 2, 3, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Early', N'Sunday', 4, 3, 4, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Sunday', 4, 2, 3, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Night', N'Sunday', 3, 2, 3, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM W16', 23, N'Early', N'Monday', 4, 3, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Monday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Monday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Tuesday', 4, 3, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Tuesday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Tuesday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Wednesday', 4, 3, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Wednesday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Wednesday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Thursday', 4, 3, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Thursday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Thursday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Friday', 4, 3, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Friday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Friday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Saturday', 4, 3, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Saturday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Saturday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Sunday', 4, 3, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Late', N'Sunday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Sunday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-THC Wa', 10, N'Early', N'Monday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Monday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Monday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Early', N'Tuesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Tuesday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Tuesday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Early', N'Wednesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Wednesday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Wednesday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Early', N'Thursday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Thursday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Thursday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Early', N'Friday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Friday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Friday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Early', N'Saturday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Saturday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Saturday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Early', N'Sunday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Sunday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Sunday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-AH WSC', 24, N'Early', N'Monday', 3, 5, 3, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Late', N'Monday', 3, 5, 3, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Monday', 2, 2, 2, 1)
GO
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Early', N'Tuesday', 3, 5, 3, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Late', N'Tuesday', 3, 5, 3, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Tuesday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Early', N'Wednesday', 3, 5, 3, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Late', N'Wednesday', 3, 5, 3, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Wednesday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Early', N'Thursday', 3, 5, 3, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Late', N'Thursday', 3, 5, 3, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Thursday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Early', N'Friday', 3, 5, 3, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Late', N'Friday', 3, 5, 3, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Friday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Early', N'Saturday', 3, 4, 3, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Late', N'Saturday', 3, 4, 3, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Saturday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Early', N'Sunday', 3, 4, 3, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Late', N'Sunday', 3, 4, 3, 3)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Sunday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-WH CSR', 10, N'Early', N'Monday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Monday', 3, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Monday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Early', N'Tuesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Tuesday', 3, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Tuesday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Early', N'Wednesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Wednesday', 3, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Wednesday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Early', N'Thursday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Thursday', 3, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Thursday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Early', N'Friday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Friday', 3, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Friday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Early', N'Saturday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Saturday', 3, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Saturday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Early', N'Sunday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Sunday', 3, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Sunday', 2, 0, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-WH W5B', 20, N'Early', N'Monday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Late', N'Monday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Night', N'Monday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Early', N'Tuesday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Late', N'Tuesday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Night', N'Tuesday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Early', N'Wednesday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Late', N'Wednesday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Night', N'Wednesday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Early', N'Thursday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Late', N'Thursday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Night', N'Thursday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Early', N'Friday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Late', N'Friday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Night', N'Friday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Early', N'Saturday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Late', N'Saturday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Night', N'Saturday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Early', N'Sunday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Late', N'Sunday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Night', N'Sunday', 2, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-WH W7', 18, N'Early', N'Monday', 3, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Tuesday', 3, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Wednesday', 3, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Thursday', 3, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Friday', 3, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Saturday', 3, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Sunday', 3, 0, NULL, NULL)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-WH W8', 30, N'Early', N'Monday', 7, 3, 6, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-WH W9', 30, N'Late', N'Monday', 7, 2, 6, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Night', N'Monday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Early', N'Tuesday', 7, 3, 6, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Late', N'Tuesday', 7, 2, 6, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Night', N'Tuesday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Early', N'Wednesday', 7, 3, 6, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Late', N'Wednesday', 7, 2, 6, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Night', N'Wednesday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Early', N'Thursday', 7, 3, 6, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Late', N'Thursday', 7, 2, 6, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Night', N'Thursday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Early', N'Friday', 7, 3, 6, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Late', N'Friday', 7, 2, 6, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Night', N'Friday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Early', N'Saturday', 7, 3, 6, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Late', N'Saturday', 7, 2, 6, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Night', N'Saturday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Early', N'Sunday', 7, 3, 6, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Late', N'Sunday', 7, 2, 6, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 30, N'Night', N'Sunday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-WH W12', 14, N'Early', N'Monday', 3, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 14, N'Late', N'Monday', 3, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 14, N'Night', N'Monday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 14, N'Early', N'Tuesday', 3, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 14, N'Late', N'Tuesday', 3, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 14, N'Night', N'Tuesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 14, N'Early', N'Wednesday', 3, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Late', N'Wednesday', 3, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Night', N'Wednesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 17, N'Early', N'Thursday', 3, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Thursday', 3, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Thursday', 2, 1, 2, 0)
GO
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Early', N'Friday', 3, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 12, N'Late', N'Friday', 3, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Friday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 14, N'Early', N'Saturday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Late', N'Saturday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Saturday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 8, N'Early', N'Sunday', 2, 1, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 8, N'Late', N'Sunday', 1, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 8, N'Night', N'Sunday', 1, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-WH W12', 18, N'Early', N'Monday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Late', N'Monday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Monday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Tuesday', 4, 3, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Tuesday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 19, N'Night', N'Tuesday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Early', N'Wednesday', 5, 3, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Late', N'Wednesday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 18, N'Night', N'Wednesday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Thursday', 5, 3, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Thursday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Thursday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Friday', 5, 3, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 28, N'Late', N'Friday', 4, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Night', N'Friday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 23, N'Early', N'Saturday', 3, 3, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 25, N'Late', N'Saturday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 24, N'Night', N'Saturday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Sunday', 3, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Sunday', 2, 2, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Sunday', 2, 2, 2, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-WH W12', 7, N'Early', N'Monday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 8, N'Late', N'Monday', 3, 3, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Night', N'Monday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 11, N'Early', N'Tuesday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 13, N'Late', N'Tuesday', 3, 3, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Night', N'Tuesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 7, N'Early', N'Wednesday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 13, N'Late', N'Wednesday', 3, 3, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 13, N'Night', N'Wednesday', 2, 2, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Early', N'Thursday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 20, N'Late', N'Thursday', 3, 3, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 14, N'Night', N'Thursday', 2, 2, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 14, N'Early', N'Friday', 4, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 14, N'Late', N'Friday', 4, 3, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Night', N'Friday', 2, 2, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 10, N'Early', N'Saturday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 8, N'Late', N'Saturday', 3, 3, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 8, N'Night', N'Saturday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 8, N'Early', N'Sunday', 3, 2, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 6, N'Late', N'Sunday', 3, 3, 2, 2)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 4, N'Night', N'Sunday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-SM W3', 26, N'Early', N'Monday', 7, 0, 0, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Night', N'Monday', 7, 0, 0, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Early', N'Tuesday', 7, 0, 0, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Night', N'Tuesday', 7, 0, 0, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Early', N'Wednesday', 7, 0, 0, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Night', N'Wednesday', 7, 0, 0, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Early', N'Thursday', 7, 0, 0, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Night', N'Thursday', 7, 0, 0, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Early', N'Friday', 7, 0, 0, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Night', N'Friday', 7, 0, 0, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Early', N'Saturday', 7, 0, 0, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Night', N'Saturday', 7, 0, 0, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Early', N'Sunday', 7, 0, 0, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 26, N'Night', N'Sunday', 7, 0, 0, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-BCH Wa', 16, N'Early', N'Monday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Monday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Monday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Early', N'Tuesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Tuesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Tuesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Early', N'Wednesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Wednesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Wednesday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Early', N'Thursday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Thursday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Thursday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Early', N'Friday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Friday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Friday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Early', N'Saturday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Saturday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Saturday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Early', N'Sunday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Late', N'Sunday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 16, N'Night', N'Sunday', 2, 1, 2, 0)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (N'RXQ-WH CCU', 22, N'Early', N'Monday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Monday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Monday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Tuesday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Tuesday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Tuesday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Wednesday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Wednesday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Wednesday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Thursday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Thursday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Thursday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Friday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Friday', 5, 2, 4, 1)
GO
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Friday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Saturday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Saturday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Saturday', 4, 1, 3, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Early', N'Sunday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Late', N'Sunday', 5, 2, 4, 1)
INSERT [dbo].[Staffing] ([Ward Code], [Beds], [Shift], [Day], [Optimum Staffing RN], [Optimum Staffing HCA], [Safe Staffing RN], [Safe Staffing HCA]) VALUES (NULL, 22, N'Night', N'Sunday', 4, 1, 3, 1)
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-AH CHA Ward', N'Chartridge', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-AH HEB', N'Bucks Neuro Rehab', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-AH WSC Unit', N'Waterside', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-BCH Ward', N'Buckingham', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-FNH Ward', N'Florence Nightingale', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-MH Ward', N'Marlow', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM BURNS UNIT', N'SM Burns Unit', NULL, N'Surgery & CC')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM CDU', N'CDU', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM DSU', N'SM DSU', NULL, N'Surgery & CC')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM ITU', N'SM ITU', NULL, N'Surgery & CC')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM PAED OBS', N'PDU', NULL, N'Specialist Services')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM ROTHS', N'Rothschild', NULL, N'Specialist Services')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM STA', N'St Andrews', NULL, N'Specialist Services')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM STD', N'St David', NULL, N'Specialist Services')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM STF', N'St Francis', NULL, N'Specialist Services')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM STG', N'St Goerge', NULL, N'Specialist Services')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM STJ', N'St Joseph', NULL, N'Specialist Services')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM STP', N'St Patrick', NULL, N'Specialist Services')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM W1', N'SM Ward 1', NULL, N'Surgery & CC')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM W10', N'SM Ward 10', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM W14', N'SM Ward 14', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM W15 SAU', N'SAU', NULL, N'Surgery & CC')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM W16a', N'SM Ward 16a', NULL, N'Surgery & CC')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM W16b', N'SM Ward 16b', NULL, N'Surgery & CC')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM W2', N'SM Ward 2', NULL, N'Surgery & CC')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM W3', N'SM Ward 3', NULL, N'Specialist Services')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM W4', N'SM Ward 4', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM W5', N'SM Ward 5', NULL, N'Specialist Services')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM W6', N'SM Ward 6', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM W7', N'SM Ward 7', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM W8', N'SM Ward 8 & 9', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-SM W9', N'SM Ward 8 & 9', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-THC Ward', N'Thame', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-WH CCU2A', N'CCU 2A', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-WH CSRU', N'CSRU', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-WH DSU', N'WH DSU', NULL, N'Surgery & CC')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-WH ITU', N'WH ITU', NULL, N'Surgery & CC')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-WH MAT BC', N'WH Birth Centre', NULL, N'Specialist Services')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-WH W12A', N'WH Ward 12A', NULL, N'Surgery & CC')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-WH W12B', N'WH Ward 12B', NULL, N'Surgery & CC')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-WH W12C', N'WH Ward 12C', NULL, N'Surgery & CC')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-WH W5B', N'WH Ward 5B', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-WH W8', N'WH Ward 8', NULL, N'Integrated Medicine')
INSERT [dbo].[Wards] ([WardCode], [WardName], [Beds], [Division]) VALUES (N'RXQ-WH W9', N'WH Ward 9', NULL, N'Integrated Medicine')
/****** Object:  Index [PK__aspnet_A__C93A4C98014935CB]    Script Date: 3/16/2014 8:05:45 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__17477DE40425A276]    Script Date: 3/16/2014 8:05:45 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__3091033107020F21]    Script Date: 3/16/2014 8:05:45 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_M__1788CC4D1FCDBCEB]    Script Date: 3/16/2014 8:05:45 AM ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__CD67DC5859063A47]    Script Date: 3/16/2014 8:05:45 AM ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__3214EC06656C112C]    Script Date: 3/16/2014 8:05:45 AM ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_ncindex2]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_R__8AFACE1B4222D4EF]    Script Date: 3/16/2014 8:05:45 AM ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_U__1788CC4D0BC6C43E]    Script Date: 3/16/2014 8:05:45 AM ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_Users_Index2]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_UsersInRoles_index]    Script Date: 3/16/2014 8:05:45 AM ******/
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
USE [master]
GO
ALTER DATABASE [NHSOperationsDatabase] SET  READ_WRITE 
GO
