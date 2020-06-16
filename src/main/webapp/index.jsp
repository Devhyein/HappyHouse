<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!doctype html>
<html>
<head>
<title>HappyHouse</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>

	<div class="wrapper d-flex align-items-stretch">
		<!-- 사이드바 추가 -->
		<%@ include file="/WEB-INF/views/sidebar/sidebar.jsp"%>
		<!-- 메인 페이지 내용  -->
		<div id="content" class="p-5 p-md-5">
			<!-- 헤더 추가 -->
			<%@ include file="/WEB-INF/views/header/header.jsp"%>

			<div class="row">
				<div class="col-lg-12">

					<div class="container">
						<br>
						<br>
						<%@ include file="/WEB-INF/views/house/searchform.jsp"%>
						<br>
						<br>
					</div>

					<h4>실시간 뉴스</h4>
					<br>
					<div class="row">
						<c:forEach var="newsinfo" items="${newsinfo}">
							<div class="col-lg-3 col-md-6 mb-4">
								<div class="card h-100 bg-dark">
									<a href="${newsinfo.headUrl}"><img class="card-img-top"
										src="${newsinfo.image}" alt=""
										style="width: 100%; height: 120px;"></a>
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