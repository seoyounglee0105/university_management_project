<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

	.tuition--table th {
		padding: 2px 12px;
		
	}
	
	.tuition--table td {
		padding: 1px 20px;
	}

	.tuition--table thead tr th,
	.tuition--table tbody tr td:nth-of-type(1),
	.tuition--table tbody tr td:nth-of-type(2),
	.tuition--table tbody tr td:nth-of-type(3) {
		text-align: center;
	}

	.tuition--table tbody tr td:nth-of-type(4), 
	.tuition--table tbody tr td:nth-of-type(5),
	.tuition--table tbody tr td:nth-of-type(6) {
		text-align: right;
		padding: 1px 5px 1px 20px !important;
	}
</style>

		<%@ include file="/WEB-INF/view/layout/header.jsp"%>
		
		<!-- 등록금 내역 조회 -->
		
		<!-- 세부 메뉴 + 메인 -->
		<div class="d-flex" style="justify-content: center; align-items: flex-start; min-width: 100em;">
			<!-- 세부 메뉴 div-->
			<div style="border: 2px solid black; width: 250px; height: 900px; min-width: 250px; padding: 20px;">
				세부 메뉴 자리
				<!-- 메뉴 -->
				<div>
					
				</div>
				
			</div>
			
			<!-- 메인 div -->
			<main style="border: 2px solid black; width: 1200px; height: 900px; min-width: 1200px; padding: 20px;">
				<h3>등록금 내역 조회</h3>
				<p>등록금 납부가 완료된 것들만 여기로 올라옴</p>
				<br>
				<table border="1" class="tuition--table">
					<thead>
						<tr>
							<th>연도</th>
							<th>학기</th>
							<th>장학금 유형</th>
							<th>등록금</th>
							<th>장학금</th>
							<th>납입금</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="tuition" items="${tuitionList}">
							<tr>
								<td>${tuition.tuiYear}년</td>
								<td>${tuition.semester}학기</td>
								<c:choose>
									<%-- 장학금 지원 대상이 아니라면 --%>
									<c:when test="${tuition.schType == null}">
										<td>해당 없음</td>
									</c:when>
									<c:otherwise>
										<td>${tuition.schType}유형</td>								
									</c:otherwise>
								</c:choose>
								<td>${tuition.tuiFormat()}</td>
								<c:choose>
									<%-- 장학금 지원 대상이 아니라면 --%>
									<c:when test="${tuition.schType == null}">
										<td>0</td>
									</c:when>
									<c:otherwise>
										<td>${tuition.schFormat()}</td>							
									</c:otherwise>
								</c:choose>
								<td>${tuition.paymentFormat()}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			
				
			</main>
		</div>
		
		<footer>
			<!-- 필요 시 -->
		</footer>
	
	</div>

</body>
</html>

