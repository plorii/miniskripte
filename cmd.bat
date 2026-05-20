@echo off
:main
set input=goto main
set /p input="%CD%>"
%input%
goto main