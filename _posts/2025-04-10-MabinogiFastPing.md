---
layout: post
title: 마비노기 패스트핑 적용하기
#summary:
date : 2025-04-10
published: true
categories: game
tags: 마비노기
---
# TCP/IP 전송 이름 찾기

- win + x를 눌러 터미널(관리자) 실행 후(기본 프로필 Windows PowerShell) `getmac /fo list /v`를 복사하여 붙여 넣은 뒤 엔터를 눌러 줍니다.

    ![](/assets/MabinogiFastPing/1.png)

# 패스트핑 적용하기

1. 메모장에 다음 코드를 복사하여 붙여 넣어줍니다.

    ```
    Windows Registry Editor Version 5.00

    [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\]
    "TcpAckFrequency"=hex(b):01,00,00,00,00,00,00,00
    "TCPNoDelay"=hex(b):01,00,00,00,00,00,00,00

    [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Psched]
    "NonBestEffortLimit"=dword:00000000

    [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
    "NetworkThrottlingIndex"=dword:00000046
    ```

2. [TCP/IP 전송 이름 찾기](#tcpip-전송-이름-찾기)에서 빨간색 박스 부분을 복사하여 1번의 코드 3번째 줄 끝부분 / 와 ] 사이에 넣어준 뒤, '파일 - 다른 이름으로 저장 - 이름.reg(파일 형식 : 모든 파일)'로 저장하고 나서 해당 파일을 실행하여 레지스트리를 적용해 줍니다

    올바른 예시(해당 예시에 들어있는 전송 이름은 임의의 문자입니다.)

    `[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{A3147DRC-57ED-3BAE5-A9CE-FB8C6EE48243}]`

3. win + x를 눌러 '터미널(관리자)' 실행 후(기본 프로필 Windows PowerShell) 다음 명령어를 순차적으로 복사하여 넣은 뒤, 컴퓨터를 다시 시작하여 줍니다.

    `Get-WindowsOptionalFeature -Online`

    ↓

    `Enable-WindowsOptionalFeature -FeatureName "MSMQ-Container", "MSMQ-Server", "MSMQ-DCOMProxy", "MSMQ-HTTP", "MSMQ-Triggers", "MSMQ-Multicast" -Online`

# 원래대로 복원하기

- [패스트핑 적용하기](#패스트핑-적용하기)에서 1번의 코드와 4번의 명령어만 아래의 내용으로 대체한 뒤, 나머지 부분은 동일하게 진행하여 줍니다.

    ```
    Windows Registry Editor Version 5.00

    [-HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\]
    "TcpAckFrequency"=hex(b):01,00,00,00,00,00,00,00
    "TCPNoDelay"=hex(b):01,00,00,00,00,00,00,00

    [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Psched]
    "NonBestEffortLimit"=dword:00000000

    [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
    "NetworkThrottlingIndex"=dword:00000010
    ```

    `Disable-WindowsOptionalFeature -FeatureName "MSMQ-Container", "MSMQ-Server", "MSMQ-DCOMProxy", "MSMQ-HTTP", "MSMQ-Triggers", "MSMQ-Multicast" -Online`