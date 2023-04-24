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
					<td><a href="/user/student">학생 ID 생성</a></td>
				</tr>
				<tr>
					<td><a href="/user/professor">교수 ID 생성</a></td>
				</tr>
				<tr>
					<td><a href="/user/staff">직원 ID 생성</a></td>
				</tr>
				<tr>
					<td><a href="/update" class="selected--menu">개인 정보 수정</a></td>
				</tr>
				<tr>
					<td><a href="#">패스워드 변경</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>개인 정보 수정</h1>
		<div class="split--div"></div>
		<form action="/update" method="post">
			<div>
				<label for="address">주소</label><input type="text" name="address" id="address" value="${userInfo.address}">
			</div>
			<div>
				<label for="tel">전화번호</label><input type="text" name="tel" id="tel" value="${userInfo.tel}">
			</div>
			<div>
				<label for="email">이메일</label><input type="text" name="email" id="email" value="${userInfo.email}">
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