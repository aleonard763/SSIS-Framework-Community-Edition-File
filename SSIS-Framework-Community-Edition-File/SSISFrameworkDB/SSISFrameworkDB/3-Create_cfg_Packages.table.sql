/*

Script: 3-Create_cfg_Packages.table.sql
Author: Andy Leonard
Date: 06 Jan 2022

Version History:
 06 Jan 2022 - v1.0.20220106 - Andy Leonard - initial release.

© 2022 Enterprise Data & Analytics

*/

use [SSISFrameworkDB]
go

print 'cfg.Packages Table'

If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[schemas] s
			  Join [sys].[tables] t
			    On t.[schema_id] = s.[schema_id]
			  Where s.[name] = N'cfg'
			    And t.[name] = N'Packages')
 begin
  print ' - Creating cfg.Packages Table'

  Create Table cfg.Packages
  (
      PackageID int identity(1, 1) Not NULL
	   Constraint PK_cfg_Packages
	    Primary Key
   , PackageFolder varchar(255) Not NULL
   , PackageName varchar(255) Not NULL
  )

  print ' - cfg.Packages Table created'
 end
Else
 begin
  print ' - cfg.Packages Table already exists.'
 end
print ''

print 'UQ_cfg_Packages_PackageFolder_PackageName unique constraint'
If Not Exists(Select [name]
              From [sys].[key_constraints]
			  Where [name] = N'UQ_cfg_Packages_PackageFolder_PackageName')
 begin
  print ' - Adding UQ_cfg_Packages_PackageFolder_PackageName unique constraint'

  Alter Table cfg.Packages
   Add Constraint UQ_cfg_Packages_PackageFolder_PackageName
    Unique(PackageFolder, PackageName)

  print ' - UQ_cfg_Packages_PackageFolder_PackageName unique constraint added'
 end
Else
 begin
  print ' - UQ_cfg_Packages_PackageFolder_PackageName unique constraint already exists.'
 end
