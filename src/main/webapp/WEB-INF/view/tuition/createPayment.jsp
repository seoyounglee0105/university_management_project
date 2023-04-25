<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
							<td><a href="/break/application">휴학 신청</a></td>
						</tr>
						<tr>
							<td><a href="/break/appList">휴학 내역 조회</a></td>
						</tr>
						<tr>
							<td><a href="/break/appListStaff">휴학 신청 처리(staff)</a></td>
						</tr>
						<tr>
							<td><a href="/tuition/create">고지서 생성(staff)</a></td>
						</tr>
					</table>
				</div>
			</div>
			
			<!-- 메인 div -->
			<main>
				<h1>등록금 고지서 생성</h1>
				<div class="split--div"></div>
				<p>디자인 나중에 고칠거임</p>
				<a href="/tuition/createTui"><button type="submit" class="btn btn-primary create--tui">등록금 납부 고지서 생성</button></a>
				<c:if test="${insertCount != null}">
					<% out.println("<script>alert('" + request.getAttribute("insertCount") + "개의 등록금 고지서가 생성되었습니다.'); history.back(); </script>"); %>
				</c:if>
			</main>
		</div>
		
	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
	
	</div>

</body>
</html>

