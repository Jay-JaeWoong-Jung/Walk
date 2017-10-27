<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>비밀번호 찾기</h2>
	<hr>
	<p>비밀 번호를 찾고자 하는 아이디를 입력해주세요.
	<form action="DispatcherServlet?command=existId" method="post"
		name="ExistIdForm"  id="ExistIdForm">
		<div>
			<input type="text" name="findId"></input>
		</div>
		<input type="hidden" name="command" value="existId"><br>
		<button type="submit" class="btn btn-primary" value="findPass">다음</button>
		<p>아이디가 기억나지 않는다면?</p>
		<a href="findId.jsp">아이디 찾기 바로가기</a>
	</form>
</body>
</html>