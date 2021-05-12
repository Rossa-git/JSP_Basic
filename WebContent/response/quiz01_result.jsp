<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String kor = request.getParameter("kor");
	String math = request.getParameter("math");
	String eng = request.getParameter("eng");
	
	//값이 공백이라면 다시 화면으로
	//form에  required 속성이 있다면 if문이 필요 없다
	if(name.equals("") || kor.equals("") || math.equals("") || eng.equals("")) { 
		response.sendRedirect("quiz01.jsp");
	} else {
		
		int k = Integer.parseInt(kor);
		int e = Integer.parseInt(eng);
		int m = Integer.parseInt(math);
			
		double avg = (k + e + m) / 3.0; 
		if(avg >= 60) response.sendRedirect("quiz01_pass.jsp");
		else response.sendRedirect("quiz01_nonpass.jsp");
	}
%>