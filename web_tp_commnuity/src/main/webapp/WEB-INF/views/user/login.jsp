<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03</title>
</head>
<body>


<h1>로그인 양식</h1>

<form action="login-post" method="post">
	<input type="text" name="id" required="required" placeholder="아이디 입력"/>
	<input type="password" name="password" required="required" placeholder="비밀번호 입력"/>
	<input type="checkbox" name="useCookie" id="cbx1" value="1"/>
	<label for="cbx1">자동 로그인</label>
	<input type="submit" value="로그인"/>
	<input type="hidden" name="queryString" value="${targetUrl }">
</form>

</body>
</html>