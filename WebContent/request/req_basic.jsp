<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request 객체가 내장되어있다.
	
	//request 객체는 브라우저에 대한 정보, 사용자가 전달하는 값 등 많은 정보를 저장하는 객체
	StringBuffer url = request.getRequestURL(); //URL

	String uri = request.getRequestURI(); //URI
	
	String path = request.getContextPath(); //서버가 프로젝트를 구분하는 경로
	
	String meth = request.getMethod(); //요청방식
	
	String addr = request.getRemoteAddr(); //요청 주소
	
	System.out.println(addr); // Console에 app에 접속한 주소가 뜬다
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	URL 주소: <%=url %> <br/> <!-- Uniform resource Locator, 위치 -->
	URI 주소: <%=uri %> <br/> <!-- Uniform Resource Identifier, 식별자 -->
	루트경로: <%=path %> <br/>
	요청방식: <%=meth %> <br/>
	요청아이피: <%=addr %> <br/> 
	
</body>
</html>