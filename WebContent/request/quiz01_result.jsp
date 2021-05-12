<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	double cm = Double.parseDouble(request.getParameter("cm"));
	double kg = Double.parseDouble(request.getParameter("kg"));
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% double bmi = kg / ((cm/100) * (cm/100)); %>
	<h2>
		<%=name %>님의 BMI 지수 : <%=bmi %><br/>		
	</h2>
	
	<% if(bmi >= 25) { %> 
		과체중입니다
	<% } else if(bmi <= 18) { %>
		저체중입니다
	<% } else { %> 
		정상입니다.
	<% } %>
</body>
</html>