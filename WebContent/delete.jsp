<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
<script type="text/javascript">
	function begin() {
		document.myForm.pass.focus();
	}
	function checkIt() {
		if (!document.myForm.pass.value) {
			alert("비밀번호를 입력하지 않았습ㄴ다.");
			document.myForm.pass.focus();
			return false;
		}
	}
	function main() {
		location.href = "http://192.168.0.137:8888/PrivateProject/Bootstrap.jsp";
	}
</script>
</head>
<body onload="begin()" >
	<form name="myForm" method="post" action="deleteProc.jsp" onsubmit="return checkIt()">
	<h2 align="center">회원탈퇴 페이지</h2>
	<hr>
		<table width="260" border="1" align="center">
			<tr>
				<td colspan="2" align="center"><b>회원 탈퇴</b></td>
			</tr>
			<tr>
				<td width="150"><b>비밀번호입력</b></td>
				<td width="110"><input type="password" name="pass" size="15"></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="회원탈퇴" onclick="javascript:window.location='login.jsp'"> <input type="button" value="취소"
					></td>
			</tr>
		</table>

	</form>
</body>
</html>