@echo off
set /p num1=" Introduce el primer numero: "
set /p num2=" Introduce el primer numero: "
set /a suma=%num1%+%num2%
echo %num1% + %num2% es %suma%
set /a resta=%num1%-%num2%
echo %num1% - %num2% es %resta%
set /a multiplica=%num1%*%num2%
echo %num1% x %num2% es %multiplica%
pause