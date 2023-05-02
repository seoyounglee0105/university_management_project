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
	
	
	<c:if test="${crud.equals(\"read\") }">
	<p>졔목 : ${schedule.title}</p>
	<p>내용 : ${schedule.content}</p>
	<c:if test="${principal.userRole.equals(\"staff\") }">
	<a href="/schedule/detail?crud=update&id=${schedule.id}">수정</a>
	<a href="/schedule/delete?id=${schedule.id}">삭제</a>
	</c:if>
	</c:if>
	
	<c:if test="${crud.equals(\"update\") }">
	<form action="/schedule/update?id=${schedule.id}" method="post">
	<label>
	제목 :
	<input type="textarea" value="${schedule.title}" name="title">
	</label>
	<label>
	내용 :
	<input type="textarea" value="${schedule.content}" name="content">
	</label>
	<button>수정</button>
	</form>
	</c:if>
    </main>
	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>






