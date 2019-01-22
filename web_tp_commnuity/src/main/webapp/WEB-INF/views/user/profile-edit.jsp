<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>킬러헌터</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- <link href="/teamproject/css/main.css" rel="stylesheet" type="text/css"> -->
<link href="<c:url value='/resources/css/layout.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/main.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/resources/css/reset.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/resources/css/profile.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/setting.css' />"
	rel="stylesheet" type="text/css" />





</head>
<body>


	<!-- S:wrapper -->
	<div id="wrapper">

		<!-- S:top-header -->
		<div class="top-header-div top-header center-block">
			<nav
				class="top-header-nav navbar navbar-expand-lg navbar-light bg-light">
				<div class="main-logo-font">
					<div class="mainLogo-div">
						<img class="mainLogoImg" alt=""
							src="/teamproject/resources/images/MainLogoImg.png">
					</div>

					<div class="mainLogo-font-div">
						<div class="mainLogo-font-div-div">
							<a href="/teamproject/" class="logo-font">킬러조</a>
						</div>

					</div>
				</div>
				<c:if test="${empty login}">
					<div class="login-form-div login-form collapse navbar-collapse"
						id="navbarTogglerDemo03">
						<div class="btnLogin-div">
							<input type="button" class="btnLogin" data-toggle="modal"
								data-target="#myModal" value="로그인 또는 회원가입" />
						</div>
					</div>
				</c:if>


				<c:if test="${not empty login}">
					<div class="logined-form">
						<div class="right-float-div">
							<div class="img-notify-div">
								<img class="img-notify" alt=""
									src="/teamproject/resources/images/icon_notify.png">
							</div>
							<div class="img-profile-div">
								<img class="img-profile" alt=""
									src="/teamproject/resources/images/icon_profile.png">
							</div>

							<input type="button" class="btn-settig btn btn-info" value="설정" />

							<form action="user/logout" method="post">
								<input type="submit" class="btn-logout btn btn-info"
									value="로그아웃" />
								<!-- <input type="hidden" name="queryString" value="https://localhost:8443/teamproject/"/> -->
							</form>

						</div>
					</div>
				</c:if>

			</nav>
		</div>

		<!-- E:top-header -->

		<!-- S:top-navbar -->
		<div class="top-nav center-block">
			<nav class="navbar navbar-inverse nav-main-default ">
				<div class="container-fluid  nav-main-wid" id="con">
					<div class="navbar-header">
						<a class="navbar-brand"
							href="/teamproject/board/listPaging?category=all&type=all">전체</a>
					</div>
					<ul class="nav navbar-nav">
						<li class="dropdown menu-language"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">언어 및 도구<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a
									href="/teamproject/board/listPaging?category=php&type=all">PHP</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=javascript&type=all">Javascript</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=java&type=all">Java</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=spring&type=all">Spring</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=nodejs&type=all">Node.js</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=swift&type=all">Swift</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=kotlin&type=all">Kotlin</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=css&type=all">CSS</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=python&type=all">Python</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=jsp&type=all">JSP</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=jquery&type=all">jQuery</a></li>
								<!-- <li><a href="/teamproject/board/listPaging?category=c#&type=all">C#</a></li> -->
							</ul></li>
						<li class="dropdown menu-network"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">네트워크와 서버<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a
									href="/teamproject/board/listPaging?category=linux&type=all">리눅스</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=server_management&type=all">서버관리</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=cdn&type=all">CDN</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=aws&type=all">AWS</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=api&type=all">API</a></li>
							</ul></li>
						<li class="dropdown menu-database"><a class="dropdown-toggle">데이터베이스<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a
									href="/teamproject/board/listPaging?category=sql&type=all">SQL</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=mysql&type=all">MySQL</a></li>
							</ul></li>
						<li class="dropdown menu-project"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">프로젝트 관리<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a
									href="/teamproject/board/listPaging?category=git&type=all">GIT</a></li>
							</ul></li>
						<li class="dropdown menu-bigdata"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">빅데이터<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a
									href="/teamproject/board/listPaging?category=machine_learning&type=all">머신러닝</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=blockchain&type=all">블록체인</a></li>
							</ul></li>
						<li class="dropdown menu-toctoc"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">톡톡<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">유머</a></li>
								<li><a href="#">뉴스와 이슈</a></li>
								<li><a href="#">입문자의 길</a></li>
								<li><a href="#">잡담</a></li>
								<li><a href="#">공지사항</a></li>
								<li><a href="#">IT 제품</a></li>
								<li><a href="#">IT 비즈니스</a></li>
								<li><a href="#">스터디 모집</a></li>
								<li><a href="#">구인</a></li>
								<li><a href="#">세미나</a></li>
								<li><a href="#">천원짜리 팁</a></li>
								<li><a href="#">개발자에게</a></li>
							</ul></li>
					</ul>
					<!-- 상세카테고리들 끝 -->

				</div>
			</nav>

		</div>
		<!-- E:top-navbar -->

		<!-- S:container -->


		<div class="profile-setting" style="margin-left: 200px;">

			<div class="sub-nav-div instant-ul">
				<ul class="nav nav-pills sub-nav">
					<li class="active"><a href="#">프로필 편집</a></li>
					<!--  
					<li><a href="#">알림 내역</a></li>
					<li><a href="#">설정</a></li>
					<li><a href="#">이메일 인증</a></li>
					<li><a href="#">비밀번호 변경</a></li>
					<li class="hide-at-mobile"><a href="#">회원탈퇴</a></li>
					-->
				</ul>
			</div>




			<form class="profile-form form-horizontal" role="form"
				style="margin-top: 10px;">
				<div class="form-group">
					<label for="" class="col-lg-2 col-md-2 col-sm-2 control-label">프로필
						이미지</label>
					<div class="col-lg-10 col-md-10 col-sm-10">
						<img class="img-circle profile-img profile-form-pic pull-left"
							src="https://devsnote.com/assets/data/profile/thumb_175_1180ab5103310e0cbd3a01327cdacd95.jpg?u=1547704356"
							style=""
							onerror='this.src="https://devsnote.com/assets/images/default_profile.jpg"' />
						<!-- <div class="img-select-button">이미지 선택</div> -->
						<div class="profile-select-image">
							<button type="button"
								class="btn btn-default btn-sm profile-img-select-btn">
								<i class="fa fa-camera"></i> 이미지 선택
							</button>
							<input class="profile-file-upload" type="file"
								style="display: none;" name="profile_image" accept="image/*" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="nickname"
						class="col-lg-2 col-md-2 col-sm-2 control-label">닉네임</label>
					<div class="col-lg-10 col-md-10 col-sm-10">
						<input type="text" class="form-control" id="nickname"
							name="nickname" placeholder="닉네임을 입력해주세요"
							value="${user.nickname}">
					</div>
				</div>

				<div class="form-group">
					<label for="summary"
						class="col-lg-2 col-md-2 col-sm-2 control-label">한 줄 소개</label>
					<div class="col-lg-10 col-md-10 col-sm-10">
						<input type="text" class="form-control" id="summary"
							name="summary" placeholder="한 줄 소개를 입력해주세요"
							value="${user.introduce}">
					</div>
				</div>


				<div class="form-group">
					<label for="uri" class="col-lg-2 col-md-2 col-sm-2 control-label">프로필
						주소</label>
					<div class="col-lg-10 col-md-10 col-sm-10"
						style="letter-spacing: 2px">
						http://devsnote.com/u/<input type="text" class="form-control"
							style="width: auto; display: inline; padding: 6px 4px;"
							name="uri" placeholder="영문,숫자,밑줄로만 입력" value="">
					</div>
				</div>

				<div class="form-group">
					<label for="concerns"
						class="col-lg-2 col-md-2 col-sm-2 control-label">관심분야</label>
					<div class="col-lg-10 col-md-10 col-sm-10">
						<input type="text" class="form-control" name="concerns"
							placeholder="관심분야를 콤마를 구분하여 입력해주세요. 예) PHP,자바스크립트,HTML/CSS,MySQL"
							value="">
					</div>
				</div>

				<div class="form-group">
					<label for="homepage_url"
						class="col-lg-2 col-md-2 col-sm-2 control-label"><i
						class="fa fa-home"></i> 홈페이지 주소 </label>
					<div class="col-lg-10 col-md-10 col-sm-10">
						<input type="text" class="form-control" name="homepage_url"
							placeholder="홈페이지 주소를 입력해주세요." value="">
					</div>
				</div>

				<div class="form-group">
					<label for="facebook_url"
						class="col-lg-2 col-md-2 col-sm-2 control-label"><i
						class="fa fa-facebook"></i> 페이스북 주소 </label>
					<div class="col-lg-10 col-md-10 col-sm-10">
						<input type="text" class="form-control" name="facebook_url"
							placeholder="페이스북 주소를 입력해주세요." value="">
					</div>
				</div>

				<div class="form-group">
					<label for="twitter_url"
						class="col-lg-2 col-md-2 col-sm-2 control-label"><i
						class="fa fa-twitter"></i> 트위터 주소 </label>
					<div class="col-lg-10 col-md-10 col-sm-10">
						<input type="text" class="form-control" name="twitter_url"
							placeholder="트위터 주소를 입력해주세요." value="">
					</div>
				</div>

				<div class="form-group">
					<label for="blog_url"
						class="col-lg-2 col-md-2 col-sm-2 control-label"><i
						class="fa fa-rss"></i> 블로그 주소 </label>
					<div class="col-lg-10 col-md-10 col-sm-10">
						<input type="text" class="form-control" name="blog_url"
							placeholder="블로그 주소를 입력해주세요." value="">
					</div>
				</div>

				<div class="form-group">
					<label for="youtube_url"
						class="col-lg-2 col-md-2 col-sm-2 control-label"><i
						class="fa fa-youtube"></i> 유투브 주소 </label>
					<div class="col-lg-10 col-md-10 col-sm-10">
						<input type="text" class="form-control" name="youtube_url"
							placeholder="유투브 주소를 입력해주세요." value="">
					</div>
				</div>

				<div class="form-group">
					<label for="instagram_url"
						class="col-lg-2 col-md-2 col-sm-2 control-label"><i
						class="fa fa-instagram"></i> 인스타그램 주소 </label>
					<div class="col-lg-10 col-md-10 col-sm-10">
						<input type="text" class="form-control" name="instagram_url"
							placeholder="인스타그램 주소를 입력해주세요." value="">
					</div>
				</div>

				<div class="form-group">
					<div
						class="col-lg-offset-2 col-lg-10 col-md-offset-2 col-md-10 col-sm-offset-2 col-sm-10">
						<button type="button" class="profile-edit-btn btn btn-primary" id=""
							data-loading-text="<i class='fa fa-circle-o-notch fa-spin fa-lg'></i> 저장하는 중..">저장</button>
					</div>
				</div>

				<input type="hidden" name="redirect_url" value="/settings/profile">
			</form>
		</div>

		<script>
			var readURL = function(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();

					if (input.files[0].size > 5242880) {
						_alert('5MB 이하 크기의 이미지만 사용 가능합니다.', 'red');
						return;
					}

					reader.onload = function(e) {
						$('.profile-form-pic').attr('src', e.target.result);
					}

					reader.readAsDataURL(input.files[0]);
				}
			}

			$(".profile-file-upload").on('change', function() {
				readURL(this);
			});

			$(".profile-img-select-btn").on('click', function() {
				$(".profile-file-upload").click();
			});

			$('.profile-edit-btn').click(function() {
				doProfileForm($(this));
			});
		</script>


		<!-- 
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.1/jquery-confirm.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/nprogress/0.2.0/nprogress.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.1/jquery.toast.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.1/jquery.toast.min.css" rel="stylesheet" />

