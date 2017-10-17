<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="dao" class="model.MemberDAO" />
<html>
<head>
<title>회원탈퇴</title>
</head>
<%
	String id = (String) session.getAttribute("loginID");
	String pass = request.getParameter("pass");
	int check = dao.deleteMember(id, pass);
	if (check == 1) {
		session.invalidate();
%>
<meta http-equiv="Refresh" content="3;url=Bootstrap.jsp">
<body>
	<center>
		<font size="5" face="바탕체"> 회원정보가 삭제되었습니다.<br></br> 안녕히 가세요!<br></br>
			3초후에 메인 페이지로 이동합ㄴ다.
		</font>
	</center>
	<%
		} else {
	%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%
		}
	%>

</body>
</html>