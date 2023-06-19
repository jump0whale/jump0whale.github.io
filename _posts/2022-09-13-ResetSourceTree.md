---
layout: post
title: 설정 초기화하기 - 소스트리(Sourcetree)
#summary:
date : 2022-09-13
update : 2023-06-08
published: true
categories: comp
tags: POCU 프로그램
---
<img src="/assets/ResetSourceTree/0.png" class="img-fluid">

[출처](https://confluence.atlassian.com/sourcetreekb/how-to-wipe-sourcetree-preferences-412484640.html)

소스트리 프로그램을 삭제한 뒤, 재설치 하지 않아도 됩니다.

**Windows**

1.  명령프롬프트(관리자)를 실행후 아래 명령어를 차례로 입력

    <kbd>taskkill /f /im SourceTree.exe</kbd>

    <kbd>rmdir %AppData%\Atlassian /s /q</kbd>

    <kbd>rmdir %LocalAppData%\Atlassian /s /q</kbd>

    <kbd>eixt</kbd>

2. 또는 기본 경로에 설치 되어 있다는 가정 하에 아래의 배치 파일을 관리자 권한으로 실행

    [다운로드](/assets/ResetSourceTree/sourcetree.bat)

**Mac OS**

* 터미널을 실행 후 아래 명령어를 차례로 입력

    <kbd>killall -9 Sourcetree</kbd>

    <kbd>rm -rf ~/Library/Application Support/SourceTree</kbd>

    <kbd>defaults delete com.torusknot.SourceTreeNotMAS</kbd>

    <kbd>exit;</kbd>