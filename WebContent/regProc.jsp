<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 확인</title>
<script language="JavaScript" src="script.js"></script>
<script>
	$('#moveLogin').click(function() {
		$('#login').click(function() {
		});
		$('#login').trigger('click');
	});
	$('#moveRegForm').click(function() {
		$('#regForm').click(function() {
		});
		$('#regForm').trigger('click');
	});
</script>
</head>
<body bgcolor="#ffffcc">

	<center>
		<c:choose>
			<c:when test="${flag == 'true'}">
				<b>회원가입을 축하드립니다.</b>
				<br />
				<a href="#" id="moveLogin"> 로그인 </a>
			</c:when>
			<c:otherwise>
				<b>다시 입력하여 주십시오.</b>
				<br />
				<a href="#" id="moveRegForm">다시 가입</a>
			</c:otherwise>
		</c:choose>
	</center>
</body>
</html>