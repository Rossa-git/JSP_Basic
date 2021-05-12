<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	앞에서 넘어온 값을 받아서 평균을 구한다
	평균이 60점 이상이라면 quiz01_ok.jsp로 이동
	~~~님 평균 xx점 합격입니다
	
	평균이 60점 이하인 경우는 quiz01_no.jsp로 이동
	~~~님 평균 xx점 불합격
	
	조건 : session 사용하지 않기
	*/
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int math = Integer.parseInt(request.getParameter("math"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	
	double avg = ((kor + math + eng) * 100 / 3) * 0.01;
	
	request.setAttribute("avg", avg);
	request.setAttribute("name", name);
	
	if(avg >= 60) {
		request.getRequestDispatcher("quiz01_ok.jsp").forward(request, response);
	} else {
		request.getRequestDispatcher("quiz01_no.jsp").forward(request, response);
	}
%>