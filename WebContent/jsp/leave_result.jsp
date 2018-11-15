<%@ page import="codeshare.user.service.DeleteUserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");

	DeleteUserService service = DeleteUserService.getInstance();
	service.delete(id);
	
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 결과</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="login-div">
			<h1>안녕히가세요!</h1>
			<div id="content">
				<div id="input-area">
					<p>회원탈퇴가 완료되었습니다!</p>
				</div>
				<div id="menu-area">
					<button onclick="location.href='main.jsp'"
						class="submit-button">메인 화면으로</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>