<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>

<html>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Happy House</title>

<!-- Bootstrap core CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function pageMove(pg) {
		document.getElementById("pg").value = pg;
		location.href = "${root}/parcel.do/main?pg=" + pg;

	}
	function pageMove_search(pg) {
		document.getElementById("pg").value = pg;
		document.getElementById("loginform").action = "${root}/parcel.do/search?pg="
				+ pg;
		document.getElementById("loginform").submit();
	}
</script>

<script>
	$(function() {
		var autocomplete_text = [];

		<c:forEach items="${searchList}" var="list">
		autocomplete_text.push('${list}');
		</c:forEach>

		$("#search").autocomplete({
			source : autocomplete_text
		});
	});
</script>
</head>
<body>
	<div class="container">
		<br> <br>
		<div class="row">

			<div class="col-lg-3">

				<h1 class="my-4"></h1>
				<div class="list-group">
					<a href="${root}/parcel.do/main?pg=1" class="list-group-item">분양가 추세(table)</a> <a href="${root}/parcel.do/chartinfo"
						class="list-group-item">분양가 추세(chart)</a> <a
						href="${root}/house.do/streetlamp" class="list-group-item">현재
						분양 정보</a>
				</div>

			</div>
			<div class="col-lg-9">

				<h3>현재 분양정보</h3>
				<br>
				<table class="table" align="center">
					<tbody align="center">
						<tr class="table-active row">
							<th class="col-md-1">분양종류</th>
							<th class="col-md-2">사업명</th>
							<th class="col-md-2">위치</th>
							<th class="col-md-2">가격</th>
							<th class="col-md-1">세대수</th>
							<th class="col-md-2">분양시기</th>
							<th class="col-md-2">입주시기</th>
						</tr>
					</tbody>
				</table>

				<c:forEach var="parcel" items="${bunyang}">
					<table class="table">
						<tbody align="center ">
							<tr class="row">
								<td class="col-md-1">${parcel.ptype}</td>
								<td class="col-md-2">${parcel.pname}</td>
								<td class="col-md-2">${parcel.location}</td>
								<td class="col-md-2">${parcel.price}</td>
								<td class="col-md-1">${parcel.capacity}</td>
								<td class="col-md-2">${parcel.ptime}</td>
								<td class="col-md-2">${parcel.ltime}</td>
							</tr>
						</tbody>
					</table>

				</c:forEach>
				<div class="text-center">${navigation.navigator}</div>
				<div class="section" style="margin-top: 30px;"></div>
			</div>
		</div>
	</div>
</body>
</html>