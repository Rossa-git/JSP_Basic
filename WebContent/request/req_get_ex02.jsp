<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//톰캣 8버전 이후로 get방식은 UTF-8로 request가 온다.
	//8버전 이전은 server.xml 에서 <connector> 의 속성을 변경한다. URIEncoding="UTF-8"
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");

	//체크박스는 getParameterValues(), 값이 여러개이기때문
	String[] inter = request.getParameterValues("inter");
	
	String major = request.getParameter("major");
	String region = request.getParameter("region");
	
	String comment = request.getParameter("comment");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 주소창에 전달된 값이 보인다. get방식 -->
	전송된 아이디:<%=id %> <br/>
	전송된 비밀번호:<%=pw %> <br/>
	이메일:<%=email %> <br/>
	관심분야:<%=Arrays.toString(inter) %> <br/>
	전공:<%=major %> <br/>
	지역:<%=region %> <br/>
	자기소개:<%=comment %> <br/>
</body>
</html>