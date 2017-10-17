<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function delAction(){
	var pass = document.delCheckForm;
	if(pass.password.value=="")
		alert("비밀번호를 입력하세요!");
		else
		pass.submit();
	
}
</script>
</head>
<body>
<form action="DispatcherServlet" method="post" name="delCheckForm">
<input type="password" name="password"  maxlength="200" size="50"><br><br>
<input type="hidden" name="command" value="deleteCheckPassword">
<input type="hidden" name="no" value="${param.no}"> <!-- 게시판 no 받는것 -->
<input type="button" value ="삭제"  onclick="delAction()">
<input type="button" value ="창닫기" onclick="javascript:self.close()">
</form>
</body>
</html>












