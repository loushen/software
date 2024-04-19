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

Net Stop IDMWFP >NUL 2>NUL
Net Stop IDMTDI >NUL 2>NUL

Rundll32 setupapi.dll,InstallHinfSection DefaultUninstall 128 .\idmwfp.inf
Rundll32 setupapi.dll,InstallHinfSection DefaultUninstall 128 .\idmtdi.inf

Regsvr32 /s /u IDMShellExt.dll
Regsvr32 /s /u IDMShellExt64.dll
regsvr32 /s /u IDMIECC.dll
regsvr32 /s /u IDMGetAll.dll
regsvr32 /s /u downlWithIDM.dll
regsvr32 /s /u IDMIECC64.dll
regsvr32 /s /u IDMGetAll64.dll
regsvr32 /s /u downlWithIDM64.dll

del /f idmcchandler2.dll >NUL  2>NUL
del /f idmcchandler2_64.dll  >NUL  2>NUL
rd /s /q "%AppData%\IDM" 2>NUL
rd /s /q "%AppData%\DMCache" 2>NUL
rd /s /q "%TEMP%\IDM_Setup_Temp" 2>NUL
ver|findstr "5\.[0-9]\.[0-9][0-9]*" >NUL && rd /s /q "%AllUsersProfile%\Application Data\IDM" 2>NUL
ver|findstr "\<6\.[0-9]\.[0-9][0-9]*\> \<10\.[0-9]\.[0-9][0-9]*\>" >NUL && rd /s /q "%ProgramData%\IDM" 2>NUL
del "%userprofile%\桌面\IDM.lnk" >NUL  2>NUL
del "%userprofile%\Desktop\IDM.lnk" >NUL  2>NUL

reg delete "HKCU\Software\DownloadManager" /v "tvfrdt" /f>NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "Email" /f>NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "Serial" /f>NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "LName" /f>NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "FName" /f>NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "scansk" /f>NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "MData" /f>NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "ExePath" /f>NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "TempPath" /f>NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "CheckUpdtVM" /f>NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "AppDataIDMFolder" /f>NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /v "CommonAppDataIDMFolder" /f>NUL 2>NUL
reg delete "HKLM\Software\DownloadManager" /f >NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\DownloadManager" /f >NUL 2>NUL
reg delete "HKLM\Software\Download Manager" /f >NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\Download Manager" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Internet Download Manager" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Internet Download Manager" /f >NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "IDMan" /f >NUL 2>NUL
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "IDMan" /f >NUL 2>NUL
reg delete "HKCU\Software\CocCoc\Browser\Extensions\ngpampappnmepgilojfohadhhmbhlaek" /f >NUL 2>NUL
reg delete "HKCU\Software\CocCoc\Browser\NativeMessagingHosts\com.tonec.idm" /f >NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Edge\Extensions\ngpampappnmepgilojfohadhhmbhlaek" /f >NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Edge\NativeMessagingHosts\com.tonec.idm" /f >NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Internet Explorer" /v "DownloadUI" /f >NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Internet Explorer\MenuExt\使用 IDM 下载" /f >NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Internet Explorer\MenuExt\使用 IDM 下载全部链接" /f >NUL 2>NUL
reg delete "HKCU\Software\Mozilla\NativeMessagingHosts\com.tonec.idm" /f >NUL 2>NUL
reg delete "HKCU\Software\Mozilla\SeaMonkey\Extensions" /v "mozilla_cc@internetdownloadmanager.com" /f >NUL 2>NUL
reg delete "HKCU\Software\Mozilla\SeaMonkey\Extensions" /v "mozilla_cc2@internetdownloadmanager.com" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Google\Chrome\NativeMessagingHosts\com.tonec.idm" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Google\Chrome\Extensions\ngpampappnmepgilojfohadhhmbhlaek" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Google\Chrome\NativeMessagingHosts\com.tonec.idm" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Google\Chrome\Extensions\ngpampappnmepgilojfohadhhmbhlaek" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /f /v "%~dp0IDM.exe" >NUL 2>NUL

