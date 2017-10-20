<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/reserve.css">
<title>Insert title here</title>
</head>
<script>
function reserve(){
	$('button[name=timeOption]').click(function(){
		
		var value =$(this).val();
		
		var selectedTime= $('#selectedTime').val(value);
		
		$('#selectTimeFrm').submit();
	})
	
}




</script>

<c:if test="${param.reserve =='true' }">
	<script>
		alert("이미 예약하셨습니다.");
	</script>

</c:if>

<body>
	 <nav class="navbar navbar-expand-lg navbar-light bg-light">
	  
	  <a class="navbar-brand" href="#">Logo</a>
	  
	   <p id="tDate" class="lead displayInline mb-0 text-center text-right ">
	   <fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
	   </p>
	 <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>	
	  
	  
	
	  <div class="collapse navbar-collapse mr-auto" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="#">About</a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Reserve
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	          <a class="dropdown-item" href="#" onclick="reserveChange()">예약 변경</a>
<!-- 	          DispatcherServlet?userId=myId1&selectedTime=selectedTime&command=reserveChange -->
	          <div class="dropdown-divider"></div>
	          
	          <a class="dropdown-item" href="DispatcherServlet?userId=myId1&selectedTime=1&command=reserveCancel">예약 취소</a>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Profile</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="DispatcherServlet?userId=myId1&selectedTime=1&command=dashboard">Dashboard</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Blog</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Sign out</a>
	      </li>
	    </ul>
	   
	  </div>
	 
	  
	  
	</nav>

	<div class="btn-group-vertical container-fluid">
	<button type="button" class="btn btn-secondary my-3" name = "timeOption" value="1" onclick="reserve()"><h1>11:00</h1></button>
	<button type="button" class="btn btn-secondary my-3" name = "timeOption" value="2" onclick="reserve()"><h1>11:30</h1></button>
	<button type="button" class="btn btn-secondary my-3" name = "timeOption" value="3" onclick="reserve()"><h1>12:00</h1></button>
	<button type="button" class="btn btn-secondary my-3" name = "timeOption" value="4" onclick="reserve()"><h1>12:30</h1></button>
	<button type="button" class="btn btn-secondary my-3" name = "timeOption" value="5" onclick="reserve()"><h1>13:00</h1></button>
	<button type="button" class="btn btn-secondary my-3" name = "timeOption" value="6" onclick="reserve()"><h1>13:30</h1></button>
	  		

		<form action="DispatcherServlet" name="selectTimeFrm" id="selectTimeFrm"> 
			
	  		<input type="hidden" name="command" value="reserve">
	  		 <input type="hidden" name="userId" value="myId1"> 
	  		<input type="hidden" name="selectedTime"  id="selectedTime" value="">
	  		<c:if test="${param.change =='true'}">
	  		 <input type="hidden" name="change" value="true"> 
	  		</c:if>
	  		
  		</form>
	</div>
</body>
</html>