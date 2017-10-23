<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript">
function editAction(){
	var pass=document.update_form;
	if(pass.content.value==""){
		alert("내용을 입력하세요!");
		f.content.focus();
		return; 
	}
	else{
	pass.submit();
/* 	alert("수정이 완료되었습니다."); */

	}
	
	
	
}


</script>
</head>
<body>
<c:choose>
	<c:when test="${param.result!=null}">
		<form action="DispatcherServlet?no=${list.no}" method="post" name="update_form">
 		<input type="hidden" name="command" value="editContent">
  		<input type="text" value="${list.content}" name="content" maxlength="200" size="50">
 		<input type="text" value="${list.timePosted}" name="date" maxlength="200" size="50">
		<input type="button" value ="수정하기"  onclick="editAction()">
		
		</form>
	
	</c:when>
		<c:otherwise>
		<script type="text/javascript">
		alert("패스워드가 일치하지 않습니다..")
	
			self.close();
		</script>
		</c:otherwise>
	</c:choose>

</body>
</html>












