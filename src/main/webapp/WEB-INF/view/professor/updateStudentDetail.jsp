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
					<td><a href="/password">비밀번호 변경</a></td>
				</tr>
				<tr>
					<td><a href="/professor/subject">교수 자기 강의 조회</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>학생 리스트 조회</h1>
		<table border="1">
			<thead>
				<tr>
					<th>학생 번호</th>
					<th>이름</th>
					<th>소속</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${student.studentId}</td>
					<td>${student.studentName}</td>
					<td>${student.deptName}</td>
				</tr>
			</tbody>
		</table>
		<table>
			<tr>
				<td><label>결석</label><input type="number" name="absent" id="absent"></td>
			</tr>
			<tr>
				<td><label>지각</label><input type="number" name="lateness" id="lateness"></td>
			</tr>
			<tr>
				<td><label>과제점수</label><input type="number" name="homework" id="homework"></td>
			</tr>
			<tr>
				<td><label>중간시험</label><input type="number" name="midExam" id="midExam"></td>
			</tr>
			<tr>
				<td><label>기말시험</label><input type="number" name="finalExam" id="finalExam"></td>
			</tr>
			<tr>
				<td><label>환산점수</label><input type="number" name="convertedMark" id="convertedMark"></td>
			</tr>
		</table>

	</main>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>
