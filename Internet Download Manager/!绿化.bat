@ECHO OFF&(CD /D "%~DP0")&(FLTMC>NUL)||(mshta vbscript:CreateObject^("Shell.Application"^).ShellExecute^("%~snx0"," %*","","runas",1^)^(window.close^)&&exit /b)

taskkill /IM "IDMan.exe" /F >NUL 2>NUL
taskkill /IM "IDMGrHlp.exe" /F >NUL 2>NUL
taskkill /IM "IEMonitor.exe" /F >NUL 2>NUL
taskkill /IM "idmBroker.exe" /F >NUL 2>NUL
taskkill /IM "IDMMsgHost.exe" /F >NUL 2>NUL
taskkill /IM "MediumILStart.exe" /F >NUL 2>NUL
taskkill /IM "IDMIntegrator64.exe" /F >NUL 2>NUL

del /f /s /q "%Temp%\*~DF*.TMP" 2>NUL
rd /s /q "%Temp%\IDM_Setup_Temp" 2>NUL

::获取系统SID并删除残留标识接口
for /f "delims=" %%a in ('wmic userAccount where "Name='%userName%'" get SID /value') do call set "%%a" >NUL 2>NUL
reg delete "HKU\%SID%\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKU\%SID%\Software\Classes\WOW6432Node\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
::删除计算机所有用户残留标识接口
reg delete "HKCU\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\Wow6432Node\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\Wow6432Node\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\Wow6432Node\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\Wow6432Node\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\Wow6432Node\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\Wow6432Node\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\Wow6432Node\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\Wow6432Node\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\Wow6432Node\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\Wow6432Node\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\Wow6432Node\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\Wow6432Node\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\Wow6432Node\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\Wow6432Node\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\Wow6432Node\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\Wow6432Node\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{84797876-C678-1780-A556-0CD06786780F}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\Wow6432Node\CLSID\{84797876-C678-1780-A556-0CD06786780F}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{84797876-C678-1780-A556-0CD06786780F}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\Wow6432Node\CLSID\{84797876-C678-1780-A556-0CD06786780F}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\Wow6432Node\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\Wow6432Node\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}" /f >NUL 2>NUL
reg delete "HKCR\CLSID\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f  >NUL 2>NUL
reg delete "HKCR\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f  >NUL 2>NUL
reg delete "HKCR\CLSID\{4764030F-2733-45B9-AE62-3D1F4F6F2861}" /f  >NUL 2>NUL
reg delete "HKCR\CLSID\{52F6F7BD-DF73-44B3-AE13-89E1E1FB8F6A}" /f  >NUL 2>NUL
reg delete "HKCR\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f  >NUL 2>NUL
reg delete "HKCR\CLSID\{7D11E719-FF90-479C-B0D7-96EB43EE55D7}" /f  >NUL 2>NUL
reg delete "HKCR\CLSID\{CDC95B92-E27C-4745-A8C5-64A52A78855D}" /f  >NUL 2>NUL
reg delete "HKCR\CLSID\{CDD67718-A430-4AB9-A939-83D9074B0038}" /f  >NUL 2>NUL
reg delete "HKCR\WOW6432Node\CLSID\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f >NUL 2>NUL 
reg delete "HKCR\WOW6432Node\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL 
reg delete "HKCR\WOW6432Node\CLSID\{0F947660-8606-420A-BAC6-51B84DD22A47}" /f >NUL 2>NUL 
reg delete "HKCR\WOW6432Node\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f >NUL 2>NUL 
reg delete "HKCR\WOW6432Node\CLSID\{4764030F-2733-45B9-AE62-3D1F4F6F2861}" /f >NUL 2>NUL 
reg delete "HKCR\WOW6432Node\CLSID\{52F6F7BD-DF73-44B3-AE13-89E1E1FB8F6A}" /f >NUL 2>NUL 
reg delete "HKCR\WOW6432Node\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f >NUL 2>NUL 
reg delete "HKCR\WOW6432Node\CLSID\{7D11E719-FF90-479C-B0D7-96EB43EE55D7}" /f >NUL 2>NUL 
reg delete "HKCR\WOW6432Node\CLSID\{AC746233-E9D3-49CD-862F-068F7B7CCCA4}" /f >NUL 2>NUL 
reg delete "HKCR\WOW6432Node\CLSID\{C950922F-897A-4E13-BA38-66C8AF2E0BF7}" /f >NUL 2>NUL 
reg delete "HKCR\WOW6432Node\CLSID\{CDD67718-A430-4AB9-A939-83D9074B0038}" /f >NUL 2>NUL 
reg delete "HKCR\WOW6432Node\CLSID\{D0FB58BB-2C07-492F-8BD0-A587E4874B4E}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{4764030F-2733-45B9-AE62-3D1F4F6F2861}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{52F6F7BD-DF73-44B3-AE13-89E1E1FB8F6A}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{7D11E719-FF90-479C-B0D7-96EB43EE55D7}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{CDC95B92-E27C-4745-A8C5-64A52A78855D}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{CDD67718-A430-4AB9-A939-83D9074B0038}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{D0FB58BB-2C07-492F-8BD0-A587E4874B4E}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{0F947660-8606-420A-BAC6-51B84DD22A47}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{4764030F-2733-45B9-AE62-3D1F4F6F2861}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{52F6F7BD-DF73-44B3-AE13-89E1E1FB8F6A}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{7D11E719-FF90-479C-B0D7-96EB43EE55D7}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{AC746233-E9D3-49CD-862F-068F7B7CCCA4}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{C950922F-897A-4E13-BA38-66C8AF2E0BF7}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{CDD67718-A430-4AB9-A939-83D9074B0038}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{D0FB58BB-2C07-492F-8BD0-A587E4874B4E}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f >NUL 2>NUL

