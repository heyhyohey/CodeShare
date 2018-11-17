<%@ page import="codeshare.user.service.LoginService"%>
<%@ page import="codeshare.user.service.DeleteUserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../jspf/check_login.jspf" %>
<%
	request.setCharacterEncoding("utf-8");

	int errorNum = 0;
	String id = (String)session.getAttribute("id");
	String pw = request.getParameter("pw");
	String confirm = request.getParameter("confirm");
	
	// 1. 필수입력란이 비어있는지 확인
	if(pw.equals("") || confirm.equals(""))
		errorNum = 1;
	// 2. 확인문자가 올바른지 확인
	else if(!"정말 탈퇴하겠습니다".equals(confirm))
		errorNum = 2;
	// 3. 비밀번호가 일치하는지 확인
	else if(id != null && pw != null) {
		LoginService service = LoginService.getInstance();
		if(!service.login(id, pw))
			errorNum = 3;
	} 
	
	// 4. 일치하면 삭제
	if(errorNum == 0){
		System.out.println(errorNum);
		DeleteUserService deleteService = DeleteUserService.getInstance();
		deleteService.delete(id);
		session.invalidate();
	}
%>
<c:set var="errorNum" value="<%=errorNum%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 결과</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<script>
	var errorNum = ${ errorNum };
	if(errorNum == 1) {
		alert("필수입력란을 채워주세요.");
		history.back();
	} else if(errorNum == 2) {
		alert("확인문자를 정확히 입력해주세요.");
		history.back();
	} else if(errorNum == 3) {
		alert("비밀번호를 확인해주세요.");
		history.back();
	}
</script>
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