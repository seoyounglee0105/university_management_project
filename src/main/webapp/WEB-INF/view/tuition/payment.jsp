<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

.document--layout {
	border: 1px solid #4c4b4b;
	padding: 50px 30px 30px 30px;
	text-align: center;
	margin-bottom: 30px;
}

.document--layout h3 {
	font-weight: 600;
}

.document--layout > p {
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
			<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/tuition/list">등록금 내역 조회</a></td>
				</tr>
				<tr>
					<td><a href="/tuition/payment" class="selected--menu">등록금 납부 고지서</a></td>
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
			</table>
				</div>
			</div>
			
			<!-- 메인 div -->
			<main>
				<h1>등록금 납부 고지서</h1>
				<div class="split--div"></div>
				
				<div class="d-flex flex-column align-items-center" style="width: 100%">
					<div class="document--layout">
						<h3>등록금 고지서</h3>
						<p>${tuition.tuiYear}년도 ${tuition.semester}학기</p>
					<table class="tuition--payment--table" border="1">
						<thead>
							<tr>
								<th>단 과 대</th>
								<td>공과대학</td> <!-- 여기 고쳐야 함 !  -->
								<th>학 과</th>
								<td>산업공학과</td> <!-- 여기 고쳐야 함 !  -->
							</tr>
							<tr>
								<th>학 번</th>
								<td>${tuition.studentId}</td>
								<th>성 명</th>
								<td>홍길동</td> <!-- 여기 고쳐야 함 !  -->
							</tr>
						</thead>
						<tbody>
							<tr>
								<th colspan="2">장 학 유 형</th>
								<td colspan="2">${tuition.schType}유형</td>
							</tr>
							<tr>
								<th colspan="2">등 록 금</th>
								<td colspan="2">${tuition.tuiFormat()}</td>
							</tr>
							<tr>
								<th colspan="2">장 학 금</th>
								<td colspan="2">${tuition.schFormat()}</td>
							</tr>
							<tr>
								<th colspan="2">납 부 금</th>
								<td colspan="2">${tuition.paymentFormat()}</td>
							</tr>
							<tr>
								<th colspan="2">납 부 계 좌</th>
								<td colspan="2">그린은행 483-531345-536</td>
							</tr>
							<tr>
								<th colspan="2">납 부 기 간</th>
								<td colspan="2">~ 2023.05.02</td>
							</tr>
							
						</tbody>
					</table>
					</div>
					
					<c:choose>
						<c:when test="${tuition.status == true}">
							<p>이번 학기 등록금 납부가 완료되었습니다.</p>
						</c:when>
						<c:otherwise>
							<form action="/tuition/payment" method="post">
								<button type="submit" class="btn btn-dark" onclick="return confirm('등록금을 납부하시겠습니까?')">납부하기</button>
							</form>
						</c:otherwise>
					</c:choose>
					
				</div>
			</main>
		</div>
		
	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
	
	</div>

</body>
</html>

