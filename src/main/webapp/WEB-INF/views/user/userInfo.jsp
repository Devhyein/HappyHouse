<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<style>
section {
	
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="13.bs4.css" />
<title>회원 정보 확인</title>
<style type="text/css">
section {
	background-color: #e0e0eb;
	width: 70%;
	height: 70%;
	padding: 10% 10% 10% 10%;
	margin: 10% 10% 10% 10%;
	border-radius: 15px;
	font-size: 15px;
	font-weight: bold;
	margin-bottom: 10px;
	float: center;
}
table{
	float: center;
	background-color: #e0e0eb;
	width: 70%;
	height: 70%;
	padding: 10% 10% 10% 10%;
	margin: 10% 10% 10% 10%;
	border-radius: 15px;
	font-size: 15px;
	font-weight: bold;
	margin-bottom: 10px;
}
</style>
</head>
<body style="background-image: url('../resources/images/background.jpg'); background-size:cover">
 <%@ include file="/WEB-INF/views/header/header.jsp"%>
	<div class="container" align="center" >
		<section>
			<h2>회원 정보 확인</h2>
			<div>
				<table class="table">
					<tbody>			
							<tr>
								<td><div class="userId">아이디:</div></td>
								<td>${housemember.id}</td>
							</tr>
							<tr>
								<td><div class="userPw">비밀번호 :</div></td>
								<td>${housemember.password}</td>
							</tr>
							<tr>
								<td><div class="userName">이름 :</div></td>
								<td>${housemember.name}</td>
							</tr>
							<tr>
								<td><div class="userAddr">주소 :</div></td>
								<td>${housemember.address}</td>
							</tr>
							<tr>
								<td><div class="userPhone">전화번호 :</div></td>
								<td>${housemember.phone}</td>
							</tr>						
					</tbody>
				</table>
			</div>
			<input type="button" class="btn btn-primary"
				onClick="location.href='${root}/index.jsp'" value="확인">
			 <input
				type="button" class="btn btn-primary"
				onClick="location.href='${root}/user.do/updateform.do?=${housemember.id}'"
				value="수정"> 
			<a class="btn btn-primary" href="${root}/user.do/remove.do?=${housemember.id}">삭제</a>
		</section>
	</div><br><br><br>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>