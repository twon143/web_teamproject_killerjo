<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>메인테스트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

/* content-->content-header*/
div.content-header {
	width: 750px;
	height: 94px;
	background-color: #6A9CF9;
	display: table;
}

/* content-->content-header-->content-header-title-span*/
div.content-header p {
	display: table-cell;
	vertical-align: middle;
	font-size: 25px;
}
/* 게시판 제목 링크 설정 */
.contnt-header-title-link {
	margin-left: 15px;
	color: white;
	font-weight: bold;
}
/* 게시판 제목 링크 마우스 관련 설정 */
.contnt-header-title-link:hover {
	color: white;
}

/* 게시판내 카테고리 설정 */
.sub-category-nav {
	height: 35px;
	width: 750px;
	border-bottom: 0.5px solid gray;
}
/* 게시판내 카테고리 ul 초기화 설정 */
.sub-category-nav ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}
/* 게시판내 카테고리 ul, li 관련 설정 */
.sub-category-nav ul li {
	color: white;
	background-color: white;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
	position: relative;
	font-size: 12px;
}
/* 게시판내 카테고리 li 관련 설정 */
.sub-category-li {
	text-decoration: none;
	display: block;
	width: 80px;
	font-size: 14px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum;
	color: black;
}
/* 게시판내 카테고리 li 마우스 관련 설정 */
.sub-category-li:hover {
	color: white;
	background-color: #FAF7D0;
}

.sub-category-li a {
	text-decoration: none;
}

.sub-category-li-popular, .sub-category-li-lastest {
	text-decoration: none;
	display: block;
	width: 80px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum;
	color: black;
}

.content-center {
	width: 750px;
	height: 100%;
}

.sub-post-list {
	width: 750px;
	height: 130px;
	border-bottom: 0.5px solid gray;
}

.post-image-div {
	float: left;
	margin-left: 35px;
	width: 121px;
	height: 130px;
	margin-left: 35px;
}

.post-image {
	margin-top: 10px;
}

.post-contents {
	margin-left: 157px;
	width: 592px;
	height: 130px;
}

.content {
	
}

.post-title, .post-content, .post-info, .post-share {
	margin-left: 10px;
}

.post-title {
	font-size: 15px;
	color: black;
}

.post-title:hover {
	color: black;
}

.post-content {
	color: #828282;
	font-size: 12px;
}

.post-content:hover {
	text-decoration: none;
	color: #828282;
}

.btnReplyCount {
	-moz-box-shadow: inset 0px 1px 0px 0px #bbdaf7;
	-webkit-box-shadow: inset 0px 1px 0px 0px #bbdaf7;
	box-shadow: inset 0px 1px 0px 0px #bbdaf7;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #79bbff
		), color-stop(1, #378de5));
	background: -moz-linear-gradient(center top, #79bbff 5%, #378de5 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff',
		endColorstr='#378de5');
	background-color: #79bbff;
	-webkit-border-top-left-radius: 6px;
	-moz-border-radius-topleft: 6px;
	border-top-left-radius: 6px;
	-webkit-border-top-right-radius: 6px;
	-moz-border-radius-topright: 6px;
	border-top-right-radius: 6px;
	-webkit-border-bottom-right-radius: 6px;
	-moz-border-radius-bottomright: 6px;
	border-bottom-right-radius: 6px;
	-webkit-border-bottom-left-radius: 6px;
	-moz-border-radius-bottomleft: 6px;
	border-bottom-left-radius: 6px;
	text-indent: 0;
	border: 1px solid #84bbf3;
	display: inline-block;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	font-style: normal;
	height: 20px;
	line-height: 20px;
	width: 88px;
	text-decoration: none;
	text-align: center;
	text-shadow: 1px 1px 0px #528ecc;
}

.btnReplyCount:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #378de5
		), color-stop(1, #79bbff));
	background: -moz-linear-gradient(center top, #378de5 5%, #79bbff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5',
		endColorstr='#79bbff');
	background-color: #378de5;
}

.btnReplyCount:active {
	position: relative;
	top: 1px;
}

