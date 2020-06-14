<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Happyhouse Login</title>

<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet"
	href="resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/form-elements.css">
<link rel="stylesheet" href="resources/assets/css/style.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

<!-- Favicon and touch icons -->
<link rel="shortcut icon" href="assets/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="resources/assets/ico/apple-touch-icon-57-precomposed.png">

</head>

<body
	style="background-image: url('https://previews.123rf.com/images/eugenesergeev/eugenesergeev1712/eugenesergeev171200278/92104077-urban-skyline-with-business-skyscrapers-high-rise-office-buildings-in-city-of-hong-kong-black-and-wh.jpg'); background-size: cover">

	<!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<h3>Happyhouse Login</h3>
								<p>Enter your username and password to log on:</p>
							</div>
							<div class="form-top-right">
								<i class="fa fa-key"></i>
							</div>
						</div>
						<div class="form-bottom">
							<form id="loginForm" method="post"
								action="${root}/user.do/login.do">
								<input type="hidden" name="act" value="loginCheck">
								<div class="form-group">
									<div class="form-group">
										<input type="text" placeholder="아이디" class="form-control"
											id="id" name="id">
									</div>
									<div class="form-group">
										<input type="password" placeholder="비밀번호" class="form-control"
											id="password" name="password">
									</div>
								</div>
								<button type="submit" class="btn">Sign in!</button>
								<input type="button" class="btn"
									onclick="location.href='${root}/user.do/registform'"
									value="회원가입"> <input type="button" class="btn"
									onclick="location.href='${root}/user.do/findpwform.do'" value="비밀번호 찾기">

							</form>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 social-login">
						<div class="social-login-buttons">
							<a class="btn btn-link-1 btn-link-1-facebook" href="#"> <i
								class="fa fa-facebook"></i> Facebook
							</a> <a class="btn btn-link-1 btn-link-1-twitter" href="#"> <i
								class="fa fa-twitter"></i> Twitter
							</a> <a class="btn btn-link-1 btn-link-1-google-plus" href="#"> <i
								class="fa fa-google-plus"></i> Google Plus
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>


	<!-- Javascript -->
	<script src="resources/assets/js/jquery-1.11.1.min.js"></script>
	<script src="resources/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/js/jquery.backstretch.min.js"></script>
	<script src="resources/assets/js/scripts.js"></script>

	<!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

</body>
</html>