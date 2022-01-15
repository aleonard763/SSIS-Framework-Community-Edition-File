/*

Script: 0-Build.sql
Author: Andy Leonard
Date: 06 Jan 2022

Version History:
 06 Jan 2022 - v1.0.20220106 - Andy Leonard - initial release.

© 2022 Enterprise Data & Analytics

*/

/*

  1. "Incorrect syntax near ':'."
     If you see this error, click Query>SQLCMD Mode.

*/

print 'SSISFrameworkDB database'
print ''

:setvar ScriptPath "E:\_test\SSIS-Framework-File-Community-Edition-main_20220115\SSISFrameworkDB\SSISFrameworkDB\"

/* $(ScriptPath)1-Create_SSISFrameworkDB.database.sql' */
print ' * Executing $(ScriptPath)1-Create_SSISFrameworkDB.database.sql'
:r $(ScriptPath)1-Create_SSISFrameworkDB.database.sql
print ''
go

/* $(ScriptPath)2-Create_cfg.schema.sql' */
print ' * Executing $(ScriptPath)2-Create_cfg.schema.sql'
:r $(ScriptPath)2-Create_cfg.schema.sql
print ''

/* $(ScriptPath)3-Create_cfg_Applications.table.sql' */
print ' * Executing $(ScriptPath)3-Create_cfg_Applications.table.sql'
:r $(ScriptPath)3-Create_cfg_Applications.table.sql
print ''

/* $(ScriptPath)3-Create_cfg_Packages.table.sql' */
print ' * Executing $(ScriptPath)3-Create_cfg_Packages.table.sql'
:r $(ScriptPath)3-Create_cfg_Packages.table.sql
print ''

/* $(ScriptPath)4-Create_cfg_ApplicationPackages.table.sql' */
print ' * Executing $(ScriptPath)4-Create_cfg_ApplicationPackages.table.sql'
:r $(ScriptPath)4-Create_cfg_ApplicationPackages.table.sql
print ''

