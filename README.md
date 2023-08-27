# ios-itunes-search
iOS 과제 인터뷰 - iTunes Search

![1](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/4fd1492d-86de-45cc-b4df-ebba24ab1e4f)

> 🧑🏻‍💻 과제 수행 기간: 23.08.23 ~ 23.08.27 (5일)

## ⚙️ Framework / Architecture

- SwiftUI
- Combine
- MVI
- SPM

<img width="1028" alt="image" src="https://github.com/qwerty3345/ios-itunes-search/assets/59835351/49e5be8e-bff2-4976-9a1e-a12242ea37df">


### 🛠️ 개발 환경
- Xcode 14.3
- Swift 5.8


### 📂 프로젝트 폴더링 구조

- 앱의 베이스가 되는 `Core` 모듈을 로컬 패키지로 분리하여 관리하였습니다.
    > `DIContainer` / `ReducerProtocol`,`Store` / `NetworkRouter` 등..
- 외부 라이브러리를 사용하지 않았습니다.

| AppStoreSearch | Core 모듈 |
| -------- | -------- |
| ![image](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/d2eb49aa-f036-464c-8839-6cacebc3b5cc) | ![image](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/1d3850a3-e3f7-4864-ba66-4271fa7bf0b0) |


## 📱 동작 화면


### 🔍 검색

| 검색                                                                                                   | 검색어 추천                                                                                                           | 검색결과 (가로이미지)                                                                                 | 무한 스크롤    |
| ------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | --- |
| ![검색](https://github.com/qwerty3345/EasyCloset/assets/59835351/354cea6d-cfbc-486d-aabe-78ee346f4428) | ![검색어추천_최근검색](https://github.com/qwerty3345/EasyCloset/assets/59835351/7588599c-3c6c-4832-a5df-547f37e917b4) | ![검색_가로](https://github.com/qwerty3345/EasyCloset/assets/59835351/e8eb3b99-e7a6-42b5-9c9c-853518f17c8f) |  ![무한스크롤](https://github.com/qwerty3345/EasyCloset/assets/59835351/ecf3bf99-e7a9-4bbd-b941-abe32399b937)   |


### 👀 상세보기

| 상세보기 | 상세보기 - 더보기 | 공유기능 | 다크모드 지원 |
| -------- | -------- | -------- | -------- |
| ![상세보기](https://github.com/qwerty3345/EasyCloset/assets/59835351/d2158208-9e4c-4ad8-bde1-ade964dbd29e)     | ![상세보기_더보기](https://github.com/qwerty3345/EasyCloset/assets/59835351/4229d837-76cb-4fc4-86f6-a5a87d0ca2b4)     | ![공유기능](https://github.com/qwerty3345/EasyCloset/assets/59835351/272e62c9-748e-4caf-9813-4a1bfde7cf5c)     | ![Simulator Screen Recording - iPhone 14 Pro - 2023-08-27 at 21 48 40](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/8a5c1048-e80f-4f5f-9480-92c2ff72b998)  |

## 🔥 트러블슈팅, 주요 내용
- 자세한 내용은 각 PR 내용에 담겨 있으니 참고 부탁 드립니다 :)
- 각 제목을 클릭하면 해당 PR로 이동합니다

-------

### 👉 [[Feat] Image 를 다운받고 캐싱하는 서비스, 뷰 구현 (RemoteImage) #11](https://github.com/qwerty3345/ios-itunes-search/pull/11)

![image](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/4a97d4b8-6c93-4cff-b2f3-33dfd687695d)

-------

### 👉 [[Feat] 스크린샷 다양한 크기 대응, Carousel 형태 구현 #13](https://github.com/qwerty3345/ios-itunes-search/pull/13)

![image](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/d3e0ad64-8100-43b3-b673-0f41995ac724)

-------

### 👉 [[Refactor] MVI 아키텍쳐 적용 #17](https://github.com/qwerty3345/ios-itunes-search/pull/17)

![image](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/537802e1-245a-4bdb-88ff-a23a33c03179)

-------

### 👉 [[Refactor] 의존성 주입 DI Container 구현 #19](https://github.com/qwerty3345/ios-itunes-search/pull/19)

![image](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/b8da5642-c0fd-4908-8d10-8d73b5ffd8f9)

-------

### [✍️ 노션 개발일지](https://iosmason.notion.site/f43e0248888147aba66e2e535db7acd0?pvs=4)
- 매일 작업 과정을 정리 한 노션입니다.
    - 해당 내용을 바탕으로 **PR을 작성**하였습니다.

![image](https://github.com/qwerty3345/ios-itunes-search/assets/59835351/7ecf407a-4af6-46b1-9253-614b1521796a)
