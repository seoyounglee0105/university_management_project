<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
form {
	margin-left: 30px;
}

.input--table th,td {
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
			<h2>수업</h2>
		</div>
		<!-- 메뉴 -->
		<div class="sub--menu--mid">
			<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/subject/list/1">전체 강의 조회</a></td>
				</tr>
				<tr>
					<td><a href="/professor/subject" class="selected--menu">내 강의 조회</a></td>
				</tr>
				<c:if test="${principal.userRole.equals(\"professor\") }">
					<tr>
						<td><a href="/evaluation/read"> 내 강의 평가</a></td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1> [${subject.name}] 학생 리스트 조회</h1>
		<div class="split--div"></div>
		<table border="1">
			<thead>
				<tr>
					<th>학생 번호</th>
					<th>이름</th>
					<th>소속</th>
					<th>결석</th>
					<th>지각</th>
					<th>과제점수</th>
					<th>중간시험</th>
					<th>기말시험</th>
					<th>환산점수</th>
					<th>점수 기입하기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${studentList}" var="student">
				<tr>
					<td>${student.studentId}</td>
					<td>${student.studentName}</td>
					<td>${student.deptName}</td>
					<td>${student.absent}</td>
					<td>${student.lateness}</td>
					<td>${student.homework}</td>
					<td>${student.midExam}</td>
					<td>${student.finalExam}</td>
					<td>${student.convertedMark}</td>
					<td><a href="/professor/detail/${subject.id}/${student.studentId}">기입</a></td>
				</tr>
				</c:forEach>
				
			</tbody>
		</table>

	</main>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>