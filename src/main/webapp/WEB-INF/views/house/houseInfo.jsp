<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="root" value="${pageContext.request.contextPath }"/>

<!doctype html>
<html>
  <head>
  	<title>HappyHouse</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="../resources/css/style.css">
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- chart.js CDN -->	
		<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
		
<script>
function setTime(time){
	var f = document.createElement('form');
	f.setAttribute("charset", "UTF-8");
	f.setAttribute("method", "post");
	f.setAttribute("action", "${root}/house.do/population_chart_byTime");
	
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "no");
    hiddenField.setAttribute("value", parseInt("${deal.no}"));
    f.appendChild(hiddenField);

	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "time");
    hiddenField.setAttribute("value", time);
    f.appendChild(hiddenField);

	document.body.appendChild(f);
	f.submit();
}
</script>

  </head>
  <body>
	<div class="wrapper d-flex align-items-stretch">
	  <!-- 사이드바 추가 -->
	  <%@ include file="/WEB-INF/views/sidebar/sidebar.jsp"%>
      <!-- 메인 페이지 내용  -->
      <div id="content" class="p-5 p-md-5">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="nav navbar-nav ml-auto">
					<li class="nav-item active">
                    	<a class="nav-link" href="#">Home</a>
                	</li>
				<c:choose>
					<c:when test="${empty id}">
						<li class="nav-item"><a class="nav-link" href="${root}/user.do/loginform"><font size="2em">로그인</font>  </a></li>
						<li class="nav-item"><a class="nav-link" href="${root}/user.do/registform"><font size="2em">회원가입</font></a></li>
					</c:when>
				
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="${root}/user.do/userinfoform"><font size="2em">회원 정보</font></a></li>
						<li class="nav-item"><a class="nav-link" href="${root}/"><font size="2em">로그아웃</font>  </a></li>
					</c:otherwise>
				</c:choose>				
			  </ul>
            </div>
          </div>
        </nav> 
<!-- 여기에요 여기 -->
     <div class="row">
		<div class="col col-md-auto mr-5">
			<!-- 지도 -->
			<h5 class="ml-3">지도 정보</h5>
			<div id="map" style="width: 600px; height: 500px; margin-left:20px;"></div>
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
		<div class="col col-4">
		<h5>상세 정보</h5>
		
		<table class="table col-md">
			<tbody align="center">
				<tr class="table-primary">
					<th>동 이름</th>
				</tr>
				<tr>
					<td>${deal.dong }</td>
				</tr>

				<tr class="table-primary">
					<th>아파트 이름</th>
				</tr>
				<tr>
					<td>${deal.aptName }</td>
				</tr>
				</tbody>
				</table>
				<table class="table col-md">
			<tbody align="center">
				<tr class="table-primary">
					<th>건설년도</th>
					<th>거래가</th>

				</tr>
				<tr>
					<td>${deal.buildYear }</td>
					<td>${deal.dealAmount }</td>
				</tr>
				<tr class="table-primary">
					<th>거래일자</th>
					<th>면적</th>
				</tr>
				<tr>
					<td>${deal.dealYear }.${deal.dealMonth }.${deal.dealDay }</td>
					<td>${deal.area }</td>
				</tr>
				<tr class="table-primary">
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
	<div class="row justify-content-md-left">
		<div class="col col-md-auto">
			<div class="row">
				<h5 class="col-md-4">시간 별 인구 정보</h5>
				<p class="col-md-6">(원하는 시간을 선택 해 주세요.)</p>
				<select class="col-md-2" name="time" onchange="setTime(this.value);">
					<option value="0" <c:if test="${selected==0}">selected</c:if>>00시</option>
					<option value="1" <c:if test="${selected==1}">selected</c:if>>01시</option>
					<option value="2" <c:if test="${selected==2}">selected</c:if>>02시</option>
					<option value="3" <c:if test="${selected==3}">selected</c:if>>03시</option>
					<option value="4" <c:if test="${selected==4}">selected</c:if>>04시</option>
					<option value="5" <c:if test="${selected==5}">selected</c:if>>05시</option>
					<option value="6" <c:if test="${selected==6}">selected</c:if>>06시</option>
					<option value="7" <c:if test="${selected==7}">selected</c:if>>07시</option>
					<option value="8" <c:if test="${selected==8}">selected</c:if>>08시</option>
					<option value="9" <c:if test="${selected==9}">selected</c:if>>09시</option>
					<option value="10" <c:if test="${selected==10}">selected</c:if>>10시</option>
					<option value="11" <c:if test="${selected==11}">selected</c:if>>11시</option>
					<option value="12" <c:if test="${selected==12}">selected</c:if>>12시</option>
					<option value="13" <c:if test="${selected==13}">selected</c:if>>13시</option>
					<option value="14" <c:if test="${selected==14}">selected</c:if>>14시</option>
					<option value="15" <c:if test="${selected==15}">selected</c:if>>15시</option>
					<option value="16" <c:if test="${selected==16}">selected</c:if>>16시</option>
					<option value="17" <c:if test="${selected==17}">selected</c:if>>17시</option>
					<option value="18" <c:if test="${selected==18}">selected</c:if>>18시</option>
					<option value="19" <c:if test="${selected==19}">selected</c:if>>19시</option>
					<option value="20" <c:if test="${selected==20}">selected</c:if>>20시</option>
					<option value="21" <c:if test="${selected==21}">selected</c:if>>21시</option>
					<option value="22" <c:if test="${selected==22}">selected</c:if>>22시</option>
					<option value="23" <c:if test="${selected==23}">selected</c:if>>23시</option>
				</select>
			</div>
			<canvas id="myChart" style="height:50vh; width:35vw;"></canvas>
		</div>
		<br><br>
		<div class="col col-md-4">
			<h5>월 별 거래량 정보</h5>
			<canvas id="dealChart" style="height:50vh; width:35vw;"></canvas>
		</div>
		</div>
	</div>
  </div>
  </div>
