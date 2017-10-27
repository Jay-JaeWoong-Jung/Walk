<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/dashboard.css">


<title>Dashboard</title>






<c:if test="${cancelReserve =='1' }">
	<script>
		alert("예약 취소에 성공하셨습니다.");
	</script>
</c:if>
<c:if test="${cancelReserve =='0' }">
	<script>
		alert("예약 취소가 안되었습니다. 관리자에게 문의바랍니다.");
	</script>
</c:if>





</head>


	


<body>

	
	<c:import url="./navbar.jsp"></c:import>
	<div class="jumbotron">
	  <p class="display-4 text-right"><span class="smallFont text-muted">Meet by</span> 
	  <c:if test="${vo.selectedTime =='2' }"> 11:30 AM</p> </c:if>
	  <c:if test="${vo.selectedTime =='3' }"> 12:00 AM</p> </c:if>
	  <c:if test="${vo.selectedTime =='4' }"> 12:30 AM</p> </c:if>
	  <c:if test="${vo.selectedTime =='5' }"> 13:00 AM</p> </c:if>
	  <c:if test="${vo.selectedTime =='6' }"> 13:30 AM</p> </c:if>
	  <c:if test="${vo.selectedTime =='1' }"> 11:00 AM</p> </c:if>
	  
	  <p class="display-4 text-right"><span class="smallFont text-muted	">Start at</span> 
	  <c:if test="${vo.selectedTime =='2'}"> 11:35 AM</p> </c:if>
	  <c:if test="${vo.selectedTime =='3' }"> 12:05 AM</p> </c:if>
	  <c:if test="${vo.selectedTime =='4' }"> 12:35 AM</p> </c:if>
	  <c:if test="${vo.selectedTime =='5' }"> 13:05 AM</p> </c:if>
	  <c:if test="${vo.selectedTime =='6' }"> 13:35 AM</p> </c:if>
	  <c:if test="${vo.selectedTime =='1' }"> 11:00 AM</p> </c:if>
	  
	  
	  
	  <hr class="my-4">
	  <p class="lead text-right"><span class="text-muted">팀원(${count}):&emsp;</span>
	  <c:forEach var="row" items="${rvo}">
	 ${row.userName} &nbsp;
	 
	 </c:forEach> 
	  
	  </p>
	  <hr class="my-4">
	  
	  <div class="container">
	  	  	<h1 class=" mb-3 text-center">활동 기록하기</h1>
	  	  	<h1 class="display-1 mb-5 col text-center">
	  
	  	  	
	  	  	<span id="minute" >00</span> <span  >:</span>
	  	  	<span id="seconds">00</span> <span >:</span>
	  	  	<span id="milsecs">00</span>
	  	  	</h1>
	  	  	
		  <div class="row justify-content-around">


			<button  type="button" class="btn btn-primary btn-lg col-4" id="stBtn"  role="button"  style="position:absolute;left:10%;">START</a>
			<button type="button" class="btn btn-primary btn-lg col-4 " id="stopBtn" role="button"   style="position:absolute;left:60%;">FINISH</a>
		  </div>
		  <br>
		  <br>
		  <br><br>
		  
		
		  
		
		
		<%-- 스탑워치:${stopWatch} --%>
		  
		<SCRIPT > 
		
		$('#stBtn').one('click',function () {
			//alert("stnBtn");
			var param ="userId=${mvo.userId}&command=startTime";
			$.ajax({
				type : "post",
				url : "DispatcherServlet",
				data : param,
				success : function(result) {
					$("#stnBtn").html(result);

					}
					
				});
			});
		
		
		
		$('#stopBtn').click(function () {
			//alert("stopBtn");
			var param ="userId=${mvo.userId}&command=finishTime";
			$.ajax({
				type : "post",
				url : "DispatcherServlet",
				data : param,
				success : function(result) {
					$("#stnBtn").html(result);

					}
					
				});
			});
			

		
	<%-- 	  <% 
		 
		System.out.println("첫 쓰레드이름:"+Thread.currentThread().getName());
		String threadName= Thread.currentThread().getName();
		if(!Thread.currentThread().getName().equals("stopWatch")){
			
		Thread th = new Thread(new Runnable(){
			 
			 public  void run(){
				Thread.currentThread().setName("stopWatch");
				for(int i=0;i<1000000;i++){
					
					System.out.println("쓰레드이름:"+Thread.currentThread().getName()+i);
					try{
						Thread.sleep(1000);
						
						
					}catch(Exception e){
						e.printStackTrace();
					}
					
				}
					
				
			}
		});
		
		th.start();
		}
		  	%>   --%>
		  		
	
						var currentsec = 0;
						var currentmin = 0;
						var currentmil = 0;
						var keepgoin = false;
						var clear = "";

						$('#stopBtn').click(function() {
							clearInterval(clear);
							keepgoin = false;
						})

						$('#stBtn').click(function() {
							/* alert("최초 keepgoin:" + keepgoin); */

							if (keepgoin == true) {

								
								
								return;

							} else {
								keepgoin = true;

								clear = setInterval(timer, 100);

								function timer() {

									if (keepgoin) {

										currentmil += 1;
										if (currentmil == 10) {
											currentmil = 0;
											currentsec += 1;
										}
										if (currentsec == 60) {
											currentsec = 0;
											currentmin += 1;
										}

										Strmil = "" + currentmil;
										Strsec = "" + currentsec;
										Strmin = "" + currentmin;

										if (Strmil.length != 2) {
											Strmil = "0" + currentmil;
										}
										if (Strsec.length != 2) {
											Strsec = "0" + currentsec;
										}
										if (Strmin.length != 2) {
											Strmin = "0" + currentmin;
										}

										$('#minute').text(Strmin);
										$('#seconds').text(Strsec);
										$('#milsecs').text(Strmil);

									}

								}

							}

						});
					</SCRIPT> 
					
					
