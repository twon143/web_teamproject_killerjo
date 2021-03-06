<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>짭스노트 :: 개발자들의 메인 페이지</title>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="<c:url value='/resources/css/layout.css' />"
   rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/main.css' />" rel="stylesheet"
   type="text/css" />
<link href="<c:url value='/resources/css/reset.css' />" rel="stylesheet"
   type="text/css" />   
<link href="<c:url value='/resources/css/detailPost.css' />" rel="stylesheet" type="text/css" />
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>   
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js"></script>
</head>
<body>
	<!--  
   <ul>
      <li><a href="/teamproject/board/listPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}&category=${category}&type=${type}">게시판 메인 페이지</a></li>
      <li><a href="/teamproject/board/modifyPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}?bno=${board.bno}&category=${category}&type=${type}">수정하기</a></li>
   </ul>

   <div id="replies">
   </div> 
      <!-- 댓글 리스트를 넣어줄 영역 -->
      
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
							<form action="../user/register" method="post">
								<div class="form-group">
									<label for="signup_user_id">아이디</label><br> <input type="text" id="signup_user_id" name="id" placeholder="5~15자의 영문, 숫자로만">
								</div>
								<div class="form-group">
									<label for="signup_user_password">비밀번호</label><br> <input type="password" id="signup_user_password" name="password" placeholder="비밀번호 입력">
								</div>
								<div class="form-group">
									<label for="signup_user_password_confirm">비밀번호 확인</label><br> <input type="password" id="signup_user_password_confirm" name="password_confirm" placeholder="비밀번호를 다시 입력">
								</div>
								<div class="form-group">
									<label for="signup_user_nickname">닉네임</label><br> <input type="text" id="signup_user_nickname" name="nickname" placeholder="2자 이상">
								</div>
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

								<input type="submit" id="signup-btn" value="회원가입" class="btn btn-primary btn-lg"> <input type="hidden" name="queryString" value="/teamproject/board/readPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}&bno=${bno}&category=${category}&type=${type}&sort=${sort}">

							</form>
						</div>
					</div>
					<div class="col-sm-6">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true" aria-label="Close" >
							<span aria-hidden="true">&times;</span>
						</button>
						<div class="modal-header">
							<h4>로그인</h4>
						</div>
						<div class="modal-body">
							<form action="../user/login-post" method="post">
								<div class="form-group">
									<label for="user_id">아이디</label><br> <input type="text" id="user_id" name="id" placeholder="아이디">
								</div>
								<div class="form-group">
									<label for="user_password">비밀번호</label><br> <input type="password" id="password" name="password" placeholder="비밀번호">
								</div>
								<!-- <button type="button" id="login-btn" class="btn btn-primary btn-lg" data-loading-text="<i class='fa fa-circle-o-notch fa-spin fa-lg'>
                           </i> 가입하는 중.. 잠시만 기다려주세요.">로그인</button> -->

								<input type="submit" id="login-btn" value="로그인" class="btn btn-primary btn-lg"> <input type="hidden" name="queryString" value="/teamproject/board/readPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}&bno=${bno}&category=${category}&type=${type}&sort=${sort}">
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
				<div class="main-logo-font">
					<div class="mainLogo-div">
						<img class="mainLogoImg" alt=""
							src="/teamproject/resources/images/MainLogoImg.png">
					</div>

					<div class="mainLogo-font-div">
						<div class="mainLogo-font-div-div">
							<a href="/teamproject/" class="logo-font">짭스노트</a>
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
								<a href="../user/profile">
									<img class="img-profile" alt=""
										src="/teamproject/resources/images/icon_profile.png">
								</a>
							</div>

							<form>
								<input type="button" class="btn-settig btn btn-info" value="설정" />
							</form>



							<form action="../user/logout" method="post">

								<input type="submit" class="btn-logout btn btn-info"
									value="로그아웃" />
								<input type="hidden" name="queryString" value="/teamproject/board/readPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}&bno=${bno}&category=${category}&type=${type}&sort=${sort}">
								<!-- <input type="hidden" name="queryString" value="https://localhost:8443/teamproject/"/> -->
							</form>

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
						<a class="navbar-brand"
							href="/teamproject/board/listPaging?category=all&type=all&sort=popular">전체</a>
					</div>
					<!-- 상세 카테고리들 -->
					<ul class="nav navbar-nav">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">언어 및 도구<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a
									href="/teamproject/board/listPaging?category=php&type=all&sort=popular">PHP</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=javascript&type=all&sort=popular">Javascript</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=java&type=all&sort=popular">Java</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=spring&type=all&sort=popular">Spring</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=nodejs&type=all&sort=popular">Node.js</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=swift&type=all&sort=popular">Swift</a></li>
								<li><a
									href="/teamproject/board/listPaging?category=kotlin&type=all&sort=popular">Kotlin</a></li>
								<li><a href="/teamproject/board/listPaging?category=css&type=all&sort=popular">CSS</a></li>
								<li><a href="/teamproject/board/listPaging?category=python&type=all&sort=popular">Python</a></li>
								<li><a href="/teamproject/board/listPaging?category=jsp&type=all&sort=popular">JSP</a></li>
								<li><a href="/teamproject/board/listPaging?category=jquery&type=all&sort=popular">jQuery</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">네트워크와 서버<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/teamproject/board/listPaging?category=linux&type=all&sort=popular">리눅스</a></li>
								<li><a href="/teamproject/board/listPaging?category=server_management&type=all&sort=popular">서버관리</a></li>
								<li><a href="/teamproject/board/listPaging?category=cdn&type=all&sort=popular">CDN</a></li>
								<li><a href="/teamproject/board/listPaging?category=aws&type=all&sort=popular">AWS</a></li>
								<li><a href="/teamproject/board/listPaging?category=api&type=all&sort=popular">API</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">데이터베이스<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/teamproject/board/listPaging?category=sql&type=all&sort=popular">SQL</a></li>
								<li><a href="/teamproject/board/listPaging?category=mysql&type=all&sort=popular">MySQL</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">프로젝트 관리<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/teamproject/board/listPaging?category=git&type=all&sort=popular">GIT</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">빅데이터<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/teamproject/board/listPaging?category=machine_learning&type=all&sort=popular">머신러닝</a></li>
								<li><a href="/teamproject/board/listPaging?category=blockchain&type=all&sort=popular">블록체인</a></li>
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
					<form class="navbar-form navbar-left" action="searchPaging" method="get">
					
						<input type="hidden" name="type" value="all">
						<input type="hidden" name="sort" value="popular">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search" name="keyword">
						</div>
						<input type="submit" class="btn btn-default" value="검색"/>
					</form>
				</div>
			</nav>

		</div>
		<!-- E:top-nav -->

		<!--  본문 부분을 9:3으로 나눔 -->
		<div class="container-fluid contain-all">
			<!-- row를 기준으로 나눔 -->
			<div class="row row-column">
				<!-- 9에 해당하는 부분 -->
				<div class="col-sm-9 col-9">
					<!-- 헤드부분 전체 div -->
					<div class="detailPost-head-div">
						<!-- 제목 부분 div -->
						<div class="detailPost-title-sub-div">
							<a href="#" class="title-sub-a">${board.title} <span
								class="title-sub-span">답변 ${board.answer_count}</span>
							</a>	
							<a href="#" class="title-sub-a"><span class="title-sub-span2">댓글 ${board.reply_count}</span>
							</a>
							<a href="#" class="category-a">(${board.category}/${board.type})</a>
						</div>

						<!-- 게시글 정보 div -->
						<div class="detailPost-postInfo-div">
							<a href="../user/profile-others?writer=${board.writer}"><img class="no-profle-img" alt=""
								src="/teamproject/resources/images/icon_blankProfile.png">${board.writer}</a>
							<fmt:formatDate value="${board.write_date}"
								pattern="yyyy년 MM월 dd일" var="regDate"/>
							<span>님께서 ${regDate}에 <strong
								class="post-category-strong">${board.category} </strong>에 올린 
								<c:if test="${board.type == 'question'}">
									질문
								</c:if>
								<c:if test="${board.type == 'writing'}">
									글
								</c:if>
								<c:if test="${board.type == 'link'}">
									링크
								</c:if>
							</span>
						</div>

						<div>
							<!-- 공유하기 / 보관하기 div -->
							<a href="#" class="share-post-a">공유하기</a> <a onclick="test(${board.bno})"
								class="save-post-a">보관하기</a>
								
						</div>
					</div>

					<!-- 글 내용 부분 전체 div -->
					<div class="detailPost-content-div">
						<!-- 제목 부분 div -->
						<div class="detailPost-title-div">
							<p>${board.title}</p>
						</div>

						<!--  내용부분 -->
						<div class="detailPost-body-div">
							<!-- TODO: 글쓰기 기능 구현시 할 기능 CKEdior로 DB에 저장된 HTML 코드를 가져와서 적용해야함! -->
							<!-- 현제는 테스트용으로 Dummy Data로함 -->
							<pre>${board.content}</pre>	
						</div>



						<!-- 댓글 목록및 쓰기 div -->

						<div class="detailPost-reply-div">

							<!--  댓글 불러오는 부분 -->
							<div class="detailPost-replyList-div">
								<!-- Ajax로 불러옴 -->
							</div>

							<!--  댓글 쓰기 -->
							<div class="write-reply-div">
								<div class="write-reply-content-div">
									<textarea class="reply-content-textarea" rows="2" cols=""></textarea>
								</div>

								<div class="register-reply-div">
									<input type="hidden" class="reply-type" value="board">
									<button type="button" class="btnRegisterReply" >댓글 쓰기</button>
								</div>

							</div>
						</div>
					</div>


					<!-- 답변창 갯수 div -->
					<div class="answer-count-div">
						<h4>${board.answer_count}개의답변</h4>
					</div>

					<!--  답변을 불러오는 곳 -->
					<div class="scope-load-answer"></div>


					<!-- 답변을 추가하는 부분 -->
					<div class="write-answer-div">
						<h4>당신의 답변</h4>
						<div class="write-answer-form">
							<textarea id="editor" class="write-answer-textarea" rows="2"
								cols=""></textarea>
							<!-- CK Editor -->
							<!-- <script>
								CKEDITOR.replace('editor');
							</script> -->
						</div>

						<div class="write-answer-btn-div">
							<button class="btn-write-answer">답변 올리기</button>
						</div>
						


					</div>

				</div>

				<div class="col-sm-3 side-div-col3">
					<input type="hidden" readonly="readonly" id="bno"
						value="${board.bno}">
					<!-- 9:3중에서 3부분 전체 div -->
					<div class="detailPost-info">
						<!-- 게시글 정보 관련 div -->
						<div class="post-stat">

							<div class="post-stat-viewCount">
								<img alt=""
									src="/teamproject/resources/images/icon_recCount.png"> <span
									class="view-count-span">조회수</span> <span
									class="view-count-span-number">${board.view_count}</span>
							</div>

							<div class="post-stat-answerCount">
								<img alt=""
									src="/teamproject/resources/images/icon_answerCount.png">
								<span class="answer-count-span">답글수</span> <span
									class="answer-count-span-number">${board.answer_count}</span>
									
							</div>

						</div>
						<!-- 돌아가기 그런 인터페이스 div -->
						<div class="interface-div">
							<a href="/teamproject/board/listPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}&category=${category}&type=${type}&sort=${sort}">
								<button class="backTo-listPaging">게시글로 돌아가기</button>
							</a>
							<button class="saving-post" onclick="test(${board.bno})">게시글 보관하기</button>
							<button class="share-post-FaceBook">페이스북에 공유하기</button>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
	<!-- E: wrapper -->


