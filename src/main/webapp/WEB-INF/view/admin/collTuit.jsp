<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
#insert--form {
	padding: 50px;
}

.collTuit--table {
	border: 1px solid gray;
	text-align: center;
	width: 500px;
	margin-top: 20px;
	margin: 10px;
}

.collTuit--table tr {
	border: 1px solid black;
}

.collTuit--table td {
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
					<td><a href="/admin/tuition" class="selected--menu">단대별 등록금</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>단대별 등록금</h1>
		<div class="split--div"></div>
		<div>
			<a href="/admin/collTuit?crud=insert">등록</a> <a href="/admin/collTuit?crud=update">수정</a> <a href="/admin/collTuit?crud=delete">삭제</a>
		</div>


		<!-- 등록금 입력 -->
		<c:if test="${crud.equals(\"insert\")}">
			<form action="/admin/collTuit-proc" method="post" id="insert--form">
				<h5>단과대학을 선택 후 등록금을 입력해주세요</h5>
				단과대학 <select name="collegeId">
					<c:forEach var="college" items="${collegeList}">
						<option value="${college.id}">${college.name}</option>
					</c:forEach>
				</select> 등록금 <input type="text" name="amount" value="2500000"> <input type="submit" value="입력">
			</form>
		</c:if>


		<!-- 등록금 수정 -->
		<c:if test="${crud.equals(\"update\")}">
			<form action="/updAdmin/upCollTuit" method="post" id="insert--form">
				<input type="hidden" name="_method" value="put" />
				<h5>등록금을 수정해주세요</h5>
				단과대학 <select name="collegeId">
					<c:forEach var="college" items="${collegeList}">
						<option value="${college.id}">${college.name}</option>
					</c:forEach>
				</select> 등록금 <input type="text" name="amount" value="2500000"> <input type="submit" value="수정">
			</form>
			<table class="collTuit--table">
				<tr class="first--tr">
					<td>ID</td>
					<td>단과대</td>
					<td>금액</td>
				</tr>
				<c:forEach var="collTuit" items="${collTuitList}">
					<tr>
						<td>${collTuit.collegeId}</td>
						<td>${collTuit.name}</td>
						<td>${collTuit.amount}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>


		<!-- 등록금 삭제 -->
		<c:if test="${crud.equals(\"delete\")}">
			<h5>등록금을 삭제할 단과대학을 클릭해주세요</h5>
			<table class="collTuit--table">
				<tr class="first--tr">
					<td>ID</td>
					<td>단과대</td>
					<td>금액</td>
				</tr>
				<c:forEach var="collTuit" items="${collTuitList}">
					<tr>
						<td>${collTuit.collegeId}</td>
						<td><a href="/updAdmin/deCollTuit?collegeId=${collTuit.collegeId}">${collTuit.name}</a></td>
						<td>${collTuit.amount}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>


		<!-- 등록금 조회 -->
		<c:if test="${crud.equals(\"select\")}">
			<table class="collTuit--table">
				<tr class="first--tr">
					<td>ID</td>
					<td>단과대</td>
					<td>금액</td>
				</tr>
				<c:forEach var="collTuit" items="${collTuitList}">
					<tr>
						<td>${collTuit.collegeId}</td>
						<td>${collTuit.name}</td>
						<td>${collTuit.amount}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</main>

	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
</div>
</body>
</html>