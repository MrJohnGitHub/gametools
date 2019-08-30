@echo off
::���������ӳ�
setlocal EnableDelayedExpansion
::��ʾ��ǰʱ��
echo %date% %time%

::=============================
::���б�������
::=============================
::��¼��ʼʱ��
set startTime=%time%
::����Ŀ¼
set appDir=%~dp0
::svn��ַ��������·��
set workspace=%1
::���������汾��
set fromVersion=%5
::�����汾��
set toVersion=%2
::��ʼsvn�汾
set fromSvnVer=%3
::����svn�汾
set toSvnVer=%4
::����svn�汾
set headSvnVer=
::svn����Ŀ¼ 
set svnBinDir=C:\Program Files\TortoiseSVN\bin\
::������Ϣ�ļ�Ŀ¼
set packDir=%7
::������Ŀ¼
set exportDir=%8
::�Ƿ�������Դ�汾�ļ�
set makeResVerFile=true
::�Ƿ�ִ�е���
set doExport=true
::��ɺ�ȴ��˳�
set waitForExit=false
::�Ƿ�ֿ������ļ����ļ�������0Ŀ¼��
set isSplitNewFile=%6
::������Ϣ�ļ�·��
set recordFile=%packDir%record.log
::svn·��
set svnRoot=C:\Program Files\TortoiseSVN\bin\
set svn=%svnRoot%svn.exe
::SubWCRev·��
set SubWCRev=%svnBinDir%SubWCRev.exe
::�����汾Ŀ¼
set exportVerDir=
::Ĭ�ϵ����汾Ŀ¼����0Ŀ¼
set exportVerDirDef=
::������Ĳ����ļ�svn�汾��Ϣ�ļ�
set diffRevFile=%packDir%modify.log
::·����ַ���ͣ�0-δ֪���ͣ�1-���Ͽ��ַ��2-��������
set workspaceType=0

::===============================================================
::��ȡ���ò���ʼ����س���svn�����ļ���·��
::===============================================================
echo -reading config...
::for /f "usebackq tokens=1,2 delims==" %%i in ("%appDir%app.ini") do (
::	if %%i==-svnBinDir (call :formatDirPath svnBinDir "%%j") else (
::		if %%i==-packDir (call :formatDirPath packDir "%%j") else (
::			if %%i==-exportDir (call :formatDirPath exportDir "%%j") else (
::				if %%i==-makeResVerFile (set makeResVerFile=%%j) else (
::					if %%i==-doExport (set doExport=%%j) else (
::						if %%i==-waitForExit (set waitForExit=%%j)
::					)
::				)
::			)
::		)
::	)
::)
::set svn=%svnBinDir%svn.exe
::set SubWCRev=%svnBinDir%SubWCRev.exe
::set recordFile=%packDir%updateInfo.txt
::set diffRevFile=%packDir%diffRev.txt
if "%isSplitNewFile%"=="" (set isSplitNewFile=false)
::echo ==========================================================
echo svnBinDir      = %svnBinDir%
echo packDir  = %packDir%
echo exportDir  = %exportDir%
echo makeResVerFile = %makeResVerFile%
echo doExport       = %doExport%
echo waitForExit    = %waitForExit%
echo isSplitNewFile  = %isSplitNewFile%
::echo svn            = %svn%
::echo SubWCRev       = %SubWCRev%
::echo recordFile = %recordFile%
::echo diffRevFile    = %diffRevFile%

::���svn.exe��SubWCRev.exe�Ƿ����
if not exist "%svn%" (
	call :error "'%svn%' is not exist."
	goto:eof
)
if not exist "%SubWCRev%" (
	call :error "'%SubWCRev%' is not exist."
	goto:eof
)
::ȷ�����¿ռ�Ŀ¼����
if not exist %packDir% mkdir %packDir%
echo ===========================================================
::pause

