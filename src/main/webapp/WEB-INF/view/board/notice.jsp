<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
.write--div {
	background-color: #f7f6f6;
	padding: 20px;
}

.title--container {
	display: flex;
	margin-bottom: 20px;
}

.title {
	margin-left: 20px;
}

.content--container {
	width: 1000px;
	margin-bottom: 20px;
}

.custom-file {
	width: 500px;
}

.table {
	width: 1000px;
	margin-bottom: 20px;
	cursor: pointer;
}



.first--tr {
	background-color: #f7f6f6;
	font-weight: bolder;
	overflow: hidden;
	text-overflow: ellipsis;
}

.second--tr {
	border-bottom: 1px solid #031734;
}

.read--container {
	display: flex;
	flex-direction: column;
}

.table-active {
	width: 80px;
	font-size: 15px;
	font-weight: bold;
}

.second--tr:hover {
	font-weight: bold;
}
.button {
	border: 1px solid #031734;
	border-radius: 3px;
	background-color: #031734;
	color: #ccc;
	text-decoration: none;
	margin: 5px;
	padding: 3px;
}
.button:hover {
	color: #ccc;

}
.select--button {
	margin-left: 200px;
}
.input--box {
	border: 1px solid #D2D1D1;
	border-radius: 3px;
	height: 35px;
	margin-right: 20px;
}
.form--container {
	display: flex;
	justify-content: flex-end;
	margin-right: 90px;
}
</style>
<!-- 세부 메뉴 + 메인 -->
<div class="d-flex justify-content-center align-items-start" style="min-width: 100em;">
	<!-- 세부 메뉴 div-->
	<div class="sub--menu">
		<div class="sub--menu--top">
			<h2>학사정보</h2>
		</div>
		<!-- 메뉴 -->
		<!-- 선택된 메뉴에 class="selected--menu" 추가해주세요 -->
		<div class="sub--menu--mid">
			<table class="sub--menu--table" border="1">
				<tr>
					<td><a href="/notice" class="selected--menu">공지사항</a></td>
				</tr>
				<tr>
					<td><a href="/schedule">학사일정</a></td>				
				</tr>
				<c:if test="${principal.userRole.equals(\"staff\") }">
					<tr>
						<td><a href="/schedule/list"> 학사일정 등록</a></td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>공지사항</h1>
		<div class="split--div"></div>


		<!-- 공지 검색 -->
		<c:if test="${crud.equals(\"selectKeyword\")}">
			<table class="table">
				<c:choose>
					<c:when test="${fn:length(noticeList) != 0}">
						<tr class="first--tr">
							<td>번호</td>
							<td>말머리</td>
							<td>제목</td>
							<td>작성일</td>
						</tr>
						<c:forEach var="notice" items="${noticeList}">
							<tr class="second--tr" onclick="location.href='/notice/read?id=${notice.id}';">
								<td>${notice.id}</td>
								<td>${notice.category}</td>
								<td>${notice.title}</td>
								<td>${notice.timeFormat()}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
							<h5>해당 키워드로 작성된 공지글이 없습니다.</h5>
					</c:otherwise>
				</c:choose>
			</table>
			<div class="paging--container">
			<c:forEach var="index" begin="1" end="${listCount}">
				<c:choose>
					<c:when test="${keyword != null}">
						<a href="/notice/search/${index}?keyword=${keyword}"> ${index}</a> &nbsp;&nbsp;
					</c:when>
					<c:otherwise>
						<a href="/notice/list/${index}"> ${index}</a> &nbsp;&nbsp;
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</div>
			<c:if test="${principal.userRole.equals(\"staff\")}">
				<a href="/notice?crud=write" class="button">등록</a>
			</c:if>
		</c:if>


		<!-- 공지 조회 -->
		<c:if test="${crud.equals(\"select\")}">
			<form action="/notice/search" method="get" class="form--container">
				<select class="input--box" name="type">
					<option value="title">제목</option>
					<option value="keyword">제목+내용</option>
				</select>
				<input type="text" name="keyword" class="input--box" placeholder="검색어를 입력하세요"> 
				<input type="submit" class="button" value="검색">
			</form>
			<table class="table">
				<c:choose>
					<c:when test="${fn:length(noticeList) != 0}">
						<tr class="first--tr">
							<td>번호</td>
							<td>말머리</td>
							<td>제목</td>
							<td>작성일</td>
						</tr>
						<c:forEach var="notice" items="${noticeList}">
							<tr class="second--tr" onclick="location.href='/notice/read?id=${notice.id}';">
								<td>${notice.id}</td>
								<td>${notice.category}</td>
								<td>${notice.title}</td>
								<td>${notice.timeFormat()}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
								<p class="no--list--p">공지사항이 없습니다. 작성해주세요.</p>
					</c:otherwise>
				</c:choose>
			</table>
			<c:forEach var="index" begin="1" end="${listCount}">
				<a href="/notice/list/${index}"> ${index}</a> &nbsp;&nbsp;
					</c:forEach>
			<c:if test="${principal.userRole.equals(\"staff\")}">
				<a href="/notice?crud=write" class="button" id="submit">등록</a>
			</c:if>
		</c:if>



		<!-- 공지 상세 조회 -->
		<c:if test="${crud.equals(\"read\")}">
			<div class="container">
				<table class="table table-bordered table-sm">
					<tr class="category">
						<td class="table-active">말머리</td>
						<td>${notice.category}</td>
					</tr>
					<tr class="title">
						<td class="table-active">제목</td>
						<td>${notice.title}</td>
					</tr>
					<tr class="content--container">
						<td class="table-active">내용</td>
						<td>${notice.content}<img alt="" src="${notice.setUpImage()}" width="300" height="300"></td>
					</tr>
				</table>

				<div class="button">
					<a href="/notice" class="btn btn-link" id="submit">목록</a> <a href="/notice/update?id=${notice.id}" class="btn btn-link" id="submit">수정</a> <a href="/notice/delete?id=${notice.id}"
						class="btn btn-link" id="submit">삭제</a>
				</div>
			</div>
		</c:if>


		<!-- 공지 수정 -->
		<c:if test="${crud.equals(\"update\")}">
			<form action="/notice/update" method="post">
				<input type="hidden" name="_method" value="put" /> <input type="hidden" name="id" value="${notice.id}"> ${notice.id} 말머리 ${notice.category}
				<div class="title">
					제목 <input type="text" name="title" value="${notice.title}">
				</div>
				내용
				<textarea rows="20" cols="60" name="content">${notice.content}</textarea>
				<input type="submit" value="수정">
			</form>
		</c:if>


		<!-- 공지 등록 -->
		<c:if test="${crud.equals(\"write\")}">
			<div class="write--div">
				<form action="/notice/write" method="post" enctype="multipart/form-data">
					<div class="title--container">
						<div class="category">
							말머리 <select name="category" class="input--box">
								<option value="[일반]">[일반]</option>
								<option value="[학사]">[학사]</option>
								<option value="[장학]">[장학]</option>
							</select>
						</div>
						<div class="title">
							제목 <input type="text" class="form-control form-control-sm" name="title" value="등록금 납부기한 연장안내" required="required" style="width: 900px;">
						</div>
					</div>
					<div class="content--container">
						내용
						<textarea name="content" class="form-control" cols="100" rows="20">등록금 납부기한 22일까지입니다</textarea>
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="customFile" name="file" accept=".jpg, .jpeg, .png"> <label class="custom-file-label" for="customFile">Choose file</label>
					</div>
					<a href="/notice" class="button">목록</a> <input type="submit" class="button" value="등록">
				</form>
				<script>
					$(".custom-file-input").on(
							"change",
							function() {
								var fileName = $(this).val().split("\\").pop();
								$(this).siblings(".custom-file-label")
										.addClass("selected").html(fileName);
							});
				</script>
			</div>
		</c:if>
	</main>

	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>




