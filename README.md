# 🐶 개밥줬어?

### 😄 팀원

| **ID** | **이름** | **역할** |
| :----: | :------: | :------: |
|  S034  |  윤상진  | iOS |
|  S046  |  이진하  | iOS |
|  S058  |  최완식  | iOS |


### 🤔 기획의도

- 개밥줬어? 모두가 바쁜 요즘 우리집 강아지 밥은 누가 챙겨?!
- 이제 편하게 앱으로 확인하세요

### ✏ 한줄소개

- 우리집 강아지 생존권을 확립하는 식사 여부 확인 애플리케이션

### 💻 서비스

- 가족 구성원이 강아지 밥을 주었는지 직관적으로 파악할 수 있다.
    - 누가?
    - 무엇을?
- 가족 구성원간의 채팅기능 추가로 간단한 정보도 공유할 수 있다.

### 📑 상세 기능
1. 방 만들기
    1. 사용자 등록하기
        - 사용자 이름과 사용자 역할을 요청하였습니다. 사용자 역할은 CollectionView를 띄워서 6가지 이모지 중 하나를 선택할 수 있게 하였습니다.
    2. 강아지 등록하기
        - 강아지 사진과 강아지 이름을 요청하였습니다. 강아지 사진 같은 경우엔 picker에서 선택하게 되면 FirebaseStorage에 저장하고 URL을 요청해서 FireStore에 저장합니다.
2. 방 참가하기
    - 방 이름을 입력하면 이미 등록된 방으로 이동하게 됩니다.
    
4. 밥 주기
    - 밥은 CollectionView 에 있는 버튼을 클릭하면 사용자 역할처럼 6가지 이모지 중 하나를 선택할 수 있게 하였습니다.
    - 기본적으로 4개의 밥만 시간과 이모지만 보이게 해두었고, 자세한 정보 혹은 추가 정보는 더보기 창을 눌러서 확인할 수 있습니다.
6. 더보기
    - 더보기에서는 TableView를 이용하였습니다. 사용자 이모지 / 준 먹이 텍스트 정보 / 시간을 확인할 수 있습니다.
8. 채팅하기
    - 채팅은 ChatViewController에 Firestore 스냅샷을 달아 채팅데이터를 실시간 업데이트 하고 받아올 수 있도록 구현했습니다.
    - 채팅 데이터 조회, 추가 하면 스냅샷이 업데이트된 변경사항을 받아와 뷰컨트롤러에 보여줄 수 있습니다.
### 🖥 실행환경
- XCode13(mac BigSur)
- clone 후 `pod install` m1 환경이라면 로제타 or `arch -x86_64 pod install` 로 의존성 실행


### 🖼 와이어프레임

![image](https://user-images.githubusercontent.com/37871541/134456379-d0f952d7-a27c-458d-b554-0ea75809745d.png)


### 💾 데이터베이스 구조

계획 단계에서 DB 구조
<img width="1111" alt="스크린샷 2021-09-23 오후 2 39 41" src="https://user-images.githubusercontent.com/37871541/134459394-5a682a80-5663-40db-a954-f2c089313dd6.png">
<img width="1111" alt="스크린샷 2021-09-23 오후 2 39 57" src="https://user-images.githubusercontent.com/37871541/134459393-405443ba-7f30-4741-b601-8cd27c5e2c66.png">
<img width="1111" alt="스크린샷 2021-09-23 오후 2 40 08" src="https://user-images.githubusercontent.com/37871541/134459389-0416fbb0-191e-458e-b254-13cc6609bf55.png">

구현하면서 변경된 DB 구조
![image](https://user-images.githubusercontent.com/40790219/134619927-656283a6-3f09-409b-8a89-83d3ddedfcd7.png)
![image](https://user-images.githubusercontent.com/40790219/134620016-54016ec6-9d16-46d4-b86a-47e764b2b4b0.png)

### 🖥 기술 스택

* FireBase
* UIKit

### ✔️ 목표

- S034_윤상진 : 팀 프로젝트 경험이 없었는데, 재밌게 같이 개발 1박2일 즐기고 싶습니다.
- S046_이진하 : 팀플도 하고 친구도 만들고 싶습니다~ :) 
- S058_최완식 : 캠퍼분과 친해지고 싶어요

### 😭 소감

- S034_윤상진 : 신청할 땐 연휴이후 리프레쉬를 위해 신청했는데, 좋은 조원분들 만나서 재밌는 시간 보냈습니다. 감사해요~
- S046_이진하 : 해커톤은 처음이었는데 2일동안 서로 친해지고 프로젝트도 무사히 마칠 수 있어서 너무 즐거웠습니다!! 담에 또 하고싶어요 :) 
- S058_최완식 : 미래에 나에게 고통을 선물하는 줄 알았지만 좋은 팀원들을 만나 행복과 같은 시간이었습니다. 다음에 또봐용





![1](https://user-images.githubusercontent.com/37871541/134623608-9f7bfc98-48c5-4ca2-af4b-536026d7ac75.gif)
![2](https://user-images.githubusercontent.com/37871541/134623606-bc12bc63-f619-48dd-8c79-450d619e928d.gif)
![3](https://user-images.githubusercontent.com/37871541/134623605-c4f05fea-9403-4ce0-9020-496fc7443288.gif)
![4](https://user-images.githubusercontent.com/37871541/134623602-34bfc8c5-3aad-472c-b337-de236d70cfd2.gif)
![5](https://user-images.githubusercontent.com/37871541/134623595-eb2c508f-9cc7-4a17-a3a6-e065402e8e42.gif)
![6](https://user-images.githubusercontent.com/37871541/134623582-ec22df0e-a2ef-4ae9-8f6a-ad15a6228918.gif)