::=============================================
::��ȡsvn��ַ����ȡ���°汾��
::=============================================
::���svn��ַΪ�գ�����ʾ�û�����
::set workspace=file:///E:/Repository
if "%workspace%"=="" (set /p workspace=WC/URL:)
echo -parsing workspace...
::����·����ַ������¼��ַ����
call :parseworkspace "%workspace%" workspaceType
::echo workspaceType = %workspaceType%
::�����ַ����δ֪�����׳����󣬲���ֹ����
if %workspaceType%==0 (
	call :error "'%workspace%' is not exist."
	goto:eof
)
echo -reading head revision...
::ȷ����ַ��/��\���Ž�β�����һ�ȡ���°汾��
if %workspaceType%==1 (
	call :formatURL workspace %workspace%
	call :getheadSvnVerBySvnInfo %workspace% headSvnVer
) else (
	call :formatDirPath workspace %workspace%
	call :getheadSvnVerBySubWCRev %workspace% headSvnVer
)
echo workspace = %workspace%, headSvnVerision = %headSvnVer%
echo ===========================================================
::pause

::=================================================================
::�Ӹ�����Ϣ�ļ��ж�ȡ�汾��Ϣ��Ȼ�������°汾�ź�svn�汾��Χ
::=================================================================
echo -reading update info...
if exist %recordFile% (
	for /f "tokens=1,2,3 delims=," %%i in (%recordFile%) do (
		if %%i==ver (
			if "%toVersion%"=="" set /a toVersion=%%j+1
		) else (
			if %%i==%workspace% (
				if "%fromSvnVer%"=="" set /a fromSvnVer=%%j
				if "%fromVersion%"=="" set /a fromVersion=%%k
			)
		)
	)
)
if "%fromSvnVer%"=="" (set fromSvnVer=0)
if "%toVersion%"=="" (set toVersion=0)
if "%fromVersion%"=="" (set /a fromVersion=%toVersion%-1)
::��ʼ�汾�Ų��ܳ������°汾��
if %fromSvnVer% gtr %headSvnVer% (set fromSvnVer=%headSvnVer%)
::�汾�Ŵ�0��ʼ�����汾��Ϊ255���汾��ѭ��ʹ��
if %toVersion%==256 (set toVersion=0)
if %fromVersion%==-1 (set fromVersion=255)
::���û��ָ������svn�汾����ȡ���°汾
if "%toSvnVer%"=="" (set toSvnVer=%headSvnVer%) else (
	if "%toSvnVer%"=="HEAD" (set toSvnVer=%headSvnVer%)
)
if %toSvnVer% gtr %headSvnVer% (set toSvnVer=%headSvnVer%)
echo fromVersion = %fromVersion%, toVersion = %toVersion%, fromSvnVer = %fromSvnVer%, toSvnVer = %toSvnVer%
echo ===========================================================
::pause

::===============================================
::�Ƚϲ����������ļ�
::===============================================
::����������ճ�ʼ����汾��Ϣ�ļ�
if %makeResVerFile%==true (
	echo -create or clear diff revision file...
	echo destFile = %diffRevFile%
	echo off > %diffRevFile%
	echo ===========================================================
)
::׼�������汾Ŀ¼
set exportVerDir=%exportDir%%toVersion%\%toVersion%\
if %doExport%==true (
	if not exist %exportVerDir% mkdir %exportVerDir%
)
::׼��Ĭ�ϵ����汾Ŀ¼
set exportVerDirDef=%exportDir%%toVersion%\0\
if %isSplitNewFile%==true (
	if not exist %exportVerDirDef% mkdir %exportVerDirDef%
)
::׼����ȡ������Ϣ������
set cmdDiff='"%svn%" diff --summarize -r %fromSvnVer%:%toSvnVer% %workspace%'
::���������ļ�
echo -exporting diff files and record revision of diff files...
for /f "tokens=1,2 delims= " %%i in (%cmdDiff%) do (
	::����Ŀ¼��ֻ�����ļ�
	if not "%%~xj"=="" (
		if %makeResVerFile%==true call :saveDiffRevInfo %%j %%i
		if %doExport%==true (
			if %isSplitNewFile%==true (
				if "%%i"=="A" (
					call :export %%j %exportVerDirDef%
				) else (
					if not "%%i"=="D" call :export %%j %exportVerDir%
				)
			) else (
				if not "%%i"=="D" call :export %%j %exportVerDir%
			)
		)
	)
)
echo ===========================================================
::pause