reg delete "HKCR\AppID\{0F947660-8606-420A-BAC6-51B84DD22A47}" /f >NUL 2>NUL
reg delete "HKCR\AppID\{3C085E26-7DF6-4A34-ADA6-877D06BAE9A8}" /f >NUL 2>NUL
reg delete "HKCR\AppID\{AC746233-E9D3-49CD-862F-068F7B7CCCA4}" /f >NUL 2>NUL
reg delete "HKCR\AppID\idmBroker.EXE" /f >NUL 2>NUL
reg delete "HKCR\CLSID\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f >NUL 2>NUL
reg delete "HKCR\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f >NUL 2>NUL
reg delete "HKCR\CLSID\{4764030F-2733-45B9-AE62-3D1F4F6F2861}" /f >NUL 2>NUL
reg delete "HKCR\CLSID\{52F6F7BD-DF73-44B3-AE13-89E1E1FB8F6A}" /f >NUL 2>NUL
reg delete "HKCR\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f >NUL 2>NUL
reg delete "HKCR\CLSID\{7D11E719-FF90-479C-B0D7-96EB43EE55D7}" /f >NUL 2>NUL
reg delete "HKCR\CLSID\{CDC95B92-E27C-4745-A8C5-64A52A78855D}" /f >NUL 2>NUL
reg delete "HKCR\CLSID\{CDD67718-A430-4AB9-A939-83D9074B0038}" /f >NUL 2>NUL
reg delete "HKCR\DownlWithIDM.IDMDwnlMgr" /f >NUL 2>NUL
reg delete "HKCR\DownlWithIDM.IDMDwnlMgr.1" /f >NUL 2>NUL
reg delete "HKCR\DownlWithIDM.LinkProcessor" /f >NUL 2>NUL
reg delete "HKCR\DownlWithIDM.LinkProcessor.1" /f >NUL 2>NUL
reg delete "HKCR\DownlWithIDM.V2LinkProcessor" /f >NUL 2>NUL
reg delete "HKCR\DownlWithIDM.V2LinkProcessor.1" /f >NUL 2>NUL
reg delete "HKCR\DownlWithIDM.VLinkProcessor" /f >NUL 2>NUL
reg delete "HKCR\DownlWithIDM.VLinkProcessor.1" /f >NUL 2>NUL
reg delete "HKCR\IDMan.CIDMLinkTransmitter" /f >NUL 2>NUL
reg delete "HKCR\idmBroker.OptionsReader" /f >NUL 2>NUL
reg delete "HKCR\idmBroker.OptionsReader.1" /f >NUL 2>NUL
reg delete "HKCR\Idmfsa.IDMEFSAgent" /f >NUL 2>NUL
reg delete "HKCR\Idmfsa.IDMEFSAgent.1" /f >NUL 2>NUL
reg delete "HKCR\IDMGetAll.IDMAllLinksProcessor" /f >NUL 2>NUL
reg delete "HKCR\IDMGetAll.IDMAllLinksProcessor.1" /f >NUL 2>NUL
reg delete "HKCR\IDMIECC.IDMHelperLinksStorage" /f >NUL 2>NUL
reg delete "HKCR\IDMIECC.IDMHelperLinksStorage.1" /f >NUL 2>NUL
reg delete "HKCR\IDMIECC.IDMIEHlprObj" /f >NUL 2>NUL
reg delete "HKCR\IDMIECC.IDMIEHlprObj.1" /f >NUL 2>NUL
reg delete "HKCR\Interface\{2223E76A-0894-4502-841F-0CF7517A713B}" /f >NUL 2>NUL
reg delete "HKCR\Interface\{28670AE0-CAF4-4836-8418-0F456023EBF7}" /f >NUL 2>NUL
reg delete "HKCR\Interface\{33AEF752-FB86-4787-9ED1-6010528F5FA3}" /f >NUL 2>NUL
reg delete "HKCR\Interface\{356E6235-B055-46D9-8B32-BDC2266C9DAB}" /f >NUL 2>NUL
reg delete "HKCR\Interface\{4BD46AAE-C51F-4BF7-8BC0-2E86E33D1873}" /f >NUL 2>NUL
reg delete "HKCR\Interface\{6B9EB066-DA1F-4C0A-AC62-01AC892EF175}" /f >NUL 2>NUL
reg delete "HKCR\Interface\{6EDC7F8E-EB3D-4F9A-B693-216F07C94D74}" /f >NUL 2>NUL
reg delete "HKCR\Interface\{72B7361C-3568-4392-BCCD-D912CD5C1169}" /f >NUL 2>NUL
reg delete "HKCR\Interface\{94D09862-1875-4FC9-B434-91CF25C840A1}" /f >NUL 2>NUL
reg delete "HKCR\Interface\{98D060EC-53AF-4F61-8180-43C507C9FF94}" /f >NUL 2>NUL
reg delete "HKCR\Interface\{A87AB5DD-211B-4284-8CBD-B92F77A5DE14}" /f >NUL 2>NUL
reg delete "HKCR\Interface\{BC69364C-34D7-4225-B16F-8595C743C775}" /f >NUL 2>NUL
reg delete "HKCR\Interface\{C7798BD6-34AF-4925-B01C-450C9EAD2DD9}" /f >NUL 2>NUL
reg delete "HKCR\Interface\{C950922F-897A-4E13-BA38-66C8AF2E0BF7}" /f >NUL 2>NUL
reg delete "HKCR\TypeLib\{13D4E387-BAB7-47E7-B3D7-3F01ABC463EA}" /f >NUL 2>NUL
reg delete "HKCR\TypeLib\{37294E01-DB54-43AF-9D50-93FF7267DF5D}" /f >NUL 2>NUL
reg delete "HKCR\TypeLib\{3BDFC55C-ED33-43BB-9A77-57C2AF4B56EF}" /f >NUL 2>NUL
reg delete "HKCR\TypeLib\{5518B636-6884-48CA-A9A7-1CFD3F3BA916}" /f >NUL 2>NUL
reg delete "HKCR\TypeLib\{6A89524B-E1B6-4D71-972A-8FD53F240936}" /f >NUL 2>NUL
reg delete "HKCR\TypeLib\{ECF21EAB-3AA8-4355-82BE-F777990001DD}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\AppID\{0F947660-8606-420A-BAC6-51B84DD22A47}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\AppID\{3C085E26-7DF6-4A34-ADA6-877D06BAE9A8}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\AppID\{AC746233-E9D3-49CD-862F-068F7B7CCCA4}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\AppID\idmBroker.EXE" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\CLSID\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\CLSID\{0F947660-8606-420A-BAC6-51B84DD22A47}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\CLSID\{4764030F-2733-45B9-AE62-3D1F4F6F2861}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\CLSID\{52F6F7BD-DF73-44B3-AE13-89E1E1FB8F6A}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\CLSID\{7D11E719-FF90-479C-B0D7-96EB43EE55D7}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\CLSID\{AC746233-E9D3-49CD-862F-068F7B7CCCA4}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\CLSID\{C950922F-897A-4E13-BA38-66C8AF2E0BF7}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\CLSID\{CDD67718-A430-4AB9-A939-83D9074B0038}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\CLSID\{D0FB58BB-2C07-492F-8BD0-A587E4874B4E}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\Interface\{2223E76A-0894-4502-841F-0CF7517A713B}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\Interface\{28670AE0-CAF4-4836-8418-0F456023EBF7}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\Interface\{33AEF752-FB86-4787-9ED1-6010528F5FA3}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\Interface\{356E6235-B055-46D9-8B32-BDC2266C9DAB}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\Interface\{4BD46AAE-C51F-4BF7-8BC0-2E86E33D1873}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\Interface\{6B9EB066-DA1F-4C0A-AC62-01AC892EF175}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\Interface\{6EDC7F8E-EB3D-4F9A-B693-216F07C94D74}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\Interface\{72B7361C-3568-4392-BCCD-D912CD5C1169}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\Interface\{94D09862-1875-4FC9-B434-91CF25C840A1}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\Interface\{98D060EC-53AF-4F61-8180-43C507C9FF94}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\Interface\{A87AB5DD-211B-4284-8CBD-B92F77A5DE14}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\Interface\{BC69364C-34D7-4225-B16F-8595C743C775}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\Interface\{C7798BD6-34AF-4925-B01C-450C9EAD2DD9}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\Interface\{C950922F-897A-4E13-BA38-66C8AF2E0BF7}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\TypeLib\{13D4E387-BAB7-47E7-B3D7-3F01ABC463EA}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\TypeLib\{37294E01-DB54-43AF-9D50-93FF7267DF5D}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\TypeLib\{3BDFC55C-ED33-43BB-9A77-57C2AF4B56EF}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\TypeLib\{5518B636-6884-48CA-A9A7-1CFD3F3BA916}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\TypeLib\{6A89524B-E1B6-4D71-972A-8FD53F240936}" /f >NUL 2>NUL
reg delete "HKCR\Wow6432Node\TypeLib\{ECF21EAB-3AA8-4355-82BE-F777990001DD}" /f >NUL 2>NUL

