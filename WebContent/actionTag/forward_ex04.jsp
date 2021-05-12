<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request에 담긴 값을 사용하는 방법
	String name = (String)request.getAttribute("name");
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>forward_ex04페이지</h2>
	forward로 넘어온 id값 : <%=id %> <br/>
	Servlet에서 request에 강제로 넣은 값:<%=name %>
</body>
</html>