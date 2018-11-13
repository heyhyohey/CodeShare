<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
	String id = (String)session.getAttribute("id");
	if(id == null) {
%>
	<nav id="header-login-menu">
		<ul>
			<li><a href="main.jsp">홈페이지</a></li>
			<li>|</li>
			<li><a href="login.jsp">로그인</a></li>
			<li>|</li>
			<li><a href="sign_up.jsp">회원가입</a></li>
		</ul>
	</nav>
<%
	} else {
%>
	<nav id="header-login-menu">
		<ul>
			<li><%= id %>님 환영합니다!</li>
			<li>|</li>
			<li><a href="main.jsp">홈페이지</a></li>
			<li>|</li>
			<li><a href="logout.jsp">로그아웃</a></li>
			<li>|</li>
			<li><a href="my_page.jsp">마이 페이지</a></li>
		</ul>
	</nav>
<%
	}	
%>
	<div id="header-div">		
		<h1><a href="/CodeShare/jsp/main.jsp">CSS</a></h1>
		<h3>Code Share Site</h3>
	</div>
	<nav id="header-main-menu">
		<ul>
			<li><a href="request.jsp">요청하기</a></li>
			<li>|</li>
			<li><a href="response.jsp">응답하기</a></li>
			<li>|</li>
			<li><a href="upload.jsp">올리기</a></li>
		</ul>
	</nav>
</header>