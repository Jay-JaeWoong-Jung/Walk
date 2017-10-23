<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로필 페이지</title>
</head>
<title>Bootstrap Theme Company Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<body>
	<center>
		<h2>profile</h2>
		<div class="row">
			<c:choose>
				<!-- 회원가입 후 -->

				<c:when test="${mvo.userId != null}">
					<div class="col-md-4">
						<div class="thumbnail">
							<img src="./image/default.png" class="img-circle"
								alt="Cinque Terre" width="300" height="272" style="color: gray">
							<br> <br /> <a href="#" data-toggle="modal"
								data-target="#signUp " id="regForm">${mvo.userId}님의 정보입니다.</a><br>
							<br />
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<!-- 회원가입 전 -->
					<div class="col-md-4">
						<a href="main.jsp">회원가입 후 이용하실 수 있습니다. </a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</center>
</body>
</html>