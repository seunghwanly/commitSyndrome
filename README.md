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
  <img src="https://user-images.githubusercontent.com/22142225/100584993-3248a300-3330-11eb-9e4e-983fe013d709.gif" width="200"/>
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
<p align="center">
  <img src="https://user-images.githubusercontent.com/33684401/100653225-6d2bf480-338b-11eb-91a9-fbaaa2d3a1a2.png" width="150"/>
  <img src="https://user-images.githubusercontent.com/33684401/100653247-7321d580-338b-11eb-9de7-c16e9b528f07.png" width="150"/>
  <img src="https://user-images.githubusercontent.com/33684401/100653249-73ba6c00-338b-11eb-910c-547701eeff9c.png" width="150"/>
  <img src="https://user-images.githubusercontent.com/33684401/100653251-74530280-338b-11eb-80c6-5e3cd8be8505.png" width="150"/>
</p>

### Manager
<p align="center">
  <img src="https://user-images.githubusercontent.com/33684401/100654499-3d7dec00-338d-11eb-9120-5e476f3ae460.png" width="300"/>
  <img src="https://user-images.githubusercontent.com/33684401/100654504-4242a000-338d-11eb-89e5-e391f78977bb.png" width="300"/>
  <img src="https://user-images.githubusercontent.com/33684401/100653759-39050380-338c-11eb-83cf-30b0c02907a9.png" width="300"/>
  <img src="https://user-images.githubusercontent.com/33684401/100653760-399d9a00-338c-11eb-9699-21890a74b084.png" width="300"/>
  <img src="https://user-images.githubusercontent.com/33684401/100653761-3a363080-338c-11eb-8e74-6133c516cb31.png" width="300"/>
  <img src="https://user-images.githubusercontent.com/33684401/100653762-3acec700-338c-11eb-9657-bf93b3f921b0.png" width="300"/>
</p>

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
2. Add your gmail address and password

example:
```json
{
  "email": "example@gmail.com",
  "password": "YOUR_PASSWORD"
}
```
3. Edit the email recipient at **lib/component/body/stock/stock_order.dart**
```dart
Future<void> sendEmail(BuildContext context) async {
  ...
    
  // Create email message.
  final message = Message()
    ..from = Address(username, "GAJUGA")
    ..recipients.add('example@gmail.com') // recipent email
    
  ...
}
```

### :bulb: IAMPORT X KAKAOPAY configuration for gajuga_manage
1. Create **[iamport](https://admin.iamport.kr/users/login)** account
2. Set PG company for your payment
```
System Settings > PG Settings > PG compnay
시스템설정 > PG설정(일반결제 및 정기결제) > PG사
```
:heavy_check_mark: Please select **TESTMODE(Sandbox) ON**, for testing

3. Copy your merchant identification code
```
My Info > merchant identification code
내정보 > 가맹점 식별코드
```
4. Edit the code at **lib/util/payment/iamport_payment.dart**
```dart
/* [Essential] merchant identification code | [필수입력] 가맹점 식별코드 */
userCode: MERCHANT_IDENTIFICATION_CODE,
/* [Essential] Payment Data | [필수입력] 결제 데이터 */
data: PaymentData.fromJson({
  'pg': 'kakaopay', // PG사
  'payMethod': 'card', // method | 결제수단
  'name': APPLICATION_NAME, // this will be printed when user is ready for payemnt | 주문명
  'merchantUid': ORDER_NUMBER, // 주문번호
  'amount': TOTAL_COST, // 결제금액
  'buyerName': BUYER_NAME, // 구매자 이름
  'buyerTel': BUYER_PHONE_NUMBER, // 구매자 연락처
  'buyerEmail': BUYER_EMAIL, // 구매자 이메일
  'buyerAddr': BUYER_ADDRESS, // 구매자 주소
  'buyerPostcode': BUYER_POST_CODE, // 구매자 우편번호
  'appScheme': APPLICATION_URL_SCHEME, // 앱 URL scheme
  'display': {
    'cardQuota': INSTALLMENT_MONTHLY_LIMIT //결제창 UI 내 할부개월수 제한
  }
}),
```
