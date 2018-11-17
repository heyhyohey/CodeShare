<%@page import="codeshare.dto.Upload"%>
<%@page import="codeshare.upload.service.SelectUploadService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../jspf/check_login.jspf" %>
<%
	request.setCharacterEncoding("utf-8");
	String pageNumStr = (String) request.getParameter("page");
	int pageNum = Integer.parseInt(pageNumStr);

	SelectUploadService service = SelectUploadService.getInstance();
	Upload userUpload = service.select(pageNum);
%>
<c:set var="userUpload" value="<%=userUpload%>" />
<c:set var="pageNum" value="<%=pageNum%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공유 내용</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<link type="text/css" rel="stylesheet" href="../css/sign_up.css">
<link type="text/css" rel="stylesheet" href="../css/request.css">
<link type="text/css" rel="stylesheet" href="../css/post.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="sign-up-div">
			<h1>공유 내용</h1>
			<div id="content">
				<div id="input-div">
					<div class="input-group">
						<b>제목</b><br>
						<%=userUpload.getTitle()%>
					</div>
					<div class="input-group content-group">
						<b>공유내용</b><br>
						<%=userUpload.getContent()%>
					</div>
				</div>
				<div id="menu-area">
					<button onclick="location.href='upload_list.jsp'"
						class="submit-button logout-button">이전으로</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>