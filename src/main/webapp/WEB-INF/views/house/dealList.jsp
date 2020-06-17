<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="root" value="${pageContext.request.contextPath }"/>

<!doctype html>
<html>
  <head>
  	<title>HappyHouse</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="../resources/css/style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- chart.js CDN -->	
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
	
	
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
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
  </head>
  <body>
	<div class="wrapper d-flex align-items-stretch">
	  <!-- 사이드바 추가 -->
	  <%@ include file="/WEB-INF/views/sidebar/sidebar.jsp"%>
      <!-- 메인 페이지 내용  -->
      <div id="content" class="p-5 p-md-5">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color:rgba(255, 206, 86, 0.2)">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="nav navbar-nav ml-auto">
					<li class="nav-item active">
                    	<a class="nav-link" href="#">Home</a>
                	</li>
				<c:choose>
					<c:when test="${empty id}">
						<li class="nav-item"><a class="nav-link" href="${root}/user.do/loginform"><font size="2em">로그인</font>  </a></li>
						<li class="nav-item"><a class="nav-link" href="${root}/user.do/registform"><font size="2em">회원가입</font></a></li>
					</c:when>
				
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="${root}/user.do/userinfoform"><font size="2em">회원 정보</font></a></li>
						<li class="nav-item"><a class="nav-link" href="${root}/"><font size="2em">로그아웃</font>  </a></li>
					</c:otherwise>
				</c:choose>				
			  </ul>
            </div>
          </div>
        </nav> 
<!-- 여기에요 여기 -->
     <div class="row">
<div class="col-lg-12">
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
						
						<div class="form-group row">
						<div class="form-group">
							<input type="text" class="form-control" id="search" name="search"
								placeholder="검색하실 동 혹은 아파트 이름을 입력해주세요." value="${search}" style="width:500px">
						</div>
						<div class="form-group ml-2" align="center">
							<button type="button" class="btn btn-warning"
								onclick="javascript:pageMove_search(1);">검색</button>
						</div>
						
						
						</div>
					</form>
				</div>
			</div>
		</div>

		<table class="table">
			<tbody align="center">
				<tr class="table-active row">
					<th class="col-md-2">상세보기</th>
					<th class="col-md-1">동</th>
					<th class="col-md">건물명</th>
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
  </div>
  </div>
</div>
	
<!--     <script src="../resources/js/jquery.min.js"></script>
    <script src="../resources/js/popper.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/main.js"></script> -->
  </body>
</html>