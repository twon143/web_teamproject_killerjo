<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<form action="user/register" method="post" onsubmit="return submitCheck();">
								<div class="form-group">
									<label for="signup_user_id">아이디</label><br> <input type="text" id="signup_user_id" name="id" placeholder="6~12자의 영문, 숫자로만" required="required">
								</div>
								<div id="idDiv" class="form-group"></div>

								<div class="form-group">
									<label for="signup_user_password">비밀번호</label><br> <input type="password" id="signup_user_password" name="password" placeholder="비밀번호 입력" required="required">
								</div>
								<div id="passwordDiv" class="form-group"></div>

								<div class="form-group">
									<label for="signup_user_password_confirm">비밀번호 확인</label><br> <input type="password" id="signup_user_password_confirm" name="password_confirm" placeholder="비밀번호를 다시 입력" required="required">
								</div>
								<div id="passwordDiv1" class="form-group"></div>

								<div class="form-group">
									<label for="signup_user_nickname">닉네임</label><br> <input type="text" id="signup_user_nickname" name="nickname" placeholder="2자 이상" required="required">
								</div>
								<div id="nicknameDiv" class="form-group"></div>

								<div class="form-group">
									<label for="signup_user_email">이메일</label><br> <input type="email" id="signup_user_email" name="email" placeholder="이메일" required="required">
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
								<input type="submit" id="signup-btn" value="회원가입" class="btn btn-primary btn-lg"> <input type="hidden" name="queryString" value="https://localhost:8443/teamproject/">

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
							<form action="user/login-post" method="post">
								<div class="form-group">
									<label for="user_id">아이디</label><br> <input type="text" id="user_id" name="id" placeholder="아이디" required="required">
								</div>
								<div class="form-group">
									<label for="user_password">비밀번호</label><br> <input type="password" id="password" name="password" placeholder="비밀번호" required="required">
								</div>
								<!-- <button type="button" id="login-btn" class="btn btn-primary btn-lg" data-loading-text="<i class='fa fa-circle-o-notch fa-spin fa-lg'>
                           </i> 가입하는 중.. 잠시만 기다려주세요.">로그인</button> -->

								<input type="submit" id="login-btn" value="로그인" class="btn btn-primary btn-lg"> <input type="hidden" name="queryString" value="https://localhost:8443/teamproject/">
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
								<img class="img-profile" alt="" src="/teamproject/resources/images/icon_profile.png">
							</div>

							<form>
								<input type="button" class="btn-settig btn btn-info" value="설정" />
							</form>



							<form action="user/logout" method="post">

								<input type="submit" class="btn-logout btn btn-info" value="로그아웃" />

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
				<div class="container-fluid  nav-main-wid ">
					<div class="navbar-header">
						<a class="navbar-brand" href="/teamproject/board/listPaging?category=all&type=all">전체</a>
					</div>
					<ul class="nav navbar-nav">
						<li class="dropdown menu-language"><a class="dropdown-toggle" data-toggle="dropdown" href="#">언어 및 도구<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/teamproject/board/listPaging?category=php&type=all">PHP</a></li>
								<li><a href="/teamproject/board/listPaging?category=javascript&type=all">Javascript</a></li>
								<li><a href="/teamproject/board/listPaging?category=java&type=all">Java</a></li>
								<li><a href="/teamproject/board/listPaging?category=spring&type=all">Spring</a></li>
								<li><a href="/teamproject/board/listPaging?category=nodejs&type=all">Node.js</a></li>
								<li><a href="/teamproject/board/listPaging?category=swift&type=all">Swift</a></li>
								<li><a href="/teamproject/board/listPaging?category=kotlin&type=all">Kotlin</a></li>
								<li><a href="/teamproject/board/listPaging?category=css&type=all">CSS</a></li>
								<li><a href="/teamproject/board/listPaging?category=python&type=all">Python</a></li>
								<li><a href="/teamproject/board/listPaging?category=jsp&type=all">JSP</a></li>
								<li><a href="/teamproject/board/listPaging?category=jquery&type=all">jQuery</a></li>
								<!-- <li><a href="/teamproject/board/listPaging?category=c#&type=all">C#</a></li> -->
							</ul></li>
						<li class="dropdown menu-network"><a class="dropdown-toggle" data-toggle="dropdown" href="#">네트워크와 서버<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/teamproject/board/listPaging?category=linux&type=all">리눅스</a></li>
								<li><a href="/teamproject/board/listPaging?category=server_management&type=all">서버관리</a></li>
								<li><a href="/teamproject/board/listPaging?category=cdn&type=all">CDN</a></li>
								<li><a href="/teamproject/board/listPaging?category=aws&type=all">AWS</a></li>
								<li><a href="/teamproject/board/listPaging?category=api&type=all">API</a></li>
							</ul></li>
						<li class="dropdown menu-database"><a class="dropdown-toggle">데이터베이스<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/teamproject/board/listPaging?category=sql&type=all">SQL</a></li>
								<li><a href="/teamproject/board/listPaging?category=mysql&type=all">MySQL</a></li>
							</ul></li>
						<li class="dropdown menu-project"><a class="dropdown-toggle" data-toggle="dropdown" href="#">프로젝트 관리<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/teamproject/board/listPaging?category=git&type=all">GIT</a></li>
							</ul></li>
						<li class="dropdown menu-bigdata"><a class="dropdown-toggle" data-toggle="dropdown" href="#">빅데이터<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/teamproject/board/listPaging?category=machine_learning&type=all">머신러닝</a></li>
								<li><a href="/teamproject/board/listPaging?category=blockchain&type=all">블록체인</a></li>
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
					<form class="navbar-form navbar-left search-btn-nav" action="board/searchPaging.jsp">

						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						
							<input type="submit" class="btn btn-default" value="Submit"/>
						
					</form>
				</div>
			</nav>

		</div>
		<!-- E:top-navbar -->

		<!-- S:container -->
		<div id="container" class="container-fluid text-center ">
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

					<!-- top-contents -->
					<div class="top-contents-main">
						<div class=" container-fluid text-center intro">

							<img class="icon-bg-gif" src="/teamproject/resources/images/oriental.gif" class="img-circle" alt="" title="" />
							<div class="slogan ">
								<div class="slogan-text vcenter">
									<div>
										<span>무엇이든</span> <span>질문</span> 하고
									</div>
									<div>
										<span>문제</span> 를 <span>해결</span> 하세요
									</div>
									<div class="slogan-buttons">
										<button type="button" class="btn-default btn-lg slogan-btn">
											<i class="fa"> 전체보기</i>
										</button>
										<button type="button" class="btn-lg slogan-btn btn-warning">
											<i class="fa "> <img src="/teamproject/resources/images/question-icon.png" /> 질문하기
											</i>
										</button>
									</div>
								</div>

							</div>
						</div>

					</div>


					<!-- 게시판 list -->
					<div class="contents-center-mid">

						<!-- 세로로 POST 보기 -->
						<div class="content-center">
							<div class="content-header head-text">인기 질문</div>

							<c:forEach items="${popularQuestionList}" var="board">
								<div class="sub-post-list">
									<div class="post-image-div">

										<!-- <img class="post-image" alt="" src="/teamproject/resources/images/blank_image.png"> -->

										<c:if test="${board.type == 'question'}">
											<a href="/teamproject/board/readPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}&bno=${board.bno}&category=${board.category}&type=${board.type}&sort=${sort}"> <img class="post-image" alt="" src="/teamproject/resources/images/blank_image.png">
											</a>
										</c:if>
										<c:if test="${board.type == 'writing'}">
											<a href="/teamproject/board/readPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}&bno=${board.bno}&category=${board.category}&type=${board.type}&sort=${sort}"> <img class="post-image" alt="" src="/teamproject/resources/images/writing_image.png">
											</a>
										</c:if>
										<c:if test="${board.type == 'link'}">
											<a href="/teamproject/board/readPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}&bno=${board.bno}&category=${board.category}&type=${board.type}&sort=${sort}"> <img class="post-image" alt="" src="/teamproject/resources/images/link_image.png">
											</a>
										</c:if>

									</div>


									<div class="post-contents">
										<!-- Dummy Data 1 -->
										<a class="post-title" href="/teamproject/board/readPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}&bno=${board.bno}&category=${category}&type=${type}&sort=${sort}"><strong>${board.title}</strong></a>
										<button class="btnReplyCount">답변 대기</button>
										<a href="/teamproject/board/listPaging?type=all&category=${board.category}" target="blank">
											<button class="btnPostTag">${board.category}</button>
										</a>
										<!-- <button class="btnPostTag2">언어</button> -->
										<br /> <br /> <a class="post-content" href="#">${board.content}</a> <br /> <span class="post-info-span"> <a class="post-info-span-userId" href="#">${board.writer}</a>님 께서 <a class="post-info-span-postName" href="/teamproject/board/listPaging?type=all&category=${board.category}">${board.category}</a>에 올린 <c:if test="${board.type == 'question'}">질문</c:if> <c:if test="${board.type == 'writing'}">글</c:if> <c:if test="${board.type == 'link'}">링크</c:if>
										</span> <br /> <a class="post-share" href="#">공유하기</a> <a class="post-save" href="#">보관하기</a> <span class="post-info-span"><a class="post-info-span-userId" href="#">${board.writer}</a>님 께서 3시간전에 <a class="post-info-span-postName" href="#">Java</a>에 올린 질문</span> <br /> <a class="post-share" href="#">공유하기</a> <a class="post-save" href="#">보관하기</a>
									</div>
									<!--  end of div$post-contents -->
								</div>
								<!-- end of div$sub-post-list -->
							</c:forEach>


							<h5 class="section-more">
								<a href="#">질문 더보기</a>
							</h5>
						</div>
						<!-- 세로로 POST 보기 -->

						<!-- header부분 div -->
						<div class="content-header2 head-text">인기 글</div>
						<!-- 가로로 POST 보기 -->
						<div class="content-center2">
							<c:forEach var="i" begin="0" end="12" step="4">
								<div class="sub-post-list2">
									<c:forEach var="board" items="${popularWritinList}" begin="${i}" end="${i+3}">
										<div class="sub-sub-post-list2">
											<div class="post-image-div2">
												<c:if test="${board.type == 'question'}">
													<a href="/teamproject/board/readPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}&bno=${board.bno}&category=${board.category}&type=${board.type}&sort=${sort}"> <img class="post-image" alt="" src="/teamproject/resources/images/blank_image.png">
													</a>
												</c:if>
												<c:if test="${board.type == 'writing'}">
													<a href="/teamproject/board/readPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}&bno=${board.bno}&category=${board.category}&type=${board.type}&sort=${sort}"> <img class="post-image" alt="" src="/teamproject/resources/images/writing_image.png">
													</a>
												</c:if>
												<c:if test="${board.type == 'link'}">
													<a href="/teamproject/board/readPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}&bno=${board.bno}&category=${board.category}&type=${board.type}&sort=${sort}"> <img class="post-image" alt="" src="/teamproject/resources/images/link_image.png">
													</a>
												</c:if>
											</div>

											<div class="post-contents2">
												<button class="btnHPostTag3">답변 대기</button>
												<a href="/teamproject/board/listPaging?type=all&category=${board.category}" target="blank">
													<button class="btnHPostTag">${board.category}</button>
												</a>
												<!-- <button class="btnHPostTag2">언어</button> -->
												<br /> <a class="post-title2" href="/teamproject/board/readPagingpage=${criteria.page}&perPageNum=${criteria.perPageNum}&bno=${board.bno}&category=${category}&type=${type}&sort=${sort}">아이언티어 지망생 오훈식</a> <br /> <br /> <a href="#" class="post-userId2">${board.writer}</a>
											</div>
										</div>

									</c:forEach>



								</div>
							</c:forEach>
							<h5 class="section-more" style="margin-left: 20px;">
								<a href="#">글 더보기</a>
							</h5>

						</div>
						<!-- 가로로 POST 보기 -->
					</div>
				</div>

				<!-- contents - right -->
				<div class="contents-right-color">
					<div class="contents-right-div col-sm-2 sidenav contents-main-hei">
						<!-- 로그인 정보가 없을때 -->
						<c:if test="${empty login}">
							<div class="login-form-right-div">

								<form action="user/login-post" method="post">
									<input type="text" name="id" placeholder="아이디" class="login-input-id" required="required" /> <input type="password" name="password" placeholder="비밀번호" class="login-input-pw" required="required" /> <input type="checkbox" id="autoLogin" name="use_cookie" /> <input type="hidden" name="queryString" value="https://localhost:8443/teamproject/" /> <label for="autoLogin">로그인 유지</label> <input type="submit" value="로그인" class="btn-side-login" />
								</form>
								<input type="button" value="아이디/비밀번호 찾기" class="btn-side-findIdAndPw" /> <input type="button" value="구글 로그인" class="btn-side-google-login" />

							</div>
							<!-- 로그인 정보가 있을때 -->
						</c:if>

						<c:if test="${not empty login}">
							<div class="logined-form-right-div">
								<div class="login-profile-div">
									<img class="img-profile-side" alt="" src="/teamproject/resources/images/icon_profile1.png">
								</div>
								<div class="login-id-div">
									<a class="login-id-a">${login.id}</a> <br />
								</div>

								<div class="login-setting-div">
									<img class="img-setting" alt="" src="/teamproject/resources/images/icon_setting.png">
								</div>
								<br />
								<div>
									<!-- <button id="btn-logout">로그아웃</button> -->
									<form action="user/logout" method="post">
										<input type="submit" value="로그아웃">
									</form>
								</div>
							</div>

							<!--  
                                
                                -->


						</c:if>
						<div class="position-btn-ques">
							<form action="board/write-form" method="get">
								<input type="submit" value="질문하기" class="btn-side-question" /> <input type="hidden" name="type" value="question" /> <input type="hidden" name="queryString" value="/teamproject/">
								<!--   <input type="hidden" name="queryString" value="type=question" /> -->
							</form>
							<form action="board/write-form" method="get">
								<input type="submit" value="글 올리기" class="btn-side-question" /> <input type="hidden" name="type" value="writing" /> <input type="hidden" name="queryString" value="/teamproject/">
								<!--   <input type="hidden" name="queryString" value="type=question" /> -->
							</form>
							<form action="board/write-form" method="get">
								<input type="submit" value="링크 올리기" class="btn-side-question" /> <input type="hidden" name="type" value="link" /> <input type="hidden" name="queryString" value="/teamproject/">
								<!--   <input type="hidden" name="queryString" value="type=question" /> -->
							</form>
						</div>
					</div>
				</div>
				<!-- End contents - right -->

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

	<!--아이디, 비밀번호 중복 확인  -->
	<script>
		var checkedId = 0;
		var checkedPw = 0;
		var id = $('#signup_user_id');
		var password = $('#signup_user_password');
		var password1 = $('#signup_user_password_confirm');
		var re = /^[a-z0-9]{6,12}$/ // 아이디와  적합 검사 정규식

		/*아이디 중복 검사 */
		$('#signup_user_id').change(function() {
			console.log("아이디 중복검사 id : " + $('#signup_user_id').val());
			$.ajax({
				type : 'post',
				url : 'user/checkId',
				data : {
					id : $('#signup_user_id').val()
				},
				contentType : 'application/x-www-form-urlencoded',
				success : function(res) {
					console.log("res :" + res);

					var id = $('#signup_user_id').val();
					console.log("id : " + id);

					var result = re.test(id);
					console.log("result : " + result);

					if ($('#signup_user_id').val() == 0) {//  아이디가 비었을 때
						$('#idDiv').html("아이디를 입력하세요");
						$('#idDiv').css('color', 'red');
						checkedId = 0;
					} else if (result == false) { // 아이디 형식 부합X 할 때
						$('#idDiv').html("6~12자 영문 대 소문자,숫자를 사용하세요");
						$('#idDiv').css('color', 'red');
						checkedId = 0;
					} else if (res == 1) { // 아이디 중복
						$('#idDiv').html("중복된 아이디 입니다");
						$('#idDiv').css('color', 'red');
						checkedId = 0;
					} else { // 사용 가능 아이디
						$('#idDiv').html("멋진 아이디입니다");
						$('#idDiv').css('color', 'green');
						checkedId = 1;
					}// end else
				}// end success
			})// end ajax
		})// end 아이디 중복 검사

		/* 비밀번호 확인 */
		$('#signup_user_password').change(function pwCheckFunction() {
			var result = re.test(password.val());
			console.log('result : ' + result);
			console.log('pw :' + password.val());
			// 입력값이 정규식에 부합한지 체크  부합 : true, 아니면 false 리턴 
			if (result == false) { // 정규식에 맞지 않을 때
				$('#passwordDiv').html("8~15자 영문 대 소문자,숫자를 사용하세요");
				$('#passwordDiv').css('color', 'red');
				checkedPw = 0;
			}
			if (result == true && password.val() !== password1.val()) {
				// 비밀번호가 일치하지 않을 때
				$('#passwordDiv1').html("비밀번호가 일치하지 않습니다");
				$('#passwordDiv1').css('color', 'red');
				checkedPw = 0;
			}
			if (result == true && password.val() == password1.val()) {
				//정규식에 부합하고 패스워드 일치
				$('#passwordDiv').html("");
				$('#passwordDiv1').html("");
				checkedPw = 1;
			}
		})// end pwCheckFunction
		/*비밀번호 확인 */
		$('#signup_user_password_confirm').change(function pwCheckFunction1() {
			var result = re.test(password.val());
			console.log('result : ' + result);
			console.log('pw1 :' + password1.val());
			// 입력값이 정규식에 부합한지 체크  부합 : true, 아니면 false 리턴 
			if (result == false) { // 정규식에 맞지 않을 때
				$('#passwordDiv').html("8~15자 영문 대 소문자,숫자를 사용하세요");
				$('#passwordDiv').css('color', 'red');
				checkedPw = 0;
			}
			if (result == true && password.val() !== password1.val()) {
				// 비밀번호가 일치하지 않을 때
				$('#passwordDiv1').html("비밀번호가 일치하지 않습니다");
				$('#passwordDiv1').css('color', 'red');
				checkedPw = 0;
			}
			if (result == true && password.val() == password1.val()) {
				//정규식에 부합하고 패스워드 일치
				$('#passwordDiv').html("");
				$('#passwordDiv1').html("");
				checkedPw = 1;
			}
		})// end pwCheckFunction1

		var nicknameRe = /^[가-힣a-zA-Z]{2,15}$/ // 닉네임 정규식
		var ckeckedNickname = 0;

		/* 닉네임 중복 검사 */
		$('#signup_user_nickname').change(
				function() {
					$.ajax({
						type : 'post',
						url : 'user/checkNickname',
						data : {
							nickname : $('#signup_user_nickname').val()
						},
						contentType : 'application/x-www-form-urlencoded',
						success : function(res) {
							console.log(res);
							var nickname = $('#signup_user_nickname').val();
							console.log("nickname : " + nickname);

							var result = nicknameRe.test($(
									'#signup_user_nickname').val());
							console.log(result);

							if ($('#nickname').val() == 0) {// 닉네임 비었을 때
								$('#nicknameDiv').html("아이디를 입력하세요");
								$('#nicknameDiv').css('color', 'red');
								ckeckedNickname = 0;
							} else if (result == false) { // 닉네임 형식 부합X 할 때
								$('#nicknameDiv').html(
										"2~15자 한글,영문 대 소문자,숫자를 사용하세요");
								$('#nicknameDiv').css('color', 'red');
								ckeckedNickname = 0;
							} else if (res == 1) { // 닉네임 중복
								$('#nicknameDiv').html("중복된 닉네임 입니다");
								$('#nicknameDiv').css('color', 'red');
								ckeckedNickname = 0;
							} else { // 사용 가능 닉네임
								$('#nicknameDiv').html("멋진 아이디입니다");
								$('#nicknameDiv').css('color', 'green');
								ckeckedNickname = 1;
							}// end else
						}// end success
					})// end ajax
				})// end nickname

		function submitCheck() {
			var test = $('[name=agree]').is(':checked');
			var checkedBox = 0;
			if (test == true) {
				checkedBox = 1;
			} else {
				checkedBox = 0;
			}
			console.log("checkedBox : " + checkedBox);
			console.log("checkedId : " + checkedId);
			console.log("checkedPw : " + checkedPw);
			console.log("ckeckedNickname : " + ckeckedNickname);
			if (checkedId == 1 && checkedPw == 1 && ckeckedNickname == 1
					&& checkedBox == 1) {
				alert("환영합니다.");
				return true;
			} else if (checkedBox == 0) {
				alert("이용약관에 동의해주세요");
				return false;
			} else {
				alert("다시 입력해주세요");
				return false;
			}// end else
		}//end submitCheck
	</script>


</body>
</html>