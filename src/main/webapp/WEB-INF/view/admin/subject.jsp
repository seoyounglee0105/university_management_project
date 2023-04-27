<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>

#insert--form {
	padding: 50px;
}

.subject--table {
	border: 1px solid gray;
	text-align: center;
	width: 800px;
	margin-top: 20px;
	margin: 10px;
}

.subject--table tr {
	border: 1px solid black;
}

.subject--table td {
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
			<h2>입력</h2>
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
					<td><a href="/admin/subject" class="selected--menu">강의</a></td>
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
		<h1>강의</h1>
		<div class="split--div"></div>
			<div>
				<a href="/admin/subject?crud=insert">등록</a> 
				<a href="/admin/subject?crud=update">수정</a> 
				<a href="/admin/subject?crud=delete">삭제</a>
			</div>


			<!-- 강의 입력 -->
			<c:if test="${crud.equals(\"insert\")}">
				<form action="/admin/subject-proc" method="post" id="insert--form">
					<h5>등록할 강의를 입력해주세요</h5>
						<label for="name">강의명</label> 
						<input type="text" id="name" name="name" value="스프링부트 뽀개기"><br> 
						<label for="professorId"> 교수ID </label> 
						<input type="text" id="professorId" name="professorId" value="23000001"><br> 
						<label for="roomId"> 강의실 </label> 
						<input type="text" id="roomId" name="roomId" value="C201"><br> 
						<label for="deptId"> 학과ID </label> 
						<input type="text" id="deptId" name="deptId" value="101"><br> 
						구분 
						<label for="major">전공</label> <input type="radio" id="major" name="type" value="전공">
						<label for="culture">교양</label> <input type="radio" id="culture" name="type" value="교양"><br>
						<label for="subYear"> 연도 </label> <input type="text" id="subYear" name="subYear" value="2023"><br>
						<label for="semester"> 학기 </label> <input type="text" id="semester" name="semester" value="1"><br> 
						<label for="subDay"> 요일 </label>
							<select name="subDay">
								<option value="월">월</option>
								<option value="화">화</option>
								<option value="수">수</option>
								<option value="목">목</option>
								<option value="금">금</option>
							</select> 
						<label for="startTime"> 시작 시간 </label> <input type="text" id="startTime" name="startTime" value="10"><br> 
						<label for="endTime"> 종료 시간 </label> <input type="text" id="endTime" name="endTime" value="12"><br> 
						<label for="grades"> 학점 </label> <input type="text" id="grades" name="grades" value="3"><br> 
						<label for="capacity"> 정원 </label> <input type="text" name="capacity" name="capacity" value="15"><br>
						 <input type="submit" value="입력">
				</form>
				<table class="subject--table">
					<tr class="first--tr">
						<td>ID</td>
						<td>강의명</td>
						<td>교수</td>
						<td>강의실</td>
						<td>학과ID</td>
						<td>구분</td>
						<td>연도</td>
						<td>학기</td>
						<td>시간</td>
						<td>이수학점</td>
						<td>정원</td>
						<td>신청인원</td>
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
							<td>${subject.subDay} ${subject.startTime}:00 - ${subject.endTime}:00</td>
							<td>${subject.grades}</td>
							<td>${subject.capacity}</td>
							<td>${subject.numOfStudent}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>



			<!-- 강의 수정 -->
			<c:if test="${crud.equals(\"update\")}">
				<form action="/updAdmin/upSubject" method="post" id="insert--form">
					 <input type="hidden" name="_method" value="put"/>
						<h5>강의 변경 내용을 입력해주세요</h5>
							ID<select name="id">
								<c:forEach var="subject" items="${subjectList}">
									<option>${subject.id}</option>
								</c:forEach>
							</select> 
							변경 학과명 <input type="text" name="name"> 
							변경 강의실 <input type="text" name="roomId"> 
							변경 시간 <input type="text" name="time"> 
							변경 정원 <input type="text" name="capacity"> 
							<input type="submit" value="수정">
						<table class="subject--table">
							<tr class="first--tr">
								<td>ID</td>
								<td>강의명</td>
								<td>교수</td>
								<td>강의실</td>
								<td>학과ID</td>
								<td>구분</td>
								<td>연도</td>
								<td>학기</td>
								<td>시간</td>
								<td>이수학점</td>
								<td>정원</td>
								<td>신청인원</td>
							</tr>
						<c:forEach var="subject" items="${subjectList}">
							<tr>
								<td>${subject.id}</td>
								<td><a href="/admin/subject?crud=updateById">${subject.name}</a></td>
								<td>${subject.professorId}</td>
								<td>${subject.roomId}</td>
								<td>${subject.deptId}</td>
								<td>${subject.type}</td>
								<td>${subject.subYear}</td>
								<td>${subject.semester}</td>
								<td>${subject.subDay} ${subject.startTime}:00 - ${subject.endTime}:00</td>
								<td>${subject.grades}</td>
								<td>${subject.capacity}</td>
								<td>${subject.numOfStudent}</td>
							</tr>
						</c:forEach>
					</table>
				</form>
			</c:if>



			<!-- 강의 삭제 -->
			<c:if test="${crud.equals(\"delete\")}">
				<h5>삭제할 강의명을 클릭해주세요</h5>
					<table class="subject--table">
						<tr class="first--tr">
							<td>ID</td>
							<td>강의명</td>
							<td>교수</td>
							<td>강의실</td>
							<td>학과ID</td>
							<td>구분</td>
							<td>연도</td>
							<td>학기</td>
							<td>시간</td>
							<td>이수학점</td>
							<td>정원</td>
							<td>신청인원</td>
						</tr>
					<c:forEach var="subject" items="${subjectList}">
						<tr>
							<td>${subject.id}</td>
							<td><a href="/updAdmin/deSubject?id=${subject.id}">${subject.name}</a></td>
							<td>${subject.professorId}</td>
							<td>${subject.roomId}</td>
							<td>${subject.deptId}</td>
							<td>${subject.type}</td>
							<td>${subject.subYear}</td>
							<td>${subject.semester}</td>
							<td>${subject.subDay} ${subject.startTime}:00 - ${subject.endTime}:00</td>
							<td>${subject.grades}</td>
							<td>${subject.capacity}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>


			<!-- 강의 조회 -->
			<c:if test="${crud.equals(\"select\")}">
				<table class="subject--table">
					<tr class="first--tr">
						<td>ID</td>
						<td>강의명</td>
						<td>교수</td>
						<td>강의실</td>
						<td>학과ID</td>
						<td>구분</td>
						<td>연도</td>
						<td>학기</td>
						<td>시간</td>
						<td>이수학점</td>
						<td>정원</td>
						<td>신청인원</td>
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
							<td>${subject.subDay} ${subject.startTime}:00 - ${subject.endTime}:00</td>
							<td>${subject.grades}</td>
							<td>${subject.capacity}</td>
							<td>${subject.numOfStudent}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
	</main>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
</div>
</body>
</html>