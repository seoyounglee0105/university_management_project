<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
.room--table {
	text-align: center;
	margin-top: 20px;
	margin: 10px;
}
.room--table td {
	padding: 10px;
	width: 300px;
}
.first--tr {
	font-weight: bold;
}
.mouth{
  background-color: #f5f5f5;
}
.line{
}
.container{
margin-top: 100px;
}

</style>
<div class="d-flex justify-content-center align-items-start"
	style="min-width: 100em;">
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
					<td><a href="/schedule" >학사일정</a></td>				
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
	<div class="container">
	<div></div>
	<table border="1" class="tuition--table">	
	<thead>
	<tr>
	<th>순서</th>
	<th>날짜</th>
	<th>내용</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var ="schedule" items ="${schedule}">
	<tr>
	<td>${schedule.id}</td>
	 <td class = "line">${schedule.startDay}~${schedule.endDay}</td>
	 <td class = "line">${schedule.content}</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	</div>
	<a href="/schedule/list?crud=insert" class="button">등록</a> 
	<a href="/schedule/list?crud=delete" class="button">삭제</a>
    <c:if test="${crud.equals(\"insert\") }">
    <br>
    <form action="/schedule/write" method="post">
    <label>시작일자 : <input type="date" name ="startDay"></label>
    <label>종료일자 : <input type="date" name = "endDay"></label>
    <label>내용<input type = "textarea" name = "content"></label>
    <button>등록</button>
    </form>
    </c:if>
    </main>
	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>






