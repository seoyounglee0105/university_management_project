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
</style>
<body>
	<c:if test="${type == 1}">
		<script>
			window.close();
		</script>
	</c:if>

	<main>
		<br><br>
		<form action="/evaluation/insert/${subjectId}" method="post">
		<table border="1" class="tuition--table">
			<tr>
				<td>본 강의 평가 설문지는 익명으로 작성되며, 이번 학기 교과목의 수업진행에 대한 학생들의 솔직한 의견을
					파악하여, 앞으로 보다 나은 강의를 하기 위한 목적으로 실시하는 것입니다. 따라서 학생 여러분은 각 평가 문항에 대하여
					성싱하고 진지하게 답변해 주시기 바랍니다.</td>
			</tr>
		</table>
		<br> <br>
		<table border="1" class="tuition--table">
			<thead>
				<tr>
					<th>유형 : 공통 강의평가</th>
					<th>매우 그렇다</th>
					<th>그런 편이다</th>
					<th>보통이다</th>
					<th>그렇지 않다</th>
					<th>전혀 그렇지 않다</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>강의평가</td>
					<td>5</td>
					<td>4</td>
					<td>3</td>
					<td>2</td>
					<td>1</td>
				</tr>
				<tr>
					<td>강의 내용은 자신에게 학습 욕구를 불러일으킬 만큼 적절한 수준이었는가?</td>
					<td><input type="radio" name ="qna1" value="5"></td>
					<td><input type="radio" name ="qna1" value="4"></td>
					<td><input type="radio" name ="qna1" value="3"></td>
					<td><input type="radio" name ="qna1" value="2"></td>
					<td><input type="radio" name ="qna1" value="1"></td>
				</tr>
				<tr>
					<td>이 강의를 통하여 다른 강의에서는 접할 수 없는 새로운 내용을 배울 수 있었는가?</td>
					<td><input type="radio" name ="qna2" value="5"></td>
					<td><input type="radio" name ="qna2" value="4"></td>
					<td><input type="radio" name ="qna2" value="3"></td>
					<td><input type="radio" name ="qna2" value="2"></td>
					<td><input type="radio" name ="qna2" value="1"></td>
				</tr>
				<tr>
					<td>강의를 통하여 해당 교과목에 대한 이해(실기 능력과 기능)가 개선되었는가?</td>
					<td><input type="radio" name ="qna3" value="5"></td>
					<td><input type="radio" name ="qna3" value="4"></td>
					<td><input type="radio" name ="qna3" value="3"></td>
					<td><input type="radio" name ="qna3" value="2"></td>
					<td><input type="radio" name ="qna3" value="1"></td>
				</tr>
				<tr>
					<td>교수는 주요 주제들간의 관계가 드러나도록 내용을 구조화 하여 전달하였는가?</td>
					<td><input type="radio" name ="qna4" value="5"></td>
					<td><input type="radio" name ="qna4" value="4"></td>
					<td><input type="radio" name ="qna4" value="3"></td>
					<td><input type="radio" name ="qna4" value="2"></td>
					<td><input type="radio" name ="qna4" value="1"></td>
				</tr>
				<tr>
					<td>교수는 열정을 갖고 수업을 진행하였는가?</td>
					<td><input type="radio" name ="qna5" value="5"></td>
					<td><input type="radio" name ="qna5" value="4"></td>
					<td><input type="radio" name ="qna5" value="3"></td>
					<td><input type="radio" name ="qna5" value="2"></td>
					<td><input type="radio" name ="qna5" value="1"></td>
				</tr>
				<tr>
					<td>수업시간은 제대로 이루어졌는가?</td>
					<td><input type="radio" name ="qna6" value="5"></td>
					<td><input type="radio" name ="qna6" value="4"></td>
					<td><input type="radio" name ="qna6" value="3"></td>
					<td><input type="radio" name ="qna6" value="2"></td>
					<td><input type="radio" name ="qna6" value="1"></td>
				</tr>
				<tr>
					<td>강의 내용이 과목명이랑 부합하는가?</td>
					<td><input type="radio" name ="qna7" value="5"></td>
					<td><input type="radio" name ="qna7" value="4"></td>
					<td><input type="radio" name ="qna7" value="3"></td>
					<td><input type="radio" name ="qna7" value="2"></td>
					<td><input type="radio" name ="qna7" value="1"></td>
				</tr>
				<tr>
					<td>이 강의가 계속 실려 나가야 할 장점과 개선이 필요한 점</td>
					<td colspan="5"><textarea cols="130" rows="10" name="improvements"> </textarea></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="제출하기">
		</form>		
	</main>
</body>
</html>

