<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<head>
	<style>
		section{
		}
		footer {
			text-align:left;
			height: 150px;
			clear: both;
			padding: 20px;
			text-indent: 20px;
		}
	</style>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>로그인</title>
<style type="text/css">
		section {
			background-color: #e0e0eb;
			width: 70%;
			height: 70%;
			margin: 10% 10% 10% 10%;
			padding: 10% 10% 10% 10%;
			border-radius: 15px;
			font-size: 15px;
			font-weight: bold;
			margin-bottom: 10px;
			float: center;
		}	
</style>
</head>
<body>
	<div class="container" align="center" style=" width: 100%">
		<br>
	<section>
		<h2 class="form-signin-heading">로그인</h2>
		<br>
	<form id="loginForm" method="post" action="${root}/user.do/login.do">
		<input type="hidden" name="act" value="loginCheck">
		<div class="form-group" style="width: 70%">
			<div class="form-group">				 
				<input type="text" placeholder="아이디" class="form-control" id="id" name="id">
			</div>
			<div class="form-group">
				<input type="password" placeholder="비밀번호" class="form-control" id="password" name="password">
			</div>
		</div>
		<div class="checkbox">
			<label>
				<input type="checkbox" value="remember-me">
				기억하기
			</label>
		</div>
		
		<input type="submit" class="btn btn-primary" value="로그인" />
		<input type="button" class="btn btn-primary"
			onclick="location.href='${root}/user/join.jsp'" value="회원가입">
		<input type="button" class="btn btn-primary"
			onclick="location.href='${root}/user/findPw.jsp'" value="비밀번호 찾기">
		</form>
	</section>
	</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>

</html>