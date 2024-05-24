<div align="center">
<h1> Word Wide Web </h1>
🌿한글 단어로 연결된 세계: 따로 또 같이! 게임처럼 재미있게!🌿
</div>


## WWW : Word Wide Web
<p align="center">
  <img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/0586fa35-5a5a-4fe5-9b1b-51c84c4807dc" width="500" height="500">
</p>

## Description

단어로 연결된 세계.
공부로 만나는 세계.
따로 또 같이 공부하는 커뮤니티 사전검색 단어장! 
맞다이로 들어와.. 


(사전 검색 단어로 나만의 단어장을 만들거나, 
초대한 or 초대받은 친구들과 공유된 테스트 단어장으로 게임하듯 공부할 수 있습니다.)

<br>
<br>

## Developer (가나다 순)
*  **박준영** ([labydin](https://github.com/labydin))
    - 사전 API 네트워크 연결, 단어장 내 단어 추가 및 파일 구조 관리 전반

*  **신지연** ([JiYeonDu](https://github.com/JiYeonDu))
    - 단어장 검색 및 단어 테스트 및 예약 알람, 결과 기록 저장 등 단어 테스트 전반

*  **장진영** ([mgynsz](https://github.com/mgynsz))
    - Apple, Google 로그인 관리 및 친구 초대를 위한 backend 전반

*  **채나연** ([Nayeon Chae](https://github.com/NY-Chae))
    - 홈 화면 및 단어장 캐로셀, 단어 상세페이지 등 UI Design 전반 

<br>
<br>

## 1. Requirements
- App requires **iOS 17.4 or above**

<br>
<br>


## 2. Stacks
- **Environment**

    <img src="https://img.shields.io/badge/-Xcode-147EFB?style=flat&logo=xcode&logoColor=white"/> <img src="https://img.shields.io/badge/-git-F05032?style=flat&logo=git&logoColor=white"/> <img src="https://img.shields.io/badge/Firebase-FFCA28?style=flat-square&logo=firebase&logoColor=black"/> <img src="https://img.shields.io/badge/Adobe InDesign-FF3366?style=flat-square&logo=Adobe InDesign&logoColor=white"/>
    
- **Framework**

  <img src="https://img.shields.io/badge/-UIKit-2396F3?style=flat&logo=uikit&logoColor=white"/> <img src="https://img.shields.io/badge/-SwiftUI-F05138?style=flat&logo=swift&logoColor=white"/> 

- **Language**

    <img src="https://img.shields.io/badge/-swift-F05138?style=flat&logo=swift&logoColor=white"/> 

- **API**

    한국 기초 사전 API (국립 국어원 제작)

- **Communication**

    <img src="https://img.shields.io/badge/-Slack-4A154B?style=flat&logo=Slack&logoColor=white"/> <img src="https://img.shields.io/badge/-Notion-000000?style=flat&logo=Notion&logoColor=white"/> <img src="https://img.shields.io/badge/-Figma-F24E1E?style=flat&logo=Figma&logoColor=white"/>

<br>
<br>

## 3. Timeline
### 개발 기간
- 전체 개발 기간 : 2024-05-13 ~ 2024-05-24
<details>
   <summary>5/13 - 5/14</summary>
    <pre>● 기획 / 디자인
    ○ 컨셉, 역할 분담, 와이어프레임 등
    </pre>
</details>

<details>
   <summary>5/15 - 5/16</summary>
        <pre>● 소셜 로그인 구현 (회원 가입 과정은 skip)
    ○ 구글 아이디, 애플 계정, 이메일 인증 sign in  
        </pre>
</details>

<details>
   <summary>5/17 - 5/21</summary>
    <pre>● 백엔드 전반 
● firebase를 통한 계정 관리 및 친구 초대 기초 완성
    </pre>
</details>

<details>
   <summary>5/22 - 5/23</summary>
    <pre>● 최종 점검
    ○ 데이터 연결 / 에러 처리 / UI design 수정
    </pre>
</details>

<br>

### 작업 관리
- GitHub와 slack으로 자료를 공유하고 협업하였습니다.
- Jep으로 상시 회의를 진행하며 작업 분배와 소통을 하였습니다.

<br>
<br>

## 4. Features
### 소셜 로그인
- sign in / sign up with Google & Apple


### Dictionary API
- 사전 검색 정보 네트워크 연결


### 홈 화면
- 내가 만들었거나 소속된 단어장 선택
- 선택한 단어장의 단어 리스트 및 단어의 사전적 정의 확인


### 내 정보 기능
- 프로필 세팅
- 로그아웃
- 단어장 생성 및 관리
- 닉네임 및 프로필 이미지 수정


### 단어장 생성
- 원하는 단어장 컬러 선택
- public 또는 private 옵션 설정 
- 단어장으로 친구 초대
- 단어 테스트 시간 : deadLine 세팅
  

### 사전에서 단어 검색
- 궁금한 단어를 search bar에 입력
- 단어의 정의와 발음 확인


### 단어장에 단어 추가
- 검색한 단어를 단어장에 추가


### 친구 초대 (초대 요청 notify)
- 다른 유저가 단어장 생성시 나를 초대하며 발송한 초대장 
- Reject or Accept 옵션 중 선택


### 단어 테스트
- 정해진 시간 동안 정해진 단어의 퀴즈 테스트 기능


### 단어 테스트 결과
- 맞춘 단어와 틀린 단어의 결과 안내 기능

<br>
<br>

## 5. Demo
### 1.스플래시, 로그인
<p float="left">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/51002a48-148e-4887-baec-271207916fda" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/996b44d5-4ec6-4644-a63b-329508c18010" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/c7e8c23b-ff2d-475f-9d81-3b1b2db97a34" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/6951cc67-562c-4446-829f-8e022eed8dcd" width="200" height="430">
</p>

### 2.홈화면
<p float="left">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/6a211366-c3c6-4e7b-87e2-fc4e486043fd" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/4f85f9d2-6678-4094-b38a-036bc9f5e47a" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/7501ba60-6165-4ec4-8a0c-d6954bb7c720" width="200" height="430">
</p>

### 3.단어장 검색화면
<p float="left">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/632e44d0-1a7a-4ecb-b4f6-68fca2d94818" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/9f4703a9-c1e5-401d-a363-ff42fd273184" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/24fe93c3-3f20-4724-9f91-e0656d31fe82" width="200" height="430">
</p>

### 4.단어추가화면 - 사전기능
<p float="left">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/ba1a95f5-fb91-40e5-a6e0-3f27a173a478" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/e08d6256-374c-4aaa-9b01-b54d65bad24c" width="200" height="430">
</p>

### 5.초대요청확인화면
<p float="left">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/a62cbdab-791f-4811-b5d9-29d334288453" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/9e564910-2f8d-415c-b027-452b04ed54a8" width="200" height="430">
</p>

### 6.내정보기능
<p float="left">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/a62cbdab-791f-4811-b5d9-29d334288453" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/102b09c8-208a-4886-9233-ef9a81e6ee2b" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/3a111017-127f-4f98-8a72-b39177ac2423" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/c460f7a8-a0f5-4f39-b951-672d569fab64" width="200" height="430">
</p>

### 7.테스트화면
<p float="left">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/a3daf9f4-3105-4f36-b78c-fb787fdd05a6" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/ced6ebee-d59a-49b4-baf7-7ee41237549e" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/65f0c8db-d524-4774-a46f-073784cdc455" width="200" height="430">
<img src="https://github.com/ZooomBiedle/WordWideWeb/assets/115604822/841100c0-a79e-4634-9f02-cb67e48470bf" width="200" height="430">
</p>  

<br>
<br>

## 6. Project Structure

```markdown
WWW
├── Model
│   ├── Network
│   │    ├── NetworkManager
│   │    ├── RemoteDictionary
│   │    ├── MyPage
│   │    └── InvitationData
│   │
│   └─ Firebase
│      ├─ SignInAppleHelper
│      ├─ AuthenticationManager
│      ├─ FirestoreManager
│      ├─ SignInGoogleHelper
│      ├─ User
│      └─ Utilities
│
│ 
├── View
│   ├── Cell
│   │    ├── TestFriendViewCell
│   │    ├── FriendCell
│   │    ├── DefaultTableViewCell
│   │    ├── WordbookCell
│   │    ├── PlayingListViewCell
│   │    ├── ExpandableTableViewCell
│   │    ├── InvitedFriendCell
│   │    ├── DictionaryTableViewCell
│   │    └── MyPageCollectionViewCell
│   │
│   ├── TestResultView
│   ├── TestView
│   ├── TestIntroView
│   ├── CarouselLayout
│   ├── PlayingListView
│   ├── CircleAnimateText
│   └── LaunchView
│
│
├── Controller
│   ├── TabBarController
│   ├── MyPageVC
│   ├── MyPageCollectionViewCell
│   ├── MyPageWordViewController
│   ├── MyPageModalViewController
│   ├── PlayingListViewController
│   ├── DictionaryVC
│   ├── SearchFriendsVC
│   ├── SignInVC
│   ├── SignUpVC
│   ├── InvitingVC
│   ├── MyInfoViewController
│   ├── WordbookCell
│   ├── AddWordBookVC
│   ├── RadioButton
│   ├── ProfileVC
│   ├── ProfileViewModel
│   ├── TestIntroViewController
│   ├── TestResultViewController
│   ├── TestViewController
│   └── EmptyCollectionViewCell
│
│
├── Component
│   ├── AppDelegate
│   ├── SceneDelegate
│   └── ViewController
│
│
├── Extension
│   ├── UIFont+Ext
│   ├── UIColor+Ext
│   ├── NotificationExtensions
│   ├── Formatter
│   ├── Numeric
│   ├── MyPage+Ext
│   └── CollectionView+Ext
└ 
```


