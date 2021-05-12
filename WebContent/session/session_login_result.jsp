<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. 넘어오는 3가지 값을 받는다
	2. 아이디, 비밀번호가 동일하면 로그인 성공이라 가정
		(user_id, 실제 아이디) 세션을 생성
		(user_nick, 실제 닉네임) 세션을 생성
	3. 로그인에 성공할 경우, session_welcome.jsp로 리다이렉트해서 "id(닉네임) 환영합니다"를 출력
		로그인이 실패할 경우, 로그인 페이지로 리다이렉트
	4. session_welcome.jsp에는 로그아웃 기능이 있는 <a>태그 생성
		a태그 클릭시 session_logout.jsp로 이동해서 세션을 삭제하고, 다시 로그인 페이지로 리다이렉트.
	*/
	
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nick = request.getParameter("nick");
	
	if(id.equals(pw)) { //로그인 성공
		session.setAttribute("user_id", id);
		session.setAttribute("user_nick", nick);
		
		response.sendRedirect("session_welcome.jsp");
		
	} else {
		//response.sendRedirect("session_login.jsp"); //로그인 실패
	
%>

	<script>
		/*
		HTML에서 동적인 부분의 처리는 JS를 이용한다
		스크립트 사용은 script 태그 안에서 작성
		var a = 1;
		function 이름(b) {
		
		}
		*/
		
		//JS내장함수
		//confirm("yes or no 확인창"); // true, false를 클라이언트에서 선택할 수 있는 팝업창이 뜬다
		//history.go(-1); // -1을 넣으면 뒤로가기가 실행된다
		//alert("아이디 비밀번호를 확인하세요"); //팝업창이 뜬다
		//location.href = "session_login.jsp"; // 해당 경로로 rediection이 일어난다

		function check() {
			alert("아이디 또는 비밀번호를 확인하세요");
			location.href = "session_login.jsp";
		}	
		
		check(); // 함수 호출
		
		
	</script>
	
<% } %>