<%@ page import="codeshare.dto.User"%>
<%@ page import="codeshare.user.service.SelectUserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");

	SelectUserService service = SelectUserService.getInstance();
	User user = service.select(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<link type="text/css" rel="stylesheet" href="../css/sign_up.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="sign-up-div">
			<h1>회원정보</h1>
			<div id="content">
				<div id="input-div">
					<div class="input-group">
							<b>아이디</b><br>
							<%= user.getId() %>
					</div>
					<div class="input-group">
							<b>관심언어</b><br>
							<%= user.getLan() %>
					</div>
					<div class="input-group">
							<b>이메일</b><br>
							<%= user.getEmail() %>
					</div>
					<div class="input-group">
							<b>자기소개</b><br>
							<%= user.getIntro() %>
					</div>
				</div>
				<div id="menu-area">
					<button onclick="location.href='update.jsp'"
						class="submit-button">회원정보 수정</button><br>
					<button onclick="location.href='my_page.jsp'"
						class="submit-button logout-button">이전으로</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>