</div>
		<!-- Population Chart -->
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
	
	<!-- Deal Chart -->
	<script>
		var ctx2 = document.getElementById("dealChart").getContext('2d');
		
		var mixedChart = new Chart(ctx2, {
		    type: 'bar',
		    data: {
		        datasets: [{
		            label: '총 거래 수',
		            data: [
		            	"${groupByMonth[0].total}", "${groupByMonth[1].total}", "${groupByMonth[2].total}", "${groupByMonth[3].total}",
		            	"${groupByMonth[4].total}", "${groupByMonth[5].total}", "${groupByMonth[6].total}", "${groupByMonth[7].total}",
		            	"${groupByMonth[8].total}", "${groupByMonth[9].total}", "${groupByMonth[10].total}", "${groupByMonth[11].total}"
		            ],
		            backgroundColor: 'rgb(75, 192, 192, 0.7)',
                    borderColor: 'rgb(75, 192, 192, 0.7)',
		            order: 2,
		            yAxisID:'total'
		        }, {
		            label: '평균 거래금액',
		            fill:false,
		            data: [
		            	"${groupByMonth[0].avgAmount}", "${groupByMonth[1].avgAmount}", "${groupByMonth[2].avgAmount}", "${groupByMonth[3].avgAmount}",
		            	"${groupByMonth[4].avgAmount}", "${groupByMonth[5].avgAmount}", "${groupByMonth[6].avgAmount}", "${groupByMonth[7].avgAmount}",
		            	"${groupByMonth[8].avgAmount}", "${groupByMonth[9].avgAmount}", "${groupByMonth[10].avgAmount}", "${groupByMonth[11].avgAmount}"
		            ],
		            type: 'line',
		            backgroundColor: 'rgb(255, 99, 132)',
                    borderColor: 'rgb(255, 99, 132)',
		            order: 1,
		            yAxisID:'avg'
		        }],
		        labels: ['Jan', 'Feb', 'March', 'April', 'May', 'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
		    },
		    options: {
		        maintainAspectRatio: true, 
		        responsive: false,
		        scales: {
		            yAxes: [{
						id:'total',
						position:'left'
		            },
		            {
		            	id:'avg',
		            	position:'right',
		            	ticks:{
		            		beginAtZero:true
		            	}
		            
		            }]
		        }
		    }
		});
	</script>
    <script src="../resources/js/jquery.min.js"></script>
    <script src="../resources/js/popper.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/main.js"></script>
  </body>
</html>