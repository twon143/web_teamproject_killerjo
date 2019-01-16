<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>

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
						<a href="/teamproject/" class="logo-font">킬러조</a>
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
						<input type="button" class="btn-logout" value="로그아웃"> <input
							type="button" class="btn-settig" value="설정" />
						<div class="img-profile-div">
							<img class="img-profile" alt=""
								src="/teamproject/resources/images/icon_profile.png">
						</div>
						<div class="img-notify-div">
							<img class="img-notify" alt=""
								src="/teamproject/resources/images/icon_notify.png">
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
							href="/teamproject/board/listPaging?category=all&type=all">전체</a>
					</div>
					<!-- 상세 카테고리들 -->
					<ul class="nav navbar-nav">
						<li class="dropdown"><a class="dropdown-toggle"
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
								class="title-sub-span">답변 ${board.reply_count}</span>

							</a> <a href="#" class="category-a">(Java/Question)</a>
						</div>

						<!-- 게시글 정보 div -->
						<div class="detailPost-postInfo-div">
							<a><img class="no-profle-img" alt=""
								src="/teamproject/resources/images/icon_blankProfile.png">${board.writer}</a>
							<span>님께서 ${board.write_date}일에 <strong
								class="post-category-strong">${board.category} </strong>에 올린 게시글
							</span>
						</div>

						<div>
							<!-- 공유하기 / 보관하기 div -->
							<a href="#" class="share-post-a">공유하기</a> <a href="#"
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
							<p>${board.content}${board.content}${board.content}${board.content}
								${board.content}${board.content}${board.content}${board.content}${board.content}
								${board.content}${board.content}${board.content}${board.content}${board.content}
								${board.content}${board.content}${board.content}${board.content}${board.content}</p>
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
									<button type="button" class="btnRegisterReply">댓글 쓰기</button>
								</div>

							</div>
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
							<button>게시글로 돌아가기</button>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
	<!-- E: wrapper -->	
	

	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
	<script id="reply-template" type="text/x-handlebars-template">
		<div class="reply-item">	
			<input id="rno" value="{{rno}}" type="hidden" readonly/>
			<div class="reply-info">
					<a id="writer"><img alt="" src="/teamproject/resources/images/icon_blankProfile.png">
					{{writer}}</a>
					<span>{{write_date}}</span>
			</div>
			<div id="content" class="reply-body">{{content}}
			</div>
			<div class="btn-div">
				<a class="delete-a">삭제</a>
				<a class="update-a">수정</a>
			</div>
		</div>
	</script>

	<script type="text/javascript">
		$(function() {
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
						console.log(this);
						
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
						
						
						/* list += '<div class="reply-item">' 
							+ '<input id="rno" value="'
							+ this.rno
							+ '" readonly/>'
							+ '<input id="rtext" value="'
							+ this.rtext
							+ '" />'
							+ '<input id="userId" value="'
							+ this.userId
							+ '" readonly/>'
							+ '<input id="regDate" value="'
							+ dateString
							+ '" readonly/>'
							+ '</div>'; */
					});
					
					/* division.html(list); */
					var highHeight = $('.col-9').height();
					console.log("height: " + highHeight);
					$('.detailPost-info').height(highHeight);
				});
			}
			
			// 함수 호출
			getAllReplies();
			
			$('#createReply').click(function() {
				var rtext = $('#rtext').val();
				var userId = $('#userId').val();
				// TODO: 댓글 내용/작성자 아이디가 비어있는지 않은지를 검사
				
				// 댓글을 서버로 전송
				$.ajax({
					type: "POST",
					url: '/ex02/replies',
					headers: {
						'Content-type': 'application/json',
						'X-HTTP-Method-Override': 'post'
					},
					data: JSON.stringify({
						'bno': bno,
						'rtext': rtext,
						'userId': userId
					}),
					success: function(result) {
						alert('댓글 추가 결과: ' + result);
						getAllReplies();
					}
				});
			});
			
			/* 자바 스크립트 실행 시점에 btnUpdate 버튼이 생성되어 있지 않기 때문에
			직접 이벤트 리스너를 등록할 수 없음
			$('.btnUpdate').click(function() {
				alert('test');
			}); */
			
			division.on('click', '.reply-item .btnUpdate', function() {
				
				// 수정할 댓글 번호
				var rno = $(this).prevAll('#rno').val();
				// $(this): 이벤트 리스너 콜백 함수를 실행시킨(이벤트가 발생된) 요소 - 버튼
				// prevAll(요소): 같은 부모 요소를 갖는 형제 요소들 중에서 자신보다 먼저 나오는 요소를 찾음
				
				// 수정할 댓글 번호
				var rtext = $(this).prevAll('#rtext').val();
				
				$.ajax({
					type: 'put',
					url: '/ex02/replies/' + rno,
					headers: {
						'Content-type': 'application/json',
						'X-HTTP-Method-Override': 'put'
					},
					data: JSON.stringify({
						'rtext': rtext
					}),
					success: function(data) {
						if(data == 1){
							alert('댓글 ' + rno + '번 수정 성공');
						} else {
							alert('댓글 수정 실패');
						}
						
						getAllReplies();
					}
				});
			});
			
			division.on('click', '.reply-item .btnDelete', function() {
				
				// 삭제할 댓글 번호
				var rno = $(this).prevAll('#rno').val();
				
				var result = confirm(rno + " 번 댓글을 삭제하시겠습니까?");
				
				if(result == true) {
					
					$.ajax({
						type: 'delete',
						url: '/ex02/replies/' + rno,
						headers: {
							'Content-type': 'application/json',
							'X-HTTP-Method-Override': 'delete'
						},
						success: function(data) {
							if(data == 'success'){
								alert('댓글 ' + rno + '번 삭제 성공');
							} else {
								alert('댓글 삭제실패');
							}
							
							getAllReplies();
						}
					});
				}
				
			});
		});
	</script>
	
		
	<script>
		$(document).ready(function() {
		
		});
	</script>

</body>
</html>