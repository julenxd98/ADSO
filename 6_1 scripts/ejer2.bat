@echo off
set /p dir1="Introduce un directorio: "
mkdir %cd%\%dir1%
start /d %cd%\%dir1%