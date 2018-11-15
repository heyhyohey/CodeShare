<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청하기</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<link type="text/css" rel="stylesheet" href="../css/sign_up.css">
<link type="text/css" rel="stylesheet" href="../css/request.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="sign-up-div">
			<h1>요청하기</h1>
			<div id="input-div">
				<form action="request_result.jsp" method="post">
					<div class="input-group">
						<b>제목</b><br> <input type="text" class="input-form"
							name="title" maxlength="50"><br>
					</div>
					<div class="input-group">
						<b>요청내용</b><br>
						<textarea class="input-form-long" rows="25" cols="137"
							name="content"></textarea>
					</div>
					<input type="submit" class="submit-button" value="요청하기">
					<input type="reset" class="submit-button" value="초기화">
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>