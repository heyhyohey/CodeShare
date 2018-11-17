<%@page import="codeshare.upload.service.InsertUploadService"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../jspf/check_login.jspf" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="codeshare.dto.Upload" id="userUpload" />
<jsp:setProperty name="userUpload" property="*" />
<%
	String id = (String)session.getAttribute("id");
	userUpload.setId(id);
	userUpload.setDate(new Timestamp(System.currentTimeMillis()));
	InsertUploadService service = InsertUploadService.getInstance();
	service.insert(userUpload);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공유하기</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="login-div">
			<h1>축하합니다!</h1>
			<div id="content">
				<div id="input-div">
					<p>공유가 완료되었습니다!</p>
				</div>
				<div id="menu-div">
					<button onclick="location.href='upload_list.jsp'" class="submit-button">공유
						목록으로</button>
					<button onclick="location.href='my_page.jsp'" class="submit-button">마이페이지로</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>