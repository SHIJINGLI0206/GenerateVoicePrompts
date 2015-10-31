@echo off 
setlocal EnableDelayedExpansion
REM    #############################################################################
REM    Description:
REM         This bat is used to generate voice prompt files(headers+prompts).
REM    Folder:
REM         path_root			:	root folder
REM         path_wav    		:   wave files
REM         path_configfile		:	configfile of wav file
REM         path_headers		:	temp header files
REM         path_prompts		:	temp prompt files
REM         path_img_headers	:	header files for project(need to be copied to the 'image' folder under project)
REM         path_img_prompts	:	prompt files for project(need to be copied to the 'image' folder under project)

REM initialization of path
SET path_root=E:\Github\jbl_audio_prompts
set path_wav=%path_root%\vp_wav
set path_configfile=%path_root%\vp_configfile
set path_headers=%path_root%\headers
set path_prompts=%path_root%\prompts
set path_img_headers=%path_root%\image\headers
set path_img_prompts=%path_root%\image\prompts
set cnt=0

if not exist %path_wav% (
    echo please create a folder named as 'vp_wav', and then copy wav files to it.
	pause
	exit
)

REM create folders if not exist
if not exist %path_configfile% mkdir %path_configfile%
if not exist %path_img_headers% mkdir %path_img_headers%
if not exist %path_img_prompts% mkdir %path_img_prompts%


REM cd %path_wav%
for %%f IN (%path_wav%\*.wav) do (
    REM generate configfiles of wave files
	echo compression=adpcm,rate=8000,file=%path_wav%\%%~nxf > %path_configfile%\%%~nxf.txt
	%path_root%\voice_prompt_tool.exe -i %path_root% -c %path_configfile%\%%~nxf.txt
	
	
	REM get the count of exist header/prompt files	
    cd %path_img_headers%	
	set cnt=0
	for %%A in (*.idx) do (
	    set /a cnt+=1		 
	)
	echo File count = !cnt!	 
	
	REM move idx file from temp header folder to image\header
	cd %path_headers%
	echo %path_headers%
	REN "0.idx" "!cnt!.tmp"
	ren !cnt!.tmp !cnt!.idx
	move *.idx %path_img_headers%
	 	
	REM move idx file from temp header folder to image\header
	cd %path_prompts%
	REN "0.prm" "!cnt!.tmp"	
	ren !cnt!.tmp !cnt!.prm
	move *.prm %path_img_prompts%	
) 

echo *********************************

echo Generate voice prompts successfully

pause