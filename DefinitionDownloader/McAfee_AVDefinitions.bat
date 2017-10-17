@echo off
Title MCAFEE AV DOWNLOADER (v1.0)
cd D:\_DownloadAVDefs\SourceSite
del * /S /Q

echo.
echo.
echo           M C A F E E   A V   D O W N L O A D E R   (v1.0)
echo ======================================================================
echo ======================================================================
echo  DOWNLOADING FILES FROM MCAFEE - AUTOSTART 10 SECONDS
echo.
echo  or press any key to start now
echo ======================================================================
timeout /t 10

..\wget.exe -m -l 15 -nH -np --cut-dirs=2 http://update.nai.com/products/commonupdater/catalog.z
..\wget.exe -m -l 15 -nH -np --cut-dirs=2 http://update.nai.com/products/commonupdater/sitestat.xml
..\wget.exe -m -l 15 -nH -np --cut-dirs=2 http://update.nai.com/products/commonupdater/current/

echo ======================================================================
echo  DOWNLOAD OF COMPLETE!
echo ======================================================================
echo.
echo  COPYING FILES TO \\S01A-AMGMT-25\McAfeeSourceSite - AUTOSTART 30 SECONDS
echo.
echo  or press any key to start now
timeout /t 30 

robocopy "D:\_DownloadAVDefs\SourceSite" "\\s01a-amgmt-25\McAFee_AVDefinitions" /MIR

echo =======================================================================
echo  FILES SUCCESSFULLY COPIED TO S01A-AMGMT-25!
echo =====================================================================
echo.
echo  COPYING FILES TO \\s01a-mg02\McAfeeSourceSite - AUTOSTART 30 SECONDS
echo.
echo  or press any key to start now
timeout /t 30 

robocopy "D:\_DownloadAVDefs\SourceSite" "\\s01a-mg02\McAfeeSourceSite" /MIR

echo =======================================================================
echo  FILES SUCCESSFULLY COPIED TO S01A-MG02!
echo =====================================================================

pause>nul|set/p =FINISHED, PRESS ANY KEY TO EXIT

