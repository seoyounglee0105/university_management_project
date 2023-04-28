<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.tuition--table th {
	padding: 3px 12px;
	width: 150px;
}

.tuition--table td {
	padding: 1px 5px;
}

.select_box {
	display: flex;
}

.select_box select {
	margin-top: 50px;
	margin-left: 20px;
}
</style>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- 등록금 내역 조회 -->

<!-- 세부 메뉴 + 메인 -->
<div class="d-flex justify-content-center align-items-start"
	style="min-width: 100em;">
	<!-- 세부 메뉴 div-->
	<div class="sub--menu">
		<div class="sub--menu--top">
			<h2>MY</h2>
		</div>
		<!-- 메뉴 -->
		<div class="sub--menu--mid">
				<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/grade/thisSemester" class="selected--menu">금학기 성적조회</a></td>
				</tr>
				<tr>
					<td><a href="/grade/semester">학기별 성적조회</a></td>
				</tr>
				<tr>
					<td><a href="/grade/total">누계 성적</a></td>
				</tr>
			</table>
		</div>
	</div>
	<!-- type: 연도 학기 전공 -->
	<!-- 메인 div -->
	<main>
		<h1>학기 별 조회</h1>
		<div class="split--div"></div>
		<c:choose>
			<%-- 내가 수강신청 했는정보 연도있는지 비교 --%>
			<c:when test="${yearList.size() != 0}">
				<div class="select_box">
					<form action="/grade/check" method="post">
						<select name="subYear">
							<c:forEach var="grade" items="${yearList}">
								<option value="${grade.subYear}">${grade.subYear}년</option>
							</c:forEach>
						</select> <select name="sesmeter">
							<c:forEach var="grade" items="${semesterList}">
							<option value="${grade.semester}">${grade.semester}학기</option>
							</c:forEach>
						</select> <select name="type">
							<option value="전체">전체</option>
							<option value="전공">전공</option>
							<option value="교양">교양</option>
						</select> <input type="submit" value="조회">
					</form>
				</div>
				<div class="split--div"></div>
				<table border="1" class="tuition--table">
					<thead>
						<tr>
							<th>연도</th>
							<th>학기</th>
							<th>과목번호</th>
							<th>과목명</th>
							<th>강의구분</th>
							<th>학점</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="grade" items="${gradeList}">
							<tr>
								<td>${grade.subYear}년</td>
								<td>${grade.semester}학기</td>
								<td>${grade.subjectId}</td>
								<td>${grade.name}</td>
								<td>${grade.type}</td>
								<td>${grade.grade}</td>
							</tr>
						</c:forEach>
					
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<h1>조회할 과목이 없습니다.</h1>
			</c:otherwise>
		</c:choose>
		<br>
		<br>
	

	</main>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>

