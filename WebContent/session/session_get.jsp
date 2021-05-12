<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션에 저장된 값은 브라우저가 종료되기 전 까지 or 기본 30분간 유지
	//어느페이지에서든 사용 가능
	
	//getAttribute("이름"); 리턴 타입은 Object다
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
	
	//세션의 시간확인
	int time = session.getMaxInactiveInterval();
	
	//특정 세션 삭제
	session.removeAttribute("user_name"); //user_name 삭제
	
	//모든 세션 삭제
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	세션에 저장된 ID: <%=id %> <br/>
	세션에 저장된 NAME: <%=name %> <br/>
	세션유지시간: <%=time %><br/>
</body>
</html>