.btnPostTag {
	-moz-box-shadow: inset 0px 1px 0px 0px #fceaca;
	-webkit-box-shadow: inset 0px 1px 0px 0px #fceaca;
	box-shadow: inset 0px 1px 0px 0px #fceaca;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffce79
		), color-stop(1, #eeaf41));
	background: -moz-linear-gradient(center top, #ffce79 5%, #eeaf41 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffce79',
		endColorstr='#eeaf41');
	background-color: #ffce79;
	-webkit-border-top-left-radius: 6px;
	-moz-border-radius-topleft: 6px;
	border-top-left-radius: 6px;
	-webkit-border-top-right-radius: 6px;
	-moz-border-radius-topright: 6px;
	border-top-right-radius: 6px;
	-webkit-border-bottom-right-radius: 6px;
	-moz-border-radius-bottomright: 6px;
	border-bottom-right-radius: 6px;
	-webkit-border-bottom-left-radius: 6px;
	-moz-border-radius-bottomleft: 6px;
	border-bottom-left-radius: 6px;
	text-indent: 0;
	border: 1px solid #eeb44f;
	display: inline-block;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	font-style: normal;
	height: 20px;
	line-height: 20px;
	width: 87px;
	text-decoration: none;
	text-align: center;
	text-shadow: 1px 1px 0px #ce8e28;
}

.btnPostTag:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #eeaf41
		), color-stop(1, #ffce79));
	background: -moz-linear-gradient(center top, #eeaf41 5%, #ffce79 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#eeaf41',
		endColorstr='#ffce79');
	background-color: #eeaf41;
}

.btnPostTag:active {
	position: relative;
	top: 1px;
}

.btnPostTag2 {
	-moz-box-shadow: inset 0px 1px 0px 0px #d9fbbe;
	-webkit-box-shadow: inset 0px 1px 0px 0px #d9fbbe;
	box-shadow: inset 0px 1px 0px 0px #d9fbbe;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #b8e356
		), color-stop(1, #a5cc52));
	background: -moz-linear-gradient(center top, #b8e356 5%, #a5cc52 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#b8e356',
		endColorstr='#a5cc52');
	background-color: #b8e356;
	-webkit-border-top-left-radius: 6px;
	-moz-border-radius-topleft: 6px;
	border-top-left-radius: 6px;
	-webkit-border-top-right-radius: 6px;
	-moz-border-radius-topright: 6px;
	border-top-right-radius: 6px;
	-webkit-border-bottom-right-radius: 6px;
	-moz-border-radius-bottomright: 6px;
	border-bottom-right-radius: 6px;
	-webkit-border-bottom-left-radius: 6px;
	-moz-border-radius-bottomleft: 6px;
	border-bottom-left-radius: 6px;
	text-indent: 0;
	border: 1px solid #83c41a;
	display: inline-block;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	font-style: normal;
	height: 20px;
	line-height: 20px;
	width: 87px;
	text-decoration: none;
	text-align: center;
	text-shadow: 1px 1px 0px #86ae47;
}

.btnPostTag2:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #a5cc52
		), color-stop(1, #b8e356));
	background: -moz-linear-gradient(center top, #a5cc52 5%, #b8e356 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#a5cc52',
		endColorstr='#b8e356');
	background-color: #a5cc52;
}

.btnPostTag2:active {
	position: relative;
	top: 1px;
}

.post-info-span {
	margin-left: 10px;
	font-size: 12px;
}

.post-share, .post-save {
	font-size: 12px;
	font-weight: bold;
	color: #787878;
}

.sub-category-li-widthView {
	margin-left: 120px;
}

.sub-category-li-heightView {
	margin-left: 20px;
}

.sub-category-li-widthView:hover, .sub-category-li-heightView:hover {
	background-color: #dcdcdc;	
}
.sub-post-list2 {
	display: flex;

}
.content-center2 {
	background-color: #dcdcdc;
	width: 750px;
	height: 100%;
}

.post-image-div2 {
	width:178px;
}

.sub-sub-post-list2 {
	margin-left: 5px;
	margin-top: 5px;
	width: 178px;
	height: 188px;
	flex: 1;
	
}

