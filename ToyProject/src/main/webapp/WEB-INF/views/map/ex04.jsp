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
	#main {
		display: flex;
		align-items: flex-start;
	}
	#main table {
		width: 384px; 
		margin: 0px 16px;
		margin-bottom: 10px;
	}
	#list td {
		cursor: pointer;
		display: flex;
		justify-content: space-between;
	}
	#list td span:last-child {
		float: right;
		display: none;
	}
	#list td:hover span:last-child {
		display: inline;
	}
</style>
</head>
<body class="wide">
	<!-- ex04.jsp -->
	
	<h1>Map <small>즐겨찾기(CRD)</small></h1>
	
	<div id="main">
		<div id="map" style="width:768px;height:400px;"></div>
		
		<div>
			<table>
				<tr>
					<td>
						<select name="category" id="category">
							<option value="default">기본</option>
							<option value="cafe">카페</option>
							<option value="food">음식점</option>
							<option value="private">개인</option>
						</select>
						<input type="text" name="name" id="name" class="middle">
						<input type="button" value="추가하기" id="btn">
					</td>
				</tr>
			</table>
			
			<table id="list">
				<tbody></tbody>
				<!-- <tr>
					<td>AAA</td>
				</tr> -->
			</table>
		</div>
		
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
	
	
	//클릭 이벤트 + 원하는 장소에 마커 추가하기(DB 작업 X)

	let m = null;
	let lat = null;
	let lng = null;
	
	kakao.maps.event.addListener(map, 'click', function(evt) {
		
		lat = evt.latLng.getLat();
		lng = evt.latLng.getLng();
		
		if (m != null) { //마커가 이미 있을 때
			
			m.setMap(null); //기존 마커 제거
		}
		
		//카테고리ㅣ 확인
		//$('#category').val() > 아이콘 이미지명
		
		let imageUrl = '/toy/asset/marker/' + $('#category').val() + '.png';
		let imageSize = new kakao.maps.size(40, 40);
		let option = {
				//spriteOrigin: new kakao.maps.Point(10, 20),
				//spriteSize: new kakao.maps.Size(36, 98)
		}
		
		let markerImage = new kakao.maps.MarkerImage(imageUrl, imageSize, option);
		
		m = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(lat, lng)
		});
		
		m.setImage(markerImage);
		m.setMap(map);
		
		$('#name').select();
	});
	
	$('#category').change(function() {
		
		//마커가 있다면 아이콘 변경
		
		if (m != null) {
			
			let imageUrl = '/toy/asset/marker/' + $('#category').val() + '.png';
			let imageSize = new kakao.maps.size(40, 40);
			let option = {}
			
			let markerImage = new kakao.maps.MarkerImage(imageUrl, imageSize, option);
			
			m.setImage(markerImage);
		}
		
	});
	
	
	//추가하기
	$('#btn').click(function() {
		
		$.ajax({
			type: 'POST',
			url: '/toy/map/addplace.do',
			data: {
				lat: lat,
				lng: lng,
				name: $('#name').val(),
				category: $('#category').val()
			},
			dataType: 'json',
			success: function(result) {
				
				if (result.result == 1) {
					
					load();
					
					//초기화
					$('#category').val('default');
					$('#name').val('');
					$('#name').select('default');
					
					//추가한 목록을 아래 테이블에 출력
					
				} else {
					alert('failed');
				}
				
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
	});
	
	load(); //함수 호이스팅
	
	function load() {
		$.ajax({
			type: 'GET',
			url: '/toy/map/listplace.do',
			dataType: 'json',
			success: function(result) {
				$('#list tbody').html('');
				$(result).each((index, item) => {
					$('#list tbody').append(`
					
						<tr>
							<td onclick="selPlace(\${item.lat}, \${item.lng}, '\${item.category}');">
								<span>\${item.name}<\span>
								<span title="delete" onclick="delPlace(\${item.seq});">&times;<\span>
							</td>
						</tr>
							
					`);
				});
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
	}
	
	function selPlace(lat, lng, category) {
		
		//해당 장소 > 위도, 경도 > 마커 출력하기
		//alert(lat + ',' + lng);
		
		if (m != null) { //마커가 이미 있을 때
			
			m.setMap(null); //기존 마커 제거
		}
		
		//마커 이미지 추가
		let imageUrl = '/toy/asset/marker/' + category + '.png';
		let imageSize = new kakao.maps.size(40, 40);
		let option = {}
		
		let markerImage = new kakao.maps.MarkerImage(imageUrl, imageSize, option);
		
		
		m = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(lat, lng)
		});
		
		m.setImage(markerImage);
		m.setMap(map);
		
		//map.setCenter()
		map.panTo(new kakao.maps.LatLng(lat, lng));
		
		$('#list td').css('background-color', 'transparent');
		$(event.currentTarget).css('background-color', 'gold');
		
	}
	
	function delPlace() {
		
		//장소 삭제
		
		$.ajax({
			type: 'POST',
			url: '/toy/map/delplace.do',
			data: {
				seq: seq
			},
			dataType: 'json',
			success: function(result) {
				
				if (result.result == 1) {
					//장소 삭제 완료
					
				if (m != null) { //마커가 이미 있을 때
					
					m.setMap(null); //기존 마커 제거
				}
				
				//목록 새로고침
				load();
					
				} else {
					alert('failed');
				}
				
			},
			error: function(a,b,c) {
				console.log(a,b,c);	
			}
		});
		
		event.stopPropagation();
		event.cancelBubble = true;
	}
	
	
	</script>
</body>
</html>