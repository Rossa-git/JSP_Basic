<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="user" class="bean.example.User" scope="request"/>
	아이디:<jsp:getProperty property="id" name="user"/><br/>
	이메일:<jsp:getProperty property="email" name="user"/><br/>
</body>
</html>