---
layout: post
title: 설정 초기화하기 - 비주얼 스튜디오(Visual Studio)
#summary:
date : 2022-09-12
update : 2023-07-02
published: true
categories: comp
tags: POCU 가이드
---

### 참고 사이트

- [여러 컴퓨터에서 Visual Studio 설정 동기화](https://learn.microsoft.com/ko-kr/visualstudio/ide/synchronized-settings-in-visual-studio?view=vs-2022#synchronized-settings)

- [/ResetSettings (devenv.exe)](https://learn.microsoft.com/ko-kr/visualstudio/ide/reference/resetsettings-devenv-exe?view=vs-2022)

- [How to fully reset all Visual Studio settings to factory defaults?](https://superuser.com/questions/1663409/how-to-fully-reset-all-visual-studio-settings-to-factory-defaults)

### 경로 설정

C:\Program Files\Microsoft Visual Studio\ ① \ ② \Common7\IDE

* ①에는 본인이 사용하는 버전을 입력 `2019 ~ 2022`

* ②에는 본인이 사용 중인 에디션을 입력 `Community`, `Professional`, `Enterprise`   

### 환경 설정 초기화하기

* 비주얼 스튜디오 내 환경 설정만 초기화하는 방법입니다.

* 기존 환경 설정은 자동으로 백업되며, IDE 개발 환경은 일반(General)으로 설정 됩니다.

* 명령프롬프트(관리자)를 실행후 아래 명령어를 입력합니다.

	<kbd>cd C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE</kbd>

	<kbd>devenv /ResetSettings</kbd>

### 환경 설정과 사용자 정보까지 초기화하기

* 환경 설정과 함께 로그인된 계정 정보까지 초기화 되며, 라이센스를 다시 인증해야 할 수 있습니다.
<img src="/assets/ResetVisualStudio/0.png" class="img-fluid">

* 명령프롬프트(관리자)를 실행후 아래 명령어를 입력합니다.

	<kbd>cd C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE</kbd>

	<kbd>devenv /ResetUserData</kbd>