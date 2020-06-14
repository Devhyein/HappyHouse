<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>회원가입</title>
<script type="text/javascript">
	window.onload = function(){
	var btn = document.getElementById("btn1");
	btn.addEventListener('click', function(){
		var id = document.getElementById("id");
		var password = document.getElementById("password");
		var name = document.getElementById("name");
		var address = document.getElementById("address");
		var phone = document.getElementById("phone");
		var frm = document.getElementById("frm");
		frm.submit();
	})
	}
/* 	function registerMember() {
		if (document.getElementById("id").value == "") {
			alert("아이디를 입력해주세요");
			return;
		} else if (document.getElementById("password").value == "") {
			alert("비밀번호를 입력해주세요");
			return;
		} else if (document.getElementById("name").value == "") {
			alert("이름을 입력해주세요");
			return;
		} else if (document.getElementById("address").value == "") {
			alert("주소를 입력해주세요");
			return;
		} else if (document.getElementById("phone").value == "") {
			alert("전화번호를 입력해주세요");
			return;
		} else {
			document.getElementById("registerForm").action = "${root}/user.do";
			document.getElementById("registerForm").submit();
		}
	} */
</script>
<style>
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

footer {
	text-align: left;
	height: 150px;
	clear: both;
	padding: 20px;
	text-indent: 20px;
}
</style>
</head>
<body style="background-image: url('../resources/images/background.jpg'); background-size:cover">
	<div class="container" align="center" style="width: 100%">
		<section>
			<h2>회원 가입</h2>
			<form id="frm" method="post" action="${root}/user.do/insert.do">
				<input type="hidden" name="act" value="register">

				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" id="id"
						name="id">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호"
						id="password" name="password">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름" id="name"
						name="name">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="주소"
						id="address" name="address">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="연락처"
						id="phone" name="phone">
				</div>
				 <input type="button" class="btn btn-primary"  value="회원등록"  id="btn1">
			</form>

		</section>
	</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>