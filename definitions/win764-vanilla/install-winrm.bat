cmd /c winrm quickconfig -q
cmd /c winrm quickconfig -transport:http
cmd /c winrm set winrm/config @{MaxTimeoutms="1800000"}
cmd /c winrm set winrm/config/winrs @{MaxMemoryPerShellMB="512"}
cmd /c winrm set winrm/config/service @{AllowUnencrypted="true"}
cmd /c winrm set winrm/config/service/auth @{Basic="true"}
cmd /c winrm set winrm/config/listener?Address=*+Transport=HTTP @{Port="5985"}
cmd /c netsh advfirewall firewall set rule group="remote administration" new enable=yes
cmd /c netsh firewall add portopening TCP 5985 "Port 5985"
cmd /c net stop winrm
cmd /c net start winrm
cmd /c sc config WinRM start= auto

cmd /c reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d 0 /f
cmd /c reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaveIsSecure /t REG_SZ /d 0 /f
