<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>

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
<div class="d-flex justify-content-center align-items-start" style="min-width: 100em;">
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
					<td><a href="/admin/college">단과대학</a></td>
				</tr>
				<tr>
					<td><a href="/admin/department">학과</a></td>
				</tr>
				<tr>
					<td><a href="/admin/subject">강의</a></td>
				</tr>
				<tr>
					<td><a href="/admin/room" class="selected--menu">강의실</a></td>
				</tr>
				<tr>
					<td><a href="/admin/collTuit">단대별 등록금</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>강의실</h1>
		<div class="split--div"></div>

			<div>
				<a href="/admin/room?crud=insert">등록</a> 
				<a href="/admin/room?crud=delete">삭제</a>
			</div>


			<!-- 강의 입력 -->
			<c:if test="${crud.equals(\"insert\")}">
				<form action="/admin/room-proc" method="post" id="insert--form">
					<h5>등록할 강의실을 입력해주세요</h5>
						강의실 <input type="text" name="id" value="C250"> 
						단과대ID <input type="text" name="collegeId" value="1"> 
						<input type="submit" value="입력">
				</form>
				<table class="room--table">
					<tr class="first--tr">
						<td>강의실</td>
						<td>단과대ID</td>
					</tr>
					<c:forEach var="room" items="${roomList}">
						<tr>
							<td>${room.id}</td>
							<td>${room.collegeId}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>

			<!-- 강의 삭제 -->
			<c:if test="${crud.equals(\"delete\")}">
				<h5>삭제할 강의실을 클릭해주세요</h5>
					<table class="room--table">
						<tr class="first--tr">
							<td>강의실</td>
							<td>단과대ID</td>
						</tr>
					<c:forEach var="room" items="${roomList}">
						<tr>
							<td><a href="/updAdmin/deRoom?id=${room.id}">${room.id}</a></td>
							<td>${room.collegeId}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>


			<!-- 강의 조회 -->
			<c:if test="${crud.equals(\"select\")}">
				<table class="room--table">
					<tr class="first--tr">
						<td>강의실</td>
						<td>단과대ID</td>
					</tr>
					<c:forEach var="room" items="${roomList}">
						<tr>
							<td>${room.id}</td>
							<td>${room.collegeId}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
	</main>

			<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
		</div>
		</body>
		</html>