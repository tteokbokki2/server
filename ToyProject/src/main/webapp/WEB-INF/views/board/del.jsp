<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
	
</style>
</head>
<body>
	<!-- del.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1>게시판 <small>삭제하기</small></h1>
		
		<form method="POST" action="/toy/board/del.do">
			<div>
				<button type="button" class="back" onclick="location.href='/toy/board/view.do?seq=${dto.seq}';">돌아가기</button>
				<button type="submit" class="del primary">삭제하기</button>
			</div>
			<input type="hidden" name="seq" value="${seq}">
		</form>
	</main>
	<script>
		
	</script>
</body>
</html>