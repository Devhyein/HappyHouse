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
</head>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<body>
	<div class="container">
		<br> <br>
		<div class="row">
			<div class="col-lg-3">

				<h1 class="my-4"></h1>
				<div class="list-group">
					<a href="${root}/parcel.do/main?pg=1" class="list-group-item">분양가 추세(table)</a> 
						<a href="${root}/parcel.do/chartinfo"
						class="list-group-item">분양가 추세(chart)</a> <a
						href="${root}/parcel.do/latest" class="list-group-item">현재
						분양 정보</a>
				</div>
			</div>

			<div class="col-lg-1"></div>

			<div class="col-lg-8" style="height: 500px">
				<canvas id="myChart"></canvas>
			</div>

		</div>
	</div>
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var colors = [ 'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)',
				'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)',
				'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)',
				'rgba(232, 62, 140, 0.2)', 'rgba(108, 117, 125, 0.2)',
				'rgba(32, 201, 151, 0.2)', 'rgba(72, 2, 250, 0.2)',
				'rgba(2, 250, 23, 0.2)', 'rgba(255, 41, 41, 0.2)',
				'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)',
				'rgba(255, 159, 64, 0.2)', 'rgba(232, 62, 140, 0.2)',
				'rgba(108, 117, 125, 0.2)' ]

		var ctx = document.getElementById("myChart").getContext('2d');

		/*
		 - Chart를 생성하면서, 
		 - ctx를 첫번째 argument로 넘겨주고, 
		 - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
		 */
		var count = 0;
		var loc = [];
		var area = [];
		var price = [];
		<c:forEach items="${bunyang}" var="item">
		<c:if test="${item.area eq '전체'}">
		loc.push('${item.loc}');
		price.push('${item.price}');
		</c:if>
		</c:forEach>

		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : loc,
				datasets : [ {
					label : ['가격(m^2)'],
					data : price,
					backgroundColor : colors
				} ]
			},
			options : {
				maintainAspectRatio : false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}

		});
	</script>
</body>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</html>