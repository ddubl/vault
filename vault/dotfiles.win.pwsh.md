---
id: 8bnwuzpyx4tgwjeriig6a26
title: Pwsh
desc: ''
updated: 1662988658167
created: 1642692840021
---

How to install the latest version of powershellget module
BY NEERAJ SINGH on NOVEMBER 23, 2020 • ( 1 )

PowerShellGet is a module with commands for discovering, installing, updating and publishing PowerShell artifacts like Modules, DSC Resources, Role Capabilities, and Scripts.

Step1: Set TLS1.2 as default protocol in the PS Session

As of April 2020, the PowerShell Gallery no longer supports Transport Layer Security (TLS) versions 1.0 and 1.1. If you are not using TLS 1.2 or higher, you will receive an error when trying to access the PowerShell Gallery. Use the following command to ensure you are using TLS 1.2:

[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
Step 2: Before updating PowerShellGet, you should always install the latest NuGet provider. From an elevated PowerShell session, run the following command.

Install-PackageProvider -Name NuGet -Force
Step 3: Register PS repositories if not setup before

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted -ErrorAction Stop
If you see an exception like Powershell Gallery is currently unavailable, register PSGallery as default

Register-PSRepository -Default
Step 4: Install PowerShellGet

Install-Module -Name PowerShellGet -RequiredVersion 2.2.5 -Force
Use Update-Module to get newer versions.

Update-Module -Name PowerShellGet