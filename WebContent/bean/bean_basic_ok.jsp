<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email"); 
			
%>

<%--
* id : bean의 이름
* class : 실제 사용할 클래스의 경로
* scope : 자바빈 사용 범위

scope 속성
page - 현재 페이지에서만 사용가능
request = 다음 페이지까지 사용가능
session - 브라우저가 종료되까지 모든 페이지
application = 톰캣이 종료되기까지 사용
--%>

<jsp:useBean id="user" class="bean.example.User" scope="request"/>

<!-- setter 사용 -->
<jsp:setProperty property="id" name="user" value="<%=id %>"/>
<jsp:setProperty property="pw" name="user" value="<%=pw %>"/>
<jsp:setProperty property="name" name="user" value="<%=name %>"/>
<jsp:setProperty property="email" name="user" value="<%=email %>"/>


<!-- getter 사용 -->
<jsp:getProperty property="id" name="user"/>
<jsp:getProperty property="pw" name="user"/>
<jsp:getProperty property="name" name="user"/>
<jsp:getProperty property="email" name="user"/>