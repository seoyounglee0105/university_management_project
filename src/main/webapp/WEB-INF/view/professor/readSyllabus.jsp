<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의계획서</title>
<link rel="stylesheet" href="/css/main.css">
<style type="text/css">
.syllabus--table {
	width: 800px;
	border-collapse: collapse;
	border: 1px solid black;
}

.syllabus--table td {
	padding: 4px;
	text-align: center;
}

.col1 {
	width: 14%;
}

.col2 {
	width: 13%;
}

.col3 {
	width: 30%;
}

.col4 {
	width: 13%;
}

.col5 {
	width: 30%;
}
</style>
</head>

<body>
	<header>
		<div class="header--top"></div>
	</header>
	<section>
		<div class="section--header">
			<h2>강의 계획서 조회</h2>
			<a href=""></a>
		</div>

		<table border="1" class="syllabus--table">
			<colgroup>
				<col class="col1">
				<col class="col2">
				<col class="col3">
				<col class="col4">
				<col class="col5">
			</colgroup>
			<tr>
				<td rowspan="4">교과목 정보</td>
				<td>수업 번호</td>
				<td>12345</td>
				<td>교과목 명</td>
				<td>상하수도 공학</td>
			</tr>
			<tr>
				<td>수업 연도</td>
				<td>2023</td>
				<td>수업 학기</td>
				<td>1</td>
			</tr>
			<tr>
				<td>학점</td>
				<td>3</td>
				<td>이수 구분</td>
				<td>전공</td>
			</tr>
			<tr>
				<td>강의 시간</td>
				<td>금 15:00 - 18:00</td>
				<td>강의실</td>
				<td>C501(공학대학)</td>
			</tr>
		</table>
		<br>
		<table border="1" class="syllabus--table">
			<colgroup>
				<col class="col1">
				<col class="col2">
				<col class="col3">
				<col class="col4">
				<col class="col5">
			</colgroup>
			<tr>
				<td rowspan="2">교강사 정보</td>
				<td>소속</td>
				<td>토목공학</td>
				<td>성명</td>
				<td>가나다</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>202-1231-2312</td>
				<td>email</td>
				<td>g@green.ac.kr</td>
			</tr>
		</table>
		<br>
		<table border="1" class="syllabus--table">
			<colgroup>
				<col style="width: 14%">
				<col>
			</colgroup>
			<tr>
				<td>강의 개요</td>
				<td>본 강좌는 정치학 일반에 대한 개념 파악과 더불어 국제정치의 이해에도 비중을 두고자 한다. 구체적으로는 정치학 일반에 대해서는 정치권력, 정치과정, 정치이데올로기, 정치발전, 국가론 등을 중심으로 살펴볼 것이며, 국제정치와 관련해서는 양차세계대전과 냉전과 관련한 20세기 국제정치사, 세계평화를 위한 유엔의 역할, 그리고 최근 주목을
					받고 있는 동북아 다자안보와 동아시아 지역주의에 대해서 학습할 것이다.본 강좌는 정치학에 입문하려는 학생들에게 정치학의 기초지식을 습득케 함으로써 현실정치를 보다 깊이 이해할 수 있는 능력과 안목을 육성함을 목표로 한다.</td>
			</tr>
			<tr>
				<td>강의 목표</td>
				<td>세계평화를 위한 유엔의 역할, 그리고 최근 주목을 받고 있는 동북아 다자안보와 동아시아 지역주의에 대해서 학습할 것이다.본 강좌는 정치학에 입문하려는 학생들에게 정치학의 기초지식을 습득케 함으로써 현실정치를 보다 깊이 이해할 수 있는 능력과 안목을 육성함을 목표로 한다.</td>
			</tr>
			<tr>
				<td>교재 정보</td>
				<td>상하수도공학1</td>
			</tr>
			<tr>
				<td>주간 계획</td>
				<td>1 – 7 주차 이론 8주차 중간시험 9 – 15 주차 실습 9주차 기말시험</td>
			</tr>
		</table>

	</section>

</body>
</html>