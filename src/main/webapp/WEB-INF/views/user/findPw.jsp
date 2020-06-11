<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript">
	function find() {
		if (document.getElementById("id").value == "") {
			alert("아이디를 입력해주세요");
			return;
		} else if (document.getElementById("name").value == "") {
			alert("이름을 입력해주세요");
			return;
		} else {
			document.getElementById("findForm").action = "${root}/user.do";
			document.getElementById("findForm").submit();
		}
	}
</script>
</head>
<body>
	<c:if test="${user eq null}">
		<div class="container" align="center">
			<h2>비밀번호 찾기</h2>
			<form id="findForm" method="post" action="">
				<input type="hidden" name="act" value="findpassword">

				<div class="form-group">
					<label for="id">아이디 :</label> <input type="text" class="" id="id"
						name="id">
				</div>
				<div class="form-group">
					<label for="password">이름 :</label> <input type="password" class=""
						id="name" name="name">
				</div>

				<button type="button" class="btn" onclick="javascript:find();">비밀번호
					찾기</button>

			</form>

		</div>
	</c:if>
	<c:if test="${user != null }">
		<div align="center">
			<div>비밀번호 : ${user}</div>
			<button type="button" class="btn"
				onclick="location.href='${root}/user.do?act=login'">로그인</button>
		</div>
	</c:if>
</body>
</html>