@echo off
::开启变量延迟
setlocal EnableDelayedExpansion
::显示当前时间
echo %date% %time%

::=============================
::所有变量声明
::=============================
::记录起始时间
set startTime=%time%
::程序目录
set appDir=%~dp0
::svn地址或工作副本路径
set workspace=%1
::基础导出版本号
set fromVersion=%5
::导出版本号
set toVersion=%2
::起始svn版本
set fromSvnVer=%3
::结束svn版本
set toSvnVer=%4
::最新svn版本
set headSvnVer=
::svn所在目录 
set svnBinDir=C:\Program Files\TortoiseSVN\bin\
::更新信息文件目录
set packDir=%7
::导出根目录
set exportDir=%8
::是否生成资源版本文件
set makeResVerFile=true
::是否执行导出
set doExport=true
::完成后等待退出
set waitForExit=false
::是否分开新增文件，文件导出到0目录下
set isSplitNewFile=%6
::更新信息文件路径
set recordFile=%packDir%record.log
::svn路径
set svnRoot=C:\Program Files\TortoiseSVN\bin\
set svn=%svnRoot%svn.exe
::SubWCRev路径
set SubWCRev=%svnBinDir%SubWCRev.exe
::导出版本目录
set exportVerDir=
::默认导出版本目录，即0目录
set exportVerDirDef=
::处理过的差异文件svn版本信息文件
set diffRevFile=%packDir%modify.log
::路径地址类型，0-未知类型，1-资料库地址，2-工作副本
set workspaceType=0

::===============================================================
::读取配置并初始化相关程序（svn）和文件的路径
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

::检查svn.exe和SubWCRev.exe是否存在
if not exist "%svn%" (
	call :error "'%svn%' is not exist."
	goto:eof
)
if not exist "%SubWCRev%" (
	call :error "'%SubWCRev%' is not exist."
	goto:eof
)
::确保更新空间目录存在
if not exist %packDir% mkdir %packDir%
echo ===========================================================
::pause

::=============================================
::获取svn地址并获取最新版本号
::=============================================
::如果svn地址为空，则提示用户输入
::set workspace=file:///E:/Repository
if "%workspace%"=="" (set /p workspace=WC/URL:)
echo -parsing workspace...
::解析路径地址，并记录地址类型
call :parseworkspace "%workspace%" workspaceType
::echo workspaceType = %workspaceType%
::如果地址类型未知，则抛出错误，并终止程序
if %workspaceType%==0 (
	call :error "'%workspace%' is not exist."
	goto:eof
)
echo -reading head revision...
::确保地址以/或\符号结尾，并且获取最新版本号
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
::从更新信息文件中读取版本信息，然后计算更新版本号和svn版本范围
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
::起始版本号不能超过最新版本号
if %fromSvnVer% gtr %headSvnVer% (set fromSvnVer=%headSvnVer%)
::版本号从0开始，最大版本号为255，版本号循环使用
if %toVersion%==256 (set toVersion=0)
if %fromVersion%==-1 (set fromVersion=255)
::如果没有指定结束svn版本，则取最新版本
if "%toSvnVer%"=="" (set toSvnVer=%headSvnVer%) else (
	if "%toSvnVer%"=="HEAD" (set toSvnVer=%headSvnVer%)
)
if %toSvnVer% gtr %headSvnVer% (set toSvnVer=%headSvnVer%)
echo fromVersion = %fromVersion%, toVersion = %toVersion%, fromSvnVer = %fromSvnVer%, toSvnVer = %toSvnVer%
echo ===========================================================
::pause