<c:if test="${vo.selectedTime != ''}">


	<div class="jumbotron groupColorCard bg-primary text-white">
	   		
	    
	  	<p class="lead text-center">오늘 산책할 루트</p> 

		<img class="img-thumbnail img-fluid  rounded mx-auto d-block"  src="./image/route.jpg" class="img-fluid" alt="Responsive image" >
		<!-- <img class="card-image rounded mx-auto d-block" src="./image/route.jpg" > -->

		
	</div>
	

	
	
	  </div>
	  
	
	  
	</div>
	
	
	
	
	 <c:if test="${vo.groupColor == '1'}"><div class="jumbotron groupColorCard bg-success text-white"> <p class="display-4 text-center">그룹색상</p><p class="lead text-center">집결장소에서 다른 멤버들에게 색상을 보여주세요</p> </c:if>
	<c:if test="${vo.groupColor == '2'}"><div class="jumbotron groupColorCard bg-info text-white"> <p class="display-4 text-center">그룹색상</p><p class="lead text-center">집결장소에서 다른 멤버들에게 색상을 보여주세요</p> </c:if>
	<c:if test="${vo.groupColor == '3'}"><div class="jumbotron groupColorCard bg-warning text-white"> <p class="display-4 text-center">그룹색상</p><p class="lead text-center">집결장소에서 다른 멤버들에게 색상을 보여주세요</p> </c:if>
	<c:if test="${vo.groupColor == '4'}"><div class="jumbotron groupColorCard bg-danger text-white">  <p class="display-4 text-center">그룹색상</p><p class="lead text-center">집결장소에서 다른 멤버들에게 색상을 보여주세요</p></c:if>
	<c:if test="${vo.groupColor == '5'}"><div class="jumbotron groupColorCard bg-primary text-white"> <p class="display-4 text-center">그룹색상</p><p class="lead text-center">집결장소에서 다른 멤버들에게 색상을 보여주세요</p> </c:if>
	<c:if test="${vo.groupColor == '6'}"><div class="jumbotron groupColorCard  text-white" style="background-color:blue;"><p class="display-4 text-center">그룹색상</p><p class="lead text-center">집결장소에서 다른 멤버들에게 색상을 보여주세요</p>  </c:if>
	<c:if test="${vo.groupColor == '7'}"><div class="jumbotron groupColorCard  text-white" style="background-color:yello;"> <p class="display-4 text-center">그룹색상</p><p class="lead text-center">집결장소에서 다른 멤버들에게 색상을 보여주세요</p> </c:if>
	<c:if test="${vo.groupColor == '8'}"><div class="jumbotron groupColorCard  text-white" style="background-color:pink;"> <p class="display-4 text-center">그룹색상</p><p class="lead text-center">집결장소에서 다른 멤버들에게 색상을 보여주세요</p> </c:if>
	<c:if test="${vo.groupColor == '9'}"><div class="jumbotron groupColorCard  text-white" style="background-color:grey;"> <p class="display-4 text-center">그룹색상</p><p class="lead text-center">집결장소에서 다른 멤버들에게 색상을 보여주세요</p> </c:if>
	<c:if test="${vo.groupColor == '10'}"><div class="jumbotron groupColorCard  text-white"style="background-color:khaki;"> <p class="display-4 text-center">그룹색상</p><p class="lead text-center">집결장소에서 다른 멤버들에게 색상을 보여주세요</p> </c:if>
	  
	   

</c:if>		
		
	
	
	 
  	
</body>
</html>