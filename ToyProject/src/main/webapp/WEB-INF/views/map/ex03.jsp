<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<!-- ex03.jsp -->
	
	<h1>Map <small>지도 클릭 이벤트 + 마커 조작</small></h1>
	
	<div id="map" style="width:768px;height:400px;"></div>
	
	<div>
		<div class="message"></div>
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
	
	//이벤트 추가 > 카카오 맵 방식으로..
	//map.onclick = function() {};
	
	//kakao.maps.event.addListener(지도객체, 이벤트, 콜백함수);
	kakao.maps.event.addListener(map, 'click', function(evt) {
		
		//이벤트 관련 정보 > evt 객체 제공
		//alert(evt.latLng); //좌표 객체를 보여줌
		
		let msg = `클릭한 위치는 (\${evt.latLng.getLat()}, \${evt.latLng.getLng()}) 입니다.`;
		
		$('.message').text(msg);
		
		
		
		//현재 좌표 정보 ajax를 사용해서 서버로 전송(insert)
		$.ajax({
			type: 'POST',
			url: '/toy/map/addmarker.do',
			data: {
				lat: evt.latLng.getLat(),
				lng: evt.latLng.getLng()
			},
			dataType: 'json',
			success: function(result) {
				
				if (result.result == 1) {
					
					//마커 등록하기
					const m1 = new kakao.maps.Marker({
						position: new kakao.maps.LatLng(evt.latLng.getLat(), evt.latLng.getLng()) //; 찍지마
					});
					
					//마커를 지도에 추가
					m1.setMap(map);
					
				} else {
					alert('failed');
				}
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
		
	}); //click
	
	//DB에 있는 좌표 데이터 마커 출력
	<c:forEach items="${list}" var="dto" varStatus="status">
	
		//마커 등록하기
		const m${status.count} = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(${dto.lat}, ${dto.lng}) //; 찍지마
		});
		
		//마커를 지도에 추가
		m${status.count}.setMap(map);
		
	</c:forEach>
	
	
	</script>
</body>
</html>