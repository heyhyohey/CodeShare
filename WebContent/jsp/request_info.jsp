<%@page import="codeshare.dto.Response"%>
<%@page import="codeshare.response.service.SelectResponseService"%>
<%@page import="codeshare.dto.Request"%>
<%@page import="codeshare.request.service.SelectRequestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String pageNumStr = (String) request.getParameter("page");
	int pageNum = Integer.parseInt(pageNumStr);

	SelectRequestService service = SelectRequestService.getInstance();
	Request userRequest = service.select(pageNum);
	Response userResponse = null;
	if (userRequest.getState()) {
		SelectResponseService responseService = SelectResponseService.getInstance();
		userResponse = responseService.select(pageNum);
	}
%>
<c:set var="userRequest" value="<%=userRequest%>" />
<c:set var="userResponse" value="<%=userResponse%>" />
<c:set var="pageNum" value="<%=pageNum%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 내용</title>
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
			<h1>요청 내용</h1>
			<div id="content">
				<div id="input-div">
					<div class="input-group">
						<b>제목</b><br>
						<%=userRequest.getTitle()%>
					</div>
					<div class="input-group content-group">
						<b>요청내용</b><br>
						<%=userRequest.getContent()%>
					</div>
					<c:choose>
						<c:when test="${ userRequest.state }">
							<div class="input-group content-group">
								<b>응답내용</b><br>
								<%=userResponse.getContent()%>
							</div>
						</c:when>
					</c:choose>
				</div>
				<div id="menu-area">
					<c:if test="${ !userRequest.state }">
						<button onclick="location.href='response.jsp?page=${ pageNum }'"
							class="submit-button">응답하기</button>
					</c:if>
					<br>
					<button onclick="location.href='request_list.jsp'"
						class="submit-button logout-button">이전으로</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>
