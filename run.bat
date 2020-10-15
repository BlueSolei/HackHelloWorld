@echo off

if "%1"=="/?" (
    echo Usage: run [tests]
    exit /b
)

pushd %~dp0
cd build\bin
if "%1"=="tests" (HackHelloWorldTest.exe) else (HackHelloWorld.exe)
popd
