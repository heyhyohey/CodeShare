<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
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
			<h1>마이 페이지</h1>
			<div id="input-div">
				<p><%= id %>님 안녕하세요!</p>
				<div id="menu-area">
					<button onclick="location.href='request_list.jsp'"
						class="submit-button">요청정보 확인</button>
					<br>
					<button onclick="location.href='display.jsp'"
						class="submit-button">회원정보 확인</button>
					<br>
					<button onclick="location.href='update.jsp'"
						class="submit-button">회원정보 수정</button>
					<br>
					<button onclick="location.href='leave.jsp'"
						class="submit-button">회원삭제</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>