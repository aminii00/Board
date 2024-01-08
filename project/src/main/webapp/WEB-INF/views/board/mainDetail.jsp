<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>글 상세</title>
</head>
<body>
	<div class="container" role="main">
		<br> <br>
		<h2>${boardSearchList.title}</h2>
		<br>
		<form name="form" id="form" role="form" method="post"
			action="${pageContext.request.contextPath}/board/saveBoard.do">

			<div class="mb-3">
				<label for="reg_id">작성자</label>
				<h3 class="form-control">${boardSearchList.name}</h3>
			</div>

			<div class="mb-3">
				<label for="content">내용</label> <img id="profileImg_preview"
					style="width: 1110px; height: 500px;"
					src="${contextPath}/download.do?imageFileName=${boardSearchList.imageFileName}&path=image/${boardSearchList.boardNo}"
					alt="프로필사진"> <br> <br>

				<div><pre>${boardSearchList.content }</pre></div>

			</div>

			<%-- 	<div class="mb-3">
				<label for="tag">TAG</label> <h3 class="form-control" rows="5">${boardSearchList.tag}</h3>
			</div> --%>

			<div>
				<button type="button" onclick="location.href='${contextPath}/board/boardMod.do?boardNo=${boardSearchList.boardNo}';" class="btn btn-sm btn-primary" id="btnSave">수정</button>
				<button type="button" onclick="location.href='${contextPath}/board/boardCancel.do?boardNo=${boardSearchList.boardNo}';" class="btn btn-sm btn-primary" id="btnList">삭제</button>
				<button type="button"
					onclick="location.href='${contextPath}/board/main.do?'"
					class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</form>
	</div>
</body>
</html>