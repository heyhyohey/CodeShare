<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../jspf/check_login.jspf" %>
<%
	request.setCharacterEncoding("utf-8");
	String pageNum = request.getParameter("page");
%>
<c:set var="pageNum" value="<%= pageNum %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답하기</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<link type="text/css" rel="stylesheet" href="../css/sign_up.css">
<link type="text/css" rel="stylesheet" href="../css/request.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="sign-up-div">
			<h1>응답하기</h1>
			<div id="input-div">
				<form action="response_result.jsp?page=${ pageNum }" method="post">
					<div class="input-group">
						<b>응답내용</b><br>
						<textarea class="input-form-long" rows="25" cols="137"
							name="content"></textarea>
					</div>
					<input type="submit" class="submit-button" value="응답하기"> <input
						type="reset" class="submit-button" value="초기화">
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>