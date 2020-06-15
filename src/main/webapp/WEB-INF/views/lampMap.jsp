<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- chart.js CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>

<!-- 지도로 보기, 그래프로 보기 onclick이벤트 지정 -->
<script>
	var a = 1;
	function show(a){
		if(a==1){
			var map = document.getElementById("map");
			var chart = document.getElementById("bubble-chart");
			map.style.display = "block";
			chart.style.display = "none";
		} else if(a==2){
			var map = document.getElementById("map");
			var chart = document.getElementById("bubble-chart");
			map.style.display = "none";
			chart.style.display = "block";
		}
	}
	
</script>

<style>
section {
	
}

footer {
	text-align: left;
	height: 150px;
	clear: both;
	padding: 20px;
	text-indent: 20px;
}

button {
	height: 30px;
	width: 80px;
	margin: 50px;
}
</style>
</head>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<body>
	<div id="main">
		<div class="container">
			<div class="mt-2 mb-2">
				<h2 style="align-content: left">   Happy House</h2>
			</div>
		</div>

	</div>
	<div align="center">

		<div style="background-image: none; background-size: cover">

			<div id="map" style="width: 1000px; height: 500px;"></div>

			<canvas id="bubble-chart" width="1000px" height="500px"
				style="display: none"></canvas>

			<!-- map start -->
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3ce3994029fb75698f5aab6f4d94e9c7"></script>
			<script>
			
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng("${lamp[0].lat}", '${lamp[0].lng}'),
				level : 2
			};

			var map = new kakao.maps.Map(container, options);
			
			
			
			// 마커를 표시할 위치와 title 객체 배열입니다 
			var positions = [];
			<c:forEach items="${lamp}" var="item">
				positions.push({
					title:'${item.name}',
					latlng: new kakao.maps.LatLng('${item.lat}', '${item.lng}')
				});
			</c:forEach>

			// 마커 이미지의 이미지 주소입니다
			var imageSrc = '${root}/resources/images/lamp.png'; 
			    
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			}
			</script>

			<!-- map end -->


			<!-- graph start -->

			<script>
			var colors = [
				'rgba(255, 99, 132, 0.2)',
				'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(232, 62, 140, 0.2)',
                'rgba(108, 117, 125, 0.2)',
                'rgba(32, 201, 151, 0.2)'
                ];
			var borderColors = [
				'rgba(255, 99, 132, 1)',
				'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(232, 62, 140, 1)',
                'rgba(108, 117, 125, 1)',
                'rgba(32, 201, 151, 1)'
			];
			new Chart(document.getElementById("bubble-chart"), {
			    type: 'bubble',
			    data: {
			      labels: "lamp",
			      datasets: [
			        <c:forEach items="${graph}" var="item" varStatus="status">
			        {
			    		label:["${item.dong}"],
			    		data:[{
			    			x:"${item.area}",
			    			y:"${item.lampCnt}",
					        r:"${item.size}"/10
			    		}],
			    		backgroundColor: [colors["${status.index}"]],
			    		borderColor: [borderColors["${status.index}"]]
			        },
			    	</c:forEach>
			    	  
			      ]
			    },
			    options: {
			    	responsive:false,
			      title: {
			        display: true,
			        text: '동 별 면적 당 가로등 수'
			      }, 
			      scales: {
			        yAxes: [{ 
			          scaleLabel: {
			            display: true,
			            labelString: "가로등 수"
			          }, 
			          gridLines : {
			        	  color: "rgba(0, 0, 0, 0)",
			          }
			        }],
			        xAxes: [{ 
			          scaleLabel: {
			            display: true,
			            labelString: "면적"
			          },
			          gridLines : {
			        	  color: "rgba(0, 0, 0, 0)",
			          },
			        }]
			      }
				
			    }
			});
			
			</script>

			<!-- graph end -->
		</div><br>
		<div>
			<button type="button" class="btn btn-primary" onclick="show(1)" value="지도로 보기">지도</button>
			<button type="button" class="btn btn-primary" onclick="show(2)" value="그래프로 보기">그래프</button>
		</div>
	</div>
	<!-- <div>아이콘 제작자 <a href="https://smashicons.com/" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com</a></div> -->
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>