::���������Ϣ
echo -saving upate info...
call :saveUpdateInfo %recordFile% %workspace% %fromVersion% %toVersion% %fromSvnVer% %toSvnVer%
::�����ʱ
call :calcElapsed %startTime% %time% cost
echo export complete, cost %cost%s
::����
if %waitForExit%==true pause
goto:eof

::===========================================
::���������ļ�
::@param %1 URL/WC
::@param %2 �����汾Ŀ¼
::===========================================
:export
	set fullpath=%~1
	set filename=%~nx1
	::��ȡĿ¼·������ȥ���ļ���
	::ע�⣺����ֻ�����ļ���Ŀ¼�ڵ���ǰ�ѱ����ˣ���Ȼ������Ҫ����Ŀ¼���ļ�
	set "filepath=!fullpath:%filename%=!"
	::ȥ����·��
	set "filepath=!filepath:%workspace%=!"
	::�滻б�ܣ�������Ҫ���Ǹ�·���µ��ļ������������˷ǿ��ж�
	if not "!filepath!"=="" set "filepath=!filepath:/=\!"
	::ȷ��Ŀ¼����
	set tmpDir=%2!filepath!
	if not exist %tmpDir% mkdir %tmpDir%
	::�����ļ�
	echo -exporting %fullpath% to %tmpDir%%filename%
	"%svn%" export -r %toSvnVer% %fullpath% %tmpDir%%filename% --force -q
goto:eof

::===========================================
::��������ļ����·���Ͱ汾��Ϣ
::@param %1 URL/WC
::@param %2 svn��������(M��A��D��R)
::===========================================
:saveDiffRevInfo
	set fullpath=%~1
	echo -exporting %fullpath%
	if %workspaceType%==1	(
		call :getheadSvnVerBySvnInfo %fullpath% _headSvnVer
	) else (
		call :getheadSvnVerBySubWCRev %fullpath% _headSvnVer
	)
	set "fullpath=!fullpath:%workspace%=!"
	echo %2,!fullpath:\=/!,!_headSvnVer!>>%diffRevFile%
goto:eof

::======================================
::ʹ��svn info�����ȡURL/WC�����°汾��
::@param %1 URL/WC
::@param %2 ���°汾�ű�����
::======================================
:getheadSvnVerBySvnInfo
	for /f "skip=1 eol=R tokens=1,* delims=:" %%i in ('"%svn%" info %~1') do (
		if "%%i"=="Last Changed Rev" (
			set val=%%j
			set %2=!val:~1!
			goto:eof
		)
	)
goto:eof

::======================================
::ʹ��SubWCRev�����ȡWC�����°汾��
::@param %1 WC
::@param %2 ���°汾�ű�����
::======================================
:getheadSvnVerBySubWCRev
	for /f "skip=1 eol=U delims=" %%i in ('"%SubWCRev%" %~1') do (
		for /f "tokens=5 delims= " %%j in ("%%i") do (
			set %2=%%j
			goto:eof
		)
	)
goto:eof

