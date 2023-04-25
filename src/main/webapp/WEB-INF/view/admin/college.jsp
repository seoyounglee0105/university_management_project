<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
.split--div {
	display: flex;
	flex-direction: column;
	align-items: center;
}

#insert--form {
	padding: 50px;
}

.college--table {
	border: 1px solid gray;
	text-align: center;
	width: 500px;
	margin-top: 20px;
	margin: 10px;
}

.college--table tr {
	border: 1px solid black;
}

.college--table td {
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
			<h2>수업</h2>
		</div>
		<!-- 메뉴 -->
		<!-- 선택된 메뉴에 class="selected--menu" 추가해주세요 -->
		<div class="sub--menu--mid">
			<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/admin/college" class="selected--menu">단과대학</a></td>
				</tr>
				<tr>
					<td><a href="/admin/department">학과</a></td>
				</tr>
				<tr>
					<td><a href="/admin/subject">강의</a></td>
				</tr>
				<tr>
					<td><a href="/admin/room">강의실</a></td>
				</tr>
				<tr>
					<td><a href="/admin/collTuit">단대별 등록금</a></td>
				</tr>
				<tr>
					<td><a href="/admin/notice">공지사항</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>단과대학</h1>
		<div class="split--div">
		<div>
				<a href="/admin/college?crud=insert">등록</a> 
				<a href="/admin/college?crud=update">수정</a> 
				<a href="/admin/college?crud=delete">삭제</a>
			</div>
		<c:if test="${crud.equals(\"insert\")}">
				<form action="/admin/college-proc" method="post" id="insert--form">
						<h5>단과대학을 등록해주세요</h5>
						이름 <input type="text" name="name" value="인문대학"> 
						<input type="submit" value="입력">
					</form>
			</c:if>
			<c:if test="${crud.equals(\"update\")}">
				<form action="/admin/college-proc" method="post" id="insert--form">
						<h5>단과대학을 등록해주세요</h5>
						이름 <input type="text" name="name" value="인문대학"> 
						<input type="submit" value="입력">
					</form>
			</c:if>
			<c:if test="${crud.equals(\"delete\")}">
				<form action="/admin/college-proc" method="post" id="insert--form">
						<h5>단과대학을 등록해주세요</h5>
						이름 <input type="text" name="name" value="인문대학"> 
						<input type="submit" value="입력">
					</form>
			</c:if>
			<table class="college--table" border="1">
				<tr class="first--tr">
					<td>ID</td>
					<td>이름</td>
				</tr>
				<c:forEach var="college" items="${collegeList}">
					<tr>
						<td>${college.id}</td>
						<td>${college.name}</td>
					</tr>
				</c:forEach>
			</table>

			
			
			
		</div>
	</main>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>