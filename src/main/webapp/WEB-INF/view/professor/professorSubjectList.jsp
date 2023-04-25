<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
form {
	margin-left: 30px;
}

.input--table th, td {
	padding: 5px 10px;
}

/* button {
	padding: 8px 20px;
	border: none;
	border-radius: 5px;
	box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.5);
	margin-top: 20px;
} */

.button-td {
	text-align: center;
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
					<td><a href="#">패스워드 변경</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>과목 조회</h1>
		<div class="split--div"></div>
		<form action="/professor/subject" method="post">
			<select name="period">
				<c:forEach items="${semesterList}" var="yearSemester">
					<option value="${yearSemester.subYear}year${yearSemester.semester}">${yearSemester.subYear}년도${yearSemester.semester}학기</option>
				</c:forEach>
			</select>
			<button type="submit">조회</button>
		</form>
		<table border="1">
			<thead>
				<tr>
					<th>과목id</th>
					<th>과목명</th>
					<th>강의시간</th>
				</tr>
			</thead>
			<c:forEach items="${subjectList}" var="subject">
			<tbody>
				<tr>
					<td>${subject.id }</td>
					<td>${subject.name }</td>
					<td>${subject.time }</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>

	</main>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>