<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 스크립트릿, 선언자, 표현자를 적절히 이용해서 작성 -->
<%! int count = 0; 
	Random ran = new Random();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% count++; %>
	<%=count %>번째 방문자입니다<br/>
	<% if(count % 10 == 0) %> 당첨되셨습니다!
	<hr/>
	<% int dan = ran.nextInt(8)+2; %>
	<h3>랜덤구구단 <%=dan %>단</h3>
	이번에 나온 구구단 <%=dan %>단 입니다<br/>

	<%for(int i = 1 ; i <= 9 ; i++) { %>
		<%=dan %> x <%=i %> = <%=dan * i %> <br/>
	<% } %>
</body>
</html>