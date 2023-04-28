<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>

form{
	margin-left: 30px;
	
}

.input--table {
	margin: 10px;
	width: 900px;
}
.input--table th {
	text-align: center;
}

.half--table {
	width: 450px;
}

.col1{
	width: 15%;
}
.col2{
	width: 35%;
}
.col3{
	width: 15%;
}
.col4{
	width: 35%;
}

.input--table td {
	padding: 5px 10px;
}

.stat--table {
	width: 1000px;
}

</style>

<!-- 세부 메뉴 + 메인 -->
<div class="d-flex justify-content-center align-items-start" style="min-width: 100em;">
	<!-- 세부 메뉴 div-->
	<div class="sub--menu">
		<div class="sub--menu--top">
			<h2>MY</h2>
		</div>
		<!-- 메뉴 -->
		<!-- 선택된 메뉴에 class="selected--menu" 추가해주세요 -->
		<div class="sub--menu--mid">
			<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/user/student">학생 ID 생성</a></td>
				</tr>
				<tr>
					<td><a href="/user/professor">교수 ID 생성</a></td>
				</tr>
				<tr>
					<td><a href="/user/staff">직원 ID 생성</a></td>
				</tr>
				<tr>
					<td><a href="/update" class="selected--menu">개인 정보 수정</a></td>
				</tr>
				<tr>
					<td><a href="/password">비밀번호 변경</a></td>
				</tr>
				<tr>
					<td><a href="/professor/subject">교수 자기 강의 조회</a></td>
				</tr>
				<tr>
					<td><a href="/info/student">학생 Info</a></td>
				</tr>
				<tr>
					<td><a href="/info/staff">직원 Info</a></td>
				</tr>
				<tr>
					<td><a href="/info/professor">교수 Info</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>My Info</h1>
		<div class="split--div"></div>
			<table border="1" class="input--table" >
			<colgroup>
				<col class="col1">
				<col class="col2">
				<col class="col3">
				<col class="col4">
			</colgroup>
				<tr>
					<th>ID</th>
					<td>${staff.id}</td>
					<th>입사 날짜</th>
					<td>${staff.hireDate}</td>
				</tr>
			</table>
			<table border="1" class="input--table" >
			<colgroup>
				<col class="col1">
				<col class="col2">
				<col class="col3">
				<col class="col4">
			</colgroup>
				<tr>
					<th>성명</th>
					<td>${staff.name}</td>
					<th>생년월일</th>
					<td>${staff.birthDate}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${staff.gender}</td>
					<th>주소</th>
					<td>${staff.address}</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${staff.tel}</td>
					<th>email</th>
					<td>${staff.email}</td>
				</tr>
			</table>
	</main>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>