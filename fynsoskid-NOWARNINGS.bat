@echo off
setlocal

:: Download stuff
curl -Lo mlt.cpp https://github.com/pankoza2-pl/gdithings/raw/2473c777c6cdd43f8c6965b63bd715e04a0786bd/mlt.cpp || exit /b 1

:: Install MinGW if not installed
where g++ || (
    curl -Lo mingw.7z "https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win32/Personal%20Builds/mingw-builds/8.1.0/threads-posix/dwarf/i686-8.1.0-release-posix-dwarf-rt_v6-rev0.7z/download" || exit /b 1
    7z x mingw.7z -omgw && set PATH=%PATH%;%CD%\mingw\bin
)

:: Converting stuff
g++ mlt.cpp -o mlt.exe || exit /b 1

:: Running stuff
mlt.exe

endlocal
