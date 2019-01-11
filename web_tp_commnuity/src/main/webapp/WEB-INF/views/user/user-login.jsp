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

<link href="<c:url value='/resources/css/layout.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/main.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/reset.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/login-form.css' />" rel="stylesheet" type="text/css" />

</head>
<body>

	<!-- S:wrapper -->
	<div id="wrapper">
		<!-- S:top-header -->
		<div class="top-header-div top-header center-block">
			<nav
				class="top-header-nav navbar navbar-expand-lg navbar-light bg-light">
				<div class="mainLogo-div">
					<img class="mainLogoImg" alt="" src="/teamproject/resources/images/MainLogoImg.png" >
				</div>

				<div class="mainLogo-font-div">
					<div class="mainLogo-font-div-div">
						<a href="/" class="logo-font">킬러조</a>
					</div>

				</div>
				
				<div class="login-form-div login-form collapse navbar-collapse"
					id="navbarTogglerDemo03">
					<div class="searchBox-div">
						<input type="text" class="login-form-searchBox" placeholder="검색..." />
					</div>
				</div>
			</nav>
		</div>
	</div>

	<!-- E:top-header -->
</body>
</html>