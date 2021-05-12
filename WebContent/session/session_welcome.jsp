<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션이 없다면 접근이 불가능해야 한다.
	String id = "";
	String nick = "";
	
	if(session.getAttribute("user_id") == null) {
		response.sendRedirect("session_login.jsp");
	} else {
		id = (String)session.getAttribute("user_id");
		nick = (String)session.getAttribute("user_nick");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=id %>(<%=nick %>)님 환영합니다!</h3>
	<a href = "session_logout.jsp">로그아웃</a>
	<%=session.getId() %>
</body>
</html>