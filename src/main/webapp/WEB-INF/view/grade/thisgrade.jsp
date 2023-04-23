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
					<td><a href="/grade/list">금학기 성적조회</a></td>
				</tr>
				<tr>
					<td><a href="/grade/thisgrade" class="selected--menu">학기별 성적조회</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>성적 조회</h1>
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
							<th>평점</th>
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
								<td>${grade.gradeValue}</td>
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

