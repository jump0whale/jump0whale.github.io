---
layout: post
title: 마비노기 패스트핑 적용하기
#summary:
date : 2025-04-10
update : 2025-04-12
published: true
categories: game
tags: 마비노기
---
1. [스크립트 파일](/assets/MabinogiFastPing/MabinogiFastPing.ps1)을 downloads 폴더에 받아 줍니다.

2. Win + x를 눌러 터미널(관리자)을 실행하여 다음 명령어를 입력한 뒤, 작업할 번호를 입력하면 완료됩니다.

    C:\Users\사용자 이름> `cd downloads`

    C:\Users\사용자 이름\downloads> `powershell.exe -NoProfile -ExecutionPolicy Bypass -File "MabinogiFastPing.ps1"`
    
    ![](/assets/MabinogiFastPing/1.png)

- 적용 항목

    - 네트워크 GUID 체크

    - TcpAckFrequency

    - TCPNoDelay

    - KeyboardSpeed

    - KeyboardDelay

    - NetworkThrottlingIndex

    - QOS 패킷 스케쥴러 예약 대역폭 제한 해제

    - MSMQ(Microsoft Message Queue) Server

    - MSMQ DCOM 프록시 활성화

    - MSMQ HTTP 지원 활성화

    - MSMQ 트리거 활성화

    - 멀티캐스팅 지원 활성화