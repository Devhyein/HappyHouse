<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<head>
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
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script type="text/javascript">
		window.onload = function(){
			var btn = document.getElementById("btn1");
			btn.addEventListener('click', function(){
			if (document.getElementById("password").value == "") {
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
			}
			var frm = document.getElementById("frm");
			frm.submit();
		})
	}
</script>
</head>
<body>
	<div class="container" align="center">
	<section>
		<h2>회원 정보 수정</h2>
		<div>
			<c:if test="${housemember != null}">
				<form id="frm" method="post" action="${root}/user.do/update.do">
					<input type="hidden" name="act" value="modifyCheck">

					<div class="form-group">
						<label for="id">아이디 :</label> <input type="text"
							class="form-control" id="id" name="id" value="${housemember.id}">
					</div>
					<div class="form-group">
						<label for="password">비밀번호 :</label> <input type="password"
							class="form-control" id="password" name="password"
							value="${housemember.password}">
					</div>
					<div class="form-group">
						<label for="name">이름 :</label> <input type="text"
							class="form-control" id="name" name="name"
							value="${housemember.name}">
					</div>
					<div class="form-group">
						<label for="address">주소 :</label> <input type="text"
							class="form-control" id="address" name="address"
							value="${housemember.address}">
					</div>
					<div class="form-group">
						<label for="phone">전화번호 :</label> <input type="text"
							class="form-control" id="phone" name="phone"
							value="${housemember.phone}">
					</div>

					<input type="button"  value="수정"  id="btn1">	
				</form>
			</c:if>
			<c:if test="${housemember == null}">
				null
			</c:if>
		</div>
		</section>
	</div>
	<footer class="col-ms-12 rounded mt-1">

		<div class="mt-2 mb-2">
			<!--  img class="float-left" src="${root}/img/ssafy.jpg" style="width: 10%; padding-left: 20px"-->
			<h4 style="background-color: #80aaff">Find us</h4>
			<br>
			<p>
				<span class="glyphicon glyphicon-home"> 서울시 강남구 테헤란로 멀티스퀘어</span>
			</p>
			<p>
				<span class="glyphicon glyphicon-phone"> 1544-9001</span>
			</p>
			<p>
				<span class="glyphicon glyphicon-envelope"> admin@ssafy.com</span>
			</p>
		</div>
	</footer>
</body>
</html>