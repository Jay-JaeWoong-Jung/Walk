<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script language="JavaScript" src="script.js"></script>
<center>
	<c:choose>
		<c:when test="${vo!=null}">
			<script>
				alert("비밀번호가 틀렸습니다.");
				history.go(-1);
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("아이디가 존재하지 않습니다.");
				history.go(-1);
			</script>
		</c:otherwise>
	</c:choose>
</center>


