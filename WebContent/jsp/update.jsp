<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<link type="text/css" rel="stylesheet" href="../css/sign_up.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div id="sign-up-div">
			<h1>회원정보수정</h1>
			<div id="content">
				<div id="input-div">
					<form action="update_result.jsp" method="post">
						<p>수정할 회원정보를 입력하세요. 입력하지 않는 회원정보는 바뀌지 않습니다.</p>
						<p>*는 필수입력 항목입니다.</p>
						<div class="input-group">
							<b>* 현재 비밀번호</b><br> <input type="password" class="input-form"
								name="pw" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
						</div>
						<div class="input-group">
							<b>변경할 비밀번호</b><br> 
							<input type="password" class="input-form" name="new-pw" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
						</div>
						<div class="input-group">
							<b>변경할 비밀번호 재확인</b><br> <input type="password" class="input-form"
								name="new-pw-comfirm" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
						</div>
						<div class="input-group">
							<b>변경할 관심언어</b><br> <input type="text" class="input-form"
								name="lan" maxlength="80" placeholder="ex) C, Java"><br>
						</div>
						<div class="input-group">
							<b>변경할 이메일</b><br> <input type="email" class="input-form"
								name="email" maxlength="80" placeholder="ex) example@example.com"><br>
						</div>
						<div class="input-group">
							<b>변경할 자기소개</b><br>
							<textarea class="input-form-long" rows="5" cols="60"
								name="intro"></textarea>
						</div>
						<input type="submit" class="submit-button" value="회원정보수정">
					</form>
					<button onclick="location.href='my_page.jsp'"
						class="submit-button logout-button">이전으로</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>