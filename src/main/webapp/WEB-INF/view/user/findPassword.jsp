<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의계획서</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

* {
	margin: 0 auto;
	padding: 0 auto;
	font-family: 'Noto Sans KR', sans-serif;
}

.header--top {
	width: 100%;
	height: 40px;
	background-color: #031734;
}

.section--header {
	text-align: center;
}

.search--table {
	width: 400px;
}

.search--table td {
	padding: 4px;
	text-align: left;
}

.col1 {
	width: 20%;
}

.col2 {
	width: 80%;
}

.submit--button {
	margin-top: 20px;
	margin-left: 200px;
}
</style>
</head>

<body>
	<header>
		<div class="header--top"></div>
	</header>
	<section>
		<div class="section--header">
			<h2>비밀번호 찾기</h2>
			<br>
		</div>
		<form action="/find/id" method="post">
			<table class="search--table">
				<colgroup>
					<col class="col1">
					<col class="col2">
				</colgroup>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td colspan="2">
						<label for="studnet">학생</label> <input type="radio" name="userRole" value="student" id="student">
						&nbsp;&nbsp;
						<label for="studnet">교수</label> <input type="radio" name="userRole" value="student" id="student">
						&nbsp;&nbsp;
						<label for="studnet">직원</label> <input type="radio" name="userRole" value="student" id="student">
					</td>
				</tr>
			</table>
			<div class="button--container">
				<button type="submit" class="submit--button">임시 비밀번호 발급받기</button>
			</div>
		</form>
	</section>

</body>
</html>