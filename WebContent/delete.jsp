<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원탈퇴</title>
<script >
	function begin() {
		document.deleteForm.pass.focus();
	}
	function checkId() {
		
		if (document.deleteForm.userPass.value =="") {
			alert("비밀번호를 입력하지 않았습니다.");
			document.deleteForm.userPass.focus();
			return false;
		}
		
		$("#deleteForm").submit();
	}
	
</script>
<c:if test="${deleteResult == '0'}">

<script>
alert("회원탈퇴에 실패 하셨습니다. 비밀번호를 다시 입력해주세요")

</script>

</c:if>
</head>
<body onload="begin()">
	<form name="deleteForm" method="post" action="DispatcherServlet?command=deleteMember" id="deleteForm" >
		
		
		<h2 align="center">회원탈퇴 페이지</h2>
		<hr>
		<table width="260" border="1" align="center">
			<tr>
				<td colspan="2" align="center"><b>회원 탈퇴</b></td>
			</tr>
			<tr>
				<td width="150"><b>비밀번호입력</b></td>
				<td width="110"><input type="password" name="userPass" size="15" ></td>
			</tr>

<!-- onclick="javascript:window.location='newMain.jsp'" -->
			<tr>
				<td colspan="2" align="center">
				<input type="hidden" name="command" value="deleteMember">
				<input type="hidden" name="userId" value="${param.userId}">
				<input type="button" value="회원탈퇴" onclick="checkId()" >
					<input type="button" value="취소 "></td>
			</tr>
		</table>
	</form>
</body>
</html>