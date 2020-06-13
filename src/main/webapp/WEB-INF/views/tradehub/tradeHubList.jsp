<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/header/header.jsp"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript">
	function findCategory(str) {
		location.replace("${root}/tradehub.do?act=category&selected=" + str);
	}

	function findDongName(str) {
		location.replace("${root}/tradehub.do?act=dong&selected=" + str);
	}
</script>

<body>
	<br/><br/>
	<div class="container" align="center">
	<c:choose>
		<c:when test="${categorys ne null }">
			<label><h4>업종명  </h4></label>
			<select name="category"
				onchange="javascript:findCategory(this.value)" style="width:200px; height:35px; margin-left:10px;">
				<c:forEach var="category" items="${categorys }">
					<option value="${category }"
						<c:if test="${category eq selected}">selected="selected"</c:if>>${category}</option>
				</c:forEach>
			</select>
		</c:when>

		<c:when test="${dongNames ne null }">
		<label><h4>동명  </h4></label>
			<select name="dongName"
				onchange="javascript:findDongName(this.value)" style="width:200px; height:35px; margin-left:10px;">
				<c:forEach var="dongName" items="${dongNames }">
					<option value="${dongName }"
						<c:if test="${dongName eq selected}">selected="selected"</c:if>>${dongName}</option>
				</c:forEach>
			</select>
		</c:when>

	</c:choose>

	</div>

	<c:choose>
		<c:when test="${shops.size() ==0 }">
			<h3>상권 정보가 없습니다.</h3>

		</c:when>

		<c:otherwise>
				</br>
				<table class="table">
					<tbody align="center">
						<tr class="table-active row">
							<th class="col-md-2">상호명</th>
							<th class="col-md-2">분류</th>
							<th class="col-md-1">층 정보</th>
							<th class="col-md">도로명주소</th>
							<th class="col-md-2">위도</th>
							<th class="col-md-2">경도</th>
						</tr>
					</tbody>
				</table>
			<c:forEach var="shop" items="${shops}">
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
	 <%@ include file="/WEB-INF/views/header/header.jsp"%>
</body>
</html>