<script src="/assets/js/web.min.js?u=1547704356"></script>
 -->



		<!-- E:container-->

		<!-- S:Footer -->

		<style>
.footer-box ul li {
	margin: 15px 0;
}
</style>

		<footer>
			<div class="footer-box">
				<div class="row">
					<div class="col-md-4">
						<ul class="list-unstyled">
							<li style="color: gray;">뎁스노트에 대하여
							<li><a class="twitter-follow-button">Follow @devsnote</a>
						</ul>
					</div>
					<div class="col-md-4">
						<ul class="list-unstyled">
							<li style="color: gray;">도움말
							<li style="color: #ac6f6f;"><a href="#">요청/건의</a></li>
						</ul>
					</div>
				</div>

				<hr style="border-color: #777" />
				<div class="row" style="padding-bottom: 60px">
					<div class="col-md-7">
						<a href="/terms" class="hide-at-mobile a2" data-instant>이용약관</a> <span
							class="hide-at-mobile" style="color: #aaa"> &nbsp;|&nbsp;
						</span> <a href="/privacy" class="hide-at-mobile" data-instant>개인정보취급방침</a>

					</div>
					<div class="col-md-5">
						<span class="muted pull-right">© 2017 드림고어. All rights
							reserved</span>
					</div>

					<div class="col-md-12 text-right" style="color: gray;">
						<div style="color: white;">
							(주)드림고어 <span class="dot-divider"> · </span> 소재지 : 아이티윌
						</div>
						<div>
							사업자 등록 번호 : 713-03-00728 <span class="dot-divider"> · </span>
							통신판매업 신고 : 제 2017-성남분당-1087 호
						</div>
					</div>

				</div>
			</div>
		</footer>

		<!-- E:Footer -->
	</div>
	<!-- E:wrapper -->

<script>
$(document).ready(function(){
	$('#user-profile-edit-btn').click(function(){
		var nickname = $('#nickname').val();
		
		$ajax({
			type: 'post',
			url: '/ex02/profile-edit',
			headers: {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'post'
			},
			data: JSON.stringify({
				'nickname': nickname,
			}),
			success: function(result) {
				alert('프로필 수정 결과' + result);
				getAllReplies();
			}
		});
	});
});
</script>
	

</body>
</html>