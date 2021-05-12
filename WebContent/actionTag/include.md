# JSP Action Tag - include
## 1. include
현재 페이지에 다른 페이지를 삽입할 때 사용한다.

## 2. 사용법
액션 태그
include_ex01.jsp
```jsp
<h2>여기는 1번 페이지</h2>
<jsp:include page="include_ex02.jsp" />
```


지시자
include_ex01.jsp
```jsp
<h2>여기는 1번 페이지</h2>
<%@ include file="include_ex02.jsp" %>
```


include_ex02.jsp
```<p>여기는 2번 페이지</p>```

결과화면
```
여기는 1번 페이지
여기는 2번 페이지
```


## 3. 액션태그와 지시자의 차이
액션태그로 include를 사용한다면 jsp에서 전역으로 선언했던 변수는 참조할 수 없다.

include_ex02.jsp
```jsp
<%!	int total = 0; %>
```


include_ex01.jsp
```jsp
	<jsp:include page="include_ex02.jsp" />
	
	<%=total %>
```

위의 코드는 오류가 발생한다.