<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>

<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Happy House</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">
  
   <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">
  
  <style>
	.customoverlay {position:relative;bottom:75px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
	.customoverlay .title {display:block;text-align:center;background:#1a9c77;padding:10px 15px;font-size:15px;font-weight:bold;color:white;}
	.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
  

</head>
<body style="background-image: url('resources/images/background.jpg'); background-size:cover">
 <%@ include file="/WEB-INF/views/header/header.jsp"%>
<br/><br/><br/>
	<div class="row">
		<div class="col-md">
			<!-- 지도 -->
			<div id="map" style="width: 1000px; height: 500px;"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3ce3994029fb75698f5aab6f4d94e9c7"></script>
			<script>
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng("${info.lat}","${info.lng}"),
				level : 2
			};

			var map = new kakao.maps.Map(container, options);

			var nearPositions = [];
			
			<c:forEach items="${near}" var="item">
				nearPositions.push({
					title: '${item.aptName}',
					latlng: new kakao.maps.LatLng('${item.lat}', '${item.lng}')
			});
			</c:forEach>
			
			<c:forEach items="${near}" var="item" varStatus="status">
				<c:choose>
					<c:when test="${status.first}">
						var imageSrc = '${root}/resources/images/selectedHouse.png';  
						var imageSize = new kakao.maps.Size(70,70); 
						var imageOption = {offset: new kakao.maps.Point(35, 80)}; 
	
						// 마커 이미지를 생성합니다    
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption); 
						var position = new kakao.maps.LatLng('${info.lat}', '${info.lng}');
						
						var marker = new kakao.maps.Marker({
							position:position,
							image:markerImage
						});
						
						marker.setMap(map);
						
						var content = '<div class="customoverlay">' +
					    '    <span class="title">${item.aptName}</span>' +
					    '</div>';
					    
						    // 마커를 생성합니다
						var customOverlay = new kakao.maps.CustomOverlay({
						    map: map, // 마커를 표시할 지도
						    position: position, // 마커를 표시할 위치
						    content: content,
						    yAnchor: 1
						});
					</c:when>
					
					<c:otherwise>
						var imageSrc = '${root}/resources/images/house.png';  
						var imageSize = new kakao.maps.Size(70, 70); 
					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
					    // 마커를 생성합니다
					    var nearMarker = new kakao.maps.Marker({
					    	map:map,
					        position: nearPositions["${status.index}"].latlng, // 마커를 표시할 위치
					        title : nearPositions["${status.index}"].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        image:markerImage
					    });
					    var infowindow = new kakao.maps.InfoWindow({ 
					    	content: '<form method="post" action="${root}/house.do/house_info2"><button class="btn btn-primary btn-sx" name="no" value="${item.no}" type="submit">"${item.aptName}"으로 이동</button></form>', 
					    	removable : true });
			
					    kakao.maps.event.addListener(nearMarker, 'click', makeOverListener(map, nearMarker, infowindow));
					</c:otherwise>
			    </c:choose>
			</c:forEach>

			function makeOverListener(map, nearMarker, infowindow){
				return function(){
					infowindow.open(map,nearMarker);
				}
			}
			
			</script>
			
		<!-- 지도 -->
		</div>
		<div class="col-md">
		<h5>상세정보</h5>
		
		<table class="table col-md">
			<tbody align="center">
				<tr class="">
					<th>Dong</th>
				</tr>
				<tr>
					<td>${deal.dong }</td>
				</tr>

				<tr class="">
					<th>aptName</th>
				</tr>
				<tr>
					<td>${deal.aptName }</td>
				</tr>
				</tbody>
				</table>
				<table class="table col-md">
			<tbody align="center">
				<tr class="">
					<th>건설년도</th>
					<th>거래가</th>

				</tr>
				<tr>
					<td>${deal.buildYear }</td>
					<td>${deal.dealAmount }</td>
				</tr>
				<tr class="">
					<th>거래일자</th>
					<th>면적</th>
				</tr>
				<tr>
					<td>${deal.dealYear }.${deal.dealMonth }.${deal.dealDay }</td>
					<td>${deal.area }</td>
				</tr>
				<tr class="">
					<th>층</th>
					<th>지번</th>
				</tr>
				<tr>
					<td>${deal.floor }</td>
					<td>${deal.jibun }</td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>
	</br>
	</br>

	<h5 style="margin-left:20px;">주변 상권 정보</h5>

	<c:choose>
		<c:when test="${shops.size() ==0 }">
			<h3>상권 정보가 없습니다.</h3>

		</c:when>

		<c:otherwise>
		<table class="table table-active">
					<tbody align="center">
						<tr class="row">
							<th class="col-md-2">상호명</th>
							<th class="col-md-2">분류</th>
							<th class="col-md-1">층 정보</th>
							<th class="col-md">도로명주소</th>
							<th class="col-md-2">위도</th>
							<th class="col-md-2">경도</th>
						</tr>
			<c:forEach var="shop" items="${shops}">
				</br>
				</br>
				<table class="table">
					<tbody align="center">
						<tr class="row">
							<td class="col-md-2">${shop.shopName }</td>
							<td class="col-md-2">${shop.smallCategoryName }</td>
							<td class="col-md-1">${shop.floorInfo }</td>
							<td class="col-md">${shop.roadAddress }</td>
							<td class="col-md-2">${shop.longitude}</td>
							<td class="col-md-2">${shop.latitude }</td>
						</tr>
					</tbody>
				</table>
			</c:forEach>
		</c:otherwise>
	</c:choose>

 <%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>