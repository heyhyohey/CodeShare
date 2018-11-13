<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원삭제</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<link type="text/css" rel="stylesheet" href="../css/sign_up.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="sign-up-div">
			<h1>회원삭제</h1>
			<div id="input-area">
				<form action="leave_result.jsp" method="post">
					<p>*는 필수입력 항목입니다.</p>
					<div class="input-group">
						<b>*비밀번호</b><br> <input type="password" class="input-form"
							name="pw" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
					</div>
					<div class="input-group">
						<b>*"정말 탈퇴하겠습니다"를 입력하세요</b><br> <input type="text"
							class="input-form" name="confirm" maxlength="20"><br>
					</div>
					<div id="menu-area">
						<button onclick="location.href='leave_result.jsp'"
							class="submit-button">회원탈퇴</button>
					</div>
				</form>
				<button onclick="location.href='my_page.jsp'"
					class="submit-button logout-button">이전으로</button>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>
