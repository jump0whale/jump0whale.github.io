---
layout: post
title: 설정 초기화하기 - 소스트리(Sourcetree)
#summary:
date : 2022-09-13
update : 2023-07-02
published: true
categories: comp
tags: POCU 가이드
---

### 참고 사이트

- [How to Wipe SourceTree Preferences](https://confluence.atlassian.com/sourcetreekb/how-to-wipe-sourcetree-preferences-412484640.html)

### Windows

- 명령프롬프트(관리자)를 실행후 아래 명령어를 입력합니다.

    <kbd>taskkill /f /im SourceTree.exe</kbd>

    <kbd>rmdir %AppData%\Atlassian /s /q</kbd>

    <kbd>rmdir %LocalAppData%\Atlassian /s /q</kbd>

    <kbd>eixt</kbd>

### Mac OS

- 터미널을 실행 후 아래 명령어를 입력합니다.

    <kbd>killall -9 Sourcetree</kbd>

    <kbd>rm -rf ~/Library/Application Support/SourceTree</kbd>

    <kbd>defaults delete com.torusknot.SourceTreeNotMAS</kbd>

    <kbd>exit;</kbd>

<img src="/assets/ResetSourceTree/0.png" class="img-fluid">