<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

#insert--form {
	padding: 50px;
}

.room--table {
	border: 1px solid gray;
	text-align: center;
	width: 500px;
	margin-top: 20px;
	margin: 10px;
}

.room--table tr {
	border: 1px solid black;
}

.room--table td {
	border: 1px solid black;
}

.first--tr {
	font-weight: bold;
}
</style>
<!-- 세부 메뉴 + 메인 -->
<div class="d-flex justify-content-center align-items-start"
	style="min-width: 100em;">
	<!-- 세부 메뉴 div-->
	<div class="sub--menu">
		<div class="sub--menu--top">
			<h2>강의실</h2>
		</div>
		<!-- 메뉴 -->
		<!-- 선택된 메뉴에 class="selected--menu" 추가해주세요 -->
		<div class="sub--menu--mid">
			<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/notice">공지사항</a></td>
				</tr>
				<tr>
					<td><a href="/scheule/main">학사일정</a></td>				
				</tr>
			</table>
		</div>
	</div>
	<!-- 메인 div -->

	<main>

	<h1>학사 일정</h1>
	<div class="split--div"></div>
	<table class="room--table">
	 <tr>
	 <td rowspan="3">3월</td>
	 <td>3/2 ~ 3/8</td>
	 <td>2023 1학기 개강</td>
	 </tr>
	 <tr>
	 <td>3/2 ~ 3/8</td>
	 <td>2023 1학기 개강</td>
	 </tr>
	  <tr>
	 <td>3/2 ~ 3/8</td>
	 <td>2023 1학기 개강</td>
	 </tr>
	  <tr>
	 <td rowspan="3">4월</td>
	 <td>3/2 ~ 3/8</td>
	 <td>2023 1학기 개강</td>
	 </tr>
	 <tr>
	 <td>3/2 ~ 3/8</td>
	 <td>2023 1학기 개강</td>
	 </tr>
	  <tr>
	 <td>3/2 ~ 3/8</td>
	 <td>2023 1학기 개강</td>
	 </tr>
	  <tr>
	 <td rowspan="3">5월</td>
	 <td>3/2 ~ 3/8</td>
	 <td>2023 1학기 개강</td>
	 </tr>
	 <tr>
	 <td>3/2 ~ 3/8</td>
	 <td>2023 1학기 개강</td>
	 </tr>
	  <tr>
	 <td>3/2 ~ 3/8</td>
	 <td>2023 1학기 개강</td>
	 </tr>
	  <tr>
	 <td rowspan="3">6월</td>
	 <td>3/2 ~ 3/8</td>
	 <td>2023 1학기 개강</td>
	 </tr>
	 <tr>
	 <td>3/2 ~ 3/8</td>
	 <td>2023 1학기 개강</td>
	 </tr>
	  <tr>
	 <td>3/2 ~ 3/8</td>
	 <td>2023 1학기 개강</td>
	 </tr>
	 
	 
	</table>
	<button>등록</button>
	<button>수정</button>
	<button>삭제</button>
	</main>

	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>




