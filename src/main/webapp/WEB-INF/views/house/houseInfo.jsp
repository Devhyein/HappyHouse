<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Happy House</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">

</head>
<body style="background-image: url('resources/images/background.jpg'); background-size:cover">
 <%@ include file="/WEB-INF/views/header/header.jsp"%>
<br/><br/><br/>
	<div class="row">
		<div class="col-md">
			<img width="900px" height="500px" src="${root}/img/${deal.img}">
		</div>
		<div class="col-md">
		<h5>상세정보</h5>
		
		<table class="table col-md">
			<tbody align="center">
				<tr class="">
					<th>Dong</th>
				</tr>
				<tr>
					<td>${deal.dong }</td>
				</tr>

				<tr class="">
					<th>aptName</th>
				</tr>
				<tr>
					<td>${deal.aptName }</td>
				</tr>
				</tbody>
				</table>
				<table class="table col-md">
			<tbody align="center">
				<tr class="">
					<th>건설년도</th>
					<th>거래가</th>

				</tr>
				<tr>
					<td>${deal.buildYear }</td>
					<td>${deal.dealAmount }</td>
				</tr>
				<tr class="">
					<th>거래일자</th>
					<th>면적</th>
				</tr>
				<tr>
					<td>${deal.dealYear }.${deal.dealMonth }.${deal.dealDay }</td>
					<td>${deal.area }</td>
				</tr>
				<tr class="">
					<th>층</th>
					<th>지번</th>
				</tr>
				<tr>
					<td>${deal.floor }</td>
					<td>${deal.jibun }</td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>
	</br>
	</br>

	<h5 style="margin-left:20px;">주변 상권 정보</h5>

	<c:choose>
		<c:when test="${shops.size() ==0 }">
			<h3>상권 정보가 없습니다.</h3>

		</c:when>

		<c:otherwise>
		<table class="table table-active">
					<tbody align="center">
						<tr class="row">
							<th class="col-md-2">상호명</th>
							<th class="col-md-2">분류</th>
							<th class="col-md-1">층 정보</th>
							<th class="col-md">도로명주소</th>
							<th class="col-md-2">위도</th>
							<th class="col-md-2">경도</th>
						</tr>
			<c:forEach var="shop" items="${shops}">
				</br>
				</br>
				<table class="table">
					<tbody align="center">
						<tr class="row">
							<td class="col-md-2">${shop.shopName }</td>
							<td class="col-md-2">${shop.smallCategoryName }</td>
							<td class="col-md-1">${shop.floorInfo }</td>
							<td class="col-md">${shop.roadAddress }</td>
							<td class="col-md-2">${shop.longitude}</td>
							<td class="col-md-2">${shop.latitude }</td>
						</tr>
					</tbody>
				</table>
			</c:forEach>
		</c:otherwise>
	</c:choose>

 <%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>