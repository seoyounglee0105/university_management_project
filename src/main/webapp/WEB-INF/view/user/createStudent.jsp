<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>학생 입력창</h1>
	<form action="/user/student" method="post">
		<div>
			<label for="name">이름</label><input type="text" name="name" id="name" value="홍길동">
		</div>
		<div>
			<label for="birthDate">생년월일</label><input type="date" name="birthDate" id="birthDate">
		</div>
		<div>
			<label for="male">남성</label> <input type="radio" value="M" name="gender" id="male"> <label for="female">여성</label> <input type="radio" value="F" name="gender" id="female">
		</div>
		<div>
			<label for="address">주소</label><input type="text" name="address" id="address">
		</div>
		<div>
			<label for="tel">전화번호</label><input type="text" name="tel" id="tel">
		</div>
		<div>
			<label for="deptId">과 ID</label><input type="text" name="deptId" id="deptId">
		</div>
		<div>
			<label for="entranceDate">입학일</label><input type="date" name="entranceDate" id="entranceDate" value="2023-03-01">
		</div>
		
		<div>
			<button type="submit">입력</button>
		</div>
	</form>
</body>
</html>