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
<body style="background-image: url('resources/images/background.jpg'); background-size:cover">
 <%@ include file="/WEB-INF/views/header/header.jsp"%>
 <c:set var="root" value="${pageContext.request.contextPath }"/>
<!-- navigation -->
  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4"></h1>
        <div class="list-group">
          <a href="${root}/tradehub.do?act=dong" class="list-group-item">동별 검색</a>
          <a href="${root}/house.do/main?group=all&pg=1" class="list-group-item">거래 목록</a>
          <a href="#" class="list-group-item">안심주택 찾기</a>
          <a href="#" class="list-group-item">QnA</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSPNxtvI1qesMXOGyPl6Sng46N0MH1THX8Vto5faYBQGTlRD-ne&usqp=CAU" style="width: 100%; height: 350px;" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRYAwDtfV2lqCPAOc8ZnYewiD_mUqgFpXOHZ66dUkw0ux4waMZL&usqp=CAU" style="width: 100%; height: 350px;" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT7fz1qVDmyCsyeOr50DPq5eOlt4E4RgzzIX99s7FEqgCkW2X_D&usqp=CAU" style="width: 100%; height: 350px;" alt="Third slide">
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
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="${newsinfo.headUrl[0]}"><img class="card-img-top" src="https://s.pstatic.net/imgnews/image/thumb100/016/2020/05/23/1677064.jpg" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">${newsinfo.headText[0]}</a>
                </h4>
                <p class="card-text">${newsinfo.contentText[0]}</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="${newsinfo.headUrl[1]}"><img class="card-img-top" src="https://s.pstatic.net/imgnews/image/thumb100/277/2020/06/09/4694884.jpg" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">${newsinfo.headText[1]}</a>
                </h4>
                <p class="card-text">${newsinfo.contentText[1]}</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="${newsinfo.headUrl[2]}"><img class="card-img-top" src="https://s.pstatic.net/imgnews/image/thumb100/119/2020/03/20/2390452.jpg" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">${newsinfo.headText[2]}</a>
                </h4>
                <p class="card-text">${newsinfo.contentText[2]}</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="${newsinfo.headUrl[3]}"><img class="card-img-top" src="https://s.pstatic.net/imgnews/image/thumb100/011/2020/06/11/3751783.jpg" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">${newsinfo.headText[3]}</a>
                </h4>
                <p class="card-text">${newsinfo.contentText[3]}</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9734; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="${newsinfo.headUrl[4]}"><img class="card-img-top" src="https://s.pstatic.net/imgnews/image/thumb100/417/2018/07/30/332516.jpg" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">${newsinfo.headText[4]}</a>
                </h4>
                <p class="card-text">${newsinfo.contentText[4]}</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="${newsinfo.headUrl[5]}"><img class="card-img-top" src="https://s.pstatic.net/imgnews/image/thumb100/008/2020/06/12/4424043.jpg" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">${newsinfo.headText[5]}</a>
                </h4>
                <p class="card-text">${newsinfo.contentText[5]}</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
<!--   <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    /.container
  </footer> -->
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
