<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	
</style>
</head>
<body>
	<form action="/login" method="post">
			<img alt="" src="">
		<div>
			<label for="userId"><span class="material-symbols-outlined">person</span></label>
			<input type="text" name="id" id="userId" value="아이디를 입력하세요">
		</div>
		<div>
			<label for="password"><span class="material-symbols-outlined">lock</span></label>
			<input type="password" name="password" id="password" value="비밀번호를 입력하세요">
		</div>
		<div>
			<button type="submit">로그인</button>
		</div>
	</form>
</body>
</html>