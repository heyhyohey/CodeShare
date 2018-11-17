<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="../css/main.css">
<title>Error</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<section>
		<div id="error-div">
			<h1>에러가 발생하였습니다.</h1>
			<p>${ exception.getMessage }</p>
		</div>
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>