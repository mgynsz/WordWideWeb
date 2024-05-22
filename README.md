# Table of Contents
1. [Description](#description)
2. [Timeline](#timeline)
3. [Demo](#demo)
4. [Features](#features)
5. [Requirements](#requirements)
6. [Stacks](#stacks)
7. [ProjectStructure](#projectStructure)
8. [Developer](#developer)

# WWW : Word Wide Web

// logo 이미지 추가



## Description

단어로 연결된 세계.
따로 또 같이 공부하는 커뮤니티 사전검색 단어장! 
맞다이로 들어와.. 


사전 검색 단어로 나만의 단어장을 만들거나, 
(초대한 or 초대받은 친구들과 공유된 테스트 단어장으로 게임하듯 공부할 수 있습니다.)


## Timeline

<details>
   <summary> 24.05.13 </summary>
    <pre>● Project 아이디어 회의
    ○ 컨셉 논의, 역할 분담, 와이어프레임 구성

    </pre>
</details>

<details>
   <summary> 24.05.14 </summary>
        <pre>● 주요 기능에 대한 상세한 논의
● 소셜 로그인 페이지 구현
    ○ Sign in / Sign up 기능 및 페이지 구현
        </pre>
</details>

<details>
   <summary> 24.05.15 </summary>
    <pre>● 계정 정보 저장(backend) 기능 구현
● Firebase 구축
    </pre>
</details>

<details>
   <summary> 24.05.16 </summary>
   <pre>● ㅁㅁㅁㅁ
● ㅁㅁㅁㅁ
● ㅁㅁㅁㅁ
● ㅁㅁㅁㅁ
   </pre>
</details>

<details>
   <summary> 24.05.17 </summary>
   <pre>● 친구 초대 페이지 생성
● ㅁㅁㅁㅁ
● ㅁㅁㅁㅁ
● ㅁㅁㅁㅁ
● ㅁㅁㅁㅁ
● ㅁㅁㅁㅁ
   </pre>
</details>

<details>
   <summary> 24.05.18 </summary>
   <pre>● ㅁㅁㅁㅁ
   </pre>
</details>    

<details>
   <summary> 24.05.21 </summary>
   <pre>● ㅁㅁㅁㅁ
   </pre>
</details>    

<details>
   <summary> 24.05.22 </summary>
   <pre>● ㅁㅁㅁㅁ
   </pre>
</details>    

<details>
   <summary> 24.05.23 </summary>
   <pre>● ㅁㅁㅁㅁ
   </pre>
</details>   

<details>
   <summary> 24.05.24 </summary>
   <pre>● 최종 점검 (UI 디테일 및 파일명, 디자인 패턴 점검 등)
● ReadMe 작성
   </pre>
</details> 

## Demo
// 모든 화면 이미지 캡처 추가 예정


## Features
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


### 단어 검색
- ㅁㅁㅁㅁ


### 단어 추가 (사전 검색)
- ㅁㅁㅁㅁ


### 단어장 생성
- ㅁㅁㅁㅁ
- ㅁㅁㅁㅁ
- ㅁㅁㅁㅁ


### 친구 초대 요청
- 회원 정보 수정
- 주행 기록
- 주행 가이드


### 테스트 기능
- 정해진 시간 동안 정해진 단어의 퀴즈를 테스트하는 기능


### 테스트 결과
- 맞춘 단어와 틀린 단어의 결과 안내 기능


## Requirements
- App requires **iOS 17.4 or above**

## Stacks
- **Environment**

    <img src="https://img.shields.io/badge/-Xcode-147EFB?style=flat&logo=xcode&logoColor=white"/> <img src="https://img.shields.io/badge/-git-F05032?style=flat&logo=git&logoColor=white"/>

- **Language**

    <img src="https://img.shields.io/badge/-swift-F05138?style=flat&logo=swift&logoColor=white"/> 

- **API**

    <img src="https://img.shields.io/badge/-Kakao-FFCD00?style=flat&logo=Kakao&logoColor=white"/>

- **Communication**

    <img src="https://img.shields.io/badge/-Slack-4A154B?style=flat&logo=Slack&logoColor=white"/> <img src="https://img.shields.io/badge/-Notion-000000?style=flat&logo=Notion&logoColor=white"/> <img src="https://img.shields.io/badge/-Figma-F24E1E?style=flat&logo=Figma&logoColor=white"/>

## Project Structure

```markdown
WWW
├── Model
│   ├── NetworkManager
│   ├── RemoteDictionary
│   ├── MyPage
│   └── InvitationData
│
├── View
│   ├── DictionaryTableViewCell
│   ├── TestFriendViewCell
│   ├── TestResultView
│   ├── TestView
│   ├── TestIntroView
│   ├── CarouselLayout
│   ├── DefaultTableViewCell
│   ├── ExpandableTableViewCell
│   └── InvitedFriendCell
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


## Developer
*  **박준영** ([labydin](https://github.com/labydin))
    - ㅁㅁㅁㅁㅁㅁ
    - ㅁㅁㅁㅁㅁㅁ
    - ㅁㅁㅁㅁㅁㅁ
    - ㅁㅁㅁㅁㅁㅁ 
*  **신지연** ([JiYeonDu](https://github.com/JiYeonDu))
    - ㅁㅁㅁㅁㅁㅁ
    - ㅁㅁㅁㅁㅁㅁ
    - ㅁㅁㅁㅁㅁㅁ
    - ㅁㅁㅁㅁㅁㅁ
*  **장진영** ([mgynsz](https://github.com/mgynsz)
    - ㅁㅁㅁㅁㅁㅁ
    - ㅁㅁㅁㅁㅁㅁ
    - ㅁㅁㅁㅁㅁㅁ
    - ㅁㅁㅁㅁㅁㅁ
*  **채나연** ([Nayeon Chae](https://github.com/NY-Chae))
    - ㅁㅁㅁㅁㅁㅁ
    - ㅁㅁㅁㅁㅁㅁ
    - ㅁㅁㅁㅁㅁㅁ
    - ㅁㅁㅁㅁㅁㅁ
