<%@ page import="codeshare.user.service.LoginService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code Share Site</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<%	
	// 1. 로그인 데이터가 존재하는지 검사
	if(id != null && pw != null) {
		LoginService service = LoginService.getInstance();
		// 1-1. 로그인 여부 파악 후 세션 생성
		if(service.login(id, pw))
			session.setAttribute("id", id);
		// 1-2. 아닐경우 로그인페이지로 이동
		else {
%>
<script>
	alert("아이디 또는 비밀번호를 확인하세요.");
	history.back();
</script>
<%
		}
	}
%>
</head>
<body>
	<jsp:include page="header.jsp" />
	<article>
		<div id="article-div">
			<div id="content-div">
				<h1>손쉽게 코드를 공유하세요!</h1>
				<p>자신의 잘 만들어진 코드를 공유하거나 필요한 코드를 요청할 수 있습니다.</p>
			</div>
			<div class="botton-div">
				<div class="align-div">
					<div class="div1" onclick="location.href='request.jsp';">
						<img src="../image/request_white.png" alt="요청">
						<h3>요청</h3>
					</div>
					<div class="div2" onclick="location.href='request_list.jsp';">
						<img src="../image/response_white.png" alt="요청목록">
						<h3>요청목록</h3>
					</div>
				</div>
			</div>
			<div class="botton-div">
				<div class="align-div">
					<div class="div1" onclick="location.href='upload.jsp';">
						<img src="../image/upload_white.png" alt="공유">
						<h3>공유</h3>
					</div>
					<div class="div2" onclick="location.href='upload_list.jsp';">
						<img src="../image/board_white.png" alt="공유목록">
						<h3>공유목록</h3>
					</div>
				</div>
			</div>
		</div>
	</article>
	<jsp:include page="footer.jsp" />
</body>
</html>