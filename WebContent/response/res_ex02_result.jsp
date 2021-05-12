<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	/*
	 1. id, pw를 받아서 처리
	 2. id가 abc123이고 비밀번호가 asd123이라면 로그인 성공으로 간주하고 res_ex02_welcome.jsp로 redirect
		id가 틀린 경우 res_ex02_idfail로 redirect
		pw가 틀린 경우 res_ex02_pwfail로 redirect
		
	 3. 한글처리
	*/
	
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	if(id.equals("abc123")) {
		if(pw.equals("asd123")) {
			response.sendRedirect("res_ex02_welcome.jsp");
		} else {
			response.sendRedirect("res_ex02_pwfail.jsp");
		}
	}
	else {
		response.sendRedirect("res_ex02_idfail.jsp");
	}
%>