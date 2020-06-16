<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Happy House</title>

  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/css/shop-homepage.css" rel="stylesheet">

</head>
<body> 
 <%@ include file="/WEB-INF/views/header/header.jsp"%>
 <c:set var="root" value="${pageContext.request.contextPath }"/>
<!-- navigation -->
  <!-- Page Content -->
  <div style="margin:60px 45px 30px 45px">
    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4"></h1>
        <div class="list-group">
          <a href="${root}/house.do/main?group=all&pg=1" class="list-group-item">거래 목록</a>
          <a href="${root}/parcel.do/main?pg=1" class="list-group-item">분양 목록</a>
          <a href="${root}/house.do/streetlamp" class="list-group-item">안전 지도</a>
          <a href="#" class="list-group-item">QnA</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->
      <div class="col-lg-9" >
		
	  
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="resources/images/bg1.jpg" style="width: 100%; height: 350px;" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="resources/images/bg2.jpeg" style="width: 100%; height: 350px;" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="resources/images/bg3.jpeg" style="width: 100%; height: 350px;" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div><br>

		<h3>실시간 뉴스</h3><br>
        <div class="row">
		<c:forEach var="newsinfo" items="${newsinfo}">
          <div class="col-lg-3 col-md-6 mb-4">
            <div class="card h-100">
              <a href="${newsinfo.headUrl}"><img class="card-img-top" src="${newsinfo.image}" alt="" style="width: 100%; height: 150px;"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="${newsinfo.headUrl}">${newsinfo.headText}</a>
                </h4>
                <p class="card-text">${newsinfo.contentText}</p>
              </div>
            </div>
          </div>		
		</c:forEach>
        </div>
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
