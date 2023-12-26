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
<link rel="stylesheet" href="css/bootstrap.min2.css" type="text/css">
<script type="text/javascript">

	/* 게시판 입력 폼 유효성 검사 */
	function checkForm() {
		/* 제목 길이 체크 */
		var title = document.insertform.title.value;
		if (title.length < 2) {
			alert('제목은 최소 2자리 이상이어야 합니다.');
			document.insertform.title.focus();
			return false;
		} else if (title.length > 20) {
			alert('제목은 최소 20자리 이하이어야 합니다.');
			document.insertform.title.focus();
			return false;
		}

		/* 내용 길이 체크 */
		var content = document.insertform.content.value;
		if (content.length < 5) {
			alert('내용은 최소 5자리 이상이어야 합니다.');
			document.insertform.content.focus();
			return false;
		} else if (content.length > 1000) {
			alert('내용은 최대 1000자리 이하이어야 합니다.');
			document.insertform.content.focus();
			return false;
		}

		/* 카테고리 선택 체크 */
		var category = document.insertform.category.value;
		if (category == "-") {
			alert('카테고리를 선택해주세요.');
			document.insertform.category.focus();
			return false;

		}
		
		
	}
	
</script>

<style type="text/css">
	.checkout__input_2 input{
		height: 350px;
		width: 100%;
		border: 1px solid #e1e1e1;
		font-size: 14px;
		color: #666666;
		padding-left: 20px;
		margin-bottom: 20px;
	}
	.checkout__input_2 p span {
 		 color: #f08632;
	}
</style>
<title>글 상세</title>
</head>
<body>
	<!-- 게시판 입력 폼 시작 -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="breadcrumb__text">
						<h2>
							Q&A
						</h2>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="breadcrumb__links">
						<a href="">
							Home
						</a>
						<a href="">
						 	Q&A
					 	</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<form name="insertform">
					<input type="hidden" name="command" value="qnaInsert"> 
					<input type="hidden" name="writer" value="${sessionScope.loginfo.no}">
					<div class="row">
						<div class="col-lg-12 col-md-6">
							<h6 class="coupon__code">
								<span class="icon_tag_alt"> </span> 
								Q&A 게시물 작성
							</h6>
							<div class="row">
								<div class="col-lg-8">
									<div class="checkout__input">
										<p>
											제목
												<span>
													*
												</span>
										</p>
										<input type="text" name="title" id="title">
									</div>
								</div>
								<div class="col-lg-4">
									<div class="checkout__input">
										<p>
											카테고리
												<span>
													*
												</span>
										</p>
										<div>
											<select id="category" name="category" class="form">
												<option value="-" selected="selected">선택하세요
												<option value="불편사항">불편사항
												<option value="이용문의">이용문의
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="input-div">
								<div class="checkout__input_2" >
									<p>
										글 내용
											<span>
												*
											</span>
									</p>
									<textarea rows="10" cols="125" style="resize: none;" name="content"></textarea>
								</div>
							</div>
							<br>
							<button type="submit" class="site-btn" onclick="return checkForm();">
								등록
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- 게시판 입력 폼 끝 -->
</body>
</html>