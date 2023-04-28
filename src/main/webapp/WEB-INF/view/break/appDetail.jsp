<%@page import="com.green.university.utils.DateUtil"%>
<%@page import="com.green.university.utils.Define"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 휴복학 신청 내역에서 신청서 확인 버튼을 누르면 들어오는 상세 페이지 -->

<style>
.document--layout {
	border: 1px solid #4c4b4b;
	padding: 50px 30px 30px 30px;
	text-align: center;
	margin-bottom: 30px;
}

.document--layout h3 {
	font-weight: 600;
	margin-bottom: 30px;
}

.document--layout th {
	text-align: center;
	padding: 2px 20px;
}

.document--layout td {
	text-align: right;
	padding: 2px 8px 2px 50px;
}

.document--layout tr:last-of-type td {
	padding: 18px 8px 2px;
}
</style>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- 세부 메뉴 + 메인 -->
<div class="d-flex justify-content-center align-items-start" style="min-width: 100em;">
	<!-- 세부 메뉴 div-->
	<div class="sub--menu">
		<div class="sub--menu--top">
			<h2>등록</h2>
		</div>
		<!-- 메뉴 -->
		<!-- 선택된 메뉴에 class="selected--menu" 추가해주세요 -->
		<div class="sub--menu--mid">
			<%-- 학생인지 교직원인지에 따라 나중에 카테고리 바뀌게 해야 함 --%>
			<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/tuition/list">등록금 내역 조회</a></td>
				</tr>
				<tr>
					<td><a href="/tuition/payment">등록금 납부 고지서</a></td>
				</tr>
				<tr>
					<td><a href="/break/application">휴학 신청</a></td>
				</tr>
				<tr>
					<td><a href="/break/appList" class="selected--menu">휴학 내역 조회</a></td>
				</tr>
				<tr>
					<td><a href="/break/appListStaff">휴학 신청 처리(staff)</a></td>
				</tr>
				<tr>
					<td><a href="/tuition/create">고지서 생성(staff)</a></td>
				</tr>
				<tr>
					<td><a href="/subject/list">전체 강의 조회</a></td>
				</tr>
				<tr>
					<td><a href="/stuSub/list">강의 시간표 조회</a></td>
				</tr>
				<tr>
					<td><a href="/stuSub/preApplication">예비 수강 신청</a></td>
				</tr>
				<tr>
					<td><a href=/stuSub/preAppList?type=1>수강 신청</a></td>
				</tr>
				<tr>
					<td><a href="/stuSub/appList">수강 신청 내역 조회</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>휴학 내역 조회</h1>
		<div class="split--div"></div>

		<div class="d-flex flex-column align-items-center" style="width: 100%">
			<div class="document--layout">
				<h3>휴학 신청서</h3>
				<table border="1">
					<tr>
						<th>단 과 대</th>
						<td>${collName}</td>
						<th>학 과</th>
						<td>${deptName}</td>
					</tr>
					<tr>
						<th>학 번</th>
						<td>${student.id}</td>
						<th>학 년</th>
						<td>${breakApp.studentGrade}학년</td>
					</tr>
					<tr>
						<th>전 화 번 호</th>
						<td>${student.tel}</td>
						<th>성 명</th>
						<td>${student.name}</td>
					</tr>
					<tr>
						<th>주 소</th>
						<td colspan="3">${student.address}</td>
					</tr>
					<tr>
						<th>기 간</th>
						<td colspan="3">${breakApp.fromYear}년도 ${breakApp.fromSemester}학기부터&nbsp; ${breakApp.toYear}년도 ${breakApp.toSemester}학기까지</td>
					</tr>
					<tr>
						<th>휴 학 구 분</th>
						<td colspan="3">${breakApp.type}휴학</td>
					</tr>
					<tr>
						<td colspan="4">
							<p>위와 같이 휴학하고자 하오니 허가하여 주시기 바랍니다.</p> <br>
							<p>${breakApp.appDateFormat()}</p>
						</td>
					</tr>
				</table>
			</div>

			<!-- todo : '처리중'이고 학생으로 로그인되어 있으면 취소할 수 있게 취소 버튼 -->
			<!-- todo : '처리중'이고 교직원으로 로그인되어 있으면 해당 신청서에 대해 처리하는 승인/거부 버튼  -->
			<c:if test="${breakApp.status.equals(\"처리중\")}">
				<c:choose>
					<c:when test="${principal.userRole.equals(\"student\")}">
						<form action="/break/delete/${breakApp.id}" method="post" class="d-flex flex-column align-items-center">
							<button type="submit" class="btn btn-dark" onclick="return confirm('신청을 취소하시겠습니까?')">취소하기</button>
						</form>
					</c:when>
					<c:when test="${principal.userRole.equals(\"staff\")}">
						<div class="d-flex jusitify-contents-center">
							<form action="/break/update/${breakApp.id}" method="post" class="d-flex flex-column align-items-center">
								<input type="hidden" name="status" value="승인">
								<button type="submit" class="btn btn-dark" onclick="return confirm('해당 신청을 승인하시겠습니까?')">승인하기</button>
							</form>
							&nbsp; &nbsp; &nbsp;
							<form action="/break/update/${breakApp.id}" method="post" class="d-flex flex-column align-items-center">
								<input type="hidden" name="status" value="반려">
								<button type="submit" class="btn btn-dark" onclick="return confirm('해당 신청을 반려하시겠습니까?')">반려하기</button>
							</form>
						</div>
					</c:when>
				</c:choose>
			</c:if>

		</div>
	</main>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>

