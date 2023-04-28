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
		<br> <br>
		<table border="1" class="tuition--table">
			<thead>
				<tr>
					<th></th>
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
					<td>${dto.que1}</td>
					<td><input type="radio" name ="qna1" value="5"></td>
					<td><input type="radio" name ="qna1" value="4"></td>
					<td><input type="radio" name ="qna1" value="3"></td>
					<td><input type="radio" name ="qna1" value="2"></td>
					<td><input type="radio" name ="qna1" value="1"></td>
				</tr>
				<tr>
					<td>${dto.que2}</td>
					<td><input type="radio" name ="qna2" value="5"></td>
					<td><input type="radio" name ="qna2" value="4"></td>
					<td><input type="radio" name ="qna2" value="3"></td>
					<td><input type="radio" name ="qna2" value="2"></td>
					<td><input type="radio" name ="qna2" value="1"></td>
				</tr>
				<tr>
					<td>${dto.que3}</td>
					<td><input type="radio" name ="qna3" value="5"></td>
					<td><input type="radio" name ="qna3" value="4"></td>
					<td><input type="radio" name ="qna3" value="3"></td>
					<td><input type="radio" name ="qna3" value="2"></td>
					<td><input type="radio" name ="qna3" value="1"></td>
				</tr>
				<tr>
					<td>${dto.que4}</td>
					<td><input type="radio" name ="qna4" value="5"></td>
					<td><input type="radio" name ="qna4" value="4"></td>
					<td><input type="radio" name ="qna4" value="3"></td>
					<td><input type="radio" name ="qna4" value="2"></td>
					<td><input type="radio" name ="qna4" value="1"></td>
				</tr>
				<tr>
					<td>${dto.que5}</td>
					<td><input type="radio" name ="qna5" value="5"></td>
					<td><input type="radio" name ="qna5" value="4"></td>
					<td><input type="radio" name ="qna5" value="3"></td>
					<td><input type="radio" name ="qna5" value="2"></td>
					<td><input type="radio" name ="qna5" value="1"></td>
				</tr>
				<tr>
					<td>${dto.que6}</td>
					<td><input type="radio" name ="qna6" value="5"></td>
					<td><input type="radio" name ="qna6" value="4"></td>
					<td><input type="radio" name ="qna6" value="3"></td>
					<td><input type="radio" name ="qna6" value="2"></td>
					<td><input type="radio" name ="qna6" value="1"></td>
				</tr>
				<tr>
					<td>${dto.que7}</td>
					<td><input type="radio" name ="qna7" value="5"></td>
					<td><input type="radio" name ="qna7" value="4"></td>
					<td><input type="radio" name ="qna7" value="3"></td>
					<td><input type="radio" name ="qna7" value="2"></td>
					<td><input type="radio" name ="qna7" value="1"></td>
				</tr>
				<tr>
					<td>${dto.sugContent}</td>
					<td colspan="5"><textarea cols="130" rows="10" name="improvements"> </textarea></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="제출하기">
		</form>		
	</main>
</body>
</html>