<input type="hidden" id="login" value="${login.id}"/>
<input type="text" id="url-text" style="opacity: 0"/>
<input type="hidden" id="current-href"  />
<script>
	if($('#login').val() == '' || $('#login').val() == null) {
	$('.reply-content-textarea').attr("readonly", "readonly");
	$('.reply-content-textarea').attr("placeholder", "로그인을 하셔야만 댓글을 달수있습니다");
	$('.reply-content-textarea').css("background-color", "#eee");
	$('.btnRegisterReply').attr("disabled", "disabled");
	$('.write-answer-textarea').attr("readonly", "readonly");
	$('.write-answer-textarea').attr("placeholder", "로그인을 하셔야만 답변을 달수있습니다");
	$('.write-answer-textarea').css("background-color", "#eee");
	}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script id="reply-template" type="text/x-handlebars-template">
<div class="reply-item">   
     		<input id="rno" value="{{rno}}" type="hidden" readonly/>
     		<div class="reply-info">
           		<a id="writer"><img alt="" src="/teamproject/resources/images/icon_blankProfile.png">
           		{{writer}}</a>
          		 <span>{{write_date}}</span>
    		</div>
    		<div id="content" class="reply-body">{{content}}</div>
			<div class="div-btnGroup{{rno}}">
				<a class="delete-a">삭제</a>
    			<a class="update-a">수정</a>  
			</div>
     		     
