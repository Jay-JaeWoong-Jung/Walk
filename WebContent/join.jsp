<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ���Ű��� ȯ���մϴ�!!!</title>
<script type="text/javascript">
	function idCheck() {
		alert("��밡���� ���̵� �Դϴ�.");
		//alert("�̹� �����ϴ� ID �Դϴ�.");
		
	}
	function findZip() {
		location.href = "http://localhost:8888/PrivateProject/zipCheck.jsp";
	}
</script>
</head>
<body>
	<h2 align="center">ȸ�� ����</h2>
	<form action="login.jsp" method="post" name="joinForm">
		<table border="1" align="center">
			<tr>
				<td align="right">ID :</td>
				<td><input type="text" name="id" />&nbsp; <input type="button"
					value="�ߺ�Ȯ��" onclick="idCheck()" /></td>
			</tr>
			<tr>
				<td align="right">Password :</td>
				<td><input type="password" name="pass" /></td>
			</tr>
			<tr>
				<td align="right">Password Ȯ�� :</td>
				<td><input type="password" name="repass" /></td>
			</tr>
			<tr>

				<td align="right">�̸� :</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td align="right">�ڵ��� ��ȣ :</td>
				<td><select name="phone1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
				</select> - <input type="text" name="phone2" size="5">- <input
					type="text" name="phone3" size="5"></td>
			</tr>
			<tr>
				<td align="right">�̸��� :</td>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<td align="right">�����ȣ :</td>
				<td><input type="text" name="zipcode" /> <input type="button"
					value="ã��" onclick="findZip()" /></td>
			</tr>
			<tr>
				<td align="right">�ּ�1 :</td>
				<td><input type="text" name="address1" size="50" /></td>
			</tr>
			<tr>
				<td align="right">�ּ�2 :</td>
				<td><input type="text" name="address2" size="30" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="ȸ������" />&nbsp;&nbsp; <input type="reset" value="�ʱ�ȭ" /></td>
			</tr>
		</table>
	</form>
</body>
</html>