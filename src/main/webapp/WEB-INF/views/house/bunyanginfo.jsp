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
	<div style="margin:30px 30px 30px 30px">
		<br>
		<br>
		<div class="row">

			<div class="col-lg-3">

				<h1 class="my-4"></h1>
				<div class="list-group">
					<a href="${root}/parcel.do/main?pg=1" class="list-group-item">분양가 목록</a> 
						<a href="${root}/parcel.do/chartinfo"
						class="list-group-item">분양가 추세</a> <a
						href="${root}/parcel.do/latest" class="list-group-item">현재
						분양 정보</a>
				</div>

			</div>
			<div class="col-lg-9">

				<h3>분양가 추세</h3>
				<br>
				<table class="table" align="center">
					<tbody align="center">
						<tr class="table-active row">
							<th class="col-md-2">지역</th>
							<th class="col-md-4">면적</th>
							<th class="col-md-2">년</th>
							<th class="col-md-2">월</th>
							<th class="col-md-2">가격(m^2)</th>
						</tr>
					</tbody>
				</table>

				<c:forEach var="parcel" items="${bunyang}">
					<table class="table">
						<tbody align="center ">
							<tr class="row">
								<td class="col-md-2">${parcel['loc']}</td>
								<td class="col-md-4">${parcel['area']}</td>
								<td class="col-md-2">${parcel.year}</td>
								<td class="col-md-2">${parcel.month}</td>
								<td class="col-md-2">${parcel.price}</td>
							</tr>
						</tbody>
					</table>

				</c:forEach>
				<div class="text-center">${navigation.navigator}</div>
				<div class="section" style="margin-top: 30px;">

					<div class="container-fluid">
						<div
							class="sorting-filters text-center d-flex justify-content-center">
							<form id="loginform" method="post" class="form-group" action=""
								style="margin-top: 10px;">
								<div class="form-group">
									<input type="text" class="form-control" id="search"
										name="search" placeholder="" value="${search}">
								</div>
								<div class="form-group" align="center">
									<button type="button" class="btn btn-warning col-md-4"
										onclick="javascript:pageMove_search(1);">검색</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</html>