</div>
</script>

<script type="text/javascript">
   
   	
      $(function() {
    	  
    	// ckeditor setting
		var ckeditor_config = {
			filebrowserUploadUrl: '../ckeditorupload3', // 파일 업로드를 처리 할 경로 설정.
		};

		CKEDITOR.replace('editor', ckeditor_config);
    	  
    	  
         // 현재 보고 있는 게시글의 글번호
         var bno = $('#bno').val();
         // 댓글 전체 리스트를 출력할 영역
         var division = $('.detailPost-replyList-div');
         // handlebars 스크립트 사용
         // 1) 템플릿 HTML 요소를 찾음
         var source = $("#reply-template").html();
         // 2) 템플릿을 컴파일
         var template = Handlebars.compile(source);
         
    
         
         function getAllReplies() {
            // $.getJSON(url, callback):
            // url 주소로 get 방식의 Ajax 요청을 보내는 함수
            // callback(data): data는 JSON 타입
            $.getJSON('/teamproject/reply/all/' + bno, function(data) {
               
               division.empty(); // div 영역의 모든 HTML 요소를 제거
               
               /* var list = ''; */
               
               $(data).each(function() {
                  // 배열 data에 대한 반복 기능 수행하는 콜백함수
                
                  var writers = this.writer;
                  var loginUser = $("#login").val();
                
                  
               
               
                  var date = new Date(this.write_date); // 댓글 작성 시간
                  var dateString = date.toLocaleDateString()
                        + ' ' + date.toLocaleTimeString();
                  
                  // 3) handlebars 템플릿에 {{변수}}를 채울 수 있는 객체 생성
                  var content_item = {
                        rno: this.rno,
                        writer: this.writer,
                        write_date: dateString,
                        content : this.content
                  };
                  
                  // 4) 생성된 객체를 handlebars 템플릿에 적용
                  var replyItem = template(content_item);
                  // 생성된 HTML 코드를 append
                  division.append(replyItem);
                  var rno = this.rno;
                  if(writers != loginUser) {
                	
                      $('.div-btnGroup' + rno +' ' + '.delete-a').hide();
                      $('.div-btnGroup' + rno +' ' + '.update-a').hide();
                   }
                  
                  if(writers == loginUser) {
                	 
                	  $('.div-btnGroup' + rno +' ' + '.delete-a').show();
                	  $('.div-btnGroup' + rno +' ' + '.update-a').show();
                  }
                  

               });
               var highHeight = $('.col-9').height();
               $('.detailPost-info').height(highHeight);
               
            });
         }
         
         // 함수 호출
         getAllReplies();
         
         $('.btnRegisterReply').click(function() {
            var content = $('.reply-content-textarea').val();
            var writer = $('#login').val();
            var bno = $('#bno').val();
            var type = $('.reply-type').val();
            // TODO: 댓글 내용/작성자 아이디가 비어있는지 않은지를 검사

      // 댓글을 서버로 전송
            $.ajax({
               type : "POST",
               url : '/teamproject/reply',
               headers : {
                  'Content-type' : 'application/json',
                  'X-HTTP-Method-Override' : 'post'
               },
               data : JSON.stringify({
                  'content' : content,
                  'writer' : writer,
                  'parent_num' : bno,
                  'type' : type
               }),
               success : function(result) {

                  // 함수 호출
                  $('.reply-content-textarea').val('');
                  getAllReplies();
               }
            });
         });
         
         
         // 댓글 삭제하는 부분
         division.on('click', '.reply-item .delete-a', function() {
            var rno =  $(this).parents('.reply-item').children('#rno').val();
            var bno = $('#bno').val(); 
            console.log(bno);
            var result = confirm(rno + '번 댓글을 정말 삭제하시겠습니까?');
            if (result == true) {
               $.ajax({
                  type: 'delete', 
                  url: '/teamproject/reply/' + rno, 
                  headers: {
                     'Content-Type': 'application/json',
                     'X-HTTP-Method-Override': 'delete'
                  },
                  success: function(data) {
                     if(data == 1) {
                        getAllReplies();
                     }
                  }
               });
            } // end if
            
         });
         
      
         
         
         
         
      });
