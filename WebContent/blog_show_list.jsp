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

function search_submit(){
	var f=document.search_form;
	if(f.date.value==""){
		alert("날짜를 입력하세요!");
		f.date.focus();
		return; 
	}

	//이동할 페이지로 폼값을 가지고 전송됨
	f.submit();
}
/* $(function (){
    $( "#datepicker" ).datepicker({
    	
    	dateFormat:"yy-mm-dd",
    	dayNamesMin:['일','월','화','수','목','금','토'],
    	monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    	
    }); //datepicker()
    
    //sendBtn 버튼을 클릭하면 입력된 날짜를 받아서 alert로 출력
	
    
}); */


</script>

<style>
body {
/* 	background-color: skyblue;
 */	font-family: bmjua;
	background-image: linear-gradient(180deg,#fb4d7d,#ff7556);
	
}

@font-face {
	font-family: bmjua;
	src: url(./css/font/BMJUA_ttf.ttf);
}

</style>
</head>
<body>


	
<%@ include file="./navbar.jsp"%> 

	<!-- **********************Start Main list Table ****************************-->
	<div class="container-fluid" style="padding:10px;">
		<div class="row">
			<div class="col-12">
				<h1 align="center" class="display-3" style="color:white;">
					<b>Comment</b>
				</h1>
				
	
			<div class="container-fluid" style="padding:30px 10px 10px 0px">
				<div class="row">
				
					<div class="col-6 d-flex justify-content-end">
					&nbsp;
						<div class="btn-group btn-group-lg" >						
						<button type="button" onclick="location.href='DispatcherServlet?command=todayDate';" class ="btn btn-danger" ><span class="oi oi-align-center" style="font-size:20px;"></span>
						&nbsp;Today</button>
					
						
						
						<button type="button" onclick="location.href='DispatcherServlet?command=listById'" class ="btn btn-danger" ><span class="oi oi-chat" style="font-size:20px;"></span>
						&nbsp;내가 쓴글</a>
						
						 
  						</div>
						
					</div>
				
				
				
				<!-- **************** Start Calendar ******************** -->
				  <div class="col-6 d-flex justify-content-start">
				
					 <div class="btn-group btn-group-lg" style="min-height: 48px;">
						<form name="search_form"class="form-inline" action="DispatcherServlet" method="post">
							<input type="date" id="datepicker" value="연도 / 월 / 일"
								name="date" onclick="this.value=null" class="btn btn-danger"
								style="font-size: 20px; min-height: 48px;">


							<button type="button" class="btn btn-danger"
								onclick="search_submit()" value="Search" id="sendBtn" style="min-height: 48px;" >
								<span class="oi oi-calendar" style="font-size: 20px;"></span>&nbsp;Search
							</button>

							<input type="hidden" name="command" value="list">

						</form>
					</div>
				  </div>
			</div>
			<!-- **************** End Calendar ********************  -->
		
		</div>
				
 			
			<div class="container-fluid"></div>
				<table class="table table-hover table-bordered">
					<thead>
						<tr class="text-center" style="font-size:30px; color:white;">
							<th width="12%" class="text-center">번호</th>
							<th width="40%" class="text-center">내용</th>
							<th width="10%" class="text-center">I D</th>
							<th width="16%" class="text-center">날짜</th>
							<th width="17%" class="text-center">설정</th>

						</tr>
					</thead>
					
				<c:forEach var="bvo" items="${requestScope.list}" varStatus="i">
						<tr class=" text-center" style="font-size:25px;">

							
							<td style="color:white; vertical-align:middle;">${i.count}</td>
							<td style="font-size:30px; word-break:break-all" align="left">${bvo.content}</td>
							<td style="vertical-align:middle;">${bvo.userId}</td>
							<td style="vertical-align:middle;">${bvo.timePosted}</td>
							
							<!-- *************************** Edit ******************************  -->

					<c:choose>
						<c:when test="${mvo.userId==bvo.userId}">
						
						
							<td colspan="2" style="vertical-align:middle;">
								<div >
								<p><a href="#" name="edit" class="btn btn-danger"

									data-toggle="modal" data-target="#${bvo.no}"><span class="oi oi-pencil" style="color:white; font-size:30px;"></span></a>
								</p>	
								
								<!-- *************************** Start Modal ******************************  -->
								
						
							<div class="modal fade" id="${bvo.no}" tabindex="-1" role="dialog" >
								<div class="modal-dialog" role="document">
									<div class="modal-content" style="background-color:#F08080;">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel"><img src="./image/footstep.svg" style="width:40px;"></h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										  <div class="modal-body" style="color:white">내용을 수정해주세요
											<input type="text" value="${bvo.content}" id="${bvo.no}content"
											name="content" maxlength="60" size="60" id="updateContent" style="font-size:25px;width:450px;">
										  </div>
									
										<div class="modal-footer">
											
												<button class="btn" id="${bvo.no}clickBtn" style="background-color:#FFA07A; color:white;">Edit</button>
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
										</div>		
											 <script type="text/javascript">
											

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
								
							
								<!-- *************************** Delete ******************************  -->
															
					
							
						
							<p><a href="#" name="delete" class="btn btn-danger"
									data-toggle="modal" data-target="#${bvo.no}del"><span class="oi oi-trash" style="color:white; font-size:30px;"></span></a>
								
							</p>
							
								<!-- *************************** Start Modal ******************************  -->
								
								
						
							<div class="modal fade" id="${bvo.no}del" tabindex="-1"
								role="dialog" >
								<div class="modal-dialog" role="document">
									<div class="modal-content" style="background-color:#F08080;">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel"><img src="./image/footstep.svg" style="width: 40px;"></h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body" style="color:white">정말로 삭제하시겠습니까?</div>
										<div class="modal-footer">
											<button type="button" class="btn" style="background-color:#FFA07A; color:white;"

												onclick="sumbit_Delete('${bvo.no}','${bvo.timePosted}')">OK</button>

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
						 </div>
						</td>	
						</c:when>
						<c:otherwise>
						<td colspan="2">
						
						</td>
							
						</c:otherwise>
					</c:choose>	


						</tr>
												
				</c:forEach>
				</table>
				<p>
			</div>
		  </div>	
		</div>
		
		<!-- *************************** Start Write Form ******************************  -->
			<div class="container-fluid" style="padding-top: 30px" align="center">
				<div class="row">
					<div class="col-12">
						<form action="DispatcherServlet" method="post" name="write_form">
							<input type="hidden" name="command" value="write"> <input
								type="hidden" name="userId" value="${mvo.userId}"> 
								<span class="oi oi-double-quote-serif-left" style="color:white"></span> 
								&nbsp;<input
								type="text" name="content" maxlength="100" size="100" style="font-size:30px;width:600px; height:50px;"> 
							<span class="oi oi-double-quote-serif-right" style="color:white"></span>
						</form>
						
					</div><br><br><br>
					
					
						  <div class="container" align="center">
							<div class="row">
							
							<a href="#" class="btn  mx-auto btn-block"
								onclick="content_submit()" style="font-size:35px; background-color:#FA8072; color:white;">글쓰기&nbsp;<span class="oi oi-check"></span></a>
								
						    </div>
						    <br>
						  <div class="row">
							 <a href="#" class="btn mx-auto" onclick="cancel()" style="font-size:30px; background-color:#F08080; color:white;">다시쓰기</a>
							</div>
						 </div>
							
					
					
				
				</div>
			
			

			<!-- *************************** End Write Form ******************************  -->
		
		
		
		
		
	
	<!-- **********************End Main list Table ****************************-->

	

	

</body>
</html>
















