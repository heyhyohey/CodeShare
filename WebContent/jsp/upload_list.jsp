<%@page import="codeshare.upload.service.UploadListView"%>
<%@page import="codeshare.upload.service.SelectUploadService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../jspf/check_login.jspf" %>
<%
	request.setCharacterEncoding("utf-8");
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	SelectUploadService uploadService = SelectUploadService.getInstance();
	UploadListView viewData = uploadService.getUploadList(pageNumber);
%>
<c:set var="viewData" value="<%=viewData%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공유 게시판</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<link type="text/css" rel="stylesheet" href="../css/sign_up.css">
<link type="text/css" rel="stylesheet" href="../css/request.css">
<link type="text/css" rel="stylesheet" href="../css/post.css">
<link type="text/css" rel="stylesheet" href="../css/upload.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="sign-up-div">
		<h1>공유 게시판</h1>
			<c:if test="${ !viewData.isEmpty() }">
				<table>
					<tr class="tr-head">
						<td>글 번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>등록날짜</td>
					</tr>
					<c:forEach var="item" items="${ viewData.uploadList }">
						<tr>
							<td class="td1">${ item.num }</td>
							<td class="td2"><a href="upload_info.jsp?page=${ item.num }">${ item.title }</a></td>
							<td class="td3">${ item.id }</td>
							<td 
							class="td4">${ item.date }</td>
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