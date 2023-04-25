<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

.department--table {
	border: 1px solid gray;
	text-align: center;
	width: 500px;
	margin-top: 20px;
	margin: 10px;
}

.department--table tr {
	border: 1px solid black;
}

.department--table td {
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
			<h2>학과</h2>
		</div>
		<!-- 메뉴 -->
		<!-- 선택된 메뉴에 class="selected--menu" 추가해주세요 -->
		<div class="sub--menu--mid">
			<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/admin/college">단과대학</a></td>
				</tr>
				<tr>
					<td><a href="/admin/department" class="selected--menu">학과</a></td>
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
		<h1>학과</h1>
		<div class="split--div">
			<div>
				<a href="/admin/department?crud=insert">등록</a>
				<a href="/admin/department?crud=update">수정</a> 
				<a href="/admin/department?crud=delete">삭제</a>
			</div>
			
			
			<!-- 학과 입력 -->
			<c:if test="${crud.equals(\"insert\")}">
				<form action="/admin/department-proc" method="get" id="insert--form">
					<h5>등록할 학과명을 입력해주세요</h5>
					학과명 <input type="text" name="name" value="전자과"> 단과대학 
					<select name="collegeId">
						<c:forEach var="college" items="${collegeList}">
							<option value="${college.id}">${college.name}</option>
						</c:forEach>
					</select> <input type="submit" value="입력">
				</form>
			</c:if>


			<!-- 학과 수정  -->
			<c:if test="${crud.equals(\"updateById\")}">
				<form action="/updAdmin/upDepartment" method="post" id="insert--form">
					<h5>변경할 학과명을 입력해주세요</h5>
					학과명 <input type="text" value="${department.name}" readonly="readonly">
					변경 학과명 
					<input type="text" name="name" value="전자과"> 
					<input type="submit" value="수정">
				</form>

				<table class="department--table">
					<tr class="first--tr">
						<td>ID</td>
						<td>학과명</td>
						<td>단과대ID</td>
					</tr>
					<c:forEach var="department" items="${departmentList}">
						<tr>
							<td>${department.id}</td>
							<td>${department.name}</td>
							<td>${department.collegeId}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			
			<!-- 학과 수정버튼 -->
			<c:if test="${crud.equals(\"update\")}">
				<h5>수정할 학과명을 클릭해주세요</h5>
					<table class="department--table">
					<tr class="first--tr">
						<td>ID</td>
						<td>학과명</td>
						<td>단과대ID</td>
					</tr>
					<c:forEach var="department" items="${departmentList}">
						<tr>
							<td>${department.id}</td>
							<td><a href="/admin/department?crud=updateById">${department.name}</a></td>
							<td>${department.collegeId}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>




			<!-- 학과 삭제 -->
			<c:if test="${crud.equals(\"delete\")}">
			<h5>삭제할 학과 이름을 클릭해주세요</h5>
				<table class="college--table" border="1">
					<tr class="first--tr">
						<td>ID</td>
						<td>학과명</td>
						<td>단과대ID</td>
					</tr>
					<c:forEach var="department" items="${departmentList}">
						<tr>
							<td>${department.id}</td>
							<td><a href="/updAdmin/deDepartment?collegeId=${department.collegeId}">${department.name}</a></td>
							<td>${department.collegeId}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>

			
			<!-- 학과 조회 -->
			<c:if test="${crud.equals(\"select\")}">
				<table class="department--table">
					<tr class="first--tr">
						<td>ID</td>
						<td>학과명</td>
						<td>단과대ID</td>
					</tr>
					<c:forEach var="department" items="${departmentList}">
						<tr>
							<td>${department.id}</td>
							<td>${department.name}</td>
							<td>${department.collegeId}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</main>
</div>
			<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

		</div>

		</body>
		</html>