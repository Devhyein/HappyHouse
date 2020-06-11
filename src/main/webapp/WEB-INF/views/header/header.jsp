<head>
<title>SSAFY</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<style>
	ul{
		   list-style:none;
		   padding-left:5px;	   
		   padding-right:5px;	   
	   }
</style> 
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
    	<nav id="index_nav_login">
			<ul class="m-0 p-0">
		<c:choose>
			<c:when test="${empty id}">
				<li class="float-right"><a class="p-1" href="${root}/user.do/registform"><span class="glyphicon glyphicon-user">회원가입  </span></a></li>
				<li class="float-right"><a class="p-1" href="${root}/user.do/loginform"><span class="glyphicon glyphicon-user">로그인  </span> </a></li>
			</c:when>
			
			<c:otherwise>
				<li class="float-right"><a class="p-1" href="${root}/user.do/logout.do"><span class="glyphicon glyphicon-user">로그아웃  </span> </a></li>
				<li class="float-right"><a class="p-1" href="${root}/user.do/userinfoform"><span class="glyphicon glyphicon-user">회원 정보  </span> </a></li>
			</c:otherwise>
		</c:choose>				
			</ul>
		</nav>
		<header>
				<ul>
					<li><img class="nav-link" src="${root}/icon/hh.jpg" width="16%"/></li>
				</ul>						
		</header>
		<!-- nav start -->
		
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark rounded">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="${root}/house.do/main?group=all&pg=1">거래 목록</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						상권 보기
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${root}/tradehub.do?act=category">업종 별 상권 보기</a>
						<a class="dropdown-item" href="${root}/tradehub.do?act=dong">동 별 상권 보기</a>
					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Notice</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">News</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Contact</a>
				</li>
			</ul>
		</nav>