<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style>
	
</style>
</head>
<body>
	<!-- ex01.jsp -->
	
	<!--
		사용자가 클라이언트 작업중에 서버와 통신을 해야한다면(서버에게 데이터를 전송하거나 서버로부터 데이터 수신)
		기존의 페이지 > 새로고침 발생!!
		
		1. 프레임
		2. Ajax
	-->
	
	<div>
		<input type="text" id="txt1" value="${count}">
		<input type="button" value="버튼1" id="btn1">
	</div>

	<div>
		<input type="text" id="txt2">
		<input type="button" value="버튼2" id="btn2">
	</div>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	<script>
		$('#btn1').click(function() {
			location.href = '/ajax/ex01data.do';
		});
	</script>
</body>
</html>