# ios-itunes-search
iOS 과제 인터뷰 - iTunes Search
> 🧑🏻‍💻 과제 수행 기간: 23.08.23 ~ 23.08.27 (5일)

![1](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/29532f51-73e0-4c2e-a2a2-2c1de33f10b0)

<br>

# ⚙️ Framework / Architecture

- SwiftUI
- Combine
- MVI
- SPM

<img width="1028" alt="image" src="https://github.com/qwerty3345/ios-itunes-search/assets/59835351/c492779c-f99d-44fb-8258-8c4418f954d1">


## 🛠️ 개발 환경
- Xcode 14.3
- Swift 5.8
- iOS 16 버전
  > 귀사의 최근 배포 앱 target 이 16인 것에 맞추어 개발을 진행하였습니다.


## 📂 프로젝트 폴더링 구조

- 앱의 베이스가 되는 `Core` 모듈을 로컬 패키지로 분리하여 관리하였습니다.
    > `DIContainer` / `ReducerProtocol`,`Store` / `NetworkRouter` 등..
- 외부 라이브러리를 사용하지 않았습니다.

| AppStoreSearch | Core 모듈 |
| -------- | -------- |
| ![image](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/c64f612b-7b15-42fc-b201-6bc9cefd3d49) | ![image](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/7692e087-4dec-4655-a22a-bd5f90f06538) |

<br>

# 📱 동작 화면


## 🔍 검색

| 검색                                                                                                   | 검색어 추천                                                                                                           | 검색결과 (가로이미지)                                                                                 | 무한 스크롤    |
| ------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | --- |
| ![검색](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/43ecce4a-0102-45e2-a68f-eedd7d2c91ed) | ![검색어추천_최근검색](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/d45e7422-5e2a-4c93-82ee-9f48cc1caf14) |  ![검색_가로](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/69636ff9-62a9-45b2-a969-181cf7b4220f) |   ![무한스크롤](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/efeeca0f-81e0-4092-b75f-4802d404af4e) |


## 👀 상세보기

| 상세보기 | 상세보기 - 더보기 | 공유기능 | 다크모드 지원 |
| -------- | -------- | -------- | -------- |
|  ![상세보기](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/0305ec54-1eed-4892-8387-50cb442611cf)  |    ![상세보기_더보기](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/c1e9930d-f7de-4f44-97f1-e84d270ac9f9) |     ![공유기능](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/b70dd339-b4e6-438a-bc89-9d0099e01e1c) |   ![다크모드](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/7137ec33-8bbd-469a-a949-fcbaaa9a7816) |

<br>
<br>

# 🔥 트러블슈팅, 주요 내용
- 자세한 내용은 각 PR 내용에 담겨 있으니 참고 부탁 드립니다 :)
- 각 제목을 클릭하면 해당 PR로 이동합니다

-------

### 👉 [[Feat] Image 를 다운받고 캐싱하는 서비스, 뷰 구현 (RemoteImage) #11](https://github.com/qwerty3345/ios-itunes-search/pull/11)

![image](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/a7ec8ff5-7535-4570-8693-2bd15023457d)


-------

### 👉 [[Feat] 스크린샷 다양한 크기 대응, Carousel 형태 구현 #13](https://github.com/qwerty3345/ios-itunes-search/pull/13)

![image](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/fc117118-599b-4a54-85ea-2b57e8560efe)


-------

### 👉 [[Refactor] MVI 아키텍쳐 적용 #17](https://github.com/qwerty3345/ios-itunes-search/pull/17)

![image](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/43dac7e8-131b-481e-a589-899cd00c522b)


-------

### 👉 [[Refactor] 의존성 주입 DI Container 구현 #19](https://github.com/qwerty3345/ios-itunes-search/pull/19)

![image](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/4e8cdd66-1ed8-450e-81f1-981b7f1e2d33)


-------

### [✍️ 노션 개발일지](https://iosmason.notion.site/f43e0248888147aba66e2e535db7acd0?pvs=4)
- 매일 작업 과정을 정리 한 노션입니다.
    - 해당 내용을 바탕으로 **PR을 작성**하였습니다.
    > ![image](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/ec244e3c-f219-4433-8a11-7c99323fcd6e)

