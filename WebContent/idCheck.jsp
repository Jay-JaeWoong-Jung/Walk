<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID중복체크</title>

</head>
<body bgcolor="#ffffcc">

	
	<center>
		
		
		<c:choose>
			<c:when test="${result == 'true'}">
				<span style="color: red;">Already Exist! </span>
			</c:when>
			<c:otherwise>
				<span style="color: blue;">Usable </span>
			</c:otherwise>
		</c:choose>

		<!-- 	<a href="#" onclick="javascript:self.close()">닫기</a> -->
	</center>
</body>
</html>