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
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#fileImg_preview").attr("src", e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

<!-- <script>
	function processTags() {
		var tagInput = document.getElementById('tagInput');
		var tagResult = document.getElementById('tagResult');

		// 사용자가 입력한 텍스트에서 해시태그 추출
		var tags = tagInput.value.match(/#(\w+)/g);

		// 결과를 보여주기 전에 이전 결과 초기화
		tagResult.innerHTML = '';

		// 해시태그가 있는 경우 각 해시태그에 대한 링크 생성
		if (tags) {
			tags.forEach(function(tag) {
				var tagLink = document.createElement('a');
				tagLink.href = 'https://www.instagram.com/explore/tags/'
						+ tag.slice(1);
				tagLink.textContent = tag;
				tagResult.appendChild(tagLink);
				tagResult.appendChild(document.createTextNode(' ')); // 해시태그 간 간격
			});
		} else {
			tagResult.textContent = '입력된 해시태그가 없습니다.';
		}
	}
</script> -->
<title>글쓰기 창</title>
</head>
<body>
	<div class="container" role="main">
		<h2>board Form</h2>
		<form name="form" id="form" role="form" method="post"
			action="${pageContext.request.contextPath}/board/saveBoard.do "
			enctype="multipart/form-data">
			<div class="mb-3">
				<label for="title">제목</label> <input type="text"
					class="form-control" name="title" id="title"
					placeholder="제목을 입력해 주세요"
					value="${not empty boardSearchList ? boardSearchList.title : ''}">
			</div>
			<div class="mb-3">
				<label for="reg_id">작성자</label> <input type="text"
					class="form-control" name="name" id="reg_id"
					placeholder="이름을 입력해 주세요"
					value="${not empty boardSearchList ? boardSearchList.name : ''}">
			</div>

			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" name="content" id="content"
					placeholder="내용을 입력해 주세요">${not empty boardSearchList ? boardSearchList.content : ''}</textarea>
			</div>

			<div class="mb-3">
    <c:choose>
        <c:when test="${empty boardSearchList.imageFileName}">
            <div class="mb-3">
                <label for="imageFileName">이미지 파일</label>
                <input type="file" name="imageFileName" onchange="readURL(this);">
            </div>
        </c:when>
        <c:otherwise>
            <div class="mb-3">
                <label for="imageFileName">현재 이미지</label>
                <img id="profileImg_preview"
                    src="${contextPath}/download.do?imageFileName=${boardSearchList.imageFileName}&path=image/${boardSearchList.boardNo}"
                    alt="이미지 미리보기">
                    <input type="file" name="imageFileName" onchange="readURL(this);">
            </div>
        </c:otherwise>
    </c:choose>
</div>


			<!-- 			<div class="mb-3">
				<label for="tag">TAG</label> <input type="text" class="form-control"
					name="tag" id="tag" placeholder="태그를 입력해 주세요">
				<button onclick="processTag()">처리</button>
			</div> -->


			<div>
				<button type="submit" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</form>
	</div>
	<br>
	<br>

</body>
</html>