reg delete "HKLM\SOFTWARE\Classes\AppID\{0F947660-8606-420A-BAC6-51B84DD22A47}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\AppID\{3C085E26-7DF6-4A34-ADA6-877D06BAE9A8}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\AppID\{AC746233-E9D3-49CD-862F-068F7B7CCCA4}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\AppID\idmBroker.EXE" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{4764030F-2733-45B9-AE62-3D1F4F6F2861}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{52F6F7BD-DF73-44B3-AE13-89E1E1FB8F6A}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{7D11E719-FF90-479C-B0D7-96EB43EE55D7}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{CDC95B92-E27C-4745-A8C5-64A52A78855D}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{CDD67718-A430-4AB9-A939-83D9074B0038}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{D0FB58BB-2C07-492F-8BD0-A587E4874B4E}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\DownlWithIDM.IDMDwnlMgr" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\DownlWithIDM.IDMDwnlMgr.1" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\DownlWithIDM.LinkProcessor" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\DownlWithIDM.LinkProcessor.1" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\DownlWithIDM.V2LinkProcessor" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\DownlWithIDM.V2LinkProcessor.1" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\DownlWithIDM.VLinkProcessor" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\DownlWithIDM.VLinkProcessor.1" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\IDMan.CIDMLinkTransmitter" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\idmBroker.OptionsReader" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\idmBroker.OptionsReader.1" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Idmfsa.IDMEFSAgent" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Idmfsa.IDMEFSAgent.1" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\IDMGetAll.IDMAllLinksProcessor" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\IDMGetAll.IDMAllLinksProcessor.1" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\IDMIECC.IDMHelperLinksStorage" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\IDMIECC.IDMHelperLinksStorage.1" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\IDMIECC.IDMIEHlprObj" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\IDMIECC.IDMIEHlprObj.1" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{2223E76A-0894-4502-841F-0CF7517A713B}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{28670AE0-CAF4-4836-8418-0F456023EBF7}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{33AEF752-FB86-4787-9ED1-6010528F5FA3}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{356E6235-B055-46D9-8B32-BDC2266C9DAB}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{4BD46AAE-C51F-4BF7-8BC0-2E86E33D1873}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{6B9EB066-DA1F-4C0A-AC62-01AC892EF175}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{6EDC7F8E-EB3D-4F9A-B693-216F07C94D74}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{72B7361C-3568-4392-BCCD-D912CD5C1169}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{94D09862-1875-4FC9-B434-91CF25C840A1}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{98D060EC-53AF-4F61-8180-43C507C9FF94}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{A87AB5DD-211B-4284-8CBD-B92F77A5DE14}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{BC69364C-34D7-4225-B16F-8595C743C775}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{C7798BD6-34AF-4925-B01C-450C9EAD2DD9}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{C950922F-897A-4E13-BA38-66C8AF2E0BF7}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\TypeLib\{13D4E387-BAB7-47E7-B3D7-3F01ABC463EA}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\TypeLib\{37294E01-DB54-43AF-9D50-93FF7267DF5D}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\TypeLib\{3BDFC55C-ED33-43BB-9A77-57C2AF4B56EF}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\TypeLib\{5518B636-6884-48CA-A9A7-1CFD3F3BA916}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\TypeLib\{6A89524B-E1B6-4D71-972A-8FD53F240936}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\TypeLib\{ECF21EAB-3AA8-4355-82BE-F777990001DD}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{0F947660-8606-420A-BAC6-51B84DD22A47}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{4764030F-2733-45B9-AE62-3D1F4F6F2861}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{52F6F7BD-DF73-44B3-AE13-89E1E1FB8F6A}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{7D11E719-FF90-479C-B0D7-96EB43EE55D7}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{AC746233-E9D3-49CD-862F-068F7B7CCCA4}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{C950922F-897A-4E13-BA38-66C8AF2E0BF7}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{CDD67718-A430-4AB9-A939-83D9074B0038}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\{D0FB58BB-2C07-492F-8BD0-A587E4874B4E}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\Interface\{2223E76A-0894-4502-841F-0CF7517A713B}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\Interface\{28670AE0-CAF4-4836-8418-0F456023EBF7}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\Interface\{33AEF752-FB86-4787-9ED1-6010528F5FA3}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\Interface\{356E6235-B055-46D9-8B32-BDC2266C9DAB}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\Interface\{4BD46AAE-C51F-4BF7-8BC0-2E86E33D1873}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\Interface\{6B9EB066-DA1F-4C0A-AC62-01AC892EF175}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\Interface\{6EDC7F8E-EB3D-4F9A-B693-216F07C94D74}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\Interface\{72B7361C-3568-4392-BCCD-D912CD5C1169}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\Interface\{94D09862-1875-4FC9-B434-91CF25C840A1}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\Interface\{98D060EC-53AF-4F61-8180-43C507C9FF94}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\Interface\{A87AB5DD-211B-4284-8CBD-B92F77A5DE14}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\Interface\{BC69364C-34D7-4225-B16F-8595C743C775}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\Interface\{C7798BD6-34AF-4925-B01C-450C9EAD2DD9}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Wow6432Node\Interface\{C950922F-897A-4E13-BA38-66C8AF2E0BF7}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Browser Helper Objects\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\explorer\Browser Helper Objects\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\IDM Shell Extension" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\IDM Shell Extension" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved" /v "{CDC95B92-E27C-4745-A8C5-64A52A78855D}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved" /v "{CDC95B92-E27C-4745-A8C5-64A52A78855D}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Internet Explorer" /v "DownloadUI" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Internet Explorer\Low Rights\DragDrop\{F6E1B27E-F2DA-4919-9DBD-CAB90A1D662B}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWAREMicrosoft\Internet Explorer\Low Rights\ElevationPolicy\{E0DACC63-037F-46EE-AC02-E4C7B0FBFEB4}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Tracing\IDMan_RASAPI32" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer" /v "DownloadUI" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\Low Rights\DragDrop\{F6E1B27E-F2DA-4919-9DBD-CAB90A1D662B}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\Low Rights\ElevationPolicy\{E0DACC63-037F-46EE-AC02-E4C7B0FBFEB4}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Tracing\IDMan_RASAPI32" /f >NUL 2>NUL
reg delete "HKLM\SYSTEM\CurrentControlSet\services\IDMWFP" /f >NUL 2>NUL

