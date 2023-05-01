<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
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
					<td><a href="/board/notice">공지사항</a></td>
				</tr>
				<tr>
					<td><a href="/scheule/main">학사일정</a></td>				
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>공지사항</h1>
		<div class="split--div"></div>
		<a href="/board/notice?crud=insert">글쓰기</a>
		
		<!-- 공지 조회 -->
			<c:if test="${crud.equals(\"select\")}">
				<table class="notice--table">
					<c:choose>
						<c:when test="${fn:length(noticeList) != 0}">
							<c:forEach var="notice" items="${noticeList}">
									<tr class="first--tr">
										<td>번호</td>
										<td>말머리</td>
										<td>제목</td>
										<td>작성일</td>
									</tr>
									<tr onclick="location.href='/board/notice-proc-detail?id=${notice.id}';">
										<td>${notice.id}</td>
										<td>${notice.category}</td>
										<td>${notice.title}</td>
										<td>${notice.createdTime}</td>
									</tr>
								</c:forEach>	
						</c:when>
							<c:otherwise>
								공지사항이 없습니다. 작성해주세요
							</c:otherwise>	
						</c:choose>
				</table>
			</c:if>
			
			
			
		<!-- 공지 상세 조회 -->
			<c:if test="${crud.equals(\"selectDetail\")}">
						${notice.id}
						말머리 ${notice.category}
					<div class="title"> 
						제목 ${notice.title} 
					</div>
						<img alt="" src="<c:url value="${notice.setUpImage()}"/>">
						내용 ${notice.content}
						
					<a href="/board/notice-update-page?id=${notice.id}">수정</a>
					<a href="/board/notice-delete?id=${notice.id}">삭제</a>
			</c:if>
		
		
		<!-- 공지 수정 -->
		<c:if test="${crud.equals(\"update\")}">
			<form action="/board/notice-update" method="post">
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
		<c:if test="${crud.equals(\"insert\")}">
			<form action="/board/notice-proc" method="post" enctype="multipart/form-data">
				<h5>공지 글쓰기</h5>
					<div class="title--top">
						말머리 
						<select name="category">
							<option value="[일반]">[일반]</option>
							<option value="[학사]">[학사]</option>
							<option value="[등록금]">[등록금]</option>
						</select>
					</div>
					<div class="title">
						제목 <input type="text" name="title" value="등록금 납부기한 연장안내" required="required">
					</div>
						내용 <textarea name="content" cols="60" rows="20">등록금 납부기한 22일까지입니다</textarea> 
					<div class="custom-file">
			   	 		<input type="file" class="custom-file-input" id="customFile" name="file" accept=".jpg, .jpeg, .png" >
			    		<label class="custom-file-label" for="customFile">Choose file</label>
		  			</div>
				<input type="submit" value="등록">
			</form>
			<script>
				$(".custom-file-input").on("change",function() {
					var fileName = $(this).val().split("\\").pop();
					$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
				});
			</script>
		</c:if>
</main>

	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>




