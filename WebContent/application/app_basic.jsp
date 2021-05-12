<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	application객체는 session과 동일
	생명주기는 톰캣을 stop할때까지 단 1개 유지
	
	application 객체에는 프로그램 전체에서 공유할 값(초기값)을 지정해서 사용한다
	*/
	
	int total = 0;

	if(application.getAttribute("total") != null) {
		total = (int)application.getAttribute("total");
	}

	total++;
	
	application.setAttribute("total", total);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	어플리케이션 객체에 누적된 total값: <%=total %>
</body>
</html>