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

<title>글쓰기 창</title>
</head>
<body>
	<div class="container" role="main">
		<h2>board Form</h2>
		<form name="form" id="form" role="form" method="post"
			action="${pageContext.request.contextPath}/board/saveBoard">
			<div class="mb-3">
				<label for="title">제목</label> <input type="text"
					class="form-control" name="title" id="title"
					placeholder="제목을 입력해 주세요">
			</div>
			<div class="mb-3">
				<label for="reg_id">작성자</label> <input type="text"
					class="form-control" name="name" id="reg_id"
					placeholder="이름을 입력해 주세요">
			</div>

			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" name="content" id="content"
					placeholder="내용을 입력해 주세요"></textarea>
			</div>
			<div class="mb-3">
				<label for="tag">사진</label> <input type="file" name="imageFileName"
					onchange="readURL(this);">
			</div>
			<div class="mb-3">
				<label for="tag">TAG</label> <input type="text" class="form-control"
					name="tag" id="tag" placeholder="태그를 입력해 주세요">
			</div>
		</form>
		<div>
			<button type="submit" class="btn btn-sm btn-primary" id="btnSave">저장</button>
			<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
		</div>

	</div>
</body>
</html>