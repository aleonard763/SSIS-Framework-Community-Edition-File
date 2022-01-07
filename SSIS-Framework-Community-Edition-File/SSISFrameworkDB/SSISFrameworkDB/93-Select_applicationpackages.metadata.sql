Use SSISFrameworkDB
go

declare @ApplicationName varchar(255) = 'File Framework Test'

Select p.PackageFolder
, p.PackageName
, ap.ExecutionOrder
, ap.FailApplicationOnPackageFailure
From cfg.ApplicationPackages ap
Join cfg.Packages p
  On p.PackageID = ap.PackageID
Join cfg.Applications a
  On a.ApplicationID = ap.ApplicationID
Where a.ApplicationName = @ApplicationName
Order By ap.ExecutionOrder ASC
