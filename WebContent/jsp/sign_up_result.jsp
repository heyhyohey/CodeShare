<%@ page import="codeshare.user.service.LoginService"%>
<%@ page import="codeshare.user.service.SelectUserService"%>
<%@ page import="codeshare.user.service.InsertUserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../jspf/check_not_login.jspf" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="codeshare.dto.User" id="user" />
<jsp:setProperty name="user" property="*" />
<%
	int errorNum = 0;
	String pwConfirm = request.getParameter("pw-confirm");
	LoginService loginService = LoginService.getInstance();
	// 1. 필수 입력란이 모두 채워져 있는지 확인
	if(user.getId() == null || user.getPw() == null || pwConfirm.equals(""))
		errorNum = 1;	
	// 2. 비밀번호와 비밀번호확인이 같은지 확인
	else if(!pwConfirm.equals(user.getPw()))
		errorNum = 2;
	// 3. 이미 아이디가 존재하는지 확인
	else if(loginService.checkId(user.getId())) {
		errorNum = 3;
	} else {
		InsertUserService service = InsertUserService.getInstance();
		service.insert(user);
	}
%>
<c:set var="errorNum" value="<%=errorNum%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<script>
	var errorNum = ${ errorNum };
	if(errorNum == 1) {
		alert("필수입력란을 채워주세요.");
		history.back();
	} else if(errorNum == 2) {
		alert("비밀번호와 비밀번호확인을 확인하세요.");
		history.back();
	} else if(errorNum == 3) {
		alert("아이디가 이미 존재합니다.");
		history.back();
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="login-div">
			<h1>환영합니다!<%= errorNum %></h1>
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