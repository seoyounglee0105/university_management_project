<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- 세부 메뉴 + 메인 -->
<div class="d-flex justify-content-center align-items-start" style="min-width: 100em;">
	<!-- 세부 메뉴 div-->
	<div class="sub--menu">
		<div class="sub--menu--top">
			<h2>입력</h2>
		</div>
		<!-- 메뉴 -->
		<!-- 선택된 메뉴에 class="selected--menu" 추가해주세요 -->
		<div class="sub--menu--mid">
			<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/InsertAdmin/college">단과대학</a></td>
				</tr>
				<tr>
					<td><a href="/InsertAdmin/department">학과</a></td>
				</tr>
				<tr>
					<td><a href="/InsertAdmin/subject" class="selected--menu">강의</a></td>
				</tr>
				<tr>
					<td><a href="/InsertAdmin/room" >강의실</a></td>
				</tr>
				<tr>
					<td><a href="/InsertAdmin/collTuit">단대별 등록금</a></td>
				</tr>
				<tr>
					<td><a href="/admin/notice">공지사항</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>강의</h1>
		<div class="split--div"></div>
		<table>
			<tr>
				<td> ID </td>
				<td> 강의명 </td>
				<td> 교수 </td>
				<td> 강의실 </td>
				<td> 학과ID </td>
				<td> 구분 </td>
				<td> 연도 </td>
				<td> 학기 </td>
				<td> 시간 </td>
				<td> 이수학점 </td>
				<td> 정원 </td>
				<td> 신청인원 </td>
			</tr>
			<c:forEach var="subject" items="${subjectList}">
				<tr>
					<td>${subject.id}</td>
					<td>${subject.name}</td>
					<td>${subject.professorId}</td>
					<td>${subject.roomId}</td>
					<td>${subject.deptId}</td>
					<td>${subject.type}</td>
					<td>${subject.subYear}</td>
					<td>${subject.semester}</td>
					<td>${subject.grades}</td>
					<td>${subject.capacity}</td>
					<td>${subject.numOfStudent}</td>
				</tr>
			</c:forEach>
		</table>
	</main>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>