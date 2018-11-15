<%@ page import="java.sql.Timestamp"%>
<%@ page import="codeshare.request.service.InsertRequestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="codeshare.dto.Request" id="userRequest" />
<jsp:setProperty name="userRequest" property="*" />
<%
	String id = (String)session.getAttribute("id");
	userRequest.setId(id);
	userRequest.setDate(new Timestamp(System.currentTimeMillis()));
	userRequest.setState(false);
	InsertRequestService service = InsertRequestService.getInstance();
	service.insert(userRequest);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청하기</title>
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
					<p>요청이 완료되었습니다!</p>
				</div>
				<div id="menu-div">
					<button onclick="location.href='request_list.jsp'" class="submit-button">요청
						목록으로</button>
					<button onclick="location.href='my_page.jsp'" class="submit-button">마이페이지로</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>