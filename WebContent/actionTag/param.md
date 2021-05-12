# JSP Action Tag - param
## 1. param
```forward``` 및 ```include``` 태그에 데이터를 전달할 목적으로 사용되는 태그

## 2. 사용법
param_ex01.jsp
```jsp
	<form action="param_ex02.jsp" method="post">
		아이디:<input type="text" name="id"><br/>
		<input type="submit" value="확인">
	</form>
```


param_ex02.jsp
```jsp
<% request.setCharacterEncoding("utf-8"); %>
<jsp:forward page="param_ex03.jsp">
	<jsp:param value="똑똑이" name="nick"/>
	<jsp:param value="20" name="age"/>
</jsp:forward>
```
인코딩 형식은 ```request```에 넣거나 꺼내기 전에 한다.


param_ex03.jsp
```jsp
<%	String id = request.getParameter("id");
	String nick = request.getParameter("nick");
	String age = request.getParameter("age"); %>
```
```jsp:param```으로 전달된 값은 ```getParameter```로 받는다.