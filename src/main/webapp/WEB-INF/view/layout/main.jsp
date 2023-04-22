<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<%@ include file="/WEB-INF/view/layout/header.jsp"%>
		
		<!-- 세부 메뉴 + 메인 -->
		<div class="d-flex justify-content-center align-items-start" style="min-width: 100em;">
			<!-- 세부 메뉴 div-->
			<div class="sub--menu">
				<div class="sub--menu--top">
					<h2>MY</h2>
				</div>
				<!-- 메뉴 -->
				<div class="sub--menu--mid">
					<table class="sub--menu--table" border="1">
						<tr>
							<td><a href="#">내 정보 조회</a></td>
						</tr>
						<tr>
							<td><a href="#">비밀번호 변경</a></td>
						</tr>
						<tr>
							<td><a href="#">등록금 내역 조회</a></td>
						</tr>
						<tr>
							<td><a href="#">등록금 납부 고지서</a></td>
						</tr>
						<tr>
							<td><a href="#">세부 메뉴 5</a></td>
						</tr>
					</table>
				</div>
			</div>
			
			<!-- 메인 div -->
			<main>
				<h1>현재 메뉴 이름</h1>
				<div class="split--div"></div>
				
				
			</main>
		</div>
		
		<footer>
			<!-- 필요 시 -->
		</footer>
	
	</div>

</body>
</html>

