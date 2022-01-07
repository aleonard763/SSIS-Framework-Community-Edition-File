/*

Script: 2-Create_cfg.schema.sql
Author: Andy Leonard
Date: 06 Jan 2022

Version History:
 06 Jan 2022 - v1.0.20220106 - Andy Leonard - initial release.

© 2022 Enterprise Data & Analytics

*/

use [SSISFrameworkDB]
go

print 'cfg Schema'

If Not Exists(Select [name]
              From [sys].[schemas]
			  Where [name] = N'cfg')
 begin
  print ' - Creating cfg Schema'
  declare @cfgSchemaSql varchar(100) = 'Create Schema cfg'
  exec(@cfgSchemaSql)
  print ' - cfg Schema created'
 end
Else
 begin
  print ' - cfg Schema already exists.'
 end
