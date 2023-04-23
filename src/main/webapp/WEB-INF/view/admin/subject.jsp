<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
    	박성희
    	강의 page
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subject</title>
</head>
<body>
	<form action="/admin/subject-proc" method="post">
		<h2>등록할 강의를 입력해주세요</h2>
		강의명 <input type="text" name="name" value="스프링부트 뽀개기"><br>
		교수ID <input type="text" name="professorId" value="20231512"><br>
		강의실 <input type="text" name="roomId" value="C250"><br>
		학과ID <input type="text" name="deptId" value="1234"><br>
		구분 <input type="text" name="type" value="전공"><br>
		연도 <input type="text" name="subYear" value="2023"><br>
		학기 <input type="text" name="semester" value="1"><br>
		시간 <input type="text" name="time" value="수요일 10-12"><br>
		학점 <input type="text" name="grades" value="3"><br>
		정원 <input type="text" name="dapacity" value="15"><br>
		현재인원 <input type="text" name="numOfStudent" value="0"><br>
		
		<input type="submit" value="입력">
	</form>
</body>
</html>