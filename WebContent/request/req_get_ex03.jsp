<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--
	get방식은 post방식과 달리 반드시 form태그가 필요하진 않다
	주소를 통해서 강제로 parameter값을 전달할 수 있다.
	
	주소?변수명=값&변수명=값		(? : QueryString)
	형태로 넘겨줄 수 있다.
	-->
	
	<a href = "req_get_ex04.jsp?name=홍길동&number=1">req_get_ex04로 이동</a>
</body>
</html>