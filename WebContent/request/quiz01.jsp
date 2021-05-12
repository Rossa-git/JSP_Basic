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
	 1.form태그를 이용해서 post형식 이름, 키, 몸무게 3가지를 입력받는다
	 2.quiz01_result.jsp로 데이터를 전송한다
	 3.해당페이지에서는 넘어간 값을 BMI지수를 처리합니다
	 BMI = kg / (cm/100 * cm*100), 출력값은 double형이고 받는 값은 문자열이기 때문에 형변환 진행
	 
	 결과
	 화면에 키, 몸무게, BMI지수를 출력
	 조건문을 이용해서 BMI 25이상 과체중, 18이하 저체중, 나머지 정상으로 출력
	 -->
	 
	 <form action="quiz01_result.jsp" method="post">
	 	이름 : <input type=text name="name"><br/>
	 	키 : <input type="text" name="cm"><br/>
	 	몸무게 :<input type="text" name="kg"><br/>
	 	
	 	<input type="submit" value="결과보기">
	 </form>
</body>
</html>