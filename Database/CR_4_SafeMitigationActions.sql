use WebFormsDataCaptureSafeStaffing

GO

CREATE TABLE SafeMitigationActions
(
[Action] nvarchar(200),
);

GO
/****** Object:  StoredProcedure [dbo].[InsertSafeMitigationActions]    Script Date: 08/04/2014 22:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Brian>
-- Create date: <Create Date,04-08-2014>
-- Description:	<Description,Insert InsertSafeMitigationActions>
-- =============================================
CREATE PROCEDURE [dbo].[InsertSafeMitigationActions]
	@Action varchar(200)
AS
BEGIN
INSERT INTO [dbo].[SafeMitigationActions]
           ([Action])
     VALUES
           (@Action)
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllWards]    Script Date: 08/04/2014 22:32:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Brian>
-- Create date: <Create Date,04-08-2014>
-- Description:	<Description,Get All SafeMitigationActions>
-- =============================================
Create PROCEDURE [dbo].[GetSafeMitigationActions]
AS
BEGIN
SELECT [Action]
  FROM [dbo].[SafeMitigationActions]
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Brian>
-- Create date: <Create Date,04-08-2014>
-- Description:	<Description,Delete SafeMitigationActions>
-- =============================================
Create PROCEDURE [dbo].[DeleteSafeMitigationAction]
	@Action varchar(200)
AS
BEGIN
DELETE FROM [dbo].[SafeMitigationActions]
      WHERE [Action]=@Action
END

GO 

/****** Object:  StoredProcedure [dbo].[UpdateWard]    Script Date: 08/04/2014 22:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author : Brian>
-- Create date: <Create Date,04-08-2014>
-- Description:	<Description,Update SafeMitigationActions>
-- =============================================
Create PROCEDURE [dbo].[UpdateSafeMitigationActions]
	@OldAction varchar(200),
	@Action varchar(200)
AS
BEGIN
UPDATE [dbo].[SafeMitigationActions]
   SET [Action] = @Action
 WHERE [Action]=@OldAction
END

GO

INSERT [dbo].SafeMitigationActions values('Out to additional agency')
INSERT [dbo].SafeMitigationActions values('Closed beds')
INSERT [dbo].SafeMitigationActions values('Reviewed activity')
INSERT [dbo].SafeMitigationActions values('Cross Cover/Other staff utilised')