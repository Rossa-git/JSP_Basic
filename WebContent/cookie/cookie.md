# 쿠키(Cookie)
## 1. 개념
HTTP 프로토콜은 응답 후에 웹브라우저와의 **관계를 종료**한다.
즉, 우리는 응답받고 멈추어있는 화면을 보고 있는 것과 같다. 서버와 연결이 계속 유지되어있는 것이 아니다.

연결이 끊겼을 때, 어떤 정보를 지속적으로 유지하기 위한 수단으로 쿠키라는 방식을 사용.
쿠키는 서버에서 생성하고, **클라이언트** 측에 정보를 **저장**

개당 4KB로 용량이 제한적이며, 쿠키는 300개(1.2MB)까지 정보를 가질 수 있다.

쿠키 문법
```
1. Cookie Class에서 쿠키 생성
2. setter 메서드로  쿠키의 속성 설정
3. response 객체에 쿠키 탑재
4. local에 저장 
```


## 2. 쿠키 객체 관련 메서드
- **setMaxAge()** : 쿠키의 유효시간 설정
- setPath() : 유효 디렉터리 설정
- setValue() : 값 설정
- setVersion() : 버전 설정
- getMaxAge() : 유효기간 정보 리턴
- **getName()** : 이름 리턴
- getPath() : 유효 디렉터리 리턴
- **getValue()** : 값 리턴
- getVersion() : 버전 리턴


## 3. 쿠키 생성 실습
실행페이지 : cookie_set.jsp
결과페이지 : cookie_get.jsp

### (1) 쿠키 생성
```javax.servlet.http.Cookie```에서 쿠키 객체를 지원한다.
```java
<%
	Cookie idCoo = new Cookie("user_id", "kkk123");
	Cookie nameCoo = new Cookie("user_name", "홍길동");
%>
```

### (2) 쿠키 속성(시간) 설정
쿠키 만료시간을 초 단위로 지정한다.
```jsp
<%
	idCoo.setMaxAge(10); //10초
	nameCoo.setMaxAge(1800); //30분
%>
```


### (3) response 객체에 쿠키를 저장
```jsp
<%
	response.addCookie(idCoo);
	response.addCookie(nameCoo);
%>
```

### (4) 쿠키 확인하기
cookie_set.jsp
```jsp
<body>
	<a href="cookie_get.jsp">쿠키 확인해보기</a>
</body>
```

쿠키는 브라우저에서 ```request``` 객채에 담겨 자동으로 넘어온다
cookie_get.jsp
```jsp
<%	Cookie[] cookies = request.getCookies(); %>
```

쿠키가 ```null```이 아닐 때, 반복문으로 하나씩 꺼낸다
```jsp
<%
	if(cookies != null) {
		for(Cookie c : cookies) {
			out.println(c.getName() + "<br/>");
			out.println(c.getValue() + "<br/>");
		}
	}
%>
```

### (5) 결과
실행페이지에서 10초가 지난 뒤 결과를 보면, 만료시간을 10초로 설정한 ```idCoo```는 소멸된 상태이다.
```
user_name
홍길동
JSESSIONID
...
```

---

## 3. 특정 쿠키 확인하기
실행페이지 : cookie_get.jsp (cookie_set.jsp에서 쿠키를 받은 페이지)
결과페이지 : cookie_get01.jsp
### (1) 쿠키 가져오기
```jsp
<% 	
	Cookie[] cookies = request.getCookies();
	String id = ""; // 쿠키 값을 저장할 변수
%>
```

### (2) 쿠키를 특정하기 위한 조건문
```jsp
<%
	if(cookies != null) {
		for(Cookie c : cookies) {
			//찾을 쿠키를 이름으로 확인(user_name)
			if(c.getName().equals("user_name")) {
				id = c.getValue();
			}
		}
	}
%>
```

### (3) 쿠키 확인하기
```jsp
<body>
	user_id 쿠키 값 : <%=id %>
</body>
```

### (4) 결과
```
user_id 쿠키 값 : 홍길동
```