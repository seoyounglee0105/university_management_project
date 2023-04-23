<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 
    	박성희
    	단과대학 page
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>College</title>
</head>
<body>
	<form action="/admin/college-proc" method="post">
	<h2>단과대학 이름을 입력해주세요</h2>
	이름 <input type="text" name="name" value="인문대학">
	<input type="submit" value="입력">
	</form>
</body>
</html>