::===============================================
::比较并导出差异文件
::===============================================
::创建或是清空初始差异版本信息文件
if %makeResVerFile%==true (
	echo -create or clear diff revision file...
	echo destFile = %diffRevFile%
	echo off > %diffRevFile%
	echo ===========================================================
)
::准备导出版本目录
set exportVerDir=%exportDir%%toVersion%\%toVersion%\
if %doExport%==true (
	if not exist %exportVerDir% mkdir %exportVerDir%
)
::准备默认导出版本目录
set exportVerDirDef=%exportDir%%toVersion%\0\
if %isSplitNewFile%==true (
	if not exist %exportVerDirDef% mkdir %exportVerDirDef%
)
::准备获取差异信息的命令
set cmdDiff='"%svn%" diff --summarize -r %fromSvnVer%:%toSvnVer% %workspace%'
::导出差异文件
echo -exporting diff files and record revision of diff files...
for /f "tokens=1,2 delims= " %%i in (%cmdDiff%) do (
	::忽略目录，只处理文件
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

::保存更新信息
echo -saving upate info...
call :saveUpdateInfo %recordFile% %workspace% %fromVersion% %toVersion% %fromSvnVer% %toSvnVer%
::计算耗时
call :calcElapsed %startTime% %time% cost
echo export complete, cost %cost%s
::结束
if %waitForExit%==true pause
goto:eof

::===========================================
::导出差异文件
::@param %1 URL/WC
::@param %2 导出版本目录
::===========================================
:export
	set fullpath=%~1
	set filename=%~nx1
	::获取目录路径，先去掉文件名
	::注意：这里只考虑文件，目录在调用前已被过滤，不然这里需要区分目录和文件
	set "filepath=!fullpath:%filename%=!"
	::去掉根路径
	set "filepath=!filepath:%workspace%=!"
	::替换斜杠，这里需要考虑根路径下的文件，所以增加了非空判断
	if not "!filepath!"=="" set "filepath=!filepath:/=\!"
	::确保目录存在
	set tmpDir=%2!filepath!
	if not exist %tmpDir% mkdir %tmpDir%
	::导出文件
	echo -exporting %fullpath% to %tmpDir%%filename%
	"%svn%" export -r %toSvnVer% %fullpath% %tmpDir%%filename% --force -q
goto:eof

::===========================================
::保存差异文件相对路劲和版本信息
::@param %1 URL/WC
::@param %2 svn动作简码(M、A、D、R)
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
::使用svn info命令获取URL/WC的最新版本号
::@param %1 URL/WC
::@param %2 最新版本号变量名
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
::使用SubWCRev命令获取WC的最新版本号
::@param %1 WC
::@param %2 最新版本号变量名
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
::保存更新记录
::%1 记录文件 recordFile
::%2 检索空间 workspace
::%3 起始版本 fromVersion
::%4 目标版本 toVersion
::%5 起始SVN版本号 fromSvnVer
::%6 结束SVN版本号 toSvnVer
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
	echo 结果 %2,%3,%4,%5,%6
	move /y %_ft% %_f%
goto:eof

::==================================
::格式化目录，确保路径以\符号结尾
::@param key 变量名
::@param val 变量值
::==================================
:formatDirPath key val
	set key=%1
	set val=%~2
	if not %val:~-1,1%==\ (set %key%=%val%\) else (set %key%=%val%)
goto:eof

::==================================
::格式化地址，确保地址以/符号结尾
::@param key 变量名
::@param val 变量值
::==================================
:formatURL key val
	set key=%1
	set val=%~2
	if not %val:~-1%==/ (set %key%=%val%/) else (set %key%=%val%)
goto:eof

::==================================
::解析路径地址，并记录地址类型
::@param %1 地址
::@param %2 地址类型变量名
::==================================
:parseworkspace
	set _url=%~1
	set _typeKey=%2
	::如果第二个字符为冒号:时，则认为是工作副本，否则都认为是svn地址
	::如果是工作副本，则需要检测路径是否存在
	if %_url:~1,1%==: (
		if exist %_url% (set %_typeKey%=2)
	) else (set %_typeKey%=1)
goto:eof

::==================================
::计算时间差，该函数不考虑跨天跨年
::@param %1 标准起始时间(%time%)
::@param %2 标准结束时间(%time%)
::@param %3 结果变量名称
::==================================
:calcElapsed
	::echo st = %1, et = %2
	call :formatTimeToSec %1 _ssecs
	call :formatTimeToSec %2 _esecs
	::echo %_esecs% - %_ssecs%
	set /a %3=%_esecs%-%_ssecs%
goto:eof
::==================================
::格式化时间为秒
::@param %1 标准时间(%time%)
::@param %2 结果变量名称
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
::显示错误
::@param %1 错误信息
::==================================
:error
	echo [Error]: %~1
goto:eof

::==================================
::格式化文件的svn版本信息
::@param srcRevFile 源文件
::@param newRevFile 目标文件
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