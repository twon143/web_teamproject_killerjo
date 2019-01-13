<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link href="<c:url value='/resources/css/write-form.css' />"
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
      <!-- body 부분 전체 div -->
      <div class="write-form-body">
         <!-- 글쓰기 타입 nav -->
         <nav class="write-form-type-nav">
            <ul class="write-form-type-ul">
               <li class="clicked-li">
               <img class="type-image" alt="" src="/teamproject/resources/images/icon_writeQuestion.png">
               <a class="menu-link">질문 올리기</a>
               </li>
               
               <li>
               <img class="type-image" alt="" src="/teamproject/resources/images/icon_writeLink.png">
               <a class="menu-link">링크 올리기</a>
               </li>
               
               <li>
               <img class="type-image" alt="" src="/teamproject/resources/images/icon_writePost.png">
               <a class="menu-link">글 올리기
               </a>
               </li>
            </ul>
         </nav>
         <!-- Title 부분 div -->
         <div class="post-title">
            <span>질문 올리기</span>
         </div>
         
         <div class="question-info1-div">
            <div class="question-info1-div2">
               <span>바보 같은 질문은 없습니다. 부담없이 질문해주세요~</span>
            </div>
         </div>
         
         <div class="question-info2-div">
            <div class="question-info2-div2">
               <span>이메일을 인증하시면 답변을 이메일로도 받을실 수 있습니다.</span>
            </div>
         </div>
      </div>
   </div>
</body>
</html>