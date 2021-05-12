<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>스크립트릿, 가장 많이 쓰인다</h3>
	<%
		int a = 1;
		if(a >= 10) {
			out.println("10보다 큽니다");
		} else {
			out.println("10보다 작습니다");
		}
	%>
	<hr/>
	<%
		for(int i = 1; i <= 10; i++) {
			out.println(i + "<br/>"); //<br/>은 브라우저에서 태그로 인식
		}
	%>
	<hr/>
	<%
		int num = (int)(Math.random() * 20) + 1; //1~20
		if(num >= 10){
			out.println("<p>참입니다</p>");
		} else {
			out.println("<p>거짓입니다</p>");
		}
	%>
	
	<hr/>
	<!-- 스크립트릿은 이렇게 자바 구문만 한줄씩 쓰는게 가독성 측에서 더 좋다 -->
	<% if(num >= 10) { %>
			<p>참입니다</p>
	<%	} else { %>
			<p>거짓입니다</p>
	<% 	} %>
	
	<hr/>
	<h2>1. 구구단 3단을 out.println과 br태그를 이용해서 브라우저 화면에 출력</h2>
	<h3>구구단 3단</h3>
	<%
		for(int i = 1 ; i <= 9 ; i++ ) {
			out.println("3 * " + i + " = " + (3 * i) + "<br/>");
		}
	%>	
	
	<h3>스크립트릿을 한줄씩 써보기</h3>
	<% for(int i = 1 ; i <= 9 ; i++ ) {%>
			3 * <% out.println(i); %> = <% out.println(3 * i); %><br/>
	<% } %>
		
	<br/>
	
	<h2>2. 체크박스 10개를 브라우저에 생성</h2>
	<form>
	<% for(int i = 1 ; i <= 9 ; i++ ) { %>
		<input type="checkbox" name="chkbox">
	<% } %>
	</form>
	
</body>
</html>