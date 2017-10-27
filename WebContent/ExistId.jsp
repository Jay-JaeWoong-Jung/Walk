<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<c:if test="${result == false}">
	<script type="text/javascript">
		alert("존재하지 않는 아이디 입니다.");
	</script>
</c:if>
<body>
	<%@ include file="./navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 text-center">


				<h2>비밀번호 찾기</h2>
				<hr>
				<p>비밀 번호를 찾고자 하는 아이디를 입력해주세요.
				<form action="DispatcherServlet?command=existId" method="post"
					name="ExistIdForm" id="ExistIdForm">
					<div>
						<input type="text" name="findIdforfindPass" placeholder="아이디"></input>
					</div>
					<input type="hidden" name="command" value="existId"><br>
					<button type="submit" class="btn btn-primary" value="findPass">다음</button>
					<p>아이디가 기억나지 않는다면?</p>
					<a href="findId.jsp">아이디 찾기 바로가기</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>