::清理假冒注册信息，软件配置，开机启动项等键值;
reg delete "HKLM\Software\DownloadManager" /f >NUL 2>NUL
reg delete "HKLM\Software\Download Manager" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Internet Download Manager" /f >NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\DownloadManager" /f >NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\Download Manager" /f >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "LName" /f >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "FName" /f >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "Email" /f >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "Serial" /f >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "scansk" /f >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "MData" /f >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "tvfrdt" /f >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "CheckUpdtVM" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Internet Download Manager" /f >NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "IDMan" /f >NUL 2>NUL
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "IDMan" /f >NUL 2>NUL

::设置默认简体中文，取消开机启动，设置默认主题，取消启动提示，打开网页；
reg add "HKCU\Software\DownloadManager" /f /v "LanguageID" /t REG_DWORD /d "2052" >NUL 2>NUL
reg add "HKCU\Software\DownloadManager" /f /v "LaunchOnStart" /t REG_DWORD /d "0" >NUL 2>NUL
reg add "HKCU\Software\DownloadManager" /f /v "ToolbarStyle" /d "Faenza" >NUL 2>NUL
reg add "HKCU\Software\DownloadManager" /f /v "TipStartUp" /t REG_DWORD /d "1" >NUL 2>NUL
reg add "HKCU\Software\DownloadManager" /f /v "LaunchOnStart" /t REG_DWORD /d "0" >NUL 2>NUL

if /i %PROCESSOR_IDENTIFIER:~0,3%==x86 (
::长期经验总结添加序列号标识键值较保险点；
reg add "HKLM\Software\Internet Download Manager" /f /v "LName" /d "All Users" >NUL 2>NUL
reg add "HKLM\Software\Internet Download Manager" /f /v "Serial" /d "88888-88888-88888-88888" >NUL 2>NUL
) else (
reg add "HKLM\Software\WOW6432Node\Internet Download Manager" /f /v "LName" /d "All Users" >NUL 2>NUL
reg add "HKLM\Software\WOW6432Node\Internet Download Manager" /f /v "Serial" /d "88888-88888-88888-88888" >NUL 2>NUL
)

::Windows XP/2003 原版安装命令执行参数
ver|findstr "5\.[0-9]\.[0-9][0-9]*" >NUL && (
Rundll32 setupapi.dll,InstallHinfSection DefaultInstall 128 .\idmtdi.inf
runonce -r
grpconv.exe -o
net start idmtdi >NUL 2>NUL
)
::Windows 7或更高版原版安装命令执行参数
ver|findstr "\<6\.[0-9]\.[0-9][0-9]*\> \<10\.[0-9]\.[0-9][0-9]*\>" >NUL && (
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /f /v "%~dp0IDM.exe" /d "~ RUNASADMIN" >NUL 2>NUL
echo y|icacls "%~dp0\" /c /t /grant "Everyone:(OI)(CI)(F)" >NUL 2>NUL
if /i %PROCESSOR_IDENTIFIER:~0,3% NEQ x86 regsvr32 /s IDMIECC64.dll
if /i %PROCESSOR_IDENTIFIER:~0,3% NEQ x86 regsvr32 /s IDMGetAll64.dll
if /i %PROCESSOR_IDENTIFIER:~0,3% NEQ x86 regsvr32 /s downlWithIDM64.dll
if /i %PROCESSOR_IDENTIFIER:~0,3% NEQ x86 regsvr32 /s IDMShellExt64.dll
start /wait idmBroker.exe -RegServer
start /wait /B IDMan.exe /rtr /setlngid 2052 /fulllngfile idm_chn2.lng
start /wait Uninstall.exe -instdriv
net stop IDMWFP >NUL 2>NUL
ping 127.0.0.1 -n 2 >NUL 2>NUL
taskkill /f /im IDM* >NUL 2>NUL
taskkill /f /im IEMon* >NUL 2>NUL
Rundll32 setupapi.dll,InstallHinfSection DefaultInstall 128 .\idmwfp.inf
if /i %PROCESSOR_IDENTIFIER:~0,3% EQU x86 grpconv.exe -o
net start IDMWFP >NUL 2>NUL
)

::创建快捷方式
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\IDM.lnk""):b.TargetPath=""%~dp0IDMan.exe"":b.WorkingDirectory=""%~dp0"":b.Save:close")

ECHO.&ECHO 完成！&PAUSE>NUL&EXIT