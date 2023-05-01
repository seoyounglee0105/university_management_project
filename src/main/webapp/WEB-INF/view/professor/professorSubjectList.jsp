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
					<td><a href="/subject/list">전체 강의 조회</a></td>
				</tr>
				<tr>
					<td><a href="/professor/subject">내 강의 조회</a></td>
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
					<th>강의 상세보기</th>
					<th>학생 성적 기입</th>
				</tr>
			</thead>
			<c:forEach items="${subjectList}" var="subject">
				<tbody>
					<tr>
						<td>${subject.id}</td>
						<td>${subject.name}</td>
						<td>${subject.time}</td>
						<td><a href="/professor/syllabus/${subject.id}" onclick="window.open(this.href, '_blank', 'width=1000, height=1000'); return false;">강의 계획서</a></td>
						<td><a href="subject/${subject.id}">학생 리스트 보기</a></td>
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