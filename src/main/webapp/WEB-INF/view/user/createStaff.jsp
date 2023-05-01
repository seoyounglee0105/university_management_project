<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
form {
	margin-left: 30px;
}

.input--table td {
	padding: 5px 10px;
}

button {
	padding: 8px 20px;
	border: none;
	border-radius: 5px;
	box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.5);
	margin-top: 20px;
}

.button-td {
	text-align: center;
}
</style>

<!-- 세부 메뉴 + 메인 -->
<div class="d-flex justify-content-center align-items-start" style="min-width: 100em;">
	<!-- 세부 메뉴 div-->
	<div class="sub--menu">
		<div class="sub--menu--top">
			<h2>학사관리</h2>
		</div>
		<!-- 메뉴 -->
		<!-- 선택된 메뉴에 class="selected--menu" 추가해주세요 -->
		<div class="sub--menu--mid">
			<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/user/studentList">학생 명단 조회</a></td>
				</tr>
				<tr>
					<td><a href="/user/professorList">교수 명단 조회</a></td>
				</tr>
				<tr>
					<td><a href="/user/student">학생 등록</a></td>
				</tr>
				<tr>
					<td><a href="/user/professor">교수 등록</a></td>
				</tr>
				<tr>
					<td><a href="/user/staff" class="selected--menu">직원 등록</a></td>
				</tr>
				<tr>
					<td><a href="/tuition/bill">등록금 고지서 발송</a></td>
				</tr>
				<tr>
					<td><a href="/break/list/staff">휴학 처리</a></td>
				</tr>
				<tr>
					<td><a href="/sugang/period">수강 신청 기간 설정</a></td>
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
			<table class="input--table">
				<tr>
					<td><label for="name">이름</label></td>
					<td><input type="text" name="name" id="name" value="나나나"></td>
				</tr>
				<tr>
					<td><label for="birthDate">생년월일</label></td>
					<td><input type="date" name="birthDate" id="birthDate" value="1999-09-09"></td>
				</tr>
				<tr>
					<td style="padding-top: 7px"><label>성별</label></td>
					<td style="padding-top: 7px"><label for="male">남성</label> <input type="radio" value="M" name="gender" id="male" checked="checked"> &nbsp;<label for="female">여성</label> <input
						type="radio" value="F" name="gender" id="female"></td>
				</tr>
				<tr>
					<td><label for="address">주소</label></td>
					<td><input type="text" name="address" id="address" value="부산시"></td>
				</tr>
				<tr>
					<td><label for="tel">전화번호</label></td>
					<td><input type="text" name="tel" id="tel" value="010-4525-4545"></td>
				</tr>
				<tr>
					<td><label for="email">이메일</label></td>
					<td><input type="text" name="email" id="email" value="zxc@test.com"></td>
				</tr>
				<tr>
					<td colspan="2" class="button-td">
						<button type="submit">입력</button>
					</td>
				</tr>
			</table>
		</form>
	</main>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>