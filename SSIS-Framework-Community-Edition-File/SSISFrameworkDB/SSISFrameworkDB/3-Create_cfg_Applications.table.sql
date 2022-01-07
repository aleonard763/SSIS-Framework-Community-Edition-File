/*

Script: 3-Create_cfg_Applications.table.sql
Author: Andy Leonard
Date: 06 Jan 2022

Version History:
 06 Jan 2022 - v1.0.20220106 - Andy Leonard - initial release.

© 2022 Enterprise Data & Analytics

*/

use [SSISFrameworkDB]
go

print 'cfg.Applications Table'

If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[schemas] s
			  Join [sys].[tables] t
			    On t.[schema_id] = s.[schema_id]
			  Where s.[name] = N'cfg'
			    And t.[name] = N'Applications')
 begin
  print ' - Creating cfg.Applications Table'

  Create Table cfg.Applications
  (
      ApplicationID int identity(1, 1) Not NULL
	   Constraint PK_cfg_Applications
	    Primary Key
   , ApplicationName varchar(255) Not NULL
      Constraint UQ_cfg_Applications_ApplicationName
	   Unique
  )

  print ' - cfg.Applications Table created'
 end
Else
 begin
  print ' - cfg.Applications Table already exists.'
 end
