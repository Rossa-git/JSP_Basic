<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>여기는 1번 페이지</h2>

	<%@ include file="include_ex02.jsp" %>

	<jsp:include page="include_ex02.jsp" />
	
	<%=total %> <%-- 이 변수는 액션태그로는 참조할 수 없다 --%>
	
</body>
</html>