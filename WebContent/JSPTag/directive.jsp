<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = sdf.format(date);
	
	//문자열 저장하는 리스트
	List<String> list = new ArrayList<>();
	list.add("홍길동");
	list.add("이순신");
	list.add("홍길순");
	
	//키 = 숫자, 값= 문자열 저장하는 해쉬맵
	Map<Integer,String> map = new HashMap<>();
	map.put(1, "홍길동");
	map.put(2, "이순신");
	
	//숫자 저장하는 set
	Set<Integer> set = new HashSet<>();
	set.add(1);
	set.add(2);
	set.add(3);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	지금:<%=now %><br/>
	리스트:<%=list.toString() %><br/> <!-- for문으로 -->
	<% for(int i = 0; i < list.size() ; i++ ) { %>
		<%=i %>번째 리스트 : <%=list.get(i) %> <br/>
	<% } %>
	<hr/>

	맵:<%=map.toString() %><br/> <!-- EntrySet문으로 출력 -->
	<% for(Map.Entry<Integer, String> entry : map.entrySet()) { %>
		Key : <%=entry.getKey() %> , Value : <%=entry.getValue() %> <br/>
	<% } %>
	<hr/>
	
	셋:<%=set.toString() %><br/> <!-- 향상된 for문 -->

	<% for(int i : set) { %>
		<%= i %> 
	<% } %>
	
	
	
</body>
</html>