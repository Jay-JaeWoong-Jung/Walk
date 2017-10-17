<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="model.MemberDAO" />
<%
	String id = request.getParameter("id");
	boolean check = dao.idCheck(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID중복체크</title>
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#ffffcc">
	<br>
	<center>
		<b><%=id%></b>
		<%
			if (check) {
				out.println("는 이미 존재하는 ID 입니다.<br></br>");
			} else {
				out.println("는 사용 가능 합니다.<br></br>");
			}
		%>
		<a href="#" onclick="javascript:self.close()">닫기</a>
	</center>
</body>
</html>