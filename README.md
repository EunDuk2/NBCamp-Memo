## 🏁 프로젝트 소개


메모 앱은 사용자가 메모를 추가, 삭제하고 저장할 수 있는 간단한 리스트 앱입니다. UITableView와 UserDefaults를 활용하여 데이터 관리와 리스트 UI 구현을 연습할 수 있는 프로젝트입니다.

## **📚 학습 목표**


[data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==](data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==)

1. **UITableView 사용**: 데이터 리스트를 화면에 표시하고, 동적으로 업데이트하는 방법 익히기.
2. **UserDefaults 활용**: 데이터를 저장하고 앱 재실행 시 복원하기.
3. **Auto Layout**: 화면 크기에 따라 UI를 적절히 배치하기.
4. **사용자 입력 처리**: UITextField와 UIAlertController를 활용하여 사용자 입력값 받기.

## **🛠️ 구현할 기능**


1. **메모 추가**:
    - "+" 버튼을 눌러 새로운 메모를 추가.
    - 추가된 메모는 리스트에 표시.
2. **메모 삭제**:
    - 리스트에서 특정 메모를 스와이프하여 삭제.
3. **데이터 저장**:
    - 앱 종료 후에도 메모 리스트가 유지되도록 UserDefaults를 활용해 데이터 저장 및 불러오기.
    - "+" 버튼을 클릭하면 숫자가 1씩 증가.
    - "-" 버튼을 클릭하면 숫자가 1씩 감소.

## **🎨 요구 사항**


### **UI 구성**

1. **UITableView**:
    - 메모 리스트를 표시하는 UITableView를 화면에 추가.
    - 각 셀에 메모 내용을 표시.
2. **UIButton (Navigation Bar)**:
    - 오른쪽 상단에 "+" 버튼을 추가하여 새로운 메모를 입력받기.
3. **UIAlertController**:
    - "+" 버튼을 눌렀을 때 나타나는 텍스트 입력 팝업(Alert).
    - 화면 중앙에 현재 숫자를 표시합니다.
    - 초기 값은 "0"으로 설정합니다.

## ✅ 기타 추가 구현


1. **리팩토링:** MVC 패턴 적용하여 리팩토링 수행, 코드 리뷰 및 피드백 적용
2. **리팩토링**: 따로 분리할 수 있는 기능들 모듈로 분리하여 코드 개선

## 📱 구현 화면

<img src = "https://github.com/user-attachments/assets/08d459e2-a535-41df-819a-c335fe9e6e0f" width=600 height=1300>
<img src = "https://github.com/user-attachments/assets/806431f1-bcf2-4fec-b6f6-91c47d90a885" width=600 height=1300>
<img src = "https://github.com/user-attachments/assets/b0f45b71-23c6-4a63-a84f-417bf2580b1f" width=600 height=1300>

