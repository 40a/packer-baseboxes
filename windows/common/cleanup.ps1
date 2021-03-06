$ProgressPreference="SilentlyContinue"
$tempfolders = @("C:\Windows\Temp\*", "C:\Windows\Prefetch\*", "C:\Documents and Settings\*\Local Settings\temp\*", "C:\Users\*\Appdata\Local\Temp\*")
Remove-Item $tempfolders -force -recurse

Get-WindowsFeature | ? { $_.InstallState -eq 'Available' } | Uninstall-WindowsFeature -Remove

Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase