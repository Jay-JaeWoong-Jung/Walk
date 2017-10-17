<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>


<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	<c:choose>
		<c:when test="${flag==true}">
			if(confirm("정말로 삭제하겠습니까??")){
				window.opener.location.href="DispatcherServlet?command=deletePosting&&no=${param.no}"
			}
		</c:when>
		<c:otherwise>
			alert("패스워드가 일치하지 않습니다..")
		</c:otherwise>
	</c:choose>
	
	window.self.close();
</script>












