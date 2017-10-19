<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" 
integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" 
integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<link href="./open-iconic-master/font/css/open-iconic-bootstrap.css" rel="stylesheet">

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

function winOpen_Delete(deleteno){
	var number = deleteno
	window.open("blog_delete_popup.jsp?no="+number,"z","width=500, height=400, resizable=ture, toolbar=no, top=300, left=500");
}

function winOpen_Edit(editno){
	var number = editno
	window.open("blog_edit_popup.jsp?no="+number,"z","width=500, height=400, resizable=ture, toolbar=no, top=300, left=500");
}
</script>
</head>
<body>

<c:import url="blog_header.jsp"></c:import>

<!-- **********************End Main list Table ****************************-->
<div class="container">
	<h1 align="center" class="display-3"><b>Comment</b></h1><p>
	<div class ="col-8">
		<table class="table table-hover" border="1" width="650" cellpadding="2" align="center">
		<thead>	
			<tr class="table-primary">
				<th width="5%">#</th>
				<th width="60%">Content</th>
				<th width="15%">Writer</th>
				<th width="15%">Date</th>
				<th width="15%"></th>
		
			</tr>
		</thead>
		<c:forEach var="bvo" items="${requestScope.list}" varStatus="i">
			<tr class="table-info">
			
				<%-- <td><%i++;%><%=i %></td> --%>
				<td>${i.count}</td>
				<td>${bvo.content}</td>
				<td>${bvo.writer}</td>
				<td>${bvo.timePosted}</td>
				<td><button type="button" class="btn btn-default-sm active">Delete
				<span class="oi oi-trash" onclick="winOpen_Delete('${bvo.no}')"></span></button><br><br>
				<button type="button" class="btn btn-default-sm active">Edit
				<span class="oi oi-pencil" onclick="winOpen_Edit('${bvo.no}')"></span></button></td>
				
			</tr>	
			</c:forEach>
		</table><p>
	</div>
	<div class="col-4">
	
	</div>
</div>
<!-- **********************End Main list Table ****************************-->

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
















