<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	1. form태그를 이용해서 post형식으로 이름, 국어, 수학, 영어 점수를 받습니다
	2. quiz02페이지로 전송해서 평균을 구하고, 평균이 60이상이라면 합격페이지로 이동, 미만이라면 불합격페이지로 이동
	3. 전달되는 값이 없는 값이라면 다시 입력받도록 처리 (null이라면)
	--%>
	
	<form action="quiz01_result.jsp">
		<!-- required 속성은 값이 비어있으면 전송되지 않는다-->
		이름: <input type="text" name="name" required><br/>
		국어: <input type="text" name="kor" required><br/>
		영어: <input type="text" name="eng" required><br/>
		수학: <input type="text" name="math" required><br/>
		
		<input type="submit" value="점수확인">
	</form>
</body>
</html>