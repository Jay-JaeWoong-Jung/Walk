<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function content_submit(){
	var f=document.write_form;
	if(f.content.value==""){
		alert("내용을 입력하세요!");
		f.content.focus();
		return; 
	}
	if(f.writer.value==""){
		alert("이름을 입력하세요!");
		f.writer.focus();
		return;
	}
	if(f.password.value==""){
		alert("패스워드를 입력하세요!");
		f.password.focus();
		return;
	}
	
	//이동할 페이지로 폼값을 가지고 전송됨
	f.submit();
}
function cancel(){
	var f=document.write_form;
	f.reset();
}

function winOpen(bvono){
	var number = bvono
	window.open("blog_delete_popup.jsp?no="+number,"z","width=500, height=400, resizable=ture, toolbar=no, top=300, left=500");
}
</script>
</head>
<body>
<c:import url="blog_header.jsp"></c:import>
<h2 align="center"><b>전체 게시글 보기</b></h2><p>
<table border="1" width="650" cellpadding="2" align="center">
	<tr>
		<th width="10%">번호</th>
		<th width="60%">내용</th>
		<th width="15%">작성자</th>
		<th width="15%">작성일</th>
		
	</tr>

	<c:forEach var="bvo" items="${requestScope.list}" varStatus="i">
		<tr>
			
			<%-- <td><%i++;%><%=i %></td> --%>
			<td>${i.count}</td>
		<%-- 	<td>${bvo.no}</td> --%>
			<td>${bvo.content}</td>
			<td>${bvo.writer}</td>
			<td>${bvo.timePosted}</td>
			<td><img alt="삭제" src="img/delete_btn.jpg" border="0" onClick="winOpen('${bvo.no}')"></td>
			<!-- <td>${bvo.hits}</td> -->
		</tr>	
	</c:forEach>
</table><p>

  <form action="DispatcherServlet" method="post" name="write_form">
  <input type="hidden" name="command" value="write">
   <table align="center" width="500px" >
    <tr>
     <td width="10%">Comment</td>
     <td colspan="3">
     <input type="text" name="content" maxlength="200" size="50">
     </td>
    </tr>
    <tr>
     <td width="10%">이름</td>
     <td width="35%"><input type="text" name="writer"></td>
     <td width="15%">비밀번호</td>
     <td >
     <input type="password" name="password" maxlength="4" size="4">
     </td>
    </tr>
     <tr>
     <td colspan="4" align="center" >
      <img src="img/confirm.gif" alt="확인"  onclick="content_submit()">
      <a href="blog_list.jsp" onclick="cancel()"><img src="img/cancel.gif"></a>      
     </td>  
    </tr>
   </table>
  </form>



<div align="center">
<a href="blog_write.jsp"><img alt="글쓰기 이미지" src="img/write_btn.jpg"></a>
<a href="blog_delete_popup.jsp"><img alt="삭제 이미지" src="img/delete_btn.jpg"></a>
</div>
</body>
</html>
















