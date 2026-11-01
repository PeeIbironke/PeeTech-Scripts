param(
    [Parameter(Mandatory = $true)]
    [string]$ClientName
)

$basePath = "C:\PeeTech\Clients"
$clientPath = Join-Path $basePath $ClientName

$clientFolders = @(
    $clientPath,
    "$clientPath\01-Onboarding",
    "$clientPath\02-Projects",
    "$clientPath\03-Proposals",
    "$clientPath\04-Invoices",
    "$clientPath\05-Documentation",
    "$clientPath\06-Tickets",
    "$clientPath\07-Reports",
    "$clientPath\08-Assets",
    "$clientPath\09-Change Logs"
)

foreach ($folder in $clientFolders) {
    if (-not (Test-Path $folder)) {
        New-Item -Path $folder -ItemType Directory -Force | Out-Null
        Write-Host "Created folder: $folder"
    }
}

$clientFiles = @{
    "$clientPath\Client Overview.txt" = @"
Client Overview - $ClientName
============================

Client Name:
Primary Contact:
Primary Domain:
Tenant Type:
License Type:
Service Scope:
Date Started:

Core Systems:
- Intune
- Entra ID
- Microsoft 365
- Defender
- Other:

Active Projects:
-
-

Notes:
-
-
"@

    "$clientPath\01-Onboarding\Client Onboarding Checklist.txt" = @"
Client Onboarding Checklist
===========================

Client:
Start Date:
Primary Contact:
Service Type:

Checklist:
[ ] Signed agreement received
[ ] Scope defined
[ ] Domain reviewed
[ ] Admin access received
[ ] Licensing reviewed
[ ] Device inventory reviewed
[ ] Security requirements reviewed
[ ] Documentation created
[ ] First milestone scheduled

Notes:
-
-
"@

    "$clientPath\02-Projects\Active Project Tracker.txt" = @"
Active Project Tracker
======================

Project Name:
Owner:
Start Date:
Target Date:
Status:
Scope:
Deliverables:
Notes:
"@

    "$clientPath\03-Proposals\Proposal Notes.txt" = @"
Proposal Notes
==============

Client:
Date:
Opportunity:
Estimated Value:
Requirements:
Recommended Services:
Assumptions:
Next Step:
"@

    "$clientPath\04-Invoices\Invoice Tracking.txt" = @"
Invoice Tracking
================

Client:
Invoice Number:
Date Issued:
Amount:
Status:
Due Date:
Paid Date:
Services Covered:
Notes:
"@

    "$clientPath\05-Documentation\Client Notes.txt" = @"
Client Notes
============

Environment Notes:
-
-

Important Settings:
-
-

Known Issues:
-
-

Useful Links:
-
-
"@

    "$clientPath\06-Tickets\Ticket Log.txt" = @"
Ticket Log
==========

Ticket ID:
Date Opened:
Reported By:
Priority:
Issue:
Assigned To:
Status:
Resolution:
Date Closed:
Notes:
"@

    "$clientPath\07-Reports\Monthly Service Report.txt" = @"
Monthly Service Report
======================

Client:
Month:
Prepared By:

Summary:
-
-

Work Completed:
-
-

Open Risks / Issues:
-
-

Recommendations:
-
-
"@

    "$clientPath\08-Assets\Asset Register.txt" = @"
Asset Register
==============

Asset Name:
Asset Type:
Serial Number:
Assigned To:
Status:
Location:
Notes:
"@

    "$clientPath\09-Change Logs\Change Log.txt" = @"
Change Log
==========

Date:
Changed By:
System:
Change Summary:
Reason:
Validation:
Rollback Plan:
Notes:
"@
}

foreach ($file in $clientFiles.Keys) {
    if (-not (Test-Path $file)) {
        Set-Content -Path $file -Value $clientFiles[$file] -Encoding UTF8
        Write-Host "Created file: $file"
    }
}

Write-Host ""
Write-Host "Client workspace created successfully: $ClientName" -ForegroundColor Green