</script>


<!-- 답변 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script id="answer-template" type="text/x-handlebars-template">
	<div class="answer-div">
						<input id="ano" value="{{ano}}" type="hidden" readonly/>
						<div id="answer-content-id-scope" class="answer-content-div-scope{{ano}}">{{{content}}}</div>
						<div class="answer-interface-div">
							<span class="span-like">좋아요</span>
							<button class="btn-copy-answer" >답변 주소 복사</button>
						</div>

						<!-- 게시글 정보 div -->
						<div class="detailPost-postInfo-div answer-info-div">
							<a><img class="no-profle-img" alt=""
								src="/teamproject/resources/images/icon_blankProfile.png">{{writer}}</a>
							<span>님께서 {{write_date}}일에 <strong
								class="post-category-strong">${board.category} </strong>에 올린 답변
							</span>
						</div>
						<div class="div-share-save">
							<!-- 공유하기 / 보관하기 div -->
							<a href="#" class="share-post-a">공유하기</a> <a href="#"
								class="save-post-a">보관하기</a>
						</div>

						<!-- 답변의 댓글 목록 불러오는 영역 -->
						<div class="answer-reply-scope{{ano}}">
							
						</div>

						
						<!-- 댓글 쓰기 영역 -->
						<div class="detailPost-reply-div">

							<!--  댓글 쓰기 -->
							<div class="write-reply-div">
								<div class="write-answer-reply-content-div">
									<textarea class="reply-content-textarea-answer" rows="2" cols=""></textarea>
								</div>

								<div class="register-reply-div">
									<input type="hidden" class="reply-type" value="answer">
									<button type="button" class="btnRegisterReply">댓글 쓰기</button>
								</div>

							</div>
						</div>
						
			</div>
