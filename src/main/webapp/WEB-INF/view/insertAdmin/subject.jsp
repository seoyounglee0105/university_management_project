<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- 세부 메뉴 + 메인 -->
<div class="d-flex justify-content-center align-items-start" style="min-width: 100em;">
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
					<td><a href="/admin/college" >단과대학</a></td>
				</tr>
				<tr>
					<td><a href="/admin/department" >학과</a></td>
				</tr>
				<tr>
					<td><a href="/admin/subject" class="selected--menu">강의</a></td>
				</tr>
				<tr>
					<td><a href="/admin/room" >강의실</a></td>
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
		<main>
		<h1>강의</h1>
		<div class="split--div"></div>
		<form action="/admin/subject-proc" method="post">
		<h2>등록할 강의를 입력해주세요</h2>
		<label for="name">강의명</label>
		 <input type="text" id="name" name="name" value="스프링부트 뽀개기"><br>
		교수ID <input type="text" name="professorId" value="20231512"><br>
		강의실 <input type="text" name="roomId" value="C250"><br>
		학과ID <input type="text" name="deptId" value="1234"><br>
		구분 
			<label for="major">전공</label>
				<input type="radio" id="major" name="type" value="전공">
			<label for="culture">교양</label>
				 <input type="radio" id="culture" name="type" value="교양"><br>
		연도 <input type="text" name="subYear" value="2023"><br>
		학기 <input type="text" name="semester" value="1"><br>
		시간 <input type="text" name="time" value="수요일 10-12"><br>
		학점 <input type="text" name="grades" value="3"><br>
		정원 <input type="text" name="capacity" value="15"><br>
		
		<input type="submit" value="입력">
	</form>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>
