<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<link type="text/css" rel="stylesheet" href="../css/sign_up.css">
</head>
<body>
	<jsp:include page="../html/header.html" />
	<div id="sign-up-div">
		<h1>Sign Up!</h1>
		<div id="input-div">
			<form action="sign_up_result.jsp" method="get">
				<p><strong>*는 필수입력 항목입니다.</strong></p>
				<div class="input-group">
					<b>*아이디</b><br> <input type="text" class="input-form"
						name="id" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
				</div>
				<div class="input-group">
					<b>*비밀번호</b><br> <input type="password" class="input-form"
						name="pw" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
				</div>
				<div class="input-group">
					<b>*비밀번호 재확인</b><br> <input type="password" class="input-form"
						name="pw-confirm" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
				</div>
				<div class="input-group">
					<b>관심언어</b><br> <input type="text" class="input-form"
						name="lan" maxlength="80" placeholder="ex) C, Java"><br>
				</div>
				<div class="input-group">
					<b>이메일</b><br> <input type="email" class="input-form"
						name="email" maxlength="80" placeholder="ex) example@example.com"><br>
				</div>
				<div class="input-group">
					<b>자기소개</b><br>
					<textarea class="input-form-long" rows="5" cols="60"
						name="intro"></textarea>
				</div>
				<input type="submit" class="submit-button" value="회원가입">
			</form>
		</div>
	</div>
	<jsp:include page="../html/footer.html" />
</body>
</html>