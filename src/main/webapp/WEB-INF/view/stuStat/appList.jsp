<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.list--table th {
	padding: 3px 12px;
	width: 150px;
	text-align: center;
}

.list--table td {
	padding: 1px 5px;
	text-align: center;
}

</style>

		<%@ include file="/WEB-INF/view/layout/header.jsp"%>
		
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
					<td><a href="/tuition/list">등록금 내역 조회</a></td>
				</tr>
				<tr>
					<td><a href="/tuition/payment">등록금 납부 고지서</a></td>
				</tr>
				<tr>
					<td><a href="/stuStat/application">휴·복학 신청</a></td>
				</tr>
				<tr>
					<td><a href="/stuStat/list" class="selected--menu">휴·복학 내역 조회</a></td>
				</tr>
				<tr>
					<td><a href="/tuition/test">테스트 (고지서 생성)</a></td>
				</tr>
			</table>
				</div>
			</div>
			
			<!-- 메인 div -->
			<main>
				<h1>휴·복학 내역 조회</h1>
				<div class="split--div"></div>
				
				<div class="d-flex flex-column align-items-center" style="width: 100%">
<%-- 					<c:choose>
						<c:when test="${tuitionList != null}"> --%>
			
							<table border="1" class="list--table">
								<thead>
									<tr>
										<th>신청일자</th>
										<th>구분</th>
										<th>시작학기</th>
										<th>종료학기</th>
										<th>상태</th>
										<th>신청서 확인</th>
									</tr>
								</thead>
			
								<tbody>
									<tr>
										<td>2023-04-24</td>
										<td>일반휴학</td>
										<td>2023년도 1학기</td>
										<td>2023년도 2학기</td>
										<td>처리중</td> <!-- 나중에 path variable 추가 -->
										<td><a href="/stuStat/detail">Click</a></td>
									</tr>
								</tbody>
							</table>
<%-- 						</c:when>
			
 						<c:otherwise>
							<p>휴·복학 신청 내역이 없습니다.</p>
						</c:otherwise>
					</c:choose> --%>
				</div>
			</main>
		</div>
		
	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
	
	</div>

</body>
</html>

