<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/css/admin.css">
<style>
.container {
	margin-bottom: 20px;
}
.select--button {
	margin-left: 200px;
}
.input--box {
	margin-left: 10px;
}
table th:hover {
	cursor: pointer;
}
.textarea {
	border: 1px solid #D2D1D1;
}
</style>
<div class="d-flex justify-content-center align-items-start" style="min-width: 100em;">
	<div class="sub--menu">
		<div class="sub--menu--top">
			<h2>강의실</h2>
		</div>
		<div class="sub--menu--mid">
			<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/notice">공지사항</a></td>
				</tr>
				<tr>
					<td><a href="/schedule">학사일정</a></td>
				</tr>
				<c:if test="${principal.userRole.equals(\"staff\") }">
					<tr>
						<td><a href="/schedule/list" class="selected--menu"> 학사일정 등록</a></td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>

	<main>
		<h1>학사 일정</h1>
		<div class="split--div"></div>
		<c:if test="${crud.equals(\"select\") }">
			<div class="container">
				<table class="table--container">
						<c:forEach var="schedule" items="${schedule}">
							<tr onclick="location.href='/schedule/detail?id=${schedule.id}';">
								<td>${schedule.id}</td>
								<td>${schedule.startDay}~${schedule.endDay}</td>
								<th>${schedule.title}</th>
							</tr>
						</c:forEach>
				</table>
			</div>
			<div class="select--button">
				<a href="/schedule/list?crud=insert" class="button">등록</a>
			</div>
		</c:if>
		<c:if test="${crud.equals(\"insert\") }">
			<br>
			<form action="/schedule/write" method="post" class="form--container">
				<label>시작일자 : 
				<input type="date" name="startDay" class="input--box"></label><br>
				<label>종료일자 : 
				<input type="date" name="endDay" class="input--box"></label> <br>
				<label>제목<input type="text" name="title" class="input--box" ></label> <br>
				<textarea rows="10" cols="30" name="content" placeholder="내용을 입력하세요" class="textarea"></textarea>
				<input type="submit" class="button" value="등록">
			</form>
		</c:if>

		<c:if test="${crud.equals(\"delete\") }">
			<table border="1" class="tuition--table">
				<thead>
					<tr>
						<th>ID</th>
						<th>날짜</th>
						<th>제목</th>
						<th colspan="2">내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="schedule" items="${schedule}">
							<tr>
								<td>${schedule.id}</td>
								<td>${schedule.startDay}~${schedule.endDay}</td>
								<td>${schedule.title}</td>
								<td>${schedule.content}</td>
								<td><a href="/schedule/delete?id=${schedule.id}">삭제</a></td>
							</tr>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</c:if>

	</main>
	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>






