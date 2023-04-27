<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

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
					<td><a href="/stuSub/preApplication">예비 수강신청</a></td>
				</tr>
				<tr>
					<td><a href="/stuSub/application" class="selected--menu">수강신청</a></td>
				</tr>
				<tr>
					<td><a href="/stuSub/appList">수강신청 내역 조회</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>수강신청</h1>
		<div class="split--div"></div>
		<!-- 여기에 내용 넣기 -->




	</main>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>

