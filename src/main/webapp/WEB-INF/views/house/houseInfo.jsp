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
  
  <!-- Chart js CDN -->
  <script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
  
  
  <style>
	.customoverlay {position:relative;bottom:75px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
	.customoverlay .title {display:block;text-align:center;background:#1a9c77;padding:10px 15px;font-size:15px;font-weight:bold;color:white;}
	.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
  

</head>
<body>
 <%@ include file="/WEB-INF/views/header/header.jsp"%>
<br/><br/><br/>
	<div class="row">
		<div class="col-md">
			<!-- 지도 -->
			<div id="map" style="width: 1000px; height: 500px; margin-left:20px;"></div>
			<div style="margin-left:20px;margin-top:20px;">
			<h6>빨간색 마커는 현재 선택된 집을, 까만색 마커는 근처 거래중인 집을 의미합니다~^^*</h6>
			</div>
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
					    	content: '<form method="post" action="${root}/house.do/house_info2"><button class="btn btn-primary btn-sx" name="no" value="${item.no}" type="submit">"${item.aptName}"</button></form>', 
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
	<div class="container col-md">
		<h5>주변 인구 정보</h5>
		<canvas id="myChart" style="height:50vh; width:95vw;"></canvas>
	</div>
	<!-- Bar Chart -->
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChart").getContext('2d');
		/*
		- Chart를 생성하면서, 
		- ctx를 첫번째 argument로 넘겨주고, 
		- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
		*/
		var myChart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: ["0~10대", "10대", "20대", "30대", "40대", "50대", "60대", "70대이상",],
		        datasets:[
		        	<c:forEach items="${population}" var="item" varStatus="status">
		        	{
		        		label:'Man',
		        		data:[
		        			"${item.man0_9}","${item.man10_14+item.man15_19}","${item.man20_24+item.man25_29}","${item.man30_34+item.man35_39}",
		        			"${item.man40_44+item.man45_49}","${item.man50_54+item.man55_59}","${item.man60_64+item.man65_69}","${item.man70}",
		        		],
		        		backgroundColor:'rgb(255, 99, 132, 0.7)'
		        	},
		        	{
		        		label:'Woman',
		        		data:[
		        			"${item.woman0_9}","${item.woman10_14+item.woman15_19}","${item.woman20_24+item.woman25_29}","${item.woman30_34+item.woman35_39}",
		        			"${item.woman40_44+item.woman45_49}","${item.woman50_54+item.woman55_59}","${item.woman60_64+item.woman65_69}","${item.woman70}"
		        		],
		        		backgroundColor:'rgb(75, 192, 192, 0.7)'
		        	}
		        	</c:forEach>
		        ]
		    },
		    options: {
		        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
		        responsive: false,
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero:true
		                }
		            }]
		        }
		    }
		});
		</script>

 <%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>
