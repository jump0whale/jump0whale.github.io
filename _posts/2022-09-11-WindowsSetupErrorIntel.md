---
layout: post
title: 인텔 CPU 윈도우 설치 오류 해결 방법 
summary: 인텔 11th Gen(Tiker Lake) CPU부터 발생하는 오류
date : 2022-09-11
update : 2023-07-02
published: true
categories: paper
tags: 윈도우
---
<h2>오류 원인</h2>
<blockquote class="blockquote">⚠️ 드라이버를 찾을 수 없습니다. 저장소 드라이버를 얻으려면 [드라이버 로드]를 클릭하세요.</blockquote>

인텔 CPU에서 윈도우 설치를 하려고 하면 다음 화면에서 위와 같은 문구가 뜨면서 설치를 진행 할 수가 없는 상황이 발생합니다.

<img src="/assets/WindowsSetupErrorIntel/0.png" class="img-fluid">

다음과 같은 이유로 설치 시 사용자가 직접 드라이버를 로드해줘야 합니다.

* 인텔의 11세대 CPU부터는 NVME 규격의 SSD를 효율적으로 관리하기 위해 [VMD(Volume Management Device)](https://www.intel.co.kr/content/www/kr/ko/architecture-and-technology/intel-volume-management-device-overview.html)라는 새로운 기술을 사용합니다.

* 이 기술은 기존의 레거시 드라이버(SATA, AHCI)가 아닌 인텔® 빠른 스토리지 기술(IRST, Intel Rapid Storage Technology) 기반으로 작동합니다. 현재 정식으로 배포되는 윈도우 이미지에는 이 드라이버가 통합되어 있지 않습니다.

<h2>해결 방법</h2>

1.  [인텔® 빠른 스토리지 기술](https://www.intel.co.kr/content/www/kr/ko/download/15667/intel-rapid-storage-technology-intel-rst-user-interface-and-driver.html)에서 `.zip` 로 된 드라이버를 받은 뒤, 압축을 풀어서 별도의 저장장치에 넣어줍니다.
	<img src="/assets/WindowsSetupErrorIntel/1.png" class="img-fluid">

2. 윈도우 설치 화면에서 `드라이버 로드(L)`를 눌러 줍니다.
	<img src="/assets/WindowsSetupErrorIntel/2.png" class="img-fluid">

3. 드라이버가 있는 경로를 지정한 뒤, `확인`을 눌러 줍니다.
	<img src="/assets/WindowsSetupErrorIntel/3.png" class="img-fluid">

4. 목록에 뜨는 드라이버 중 아무거나 선택한 후 `다음`을 눌러서 넘어가 줍니다.
	<img src="/assets/WindowsSetupErrorIntel/4.png" class="img-fluid">

5.  저장장치가 정상적으로 인식이 되면서 윈도우 설치가 가능해집니다.
	<img src="/assets/WindowsSetupErrorIntel/5.png" class="img-fluid">