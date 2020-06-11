<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<style>
		section{
		}
		footer {
			text-align:left;
			height: 150px;
			clear: both;
			padding: 20px;
			text-indent: 20px;
		}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<div id="main">
		<div class="container">
			<div class="mt-2 mb-2">
				<h2 style="align-content: left">Happy House</h2>
			</div>
		</div>

	</div>
	<div align="center">
		<c:set var="root" value="${pageContext.request.contextPath }" />
		<div>
			<!-- End Breadcrumbs -->
			<!-- section start -->
			<section id="index_section" style="background-color: #80aaff">
				<div class="card col-sm-12 mt-1" style="min-height: 450px;">
					<div class="card-body">

						<!-- here start -->
						<div id="map" style="width: 100%; height: 400px; margin: auto;"></div>
						<script
							src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
						<script async defer
							src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC3Jh6Rt72qHXe5GomCfP_4LAuHjs_sr0U&callback=initMap"></script>
						<script>
							var multi = {
								lat : 37.5012743,
								lng : 127.039585
							};
							var map;
							function initMap() {
								map = new google.maps.Map(document
										.getElementById('map'), {
									center : multi,
									zoom : 13
								});
								var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
								var markers = locations.map(function(location,
										i) {
									return new google.maps.Marker({
										position : location,
										label : labels[i % labels.length]
									});
								});
								var markerCluster = new MarkerClusterer(
										map,
										markers,
										{
											imagePath : 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
										});
							}
							var locations = [ {
								lat : 37.5175526,
								lng : 127.047466
							}, {
								lat : 37.5145960,
								lng : 127.106067
							}, {
								lat : 37.5300762,
								lng : 127.123670
							}, {
								lat : 37.4837249,
								lng : 127.032566
							}, {
								lat : 37.5122476,
								lng : 126.939739
							} ];
						</script>
						<!-- here end -->

					</div>
				</div>
			</section>
			<section>
				<div class="card col-lg-4 col-md-6 col-sm-12 float-left mt-1">
				<div class="card-body">
					<h4 class="card-title">강남구 신규 매물</h4>
					<p class="card-text">서울시 강남구 역삼동 강남아파트 1동 101호</p>
					<p class="text-right"><a href="#" class="card-link">바로 가기</a></p>
				</div>
			</div>
			<div class="card col-lg-4 col-md-6 col-sm-12 float-left mt-1">
				<div class="card-body">
					<h4 class="card-title">양천구 신규 매물</h4>
					<p class="card-text">서울시 양천구 신정동 양천아파트 2동 201호</p>
					<p class="text-right"><a href="#" class="card-link">바로 가기</a></p>
				</div>
			</div>
			<div class="card col-lg-4 col-md-6 col-sm-12 float-left mt-1">
				<div class="card-body">
					<h4 class="card-title">구로구 신규 매물</h4>
					<p class="card-text">서울시 구로구 구로동 구로아파트 3동 301호</p>
					<p class="text-right"><a href="#" class="card-link">바로 가기</a></p>
				</div>
			</div>
			<div class="card col-lg-4 col-md-6 col-sm-12 float-left mt-1">
				<div class="card-body">
					<h4 class="card-title">금천구 신규 매물</h4>
					<p class="card-text">서울시 금천구 금천동 금천아파트 4동 401호</p>
					<p class="text-right"><a href="#" class="card-link">바로 가기</a></p>
				</div>
			</div>
			<div class="card col-lg-4 col-md-6 col-sm-12 float-left mt-1">
				<div class="card-body">
					<h4 class="card-title">마포구 신규 매물</h4>
					<p class="card-text">서울시 마포구 합정동 합정아파트 5동 501호</p>
					<p class="text-right"><a href="#" class="card-link">바로 가기</a></p>
				</div>
			</div>
			<div class="card col-lg-4 col-md-6 col-sm-12 float-left mt-1 mb-1">
				<div class="card-body">
					<h4 class="card-title">영등포구 신규 매물</h4>
					<p class="card-text">서울시 영등포구 영등포동 영등포아파트 6동 601호</p>
					<p class="text-right"><a href="#" class="card-link">바로 가기</a></p>
				</div>
			</div>
			</section>
			
			<!-- section end -->
			<footer class="col-ms-12 rounded mt-1">
				
				<div class="mt-2 mb-2">
					<!--  img class="float-left" src="${root}/img/ssafy.jpg" style="width: 10%; padding-left: 20px"-->
					<h4 style="background-color: #80aaff">Find us</h4>
					<br>
					<p><span class="glyphicon glyphicon-home">  서울시 강남구 테헤란로 멀티스퀘어</span></p> 
					<p><span class="glyphicon glyphicon-phone">  1544-9001</span></p> 
					<p><span class="glyphicon glyphicon-envelope">  admin@ssafy.com</span></p> 
				</div>
			</footer>
		</div>
	</div>
</body>
</html>