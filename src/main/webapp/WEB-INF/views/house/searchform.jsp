<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">
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


<div class="section" style="margin-bottom: 10px;">
		
			<div class="container-fluid">
				<div
					class="sorting-filters text-center d-flex justify-content-center">
					<form id="loginform" method="post" class="form-group" action="" style="margin-top:10px; width:100%">
					<div class="form-group row">
						<div class="form-group align-self-center mr-5"><h4>거래 검색</h4></div>
						<div class="form-group">
							<input type="hidden" name="pg" id="pg" value="">
							<div class="radio text-muted ml-5">
								<label for="all" class="radio-inline p-2"> <input
									type="radio" id="all" value="all" name="group"
									<c:if test="${group eq 'all'}">checked="checked"</c:if>>
									전체
								</label> <label for="apt" class="radio-inline p-2"> <input
									type="radio" id="apt" value="apt" name="group"
									<c:if test="${group eq 'apt'}">checked="checked"</c:if>>
									아파트
								</label> <label for="house" class="radio-inline p-2"> <input
									type="radio" id="house" value="house" name="group"
									<c:if test="${group eq 'house'}">checked="checked"</c:if>>
									주택
								</label> 
								<select name="category" id="category" class="mr-3 ml-1">
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
