use WebFormsDataCaptureSafeStaffing

GO

/*Add new colums*/
alter table ShiftDetails ADD PlannedNumberRN int
alter table ShiftDetails ADD PlannedNumberHCA int

GO

/*Update SP's*/
ALTER PROCEDURE [dbo].[GetShiftDetailByDate] 
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
      ,[IsSafeAfterMitigation]
      ,[PlannedNumberRN]
      ,[PlannedNumberHCA]
  FROM [dbo].[ShiftDetails] s 
  JOIN [dbo].[Wards] w ON(s.WardCode = w.WardCode )
  JOIN [dbo].[ShiftTypes] t ON(s.ShiftID = t.ShiftID)
  WHERE s.ShiftDate >= @StartDate AND s.ShiftDate < @EndDate
  ORDER By [ShiftDate],[ShiftID]
END

GO

ALTER PROCEDURE [dbo].[InsertShiftDetailRecord] 
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
           ,@IsSafeAfterMitigation bit = NULL
           ,@PlannedNumberRN int = NULL
           ,@PlannedNumberHCA int = NULL
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
           ,[SafeMitigation]
           ,[IsSafeAfterMitigation]
           ,[PlannedNumberRN]
           ,[PlannedNumberHCA])
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
           ,@SafeMitigation
           ,@IsSafeAfterMitigation
           ,@PlannedNumberRN
           ,@PlannedNumberHCA)
END



GO

ALTER PROCEDURE [dbo].[UpdateShiftDetailRecord] 
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
           ,@IsSafeAfterMitigation bit = NULL
           ,@PlannedNumberRN int = NULL
           ,@PlannedNumberHCA int = NULL
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
      ,[IsSafeAfterMitigation] = @IsSafeAfterMitigation
      ,[PlannedNumberRN] = @PlannedNumberRN
      ,[PlannedNumberHCA] = @PlannedNumberHCA
 WHERE [WardCode]=@WardCode AND [ShiftDate]=@ShiftDate AND [ShiftID]=@ShiftID
END

GO

ALTER PROCEDURE [dbo].[GetShiftDetailByCodeDataShiftID] 
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
      ,[IsSafeAfterMitigation]
      ,[PlannedNumberRN]
      ,[PlannedNumberHCA]
  FROM [dbo].[ShiftDetails] s 
  JOIN [dbo].[Wards] w ON(s.WardCode = w.WardCode )
  JOIN [dbo].[ShiftTypes] t ON(s.ShiftID = t.ShiftID)
  WHERE s.WardCode = @WardCode AND s.ShiftDate = @ShiftDate AND s.ShiftID = @ShiftID
END
