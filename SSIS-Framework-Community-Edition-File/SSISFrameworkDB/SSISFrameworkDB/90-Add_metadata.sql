/*

Script: 90-Add_metadata.sql
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

:setvar ScriptPath "E:\github\SSIS-Framework-Community-Edition-File\SSISFrameworkDB\SSISFrameworkDB\"

/* $(ScriptPath)91-Add_application.metadata.sql' */
print ' * Executing $(ScriptPath)91-Add_application.metadata.sql'
:r $(ScriptPath)91-Add_application.metadata.sql
print ''

/* $(ScriptPath)92-Add_packages.metadata.sql' */
print ' * Executing $(ScriptPath)92-Add_packages.metadata.sql'
:r $(ScriptPath)92-Add_packages.metadata.sql
print ''