::======================================
::������¼�¼
::%1 ��¼�ļ� recordFile
::%2 �����ռ� workspace
::%3 ��ʼ�汾 fromVersion
::%4 Ŀ��汾 toVersion
::%5 ��ʼSVN�汾�� fromSvnVer
::%6 ����SVN�汾�� toSvnVer
::======================================
:saveUpdateInfo
	set _f=%~1
	set _ft=%_f%_tmp.log
	echo ver,%4,>%_ft%
	if exist %_f% (
		copy %_f% %_f%_bak.log
		for /f "skip=1 tokens=1,* delims=," %%i in (%_f%) do (
			if not %%i==%2 (
				echo %%i,%%j>>%_ft%
				echo %%i,%%j
			)
		)
	)
	echo %2,%3,%4,%5,%6,>>%_ft%
	echo ��� %2,%3,%4,%5,%6
	move /y %_ft% %_f%
goto:eof

::==================================
::��ʽ��Ŀ¼��ȷ��·����\���Ž�β
::@param key ������
::@param val ����ֵ
::==================================
:formatDirPath key val
	set key=%1
	set val=%~2
	if not %val:~-1,1%==\ (set %key%=%val%\) else (set %key%=%val%)
goto:eof

::==================================
::��ʽ����ַ��ȷ����ַ��/���Ž�β
::@param key ������
::@param val ����ֵ
::==================================
:formatURL key val
	set key=%1
	set val=%~2
	if not %val:~-1%==/ (set %key%=%val%/) else (set %key%=%val%)
goto:eof

::==================================
::����·����ַ������¼��ַ����
::@param %1 ��ַ
::@param %2 ��ַ���ͱ�����
::==================================
:parseworkspace
	set _url=%~1
	set _typeKey=%2
	::����ڶ����ַ�Ϊð��:ʱ������Ϊ�ǹ���������������Ϊ��svn��ַ
	::����ǹ�������������Ҫ���·���Ƿ����
	if %_url:~1,1%==: (
		if exist %_url% (set %_typeKey%=2)
	) else (set %_typeKey%=1)
goto:eof

::==================================
::����ʱ���ú��������ǿ������
::@param %1 ��׼��ʼʱ��(%time%)
::@param %2 ��׼����ʱ��(%time%)
::@param %3 �����������
::==================================
:calcElapsed
	::echo st = %1, et = %2
	call :formatTimeToSec %1 _ssecs
	call :formatTimeToSec %2 _esecs
	::echo %_esecs% - %_ssecs%
	set /a %3=%_esecs%-%_ssecs%
goto:eof
::==================================
::��ʽ��ʱ��Ϊ��
::@param %1 ��׼ʱ��(%time%)
::@param %2 �����������
::==================================
:formatTimeToSec
	for /f "tokens=1-3 delims=:." %%i in ("%1") do (
		set _h=%%i&set _m=%%j&set _s=%%k
		::echo !_h!:!_m!:!_s!
		if "!_m:~0,1!"=="0" set /a _m=!_m:~1,1!
		if "!_s:~0,1!"=="0" set /a _s=!_s:~1,1!
		::echo !_h!:!_m!:!_s!
		set /a %2=!_h!*3600+!_m!*60+!_s!
	)
goto:eof

::==================================
::��ʾ����
::@param %1 ������Ϣ
::==================================
:error
	echo [Error]: %~1
goto:eof

::==================================
::��ʽ���ļ���svn�汾��Ϣ
::@param srcRevFile Դ�ļ�
::@param newRevFile Ŀ���ļ�
::==================================
:::formatDiffRev srcRevFile newRevFile
::	set srcRevFile=%~1
::	set newRevFile=%~2
::	echo off > %newRevFile%
::	for /f "eol=R tokens=1,* delims=:" %%i in (%srcRevFile%) do (
::		set val=%%j
::		set "val=!val:~1!"
::		if "%%i"=="URL" (set url=!val!) else (
::			if "%%i"=="Node Kind" (
::				if "!val!"=="file" (set isFile=true) else (set isFile=false)
::			) else (
::				if "%%i"=="Last Changed Rev" (
::					if !isFile!==true echo !url:%workspace%=!,!val!>>%newRevFile%
::				)
::			)
::		)
::	)
::	del %srcRevFile%
::goto:eof