@echo off
setlocal enabledelayedexpansion

:: ========================================
:: ARM GNU Toolchain Installation Script
:: Purpose: Guide the user to install ARM GCC manually,
:: then verify installation by checking tool locations and versions.
:: ========================================

set LOG_FILE=install_arm_gnu_toolchain.log
echo === Toolchain Setup Started at %DATE% %TIME% === > %LOG_FILE%

:: ----------------------------------------
:: Step 1: Manual Installation Required
echo [INFO] This script does NOT install via pacman, as arm-none-eabi-gcc is not available in MSYS2 repositories. >> %LOG_FILE%
echo [INFO] Please download and run the official ARM GNU Toolchain installer: >> %LOG_FILE%
echo [INFO] https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads >> %LOG_FILE%
echo [INFO] Direct EXE download (v13.3 rel1 for Windows): >> %LOG_FILE%
echo [INFO] https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-mingw-w64-i686-arm-none-eabi.exe >> %LOG_FILE%
echo. >> %LOG_FILE%

echo [NOTE] After installation, make sure to add the 'bin' folder to your system PATH. >> %LOG_FILE%
echo [Example] PATH = C:\Program Files (x86)\Arm GNU Toolchain arm-none-eabi\13.3 rel1\bin >> %LOG_FILE%
echo. >> %LOG_FILE%

:: ----------------------------------------
:: Step 2: Check availability of installed tools
echo Checking installed ARM toolchain... >> %LOG_FILE%

echo. >> %LOG_FILE%
echo [CHECK] where arm-none-eabi-gcc >> %LOG_FILE%
where arm-none-eabi-gcc >> %LOG_FILE% 2>&1

echo [CHECK] arm-none-eabi-gcc --version >> %LOG_FILE%
arm-none-eabi-gcc --version >> %LOG_FILE% 2>&1

echo [CHECK] where arm-none-eabi-ld >> %LOG_FILE%
where arm-none-eabi-ld >> %LOG_FILE% 2>&1

echo [CHECK] arm-none-eabi-ld --version >> %LOG_FILE%
arm-none-eabi-ld --version >> %LOG_FILE% 2>&1

echo [CHECK] where arm-none-eabi-gdb >> %LOG_FILE%
where arm-none-eabi-gdb >> %LOG_FILE% 2>&1

echo [CHECK] arm-none-eabi-gdb --version >> %LOG_FILE%
arm-none-eabi-gdb --version >> %LOG_FILE% 2>&1

:: ----------------------------------------
:: (Optional) Example usage of the toolchain
:: Uncomment and adjust for your project
:: arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -o prog2.elf hello.c sw_info_copy.c -T linker.ld >> %LOG_FILE% 2>&1
:: arm-none-eabi-objcopy -O srec prog2.elf prog2.s19 >> %LOG_FILE% 2>&1

echo. >> %LOG_FILE%
echo === Toolchain Setup Completed at %DATE% %TIME% === >> %LOG_FILE%
echo Done. Check %LOG_FILE% for details.

endlocal
pause
