<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-size: 20px;
}
.write--div {
	margin: 10px;
	padding: 10px;
	background-color: #f7f6f6;
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
#submit {
	background-color: #031734;
	color: #ccc;
	text-decoration: none;
	margin-left: 100px;
}
.notice--table {
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
.button {
	display: flex;
	justify-content: center;
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
					<td><a href="/notice" class="selected--menu">공지사항</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>공지사항</h1>
		<div class="split--div"></div>
		
		
		<!-- 공지 조회 -->
			<c:if test="${crud.equals(\"select\")}">
				<table class="notice--table">
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
								공지사항이 없습니다. 작성해주세요
							</c:otherwise>	
						</c:choose>
				</table>
				<c:if test="${principal.userRole.equals(\"staff\")}">
					<a href="/notice?crud=write" class="btn btn-link" id="submit">등록</a>
				</c:if>
			</c:if>
			
			
			
		<!-- 공지 상세 조회 -->
			<c:if test="${crud.equals(\"read\")}">
				<div class="container">
						<table class="table">
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
							<td>${notice.content}</td>
						</tr>
						<tr class="image">
							<td></td>
							<td><img alt="" src="${notice.setUpImage()}"></td>
						</tr>
						</table>

			  		<div class="button">
				  		<a href="/notice" class="btn btn-link" id="submit">목록</a>
						<a href="/notice/update?id=${notice.id}" class="btn btn-link" id="submit">수정</a>
						<a href="/notice/delete?id=${notice.id}" class="btn btn-link" id="submit">삭제</a>	
					</div>	
				</div>			
			</c:if>
		
		
		<!-- 공지 수정 -->
		<c:if test="${crud.equals(\"update\")}">
			<form action="/notice/update" method="post">
				<input type="hidden" name="_method" value="put"/>
				<input type="hidden" name="id" value="${notice.id}">
					${notice.id}
					말머리 ${notice.category}
				<div class="title"> 
					제목 <input type="text" name="title" value="${notice.title}"> 
				</div>
					내용 <textarea rows="20" cols="60" name="content">${notice.content}</textarea>
					<input type="submit" value="수정">
			</form>
		</c:if>
		
		
		<!-- 공지 등록 -->
		<c:if test="${crud.equals(\"write\")}">
		<div class="write--div">
			<form action="/notice/write" method="post" enctype="multipart/form-data">
				<div class="title--container">
						<div class="category">
							말머리 
							<select name="category" class="form-control form-control-sm">
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
						내용 <textarea name="content" class="form-control" cols="100" rows="20">등록금 납부기한 22일까지입니다</textarea> 
					</div>
					<div class="custom-file">
			   	 		<input type="file" class="custom-file-input" id="customFile" name="file" accept=".jpg, .jpeg, .png" >
			    		<label class="custom-file-label" for="customFile">Choose file</label>
		  			</div>
		  		<a href="/notice" class="btn btn-link" id="submit">목록</a>
				<input type="submit" class="btn btn-link" id="submit" value="등록">
			</form>
			<script>
				$(".custom-file-input").on("change",function() {
					var fileName = $(this).val().split("\\").pop();
					$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
				});
			</script>
			</div>
		</c:if>
</main>

	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>




