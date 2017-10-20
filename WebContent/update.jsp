<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<jsp:useBean id="dao" class="model.MemberDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<script language="javascript" src="script.js"></script>
</head>
<%
	String userId = (String) session.getAttribute("userId");
	MemberVO vo = dao.getMemberInfo(userId);
%>
<body>
	<h1 align="center">회원 정보 수정</h1>
	<hr>
	<form action="updateProc.jsp" method="post" name="regForm">
		<table border="1" align="center">
			<tr>
				<td align="right">ID :</td>
				<td><%=vo.getUserId()%></td>
			</tr>
			<tr>
				<td align="right">Password :</td>
				<td><input type="password" name="pass"
					value="<%=vo.getUserPass()%>" /></td>
			</tr>
			<tr>
				<td align="right">Password 확인 :</td>
				<td><input type="password" name="repass"
					value="<%=vo.getUserPass()%>" /></td>
			</tr>
			<tr>

				<td align="right">이름 :</td>
				<td><%=vo.getUserName()%></td>
			</tr>
			<tr>
				<td align="right">핸드폰 번호 :</td>
				<td><input type="text" name="phone1" size="4"
					value="<%=vo.getPhone1()%>" />- <input type="text" name="phone2"
					size="5" value="<%=vo.getPhone2()%>" />- <input type="text"
					name="phone3" size="5" value="<%=vo.getPhone3()%>" /></td>
			</tr>
			<tr>
				<td align="right">이메일 :</td>
			<%-- 	<td><input type="text" name="email" value="<%=vo.getEmail()%>" /></td> --%>
			</tr>
			
			
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="수정완료" onclick="updateCheck()" />&nbsp;&nbsp; <input
					type="button" value="취소"
					onclick="javascript:window.location='main.jsp'" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
