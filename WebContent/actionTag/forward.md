# JSP Action Tag - forward
## 1. Action Tag 란?
JSP페이지 내에서 어떤 동작을 하도록 지시하는 태그


###Action Tag 사용 방법
```jsp
<jsp: ... > </jsp: ... >
```


추가적으로 종속되는 태그가 없다면 끝부분을 ```/>```로 마감처리 할 수 있다
```jsp
<jsp: ... />
```


## 2. forward와 sendRedirect의 차이
```send_vs_forward``` 폴더 참고

### forward
요청받은 request 객체를 위임하는 컴포넌트에 동일하게 전달 가능

나는 다음 페이지에 가져가야할 값이 있다!

send_vs_forward/forward_ex01.jsp
```jsp
<body>
	<form action="forward_ex02.jsp" method="post">
		아이디 : <input type="text" name="id"><br/>
		비밀번호 : <input type="password" name="pw"><br/>
		<input type="submit" value="확인">
	</form>
</body>
```


send_vs_forward/forward_ex02.jsp
```jsp
<jsp:forward page="forward_ex03.jsp" />
```


send_vs_forward/forward_ex03.jsp
```jsp
<%	String id = request.getParameter("id");
	String pw = request.getParameter("pw"); %>

...

<body>
	id: <%=id %><br/>
	pw: <%=pw %>
</body>
```


결과 화면
```
id: abc
pw: 1234
```


### sendRedirect
요청받은 request 객체를 위임하는 컴포넌트에 전달하는 것이 아닌, 새로운 요청 객체를 생성

나는 다음 페이지에 가져갈 값이 없다!


send_vs_forward/send_ex01.jsp
```jsp
<body>
	<form action="send_ex02.jsp" method="post">
		아이디 : <input type="text" name="id"><br/>
		비밀번호 : <input type="password" name="pw"><br/>
		<input type="submit" value="확인">
	</form>
</body>
```


send_vs_forward/send_ex02.jsp
```jsp
<%	response.sendRedirect("send_ex03.jsp"); %>
```


send_vs_forward/send_ex03.jsp
```jsp
<%	String id = request.getParameter("id");
	String pw = request.getParameter("pw"); %>

...

<body>
	id: <%=id %><br/>
	pw: <%=pw %>
</body>
```


결과 화면
```
id: null
pw: null
```


## 3. Servlet을 이용한 forward
### (1) 값을 넘겨 주는 페이지
actionTag/forward_ex03.jsp
```jsp
<body>
	<h3>자바코드로 포워드를 사용하는 방법</h3>
	<form action="../Forward" method="post">
		ID: <input type="text" name="id">
		<input type="submit" value="확인">
	</form>
</body>
```


### (2) forward 페이지
Servlet : forward.exmaple.Forward
```request```객체의 ```getRequestDispatcher()```메서드를 사용하여 객체를 얻어온다.
```RequestDispatcher```는 위임하기 객체.
```getRequestDispatcher()```의 매개변수는 forward 대상 페이지 경로이다.

```java
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dp = request.getRequestDispatcher("actionTag/forward_ex04.jsp");
		dp.forward(request, response);
	}
```


위임할 페이지에서 사용할 값을 강제로 request 객체에 담으려면 ```setAttribute()``` 메서드를 사용한다.
```java
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("name", "홍길동");
		
		RequestDispatcher dp = request.getRequestDispatcher("actionTag/forward_ex04.jsp");
		dp.forward(request, response);
	}
```


### (3) requset 객체를 위임 받은 페이지
actionTag/forward_ex04.jsp

```setAttribute()``` 로 저장한 데이터는 ```getAttribute()``` 로 받는다.
```jsp
<%	String name = (String)request.getAttribute("name");
	String id = request.getParameter("id"); %>
...
<body>
	<h2>forward_ex04페이지</h2>
	forward로 넘어온 id값 : <%=id %> <br/>
	Servlet에서 request에 강제로 넣은 값:<%=name %>
</body>
...
```


### (4) 결과 화면
actionTag/forward_ex04.jsp
```
forward_ex04페이지
forward로 넘어온 id값 : abc
Servlet에서 request에 강제로 넣은 값:홍길동 
```
