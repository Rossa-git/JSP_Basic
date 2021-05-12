<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	선언자, 스크립트릿을 적절하게 사용한다 
	어피치, 라이언, 제이지, 무지, 프로도를 가지고 있는 배열 생성
	랜덤하게 선택된 카카오프랜즈를 list에 추가하는 형식으로 작성
--%>
<%!
	Random ran = new Random();
	String[] jobs = {"어피치", "라이언", "제이지", "무지", "프로도", "네오", "튜브"};
	List<String> list = new ArrayList<>();
	
	Map<String, Integer> map = new HashMap<>();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모아봐요 프렌즈!</title>
</head>
<body>
	<% int sel = ran.nextInt(jobs.length); %>
	<% 
		list.add(jobs[sel]);
		map.put(jobs[sel], map.getOrDefault(jobs[sel], 0) + 1);
	%>
	<b><%=jobs[sel] %></b>님이 입장<br/>
	현재 같은 카카오 프렌즈는 <%=map.get(jobs[sel]) %>명입니다.<br/>
	
	<h1>현재 구성 정보</h1>
	<%=list.toString() %> (<%=list.size()%>명 참가중 )
	
	
	<% 
		//리스트 초기화
		if(list.size() == 10) {
			list.clear();
			map.clear();
		}
	%>
</body>
</html>