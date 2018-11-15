<%@page import="codeshare.dto.Request"%>
<%@page import="codeshare.request.service.SelectRequestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String pageNumStr = (String)request.getParameter("page");
	int pageNum = Integer.parseInt(pageNumStr);
	
	SelectRequestService service = SelectRequestService.getInstance();
	Request userRequest = service.select(pageNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청확인</title>
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
			<h1>요청목록</h1>
			<div id="content">
				<div id="input-div">
					<div class="input-group">
							<b>제목</b><br>
							<%= userRequest.getTitle() %>
					</div>
					<div class="input-group">
							<b>내용</b><br>
							<%= userRequest.getContent() %>
					</div>
				</div>
				<div id="menu-area">
					<button onclick="location.href='response.jsp'"
						class="submit-button">응답하기</button><br>
					<button onclick="location.href='request_list.jsp'"
						class="submit-button logout-button">이전으로</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>