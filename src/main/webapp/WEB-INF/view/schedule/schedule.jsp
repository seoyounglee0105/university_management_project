<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {

		$(".month").each(function() {
			var tempString = $(this).text();
			var month_rows = $(".month").filter(function() {
				return $(this).text() == tempString;
			});
			if (month_rows.length > 1) {
				month_rows.eq(0).attr("rowspan", month_rows.length);
				month_rows.not(":eq(0)").remove();
			}
		});
	});
</script>
<link rel="stylesheet" href="/css/admin.css">
<style>
</style>
<div class="d-flex justify-content-center align-items-start" style="min-width: 100em;">
	<div class="sub--menu">
		<div class="sub--menu--top">
			<h2>학사정보</h2>
		</div>
		<div class="sub--menu--mid">
			<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/notice">공지사항</a></td>
				</tr>
				<tr>
					<td><a href="/schedule" class="selected--menu">학사일정</a></td>
				</tr>
				<c:if test="${principal.userRole.equals(\"staff\") }">
					<tr>
						<td><a href="/schedule/list"> 학사일정 등록</a></td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>

	<main>
		<h1>학사일정</h1>
		<div class="split--div"></div>

			<table class="table--container">
				<tbody>
					<c:forEach var="schedule" items="${schedule}">
						<tr>
							<td class="month" width="100px;">${schedule.month}월</td>
							<td>${schedule.startDay}~${schedule.endDay}</td>
							<td onclick="location.href='/schedule/detail?id=${schedule.id}';">${schedule.title}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>

	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>




