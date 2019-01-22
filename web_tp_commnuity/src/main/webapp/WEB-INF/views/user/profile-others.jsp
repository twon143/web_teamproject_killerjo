<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>킬러헌터</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- <link href="/teamproject/css/main.css" rel="stylesheet" type="text/css"> -->
<link href="<c:url value='/resources/css/layout.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/main.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/reset.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/profile.css' />" rel="stylesheet" type="text/css" />



</head>
<body>

	<!-- 로그인 모달창 -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!--  -->

				<div class="row">
					<div class="col-sm-6">
						<div class="modal-header">
							<h4>회원가입</h4>
						</div>
						<div class="modal-body">
							<!--회원가입 폼 -->
							<form action="register" method="post" onsubmit="return submitCheck();">
								<div class="form-group">
									<label for="signup_user_id">아이디</label><br> <input type="text" id="signup_user_id" name="id" placeholder="6~12자의 영문, 숫자로만">
								</div>
								<div id="idDiv" class="form-group"></div>

								<div class="form-group">
									<label for="signup_user_password">비밀번호</label><br> <input type="password" id="signup_user_password" name="password" placeholder="비밀번호 입력">
								</div>
								<div id="passwordDiv" class="form-group"></div>

								<div class="form-group">
									<label for="signup_user_password_confirm">비밀번호 확인</label><br> <input type="password" id="signup_user_password_confirm" name="password_confirm" placeholder="비밀번호를 다시 입력">
								</div>
								<div id="passwordDiv1" class="form-group"></div>

								<div class="form-group">
									<label for="signup_user_nickname">닉네임</label><br> <input type="text" id="signup_user_nickname" name="nickname" placeholder="2자 이상">
								</div>
								<div id="nicknameDiv" class="form-group"></div>

								<div class="form-group">
									<label for="signup_user_email">이메일</label><br> <input type="email" id="signup_user_email" name="email" placeholder="이메일">
								</div>

								<p class="help-block">
									입력하신 이메일로 인증 메일이 발송됩니다.
									<!-- 인증 메일을 확인하시면 비밀번호 찾기 등에 사용됩니다. -->
								</p>

								<div class="checkbox">
									<label> <input type="checkbox" name="agree" value="Y"> <a href="/terms" target="_blank">이용약관</a> 에 동의합니다.
									</label>
								</div>

								<!-- <button type="button" id="signup-btn" class="btn btn-primary btn-lg" data-loading-text="<i class='fa fa-circle-o-notch fa-spin fa-lg'>
                           </i> 가입하는 중.. 잠시만 기다려주세요.">가입하기</button> -->
								<input type="submit" id="signup-btn" value="회원가입" class="btn btn-primary btn-lg"> <input type="hidden" name="queryString" value="/teamproject/user/profile">

							</form>
							<!-- 회원가입 폼 -->
						</div>
					</div>
					<div class="col-sm-6">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div class="modal-header">
							<h4>로그인</h4>
						</div>
						<div class="modal-body">
							<form action="login-post" method="post">
								<div class="form-group">
									<label for="user_id">아이디</label><br> <input type="text" id="user_id" name="id" placeholder="아이디">
								</div>
								<div class="form-group">
									<label for="user_password">비밀번호</label><br> <input type="password" id="password" name="password" placeholder="비밀번호">
								</div>
								<!-- <button type="button" id="login-btn" class="btn btn-primary btn-lg" data-loading-text="<i class='fa fa-circle-o-notch fa-spin fa-lg'>
                           </i> 가입하는 중.. 잠시만 기다려주세요.">로그인</button> -->

								<input type="submit" id="login-btn" value="로그인" class="btn btn-primary btn-lg"> <input type="hidden" name="queryString" value="/teamproject/user/profile">
							</form>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
	<!-- 로그인 모달창 끝 -->

	<!-- S:wrapper -->
	<div id="wrapper">

		<!-- S:top-header -->
		<div class="top-header-div top-header center-block">
			<nav class="top-header-nav navbar navbar-expand-lg navbar-light bg-light">
				<div class="main-logo-font">
					<div class="mainLogo-div">
						<img class="mainLogoImg" alt="" src="/teamproject/resources/images/MainLogoImg.png">
					</div>

					<div class="mainLogo-font-div">
						<div class="mainLogo-font-div-div">
							<a href="/teamproject/" class="logo-font">킬러조</a>
						</div>

					</div>
				</div>
				<c:if test="${empty login}">
					<div class="login-form-div login-form collapse navbar-collapse" id="navbarTogglerDemo03">
						<div class="btnLogin-div">
							<input type="button" class="btnLogin" data-toggle="modal" data-target="#myModal" value="로그인 또는 회원가입" />
						</div>
					</div>
				</c:if>


				<c:if test="${not empty login}">
					<div class="logined-form">
						<div class="right-float-div">
							<div class="img-notify-div">
								<img class="img-notify" alt="" src="/teamproject/resources/images/icon_notify.png">
							</div>
							<div class="img-profile-div">
								<a href="profile"> <img class="img-profile" alt="" src="/teamproject/resources/images/icon_profile.png">
								</a>
							</div>

							<form>
								<input type="button" class="btn-settig btn btn-info" value="설정" />
							</form>



							<form action="logout" method="post">

								<input type="submit" class="btn-logout btn btn-info" value="로그아웃" />
								<input type="hidden" name="queryString" value="/teamproject/">
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
				<div class="container-fluid  nav-main-wid ">
					<div class="navbar-header">
						<a class="navbar-brand" href="/teamproject/board/listPaging?category=all&type=all&sort=popular">전체</a>
					</div>
					<ul class="nav navbar-nav">
						<li class="dropdown menu-language"><a class="dropdown-toggle" data-toggle="dropdown" href="#">언어 및 도구<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/teamproject/board/listPaging?category=php&type=all&sort=popular">PHP</a></li>
								<li><a href="/teamproject/board/listPaging?category=javascript&type=all&sort=popular">Javascript</a></li>
								<li><a href="/teamproject/board/listPaging?category=java&type=all&sort=popular">Java</a></li>
								<li><a href="/teamproject/board/listPaging?category=spring&type=all&sort=popular">Spring</a></li>
								<li><a href="/teamproject/board/listPaging?category=nodejs&type=all&sort=popular">Node.js</a></li>
								<li><a href="/teamproject/board/listPaging?category=swift&type=all&sort=popular">Swift</a></li>
								<li><a href="/teamproject/board/listPaging?category=kotlin&type=all&sort=popular">Kotlin</a></li>
								<li><a href="/teamproject/board/listPaging?category=css&type=all&sort=popular">CSS</a></li>
								<li><a href="/teamproject/board/listPaging?category=python&type=all&sort=popular">Python</a></li>
								<li><a href="/teamproject/board/listPaging?category=jsp&type=all&sort=popular">JSP</a></li>
								<li><a href="/teamproject/board/listPaging?category=jquery&type=all&sort=popular">jQuery</a></li>
								<!-- <li><a href="/teamproject/board/listPaging?category=c#&type=all">C#</a></li> -->
							</ul></li>
						<li class="dropdown menu-network"><a class="dropdown-toggle" data-toggle="dropdown" href="#">네트워크와 서버<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/teamproject/board/listPaging?category=linux&type=all&sort=popular">리눅스</a></li>
								<li><a href="/teamproject/board/listPaging?category=server_management&type=all&sort=popular">서버관리</a></li>
								<li><a href="/teamproject/board/listPaging?category=cdn&type=all&sort=popular">CDN</a></li>
								<li><a href="/teamproject/board/listPaging?category=aws&type=all&sort=popular">AWS</a></li>
								<li><a href="/teamproject/board/listPaging?category=api&type=all&sort=popular">API</a></li>
							</ul></li>
						<li class="dropdown menu-database"><a class="dropdown-toggle">데이터베이스<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/teamproject/board/listPaging?category=sql&type=all&sort=popular">SQL</a></li>
								<li><a href="/teamproject/board/listPaging?category=mysql&type=all&sort=popular">MySQL</a></li>
							</ul></li>
						<li class="dropdown menu-project"><a class="dropdown-toggle" data-toggle="dropdown" href="#">프로젝트 관리<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/teamproject/board/listPaging?category=git&type=all&sort=popular">GIT</a></li>
							</ul></li>
						<li class="dropdown menu-bigdata"><a class="dropdown-toggle" data-toggle="dropdown" href="#">빅데이터<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/teamproject/board/listPaging?category=machine_learning&type=all&sort=popular">머신러닝</a></li>
								<li><a href="/teamproject/board/listPaging?category=blockchain&type=all&sort=popular">블록체인</a></li>
							</ul></li>
						<li class="dropdown menu-toctoc"><a class="dropdown-toggle" data-toggle="dropdown" href="#">톡톡<span class="caret"></span></a>
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
					<form class="navbar-form navbar-left search-btn-nav" action="../board/searchPaging" method="get">

						<input type="hidden" name="type" value="all"> <input type="hidden" name="sort" value="popular">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search" name="keyword" />
						</div>
						<input type="submit" class="btn btn-default" value="검색" />

					</form>
				</div>
			</nav>

		</div>
		<!-- E:top-navbar -->


		<!-- S:container -->
		<div id="container" class="container-fluid text-center " style="width: 83%; margin-left: 280px">

			<div class="row content">

				<!-- contents-left -->

				<div class="col-sm-2 sidenav pull-left left on contents-main-hei" style="height: 4350px">
					<ul class="list-group">
						<!-- <li class="list-group-item list-bg"><a class="t-color">카테고리</a></li> -->
						<li class="list-group-item"><a>내 관심</a></li>
						<!-- <li class="list-group-item"><a>질문하기</a></li> -->
						<li class="list-group-item"><a>문의</a></li>
						<li class="list-group-item"><a>고객센터</a></li>
					</ul>
					<div class="grip contents-main-hei" style="background-position: 900px center;"></div>

				</div>



				<!-- contents - center -->
				<!-- post-list-main -->
				<div class="col-sm-8 text-left mid-contents-wrap">
					<div class="content user-div">

						<div class="user-profile"> 
							<div class="media" style="margin-bottom: 0">
								<div class="media-left">
									<div style="position: relative; padding-left: 10px; ">
										<div class="profile-image" style="margin-bottom: 5px">
											<img class="img-circle profile-img media-object" src="https://devsnote.com/assets/data/profile/158_c3cd1942766092d6ce86bd34b38cd703.jpg?u=1547530456" style="border: 5px solid #fff" onerror='this.src="https://devsnote.com/assets/images/default_profile.jpg"' />
										</div>
									
										
									</div>
								</div>
								<div class="media-body"></div>
							</div>
							<form class="profile-background-form">
								<div class="profile-background-image-edit text-center">
									<a class="btn btn-default btn-xs cursor-pointer user-background-image-btn"><i class="fa fa-camera"></i> 배경 이미지 선택</a> <input class="user-background-image-file-upload" type="file" name="profile_background_image" accept="image/*" />
								</div>
							</form>
						</div>
					</div>
					<div class="user-profile-info col-md-3">
						<!-- <h4 class="user-profile-heading">111</h4> -->
						<div class="ques-btn">
							<a class="btn btn-primary" href="/post?type=ask&to_user_no=158"><i class="fa fa-question-circle-o" aria-hidden="true"></i> ${user.nickname}님에게 질문하기</a>
						</div>

						<p class="text-muted hide-at-mobile">
							<fmt:formatDate value="${user.join_date}"
								pattern="yyyy년 MM월" var="regDate"/>
							<i class="fa fa-calendar"></i> ${regDate}
						</p>
						<div class="user-profile-sns">
							<script>
								$('.user-profile-sns a').height(
										$('.user-profile-sns a').width());
								$('.user-profile-sns a')
										.css(
												'line-height',
												$('.user-profile-sns a')
														.width()
														+ 'px');
							</script>
						</div>
					</div>

					<div class="user-contents-div col-md-9">

						<div class="sub-nav-div">
							<ul class="nav nav-pills sub-nav instant-ul">
								<!-- <li class="sub-title hide-at-mobile"></li> -->
								<li class="active focus-profile-tag"><a href="profile-others?writer=${user.id}">올린 포스트</a></li>
								<li class="focus-profile-tag"><a href="#">받은 질문</a></li>
								<li class="focus-profile-tag"><a href="#">올린 답변</a></li>
								<li class="vline-li"><a>|</a></li>
								<!-- 
								<li class="focus-profile-tag"><a href="scrab?">보관한 포스트</a></li>
								<li class="focus-profile-tag"><a href="#">관심 소책자</a></li>
								 -->
							</ul>

						</div>
						
						<c:if test="${boardList == null}">
							<div class="empty-block" style="font-size: 14px;">목록이 없습니다.</div>
						</c:if>

						<c:if test="${boardList != null}">
						
						
							<!-- 격자 보기 -->
							<div class="content-center3">
	
								<c:forEach var="i" begin="0" end="16" step="4">
									<div class="sub-post-list3">
	
										<c:forEach var="board" items="${boardList}" begin="${i}" end="${i+3}">
											<div class="sub-sub-post-list3">
												<div class="post-image-div2">
													<c:if test="${board.type == 'question'}">
														<a href="/teamproject/board/readPaging?bno=${board.bno}&category=${board.category}&type=${board.type}"> <img alt="" src="/teamproject/resources/images/blank_image2.png">
														</a>
													</c:if>
													<c:if test="${board.type == 'writing'}">
														<a href="/teamproject/board/readPaging?bno=${board.bno}&category=${board.category}&type=${board.type}"> <img alt="" src="/teamproject/resources/images/writing_image2.png">
														</a>
													</c:if>
													<c:if test="${board.type == 'link'}">
														<a href="/teamproject/board/readPaging?bno=${board.bno}&category=${board.category}&type=${board.type}"> <img alt="" src="/teamproject/resources/images/link_image2.png">
														</a>
													</c:if>
												</div>
	
												<div class="post-contents2">
													<button class="btnHPostTag3">답변 대기</button>
													<a href="/teamproject/board/listPaging?type=all&category=${board.category}" target="blank">
														<button class="btnPostTag">${board.category}</button>
													</a> <br /> <a class="post-title2" href="/teamproject/board/readPaging?bno=${board.bno}&category=${category}&type=${type}">${board.title}</a> <br /> <br /> <a href="#" class="post-userId2">${board.writer}</a>
												</div>
											</div>
	
										</c:forEach>
	
									</div>
								</c:forEach>
	
							</div>
							<!-- 격자 보기 -->
						</c:if>

					</div>

					<script>
					<!--
						var userBackgroundImageUpload = function() {
							var additionalData = {};
							actWithFile('.profile-background-form',
									'/r/profile_background_update', '수정',
									additionalData, false, function(res) {
										if (res.code == 403) {
											act403(res);
										}
										if (res.code == 200) {
											_alert('수정하였습니다.', 'green');
										} else {
											_alert(res.message, 'red');
										}
									});
						};
						var originUserBackgroundImageUrl = 'https://devsnote.com/assets/data/profile_background/158_61dfeeb361274ae53dac51ccfc3a06a0.jpg?u=1547530456';
						-->

						$(".user-background-image-file-upload").on('change',
								function() {
									readURL(this);
								});
						$(".user-background-image-btn").on('click', function() {
							$(".user-background-image-file-upload").click();
						});
						var readURL = function(input) {
							if (input.files && input.files[0]) {
								var reader = new FileReader();

								if (input.files[0].size > 5242880) {
									_alert('5MB 이하 크기의 이미지만 사용 가능합니다.', 'red');
									return;
								}
								reader.onload = function(e) {
									$('.user-profile').css(
											'background-image',
											'linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ), url('
													+ e.target.result + ')');
								}
								reader.readAsDataURL(input.files[0]);
								<!--
								_confirm(
										"이 이미지로 설정하시겠습니까?",
										'네, 설정하겠습니다.',
										'취소',
										{
											buttons : {
												confirm : {
													text : '네, 설정하겠습니다.',
													btnClass : 'btn-blue',
													keys : [ 'enter' ],
													action : function() {
														userBackgroundImageUpload();
													}
												},
												cancel : {
													text : '취소',
													keys : [ 'esc' ],
													action : function() {
														$('.user-profile')
																.css(
																		'background-image',
																		'linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ), url('
																				+ originUserBackgroundImageUrl
																				+ ')');
													}
												}
											}
										});
								-->
							}
						}
						<!--
						document.getElementById("menu_images").onchange = function() {
							var reader = new FileReader();
							if (this.files[0].size > 528385) {
								alert("Image Size should not be greater than 500Kb");
								$("#menu_image").attr("src", "blank");
								$("#menu_image").hide();
								$('#menu_images').wrap('<form>')
										.closest('form').get(0).reset();
								$('#menu_images').unwrap();
								return false;
							}
							if (this.files[0].type.indexOf("image") == -1) {
								alert("Invalid Type");
								$("#menu_image").attr("src", "blank");
								$("#menu_image").hide();
								$('#menu_images').wrap('<form>')
										.closest('form').get(0).reset();
								$('#menu_images').unwrap();
								return false;
							}
							reader.onload = function(e) {
								// get loaded data and render thumbnail.
								document.getElementById("menu_image").src = e.target.result;
								$("#menu_image").show();
							};

							// read the image file as a data URL.
							reader.readAsDataURL(this.files[0]);
						};
						-->
					</script>
				</div>


			</div>

		</div>


		<!-- E:container-->

		<!-- S:Footer -->
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
						<a href="/terms" class="hide-at-mobile a2" data-instant>이용약관</a> <span class="hide-at-mobile" style="color: #aaa"> &nbsp;|&nbsp; </span> <a href="/privacy" class="hide-at-mobile" data-instant>개인정보취급방침</a>

					</div>
					<div class="col-md-5">
						<span class="muted pull-right">© 2017 드림고어. All rights reserved</span>
					</div>

					<div class="col-md-12 text-right" style="color: gray;">
						<div style="color: white;">
							(주)드림고어 <span class="dot-divider"> · </span> 소재지 : 아이티윌
						</div>
						<div>
							사업자 등록 번호 : 713-03-00728 <span class="dot-divider"> · </span> 통신판매업 신고 : 제 2017-성남분당-1087 호
						</div>
					</div>

				</div>
			</div>
		</footer>

		<!-- E:Footer -->
	</div>
	<!-- E:wrapper -->


	<script src="/teamproject/resources/js/main.js"></script>



</body>
</html>