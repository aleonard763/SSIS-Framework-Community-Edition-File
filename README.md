# SSIS-Framework-Community-Edition-File
A simple SSIS Framework for executing SSIS from the file system.

# Detailed Installation Instructions
Please find detailed installation instructions at [Announcing SSIS Framework File Community Edition](https://andyleonard.blog/2022/01/announcing-ssis-framework-file-community-edition/).

# Quick Framework Setup Instructions
Open the SSIS-Framework-Community-Edition-File\SSISFrameworkDB\SSISFrameworkDB.ssmssln SSMS solution.
Open the 0-Build.sql file, and edit the location of T-SQL scripts which initializes the value of the ScriptPath SQLCMD variable.
Click Query>SQLCMD Mode to turn on SQLCMD mode.
Double-check the SSMS database connection.
Execute 0-Build.sql.

# Quick Framework Metadata Instructions
Open the SSIS-Framework-Community-Edition-File\SSISFrameworkDB\SSISFrameworkDB\92-Add_packages.metadata.sql SQL script.
Edit the @PackageFolder parameter path found in three locations so it matches the file system location of your copy of those SSIS packages.
Execute the SSIS-Framework-Community-Edition-File\SSISFrameworkDB\SSISFrameworkDB\92-Add_packages.metadata.sql SQL script to add the metadata to the framework.

# Execute the 'File Framework Test' Framework Application
Open a command window (cmd).
Edit the path of the Parent.dtsx (in _italics_ below) so the path to Parent.dtsx matches your implementation:
  dtexec.exe /FILE "_E:\github\SSIS-Framework-Community-Edition-File\SSIS Framework Community Edition File\SSIS Framework Community Edition File\Parent.dtsx_" /SET "\Package.Variables[ApplicationName].Properties[Value]";"File Framework Singleton Test" /REP EWI
Execute the edited dtexec command in the command window.