.btnHPostTag {
	-moz-box-shadow:inset 0px 1px 0px 0px #fce2c1;
	-webkit-box-shadow:inset 0px 1px 0px 0px #fce2c1;
	box-shadow:inset 0px 1px 0px 0px #fce2c1;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ffc477), color-stop(1, #fb9e25) );
	background:-moz-linear-gradient( center top, #ffc477 5%, #fb9e25 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffc477', endColorstr='#fb9e25');
	background-color:#ffc477;
	-webkit-border-top-left-radius:6px;
	-moz-border-radius-topleft:6px;
	border-top-left-radius:6px;
	-webkit-border-top-right-radius:6px;
	-moz-border-radius-topright:6px;
	border-top-right-radius:6px;
	-webkit-border-bottom-right-radius:6px;
	-moz-border-radius-bottomright:6px;
	border-bottom-right-radius:6px;
	-webkit-border-bottom-left-radius:6px;
	-moz-border-radius-bottomleft:6px;
	border-bottom-left-radius:6px;
	text-indent:0;
	border:1px solid #eeb44f;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:10px;
	font-weight:bold;
	font-style:normal;
	height:21px;
	line-height:17px;
	width:55px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #cc9f52;
}
.btnHPostTag:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fb9e25), color-stop(1, #ffc477) );
	background:-moz-linear-gradient( center top, #fb9e25 5%, #ffc477 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fb9e25', endColorstr='#ffc477');
	background-color:#fb9e25;
}.btnHPostTag:active {
	position:relative;
	top:1px;
}

.post-title2 {
	font-weight: bold;
	font-size: 13px;
	color: black;
}

.post-title2:hover {
	color: black;
}
.post-userId2 {
	margin-left: 130px;
	font-weight: bold;
	font-size: 12px;
	color: #828282;
}

.post-userId2:hover {
	color: black;
}

.post-contents2 {
	background-color: #ffffff;
	width:178px;
	height: 80px;
}

.btnHPostTag2 {
	-moz-box-shadow:inset 0px 1px 0px 0px #cdfca6;
	-webkit-box-shadow:inset 0px 1px 0px 0px #cdfca6;
	box-shadow:inset 0px 1px 0px 0px #cdfca6;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #b8e356), color-stop(1, #a5cc52) );
	background:-moz-linear-gradient( center top, #b8e356 5%, #a5cc52 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#b8e356', endColorstr='#a5cc52');
	background-color:#b8e356;
	-webkit-border-top-left-radius:6px;
	-moz-border-radius-topleft:6px;
	border-top-left-radius:6px;
	-webkit-border-top-right-radius:6px;
	-moz-border-radius-topright:6px;
	border-top-right-radius:6px;
	-webkit-border-bottom-right-radius:6px;
	-moz-border-radius-bottomright:6px;
	border-bottom-right-radius:6px;
	-webkit-border-bottom-left-radius:6px;
	-moz-border-radius-bottomleft:6px;
	border-bottom-left-radius:6px;
	text-indent:0;
	border:1px solid #83c41a;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:10px;
	font-weight:bold;
	font-style:normal;
	height:21px;
	line-height:17px;
	width:55px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #86ae47;
}
.btnHPostTag2:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #a5cc52), color-stop(1, #b8e356) );
	background:-moz-linear-gradient( center top, #a5cc52 5%, #b8e356 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#a5cc52', endColorstr='#b8e356');
	background-color:#a5cc52;
}.btnHPostTag2:active {
	position:relative;
	top:1px;
}

.btnHPostTag3 {
	-moz-box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	-webkit-box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #378de5) );
	background:-moz-linear-gradient( center top, #79bbff 5%, #378de5 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#378de5');
	background-color:#79bbff;
	-webkit-border-top-left-radius:6px;
	-moz-border-radius-topleft:6px;
	border-top-left-radius:6px;
	-webkit-border-top-right-radius:6px;
	-moz-border-radius-topright:6px;
	border-top-right-radius:6px;
	-webkit-border-bottom-right-radius:6px;
	-moz-border-radius-bottomright:6px;
	border-bottom-right-radius:6px;
	-webkit-border-bottom-left-radius:6px;
	-moz-border-radius-bottomleft:6px;
	border-bottom-left-radius:6px;
	text-indent:0;
	border:1px solid #84bbf3;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:10px;
	font-weight:bold;
	font-style:normal;
	height:21px;
	line-height:19px;
	width:59px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #528ecc;
}
.btnHPostTag3:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #378de5), color-stop(1, #79bbff) );
	background:-moz-linear-gradient( center top, #378de5 5%, #79bbff 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5', endColorstr='#79bbff');
	background-color:#378de5;
}.btnHPostTag3:active {
	position:relative;
	top:1px;
}

.modal-body {
	height: 1000px;
}
</style>
</head>

<body>
	<!-- Post-Detail Modal -->

  <div class="modal fade" id="myModal" role="dialog"> <!-- 사용자 지정 부분① : id명 -->

    <div class="modal-dialog modal-lg">

    

      <!-- Modal content-->

      <div class="modal-content">

        <div class="modal-header">

          <button type="button" class="close" data-dismiss="modal">×</button>

          <h4 class="modal-title">아이언 티어 지망생 오훈식이</h4> <!-- 사용자 지정 부분② : 타이틀 -->
          <button class="post-detail-replyCnt">답변 대기</button>
          <a class="post-detail-userId" href="ku8230">ku8230</a> 님께서 3시간전에 올린 질문

        </div> <!-- div$$ modal-header -->

        <div class="modal-body">
		     <div class="post-detail-title">
          		<p>아이언티어 지망생 오훈식이</p> <!-- 사용자 지정 부분③ : 텍스트 메시지 -->
          	 </div>
          	 
          	 <div class="post-detail-content">
          	 	게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다
          	 	게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다
          	 	게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다 
          	 </div>	

        </div>

        <div class="modal-footer">

          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

        </div>

      </div>

    </div>

  </div>

<!-- End post-detail Modal -->
	<!-- 게시판 전체 div -->
	<div class="content">
		<!-- header부분 div -->
		<div class="content-header">
			<!-- header 부분 제목에대한 <p><a> -->
			<p>
				<a class="contnt-header-title-link" href="/p/java">Java</a>
				<a href="post-write">글쓰기테스트용</a>
				<a href="UserSignUpTest">회원가입테스트용</a>
			</p>

			<div class="nav"></div>

		</div>

		<nav class="sub-category-nav">
			<ul class="sub-category-ul">
				<li class="sub-category-li"><a href="#">Java 전체</a></li>

				<li class="sub-category-li"><img alt=""
					src="images/icon_message.png"> <a href="#">질문</a></li>

				<li class="sub-category-li"><img alt=""
					src="images/icon_post.png"> <a href="#">글</a></li>

				<li class="sub-category-li"><img alt=""
					src="images/icon_link.png"> <a href="#">링크</a></li>

				<li class="sub-category-li"><img alt=""
					src="images/icon_mike.png"> <a href="#">라이브</a></li>

				<li class="sub-category-li-popular"><a href="#">인기순</a></li>
				<li class="sub-category-li-lastest"><a href="#">최신순</a></li>

				<li class="sub-category-li-widthView"><img id="viewToWidth"
					onclick="" alt="" src="images/icon_widthView.png"></li>

				<li class="sub-category-li-heightView"><img id="viewToHeight"
					onclick="" alt="" src="images/icon_heightView.png"></li>
			</ul>
		</nav>
		<!-- 가로로 POST 보기 -->
		<div class="content-center2">
			<div class="sub-post-list2">
				<div class="sub-sub-post-list2">
					<div class="post-image-div2">
						<img alt="" src="images/blank_image2.png">
					</div>

					<div class="post-contents2">
						<button class="btnHPostTag3">답변 대기</button>
						<button class="btnHPostTag">Java</button>
						<button class="btnHPostTag2">언어</button>
						<br /> 
						<a class="post-title2">아이언티어 지망생 오훈식이</a> <br />
						<br />
					<a href="#" class="post-userId2">ku8230</a>
					</div>	
				</div>
				<!-- dummy -->
				<div class="sub-sub-post-list2">
					<div class="post-image-div2">
						<img alt="" src="images/blank_image2.png">
					</div>

					<div class="post-contents2">
					<button class="btnHPostTag3">답변 대기</button>	
					<button class="btnHPostTag">Java</button>
					<button class="btnHPostTag2">언어</button>
					<br /> <a href="#" class="post-title2">아이언티어 지망생 오훈식이</a> <br /><br /> <a
						href="#" class="post-userId2">ku8230</a>
					</div>	
				</div>
				<!--  -->
				<!-- dummy -->
				<div class="sub-sub-post-list2">
					<div class="post-image-div2">
						<img alt="" src="images/blank_image2.png">
					</div>

					<div class="post-contents2">
					<button class="btnHPostTag3">답변 대기</button>	
					<button class="btnHPostTag">Java</button>
					<button class="btnHPostTag2">언어</button>
					<br /> <a href="#" class="post-title2">아이언티어 지망생 오훈식이</a> <br /><br /> <a
						href="#" class="post-userId2">ku8230</a>
					</div>	
				</div>
				<!--  -->
				<!-- dummy -->
				<div class="sub-sub-post-list2">
					<div class="post-image-div2">
						<img alt="" src="images/blank_image2.png">
					</div>

					<div class="post-contents2">
					<button class="btnHPostTag3">답변 대기</button>	
					<button class="btnHPostTag">Java</button>
					<button class="btnHPostTag2">언어</button>
					<br /> <a href="#" class="post-title2">아이언티어 지망생 오훈식이</a> <br /><br /> <a
						href="#" class="post-userId2">ku8230</a>
					</div>	
				</div>
				<!--  -->
			</div>
			
			<!-- dummy data -->
			<div class="sub-post-list2">
				<div class="sub-sub-post-list2">
					<div class="post-image-div2">
						<img alt="" src="images/blank_image2.png">
					</div>

					<div class="post-contents2">
					<button class="btnHPostTag3">답변 대기</button>	
					<button class="btnHPostTag">Java</button>
					<button class="btnHPostTag2">언어</button>
					<br /> <a href="#" class="post-title2">아이언티어 지망생 오훈식이</a> <br /><br /> <a
						href="#" class="post-userId2">ku8230</a>
					</div>	
				</div>
				<!-- dummy -->
				<div class="sub-sub-post-list2">
					<div class="post-image-div2">
						<img alt="" src="images/blank_image2.png">
					</div>

					<div class="post-contents2">
					<button class="btnHPostTag3">답변 대기</button>	
					<button class="btnHPostTag">Java</button>
					<button class="btnHPostTag2">언어</button>
					<br /> <a href="#" class="post-title2">아이언티어 지망생 오훈식이</a> <br /><br /> <a
						href="#" class="post-userId2">ku8230</a>
					</div>	
				</div>
				<!--  -->
				<!-- dummy -->
				<div class="sub-sub-post-list2">
					<div class="post-image-div2">
						<img alt="" src="images/blank_image2.png">
					</div>

					<div class="post-contents2">
					<button class="btnHPostTag3">답변 대기</button>	
					<button class="btnHPostTag">Java</button>
					<button class="btnHPostTag2">언어</button>
					<br /> <a href="#" class="post-title2">아이언티어 지망생 오훈식이</a> <br /><br /> <a
						href="#" class="post-userId2">ku8230</a>
					</div>	
				</div>
				<!--  -->
				<!-- dummy -->
				<div class="sub-sub-post-list2">
					<div class="post-image-div2">
						<img alt="" src="images/blank_image2.png">
					</div>

					<div class="post-contents2">
					<button class="btnHPostTag3">답변 대기</button>	
					<button class="btnHPostTag">Java</button>
					<button class="btnHPostTag2">언어</button>
					<br /> <a href="#" class="post-title2">아이언티어 지망생 오훈식이</a> <br /><br /> <a
						href="#" class="post-userId2">ku8230</a>
					</div>	
				</div>
				<!-- End of Dummy 3/3 width -->
			</div>
			<!-- End of Dummy 2/3 Height -->
			
			<div class="sub-post-list2">
				<div class="sub-sub-post-list2">
					<div class="post-image-div2">
						<img alt="" src="images/blank_image2.png">
					</div>

					<div class="post-contents2">
					<button class="btnHPostTag3">답변 대기</button>	
					<button class="btnHPostTag">Java</button>
					<button class="btnHPostTag2">언어</button>
					<br /> <a href="#" class="post-title2">아이언티어 지망생 오훈식이</a> <br /><br /> <a
						href="#" class="post-userId2">ku8230</a>
					</div>	
				</div>
				<!-- dummy -->
				<div class="sub-sub-post-list2">
					<div class="post-image-div2">
						<img alt="" src="images/blank_image2.png">
					</div>

					<div class="post-contents2">
					<button class="btnHPostTag3">답변 대기</button>	
					<button class="btnHPostTag">Java</button>
					<button class="btnHPostTag2">언어</button>
					<br /> <a href="#" class="post-title2">아이언티어 지망생 오훈식이</a> <br /><br /> <a
						href="#" class="post-userId2">ku8230</a>
					</div>	
				</div>
				<!--  -->
				<!-- dummy -->
				<div class="sub-sub-post-list2">
					<div class="post-image-div2">
						<img alt="" src="images/blank_image2.png">
					</div>

					<div class="post-contents2">
					<button class="btnHPostTag3">답변 대기</button>	
					<button class="btnHPostTag">Java</button>
					<button class="btnHPostTag2">언어</button>
					<br /> <a href="#" class="post-title2">아이언티어 지망생 오훈식이</a> <br /><br /> <a
						href="#" class="post-userId2">ku8230</a>
					</div>	
				</div>
				<!--  -->
				<!-- dummy -->
				<div class="sub-sub-post-list2">
					<div class="post-image-div2">
						<img alt="" src="images/blank_image2.png">
					</div>

					<div class="post-contents2">
					<button class="btnHPostTag3">답변 대기</button>	
					<button class="btnHPostTag">Java</button>
					<button class="btnHPostTag2">언어</button>
					<br /> <a href="#" class="post-title2">아이언티어 지망생 오훈식이</a> <br /><br /> <a
						href="#" class="post-userId2">ku8230</a>
					</div>	
				</div>
				<!-- End of dummy data 3/3 of width -->
			</div>
			<!-- End of dummy data 3/3 of height -->


		</div>
		<!-- 가로로 POST 보기 -->
		
		<!-- 세로로 POST 보기 -->
		<div class="content-center">
			<div class="sub-post-list">
				<div class="post-image-div">
					<img class="post-image" alt="" src="images/blank_image.png">
				</div>


				<div class="post-contents">
					<!-- Dummy Data 1 -->
					<a class="post-title" href="#"><strong>아이언티어 지망생 오훈식이</strong></a>
					<button class="btnReplyCount">답변 대기</button>
					<button class="btnPostTag">Java</button>
					<button class="btnPostTag2">언어</button>
					<br /> <br /> <a class="post-content" href="#">게시판 테스트용 입니다1.
						게시판 테스트용 입니다2. 여기는 게시판 본문입니다. 여기는 자바게시판입니다. 가나다라마마마마
						다다다다가각가가가가자바자바자바바바스프르르링...</a> <br /> <span class="post-info-span"><a
						class="post-info-span-userId" href="#">ku8230</a>님 께서 3시간전에 <a
						class="post-info-span-postName" href="#">Java</a>에 올린 질문</span> <br /> <a
						class="post-share" href="#">공유하기</a> <a class="post-save" href="#">보관하기</a>

				</div>
				<!--  end of div$post-contents -->
			</div>
			<!-- end of div$sub-post-list -->
			<div class="sub-post-list">
				<div class="post-image-div">
					<img class="post-image" alt="" src="images/blank_image.png">
				</div>


				<div class="post-contents">
					<!-- Dummy Data 1 -->
					<a class="post-title" href="#"><strong>아이언티어 지망생 오훈식이</strong></a>
					<button class="btnReplyCount">답변 대기</button>
					<button class="btnPostTag">Java</button>
					<button class="btnPostTag2">언어</button>
					<br /> <br /> <a class="post-content" href="#">게시판 테스트용 입니다1.
						게시판 테스트용 입니다2. 여기는 게시판 본문입니다. 여기는 자바게시판입니다. 가나다라마마마마
						다다다다가각가가가가자바자바자바바바스프르르링...</a> <br /> <span class="post-info-span"><a
						class="post-info-span-userId" href="#">ku8230</a>님 께서 3시간전에 <a
						class="post-info-span-postName" href="#">Java</a>에 올린 질문</span> <br /> <a
						class="post-share" href="#">공유하기</a> <a class="post-save" href="#">보관하기</a>

				</div>
				<!--  end of div$post-contents -->
			</div>
			<!-- end of div$sub-post-list -->
			<div class="sub-post-list">
				<div class="post-image-div">
					<img class="post-image" alt="" src="images/blank_image.png">
				</div>


				<div class="post-contents">
					<!-- Dummy Data 1 -->
					<a class="post-title" href="#"><strong>아이언티어 지망생 오훈식이</strong></a>
					<button class="btnReplyCount">답변 대기</button>
					<button class="btnPostTag">Java</button>
					<button class="btnPostTag2">언어</button>
					<br /> <br /> <a class="post-content" href="#">게시판 테스트용 입니다1.
						게시판 테스트용 입니다2. 여기는 게시판 본문입니다. 여기는 자바게시판입니다. 가나다라마마마마
						다다다다가각가가가가자바자바자바바바스프르르링...</a> <br /> <span class="post-info-span"><a
						class="post-info-span-userId" href="#">ku8230</a>님 께서 3시간전에 <a
						class="post-info-span-postName" href="#">Java</a>에 올린 질문</span> <br /> <a
						class="post-share" href="#">공유하기</a> <a class="post-save" href="#">보관하기</a>

				</div>
				<!--  end of div$post-contents -->
			</div>
			<!-- end of div$sub-post-list -->
			<div class="sub-post-list">
				<div class="post-image-div">
					<img class="post-image" alt="" src="images/blank_image.png">
				</div>


				<div class="post-contents">
					<!-- Dummy Data 1 -->
					<a class="post-title" href="#"><strong>아이언티어 지망생 오훈식이</strong></a>
					<button class="btnReplyCount">답변 대기</button>
					<button class="btnPostTag">Java</button>
					<button class="btnPostTag2">언어</button>
					<br /> <br /> <a class="post-content" href="#">게시판 테스트용 입니다1.
						게시판 테스트용 입니다2. 여기는 게시판 본문입니다. 여기는 자바게시판입니다. 가나다라마마마마
						다다다다가각가가가가자바자바자바바바스프르르링...</a> <br /> <span class="post-info-span"><a
						class="post-info-span-userId" href="#">ku8230</a>님 께서 3시간전에 <a
						class="post-info-span-postName" href="#">Java</a>에 올린 질문</span> <br /> <a
						class="post-share" href="#">공유하기</a> <a class="post-save" href="#">보관하기</a>

				</div>
				<!--  end of div$post-contents -->
			</div>
			<!-- end of div$sub-post-list -->
			<div class="sub-post-list">
				<div class="post-image-div">
					<img class="post-image" alt="" src="images/blank_image.png">
				</div>


				<div class="post-contents">
					<!-- Dummy Data 1 -->
					<a class="post-title" href="#"><strong>아이언티어 지망생 오훈식이</strong></a>
					<button class="btnReplyCount">답변 대기</button>
					<button class="btnPostTag">Java</button>
					<button class="btnPostTag2">언어</button>
					<br /> <br /> <a class="post-content" href="#">게시판 테스트용 입니다1.
						게시판 테스트용 입니다2. 여기는 게시판 본문입니다. 여기는 자바게시판입니다. 가나다라마마마마
						다다다다가각가가가가자바자바자바바바스프르르링...</a> <br /> <span class="post-info-span"><a
						class="post-info-span-userId" href="#">ku8230</a>님 께서 3시간전에 <a
						class="post-info-span-postName" href="#">Java</a>에 올린 질문</span> <br /> <a
						class="post-share" href="#">공유하기</a> <a class="post-save" href="#">보관하기</a>

				</div>
				<!--  end of div$post-contents -->
			</div>
			<!-- end of div$sub-post-list -->
			<div class="sub-post-list">
				<div class="post-image-div">
					<img class="post-image" alt="" src="images/blank_image.png">
				</div>


				<div class="post-contents">
					<!-- Dummy Data 1 -->
					<a class="post-title" href="#"><strong>아이언티어 지망생 오훈식이</strong></a>
					<button class="btnReplyCount">답변 대기</button>
					<button class="btnPostTag">Java</button>
					<button class="btnPostTag2">언어</button>
					<br /> <br /> <a class="post-content" href="#">게시판 테스트용 입니다1.
						게시판 테스트용 입니다2. 여기는 게시판 본문입니다. 여기는 자바게시판입니다. 가나다라마마마마
						다다다다가각가가가가자바자바자바바바스프르르링...</a> <br /> <span class="post-info-span"><a
						class="post-info-span-userId" href="#">ku8230</a>님 께서 3시간전에 <a
						class="post-info-span-postName" href="#">Java</a>에 올린 질문</span> <br /> <a
						class="post-share" href="#">공유하기</a> <a class="post-save" href="#">보관하기</a>

				</div>
				<!--  end of div$post-contents -->
			</div>
			<!-- end of div$sub-post-list -->
			<div class="sub-post-list">
				<div class="post-image-div">
					<img class="post-image" alt="" src="images/blank_image.png">
				</div>


				<div class="post-contents">
					<!-- Dummy Data 1 -->
					<a class="post-title" href="#"><strong>아이언티어 지망생 오훈식이</strong></a>
					<button class="btnReplyCount">답변 대기</button>
					<button class="btnPostTag">Java</button>
					<button class="btnPostTag2">언어</button>
					<br /> <br /> <a class="post-content" href="#">게시판 테스트용 입니다1.
						게시판 테스트용 입니다2. 여기는 게시판 본문입니다. 여기는 자바게시판입니다. 가나다라마마마마
						다다다다가각가가가가자바자바자바바바스프르르링...</a> <br /> <span class="post-info-span"><a
						class="post-info-span-userId" href="#">ku8230</a>님 께서 3시간전에 <a
						class="post-info-span-postName" href="#">Java</a>에 올린 질문</span> <br /> <a
						class="post-share" href="#">공유하기</a> <a class="post-save" href="#">보관하기</a>

				</div>
				<!--  end of div$post-contents -->
			</div>
			<!-- end of div$sub-post-list -->
			<div class="sub-post-list">
				<div class="post-image-div">
					<img class="post-image" alt="" src="images/blank_image.png">
				</div>


				<div class="post-contents">
					<!-- Dummy Data 1 -->
					<a class="post-title" href="#"><strong>아이언티어 지망생 오훈식이</strong></a>
					<button class="btnReplyCount">답변 대기</button>
					<button class="btnPostTag">Java</button>
					<button class="btnPostTag2">언어</button>
					<br /> <br /> <a class="post-content" href="#">게시판 테스트용 입니다1.
						게시판 테스트용 입니다2. 여기는 게시판 본문입니다. 여기는 자바게시판입니다. 가나다라마마마마
						다다다다가각가가가가자바자바자바바바스프르르링...</a> <br /> <span class="post-info-span"><a
						class="post-info-span-userId" href="#">ku8230</a>님 께서 3시간전에 <a
						class="post-info-span-postName" href="#">Java</a>에 올린 질문</span> <br /> <a
						class="post-share" href="#">공유하기</a> <a class="post-save" href="#">보관하기</a>

				</div>
				<!--  end of div$post-contents -->
			</div>
			<!-- end of div$sub-post-list -->
		</div>
		<!-- end of div$content-center -->

	</div>
	<!-- 세로로 POST 보기 -->

<script>
$(document).ready(function () {
	var status = true;
	
	if(status) {
		$('.content-center2').hide();
	}
	
	$('#viewToHeight').click(function() {
		$('.content-center').hide();
		$('.content-center2').show();
	})
	
	$('#viewToWidth').click(function() {
		$('.content-center2').hide();
		$('.content-center').show();
		
	})
	
	

	$('.post-title').click(function() {
		$('#myModal').modal();
	})	

	
	
	
	
})

	
	
	
	
	
</script>
</body>
</html>
