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

</script>

<style>
	.customoverlay {position:relative;bottom:75px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
	.customoverlay .title {display:block;text-align:center;background:#1a9c77;padding:10px 15px;font-size:15px;font-weight:bold;color:white;}
	.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>


  </head>
  <body>
		
	<div class="wrapper d-flex align-items-stretch">
	  <!-- 사이드바 추가 -->
	 			<nav id="sidebar">
				<div class="p-4 pt-5">
		  		<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(../resources/images/logo.jpg);"></a>
	        <ul class="list-unstyled components mb-5">
	          	          <li class="active">
	            <a href="${root}/happyhouse/index.jsp" data-toggle="collapse" aria-expanded="false">Happy House</a>
	          </li>
	          <li>
	              <a href="/happyhouse/index.jsp">Home</a>
	          </li>
	          <li>
	              <a href="${root}/parcel.do/main?pg=1">분양가 목록</a>
	          </li>
	          <li>
	          </li>
	          <li>
              <a href="${root}/parcel.do/chartinfo">분양가 추세</a>
	          </li>
	          <li>
              <a href="${root}/parcel.do/latest">현재분양 정보</a>
	          </li>
	        </ul>
	
	        <div class="footer">
	        	<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  SSAFY &copy;<script>document.write(new Date().getFullYear());</script> This site is made <i class="icon-heart" aria-hidden="true"></i> by<br><a href="https://edu.ssafy.com" target="_blank">서울_8반_9조</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
	        </div>

	      </div>
    	</nav>
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
		<div class="col-lg-6" id="map">
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3ce3994029fb75698f5aab6f4d94e9c7&libraries=services"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(37,126.94), // 지도의 중심좌표
					level : 6
				// 지도의 확대 레벨
				};
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				var loc = '${bunyang.location}';
				geocoder.addressSearch(	loc, function(result, status) {
									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {
										var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
										// 결과값으로 받은 위치를 마커로 표시합니다
										var imageSrc = '${root}/resources/images/selectedHouse.png';  
										var imageSize = new kakao.maps.Size(70,70); 
										var imageOption = {offset: new kakao.maps.Point(35, 80)}; 
						
										// 마커 이미지를 생성합니다    
										var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption); 
										var position = new kakao.maps.LatLng(result[0].y, result[0].x);
										
										var marker = new kakao.maps.Marker({
											position:position,
											image:markerImage
										});
										
										marker.setMap(map);
										
										
										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var content = '<div class="customoverlay"><span class="title">${bunyang.location}</span></div>';
									    
										    // 마커를 생성합니다
										var customOverlay = new kakao.maps.CustomOverlay({
										    map: map, // 마커를 표시할 지도
										    position: position, // 마커를 표시할 위치
										    content: content,
										    yAnchor: 1
										});
										
									/* 	
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;">${bunyang.location}</div>'
												});
										infowindow.open(map, marker); */

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
										map.setLevel(5);
										map.relayout();
										map.setCenter(coords);
									}
								});
			</script>
		</div>
		<div class="col-lg-6">
			<h5>상세정보</h5>
			<table class="table";>
				<tbody align="center">
					<tr class="">
						<th>분양 종류</th>
						<td>${bunyang.ptype}</td>
					</tr>
					<tr class="">
						<th>건물명</th>
						<td>${bunyang.pname}</td>
					</tr>
					<tr class="">
						<th>금액</th>
						<td>${bunyang.price}</td>
					</tr>
					<tr class="">
						<th>위치</th>
						<td>${bunyang.location }</td>
					<tr>
						<th>세대</th>
						<td>${bunyang.capacity }</td>
					</tr>
					<tr class="">
						<th>분양날짜</th>
						<td>${bunyang.ptime}</td>
					</tr>
					<tr>
						<th>입주날짜</th>
						<td>${bunyang.ltime}</td>
					</tr>
				</tbody>
			</table>
		</div>
		</div>
  </div>
</div>
    <script src="../resources/js/jquery.min.js"></script>
    <script src="../resources/js/popper.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/main.js"></script>
  </body>
</html>