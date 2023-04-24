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
					<td><a href="#">내 정보 조회</a></td>
				</tr>
				<tr>
					<td><a href="#">비밀번호 변경</a></td>
				</tr>
				<tr>
					<td><a href="#">등록금 내역 조회</a></td>
				</tr>
				<tr>
					<td><a href="#" class="selected--menu">등록금 납부 고지서</a></td>
				</tr>
				<tr>
					<td><a href="#">세부 메뉴 5</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>직원 입력창</h1>
		<div class="split--div"></div>
		<!-- 여기에 내용 넣기 -->
		<form action="/user/staff" method="post">
			<div>
				<label for="name">이름</label><input type="text" name="name" id="name">
			</div>
			<div>
				<label for="birthDate">생년월일</label><input type="date" name="birthDate" id="birthDate">
			</div>
			<div>
				<label for="male">남성</label> <input type="radio" value="M" name="gender" id="male"> <label for="female">여성</label> <input type="radio" value="F" name="gender" id="female">
			</div>
			<div>
				<label for="address">주소</label><input type="text" name="address" id="address">
			</div>
			<div>
				<label for="tel">전화번호</label><input type="text" name="tel" id="tel">
			</div>

			<div>
				<button type="submit">입력</button>
			</div>
		</form>
	</main>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>