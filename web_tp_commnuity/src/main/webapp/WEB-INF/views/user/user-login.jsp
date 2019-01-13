<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  
<link href="/teamproject/css/main.css" rel="stylesheet" type="text/css">
<link href="/teamproject/css/layout.css" rel="stylesheet" type="text/css">
<link href="/teamproject/css/reset.css" rel="stylesheet" type="text/css">
<link href="/teamproject/css/login-form.css" rel="stylesheet" type="text/css">
-->

<!-- css파일 링크 -->
<link href="<c:url value='/resources/css/main.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/resources/css/reset.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/resources/css/login-form.css' />"
	rel="stylesheet" type="text/css" />

</head>
<body>
	<!-- 전체 div -->
	<div class="contents">
		<!-- 로고부분 div -->
		<div class="contents-logo-div">
			<div class="mainLogo-div">
				<img class="mainLogoImg" alt=""
					src="/teamproject/resources/images/MainLogoImg.png">
			</div>

			<div class="mainLogo-font-div">
				<div class="mainLogo-font-div-div">
					<a href="/" class="logo-font">킬러조</a>
				</div>
			</div>

			<div class="mainLogo-submit-div">
				<input type="submit" value="검색" class="btnSubmit" />
			</div>

			<div class="mainLogo-searchBox-div">
				<input type="text" placeholder=검색... class="searchBox" />
			</div>



		</div>

		<!-- S:top-nav -->
		<div class="top-nav center-block">
			<nav class="navbar navbar-inverse">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">전체</a>
					</div>
					<!-- 상세 카테고리들 -->
					<ul class="nav navbar-nav">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">언어 및 도구<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">PHP</a></li>
								<li><a href="#">Javascript</a></li>
								<li><a href="#">Java</a></li>
								<li><a href="#">Spring</a></li>
								<li><a href="#">Node.js</a></li>
								<li><a href="#">Swift</a></li>
								<li><a href="#">Kotlin</a></li>
								<li><a href="#">CSS</a></li>
								<li><a href="#">Python</a></li>
								<li><a href="#">JSP</a></li>
								<li><a href="#">jQuery</a></li>
								<li><a href="#">C#</a></li>
								<li><a href="#">React Native</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">네트워크와 서버<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">리눅스</a></li>
								<li><a href="#">서버관리</a></li>
								<li><a href="#">CDN</a></li>
								<li><a href="#">AWS</a></li>
								<li><a href="#">API</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">데이터베이스<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">SQL</a></li>
								<li><a href="#">MySQL</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">프로젝트 관리<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">GIT</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">빅데이터<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">머신러닝</a></li>
								<li><a href="#">블록체인</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
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
		<!-- E:top-nav -->

		<!-- 본문 부분 부트스트랩 section(1:10:1)으로 나눔-->
		<div class="container-fluid container-body">
			<div class="row">
				<div class="col-sm-1"></div>
				<!-- section(1:10:1)중 10부분 시작 -->
				<div class="col-sm-10">
					<!-- info-div -->
					<div class="info">
						<button type="button" class="btn-close">x</button>
						<p class="p-info p1">로그인을 해야만 이용할 수 있는 기능입니다.</p>
						<br />
						<p class="p-info p2">간단하게 회원가입하거나 로그인해서 이용하실 수 있습니다.
						<p>
					</div>
					<!-- 1/2로 왼쪽 오른쪽 나눠서 회원가입이랑 로그인을 분리 -->
					<!-- section-left div -->
					<div class="section-left">
						<div class="left-title-div">
							<p class="left-p-title">회원가입</p>
							<p class="left-p-sub-title">간단하게 회원가입 하세요</p>
						</div>
						<div class="left-body-div">
							<div class="form-group">
								<label class="id-label">아이디</label> <br /> <input
									class="register-id-form" type="text"
									placeholder="8~15자리 영문 숫자로만" />
							</div>

							<div class="form-group">
								<label class="pw-label">비밀번호</label> <br /> <input
									class="register-pw-form" type="text" placeholder="비밀번호 입력" />
							</div>

							<div class="form-group">
								<label class="check-pw-label">비밀번호 확인</label> <br /> <input
									class="register-check-pw-form" type="text"
									placeholder="비밀번호를 다시 입력" />
							</div>

							<div class="form-group">
								<label class="nickname-label">닉네임</label> <br /> <input
									class="register-nickname-form" type="text" placeholder="2자 이상" />
							</div>

							<div class="form-group">
								<label class="email-label">이메일</label> <br /> <input
									class="register-email-form" type="text" placeholder="이메일 입력" />
								<p class="email-info-p">입력하신 이메일로 인증 메일이 발송됩니다</p>
							</div>

							<div class="checkBox-div">
								<label class="lbl-term"> <input type="checkbox"
									name="whether-checked" class="checkbox" /> <a href="/terms"
									class="a-term">이용약관</a><span class="span">에 동의합니다</span>
								</label>
								<!--  
                        <input type="checkbox" name="whether-checked" class="checkbox"/>
                        <a class="a-term">이용약관</a><span class="span">에 동의합니다</span>
                        -->
							</div>

							<input type="submit" class="btn-sign-up" value="가입하기" />
						</div>
					</div>


					<div class="section-right">
						<div class="right-title-div">
							<p class="right-p-title">로그인</p>
							<p class="right-p-sub-title">이미 가입하셨으면 로그인하세요</p>
						</div>

						<div class="right-body-div">
							<div class="form-group">
								<label class="id-label">아이디</label> <br /> <input
									class="login-id-form" type="text" />
							</div>

							<div class="form-group">
								<label class="pw-label">비밀번호</label> <br /> <input
									class="login-pw-form" type="text" />
							</div>

							<input type="submit" value="로그인" class="btn-login" /> <a
								href="#" class="a-findPw">비밀번호를 분실하셨나요?</a>
							<hr>
							<input type="submit" value="구글 계정으로 로그인" class="btn-google-login" />

							<!-- !!!테스트용!!! -->
							<form
								action="https://localhost:8443/teamproject/board/post-write-test"
								method="get">
								<input type="submit" value="글쓰기창 이동용" class="btn-test" />
							</form>

						</div>
					</div>

				</div>
				<div class="col-sm-1"></div>
			</div>
		</div>

		<div class="container-footer"></div>

	</div>
	<script>
		$(document).ready(function() {
			$('.btn-close').click(function() {
				$('.info').remove();
			})
		})
	</script>

</body>
</html>