<%@page import="model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${mvo !='null'}">
		<b>${mvo.userId}</b>님, 로그인 성공!!<br>
		<a href="main.jsp">Walk & Talk 입장하기</a>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("로그인 부터 다시하세요..");
			location.href="main.jsp"; /* 자바스크립트에서 사이트 이동할때 */
		</script>
	</c:otherwise>
</c:choose>
	
</body>
</html>















