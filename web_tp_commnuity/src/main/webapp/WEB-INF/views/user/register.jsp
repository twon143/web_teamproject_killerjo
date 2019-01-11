<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원가입 테스트용</title>
</head>

<body>
<h1>회원가입 테스트용</h1>
<form action="register" method="post">
	<input type="text" id ="userId" name="id" placeholder="아이디 입력" required="required"/>
	<!-- <input type="text" id="checkUserId" name="validateIds" readonly="readonly" placeholder="아이디 조건 검사"/> -->
	<br/>
	<input type="password" id ="btnPassword" name="password" placeholder="비밀번호 입력" required="required" />
	<!-- <input type="text" name="validatePassword" readonly="readonly" placeholder="비밀번호 조건 검사" /> -->
	<br/>
	<!-- <input type="password" name="userCheckPwd" placeholder="비밀번호 확인" required="required" />
	<input type="text" name="validateCheckPassword" readonly="readonly" placeholder="비밀번호확인 조건 검사" />
	<br/> -->
	<input type="email" name="email" placeholder="이메일 입력" required="required" />
	<!-- <input type="text" name="validateEmail" readonly="readonly" placeholder="이메일 조건 검사" /> -->
	<br/>
	<input type="text" name="nickname" placeholder="닉네임 입력" required="required" />
	<!-- <input type="text" name="validateNickname" readonly="readonly" placeholder="닉네임 조건 검사" /> -->
	<br/>
	<input type="submit" value="회원가입" />
</form>


<script>
$(document).ready(function () {
	$('#btnPassword').click(function() {
		var id = $('#userId').val();
		var id_length = $('#userId').length();
		var id_Form_Check = /^[a-z]{1}[a-z0-9]$/;
		if(id == '') {
			$('#checkUserId').val('아이디를 입력하시오')
		}
		else if(id_length < 6 || id_length > 12) {
			$('#checkUserId').val('아이디는 6자리이상 12자이하로 입력하시오')
			
		}
		else if(!id_Form_Check.test($(id))) {
			
		}
		
		
	})
	
})


</script>
</body>
</html>