@ echo off 
setlocal enabledelayedexpansion

(for /f "delims=" %%a in (data.txt) do (
set "str=%%a"
for %%b in ("!str: A1 = " "A1 !") do echo,%%~b
))>formated.txt

pause