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


	
		
	
</script>
</head>
<body >

	<center>
		<c:choose>
			<c:when test="${regResult == '1'}">
			<script type="text/javascript">
				alert("회원가입을 축하드립니다. 메인 페이지로 이동합니다.")
				
				location.href="newMain.jsp";
				
				
				</script>
				
				
			</c:when>
			<c:otherwise>
			
			<script type="text/javascript">
				alert("회원가입에 실패하셨습니다. 다시 부탁드립니다.")
				
				location.href="newMain.jsp";
				
				
				</script>
			
			</c:otherwise>
		</c:choose>
	</center>
</body>
</html>