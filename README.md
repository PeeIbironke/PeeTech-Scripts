\# PeeTech Scripts



PowerShell automation tools developed for endpoint administration, Microsoft cloud management, IT operations, and repeatable infrastructure workflows.



This repository is part of my hands-on engineering portfolio and contains scripts I develop, test, and maintain while working with enterprise IT technologies and my PeeTech lab environment.



\## Current Script



\### New-PeeTechClient.ps1



Automates the creation of a standardized client workspace for IT service delivery.



The script accepts a client name as a parameter and automatically creates an organized directory structure covering:



\- Client onboarding

\- Projects

\- Proposals

\- Invoices

\- Technical documentation

\- Support tickets

\- Service reports

\- Asset management

\- Change management



It also generates starter documentation templates for each operational area.



\### Example



```powershell

.\\Utilities\\New-PeeTechClient.ps1 -ClientName "Contoso"

