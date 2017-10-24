<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
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
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	font: coiny;
}

</style>
</head>
<body>


	<!-- **********************Start Main list Table ****************************-->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h1 align="left" class="display-3">
					<b>Comment</b>
				</h1>
				<p>
	<nav class="navbar navbar-expand-sm ">
				
				<form class="form-inline" action="DispatcherServlet" method="post">
					
					<p><h2></h2><input type="text" id="datepicker" name="date"></p>
					 <input type="submit" value="Date Check" id="sendBtn">
					<!-- <a href="#"class="btn btn-success" type="submit" id="sendBtn">search</a> -->
					<input type="hidden" name="command" value="list">
					
				</form>
				
 				 <!-- <form class="form-inline">
 			   <input class="form-control" type="text" placeholder="Search">
  				  <button class="btn btn-success" type="button">Search</button>
  					</form> -->
	</nav>
				<table class="table table-hover table-bordered">
					<thead>
						<tr class="text-center">
							<th width="5%" class="text-center">#</th>
							<th width="60%" class="text-center">Content</th>
							<th width="15%" class="text-center">userId</th>
							<th width="15%" class="text-center">Date</th>
							<td colspan="2"></td>

						</tr>
					</thead>
					
				<c:forEach var="bvo" items="${requestScope.list}" varStatus="i">
						<tr class="table-info">

							<%-- <td><%i++;%><%=i %></td> --%>
							<td>${i.count}</td>
							<td>${bvo.content}</td>
							<td>${bvo.userId}</td>
							<td>${bvo.timePosted}</td>
							
							<!-- *************************** Edit ******************************  -->
							<td><!-- <button name="edit" type="button" class="btn btn-primary-xs active"
									data-toggle="modal" data-target="#${bvo.no}">
									<span class="oi oi-pencil" style="color: blue"></span>
								</button> -->
								<a href="#" name="edit" class="btn btn-primary-xs active"
									data-toggle="modal" data-target="#${bvo.no}"><span class="oi oi-pencil" style="color: blue"></span></a>
								
								<!-- *************************** Start Modal ******************************  -->
								
						
							<div class="modal fade" id="${bvo.no}" tabindex="-1"
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
											<input type="text" value="${bvo.content}" id="${bvo.no}content"
											name="content" maxlength="200" size="50" id="updateContent">
										  </div>
									
										<div class="modal-footer">
											<%-- <button type="button" class="btn btn-primary"
												onclick="sumbit_Edit('${bvo.no}','${bvo.timePosted}')">Edit</button> --%>
												<button class="btn btn-primary" id="${bvo.no}clickBtn">Edit</button>
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
										</div>		
											 <script type="text/javascript">
											 /* function sumbit_Edit(bvono,bvocontent,bvotime){
												 	
													var number = bvono
													var content = bvocontent
													var time = bvotime
													location.href="DispatcherServlet?command=editContent&&no="+number
															+"&&content="+content
															+"&&date="+time;
												} */

												$(document).ready(function () {
													$('#${bvo.no}clickBtn').click(function () {
														var content=$('#${bvo.no}content').val();
														/* alert(content); */
			location.href="DispatcherServlet?command=editContent&&no=${bvo.no}&&content="+content+"&&date=${bvo.timePosted}";
														
													});
													
												});
											
											</script> 

										
									</div>
								</div>
							</div>
							
							<!-- *************************** End Modal ******************************  -->
								
								</td>
								<!-- *************************** Delete ******************************  -->
															
						<td>
							
							<!-- <button name="delete" type="button" class="btn btn-primary-xs active"
									data-toggle="modal" data-target="#${bvo.no}delete">
									<span class="oi oi-trash" style="color: blue"></span>
									
								</button> -->
							<a href="#" name="delete" class="btn btn-primary-xs active"
									data-toggle="modal" data-target="#${bvo.no}delete" ><span class="oi oi-trash" style="color: blue"></span></a>
							
							
								<!-- *************************** Start Modal ******************************  -->
								
								
						
							<div class="modal fade" id="${bvo.no}delete" tabindex="-1"
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
			<!-- <div class="col-4">

				<form action="DispatcherServlet" method="post">
					<p>
						Date: <input type="text" id="datepicker" name="date">
					</p>
					<input type="submit" value="Date Check" id="sendBtn"> <input
						type="hidden" name="command" value="list">
				</form>
			</div> -->

			<!-- **************** End Calendar ********************  -->
		</div>
	</div>
	<!-- **********************End Main list Table ****************************-->

	<!-- *************************** Start Write Form ******************************  -->
	<div class="container" style="padding-top: 50px">
		<div class=col-8>
			<form action="DispatcherServlet" method="post" name="write_form">
				<input type="hidden" name="command" value="write">
				
				<table align="center" width="500px">
					

					<tr>
						<td width="15%">Comment</td>
						<td colspan="3"><input type="text" name="content" maxlength="100" size="100"></td><br>
					</tr>
					
					<tr>
			
						<td colspan="4" align="center">
							<!-- <button type="button" class="btn btn-primary btn-block" onclick="content_submit()">
								Write <span class="oi oi-check" ></span>
							</button> -->
							<a href="#" class ="btn btn-primary btn-block" onclick="content_submit()">Write<span class="oi oi-check" ></span></a>
							<br>
							<!-- <button type="button" class="btn btn-default-lg  pull-right">
								Cancel <span class="oi oi-trash" onclick="cancel()"></span>
							</button> -->
							<a href="#" class="btn btn-warning"  onclick="cancel()">Reset <span class="oi oi-trash" onclick="cancel()"></span></a>
							<br><br><br>

						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<!-- *************************** End Write Form ******************************  -->

	


</body>
</html>
