reg delete "HKCU\Software\Classes\Wow6432Node\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Internet Explorer\Low Rights\DragDrop\{19129CDA-AFC0-4330-99BC-C5A834F89006}" /f >NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Internet Explorer\Low Rights\ElevationPolicy\{15B851AF-A4B9-43EF-97D3-28E1B4A5DB9B}" /f >NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Internet Explorer\Low Rights\ElevationPolicy\{1902485B-CE75-42C1-BA2D-57E660793D9A}" /f >NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Internet Explorer\Low Rights\ElevationPolicy\{E0DACC63-037F-46EE-AC02-E4C7B0FBFEB4}" /f >NUL 2>NUL

ECHO:&ECHO.完成！是否备份选项配置？
ECHO:&ECHO.是敲任意键，否关闭窗口！&PAUSE>NUL

regedit /e "!选项配置.reg" HKEY_CURRENT_USER\Software\DownloadManager >NUL 2>NUL
reg delete HKEY_CURRENT_USER\Software\DownloadManager /f>NUL 2>NUL

ver|findstr "5\.[0-9]\.[0-9][0-9]*" > nul && (goto KillExplorerWinXP)
ver|findstr "\<6\.[0-9]\.[0-9][0-9]*\> \<10\.[0-9]\.[0-9][0-9]*\>" > nul && (goto KillExplorerWin7+)

:KillExplorerWinXP
CLS&ECHO 完成！ &PAUSE>NUL&EXIT

:KillExplorerWin7+
Call :_RestartExplorer
goto :eof
:_RestartExplorer
(
  echo Dim arrURL^(^), strURL, oShell, oWin, n
  echo n = -1
  echo Set oShell = CreateObject^("Shell.Application"^)
  echo For Each oWin In oShell.Windows
  echo   If Instr^(1, oWin.FullName, "\explorer.exe", vbTextCompare^) Then
  echo     n = n + 1
  echo     ReDim Preserve arrURL^(n^)
  echo     arrURL^(n^) = oWin.LocationURL
  echo   End If
  echo Next
  echo CreateObject^("WScript.Shell"^).run "tskill explorer", 0, True
  echo For Each strURL In arrURL
  echo   oShell.Explore strURL
  echo Next
)>"%temp%\RestartExplorer.vbs"
CScript //NoLogo "%temp%\RestartExplorer.vbs"
del /q /f "%temp%\RestartExplorer.vbs"
goto :eof