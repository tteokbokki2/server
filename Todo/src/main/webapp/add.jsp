<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file = "inc/asset.jsp" %>
<style>
	
</style>
</head>
<body class="narrow">
	<!-- add.jsp (template.jsp 복사) -->
	
	<%@ include file="inc/header.jsp" %>
	
	<form method="POST" action="addok.jsp">
	<table class="vertical">
		<tr>
			<th>할일</th>
			<td><input type="text" class="long" name="todo" required></td>
		</tr>
	</table>
	
	<div>
		<button class="back" type="button" onclick="location.href='list.jsp';">돌아가기</button>
		<button class="add">등록하기</button> <!-- button의 type 기본 값은 submit이라 생략 가능 -->
	</div>
	</form>

	<script>
		
	</script>
</body>
</html>