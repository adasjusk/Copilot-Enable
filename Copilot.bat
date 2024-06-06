@echo off
::Made By TheAdas
timeout /t 1
reg add "HKCU\Software\Microsoft\Windows\Shell\Copilot\BingChat" /v IsUserEligible /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Copilot" /v IsCopilotAvailable /t REG_DWORD /d 1 /f
timeout /t 1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCopilotButton /t REG_DWORD /d 0 /f
timeout /t 2
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCopilotButton /t REG_DWORD /d 1 /f
