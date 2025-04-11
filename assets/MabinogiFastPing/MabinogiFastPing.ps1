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

switch ($choice) {
    "1" {
        Write-Host ""
        Write-Host "TcpAckFrequency 적용" -ForegroundColor Cyan
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$guid" `
            -Name "TcpAckFrequency" -Type Binary -Value ([byte[]](1,0,0,0,0,0,0,0))
        
        Write-Host "TCPNoDelay 적용" -ForegroundColor Cyan
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$guid" `
            -Name "TCPNoDelay" -Type Binary -Value ([byte[]](1,0,0,0,0,0,0,0))
        
        Write-Host ""
        Write-Host "KeyboardSpeed 수정" -ForegroundColor Cyan
        Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardSpeed" -Value 48
        
        Write-Host "KeyboardDelay 수정" -ForegroundColor Cyan
        Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Value 0
        
        Write-Host ""
        Write-Host "NetworkThrottlingIndex 수정" -ForegroundColor Cyan
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" `
            -Name "NetworkThrottlingIndex" -Value 70
        
        Write-Host ""
        Write-Host "예약 대역폭 제한 해제" -ForegroundColor Cyan
        # Psched 키 생성 및 NonBestEffortLimit 값을 0으로 설정
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched" -Force | Out-Null
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched" `
            -Name "NonBestEffortLimit" -Type DWord -Value 0
        
        Write-Host ""
        Write-Host "MSMQ(Microsoft Message Queue) Server 활성화" -ForegroundColor Cyan
        Write-Host "MSMQ DCOM 프록시 활성화" -ForegroundColor Cyan
        Write-Host "MSMQ HTTP 지원 활성화" -ForegroundColor Cyan
        Write-Host "MSMQ 트리거 활성화" -ForegroundColor Cyan
        Write-Host "멀티캐스팅 지원 활성화" -ForegroundColor Cyan
        Write-Host ""
        Enable-WindowsOptionalFeature -Online -FeatureName "MSMQ-Container","MSMQ-Server","MSMQ-DCOMProxy","MSMQ-HTTP","MSMQ-Triggers","MSMQ-Multicast" | Out-Null
    }
    "2" {
        Write-Host ""
        Write-Host "TcpAckFrequency 삭제" -ForegroundColor Red
        Remove-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$guid" `
            -Name "TcpAckFrequency" -ErrorAction SilentlyContinue
        
        Write-Host "TCPNoDelay 삭제" -ForegroundColor Red
        Remove-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$guid" `
            -Name "TCPNoDelay" -ErrorAction SilentlyContinue
        
        Write-Host ""
        Write-Host "KeyboardSpeed 복원" -ForegroundColor Red
        Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardSpeed" -Value 31
        
        Write-Host "KeyboardDelay 복원" -ForegroundColor Red
        Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Value 1
        
        Write-Host ""
        Write-Host "NetworkThrottlingIndex 복원" -ForegroundColor Red
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" `
            -Name "NetworkThrottlingIndex" -Value 16
        
        Write-Host ""
        Write-Host "예약 대역폭 제한 설정" -ForegroundColor Red
        # NonBestEffortLimit 값만 제거합니다.
        Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched" `
            -Name "NonBestEffortLimit" -ErrorAction SilentlyContinue
        
        Write-Host ""
        Write-Host "MSMQ(Microsoft Message Queue) Server 비활성화" -ForegroundColor Red
        Write-Host "MSMQ DCOM 프록시 비활성화" -ForegroundColor Red
        Write-Host "MSMQ HTTP 지원 비활성화" -ForegroundColor Red
        Write-Host "MSMQ 트리거 비활성화" -ForegroundColor Red
        Write-Host "멀티캐스팅 지원 비활성화" -ForegroundColor Red
        Write-Host ""
        Disable-WindowsOptionalFeature -Online -FeatureName "MSMQ-Container","MSMQ-Server","MSMQ-DCOMProxy","MSMQ-HTTP","MSMQ-Triggers","MSMQ-Multicast" | Out-Null
    }
}
