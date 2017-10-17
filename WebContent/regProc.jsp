<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="dao" class="model.MemberDAO" />
<jsp:useBean id="vo" class="model.MemberVO" />
<jsp:setProperty name="vo" property="*" />
<%
	boolean flag = dao.memberInsert(vo);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 확인</title>
</head>
<body bgcolor="#ffffcc">
	<br></br>
	<center>
		<%
			if (flag) {
				out.println("<b>회원가입을 축하드립니다.</b><br/>");
				out.println("<a href=main.jsp>로그인</a>");

			} else {
				out.println("<b>다시 입력하여 주십시오.</b><br/>");
				out.println("<a href=main.jsp>다시 가입</a>");
			}
		%>
	</center>
</body>
</html>