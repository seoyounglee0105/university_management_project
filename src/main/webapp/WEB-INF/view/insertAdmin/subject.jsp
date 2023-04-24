<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- 세부 메뉴 + 메인 -->
<div class="d-flex"
	style="justify-content: center; align-items: flex-start; min-width: 100em;">
	<!-- 세부 메뉴 div-->
	<div
		style="background-color: #FFF7CD; width: 250px; height: 900px; min-width: 250px">
		<!-- 메뉴 -->
		<ul class="">
			<li class="nav-item"><a class="nav-link" href="/admin/college">단과대학</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/admin/department">학과</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/room">강의실</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/subject">강의</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/collTuit">단과대
					등록금</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/notice">공지사항</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">My
					Info</a></li>
		</ul>
		<div></div>

	</div>

	<!-- 메인 div -->
	<div style="background-color: #D7F3FE; width: 1200px; height: 900px; min-width: 1200px">
		<form action="/admin/subject-proc" method="post">
		<h2>등록할 강의를 입력해주세요</h2>
		강의명 <input type="text" name="name" value="스프링부트 뽀개기"><br>
		교수ID <input type="text" name="professorId" value="20231512"><br>
		강의실 <input type="text" name="roomId" value="C250"><br>
		학과ID <input type="text" name="deptId" value="1234"><br>
		구분 <input type="text" name="type" value="전공"><br>
		연도 <input type="text" name="subYear" value="2023"><br>
		학기 <input type="text" name="semester" value="1"><br>
		시간 <input type="text" name="time" value="수요일 10-12"><br>
		학점 <input type="text" name="grades" value="3"><br>
		정원 <input type="text" name="capacity" value="15"><br>
		
		<input type="submit" value="입력">
	</form>
	</div>
</div>

<footer>
	<!-- 필요 시 -->
</footer>