<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/reserve.css">

<title>Insert title here</title>
</head>
<script>
function reserve(num){
	/* $('button[name=timeOption]').click(function(){
		
		var value =$(this).val();
		
		var selectedTime= $('#selectedTime').val(value);
		
		$('#selectTimeFrm').submit();
	}) */
	var selectedTime= $('#selectedTime').val(num);
	
	$('#selectTimeFrm').submit();
}




</script>

<c:if test="${param.reserve =='true'}">
	<script>
		alert("이미 예약하셨습니다.");
		location.href="DispatcherServlet?userId=${mvo.userId}&selectedTime=${param.selectedTime}&command=dashboard";
	</script>

</c:if>

<body>



	 <c:import url="./navbar.jsp"></c:import>




	<div class="btn-group-vertical container-fluid">
	<button type="button" class="btn btn-secondary my-3" name = "timeOption" value="1" onclick="reserve('1')"><h1>11:00</h1></button>
	<button type="button" class="btn btn-secondary my-3" name = "timeOption" value="2" onclick="reserve('2')"><h1>11:30</h1></button>
	<button type="button" class="btn btn-secondary my-3" name = "timeOption" value="3" onclick="reserve('3')"><h1>12:00</h1></button>
	<button type="button" class="btn btn-secondary my-3" name = "timeOption" value="4" onclick="reserve('4')"><h1>12:30</h1></button>
	<button type="button" class="btn btn-secondary my-3" name = "timeOption" value="5" onclick="reserve('5')"><h1>13:00</h1></button>
	<button type="button" class="btn btn-secondary my-3" name = "timeOption" value="6" onclick="reserve('6')"><h1>13:30</h1></button>
	  		

		<form action="DispatcherServlet" name="selectTimeFrm" id="selectTimeFrm" method="post"> 
			
	  		<input type="hidden" name="command" value="reserve">
	  		 <input type="hidden" name="userId" value="${mvo.userId}"> 
	  		<input type="hidden" name="selectedTime"  id="selectedTime" value="">
	  		<c:if test="${param.change =='true'}">
	  		 <input type="hidden" name="change" value="${param.change}"> 
	  		</c:if>
	  		
  		</form>
	</div>
	
	
	
	 
</body>
</html>