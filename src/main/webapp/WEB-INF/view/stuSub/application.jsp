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

.sub--filter form {
	display: flex;
}

.sub--filter form div {
	background-color: buttonshadow;
	padding: 13px 13px 7px 10px;
}

.sub--filter input[type="number"] {
	width: 57px;
	padding-left: 3px;
}

.sub--filter select[name="deptId"] {
	width: 173px;
}

.sub--filter label {
	margin-right: 5px;
}

.sub--filter input, .sub--filter select {
	margin-right: 10px;
	border-radius: 5px;
	border-width: 1px;
}

.sub--filter button {
	background-color: gray;
	padding: 2px 6px;
	border: none;
	border-radius: 5px;
	color: white;
	height: 28px;
}

.sub--list--table td button {
	padding: 0px 4px;
	border: none;
	border-radius: 4px;
	width: 100%;
	color: white;
	height: 26px;
}

.sub--list--button--row {
	padding: 2px !important;
}

.preStuSubList--button {
	padding: 5px 10px;
	border: none;
	border-radius: 4px;
	color: white;
	background-color: gray;
	font-size: 20px;
	margin-right: 20px;
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
					<td><a href="/break/appList">휴학 내역 조회</a></td>
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
					<td><a href="/stuSub/preAppList?type=1" class="selected--menu">수강 신청</a></td>
				</tr>
				<tr>
					<td><a href="/stuSub/appList">수강 신청 내역 조회</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>수강 신청</h1>
		<div class="split--div"></div>

		<div class="d-flex justify-content-between align-items-center" style="margin-bottom: 50px;">
			<!-- 필터 및 검색 -->
			<div class="sub--filter">
				<form action="/stuSub/preApplication/Search" method="get">
					<div>
						<!-- 강의구분 콤보박스 -->
						<label for="type">강의구분</label> <select name="type" id="type">
							<option value="전체">전체</option>
							<option value="전공">전공</option>
							<option value="교양">교양</option>
						</select>
						<!-- 대상학과 콤보박스 -->
						<label for="deptId">개설학과</label> <select name="deptId" id="deptId">
							<option value="-1">전체</option>
							<c:forEach var="dept" items="${deptList}">
								<option value="${dept.id}">${dept.name}</option>
							</c:forEach>
						</select>
						<!-- 강의 검색 -->
						<label for="subName">강의명</label> <input type="text" name="name" list="subName">
						<datalist id="subName">
							<c:forEach var="subName" items="${subNameList}">
								<option value="${subName}">
							</c:forEach>
						</datalist>
						<!-- 검색 버튼 -->
						<button type="submit">
							<ul class="d-flex justify-content-center" style="margin: 0;">
								<li style="height: 24px; margin-right: 2px;">조회
								<li style="height: 24px;"><span class="material-symbols-outlined" style="font-size: 18px; padding-top: 4px;">search</span>
							</ul>
						</button>
					</div>
				</form>
			</div>

			<!-- 예비 수강 신청 내역으로 가기 -->
			<a href="/stuSub/preAppList?type=1"><button class="preStuSubList--button">예비 수강 신청 내역</button></a>
		</div>

		<h4>
			<span style="font-weight: 600;">강의 목록</span>&nbsp; <span style="color: gray; font-size: 18px;">[총 ${subjectList.size()}건]</span>
		</h4>
		<table border="1" class="sub--list--table">
			<thead>
				<tr>
					<th>단과대학</th>
					<th>개설학과</th>
					<th>학수번호</th>
					<th>강의구분</th>
					<th style="width: 250px;">강의명</th>
					<th>담당교수</th>
					<th>학점</th>
					<th>요일시간 (강의실)</th>
					<th>현재인원</th>
					<th>정원</th>
					<th>수강신청</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="subject" items="${subjectList}">
					<tr>
						<td>${subject.collName}</td>
						<td>${subject.deptName}</td>
						<td>${subject.id}</td>
						<td>${subject.type}</td>
						<td class="sub--list--name">${subject.name}</td>
						<td>${subject.professorName}</td>
						<td>${subject.grades}</td>
						<td>${subject.subDay}${subject.startTime}:00-${subject.endTime}:00&nbsp;(${subject.roomId})</td>
						<td>${subject.numOfStudent}</td>
						<td>${subject.capacity}</td>
						<td class="sub--list--button--row"><c:choose>
								<%-- 신청된 상태라면 --%>
								<c:when test="${subject.status == true}">
									<form action="/stuSub/deleteApp/${subject.id}?type=0" method="post">
										<input type="hidden" name="_method" value="delete">
										<button type="submit" onclick="return confirm('수강신청을 취소하시겠습니까?');" style="background-color: #a7a7a7;">취소</button>
									</form>
								</c:when>

								<%-- 정원이 가득 찬 상태라면 --%>
								<c:when test="${subject.numOfStudent >= subject.capacity}">
									<%-- 높이 맞추느라 버튼으로 함 --%>
									<button type="button" style="background-color: white; color: gray" disabled>신청마감</button>
								</c:when>

								<%-- 신청되지 않은 상태라면 --%>
								<c:otherwise>
									<form action="/stuSub/insertApp/${subject.id}?type=0" method="post">
										<button type="submit" onclick="return confirm('해당 강의를 수강신청하시겠습니까?');" style="background-color: #548AC2;">신청</button>
									</form>
								</c:otherwise>

							</c:choose></td>
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

