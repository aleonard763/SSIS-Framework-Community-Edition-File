/*

Script: 92-Add_packages.metadata.sql
Author: Andy Leonard
Date: 06 Jan 2022

Version History:
 06 Jan 2022 - v1.0.20220106 - Andy Leonard - initial release.

© 2022 Enterprise Data & Analytics

*/

Set NoCount ON

use [SSISFrameworkDB]
go

/* Child1 */
declare @PackageFolder varchar(255) = 'E:\_test\SSIS-Framework-File-Community-Edition-main_20220115\SSIS Framework Community Edition File\FileFrameworkTest1\'
declare @PackageName varchar(255) = 'Child1.dtsx'

declare @PackageID int = (Select PackageID
                          From cfg.Packages
					      Where PackageFolder = @PackageFolder
						    And PackageName = @PackageName)

print 'Package Folder: ' + @PackageFolder 
    + ' Package Name: ' + @PackageName

If (@PackageID Is NULL)
 begin
  
  print ' - Adding Package Folder: ' + @PackageFolder 
      + ' Package Name: ' + @PackageName

  declare @tblPkg table (PackageID int)

  Insert Into cfg.Packages
  (PackageFolder, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values (@PackageFolder, @PackageName)

  Set @PackageID = (Select PackageID
                    From @tblPkg)

  print ' - Package Folder: ' + @PackageFolder 
      + ' Package Name: ' + @PackageName 
	  + ' added. PackageID = ' + Convert(varchar(12), @PackageID)

 end
Else
 begin

  print ' - Package Folder: ' + @PackageFolder 
      + ' Package Name: ' + @PackageName 
	  + ' already exists. PackageID = ' + Convert(varchar(12), @PackageID)

 end

declare @ApplicationName varchar(255) = 'File Framework Test'

declare @ApplicationID int = (Select ApplicationID
                              From cfg.Applications
							  Where ApplicationName = @ApplicationName)

declare @ExecutionOrder int = 10

declare @ApplicationPackageID int = (Select ApplicationPackageID
                                     From cfg.ApplicationPackages
									 Where ApplicationID = @ApplicationID
									   And PackageID = @PackageID
									   And ExecutionOrder = @ExecutionOrder)

If (@ApplicationPackageID Is NULL)
 begin
  
  print ' - Adding Application ID: ' + Convert(varchar(12), @ApplicationID)
      + ' Package ID: ' + Convert(varchar(12), @PackageID)
      + ' Execution Order: ' + Convert(varchar(12), @ExecutionOrder)

  declare @tblAppPkg table (ApplicationPackageID int)

  Insert Into cfg.ApplicationPackages
  (ApplicationID
  ,PackageID
  ,ExecutionOrder)
  Output inserted.ApplicationPackageID Into @tblAppPkg
  Values
  (@ApplicationID
  ,@PackageID
  ,@ExecutionOrder)
  
  set @ApplicationPackageID = (Select ApplicationPackageID
                               From @tblAppPkg)
  
  print ' - Application ID: ' + Convert(varchar(12), @ApplicationID)
      + ' Package ID: ' + Convert(varchar(12), @PackageID)
      + ' Execution Order: ' + Convert(varchar(12), @ExecutionOrder)
	  + ' added. ApplicationPackageID = ' + Convert(varchar(12), @ApplicationPackageID)

 end
Else
 begin

  print ' - Application ID: ' + Convert(varchar(12), @ApplicationID)
      + ' Package ID: ' + Convert(varchar(12), @PackageID)
      + ' Execution Order: ' + Convert(varchar(12), @ExecutionOrder)
	  + ' already exists. ApplicationPackageID = ' + Convert(varchar(12), @ApplicationPackageID)

 end

/* Child2 */
set @PackageFolder = 'E:\_test\SSIS-Framework-File-Community-Edition-main_20220115\SSIS Framework Community Edition File\FileFrameworkTest2\'
set @PackageName = 'Child2.dtsx'
set @ExecutionOrder = 20
set @PackageID = (Select PackageID
                  From cfg.Packages
			      Where PackageFolder = @PackageFolder
				    And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID
                             From cfg.ApplicationPackages
							 Where ApplicationID = @ApplicationID
							   And PackageID = @PackageID
							   And ExecutionOrder = @ExecutionOrder)

print 'Package Folder: ' + @PackageFolder 
    + ' Package Name: ' + @PackageName

If (@PackageID Is NULL)
 begin
  
  print ' - Adding Package Folder: ' + @PackageFolder 
      + ' Package Name: ' + @PackageName

  delete @tblPkg

  Insert Into cfg.Packages
  (PackageFolder, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values (@PackageFolder, @PackageName)

  Set @PackageID = (Select PackageID
                    From @tblPkg)

  print ' - Package Folder: ' + @PackageFolder 
      + ' Package Name: ' + @PackageName 
	  + ' added. PackageID = ' + Convert(varchar(12), @PackageID)

 end
Else
 begin

  print ' - Package Folder: ' + @PackageFolder 
      + ' Package Name: ' + @PackageName 
	  + ' already exists. PackageID = ' + Convert(varchar(12), @PackageID)

 end

If (@ApplicationPackageID Is NULL)
 begin
  
  print ' - Adding Application ID: ' + Convert(varchar(12), @ApplicationID)
      + ' Package ID: ' + Convert(varchar(12), @PackageID)
      + ' Execution Order: ' + Convert(varchar(12), @ExecutionOrder)

  delete @tblAppPkg

  Insert Into cfg.ApplicationPackages
  (ApplicationID
  ,PackageID
  ,ExecutionOrder)
  Output inserted.ApplicationPackageID Into @tblAppPkg
  Values
  (@ApplicationID
  ,@PackageID
  ,@ExecutionOrder)
  
  set @ApplicationPackageID = (Select ApplicationPackageID
                               From @tblAppPkg)

  print ' - Application ID: ' + Convert(varchar(12), @ApplicationID)
      + ' Package ID: ' + Convert(varchar(12), @PackageID)
      + ' Execution Order: ' + Convert(varchar(12), @ExecutionOrder)
	  + ' added. ApplicationPackageID = ' + Convert(varchar(12), @ApplicationPackageID)

 end
Else
 begin

  print ' - Application ID: ' + Convert(varchar(12), @ApplicationID)
      + ' Package ID: ' + Convert(varchar(12), @PackageID)
      + ' Execution Order: ' + Convert(varchar(12), @ExecutionOrder)
	  + ' already exists. ApplicationPackageID = ' + Convert(varchar(12), @ApplicationPackageID)

 end

/* Child3 */
set @PackageFolder = 'E:\_test\SSIS-Framework-File-Community-Edition-main_20220115\SSIS Framework Community Edition File\FileFrameworkTest1\'
set @PackageName = 'Child3.dtsx'
set @ExecutionOrder = 30
set @PackageID = (Select PackageID
                  From cfg.Packages
			      Where PackageFolder = @PackageFolder
				    And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID
                             From cfg.ApplicationPackages
							 Where ApplicationID = @ApplicationID
							   And PackageID = @PackageID
							   And ExecutionOrder = @ExecutionOrder)

print 'Package Folder: ' + @PackageFolder 
    + ' Package Name: ' + @PackageName

If (@PackageID Is NULL)
 begin
  
  print ' - Adding Package Folder: ' + @PackageFolder 
      + ' Package Name: ' + @PackageName

  delete @tblPkg

  Insert Into cfg.Packages
  (PackageFolder, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values (@PackageFolder, @PackageName)

  Set @PackageID = (Select PackageID
                    From @tblPkg)

  print ' - Package Folder: ' + @PackageFolder 
      + ' Package Name: ' + @PackageName 
	  + ' added. PackageID = ' + Convert(varchar(12), @PackageID)

 end
Else
 begin

  print ' - Package Folder: ' + @PackageFolder 
      + ' Package Name: ' + @PackageName 
	  + ' already exists. PackageID = ' + Convert(varchar(12), @PackageID)

 end

If (@ApplicationPackageID Is NULL)
 begin
  
  print ' - Adding Application ID: ' + Convert(varchar(12), @ApplicationID)
      + ' Package ID: ' + Convert(varchar(12), @PackageID)
      + ' Execution Order: ' + Convert(varchar(12), @ExecutionOrder)

  delete @tblAppPkg

  Insert Into cfg.ApplicationPackages
  (ApplicationID
  ,PackageID
  ,ExecutionOrder)
  Output inserted.ApplicationPackageID Into @tblAppPkg
  Values
  (@ApplicationID
  ,@PackageID
  ,@ExecutionOrder)
  
  set @ApplicationPackageID = (Select ApplicationPackageID
                               From @tblAppPkg)

  print ' - Application ID: ' + Convert(varchar(12), @ApplicationID)
      + ' Package ID: ' + Convert(varchar(12), @PackageID)
      + ' Execution Order: ' + Convert(varchar(12), @ExecutionOrder)
	  + ' added. ApplicationPackageID = ' + Convert(varchar(12), @ApplicationPackageID)

 end
Else
 begin

  print ' - Application ID: ' + Convert(varchar(12), @ApplicationID)
      + ' Package ID: ' + Convert(varchar(12), @PackageID)
      + ' Execution Order: ' + Convert(varchar(12), @ExecutionOrder)
	  + ' already exists. ApplicationPackageID = ' + Convert(varchar(12), @ApplicationPackageID)

 end
