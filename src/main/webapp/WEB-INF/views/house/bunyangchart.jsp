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
		<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="../resources/css/style.css">
  </head>
  <body>
		
	<div class="wrapper d-flex align-items-stretch">
	  <!-- 사이드바 추가 -->
	 			<nav id="sidebar">
				<div class="p-4 pt-5">
		  		<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(resources/images/logo.jpg);"></a>
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="${root}/happyhouse/index.jsp" data-toggle="collapse" aria-expanded="false">Home</a>
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

     <div class="row">
			<div class="row col-lg-12" style="height: 500px">
				<h4>분양가 추세</h4>
				<canvas id="myChart"></canvas>
			</div><br>	

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
    <script src="../resources/js/jquery.min.js"></script>
    <script src="../resources/js/popper.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/main.js"></script>
  </body>
</html>