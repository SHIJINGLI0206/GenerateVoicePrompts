@echo off

REM Delete old files before generate voice prompts

set path_root=E:\Github\jbl_audio_prompts

set path_headers=%path_root%\headers
set path_prompts=%path_root%\prompts
set path_configfiles=%path_root%\vp_configfile
set path_img_headers=%path_root%\image\headers
set path_img_prompts=%path_root%\image\prompts

REM delete tmp headers
cd %path_headers%
for %%f in (*.idx) do del *.idx /F /Q

REM delete tmp prompts
cd %path_prompts%
for %%f in (*.prm) do del *.prm /F /Q

REM delete image/headers
cd %path_img_headers%
for %%f in (*.idx) do del *.idx /F /Q

REM delete image/prompts
cd %path_img_prompts%
for %%f in (*.prm) do del *.prm /F /Q

REM delete configfiles
cd %path_configfiles%
for %%f in (*.txt) do del *.txt /F /Q

echo delete files successfully.

pause