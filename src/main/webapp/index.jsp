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
		<link rel="stylesheet" href="resources/css/style.css">
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="p-4 pt-5">
		  		<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(resources/images/logo.jpg);"></a>
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="/happyhouse/index.jsp" data-toggle="collapse" aria-expanded="false">Home</a>
	          </li>
	          <li>
	              <a href="${root}/house.do/main?group=all&pg=1">거래 목록</a>
	          </li>
	          <li>
<!--               <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"></a>
              <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="#">Page 1</a>
                </li>
                <li>
                    <a href="#">Page 2</a>
                </li>
                <li>
                    <a href="#">Page 3</a>
                </li>
              </ul> -->
	          </li>
	          <li>
              <a href="${root}/parcel.do/main?pg=1">분양 정보</a>
	          </li>
	          <li>
              <a href="${root}/house.do/streetlamp">안전 지도</a>
	          </li>
	          <li>
              <a href="#">QnA</a>
	          </li>
	        </ul>
	
	        <div class="footer">
	        	<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  SSAFY &copy;<script>document.write(new Date().getFullYear());</script> This site is made <i class="icon-heart" aria-hidden="true"></i> by<br><a href="https://edu.ssafy.com" target="_blank">서울_8반_9조</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
	        </div>

	      </div>
    	</nav>
	
        <!-- Page Content  -->
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
      <div class="col-lg-12" >
		
        <div class="container">
        	<br><br>
	        <%@ include file="/WEB-INF/views/house/searchform.jsp"%>
	        <br><br>
        </div>

		<h4>실시간 뉴스</h4><br>
        <div class="row">
		<c:forEach var="newsinfo" items="${newsinfo}">
          <div class="col-lg-3 col-md-6 mb-4">
            <div class="card h-100 bg-dark">
              <a href="${newsinfo.headUrl}"><img class="card-img-top" src="${newsinfo.image}" alt="" style="width: 100%; height: 120px;"></a>
              <div class="card-body text-white">
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
</div>
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/popper.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/main.js"></script>
  </body>
</html>