<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
.container {
	width: 700px;
}
.first--tr {
	background-color: #f7f6f6;
	font-weight: bolder;
	overflow: hidden;
	text-overflow: ellipsis;
}
#submit {
	background-color: #031734;
	color: #ccc;
	text-decoration: none;
	margin-left: 100px;
}
</style>
<!-- 세부 메뉴 + 메인 -->
<div class="d-flex justify-content-center align-items-start" style="min-width: 100em;">
	<!-- 세부 메뉴 div-->
	<div class="sub--menu">
		<div class="sub--menu--top">
			<h2>등록</h2>
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
					<td><a href="/admin/tuition">단대별 등록금</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>단과대학</h1>
		<div class="split--div"></div>	

			<!-- 단과대학 조회 -->
			<c:if test="${crud.equals(\"select\")}">
			<div class="container">
				<table class="table table-bordered table-sm">
				<thead class="thead-dark">
					<tr class="first--tr">
						<td>ID</td>
						<td>이름</td>
					</tr>
					</thead>
					<c:forEach var="college" items="${collegeList}">
						<tr>
							<td>${college.id}</td>
							<td>${college.name}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<c:if test="${principal.userRole.equals(\"staff\")}">
				<div class="select--button">
				<a href="/admin/college?crud=insert" class="btn btn-link" id="submit">등록</a> 
				<a href="/admin/college?crud=delete" class="btn btn-link" id="submit">삭제</a>
				</div>
			</c:if>
			</c:if>


			<!-- 단과대학 입력 -->
			<c:if test="${crud.equals(\"insert\")}">
				<form action="/admin/college" method="post" id="insert--form">
					<h5>단과대학을 등록해주세요</h5>
					이름 <input type="text" class="form-control form-control-sm" name="name" value="인문대학"> 
					<input type="submit" value="입력">
				</form>
				
				<div class="container">
					<table class="table table-bordered table-sm">
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
			</c:if>

			<!-- 단과대학 삭제 -->
			<c:if test="${crud.equals(\"delete\")}">
				<h5>삭제할 단과대학 이름을 클릭해주세요</h5>
				<div class="container">
					<table class="table table-bordered table-sm">
						<tr class="first--tr">
							<td>ID</td>
							<td>이름</td>
						</tr>
						<c:forEach var="college" items="${collegeList}">
							<tr>
								<td>${college.id}</td>
								<td><a href="/updAdmin/deCollege?id=${college.id}">${college.name}</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:if>
	</main>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>