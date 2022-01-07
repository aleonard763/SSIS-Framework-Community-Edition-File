/*

Script: 4-Create_cfg_ApplicationPackages.table.sql
Author: Andy Leonard
Date: 06 Jan 2022

Version History:
 06 Jan 2022 - v1.0.20220106 - Andy Leonard - initial release.

© 2022 Enterprise Data & Analytics

*/

use [SSISFrameworkDB]
go

print 'cfg.ApplicationPackages Table'

If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[schemas] s
			  Join [sys].[tables] t
			    On t.[schema_id] = s.[schema_id]
			  Where s.[name] = N'cfg'
			    And t.[name] = N'ApplicationPackages')
 begin
  print ' - Creating cfg.ApplicationPackages Table'

  Create Table cfg.ApplicationPackages
  (
      ApplicationPackageID int identity(1, 1) Not NULL
	   Constraint PK_cfg_ApplicationPackages
	    Primary Key
   , ApplicationID int Not NULL
      Constraint FK_cfg_ApplicationPackages_Applications_ApplicationID
	   Foreign Key
	    References cfg.Applications(ApplicationID)
   , PackageID int Not NULL
      Constraint FK_cfg_ApplicationPackages_Packages_PackageID
	   Foreign Key
	    References cfg.Packages(PackageID)
   , ExecutionOrder int Not NULL
      Constraint DF_cfg_ApplicationPackages_ExecutionOrder
	   Default(10)
   , ApplicationPackageEnabled bit Not NULL
      Constraint DF_cfg_ApplicationPackages_ApplicationPackageEnabled
	   Default(1)
   , FailApplicationOnPackageFailure bit Not NULL
      Constraint DF_cfg_ApplicationPackages_FailApplicationOnPackageFailure
	   Default(1)
  )

  print ' - cfg.ApplicationPackages Table created'
 end
Else
 begin
  print ' - cfg.ApplicationPackages Table already exists.'
 end
print ''

print 'UQ_cfg_ApplicationPackages_ApplicationID_PackageID_ExecutionOrder unique constraint'
If Not Exists(Select [name]
              From [sys].[key_constraints]
			  Where [name] = N'UQ_cfg_ApplicationPackages_ApplicationID_PackageID_ExecutionOrder')
 begin
  print ' - Adding UQ_cfg_ApplicationPackages_ApplicationID_PackageID_ExecutionOrder unique constraint'

  Alter Table cfg.ApplicationPackages
   Add Constraint UQ_cfg_ApplicationPackages_ApplicationID_PackageID_ExecutionOrder
    Unique(ApplicationID, PackageID, ExecutionOrder)

  print ' - UQ_cfg_ApplicationPackages_ApplicationID_PackageID_ExecutionOrder unique constraint added'
 end
Else
 begin
  print ' - UQ_cfg_Packages_PackageFolder_PackageName unique constraint already exists.'
 end
