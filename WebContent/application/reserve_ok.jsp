<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	if(session.getAttribute("authYN") == null) {
		response.sendRedirect("auth.jsp");
	}	
	
	//1. 예약페이지에서 넘어온 좌석 정보(String[] seat)를 받는다
	String[] seats = request.getParameterValues("seat");
	//2. 좌석 정보를 임시로 저장할 A 리스트 생성
	List<String> list = new ArrayList<>();
	List<String> list_temp = new ArrayList<>();

	//3. application에 B 리스트가 있다면, 꺼내와서  A에다가 덮어씌우기
	if(application.getAttribute("seatList") != null) { //app에 리스트가 있다면
		list = (List<String>)application.getAttribute("seatList");		
	} else { //app에 리스트가 없다면 
		application.setAttribute("seatList", list);
	}
	
	//4. list와 seats를 비교해서 중복된 좌석이 아니라면 사본리스트를 생성하고, 하나씩 추가
	for(String s : seats) {
		if(!list.contains(s)) list_temp.add(s);
	}

	//5. list_temp와 seats의 길이가 같다면 중복이 없다는 뜻이므로 사본리스트를 A리스트에 전체 추가하고 app에 저장
	
	if(list_temp.size() == seats.length) {
		list.addAll(list_temp);
		application.setAttribute("seatList", list);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align = "center">
		<h3>예약 선택한 좌석</h3>
		<% for(String s : seats) { %>
			[<%=s %>]
		<% } %>
		<b>신청결과:</b>
		<%=list_temp.size() == seats.length ? "<b>성공</b>" : "<b>실패/<b>" %>
		<br/>
		<a href="reserve.jsp">처음으로</a>
	</div>
</body>
</html>