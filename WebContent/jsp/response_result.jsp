<%@page import="codeshare.request.service.UpdateRequestService"%>
<%@page import="codeshare.response.service.InsertResponseService"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../jspf/check_login.jspf" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="codeshare.dto.Response" id="userResponse" />
<jsp:setProperty name="userResponse" property="*" />
<%
	String pageNumStr = request.getParameter("page");
	int pageNum = Integer.parseInt(pageNumStr);
	String id = (String)session.getAttribute("id");
	
	userResponse.setNum(pageNum);
	userResponse.setId(id);
	userResponse.setDate(new Timestamp(System.currentTimeMillis()));

	InsertResponseService service = InsertResponseService.getInstance();
	service.insert(userResponse);
	
	UpdateRequestService requestService = UpdateRequestService.getInstance();
	requestService.update(pageNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답하기</title>
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
					<p>응답이 완료되었습니다!</p>
				</div>
				<div id="menu-div">
					<button onclick="location.href='request_list.jsp'"
						class="submit-button">요청 목록으로</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>