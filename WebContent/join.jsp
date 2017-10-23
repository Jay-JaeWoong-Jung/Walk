<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>에 오신것을 환영합니다!!!</title>
<script type="text/javascript">
	function idCheck() {
		alert("사용가능한 아이디 입니다.");
		//alert("이미 존재하는 ID 입니다.");
		
	}
	function findZip() {
		location.href = "http://localhost:8888/PrivateProject/zipCheck.jsp";
	}
</script>
</head>
<body>
	<h2 align="center">회원 가입</h2>
	<form action="login.jsp" method="post" name="joinForm">
		<table border="1" align="center">
			<tr>
				<td align="right">ID :</td>
				<td><input type="text" name="id" />&nbsp; <input type="button"
					value="중복확인" onclick="idCheck()" /></td>
			</tr>
			<tr>
				<td align="right">Password :</td>
				<td><input type="password" name="pass" /></td>
			</tr>
			<tr>
				<td align="right">Password 확인 :</td>
				<td><input type="password" name="repass" /></td>
			</tr>
			<tr>

				<td align="right">이름 :</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td align="right">핸드폰 번호 :</td>
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
				<td align="right">이메일 :</td>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<td align="right">우편번호 :</td>
				<td><input type="text" name="zipcode" /> <input type="button"
					value="찾기" onclick="findZip()" /></td>
			</tr>
			<tr>
				<td align="right">주소1 :</td>
				<td><input type="text" name="address1" size="50" /></td>
			</tr>
			<tr>
				<td align="right">주소2 :</td>
				<td><input type="text" name="address2" size="30" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="회원가입" />&nbsp;&nbsp; <input type="reset" value="초기화" /></td>
			</tr>
		</table>
	</form>
</body>
</html>