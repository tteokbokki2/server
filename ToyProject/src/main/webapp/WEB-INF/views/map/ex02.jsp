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
	<!-- ex02.jsp -->
	
	<h1>Map <small>지도 좌표 이동하기 + 레벨 바꾸기</small></h1>
	
	<div id="map" style="width:768px;height:400px;"></div>


	<div>
		<input type="button" value="종각역으로 이동하기" id="btn1">
		<input type="button" value="역삼역으로 이동하기" id="btn2">
		<input type="button" value="잠실역으로 이동하기" id="btn3">
	</div>
	<div>
		<input type="button" value="확대" id="btn4">
		<input type="button" value="축소" id="btn5">
	</div>
	<div>
		<input type="button" value="이동 제어" id="btn6">
		<input type="button" value="확대/축소 제어" id="btn7">
	</div>
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5431a8fac09806306365d4e60309a890"></script> <!-- 지도 불러오는 코드(순서 중요) -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	<script>
	
	const container = document.getElementById('map');
	
	const options = {
		center: new kakao.maps.LatLng(37.499294, 127.0331883),
		level: 3
	};

	const map = new kakao.maps.Map(container, options);
	
	//한독 > 37.499294, 127.0331883
	//종각 > 37.570176, 126.983197
	//역삼 > 37.500643, 127.036377
	//잠실 > 37.5132612, 127.1001336
	
	$('#btn1').click(function() {
		//종각 좌표 객체
		const p1 = new kakao.maps.LatLng(37.570176, 126.983197);
		//map.setCenter(p1); //순간이동
		map.panTo(p1); //스크롤 이동
	});
	
	$('#btn2').click(function() {
		//역삼 좌표 객체
		const p1 = new kakao.maps.LatLng(37.500643, 127.036377);
		map.setCenter(p1);
	});
	
	$('#btn3').click(function() {
		//잠실 좌표 객체
		const p1 = new kakao.maps.LatLng(37.5132612, 127.1001336);
		map.setCenter(p1);
	});
	
	$('#btn4').click(function() {
		//확대
		map.setLevel(map.getLevel() - 1);
	});
	
	$('#btn5').click(function() {
		//축소
		map.setLevel(map.getLevel() + 1);
	});

	
	map.setDraggable(false);
	
	$('#btn6').click(function() {
		
		//토글 버튼(드래그 On/Off)
		if (map.getDraggable()) {
			map.setDraggable(false);
			$(this).css('background-color', '#EFEFEF');
		} else {
			map.setDraggable(true);
			$(this).css('background-color', 'gold');
		}
		
	});
	
	map.setZoomable(false);

	$('#btn7').click(function() {
		//토글 버튼(확대,축소 On/Off)
		if (map.getZoomable()) {
			map.setZoomable(false);
			$(this).css('background-color', '#EFEFEF');
		} else {
			map.setZoomable(true);
			$(this).css('background-color', 'gold');
		}
	});
	
	</script>
</body>
</html>
