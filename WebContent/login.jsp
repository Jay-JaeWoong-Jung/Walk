<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String loginID=(String) session.getAttribute("loginID");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� ������</title>
<script type="text/javascript">
function regForm() {
	location.href="http://192.168.0.137:8888/PrivateProject/regForm.jsp";
}
</script>
</head>
<body>
<%
if(loginID!=null){%>

<%=loginID %>�� ȯ���մϴ�.


<%}else{ %>
<%} %>
<form  method="post"  action="loginProc.jsp">
		<h2 align="center">ȸ�� �α���</h2>
		<p>
		<table border="1" width="300" align="center">
			<tr>
				<td align="right" width="100" >���̵� : </td>
				
				<td><input type="text" name="id" size="20" ></td>
			</tr>
			<tr>
				<td align="right" width="100">��й�ȣ : </td>
				
				<td><input type="password" name="pass" size="20" ></td>
				</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="�α���" />&nbsp;&nbsp;
				<input type="button" value="ȸ������" onclick="regForm()"/></td>
			</tr>
		</table>
	</form>
</body>
</html>