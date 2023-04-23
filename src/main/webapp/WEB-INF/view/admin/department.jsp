<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
    	박성희
    	학과 page
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Department</title>
</head>
<body>
	<form action="/admin/department-proc" method="get">
		<h2>등록할 학과명을 입력해주세요</h2>
		학과명 <input type="text" name="name" value="전자과"> 
		단과대학
			<select>
				<c:forEach var="college" items="${collegeList}">
					<option value="${college.id}">${college.name}</option>
				</c:forEach>
			</select>
		<input type="submit" value="입력">
	</form>
</body>
</html>