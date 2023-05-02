<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!-- 금학기 -->

<!-- 세부 메뉴 + 메인 -->
<div class="d-flex justify-content-center align-items-start" style="min-width: 100em;">
	<!-- 세부 메뉴 div-->
	<div class="sub--menu">
		<div class="sub--menu--top">
			<h2>MY</h2>
		</div>
		<!-- 메뉴 -->
		<div class="sub--menu--mid">
			<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/grade/thisSemester" class="selected--menu">금학기 성적 조회</a></td>
				</tr>
				<tr>
					<td><a href="/grade/semester">학기별 성적 조회</a></td>
				</tr>
				<tr>
					<td><a href="/grade/total">누계 성적</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>금학기 성적 조회</h1>
		<div class="split--div"></div>

			<c:choose>
				<%-- 수강연도 조회해서 검사 --%>
				<c:when test="${yearList.size() != 0}">	
				<div>
				<table border="1" class="tuition--table">
					<thead>
						<tr>
							<th>연도</th>
							<th>학기</th>
							<th>과목번호</th>
							<th>과목명</th>
							<th>강의구분</th>
							<th>이수학점</th>
							<th>학점<th>
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
									<td>${grade.grades}</td>
									<c:choose>
										<c:when test="${grade.evaluationId != null}">
											<td>${grade.grade}</td>
										</c:when>
										<c:otherwise>
											<td></td>
										</c:otherwise>
									</c:choose>
									<td><a href="/evaluation?subjectId=${grade.subjectId}" onclick="window.open(this.href, '_blank', 'width=1000, height=1000'); return false;">강의평가</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div>

				<br>
				<h1>누계 성적</h1>
				<div class="split--div"></div>
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
				<tr>
				<%-- 금학기 누계성적 --%>
				<td>${mygrade.subYear}년</td>
				<td>${mygrade.semester}학기</td>
				<td>${mygrade.sumGrades}</td>
				<td>${mygrade.myGrades}</td>
				<td>${mygrade.average()}</td>
				</tr>
				</tbody>
				</table>
				</div>
				</c:when>
				<c:otherwise>
				<p class="no--list--p">강의 신청 및 수강 이력 확인 바랍니다.</p>
				</c:otherwise>
				</c:choose>
			
				
	</main>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>

