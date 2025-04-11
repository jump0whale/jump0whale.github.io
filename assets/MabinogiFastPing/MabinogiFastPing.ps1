$output = getmac /fo list /v | Out-String
$guidRegex = "\{[0-9A-Fa-f\-]+\}"
$match = [regex]::Match($output, $guidRegex)
if (-not $match.Success) {
    Write-Error "GUID를 getmac 출력에서 찾지 못했습니다."
    exit 1
}
$guid = $match.Value

Write-Host ""
Write-Host -NoNewline "GUID : " 
Write-Host "$guid" -ForegroundColor Magenta
Write-Host ""

do {
    $choice = Read-Host "작업을 선택 해 주세요.`n[1] 패스트핑 적용하기  [2] 원래대로 복원하기"
    if ($choice -eq "1" -or $choice -eq "2") { break }
    else { Write-Host "잘못된 선택입니다. 다시 입력해주세요." -ForegroundColor Red }
} while ($true)

# 옵션에 따라 레지스트리 파일 내용 구성하기
$registryContent1 = @"
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$guid]
"TcpAckFrequency"=hex(b):01,00,00,00,00,00,00,00
"TCPNoDelay"=hex(b):01,00,00,00,00,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Psched]
"NonBestEffortLimit"=dword:00000000

[HKEY_CURRENT_USER\Control Panel\Keyboard]
"KeyboardSpeed"="48"
"KeyboardDelay"="0"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
"NetworkThrottlingIndex"=dword:00000046
"@

$registryContent2 = @"
Windows Registry Editor Version 5.00

[-HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$guid]
"TcpAckFrequency"=hex(b):01,00,00,00,00,00,00,00
"TCPNoDelay"=hex(b):01,00,00,00,00,00,00,00

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Psched]
"NonBestEffortLimit"=dword:00000000

[HKEY_CURRENT_USER\Control Panel\Keyboard]
"KeyboardSpeed"="31"
"KeyboardDelay"="1"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
"NetworkThrottlingIndex"=dword:00000010
"@

$folderPath = $PSScriptRoot

switch ($choice) {
    "1" {
        $regFilePath = Join-Path -Path $folderPath -ChildPath "MainogiFastPing.reg"
        $registryContent1 | Out-File -FilePath $regFilePath

        Write-Host ""
        Write-Host "TcpAckFrequency 적용" -ForegroundColor Cyan
        Write-Host "TCPNoDelay 적용" -ForegroundColor Cyan
        Write-Host "NetworkThrottlingIndex 수정" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "KeyboardSpeed 수정" -ForegroundColor Cyan
        Write-Host "KeyboardDelay 수정" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "QOS 패킷 스케줄러 예약 대약폭 제한 해제" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "MSMQ(Microsoft Message Queue) Server 활성화" -ForegroundColor Cyan
        Write-Host "MSMQ DCOM 프록시 활성화" -ForegroundColor Cyan
        Write-Host "MSMQ HTTP 지원 활성화" -ForegroundColor Cyan
        Write-Host "MSMQ 트리거 활성화" -ForegroundColor Cyan
        Write-Host "멀티캐스팅 지원 활성화" -ForegroundColor Cyan
        Write-Host ""
        
        regedit.exe /s $regFilePath
        Enable-WindowsOptionalFeature -Online -FeatureName "MSMQ-Container","MSMQ-Server","MSMQ-DCOMProxy","MSMQ-HTTP","MSMQ-Triggers","MSMQ-Multicast" | Out-Null
    }
    "2" {
        $regFilePath = Join-Path -Path $folderPath -ChildPath "MainogiFastPing_restore.reg"
        $registryContent2 | Out-File -FilePath $regFilePath

        Write-Host ""
        Write-Host "TcpAckFrequency 삭제" -ForegroundColor Red
        Write-Host "TCPNoDelay 삭제" -ForegroundColor Red
        Write-Host "NetworkThrottlingIndex 복원" -ForegroundColor Red
        Write-Host ""
        Write-Host "KeyboardSpeed 복원" -ForegroundColor Red
        Write-Host "KeyboardDelay 복원" -ForegroundColor Red
        Write-Host ""
        Write-Host "QOS 패킷 스케줄러 예약 대약폭 제한 설정" -ForegroundColor Red
        Write-Host ""
        Write-Host "MSMQ(Microsoft Message Queue) Server 비활성화" -ForegroundColor Red
        Write-Host "MSMQ DCOM 프록시 비활성화" -ForegroundColor Red
        Write-Host "MSMQ HTTP 지원 비활성화" -ForegroundColor Red
        Write-Host "MSMQ 트리거 비활성화" -ForegroundColor Red
        Write-Host "멀티캐스팅 지원 비활성화" -ForegroundColor Red
        Write-Host ""

        regedit.exe /s $regFilePath
        Disable-WindowsOptionalFeature -Online -FeatureName "MSMQ-Container","MSMQ-Server","MSMQ-DCOMProxy","MSMQ-HTTP","MSMQ-Triggers","MSMQ-Multicast" | Out-Null
    }
}
