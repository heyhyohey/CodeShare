<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="login-div">
			<h1>My Page</h1>
			<div id="content">
				<div id="input-area">
					<p>님 안녕하세요!</p>
				</div>
				<div id="menu-area">
					<button onclick="location.href='/Login/main/displayInfo.jsp'"
						class="submit-button">회원정보 확인</button>
					<br>
					<button onclick="location.href='/Login/main/updateAccount.jsp'"
						class="submit-button">회원정보 수정</button>
					<br>
					<button onclick="location.href='/Login/main/deleteAccount.jsp'"
						class="submit-button">회원삭제</button>
					<br>
					<button onclick="location.href='/Login/main/logout.jsp'"
						class="submit-button logout-button">로그아웃</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>