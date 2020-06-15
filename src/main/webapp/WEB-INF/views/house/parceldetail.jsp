<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소로 장소 표시하기</title>

</head>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<body>
	<div>
		<div id="map" style="width: 50%; height: 350px; margin: 6% 10% 2% 25%;">
				<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3ce3994029fb75698f5aab6f4d94e9c7&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};
	
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
	
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
	
			// 주소로 좌표를 검색합니다
			var loc = "서울특별시 동작구 상도동 159-250";
			geocoder.addressSearch(loc, function(result, status) {
	
								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {
	
									var coords = new kakao.maps.LatLng(result[0].y,
											result[0].x);
	
									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});
	
									// 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">서울특별시 동작구 상도동 159-250</div>'
											});
									infowindow.open(map, marker);
	
									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
		</script>
		</div>
				<div class="col-md">
		<h5>상세정보</h5>
		
		<table class="table col-md"; style="padding:0px 50px 0px 50px">
			<tbody align="center">
				<tr class="">
					<th>분양 종류</th>
				</tr>
				<tr>
					<td>${bunyang.ptype}</td>
				</tr>

				<tr class="">
					<th>건물명</th>
				</tr>
				<tr>
					<td>${bunyang.pname}</td>
				</tr>
				<tr class="">
					<th>금액</th>
				</tr>
				<tr>
					<td>${bunyang.price}</td>
				</tr>
				</tbody>
				</table>
				<table class="table col-md">
			<tbody align="center">
				<tr class="">
					<th>위치</th>
					<th>세대</th>
				<tr>
					<td>${bunyang.location }</td>
					<td>${bunyang.capacity }</td>
				</tr>
				<tr class="">
					<th>분양날짜</th>
					<th>입주날짜</th>
				</tr>
				<tr>
					<td>${bunyang.ptime}</td>
					<td>${bunyang.ltime}</td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>

	<footer>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>	
	</footer>

</body>
</html>