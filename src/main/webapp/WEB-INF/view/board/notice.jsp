<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
.split--div {
	display: flex;
	flex-direction: column;
	align-items: center;
}
form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

#insert--form {
	padding: 50px;
}

.room--table {
	border: 1px solid gray;
	text-align: center;
	width: 500px;
	margin-top: 20px;
	margin: 10px;
}

.room--table tr {
	border: 1px solid black;
}

.room--table td {
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
			<h2>강의실</h2>
		</div>
		<!-- 메뉴 -->
		<!-- 선택된 메뉴에 class="selected--menu" 추가해주세요 -->
		<div class="sub--menu--mid">
			<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/admin/college" class="selected--menu">강의실</a></td>
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
					<td><a href="/admin/collTuit">단대별 등록금</a></td>
				</tr>
				<tr>
					<td><a href="/board/notice">공지사항</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>공지사항</h1>
		<div class="split--div">
			<form action="/board/notice-proc" method="post">
				<h5>공지 글쓰기</h5>
					<div class="title--top">
						말머리 
						<select name="category">
							<option value="일반">일반</option>
							<option value="학사">학사</option>
							<option value="등록금">등록금</option>
						</select>
					</div>
					<div class="title">
						제목 <input type="text" name="title" value="등록금 납부기한 연장안내" required="required">
					</div>
						내용 <textarea name="content" cols="60" rows="20">등록금 납부기한 22일까지입니다</textarea> 
					<div class="custom-file">
    					<input type="file" name="file" class="" id="" accept=".jpg, .jpeg, .png">
    					<label>파일 첨부하기</label>
 			 		</div> 
				<input type="submit" value="등록">
			</form>
		</div>
	</main>

	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>




