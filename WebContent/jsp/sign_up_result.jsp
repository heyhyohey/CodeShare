<%@ page import="codeshare.user.service.LoginService"%>
<%@ page import="codeshare.user.service.SelectUserService"%>
<%@ page import="codeshare.user.service.InsertUserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="codeshare.dto.User" id="user" />
<jsp:setProperty name="user" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<%
	LoginService loginService = LoginService.getInstance();
	if(!loginService.checkId(user.getId())) {
		InsertUserService service = InsertUserService.getInstance();
		service.insert(user);
	} else {
%>
<script>
	alert("아이디가 이미 존재합니다.");
	history.back();
</script>
<%
	}
%>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="login-div">
			<h1>환영합니다!</h1>
			<div id="content">
				<div id="input-div">
					<p>회원가입이 완료되었습니다!</p>
				</div>
				<div id="menu-div">
					<button onclick="location.href='login.jsp'"
						class="submit-button">로그인 화면으로</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>