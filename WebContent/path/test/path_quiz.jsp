<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- a태그를 이용해서 req_video페이지로 상대경로, 절대경로 -->
	<a href="../../request/req_video.jsp">req_video페이지로 이동(상대경로)</a>
	<a href="/JSP_Basic/request/req_video.jsp">req_vido페이지로 이동(절대경로)</a>
	<hr/>
	<!-- a태그를 이용해서 TestServlet의 URL매핑경로를 확인해서 상대경로, 절대경로로 이동 -->
	<a href="../../kkk">TestServlet 이동(상대경로)</a>
	<a href="/JSP_Basic/kkk">TestServlet 이동(절대경로)</a>
	<hr/>
	<!-- img태그로 java.png파일을 상대경로, 절대경로로 참조 -->
	<img alt="상대경로" src="../../request/img/java.png" width="200">
	<img alt="절대경로" src="/JSP_Basic/request/img/java.png" width="200">
</body>
</html>