<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>

.main--page--div {
	width: 1300px; 
	height: 600px;
	margin-bottom: 50px;
	background-color: buttonhighlight;
}

.main--page--profile {
	min-width: 250px; 
	padding: 10px;
	background-color: gray;
	display: flex;
}

.main--page--img {
	width: 1300px; 
	height: 500px;
	margin-bottom: 20px;
}

</style>

<!-- 세부 메뉴 + 메인 -->
<div class="d-flex justify-content-center align-items-start" style="min-width: 100em; margin-top: 100px;">


	<!-- 메인 div -->
	<div>	
		<!-- 들어갈 내용 : 주요 서비스, 공지사항, 프로필, 알림 -->
		<div>
			<img alt="" src="/images/main_photo_b.jpg" class="main--page--img">
		</div>
		<div class="main--page--div">
			<div>
			</div>
			<div class="main--page--profile">
				 ddddddd
			</div>
	
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</div>

</body>
</html>

