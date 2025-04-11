---
layout: post
title: 마비노기 패스트핑 적용하기
#summary:
date : 2025-04-10
update : 2025-04-11
published: true
categories: game
tags: 마비노기
---
1. [스크립트 파일](/assets/MabinogiFastPing/MabinogiFastPing.ps1)을 다운 받아 줍니다.

2. win + x를 눌러 터미널(관리자) 실행 후,(기본 프로필 Windows PowerShell) 경로를 1에서 받은 스크립트 파일과 같은 경로로 설정하여 줍니다.`

    - 기본 경로 c:\%UserProfile%\

        - 다운로드 폴더로 경로 변경 → `cd downloads` 입력
    
        - 바탕화면으로 경로 변경 → `cd desktop` 입력

3. 다음 명령어를 넣어 줍니다.

    `powershell.exe -NoProfile -ExecutionPolicy Bypass -File "MabinogiFastPing.ps1"`

4. 선택에 따라 숫자를 입력한 후, 컴퓨터를 다시 시작하면 적용이 완료됩니다.