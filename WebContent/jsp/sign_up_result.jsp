<%@page import="codeshare.service.InsertUserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="codeshare.dto.User" id="user" />
<jsp:setProperty name="user" property="*" />
<%
	InsertUserService service = InsertUserService.getInstance();
	service.insertUser(user);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sing up result</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="login-div">
			<h1>Welcome!</h1>
			<div id="content">
				<div id="input-area">
					<p>회원가입이 완료되었습니다!</p>
				</div>
				<div id="menu-area">
					<button onclick="location.href='login.jsp'"
						class="submit-button">로그인 화면으로</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>