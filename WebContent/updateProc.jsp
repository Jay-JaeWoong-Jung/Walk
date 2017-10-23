<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="model.MemberDAO" />
<jsp:useBean id="vo" class="model.MemberVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>
<%
	String userId = (String) session.getAttribute("userId");
	vo.setUserId(userId);
	dao.updateMember(vo);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update process</title>
<meta http-equiv="Refresh" content="3:url=login.jsp">
</head>
<body>
	<center>
		<font size="5" face="바탕체"> 입력하신 내용대로 <b>회원정보가 수정되었습니다.</b><br></br>
			3초후에 Logon Page로 이동합니다.

		</font>
	</center>
</body>
</html>