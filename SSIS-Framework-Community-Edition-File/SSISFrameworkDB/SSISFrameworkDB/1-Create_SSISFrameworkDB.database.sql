/*

Script: 1-Create_SSISFrameworkDB.database.sql
Author: Andy Leonard
Date: 06 Jan 2022

Version History:
 06 Jan 2022 - v1.0.20220106 - Andy Leonard - initial release.

© 2022 Enterprise Data & Analytics

*/

Use [master]
go

print 'SSISFrameworkDB database'
If Not Exists(Select [name]
              From [sys].[databases]
			  Where [name] = N'SSISFrameworkDB')
 begin
  print ' - Creating SSISFrameworkDB database'

  Create Database SSISFrameworkDB

  print ' - SSISFrameworkDB database created'
 end
Else
 begin
  print ' - SSISFrameworkDB database already exists.'
 end


