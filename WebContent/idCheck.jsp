<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID중복체크</title>
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#ffffcc">
	<br>
	<center>
		<b></b>
		
		<c:choose>
			<c:when test="${result == 'true'}">
			 		${userId}는 이미 존재하는 ID 입니다.
			</c:when>	
			<c:otherwise>
			${userId}는 사용 가능 합니다.<br></br>
			
			</c:otherwise>
		</c:choose>
			
		
		<a href="#" onclick="javascript:self.close()">닫기</a>
	</center>
</body>
</html>