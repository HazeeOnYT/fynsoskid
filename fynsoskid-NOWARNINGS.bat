@echo off
setlocal

:: Download mlt.cpp from GitHub
curl -Lo mlt.cpp https://github.com/pankoza2-pl/gdithings/raw/2473c777c6cdd43f8c6965b63bd715e04a0786bd/mlt.cpp

:: Check if MinGW is installed
where g++ || (
    :: Download and extract MinGW if not installed
    curl -Lo mingw.7z "https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win32/Personal%20Builds/mingw-builds/8.1.0/threads-posix/dwarf/i686-8.1.0-release-posix-dwarf-rt_v6-rev0.7z/download"
    7z x mingw.7z -omgw && set PATH=%PATH%;%CD%\mingw\bin
)

:: Compile mlt.cpp to mlt.exe using MinGW
g++ mlt.cpp -o mlt.exe

:: Run mlt.exe
mlt.exe

endlocal
