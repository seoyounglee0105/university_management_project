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
		<form action="/admin/college-proc" method="post">
			<h2>단과대학 이름을 입력해주세요</h2>
			이름 <input type="text" name="name" value="인문대학"> 
				<input type="submit" value="입력">
		</form>
	</div>
</div>

<footer>
	<!-- 필요 시 -->
</footer>