</script>

<!--  -->

<!--  답변 댓글들 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script id="answer-reply-template"  type="text/x-handlebars-template">
	<div class="answer-reply-item">   
     		<input id="a-rno" value="{{aRno}}" type="hidden" readonly/>
     		<div class="a-reply-info">
           		<a id="a-writer"><img alt="" src="/teamproject/resources/images/icon_blankProfile.png">
           		{{aWriter}}</a>
          		 <span>{{aWrite_date}}</span>
    		</div>
    		<div id="a-content" class="a-reply-body">{{aContent}}</div>
     		<a class="a-delete-a">삭제</a>
    		<a class="a-update-a">수정</a>       
	</div>
</script>

<script>
	$(document).ready(function() {
				if($('#login').val() == '' || $('#login').val() == null) {
					$('.btn-write-answer').attr("disabled", "disabled");
				}
				var board_num = $('#bno').val();
				var divisionAnswer = $('.scope-load-answer');
				var source = $('#answer-template').html();
				var templateAnswer = Handlebars.compile(source);
				var loginId = $('#login').val();
				console.log("loginId: " + loginId);
				
				
				function getAllAnswers() {
							$.getJSON('/teamproject/answer/all/' + board_num, function(data) {
													divisionAnswer.empty(); // div 영역의 모든 HTML 요소를 제거
													$(data)
															.each(
																	function() {
																		var date = new Date(
																				this.write_date);
																		var dateString = date
																				.toLocaleDateString()
																				+ ' '
																				+ date
																						.toLocaleTimeString();
																		
																		var contentAnswer = {
																			ano : this.ano,
																			content : this.content,
																			writer : this.writer,
																			write_date : dateString
																		};
																		var ano = this.ano;
								
																		var replyItemAnswer = templateAnswer(contentAnswer);
																		divisionAnswer.append(replyItemAnswer);
																		if($('#login').val() == '' || $('#login').val() == null) {
																						
																						$('.reply-content-textarea-answer').attr("readonly", "readonly");
																						$('.reply-content-textarea-answer').attr("placeholder", "로그인을 하셔야만 댓글을 달수있습니다");
																						$('.reply-content-textarea-answer').css("background-color", "#eee");
																						$('.btnRegisterReply').attr("disabled", "disabled");
																						
																					}
																		
																		
																		var divisionAnswerReply = $('.answer-reply-scope'+ano);
																		var sourceAnswerReply = $('#answer-reply-template').html();
																		var templateAnswerReply = Handlebars.compile(sourceAnswerReply);
																		
																		$.getJSON('/teamproject/answer/readAllAnswerReply/' + ano, function(data) {
																				divisionAnswerReply.empty();
																				$(data).each(function() {
																					
																					
																					var date = new Date(this.write_date);
																					var dateString = date.toLocaleDateString()
																					+ ' ' + date.toLocaleTimeString();
																					var contentAnswerReply = {
																							aRno: this.rno,
																							aWriter: this.writer,
																							aContent: this.content,
																							aWrite_date: dateString
																					};
																				
																					var replyAnswerReplyItem = templateAnswerReply(contentAnswerReply);
																					
																					divisionAnswerReply.append(replyAnswerReplyItem);
																					
																					
																					
																				
																				});
																			});
																		
																		
																			
																		
																	}); // end each()
												});
							}
							getAllAnswers();
							
							
							divisionAnswer.on('click', '.btn-copy-answer', function() {
								var url = window.location.href;
								$('#url-text').val(url);
								$('#url-text').select();
								document.execCommand('copy');
								alert('답변주소가 복사되었습니다 Ctrl+V를 통해 붙여넣기를 하세요!');
								
							
							});
							// 답변의 댓글쓰기 버튼 눌럿을때
							divisionAnswer.on('click', '.answer-div .btnRegisterReply', function() {
								var content = $(this).parents('.write-reply-div').children('.write-answer-reply-content-div').children('.reply-content-textarea-answer').val();
							
								var ano = $(this).parents('.answer-div').children('#ano').val();
								var bno = $('#bno').val();
								var type = 'answer';
								var writer = $('#login').val();
								
								$.ajax({
									type : "POST",
									url : '/teamproject/answer/insertAnswerReply',
									headers : {
										'Content-type' : 'application/json',
										'X-HTTP-Method-Override' : 'post'
									},
									data : JSON.stringify({
										'content' : content,
										'parent_num' : ano,
										'writer' : writer,
										'type' : type
										
									}),
									success : function(result) {
										
										alert('성공');
										
									}
								});
								
								
								
								
							});
							
							$('.btn-write-answer').click(function() {
								// CkEditor에잇는 모든 HTML 요소를 읽어옴
								var con = CKEDITOR.instances.editor.getData();
								var writer = $('#login').val();
								var bno = $('#bno').val();
								console.log("con: " + con);
								console.log("writer: " + writer);
								console.log("bno: " + bno);

								$.ajax({
									type : "POST",
									url : '/teamproject/answer',
									headers : {
										'Content-type' : 'application/json',
										'X-HTTP-Method-Override' : 'post'
									},
									data : JSON.stringify({
										'content' : con,
										'writer' : writer,
										'board_num' : bno,

									}),
									success : function(result) {

										// 함수 호출
										alert('성공');
										 CKEDITOR.instances.editor.setData('');
										getAllAnswers();
									}
								});

							})
							
						});
	</script>
	<input type="hidden" id="login" value="${login.id}" />

	<script>

	var loginId = $('#login').val();
	/* var bno = $(this).prevAll('#hidden-bno').val();	 */
		function test(bno){
			console.log("스크랩 아이디 체크");
			console.log("loginId :" + loginId);
			console.log("bno : " + bno);

			if (loginId) {
				$
						.ajax({
							type : 'post',
							url : '/teamproject/scrab/checkScrab/',
							headers : {
								'Content-type' : 'application/json',
								'X-HTTP-Method-Override' : 'post'
							},
							data : JSON.stringify({
								board_num : bno,
								user_id : $('#login').val(),
							}),
							contentType : 'application/x-www-form-urlencoded',
							success : function(res) {
								console.log(res);
								alert("보관함에 추가했습니다");
								// end success
							},
							error : function(error) {
								console.log("error : " + error);
								var result = confirm("이미 보관함에 있습니다 삭제하시겠습니까?");
								console.log(result);
								if (result == true) {
									$
											.ajax({
												type : 'post',
												url : '/teamproject/scrab/deleteScrab/',
												headers : {
													'Content-type' : 'application/json',
													'X-HTTP-Method-Override' : 'post'
												},
												data : JSON
														.stringify({
															board_num : bno,
															user_id : $(
																	'#login')
																	.val(),
														}),
												contentType : 'application/x-www-form-urlencoded',
												success : function(res) {
													console.log("스크랩 삭제 결과 : "
															+ res);
												}// end success
											})// end ajax
								}// end error if
							}// end error	
						})// end ajax
			} else {
				alert("로그인해주세요");
			}// end else if 	
		}// end function(test)
	</script>

</body>
</html>