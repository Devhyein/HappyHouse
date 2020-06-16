<head>
<title>SSAFY</title>
<meta charset="utf-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

<!-- jquery autocomplete -->	
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>


<style>
	ul{
		   list-style:none;
		   padding-left:5px;	   
		   padding-right:5px;	
		      
	   }
</style> 
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!-- nav start -->


<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="#">Happy house</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="/happyhouse/index.jsp">Home <!-- <span class="sr-only">(current)</span> -->
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="${root}/house.do/main?group=all&pg=1">거래 목록</a></li>				
				<li class="nav-item active"><a class="nav-link" href="${root}/parcel.do/main?pg=1">분양 목록</a></li>
				<li class="nav-item active"><a class="nav-link" href="${root}/house.do/streetlamp">안전 지도</a></li>
				<li class="nav-item active"><a class="nav-link" href="#">QnA</a></li>
			</ul> 
			<ul class="navbar-nav ml-auto">
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


