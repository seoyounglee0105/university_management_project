<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
.sub--list--table th {
	padding: 3px 9px;
	text-align: center;
}

.sub--list--table td {
	padding: 1px 9px;
	text-align: center;
}

.sub--list--name {
	text-align: left !important;
	padding-right: 20px !important;
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
					<td><a href="/stuSub/list" class="selected--menu">강의 시간표 조회</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>강의 시간표 조회 (수강신청 관련이라서 현재 연도-학기만)</h1>
		<div class="split--div"></div>
		<!-- 여기에 내용 넣기 -->
		
		<!-- 필터 및 검색 -->
		<div>
		
		</div>
		
		<table border="1" class="sub--list--table">
			<thead>
				<tr>
					<th>단과대학</th>
					<th>대상학과</th>
					<th>학수번호</th>
					<th>교과구분</th>
					<th>강의명</th>
					<th>담당교수</th>
					<th>학점</th>
					<th>요일시간 (강의실)</th>
					<th>현재인원</th>
					<th>정원</th>
					<th>강의계획서</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="subject" items="${subjectList}">
					<tr>
						<td>${subject.collName}</td>
						<td class="sub--list--dept--name">${subject.deptName}</td>
						<td>${subject.id}</td>
						<td>${subject.type}</td>
						<td class="sub--list--name">${subject.name}</td>
						<td>${subject.professorName}</td>
						<td>${subject.grades}</td>
						<td>${subject.time}&nbsp;(${subject.roomId})</td>
						<td>${subject.numOfStudent}</td>
						<td>${subject.capacity}</td>
						<td>
							<!-- 높이가 안 맞아서 어쩔 수 없이 li로 연결함.. -->
							<ul class="d-flex justify-content-center" style="margin: 0;">
								<li style="height: 24px;"><a href="#">조회</a>
								<li style="height: 24px;"><a href="#"><span class="material-symbols-outlined">content_paste_search</span></a>
							</ul>
						</td>
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

