<%@page import="codeshare.request.service.RequestListView"%>
<%@page import="codeshare.request.service.SelectRequestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	SelectRequestService requestService = SelectRequestService.getInstance();
	RequestListView viewData = requestService.getRequestList(pageNumber);
%>
<c:set var="viewData" value="<%=viewData%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 게시판</title>
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
			<c:if test="${ !viewData.isEmpty() }">
				<table>
					<tr class="tr-head">
						<td>글 번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>등록날짜</td>
					</tr>
					<c:forEach var="item" items="${ viewData.requestList }">
						<tr>
							<td class="td1">${ item.num }</td>
							<td class="td2"><a href="request_info.jsp?page=${ item.num }">${ item.title }</a></td>
							<td class="td3">${ item.id }</td>
							<td class="td4">${ item.date }</td>
						</tr>
					</c:forEach>
				</table>
				<p>
					<c:forEach var="pageNum" begin="1"
						end="${ viewData.pageTotalCount }">
						<a href="request_list.jsp?page=${ pageNum }">${ pageNum }</a>
					</c:forEach>
				</p>
			</c:if>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>