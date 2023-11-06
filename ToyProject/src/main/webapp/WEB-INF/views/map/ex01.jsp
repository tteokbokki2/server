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
	
	<h1>Map <small>기본 지도</small></h1>
	
	<div id="map" style="width:768px;height:400px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5431a8fac09806306365d4e60309a890"></script> <!-- 지도 불러오는 코드(순서 중요) -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	<script>
	
	//지도를 담을 영역의 DOM 레퍼런스
	const container = document.getElementById('map');
	
	//지도를 생성할 때 필요한 기본 옵션
	const options = {
		center: new kakao.maps.LatLng(37.499294, 127.0331883), //지도의 중심좌표(위, 경도)
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	const map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	</script>
</body>
</html>