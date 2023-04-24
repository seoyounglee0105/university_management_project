<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

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
					<td><a href="/admin/college">단과대학</a></td>
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
					<td><a href="/admin/collTuit" class="selected--menu">단대별
							등록금</a></td>
				</tr>
				<tr>
					<td><a href="/admin/notice">공지사항</a></td>
				</tr>
			</table>
		</div>
	</div>
	<main>
		<h1>단대별 등록금</h1>
		<div class="split--div"></div>
		<form action="/admin/collTuit-proc" method="post">
			<h2>단과대학을 선택 후 등록금을 입력해주세요</h2>
			단과대학 
				<select name="collegeId">
					<c:forEach var="college" items="${collegeList}">
						<option value="${college.id},${college.name}">${college.name}</option>
					</c:forEach>
				</select>
			등록금 <input type="text" name="amount" value="2500000"> <input type="submit" value="입력">
		</form>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>