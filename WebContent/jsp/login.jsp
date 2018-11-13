<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="login-div">
			<h1>CSS에 로그인하세요.</h1>
			<form action="main.jsp" method="post">
				<input type="text" class="input-form" name="id" maxlength="20" placeholder="아이디"><br>
				<input type="password" class="input-form" name="pw" maxlength="20" placeholder="비밀번호"><br>
				<input type="submit" class="submit-button" value="로그인">
			</form>
			<ul>
				<li><a href="sign_up.jsp">회원가입</a></li>
			</ul>
		</div>
	</section>	
	<jsp:include page="footer.jsp" />	
</body>
</html>