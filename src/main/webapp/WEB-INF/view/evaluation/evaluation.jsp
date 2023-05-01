<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.tuition--table th {
	padding: 3px 12px;
	width: 150px;
}
.tuition--table td {
	padding: 1px 5px;
}
.radiocheck li{
list-style: none;
}
</style>
<body>
	<c:if test="${type == 1}">
		<script>
			window.close();
		</script>
	</c:if>

	<main>
		<br><br>
		<form action="/evaluation/write/${subjectId}" method="post">
		<br> <br>
					<div>${principal.name}</div>
					<div></div>
		
					<ul class="radiocheck">
					<li>1.&nbsp;${dto.question1}</li>
					<li>&nbsp;</li>
					<li>
					<input type="radio" name ="answer1" value="5">매우 만족
					</li>
					<li>
					<input type="radio" name ="answer1" value="4">만족
					</li>
					<li>
					<input type="radio" name ="answer1" value="3">보통
					</li>
					<li>
					<input type="radio" name ="answer1" value="2">그렇지 않다
					</li>
					<li>
					<input type="radio" name ="answer1" value="1">전혀 그렇지 않다.
					</li>
					</ul>
					<ul class="radiocheck">
					<li>2.&nbsp;${dto.question2}</li>
					<li>&nbsp;</li>
					<li>
					<input type="radio" name ="answer2" value="5">매우 만족
					</li>
					<li>
					<input type="radio" name ="answer2" value="4">만족
					</li>
					<li>
					<input type="radio" name ="answer2" value="3">보통
					</li>
					<li>
					<input type="radio" name ="answer2" value="2">그렇지 않다
					</li>
					<li>
					<input type="radio" name ="answer2" value="1">전혀 그렇지 않다.
					</li>
					</ul>
					<ul class="radiocheck">
					<li>3.&nbsp;${dto.question3}</li>
					<li>&nbsp;</li>
					<li>
					<input type="radio" name ="answer3" value="5">매우 만족
					</li>
					<li>
					<input type="radio" name ="answer3" value="4">만족
					</li>
					<li>
					<input type="radio" name ="answer3" value="3">보통
					</li>
					<li>
					<input type="radio" name ="answer3" value="2">그렇지 않다
					</li>
					<li>
					<input type="radio" name ="answer3" value="1">전혀 그렇지 않다.
					</li>
					</ul>
						<ul class="radiocheck">
					<li>4.&nbsp;${dto.question4}</li>
					<li>&nbsp;</li>
					<li>
					<input type="radio" name ="answer4" value="5">매우 만족
					</li>
					<li>
					<input type="radio" name ="answer4" value="4">만족
					</li>
					<li>
					<input type="radio" name ="answer4" value="3">보통
					</li>
					<li>
					<input type="radio" name ="answer4" value="2">그렇지 않다
					</li>
					<li>
					<input type="radio" name ="answer4" value="1">전혀 그렇지 않다.
					</li>
					</ul>
					<ul class="radiocheck">
					<li>5.&nbsp;${dto.question5}</li>
					<li>&nbsp;</li>
					<li>
					<input type="radio" name ="answer5" value="5">매우 만족
					</li>
					<li>
					<input type="radio" name ="answer5" value="4">만족
					</li>
					<li>
					<input type="radio" name ="answer5" value="3">보통
					</li>
					<li>
					<input type="radio" name ="answer5" value="2">그렇지 않다
					</li>
					<li>
					<input type="radio" name ="answer5" value="1">전혀 그렇지 않다.
					</li>
					</ul>
					<ul class="radiocheck">
					<li>6.&nbsp;${dto.question6}</li>
					<li>&nbsp;</li>
					<li>
					<input type="radio" name ="answer6" value="5">매우 만족
					</li>
					<li>
					<input type="radio" name ="answer6" value="4">만족
					</li>
					<li>
					<input type="radio" name ="answer6" value="3">보통
					</li>
					<li>
					<input type="radio" name ="answer6" value="2">그렇지 않다
					</li>
					<li>
					<input type="radio" name ="answer6" value="1">전혀 그렇지 않다.
					</li>
					</ul>
					<ul class="radiocheck">
					<li>7.&nbsp;${dto.question7}</li>
					<li>&nbsp;</li>
					<li>
					<input type="radio" name ="answer7" value="5">매우 만족
					</li>
					<li>
					<input type="radio" name ="answer7" value="4">만족
					</li>
					<li>
					<input type="radio" name ="answer7" value="3">보통
					</li>
					<li>
					<input type="radio" name ="answer7" value="2">그렇지 않다
					</li>
					<li>
					<input type="radio" name ="answer7" value="1">전혀 그렇지 않다.
					</li>
					</ul>
					<ul class="radiocheck">
					<li>${dto.sugContent}</li>
					<li>&nbsp;</li>
					<li><textarea cols="130" rows="10" name="improvements"> </textarea></li>
					</ul>
					
					
		<input type="submit" value="제출하기">
		</form>		
	</main>
</body>
</html>