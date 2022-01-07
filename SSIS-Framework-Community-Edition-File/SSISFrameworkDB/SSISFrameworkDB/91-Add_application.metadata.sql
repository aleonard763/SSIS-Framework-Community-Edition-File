/*

Script: 91-Add_application.metadata.sql
Author: Andy Leonard
Date: 06 Jan 2022

Version History:
 06 Jan 2022 - v1.0.20220106 - Andy Leonard - initial release.

© 2022 Enterprise Data & Analytics

*/

Set NoCount ON

use [SSISFrameworkDB]
go

declare @ApplicationName varchar(255) = 'File Framework Test'

declare @ApplicationID int = (Select ApplicationID
                              From cfg.Applications
							  Where ApplicationName = @ApplicationName)

print 'Application Name: ' + @ApplicationName
If (@ApplicationID Is NULL)
 begin
  
  print ' - Adding Application Name: ' + @ApplicationName

  declare @tblApp table (ApplicationID int)

  Insert Into cfg.Applications
  (ApplicationName)
  Output inserted.ApplicationID Into @tblApp
  Values (@ApplicationName)

  Set @ApplicationID = (Select ApplicationID
                        From @tblApp)

  print ' - Application Name: ' + @ApplicationName + ' added. ApplicationID = ' + Convert(varchar(12), @ApplicationID)

 end
Else
 begin

  print ' - Application Name: ' + @ApplicationName + ' already exists. ApplicationID = ' + Convert(varchar(12), @ApplicationID)

 end