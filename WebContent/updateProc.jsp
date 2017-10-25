<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원정보수정 성공</title>
</head>
<c:choose>
	<c:when test="${updateResult == '1' }">
		<meta http-equiv="Refresh" content="3;url=main.jsp">
	</c:when>
	<c:otherwise>
		<meta http-equiv="Refresh" content="3;url=update.jsp?userId=${mvo.userId}">
	</c:otherwise>
</c:choose>

<body>
<h2>업데이트 결과: ${updateResult}</h2>
	<center>
	
	<c:choose>
	<c:when test="${updateResult == '1' }">
		<font size="5" face="바탕체"> 입력하신 내용대로 <b>회원정보가 수정되었습니다.</b><br></br>
			3초후에 main Page로 이동합니다.

		</font>
	</c:when>
	<c:otherwise>
	<font size="5" face="바탕체"> 입력하신 내용대로 <b>회원정보 수정에 실패했습니다.</b><br></br>
			3초후에 회원정보 수정 Page로 이동합니다.

		</font>
	</c:otherwise>
</c:choose>
	
		
	</center>
</body>
</html>