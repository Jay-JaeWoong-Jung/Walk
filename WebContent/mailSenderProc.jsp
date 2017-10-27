<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${authNumResult == true}">
			<h3>인증 번호가 일치합니다!!</h3>
			<a href="newMain.jsp">로그인 하러가기 </a>
		</c:when>
		<c:otherwise>
			<h3>인증번호가 일치하지 않습니다.);</h3>
			<a href="mailSender.jsp">인증번호 다시 받기 </a>
		</c:otherwise>
	</c:choose>

</body>
</html>