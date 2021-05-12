<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식은 한글을 처리하기위해 별도로 설정해주어야 한다.
	//인코딩 형식을 지정할 땐 값을 꺼내기 전에 처리해야한다.
	request.setCharacterEncoding("UTF-8"); //setter 메서드다

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	아이디: <%=id %><br/>
	비밀번호: <%=pw %><br/>
	이름: <%=name %>
	
</body>
</html>