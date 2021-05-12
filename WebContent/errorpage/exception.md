# JSP - 예외처리
예외가 발생했을 경우 웹 컨테이너에서 제공되는 기본 예외 페이지가 보여진다.
개발 과정에서는 오류를 수정하는데에 도움이 되지만, 코드의 일부가 노출이 되어 보안 측면에서 좋지 않다.

개발자가 따로 만들어 둔 **에러페이지로 유도**하여 **사용자에게 친숙한 페이지**를 보여줄 수 있도록 한다


## 2. HTTP 주요 응답 상태 코드
* *404* : 요청한 URL을 찾을 수 없는 경우
* *500* : 서버 측 내부 오류로 인해 페이지가 나타나지 않는 경우

* 200 : 요청을 성공적으로 처리
* 307 : 임시로 페이지를 리다이렉트
* 400 : 클라이언트의 요청이 잘못된 구문으로 작성
* 405 : 요청 방식(GET, POST 등)이 허용되지 않음
* 503 : 서버가 일시적으로 서비스를 제공할 수 없음


## 3. JSP에서 예외를 처리하는 3가지
### (1) 직접 예외 처리하기
자바 코드를 이용해 직접 ```try ~ catch``` 로 감싸주어 처리하는 방식.
가독성이 좋지 않아 선호되지 않는다.

### (2) 에러를 처리할 페이지 별도로 지정
에러가 발생할 때, 보여줄 페이지는 페이지 지시자(directive)의 ```errorPage``` 속성을 사용하여 지정.

error_page.jsp
```jsp
<%@ page errorPage="error_view.jsp" %>
```

에러 발생 시 유도된 페이지에는 페이지 지시자 태그로 ```isErrorPage```속성을 사용하여 true 값을 설정한다.

error_view.jsp
```jsp
<%@ page isErrorPage="true" %>
```

### (3) 응답 상태 코드별로 에러 페이지 지정
JSP는 에러 코드별로 사용할 에러 페이지를 web.xml파일에서 지정할 수 있다.

코드 뿐 아니라 에러 타입별로도 지정할 수 있다.

web.xml
```xml
<error-page>
	<error-code>404</error-code>
	<location>/errorpage/error_view.jsp</location>
</error-page>
<error-page>
	<exception-type>java.lang.NullPoniterException</excetpion-type>
	<location>/errorpage/error_view.jsp</location>
</error-page>
```


## 4. 에러 페이지의 우선순위
에러 페이지를 여러 방법으로 지정한 경우, 다음의 우선순위에 따라 에러 페이지 실행

1. 페이지 지시자 태그의 ```errorPage```속성에 지정한 페이지
2. web.xml에 지정한 에러 **타입**에 따른 페이지
3. web.xml에 지정한 **응답 상태 코드**에 따른 페이지
4. 웹 컨테이너가 제공하는 기본 에러 페이지