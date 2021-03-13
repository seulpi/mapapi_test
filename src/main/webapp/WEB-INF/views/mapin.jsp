<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<html>
<head>
<title>Home</title>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7077a1888038abefefea902f6662041"></script>
<script>
	document.ready(function(
			var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.5701927,126.9744637), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	
	));

</script>
	 -->

	<!-- 네이티브앱키가 아닌 자바스크립트키를 가져와야함 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c9fe3add9f7bb894ed0cd276c423fff"></script>
</head>
<body>
<div id="map" style="width:500px;height:400px;"></div>
<p>
<button onclick="setBounds()">지도 범위 재설정 하기</button> 
</p>


	<script>
	
		<!--기본적인 지도 올리기-->
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.5701318,126.9835729), //위도 경도 순: 현재 종각역 위도 경도
			level: 3 // 지도에 확대, 축소크기
		};

		var map = new kakao.maps.Map(container, options);
		
		
		<!--지도 오른쪽옆  확대 축소 올리기 (+,-)-->
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		
		// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
		var points = [
		    new kakao.maps.LatLng(37.5701318,126.9835729), //종각역 좌표
		    new kakao.maps.LatLng(37.5662094,126.9809498), //을지로입구역 좌표 
		    new kakao.maps.LatLng(37.5653778,126.975846) //시청역 좌표
		];

		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		var bounds = new kakao.maps.LatLngBounds();    

		var i, marker;
		for (i = 0; i < points.length; i++) {
		    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
		    marker = new kakao.maps.Marker({ position : points[i] });
		    marker.setMap(map);
		    
		    // LatLngBounds 객체에 좌표를 추가합니다
		    bounds.extend(points[i]);
		}

		function setBounds() {
		    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		    map.setBounds(bounds);
		}
	</script>

</body>
</html>
