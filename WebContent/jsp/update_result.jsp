<%@ page import="codeshare.dto.User"%>
<%@ page import="codeshare.service.SelectUserService"%>
<%@ page import="codeshare.service.UpdateUserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="codeshare.dto.User" id="user" />
<jsp:setProperty name="user" property="*" />
<%
	// 1. 기존의 유저 정보를 가져옴
	String id = (String)session.getAttribute("id");
	SelectUserService selectService = SelectUserService.getInstance();
	User oldUser = selectService.select(id);
	
	// 2. 업데이트된 정보를 가져옴
	user.setId(id);
	user.setPw((user.getPw() != null)?user.getPw():oldUser.getPw());
	user.setLan((user.getLan() != null)?user.getLan():oldUser.getLan());
	user.setEmail((user.getEmail() != null)?user.getEmail():oldUser.getEmail());
	user.setIntro((user.getIntro() != null)?user.getIntro():oldUser.getIntro());
	
	// 3. 완성된 유저정보를 업데이트
	UpdateUserService updateService = UpdateUserService.getInstance();
	updateService.update(user);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 완료</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="login-div">
			<h1>완료되었습니다!</h1>
			<div id="content">
				<div id="input-div">
					<p><%= user.getId() %>회원정보수정이 완료되었습니다!</p>
				</div>
				<div id="menu-div">
					<button onclick="location.href='main.jsp'"
						class="submit-button">메인 화면으로</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>