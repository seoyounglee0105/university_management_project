<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 
    	박성희
    	강의실 page
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room</title>
</head>
<body>
	<form action="/admin/room-proc" method="post">
		<h2>등록할 강의실을 입력해주세요</h2>
		강의실 <input type="text" name="id" value="C250"> 
		단과대ID <input type="text" name="collegeId" value="1"> 
		<input type="submit" value="입력">
	</form>
</body>
</html>