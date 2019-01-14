<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

	<h1>게시글 상세보기 페이지</h1>

	<ul>
		<li><a href="list">게시판 메인 페이지</a></li>
		<li><a href="update?bno=${board.bno }">수정하기</a></li>
	</ul>

	<hr />

	<form>
		<input type="number" id="bno" value="${board.bno }" readonly="readonly" /> <br />
		<input type="text" value="${board.title }" readonly="readonly" /> <br />
		<textarea rows="5" cols="80" readonly="readonly">${board.content }</textarea>
		<br /> <input type="text" value="${board.userId }" readonly="readonly" />
		<br />
		<fmt:formatDate value="${board.regDate }"
			pattern="yyyy/MM/dd/ HH:mm:ss" var="regDate" />
		<input type="text" value="${regDate }" readonly="readonly" />

	</form>

	<hr />

	<div>
		<input type="text" id="rtext" placeholder="댓글 내용 입력"
			required="required" /> <input type="text" id="userId"
			placeholder="아이디 입력" required="required"/>
		<button id="createReply">댓글 작성</button>
	</div>

	<hr />
	<div id="replies">
		<!-- 댓글 리스트를 넣어줄 영역 -->

	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
	<script id="reply-template" type="text/x-handlebars-template">
		<div class="reply-item">
			<input id="rno" value="{{rno}}" type="hidden" readonly/>
			<input id="rtext" value="{{rtext}}" type="text"/>
			<input id="userId" value="{{userId}}" type="text" readonly/>
			<input id="regDate" value="{{regDate}}" type="text" readonly/>
			<button class="btnUpdate">수정</button>
			<button class="btnDelete">삭제</button>
		</div>
	</script>

	<script type="text/javascript">
		$(function() {
			// 현재 보고 있는 게시글의 글번호
			var bno = $('#bno').val();
			// 댓글 전체 리스트를 출력할 영역
			var division = $('#replies');
			
			// handlebars 스크립트 사용
			// 1) 템플릿 HTML 요소를 찾음
			var source = $("#reply-template").html();
			// 2) 템플릿을 컴파일
			var template = Handlebars.compile(source);
			
			function getAllReplies() {
				// $.getJSON(url, callback):
				// url 주소로 get 방식의 Ajax 요청을 보내는 함수
				// callback(data): data는 JSON 타입
				$.getJSON('/ex02/replies/all/' + bno, function(data) {
					
					division.empty(); // div 영역의 모든 HTML 요소를 제거
					
					/* var list = ''; */
					
					$(data).each(function() {
						// 배열 data에 대한 반복 기능 수행하는 콜백함수
						console.log(this);
						
						var date = new Date(this.regDate); // 댓글 작성 시간
						var dateString = date.toLocaleDateString()
								+ ' ' + date.toLocaleTimeString();
						
						// 3) handlebars 템플릿에 {{변수}}를 채울 수 있는 객체 생성
						var content = {
								rno: this.rno,
								rtext: this.rtext,
								userId: this.userId,
								regDate: dateString
						};
						// 4) 생성된 객체를 handlebars 템플릿에 적용
						var replyItem = template(content);
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

</body>
</html>