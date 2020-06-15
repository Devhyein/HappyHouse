<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/header/header.jsp"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript">
	function pageMove(pg) {
		document.getElementById("pg").value = pg;
		var group = document.getElementsByName("group");
		for (var i = 0; i < group.length; i++) {
			if (group[i].checked == true) {
				var g = group[i].value;
				location.href = "${root}/house.do/main?group=" + g + "&pg="
						+ pg;
			}
		}
	}
	function pageMove_search(pg) {
		document.getElementById("pg").value = pg;
		var group = document.getElementsByName("group");
		var g;
		var c;

		for (var i = 0; i < group.length; i++) {
			if (group[i].checked == true) {
				g = group[i].value;
			}
		}
		var category = document.getElementById("category");
		var c = category.options[category.selectedIndex].value;

		document.getElementById("loginform").action = "${root}/house.do/search_deals?pg=" + pg;
		document.getElementById("loginform").submit();
	}
</script>

<!-- jquery autocomplete -->	
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>

<script>
$(function() {
	var autocomplete_text = [];
	<c:forEach items="${searchList}" var="list">
		autocomplete_text.push("${list}");
	</c:forEach>
	 
	$( "#search" ).autocomplete({
		source: function(request, response){
			var results = $.ui.autocomplete.filter(autocomplete_text, request.term);
			response(results.slice(0,10));
		}
	});
});
</script>
<!-- jquery autocomplete -->	

<body>
	<div class="page-wrapper">
		<div class="section" style="margin-bottom: 30px;">
		
			<div class="container-fluid">
				<div
					class="sorting-filters text-center d-flex justify-content-center">
					<form id="loginform" method="post" class="form-group" action="" style="margin-top:10px;">
						<div class="form-group">
							<input type="hidden" name="pg" id="pg" value="">
							<div class="radio text-muted">
								<label for="all" class="radio-inline p-2"> <input
									type="radio" id="all" value="all" name="group"
									onclick="location.href='javascript:pageMove(1);'"
									<c:if test="${group eq 'all'}">checked="checked"</c:if>>
									전체
								</label> <label for="apt" class="radio-inline p-2"> <input
									type="radio" id="apt" value="apt" name="group"
									onclick="location.href='javascript:pageMove(1);'"
									<c:if test="${group eq 'apt'}">checked="checked"</c:if>>
									아파트
								</label> <label for="house" class="radio-inline p-2"> <input
									type="radio" id="house" value="house" name="group"
									onclick="location.href='javascript:pageMove(1);'"
									<c:if test="${group eq 'house'}">checked="checked"</c:if>>
									주택
								</label> <select name="category" id="category">
									<option value="apt"
										<c:if test="${apt ne null}">selected="selected"</c:if>>건물
										이름으로 검색</option>
									<option value="dong"
										<c:if test="${dong ne null}">selected="selected"</c:if>>동
										이름으로 검색</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="search" name="search"
								placeholder="" value="${search}">
						</div>
						<div class="form-group" align="center">
							<button type="button" class="btn btn-warning col-md-4"
								onclick="javascript:pageMove_search(1);">검색</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<table class="table">
			<tbody align="center">
				<tr class="table-active row">
					<th class="col-md-2">상세보기</th>
					<th class="col-md-1">Dong</th>
					<th class="col-md">aptName</th>
					<th class="col-md-1">건설년도</th>
					<th class="col-md-1">거래가</th>
					<th class="col-md-1">거래일자</th>
					<th class="col-md-1">면적</th>
					<th class="col-md-1">층</th>
					<th class="col-md-1">지번</th>
				</tr>
			</tbody>
		</table>

		<c:forEach var="deal" items="${dealList}">
			<table class="table">
				<tbody align="center ">
					<tr class="row">
						<td class="col-md-2">
							<form method="post" action="${root}/house.do/house_info">
								<button class="btn btn-primary btn-sx" name="no"
									value="${deal.no }" type="submit">상세보기</button>
							</form>
						</td>
						<td class="col-md-1">${deal.dong }</td>
						<td class="col-md">${deal.aptName }</td>
						<td class="col-md-1">${deal.buildYear }</td>
						<td class="col-md-1">${deal.dealAmount }</td>
						<td class="col-md-1">${deal.dealYear }.${deal.dealMonth }.${deal.dealDay }</td>
						<td class="col-md-1">${deal.area }</td>
						<td class="col-md-1">${deal.floor }</td>
						<td class="col-md-1">${deal.jibun }</td>

					</tr>
				</tbody>
			</table>

		</c:forEach>
		<div class="text-center">${navigation.navigator}</div>
	</div>
</body>
</html>