---
layout: post
title: 롤 해외 클라이언트 한국어 적용하기
#summary: 
date : 2022-09-09
#update : 2023-05-30
published: true
categories: game
tags: 리그오브레전드 롤
---
## Windows
1. `C:\Riot Games\League of Legends` 폴더(또는 사용자 지정 설치 위치)에 있는 `LeagueClient.exe` 파일의 바로가기를 만들어 줍니다.

	<img src="/assets/LOLKRPatch/0.png" class="img-fluid">

2. 바로가기 오른쪽 메뉴에서 속성에 들어간 뒤, 아래의 경로를 복사하여 붙여 넣어 줍니다. 만약 설치 폴더가 다른 경우 경로 뒤에` --locale=ko_KR`만 붙여 넣어 줍니다.

	`"C:\Riot Games\League of Legends\LeagueClient.exe" --locale=ko_KR`

	<img src="/assets/LOLKRPatch/1.png" class="img-fluid">

3. 해당 바로가기를 실행하면 한글로 정상적으로 바뀌어서 실행됩니다.

	<img src="/assets/LOLKRPatch/2.png" class="img-fluid">

## mac OS
1. Mac OS 기반 제품에서 [Icon.icns](/assets/LOLKRPatch/Icon.icns)과 [League_of_Legends.command](/assets/LOLKRPatch/League_of_Legends.command) 파일을 다운 받습니다.

2. `League of Legends.command` 파일 오른쪽을 눌러서 정보 가져오기를 클릭합니다.

	<img src="/assets/LOLKRPatch/3.png" class="img-fluid">

3. 좌측 상단에 있는 아이콘 이미지에다가 `Icon.icns` 파일을 드래그 해 줍니다.

	<img src="/assets/LOLKRPatch/4.png" class="img-fluid">

4. 이후 `League of Legends.command` 파일을 실행하면 한글 언어로 정상 실행됩니다.

	<img src="/assets/LOLKRPatch/5.png" class="img-fluid">