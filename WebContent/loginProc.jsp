<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="dao" class="model.MemberDAO" />
<%
	String userId = request.getParameter("userId");
	String userPass = request.getParameter("userPass");
	int check = dao.loginCheck(userId, userPass);
%>
<%
	if (check == 1) {
		session.setAttribute("userId", userId);
		response.sendRedirect("main.jsp");

	} else if (check == 0) {
%>
<script>
	alert("비밀번호가 틀렸습니다.");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("아이디가 존재하지 않습니다.");
	history.go(-1);
</script>
<%
	}
%>
