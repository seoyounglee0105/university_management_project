<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="/user/login" method="post">
		<div>
			<label for="userId">아이디</label><input type="text" name="userId" id="userId">
		</div>
		<div>
			<label for="password">비밀번호</label><input type="password" name="password" id="password">
		</div>
		<div>
			<button type="submit">로그인</button>
		</div>
	</form>
</body>
</html>