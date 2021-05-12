<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	앞에서 넘어온 리퀘스트 값, 세션에 저장된 인증문자 값을 비교해서
	일치하면 예약페이지(reserve.jsp)로 리다이렉션
	
	일치하지 않으면 다시 입력 받는다. (auth.jsp로 JS 리다이렉션)
	*/
	request.setCharacterEncoding("utf-8");
	String code = request.getParameter("code");
	String auth = (String)session.getAttribute("auth");

	if(auth.equals(code)) {
		//예약페이지에서 사용할 인증확인 세션
		session.setAttribute("authYN", "y");
		
		response.sendRedirect("reserve.jsp");
	} else { %>
		<script>
			alert("인증문자를 확인하세요")
			location.href = "auth.jsp";
		</script>
<%	} %>