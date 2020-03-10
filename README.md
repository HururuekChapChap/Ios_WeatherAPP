# Ios_WeatherAPP
 날씨 앱 만들기

# ScrollView

 먼가 괜찮은 앱 프론트를 개발 하기 위해서는 스크롤 뷰를 알아야한다고 생각했다. Table View 처럼 먼가 스크롤 해서 보여 줄 수 있는 기술이 필요하다고 느꼈다.
 
 Xcode11 버젼으로 된 좋은 블로그가 없어서 (https://fluffy.es/scrollview-storyboard-xcode-11/) 여기서 힘들게 참조하였다. 다음은 Horizontal Scroll View를 해봐야겠다. (https://baked-corn.tistory.com/35)
 
 참고로 Multiplier에 대해 존재를 알았다.. 두개의 뷰로 나눠준다 라는 것 밖에 아직 잘은 모른다. (https://g-y-e-o-m.tistory.com/76)

<img width="935" alt="스크린샷 2020-03-08 오후 10 08 40" src="https://user-images.githubusercontent.com/57618897/76164239-a767bd00-6190-11ea-91bf-7a8497724235.png">
<img width="875" alt="스크린샷 2020-03-08 오후 10 11 44" src="https://user-images.githubusercontent.com/57618897/76164243-ab93da80-6190-11ea-9759-50646a425741.png">
<img width="1140" alt="스크린샷 2020-03-08 오후 10 20 33" src="https://user-images.githubusercontent.com/57618897/76164244-ac2c7100-6190-11ea-847f-d28c8928ddd8.png">
<img width="1140" alt="스크린샷 2020-03-08 오후 10 30 06" src="https://user-images.githubusercontent.com/57618897/76164248-b2225200-6190-11ea-9271-a3ed1e0ec0a4.png">

***여기서 가로로 스크롤 뷰를 하기 위해서는 Frame과 View의 높이를 동일하게 하고 너비를 제한조건으로 정해주면 된다.

<img width="1140" alt="스크린샷 2020-03-08 오후 10 41 00" src="https://user-images.githubusercontent.com/57618897/76164250-b3537f00-6190-11ea-8c81-81e950290eb0.png">

실행 결과 : 

<img width="246" alt="스크린샷 2020-03-08 오후 10 47 06" src="https://user-images.githubusercontent.com/57618897/76164253-b8183300-6190-11ea-9d25-2671914f2ada.png"><img width="246" alt="스크린샷 2020-03-08 오후 10 47 17" src="https://user-images.githubusercontent.com/57618897/76164255-b8b0c980-6190-11ea-82b4-53f07c98b789.png">


# 간단한 날씨 앱

내용 :

현재 있는 지역의 날씨와 내일 그리고 모래 까지의 날씨를 알려준다.

KxCoding님의 날씨앱 (https://www.youtube.com/playlist?list=PLziSvys01Oeklz7JjShkmPIXh4jU4j8b4)을 참고하여 개발하였다.

다만 강의의 내용은 거의 미완결 프로젝트라서 혼자 마지막 까지 개발해야하는 좋은 경험이였다.

실행 결과 : 

<img width="279" alt="스크린샷 2020-03-10 오후 10 10 41" src="https://user-images.githubusercontent.com/57618897/76315538-36eda700-631c-11ea-9eb0-707860d30889.png">  <img width="246" alt="결과3" src="https://user-images.githubusercontent.com/57618897/76315543-38b76a80-631c-11ea-8b38-b942404ee33d.png">

<img width="279" alt="결과1" src="https://user-images.githubusercontent.com/57618897/76315525-32c18980-631c-11ea-8d36-938d370a00aa.png"> <img width="279" alt="결과2" src="https://user-images.githubusercontent.com/57618897/76315542-381ed400-631c-11ea-86c3-fb915a254dfd.png">


새롭게 알게 된 내용 : 

Hugging Priority와 Compression Resistance priority (https://eunjin3786.tistory.com/43) 

테이블 뷰에서 section에 대해서 (https://zeddios.tistory.com/54)

현재의 위도와 경도를 가져오는 방법 (https://sanghuiiiiii.tistory.com/entry/SWIFT-현재-위치-주소-가져오기-미세먼지앱-1-Day)

optional로 받아지는 위도와 경도를 문자열로 받는 방법 (https://stackoverflow.com/questions/26142441/cllocationdegrees-to-string-variable-in-swift)


코드 : 

현재의 위치를 받아오는 함수

<img width="463" alt="스크린샷 2020-03-10 오후 10 30 34" src="https://user-images.githubusercontent.com/57618897/76318735-808cc080-6321-11ea-9dd2-e2992310f034.png">

현재의 날씨를 받아오는 함수

<img width="1410" alt="스크린샷 2020-03-10 오후 10 42 32" src="https://user-images.githubusercontent.com/57618897/76318740-8387b100-6321-11ea-9366-42c3456b3dd2.png">

내일고 모래의 정보를 받아오느 함수

<img width="1108" alt="스크린샷 2020-03-10 오후 10 43 28" src="https://user-images.githubusercontent.com/57618897/76318746-84b8de00-6321-11ea-8390-75c3001c54e0.png">

# 테이블 뷰

 다른 클래스에 있는 뷰의 대하 정보를 cell에서 받아와서 바로 정보를 넣어줄 수 있다!!!

<img width="1410" alt="스크린샷 2020-03-10 오후 10 46 41" src="https://user-images.githubusercontent.com/57618897/76318748-85517480-6321-11ea-91e3-8d49feae4df1.png">












