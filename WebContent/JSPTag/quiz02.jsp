<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // <<<- 선언자가 아니라 스크립트릿이다 !!
	/*
	1. 정수를 저장하는 List선언
	2. 1~45까지 로또번호를 리스트에 추가
	3. 중복되지 않은 숫자 6개를 저장 (contains메서드)
	4. 화면에 출력
	5. Set을 이용해서도 확인
	*/
	
	Random ran = new Random();
	int num = 0;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로또 번호 추출기</title>
</head>
<body>
	<h2>List를 이용해 뽑아보는 오늘의 번호는?</h2>	
	<% 	
		List<Integer> list = new ArrayList<>();
		while(!(list.size() == 6)) {
			num = ran.nextInt(45) + 1; 
			if(!list.contains(num)) list.add(num);
		} 
	%>
	
	<h3>
		<% for(int i : list) { %>
			<%=i %>
		<% } %>
	</h3>
	
	<hr/>
	<h2>Set을 이용해 뽑아보는 오늘의 번호는?</h2>
	<% Set<Integer> set = new HashSet<>(); %>
	<%
		while(!(set.size() == 6)) {
			num = ran.nextInt(44) + 1;
			set.add(num);
		}
	%>
	
	<h3>
		<% for(int i : set) { %>
			<%=i %>
		<% } %>
	</h3>
</body>
</html>