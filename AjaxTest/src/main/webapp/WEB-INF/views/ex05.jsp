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
	<!-- ex05.jsp -->
	
	<h1>Ajax 데이터 보내는 방법</h1>
	
	<form id="form1">
	<table class="vertical">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" id="name" value="홍길동"></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input type="text" name="age" id="age" value="20"></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" name="gender" id="gender1" value="m" checked>남자
				<input type="radio" name="gender" id="gender2" value="f">여자
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" id="address" value="서울시 강남구 역삼동"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel" id="tel" value="010-1234-1234"></td>
		</tr>
	</table>
	
	<div>
		<input type="button" value="확인" id="btn1">
	</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	<script>
		$('#btn1').click(function() {
			
			//1. 단일 데이터 전송
			/* $.ajax({
				type: 'POST',
				url: '/ajax/ex05data.do',

				//data: 'key=value'
				data: 'name=' + $('#name').val(),
				
				//success: function(result) {
					//데이터 수신
				//}
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			}); */
			
			
			//alert('name=' + $('#name').val() + '&age=' + $('#age').val());
			
			/* $.ajax({
				type: 'POST',
				url: '/ajax/ex05data.do',
				//data: 'key=value&key=value&key=value'
				//name=홍길동&age=20
				data: 'name=' + $('#name').val() 
						+ '&age=' + $('#age').val(),
				//success: function(result) {
					//데이터 수신
				//}
				error: function(a,b,c) {
					console.log(a,b,c);
				} */
					
				
			//$('input[name=gender]:checked').hide();
			//alert($('input[name=gender]:checked').val());
				
			/* $.ajax({
				type: 'POST',
				url: '/ajax/ex05data.do',
				//data: 'key=value&key=value&key=value'
				//name=홍길동&age=20
				data: 'name=' + $('#name').val() 
						+ '&age=' + $('#age').val() 
						+ '&gender=' + $('input[name=gender]:checked').val() 
						+ '&address=' + $('#address').val() 
						+ '&tel=' + $('#tel').val(),
				//success: function(result) {
					//데이터 수신
				//}
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			}); */
			
			
			/* $.ajax({
				type: 'POST',
				url: '/ajax/ex05data.do',
				data: {
					name: $('#name').val(),
					age: $('#age').val(),
					gender: $('input[name=gender]:checked').val(),
					address: $('#address').val(),
					tel: $('#tel').val()
				},
				//success: function(result) {
					//데이터 수신
				//}
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			}); */
			
			
			//name=홍길동&age=20&gender=m&address=서울시 강남구 역삼동&tel=010-1234-1234
			//alert($('#form1').serialize());
			
			/* 
				1. <form> 태그 사용
				2. <input name="key"> name을 key로 사용하기 떄문에 태그마다 반드시 명시해야함
			*/
			
			$.ajax({
				type: 'POST',
				url: '/ajax/ex05data.do',
				data: $('#form1').serialize(),
				//success: function(result) {
					//데이터 수신
				//}
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
			
			
		});
	</script>
</body>
</html>