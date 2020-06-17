<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="root" value="${pageContext.request.contextPath }"/>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="../resources/css/style.css">


			<nav id="sidebar">
				<div class="p-4 pt-5 sticky-top">
		  		<a href="/happyhouse/index.jsp" class="img logo rounded-circle mb-5" style="background-image: url(../resources/images/logo.jpg);"></a>
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="${root}/happyhouse/index.jsp" data-toggle="collapse" aria-expanded="false">Happy House</a>
	          </li>
	          <li>
	              <a href="/happyhouse/index.jsp">Home</a>
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
	<script src="../resources/js/jquery.min.js"></script>
	<script src="../resources/js/popper.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/main.js"></script>