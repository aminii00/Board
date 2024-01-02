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
<title>게시판</title>
</head>
<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
}

section.notice {
	padding: 80px 0;
}

.page-title {
	margin-bottom: 60px;
}

.page-title h3 {
	font-size: 28px;
	color: #333333;
	font-weight: 400;
	text-align: center;
}

#board-search .search-window {
	padding: 15px 0;
	background-color: #f9f7f9;
}

#board-search .search-window .search-wrap {
	display: flex;
	align-items: center;
	position: relative;
	/*   padding-right: 124px; */
	margin: 0 auto;
	width: 80%;
	max-width: 564px;
}

#board-search .search-window .search-wrap input {
	height: 40px;
	width: 100%;
	font-size: 14px;
	padding: 7px 14px;
	border: 1px solid #ccc;
}

#board-search .search-window .search-wrap input:focus {
	border-color: #333;
	outline: 0;
	border-width: 1px;
}

#board-search .search-window .search-wrap .btn {
	position: absolute;
	right: 0;
	top: 0;
	bottom: 0;
	width: 108px;
	padding: 0;
	font-size: 16px;
}

#category {
	height: 40px;
	width: 20%;
	margin: 2px;
	border: 1px solid #ccc;
}

.board-table {
	font-size: 13px;
	width: 100%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 1.4;
	word-break: break-all;
	vertical-align: middle;
}

.board-table a:hover {
	text-decoration: underline;
}

.board-table th {
	text-align: center;
}

.board-table .th-num {
	width: 100px;
	text-align: center;
}

.board-table .th-date {
	width: 200px;
}

.board-table th, .board-table td {
	padding: 14px 0;
}

.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
}

.board-table tbody th {
	padding-left: 28px;
	padding-right: 14px;
	border-top: 1px solid #e7e7e7;
	text-align: left;
}

.board-table tbody th p {
	display: none;
}

.btn {
	display: inline-block;
	padding: 0 30px;
	font-size: 15px;
	font-weight: 400;
	background: transparent;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	text-transform: uppercase;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-ms-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

/* reset */
* {
	list-style: none;
	text-decoration: none;
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.clearfix:after {
	content: '';
	display: block;
	clear: both;
}

.container {
	width: 1100px;
	margin: 0 auto;
}

.blind {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
}

.btn-toform {
	width: 60px;
	height: 30px;
	margin: 0;
}

.btn-square {
	width: 20px;
	height: 20px;
}

.bg-white {
	background-color: #ffffff;
}

.btn-border {
	border: 1px solid #b3b3b3;
}

/*페이지 버튼*/
.ul-li {
	margin-top: 60px;
	list-style: none;
	display: flex;
	flex-direction: row;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
}

.li-btn {
	padding-left: 10px;
}

.btn-2 {
	display: flex;
	flex-direction: row;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	color: rgb(51, 51, 51);
	line-height: 34px;
}

hr.line-black {
	border: 0px;
	height: 2px;
	background-color: black;
	margin: 4px;
}

hr.line-gray {
	border: 0px;
	height: 1px;
	background-color: #b3b3b3;
	margin: 4px;
}

.btn-2 {
	display: flex;
	flex-direction: row;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	color: rgb(51, 51, 51);
	line-height: 34px;
}
</style>
<body>
	<section class="notice">
		<div class="page-title">
			<div class="container">
				<h3 onclick="location.href='${contextPath}/board/main.do?'">게시판</h3>
			</div>
		</div>

		<!-- board seach area -->
		<div id="board-search">
			<div class="container">
				<div class="search-window">
					<form name="form" method="post"
						action="${pageContext.request.contextPath}/board/main.do">
						<div class="search-wrap">
							<label for="search" class="blind">게시판 내용 검색</label>

							<!-- 카테고리 -->
							<select name="category" id="category">
								<option value="all">선택</option>
								<option value="name">작성자</option>
								<option value="content">내용</option>
							</select>
							<!-- 검색창 -->
							<input id="search" type="search" name="search"
								placeholder="검색어를 입력해주세요.">
							<button type="submit" class="btn btn-dark">검색</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- board list area -->
		<div id="board-list">
			<div class="container">
				<table class="board-table">
					<thead>
						<tr>
							<th scope="col" class="th-num">번호</th>
							<th scope="col" class="th-title">제목</th>
							<th scope="col" class="th-date">작성자</th>
							<th scope="col" class="th-date">등록일</th>
						</tr>
					</thead>

					<!--1:1문의 리스트를 넣을 곳-->

					<tbody>
						<c:choose>
							<c:when test="${not empty boardList}">
								<c:forEach var="boardList" items="${boardList}">
									<tr>
										<td>${boardList.boardNo}</td>
										<td
											onclick="location.href='${contextPath}/board/mainDetail.do?boardNo=${boardList.boardNo}';">${boardList.title}</td>
										<td>${boardList.name}</td>
										<td>${boardList.formattedCreDate}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">게시물이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
				</table>

				<br>
				<div style="float: right">
					<button class="btn-toform btn-dark"
						onclick="location.href='${contextPath}/board/mainDetailForm.do'">
						글쓰기</button>
				</div>
			</div>

			<!-- 페이징 처리 -->
			<div>
				<ul class="ul-li">
					<c:if test="${section>1}">
						<li class="li-btn"><a
							href="${contextPath}/board/main.do?section=${section-1}&pageNum=1"
							class="btn-2 btn-square bg-white btn-border"> <img
								width="20px" height="20px"
								src="${contextPath}/img/icon/prev.png" alt="prev" />
						</a></li>
					</c:if>
					<c:set var="end"
						value="${Math.ceil((totalBoardListNum - (section-1)*100) div 10)}" />
					<c:if test="${end>10}">
						<c:set var="end" value="10" />
					</c:if>
					<c:forEach begin="1" end="${end}" var="i">
						<li class="li-btn"><a
							href="${contextPath}/board/main.do?section=${section}&pageNum=${i}"
							class="btn-2 btn-square bg-white btn-border">${((section-1)*10)+i}</a>
						</li>
					</c:forEach>
					<c:if test="${section*100<totalBoardListNum}">
						<li class="li-btn"><a
							href="${contextPath}/board/main.do?section=${section+1}&pageNum=1"
							class="btn-2 btn-square bg-white btn-border"> <img
								width="20px" height="20px"
								src="${contextPath}/img/icon/next.png" alt="next" />
						</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</section>
</body>
</html>