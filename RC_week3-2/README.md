# 테이블 뷰 셀 재사용 오류해결
✔️ 기간 | 22.10.01 ~ 22.10.07  
✔️ 설명 | 테이블 뷰 셀에서 UI의 속성이 유지되지 않는 버그 해결하기

### 💻 해결 방법
> 1) prepareForReuse()를 사용하여 셀을 초기화해주고, MVC 패턴을 이용해 변경된 값을 저장해준다.
> 2) delegate를 이용해서 switch 값이 변화하는 것을 ViewController에게 전달하고, MVC 패턴을 이용해 변경된 값을 저장해준다. 


### 📱 시연 영상
> https://drive.google.com/file/d/1Pt4vPHjjgXKhs8ZqY7-BAUM9EcrlOTsp/view?usp=sharing

### 🔗 블로그(상세 설명)
> https://dneod.tistory.com/35  
> https://dneod.tistory.com/36
