---
layout: post
title: 인텔 CPU 윈도우 설치 오류 해결 방법 
summary: 인텔 11th Gen(Tiker Lake) CPU부터 발생하는 오류
date : 2022-09-11
update : 2023-06-08
published: true
categories: paper
tags: 윈도우
---
인텔 CPU에서 윈도우 설치를 하려고 하면 위와 같은 화면이 뜨면서 진행이 되지 않습니다.

	⚠️ 드라이버를 찾을 수 없습니다. 저장소 드라이버를 얻으려면 [드라이버 로드]를 클릭하세요.

<img src="/assets/WindowsSetupErrorIntel/0.png" class="img-fluid">

<h2>원인</h2>

다음과 같은 이유로 설치 시 사용자가 직접 드라이버를 로드해야합니다.

* 윈도우에서 기존의 저장장치는 HDD에서부터 사용 해오던 `SATA` 또는 `AHCI` 방식으로 관리되어 왔습니다.

* 현대의 저장장치가 HDD에서 SSD로 넘어 오면서 인텔의 11세대 CPU부터는 [VMD(Volume Management Device)](https://www.intel.co.kr/content/www/kr/ko/architecture-and-technology/intel-volume-management-device-overview.html)라는 새로운 기술을 기반으로 저장장치를 관리합니다.

* 이 기술은 인텔® 빠른 스토리지 기술(IRST, Intel Rapid Storage Technology) 드라이버를 필요로 합니다. 현재 정식으로 배포되는 윈도우 이미지에는 IRST 드라이버가 통합 있지 않습니다.

<h2>준비</h2>

1.  [인텔® 빠른 스토리지 기술](https://www.intel.co.kr/content/www/kr/ko/download/15667/intel-rapid-storage-technology-intel-rst-user-interface-and-driver.html)에서 `.zip` 로 된 드라이버를 받은 뒤, 압축을 풀어서 별도의 저장장치에 넣어줍니다.

	<img src="/assets/WindowsSetupErrorIntel/1.png" class="img-fluid">

2. 윈도우 설치 화면에서 `드라이버 로드(L)` → 드라이버가 있는 경로를 선택한 뒤, `다음`을 눌러서 넘어가 줍니다.

	<img src="/assets/WindowsSetupErrorIntel/2.png" class="img-fluid">

	<img src="/assets/WindowsSetupErrorIntel/3.png" class="img-fluid">

	<img src="/assets/WindowsSetupErrorIntel/4.png" class="img-fluid">

3.  이후 정상적으로 윈도우 설치가 가능합니다.

	<img src="/assets/WindowsSetupErrorIntel/5.png" class="img-fluid">