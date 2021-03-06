<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>짭스노트 :: 개발자들의 메인 페이지</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--  <link href="/teamproject/css/main.css" rel="stylesheet" type="text/css"> -->

<link href="<c:url value='/resources/css/layout.css' />"
   rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/main.css' />" rel="stylesheet"
   type="text/css" />
<link href="<c:url value='/resources/css/reset.css' />" rel="stylesheet"
   type="text/css" />


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
                     <form action="user/register" method="post">
                        <div class="form-group">
                           <label for="signup_user_id">아이디</label><br> <input
                              type="text" id="signup_user_id" name="id"
                              placeholder="5~15자의 영문, 숫자로만">
                        </div>
                        <div class="form-group">
                           <label for="signup_user_password">비밀번호</label><br> <input
                              type="password" id="signup_user_password" name="password"
                              placeholder="비밀번호 입력">
                        </div>
                        <div class="form-group">
                           <label for="signup_user_password_confirm">비밀번호 확인</label><br>
                           <input type="password" id="signup_user_password_confirm"
                              name="password_confirm" placeholder="비밀번호를 다시 입력">
                        </div>
                        <div class="form-group">
                           <label for="signup_user_nickname">닉네임</label><br> <input
                              type="text" id="signup_user_nickname" name="nickname"
                              placeholder="2자 이상">
                        </div>
                        <div class="form-group">
                           <label for="signup_user_email">이메일</label><br> <input
                              type="email" id="signup_user_email" name="email"
                              placeholder="이메일">
                        </div>
                        <p class="help-block">
                           입력하신 이메일로 인증 메일이 발송됩니다.
                           <!-- 인증 메일을 확인하시면 비밀번호 찾기 등에 사용됩니다. -->
                        </p>
                        <div class="checkbox">
                           <label> <input type="checkbox" name="agree" value="Y">
                              <a href="/terms" target="_blank">이용약관</a> 에 동의합니다.
                           </label>
                        </div>
                        <!-- <button type="button" id="signup-btn"
                           class="btn btn-primary btn-lg"
                           data-loading-text="<i class='fa fa-circle-o-notch fa-spin fa-lg'>
                           </i> 가입하는 중.. 잠시만 기다려주세요.">가입하기</button> -->

                        <input type="submit" id="signup-btn" value="회원가입"
                           class="btn btn-primary btn-lg"> 
                           <input type="hidden" name="queryString" value="https://localhost:8443/teamproject/">
                     </form>
                  </div>
               </div>
               <div class="col-sm-6">
                  <button type="button" class="close" data-dismiss="modal"
                     aria-hidden="true" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
                  <div class="modal-header">
                     <h4>로그인</h4>
                  </div>
                  <div class="modal-body">
                     <form action="user/login-post" method="post">
                        <div class="form-group">
                           <label for="user_id">아이디</label><br> <input type="text"
                              id="user_id" name="id" placeholder="아이디">
                        </div>
                        <div class="form-group">
                           <label for="user_password">비밀번호</label><br> <input
                              type="password" id="password" name="password"
                              placeholder="비밀번호">
                        </div>
                        <!--  <button type="button" id="login-btn"
                           class="btn btn-primary btn-lg"
                           data-loading-text="<i class='fa fa-circle-o-notch fa-spin fa-lg'>
                           </i> 가입하는 중.. 잠시만 기다려주세요.">로그인</button> -->

                        <input type="submit" id="login-btn" value="로그인"
                           class="btn btn-primary btn-lg"> <input type="hidden"
                           name="queryString" value="https://localhost:8443/teamproject/">
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
         <nav
            class="top-header-nav navbar navbar-expand-lg navbar-light bg-light">
            <div class="mainLogo-div">
               <img class="mainLogoImg" alt=""
                  src="/teamproject/resources/images/MainLogoImg.png">
            </div>

            <div class="mainLogo-font-div">
               <div class="mainLogo-font-div-div">
                  <a href="/teamproject/" class="logo-font">짭스노트</a>
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
               
                  <form action="user/logout" method="post">
                     <input type="submit" class="btn-logout" value="로그아웃"/>
                     <!-- <input type="hidden" name="queryString" value="https://localhost:8443/teamproject/"/> -->
                  </form>
                  <input type="button" class="btn-settig" value="설정" />
                  <div class="img-profile-div">
                     <img class="img-profile" alt="" src="/teamproject/resources/images/icon_profile.png">
                  </div>
                  <div class="img-notify-div">
                     <img class="img-notify" alt="" src="/teamproject/resources/images/icon_notify.png">
                  </div>
               </div>
            </c:if>
         </nav>
      </div>

      <!-- E:top-header -->

      <!-- S:top-nav -->
      <div class="top-nav center-block">
         <nav class="navbar navbar-inverse">
            <div class="container-fluid">
               <div class="navbar-header">
                  <a class="navbar-brand" href="/teamproject/board/listPaging?category=all&type=all">전체</a>
               </div>
               <!-- 상세 카테고리들 -->
               <ul class="nav navbar-nav">
                  <li class="dropdown"><a class="dropdown-toggle"
                     data-toggle="dropdown" href="#">언어 및 도구<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="/teamproject/board/listPaging?category=php&type=all">PHP</a></li>
                        <li><a href="/teamproject/board/listPaging?category=javascript&type=all">Javascript</a></li>
                        <li><a href="/teamproject/board/listPaging?category=java&type=all">Java</a></li>
                        <li><a href="/teamproject/board/listPaging?category=spring&type=all">Spring</a></li>
                        <li><a href="/teamproject/board/listPaging?category=nodejs&type=all">Node.js</a></li>
                        <li><a href="/teamproject/board/listPaging?category=swift&type=all">Swift</a></li>
                        <li><a href="/teamproject/board/listPaging?category=kotlin&type=all">Kotlin</a></li>
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
               <form class="navbar-form navbar-left" action="/action_page.php">
                  <div class="form-group">
                     <input type="text" class="form-control" placeholder="Search">
                  </div>
                  <button type="submit" class="btn btn-default">Submit</button>
               </form>
            </div>
         </nav>

      </div>
      <!-- E:top-nav -->

      <!-- S:container -->
      <div id="container" class="container-fluid text-center">
         <div class="row content">

            <!-- contents-left -->

            <div class="col-sm-2 sidenav con-left-wid">
               <ul class="list-group">
                  <li class="list-group-item list-bg"><a class="t-color">카테고리</a></li>
                  <li class="list-group-item"><a>내 관심</a></li>
                  <li class="list-group-item"><a>질문하기</a></li>
                  <li class="list-group-item"><a>문의</a></li>
                  <li class="list-group-item"><a>고객센터</a></li>
               </ul>
            </div>


            <!-- contents - center -->
            <div class="col-sm-8 text-left mid-contents-wrap">
               <!-- Post-Detail Modal -->

               <div class="modal fade" id="myModal" role="dialog">
                  <!-- 사용자 지정 부분① : id명 -->

                  <div class="modal-dialog modal-lg">



                     <!-- Modal content-->

                     <div class="modal-content">

                        <div class="modal-header">

                           <button type="button" class="close" data-dismiss="modal">×</button>

                           <h4 class="modal-title">아이언 티어 지망생 오훈식이</h4>
                           <!-- 사용자 지정 부분② : 타이틀 -->
                           <button class="post-detail-replyCnt">답변 대기</button>
                           <a class="post-detail-userId" href="ku8230">ku8230</a> 님께서
                           3시간전에 올린 질문

                        </div>
                        <!-- div$$ modal-header -->

                        <div class="modal-body">
                           <div class="post-detail-title">
                              <p>아이언티어 지망생 오훈식이</p>
                              <!-- 사용자 지정 부분③ : 텍스트 메시지 -->
                           </div>

                           <div class="post-detail-content">게시판 본문 div입니다 게시판 본문
                              div입니다 게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다
                              게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문
                              div입니다 게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다 게시판 본문 div입니다
                              게시판 본문 div입니다</div>

                        </div>

                        <div class="modal-footer">

                           <button type="button" class="btn btn-default"
                              data-dismiss="modal">Close</button>

                        </div>

                     </div>

                  </div>

               </div>

               <!-- End post-detail Modal -->
               user-profile.jsp

                           <div class="post-contents">
                              <!-- Dummy Data 1 -->
                              <a class="post-title" href="#"><strong>${board.title}</strong></a>
                              <button class="btnReplyCount">답변 대기</button>
                              <button class="btnPostTag">Java</button>
                              <button class="btnPostTag2">언어</button>
                              <br />
                              <br /> <a class="post-content" href="#">${board.content}</a><br />
                              <span class="post-info-span"><a
                                 class="post-info-span-userId" href="#">${board.writer}</a>님
                                 께서 3시간전에 <a class="post-info-span-postName" href="#">Java</a>에
                                 올린 질문</span> <br /> <a class="post-share" href="#">공유하기</a> <a
                                 class="post-save" href="#">보관하기</a>

                           </div>
                           <!--  end of div$post-contents -->
                        </div>
                        <!-- end of div$sub-post-list -->
                     
                  </div>
                  <!-- end of div$content-center -->

               </div>
               <!-- 세로로 POST 보기 -->
            </div>

            <!-- contents - right -->
            <div class="contents-right-color">
               <div class="contents-right-div col-sm-2 sidenav">
                  <!--  로그인 정보가 없을때 -->
                  <c:if test="${empty login}">
                     <div class="login-form-right-div">

                        <form action="user/login-post" method="post">
                           <input type="text" name="id" placeholder="아이디"
                              class="login-input-id" /> <input type="text" name="password"
                              placeholder="비밀번호" class="login-input-pw" /> <input
                              type="checkbox" id="autoLogin" name="use_cookie" /> <input
                              type="hidden" name="queryString"
                              value="https://localhost:8443/teamproject/" /> <label
                              for="autoLogin">로그인 유지</label> <input type="submit"
                              value="로그인" class="btn-side-login" />
                        </form>
                        <input type="button" value="아이디/비밀번호 찾기"
                           class="btn-side-findIdAndPw" /> <input type="button"
                           value="구글 로그인" class="btn-side-google-login" />

                     </div>
                  <!-- 로그인 정보가 있을때 -->   
                  </c:if>

                  <c:if test="${not empty login}">
                     <div class="logined-form-right-div">
                        <div class="login-profile-div">
                           <img class="img-profile-side" alt=""
                              src="/teamproject/resources/images/icon_profile1.png">
                        </div>
                        <div class="login-id-div">
                           <a class="login-id-a">${login.id}</a> <br />
                        </div>

                        <div class="login-setting-div">
                           <img class="img-setting" alt=""
                              src="/teamproject/resources/images/icon_setting.png">
                        </div>
                        <br/>
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

                  <form action="board/write-form" method="get">
                     <input type="submit" value="질문하기" class="btn-side-question" /> <input
                        type="hidden" name="type" value="question" />
                     <!--   <input type="hidden" name="queryString" value="type=question" /> -->
                  </form>
                  <input type="button" value="글 올리기" class="btn-side-writePost" />
                  <input type="button" value="링크 올리기" class="btn-side-link" />
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
                  <a href="/terms" class="hide-at-mobile a2" data-instant>이용약관</a> <span
                     class="hide-at-mobile" style="color: #aaa"> &nbsp;|&nbsp; </span> <a href="/privacy"
                     class="hide-at-mobile" data-instant>개인정보취급방침</a> 
                     
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

   <script src="<c:url value='/resources/js/main.js'/>"></script>


   <!-- <script type="text/javascript">
      $(function() {
         $('#btn-logout').click(function() {
            location = 'user/logout';
         });
         
         $('.btn-logout').click(function() {
            location = 'user/logout';
         });
      })
   </script> -->
</body>
</html>