# 세션(Session)
## 1. 개념
쿠키와 마찬가지로 **서버와의 관계를 유지하기 위한 수단**이다.
쿠키와 다르게 클라이언트의 특정 위치에 저장되는 것이 아니라, **서버 상에 객체**로 존재한다.
서버당 하나의 세션 객체를 가지고 있다. (브라우저 별 서로 다른 세션 사용)
세션 객체는 **브라우저 창을 종료하면 삭제**된다.

서버에서만 접근이 가능한 점 때문에, 쿠키에 비해 **보안이 좋고** 저장할 수 있는 데이터에 한계가 없다.

JSP에서 session이라는 **내장 객체** 지원

## 2. 세션 객체 관련 메서드
- **setAttribute()** : 세션에 데이터 저장
- **getAttribute()** : 저장된 데이터 리턴
- getAttributeNames() : 저장된 모든 데이터의 세션 이름 리턴
- getId() : 자동 생성된 세션의 아이디 리턴
- getCreationTime() : 세션 생성된 시간 리턴
- getLastAccessedTime() : 브라우저가 마지막으로 세션에 접근한 시간 리턴
- setMaxInactiveInterval() : 세션의 유효시간 설정, 초단위
- getMaxInactiveInterval() : 세션의 유효시간 리턴, 가장 최근 요청시점 기준으로 카운트
- **removeAttribute()** : 특정 세션 삭제
- **invalidate()** : 모든 세션삭제

## 3. 세션 생존 주기
tomcat 서버의 ```web.xml```에서 생존 기본 30분을 확인할 수 있다.
```xml
...
    <session-config>
        <session-timeout>30</session-timeout>
    </session-config>
...
```
```setMaxInactiveInterval()``` 메서드로 임의지정 가능하다.

## 4. 세션 생성 실습
실행 페이지 : session_set.jsp
결과 페이지 : session_get.jsp


### (1) 세션에 데이터 저장
세션에 저장된 값은 브라우저가 종료되기 전까지 기본 30분간 유지된다.

session_set.jsp
```jsp
<%
	//setAttribute("이름", 값);
	session.setAttribute("user_id", "aaa123");
	session.setAttribute("user_name", "홍길자");
%>
```
```jsp
<body>
	<a href="session_get.jsp">세션값 확인하기</a>
</body>
```


### (2) 세션에 저장된 데이터 확인
```getAttribute()``` 메서드의 리턴 타입은 ```Object```이므로 반드시 캐스팅해주어야 한다.

session_get.jsp
```jsp
<%
	//getAttribute("이름");
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
%>
```
```jsp
<body>
	세션에 저장된 ID: <%=id %> <br/>
	세션에 저장된 NAME: <%=name %> <br/>
</body>
```


### (3) 세션 유지 시간
#### 1) 세션 유지 시간 설정
session_set.jsp
```jsp
<%	session.setMaxInactiveInterval(3600); //1시간 %>
```

#### 2) 세션 유지 시간 확인
session_get.jsp
```jsp
<%	int time = session.getMaxInactiveInterval(); %>
```
```
<body>
	세션유지시간: <%=time %><br/>
</body>
```


### (4) 특정 세션 삭제
session_get.jsp
```jsp
<%	session.removeAttribute("user_name"); //user_name 삭제 %>
```

결과 화면 : session_get.jsp
```
세션에 저장된 ID: aaa123
세션에 저장된 NAME: null
세션유지시간: 3600
```


### (5) 모든 세션 삭제
session_get.jsp
```jsp
<%	session.invalidate(); %>
```

결과 화면 : session_get.jsp
```
세션에 저장된 ID: null
세션에 저장된 NAME: null
세션유지시간: 1800
```

## 쿠키와 세션
쿠키 대신 세션을 사용하는 가장 큰 이유는 **세션이 쿠키보다 보안에서 앞서기 때문**이다.
그럼에도 포털 사이트에서 쿠키를 이용한 로그인 방식을 선호하는 이유는, 세션은 **여러 서버에서 공유할 수 없는 단점**이 있기 때문이다. 쿠키는 도메인을 이용해 쿠키를 여러 도메인에서 **공유할 수 있기 때문**에 포털 사이트들은 쿠키를 이용한 로그인 방식을 선호한다.

예를 들어 www.naver.com 과 mail.naver.com, blog.naver.com은 서버가 각각 다르다. 심지어 네이버는 로그인 서버가 따로 있다. 만약 로그인 방식으로 세션을 사용한다면 같은 포털 사이트 내 다른 서비스를 사용할 때마다 로그인을 해야할 것이다.

## 서버는 어떻게 세션을 구별하는가?
서버에 접근하는 클라이언트가 하나는 아닐 것이다. 여러개의 세션은 서블릿 쓰레드에 의해 동작된다. 생성된 세션은 ID로 세션를 식별하고, 이 세션 ID를 쿠키로 클라이언트에 전달한다.
세션 안에 있는 데이터는 서버가 가지고 있고, 그 세션을 식별하는 ID는 클라이언트가 갖고 있는 것이다.
