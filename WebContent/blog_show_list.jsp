<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
<link href="./open-iconic-master/font/css/open-iconic-bootstrap.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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


/* function winOpen_Edit(editno,ediTime){
	var number = editno
	var time = ediTime 
	location.href="blog_edit_popup.jsp?no="+number"&time="+time;
} */

$(function (){
    $( "#datepicker" ).datepicker({
    	
    	dateFormat:"yy-mm-dd",
    	dayNamesMin:['일','월','화','수','목','금','토'],
    	monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    	
    }); //datepicker()
    
    //sendBtn 버튼을 클릭하면 입력된 날짜를 받아서 alert로 출력
	
    
});

</script>
<style>
body {
	background-color: skyblue;
}
</style>
</head>
<body>

	<c:import url="blog_header.jsp"></c:import>

	<!-- **********************End Main list Table ****************************-->
	<div class="container">
		<div class="row">
			<div class="col-8">
				<h1 align="left" class="display-3">
					<b>Comment</b>
				</h1>
				<p>
				<table class="table table-hover table-bordered">
					<thead>
						<tr class="text-center">
							<th width="5%" class="text-center">#</th>
							<th width="60%" class="text-center">Content</th>
							<th width="15%" class="text-center">Writer</th>
							<th width="15%" class="text-center">Date</th>
							<td colspan="2"></td>

						</tr>
					</thead>
				<c:forEach var="bvo" items="${requestScope.list}" varStatus="i">
						<tr class="table-info">

							<%-- <td><%i++;%><%=i %></td> --%>
							<td>${i.count}</td>
							<td>${bvo.content}</td>
							<td>${bvo.writer}</td>
							<td>${bvo.timePosted}</td>
							
							<td><button name="edit" type="button" class="btn btn-primary-xs active"
									data-toggle="modal" data-target="#editmodal">
									<input type="hidden" name="editvalue" value="${bvo.no}','${bvo.content}','${bvo.timePosted}">
									<span class="oi oi-pencil" style="color: blue"></span>
								</button>
								<!-- *************************** Start Modal ******************************  -->
								<!-- *************************** Edit Modal ******************************  -->
							
							<div class="modal fade" id="editmodal" tabindex="-1"
								role="dialog" >
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">edit!</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">Edit Content
										<input type="text" value="${bvo.content}" name="content" maxlength="200" size="50">
										
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary"
												onclick="sumbit_Edit('${bvo.no}','${bvo.content}','${bvo.timePosted}')">Edit</button>
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
											<script type="text/javascript">
											function sumbit_Edit(bvono,bvocontent,bvotime){
												var number = bvono
												var content = bvocontent
												var time = bvotime
												location.href="DispatcherServlet?command=editContent&&no="+number
														+"&&content="+content
														+"&&date="+time;
											}

											
											</script>

										</div>
									</div>
								</div>
							</div>
							
							<!-- *************************** End Modal ******************************  -->
								
								</td>
															
						<td>
							
							<button name="delete" type="button" class="btn btn-primary-xs active"
									data-toggle="modal" data-target="#deleteModal">
									<span class="oi oi-trash" style="color: blue"></span>
								</button>
							
							
								<!-- *************************** Start Modal ******************************  -->
								
								
						<!-- *************************** Delete ******************************  -->
							<div class="modal fade" id="deleteModal" tabindex="-1"
								role="dialog" >
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Delete!</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">Really??????</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary"
												onclick="sumbit_Delete('${bvo.no}','${bvo.timePosted}')">ff</button>
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
											<script type="text/javascript">
											function sumbit_Delete(bvono,bvotime){
												var number = bvono
												var time = bvotime
												location.href="DispatcherServlet?command=deletePosting&&no="+number+"&&date="+time;
											}

											
											</script>

										</div>
									</div>
								</div>
							</div>
							<!-- *************************** End Modal ******************************  -->
							
						</td>	
							


						</tr>
												
				</c:forEach>
				</table>
				<p>
			</div>
			<!-- **************** Start Calendar ********************  -->
			<div class="col-4">

				<form action="DispatcherServlet" method="post">
					<p>
						Date: <input type="text" id="datepicker" name="date">
					</p>
					<input type="submit" value="Date Check" id="sendBtn"> <input
						type="hidden" name="command" value="list">
				</form>
			</div>

			<!-- **************** End Calendar ********************  -->
		</div>
	</div>
	<!-- **********************End Main list Table ****************************-->

	<!-- *************************** Start Write Form ******************************  -->
	<div class="container" style="padding-top: 50px">
		<div class=col-8>
			<form action="DispatcherServlet" method="post" name="write_form">
				<input type="hidden" name="command" value="write">
				
				<table align="left" width="500px">
					<tr>
						<td width="10%">Name</td>
						<td width="200px"><input type="text" name="writer"></td>
						<td width="15%">Password</td>
						<td><input type="password" name="password" maxlength="6"
							size="8"></td>
					</tr>

					<tr>
						<td width="15%">Comment</td>
						<td colspan="3"><input type="text" name="content"
							maxlength="100" size="80"></td>
					</tr>

					<tr>
						<td colspan="4" align="center">
							<button type="button" class="btn btn-primary btn-block">
								Write <span class="oi oi-check" onclick="content_submit()"></span>
							</button>

							<button type="button" class="btn btn-default-lg  pull-right">
								Cancel <span class="oi oi-trash" onclick="cancel()"></span>
							</button>

						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<!-- *************************** End Write Form ******************************  -->

	


</body>
</html>
















