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
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color:rgba(255, 206, 86, 0.2)">
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
                    	<a class="nav-link" href="${root}/happyhouse/index.jsp">Home</a>
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
      <div class="col-lg-11" style="padding-left:100px">
				
				<h3>분양가 목록</h3>
				<br>
				<table class="table" align="center">
					<tbody align="center">
						<tr class="table-active row">
							<th class="col-md-2">지역</th>
							<th class="col-md-4">면적</th>
							<th class="col-md-2">년</th>
							<th class="col-md-2">월</th>
							<th class="col-md-2">가격(m^2)</th>
						</tr>
					</tbody>
				</table>

				<c:forEach var="parcel" items="${bunyang}">
					<table class="table">
						<tbody align="center ">
							<tr class="row">
								<td class="col-md-2">${parcel['loc']}</td>
								<td class="col-md-4">${parcel['area']}</td>
								<td class="col-md-2">${parcel.year}</td>
								<td class="col-md-2">${parcel.month}</td>
								<td class="col-md-2">${parcel.price}</td>
							</tr>
						</tbody>
					</table>

				</c:forEach>
				<div class="text-center">${navigation.navigator}</div>
				<div class="section" style="margin-top: 30px;">


				</div>
			</div>
    <!-- /.row -->
  </div>
  </div>
</div>
    <script src="../resources/js/jquery.min.js"></script>
    <script src="../resources/js/popper.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/main.js"></script>
  </body>
</html>