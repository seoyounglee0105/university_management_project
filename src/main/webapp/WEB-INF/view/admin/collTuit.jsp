<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
    	박성희
    	단과별 등록금 page
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CollTuit</title>
</head>
<body>
	<form action="/admin/collTuit-proc" method="post">
		<h2>단과대학을 선택 후 등록금을 입력해주세요</h2>
		단과대학 <select>
			<option value="인문대학">인문대학</option>
			<option value="의과대학">의과대학</option>
			<option value="공과대학">공과대학</option>
			<option value="예술대학">예술대학</option>
		</select> 등록금 <input type="text"> <input type="submit" value="입력">
	</form>
</body>
</html>