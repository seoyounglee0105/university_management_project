<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 
    	박성희
    	공지 page
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
</head>
<body>
	<form action="/admin/notice-proc" method="post">
		<h2>공지사항 쓰기</h2>
		제목 <input type="text" name="name" value="등록금 납부기한 연장안내">
		내용
		<input type="text" name="name" value="테스트용 글입니다">
		<input type="submit" value="입력">
		파일첨부
	</form>
</body>
</html>