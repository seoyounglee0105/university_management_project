<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/css/admin.css">
<style>
.table--container {
	width: 1000px !important;
	font-size: 13px;
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
					<td><a href="/admin/college">단과대학</a></td>
				</tr>
				<tr>
					<td><a href="/admin/department">학과</a></td>
				</tr>
				<tr>
					<td><a href="/admin/room">강의실</a></td>
				</tr>
				<tr>
					<td><a href="/admin/subject" class="selected--menu">강의</a></td>
				</tr>
				<tr>
					<td><a href="/admin/tuition">단대별 등록금</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 메인 div -->
	<main>
		<h1>강의</h1>
		<div class="split--div"></div>

			<!-- 강의 입력 -->
			<c:if test="${crud.equals(\"insert\")}">
				<form action="/admin/subject-proc" method="post" class="form--container">
					<span class="material-symbols-outlined symbol">school</span><span class="insert">등록하기</span>
						<div class="insert--form">
						<label for="name">강의명</label> 
						<input type="text" class="input--box" id="name" name="name">
							<label for="professorId"> 교수ID </label> 
							<input type="text" class="input--box" id="professorId" name="professorId" value="23000001"> 
							<label for="roomId"> 강의실 </label> 
							<input type="text" class="input--box" id="roomId" name="roomId" value="C201">
							<label for="deptId"> 학과ID </label> 
							<input type="text" class="input--box" id="deptId" name="deptId" value="101">
						구분 
							<label for="major">전공</label> 
							<input type="radio" class="input--box" id="major" name="type" value="전공">
							<label for="culture">교양</label> 
							<input type="radio" class="input--box" id="culture" name="type" value="교양">
							<label for="subYear"> 연도 </label> 
							<input type="text" class="input--box" id="subYear" name="subYear" value="2023">
							<label for="semester"> 학기 </label> 
							<input type="text" class="input--box" id="semester" name="semester" value="1">
							<label for="subDay"> 요일 </label>
								<select name="subDay" class="input--box">
									<option value="월">월</option>
									<option value="화">화</option>
									<option value="수">수</option>
									<option value="목">목</option>
									<option value="금">금</option>
								</select> 
							<label for="startTime"> 시작 시간 </label> 
							<input type="text" class="input--box" id="startTime" name="startTime" value="10">
							<label for="endTime"> 종료 시간 </label> 
							<input type="text" class="input--box" id="endTime" name="endTime" value="12"> 
							<label for="grades"> 학점 </label> 
							<input type="text" class="input--box" id="grades" name="grades" value="3">
							<label for="capacity"> 정원 </label> 
							<input type="text" class="input--box" name="capacity" name="capacity" value="15">
						<input type="submit" class="button" value="입력">
						</div>
					</form>
				
				<table class="table--container">
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
						<span class="material-symbols-outlined symbol">school</span><span class="insert">수정하기</span><br>
							ID<select name="id" class="input--box">
								<c:forEach var="subject" items="${subjectList}">
									<option>${subject.id}</option>
								</c:forEach>
							</select> 
							변경 학과명 <input type="text" class="input--box" name="name"> 
							변경 강의실 <input type="text" class="input--box" name="roomId">
							<div></div>
							변경 요일
								<select name="subDay" class="input--box">
									<option value="월">월</option>
									<option value="화">화</option>
									<option value="수">수</option>
									<option value="목">목</option>
									<option value="금">금</option>
								</select> 
							변경 시작시간 
								<select name="startTime" class="input--box">
									<c:forEach var="time" begin="9" end="16">
										<option value="${time}">${time}</option>
									</c:forEach>
								</select>
							변경 종료시간
								<select name="endTime" class="input--box">
									<c:forEach var="time" begin="11" end="18">
										<option value="${time}">${time}</option>
									</c:forEach> 
								</select>
							변경 정원 <input type="text" class="input--box" name="capacity"> 
							<input type="submit" value="수정" class="button">
					<div class="form--container">
					<table class="table--container">
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
					</div>
				</form>
			</c:if>



			<!-- 강의 삭제 -->
			<c:if test="${crud.equals(\"delete\")}">
				<h5>삭제할 강의명을 클릭해주세요</h5>
				<div class="form--container">
				<table class="table--container">
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
				</div>
			</c:if>


			<!-- 강의 조회 -->
			<c:if test="${crud.equals(\"select\")}">
			<div class="form--container">
				<table class="table--container">
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
						<c:if test="${principal.userRole.equals(\"staff\")}">
							<a href="/admin/subject?crud=insert" class="button" >등록</a> 
							<a href="/admin/subject?crud=update" class="button">수정</a> 
							<a href="/admin/subject?crud=delete" class="button" >삭제</a>
						</c:if>
				</div>
			</c:if>
	</main>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
</div>
</body>
</html>