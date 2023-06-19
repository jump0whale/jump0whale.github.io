---
layout: post
title: 설정 초기화하기 - 비주얼 스튜디오(Visual Studio)
#summary:
date : 2022-09-12
update : 2023-06-08
published: true
categories: comp
tags: POCU 프로그램
---
<img src="/assets/ResetVisualStudio/0.png" class="img-fluid">

C:\Program Files\Microsoft Visual Studio\ `①` \ `②` \Common7\IDE

`①`에는 본인이 사용하는 버전을 입력 `2019 ~ 2022`

`②`에는 본인이 사용 중인 에디션을 입력 `Community`, `Professional`, `Enterprise`   
<hr>
1. 명령 프롬프트(관리자) 실행 아래의 명령어를 입력

	<kbd>cd C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE</kbd>

	<kbd>Devenv.exe /ResetUserData</kbd>

	<kbd>exit</kbd>

2. 또는 1의 경로가 같다는 가정 하에(기본 설치 경로 및 2022 버전) 아래의 배치파일을 관리자 권한으로 실행

	[다운로드](/assets/ResetVisualStudio/vsstudio.bat)