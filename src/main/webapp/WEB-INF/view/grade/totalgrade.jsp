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

<!-- 총 누계 성적 -->

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
					<td><a href="/grade/thisSemester" >금학기 성적 조회</a></td>
				</tr>
				<tr>
					<td><a href="/grade/semester">학기별 성적 조회</a></td>
				</tr>
				<tr>
					<td><a href="/grade/total" class="selected--menu">누계 성적</a></td>
				</tr>
			</table>
		</div>
	</div>
	<!-- type: 연도 학기 전공 -->
	<!-- 메인 div -->
	<main>
		<h1>총 누계 성적</h1>
		<div class="split--div"></div>
		<c:choose>
			<c:when test="${yearList.size() != 0}">
				<table border="1" class="tuition--table">
					<thead>
						<tr>
							<th>연도</th>
							<th>학기</th>
							<th>신청학점</th>
							<th>취득학점</th>
							<th>평점평균</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="mygrade" items="${mygradeList}">
							<tr>
								<td>${mygrade.subYear}년</td>
								<td>${mygrade.semester}학기</td>
								<td>${mygrade.sumGrades}</td>
								<td>${mygrade.myGrades}</td>
								<td>${mygrade.average()}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<p class="no--list--p">강의 신청 및 수강 이력 확인 바랍니다.</p>
			</c:otherwise>
		</c:choose>
		<br> <br>


	</main>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>

