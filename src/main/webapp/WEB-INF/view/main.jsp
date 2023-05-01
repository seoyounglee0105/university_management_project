<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
.main--page--div {
	width: 1250px;
	height: 600px;
	margin-bottom: 50px;
	display: flex;
	justify-content: flex-start;
	flex-direction: column;
}

.main--page--profile {
	min-width: 250px;
	padding: 10px;
	background-color: gray;
	display: flex;
	flex-direction: column;
}

.main--page--img {
	width: 1500px;
	height: 500px;
	margin-bottom: 40px;
}

.material--bold {
	font-variation-settings: 'FILL' 0, 'wght' 500, 'GRAD' 0, 'opsz' 48 !important;
}

.main--page--notice {
	margin-right: 120px;
}

.main--page--notice tr td:first-of-type {
	width: 450px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	display: inline-block;
	margin-right: 10px;
}

.main--page--notice tr td a {
	font-size: 19px;
}

.main--page--calander tr td:first-of-type {
	padding-right: 20px;
	text-align: right;
}

.main--page--calander tr td:last-of-type {
	font-size: 19px;
	max-width: 400px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.main--page--split {
	height: 2px;
	width: 100%;
	background-color: #3c668a;
	margin-bottom: 10px;
}

.main--page--div h3 a {
	font-weight: 600;
	color: #132A50;
	
}

</style>

<!-- 세부 메뉴 + 메인 -->
<div class="d-flex justify-content-center align-items-start" style="min-width: 100em;">


	<!-- 메인 div -->
	<div>	
		<!-- 들어갈 내용 : 주요 서비스, 공지사항, 프로필, 알림 -->
		<div>
			<img alt="" src="/images/main_photo.jpg" class="main--page--img">
		</div>
		<div class="d-flex justify-content-center align-items-start">
			<div class="main--page--div">
				<div class="d-flex">
					<!-- 공지사항 -->
					<div class="main--page--notice">
						<h3><a href="#">공지사항</a></h3>
						<div class="main--page--split"></div>
						<table>
							<tr>
								<td><a href="#">[일반] 2023년 8월 학부 1차 졸업예비사정 실시 안내</a></td>
								<td>2023-05-01</td>
							</tr>
							<tr>
								<td><a href="#">[일반] 5월 학생상담센터 심리검사</a></td>
								<td>2023-05-01</td>
							</tr>
							<tr>
								<td><a href="#">[일반] 2023년 신입생 입학식 행사 안내</a></td>
								<td>2023-05-01</td>
							</tr>
							<tr>
								<td><a href="#">[일반] 2023년 1학기 학부 수강신청 취소 기간 및 방법 안내</a></td>
								<td>2023-05-01</td>
							</tr>
							<tr>
								<td><a href="#">[일반] 2023년 1학기 본수강신청 안내</a></td>
								<td>2023-05-01</td>
							</tr>
						</table>					
					</div>
					<div class="main--page--calander">
						<h3><a href="#">학사일정</a></h3>
						<div class="main--page--split"></div>
						<table>
							<tr>
								<td> 01-30 ~ 02-01
								<td> 2023학년도 1학기 예비수강신청 기간
							</tr>
							<tr>
								<td> <span>02-01 ~ 02-28</span>
								<td> 휴학 및 복학 신청
							</tr>
							<tr>
								<td> <span>02-06 ~ 02-10</span>
								<td> 2023학년도 1학기 수강신청 기간
							</tr>
							<tr>
								<td> <span>02-21 ~ 02-24</span>
								<td> 2023학년도 1학기 재학생 등록금 납부 기간
							</tr>
							<tr>
								<td> <span>02-28</span>
								<td> 2023학년도 신입생 입학식
							</tr>
						</table>
						
					</div>
				</div>
				<!-- 주요 서비스 자리 -->
				<div>
				</div>
			</div>
			<!-- 사용자 간단한 프로필 -->
			<div class="main--page--profile">
				 <ul class="d-flex justify-content-center align-items-start" style="margin: 0;">
				 	<li><span class="material-symbols-outlined material--bold" style="font-weight: 600">badge</span>&nbsp;&nbsp;
				 	<li><span style="font-weight: 600">${userInfo.name}님</span>&nbsp;(${userInfo.id})
				 </ul>
				 <c:if test="${principal.getUserRole().equals(\"staff\") == false}">
					 <p>${userInfo.deptName}</p>
				 </c:if>
				 <p>${userInfo.email}</p>
				 <p>
				 	<c:choose>
				 		<c:when test="${principal.getUserRole().equals(\"student\")}">
				 			학생
				 		</c:when>
				 		<c:when test="${principal.getUserRole().equals(\"staff\")}">
				 			교직원
				 		</c:when>
				 		<c:otherwise>
				 			교수
				 		</c:otherwise>
				 	</c:choose>
				 </p>
			</div>
	
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>

