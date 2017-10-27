<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>

	<c:choose>
		<c:when test="${findIdResult == true}">
			<h3>
				찾으시는 ID는 <b>${userId}</b> 입니다....<br>
			</h3>
			<a href="newMain.jsp">로그인 하러가기 </a><br>
			<a href="ExistId.jsp">비밀번호를 잊으셨나요? </a>
		</c:when>
		<c:otherwise>
			<h3>일치하는 정보가 없습니다. 다시 한번 시도해주세요!!!</h3>
			<a href="findId.jsp">아이디 다시 찾기</a>
		</c:otherwise>
	</c:choose>

</body>
</html>