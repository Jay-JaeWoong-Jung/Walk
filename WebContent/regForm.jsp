<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에 오신것을 환영합니다!!!</title>
<script type="text/javascript">
	function zipCheck() {
		url = "zipCheck.jsp?check=y";
		window
				.open(
						url,
						"post",
						"toolbar=no,width=500, height=300, directories=no,status=yes,scrollbars=yes,menubar=no");
	}
</script>
<script language="javascript" src="script.js"></script>
</head>
<body>
	<h2 align="center">회원 가입</h2>
	<form action="./regProc.jsp" method="post" name="regForm">
		<table border="1" align="center">
			<tr>
				<td align="right">ID :</td>
				<td><input type="text" name="id" />&nbsp; <input type="button"
					value="중복확인" onclick="idCheck(this.form.id.value)" /></td>
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
				<td align="right">생일 :</td>
				<td><input type="text" name="year" />년
				<select name="month">
				<option value="1" selected="월">월</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
				</select>
				<input type="text" name="day" />일
				</td>
			</tr>
			<tr>
				<td align="right">성별 :</td>
				<td><input type="radio" name="gender" value="0" />남자 <input
					type="radio" name="gender" value="1" />여자</td>
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
				</select> - <input type="text" name="phone2" size="5" />- <input type="text"
					name="phone3" size="5" /></td>
			</tr>
			<tr>
				<td align="right">이메일 :</td>
				<td><input type="text" name="email" /> <select name="email">
						<option value="직접선택" selected="직접선택">직접선택</option>
						<option value="@naver.com">@naver.com</option>
						<option value="@nate.com">@nate.com</option>
						<option value="@dreamwiz.com">@dreamwiz.com</option>
						<option value="@yahoo.co.kr">@yahoo.co.kr</option>
						<option value="@empal.com">@empal.com</option>
						<option value="@unitel.co.kr">@unitel.co.kr</option>
						<option value="@gmail.com">@gmail.com</option>
						<option value="@korea.com">@korea.com</option>
						<option value="@chol.com">@chol.com</option>
						<option value="@paran.com">@paran.com</option>
						<option value="@freechal.com">@freechal.com</option>
						<option value="@hanmail.net">@hanmail.net</option>
						<option value="@hotmail.com">@hotmail.com</option>
				</select></td>
			</tr>
			

			<tr>
				<td colspan="2" align="center"><input type="button"
					value="회원가입" onclick="inputCheck()" />&nbsp;&nbsp; <input
					type="reset" value="초기화" /></td>
			</tr>
		</table>
	</form>
</body>
</html>