<h1 align="center">
  GAJUGA
</h1>
<h3 align="center">
2020-2 소프트웨어공학개론 팀 프로젝트 - 커밋증후군
</h3>
<h4 align="center">
Flutter X Firebase 
</h4>
<p align="center">
<!-- 이미지 들어갈 자리 -->
</p>

<p align="center">
  <a href="#developers">Developers</a> •
  <a href="#key-features">Key Features</a> •
  <a href="#description">Description</a> •
  <a href="#screenshots">Screenshots</a> •
  <a href="#usage">Usage</a>
</p>

## Developers
[이승환](https://github.com/seunghwanly), [김관우](https://github.com/Kim-kwan-woo), [박종하](https://github.com/jonghapark), [이주영](https://github.com/JuYeong0413)

## Key Features
* Firebase Authentication
* Firebase Realtime Database
* KakaoPay

## Description
### User
* 전체메뉴조회
* 인기메뉴확인
* 장바구니
* 주문 및 결제
* 주문상태확인
* 주문내역조회

### Manager
* 메뉴관리 - 메뉴 수정, 메뉴 검색
* 직원관리 - 직원 프로필 수정, 직원 활동내역 조회
* 매출관리 - 메뉴별 매출 확인, 순이익 확인, 메뉴 인기도 확인
* 재고관리 - 재고 입력, 발주 신청
* 주문처리

## Screenshots
### User

### Manager


## Usage
For help getting started with Flutter, view the online [documentation](https://flutter.io/).

### :bulb: Running the app locally
1. Clone this repository.
```terminal
$ git clone https://github.com/seunghwanly/commitSyndrome.git
```
2. Change directory depending on what appliaction you want to run.
* User app
```terminal
$ cd commitSyndrome/gajuga_user/
```
* Manager app
```terminal
$ cd commitSyndrome/gajuga_manage/
```
3. Get packages
```terminal
$ flutter packages get
```
4. Run the app
```terminal
$ flutter run
```

### :bulb: Mailer configuration for gajuga_manage
1. Create **credentials.json** in root directory(`commitSyndrome/gajuga_manage/`)
2. Copy & paste `credentials-sample.json` in `credentials.json`
3. Add your gmail address and password

example:
```json
{
  "email": "example@gmail.com",
  "password": "YOUR_PASSWORD"
}
```
