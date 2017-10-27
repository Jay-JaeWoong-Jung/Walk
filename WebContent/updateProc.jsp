<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
 	<link rel="stylesheet" href="./css/reserve.css"> 
<title>회원정보수정 성공</title>
</head>
 <c:choose>
	<c:when test="${updateResult == '1' }">
		<meta http-equiv="Refresh" content="3;url=newMain.jsp">
	</c:when>
	<c:otherwise>
		<meta http-equiv="Refresh"
			content="3;url=newUpdate.jsp?userId=${mvo.userId}">
	</c:otherwise>
</c:choose> 



<body>


<%@ include file="./navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 text-center">
			
			
	<center>
		<c:choose>
			<c:when test="${updateResult == '1' }">
				<font size="5" > 입력하신 내용대로 <b>회원정보가 수정되었습니다.</b><br></br>
					3초후에 main Page로 이동합니다.
				</font>
			</c:when>
			<c:otherwise>
				<font size="5" > 입력하신 내용대로 <b>회원정보 수정에 실패했습니다.</b><br></br>
					3초후에 회원정보 수정 Page로 이동합니다.
				</font>
			</c:otherwise>
		</c:choose>
	</center>
				</div>
		</div>
	</div>
</body>
</html>