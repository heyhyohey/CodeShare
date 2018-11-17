<%@page import="codeshare.user.service.LoginService"%>
<%@ page import="codeshare.dto.User"%>
<%@ page import="codeshare.user.service.SelectUserService"%>
<%@ page import="codeshare.user.service.UpdateUserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../jspf/check_login.jspf" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="codeshare.dto.User" id="user" />
<jsp:setProperty name="user" property="*" />
<%
	// 1. 기존의 유저 정보를 가져옴
	String id = (String)session.getAttribute("id");
	String pw = request.getParameter("pw");
	String newPw = request.getParameter("new-pw");
	String newPwConfirm = request.getParameter("new-pw-confirm");
	String pwConfirm = request.getParameter("pw-confirm");
	SelectUserService selectService = SelectUserService.getInstance();
	User oldUser = selectService.select(id);
	
	int errorNum = 0;
	
	// 2. 필수입력란이 비어있는지 확인
	if(pw.equals(""))
		errorNum = 1;
	
	// 3. 비밀번호가 맞는지 확인
	else if(!(id.equals("")) && !(pw.equals(""))) {
		LoginService service = LoginService.getInstance();
		if(!service.login(id, pw))
			errorNum = 2;
	}
	
	// 4. 비밀번호가 입력되었다면 같은지 확인
	if(!newPw.equals("") && !newPwConfirm.equals("")) {
		if(!newPw.equals(newPwConfirm))
			errorNum = 3;
	}
	
	if(errorNum == 0) {
		// 5. 업데이트된 정보를 가져옴
		user.setId(id);
		user.setPw(!(newPw.equals("")) ? newPw : oldUser.getPw());
		user.setLan((user.getLan() != null) ? user.getLan() : oldUser.getLan());
		user.setEmail((user.getEmail() != null) ? user.getEmail() : oldUser.getEmail());
		user.setIntro((user.getIntro() != null) ? user.getIntro() : oldUser.getIntro());
	
		// 6. 완성된 유저정보를 업데이트
		UpdateUserService updateService = UpdateUserService.getInstance();
		updateService.update(user);
	}
%>
<c:set var="errorNum" value="<%=errorNum%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 완료</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<script>
	var errorNum = ${ errorNum };
	if(errorNum == 1) {
		alert("필수입력란을 채워주세요.");
		history.back();
	} else if(errorNum == 2) {
		alert("비밀번호를 확인하세요.");
		history.back();
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="login-div">
			<h1>완료되었습니다!</h1>
			<div id="content">
				<div id="input-div">
					<p>회원정보수정이 완료되었습니다!</p>
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