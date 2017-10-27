<%@page import="constants.CalendarMaker"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.*" %>
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
<link rel="stylesheet" href="./css/reserve.css">

<title>Insert title here</title>
</head>



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



 <jsp:useBean id="now" class="java.util.Date" ></jsp:useBean>
 <fmt:formatDate var="curTime" value="${now}" pattern="HHmm" />
 
 
 
<%

	String date1 =CalendarMaker.getInstance().setCalendar(11, 15);
	String date2 =CalendarMaker.getInstance().setCalendar(11, 45);
	String date3 =CalendarMaker.getInstance().setCalendar(12, 15);
	String date4 =CalendarMaker.getInstance().setCalendar(12, 45);
	String date5 =CalendarMaker.getInstance().setCalendar(01, 15);
	String date6 =CalendarMaker.getInstance().setCalendar(01, 45);

	
	

%>
<c:set var="date1" value="<%= date1 %>"></c:set>
<c:set var="date2" value="<%= date2 %>"></c:set>
<c:set var="date3" value="<%= date3 %>"></c:set>
<c:set var="date4" value="<%= date4 %>"></c:set>
<c:set var="date5" value="<%= date5 %>"></c:set>
<c:set var="date6" value="<%= date6 %>"></c:set>





	<div class="btn-group-vertical container-fluid">
	
 

<c:choose>
	<c:when test="${curTime > date1}"><button type="button" class="btn btn-secondary my-3 disabled" name = "timeOption" value="1" "><h1>마감되었습니다.</h1></button></c:when>
	<c:otherwise><button type="button" class="btn btn-secondary my-3" name = "timeOption" value="1" onclick="reserve('1')"><h1>11:00</h1></button></c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${curTime > date2}"><button type="button" class="btn btn-secondary my-3 disabled" name = "timeOption" value="2" "><h1>마감되었습니다</h1></button></c:when>
	<c:otherwise><button type="button" class="btn btn-secondary my-3" name = "timeOption" value="2" onclick="reserve('2')"><h1>11:30</h1></button></c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${curTime > date3}"><button type="button" class="btn btn-secondary my-3 disabled" name = "timeOption" value="3" "><h1>마감되었습니다</h1></button></c:when>
	<c:otherwise><button type="button" class="btn btn-secondary my-3" name = "timeOption" value="3" onclick="reserve('3')"><h1>12:00</h1></button></c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${curTime > date4}"><button type="button" class="btn btn-secondary my-3 disabled" name = "timeOption" value="4" "><h1>마감되었습니다</h1></button></c:when>
	<c:otherwise><button type="button" class="btn btn-secondary my-3" name = "timeOption" value="4" onclick="reserve('4')"><h1>12:30</h1></button></c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${curTime > date5}"><button type="button" class="btn btn-secondary my-3 disabled" name = "timeOption" value="5""><h1>마감되었습니다</h1></button></c:when>
	<c:otherwise><button type="button" class="btn btn-secondary my-3" name = "timeOption" value="5" onclick="reserve('5')"><h1>13:00</h1></button></c:otherwise>
</c:choose>


<c:choose>
	<c:when test="${curTime > date6}"><button type="button" class="btn btn-secondary my-3 disabled" name = "timeOption" value="6" "><h1>마감되었습니다</h1></button></c:when>
	<c:otherwise><button type="button" class="btn btn-secondary my-3" name = "timeOption" value="6" onclick="reserve('6')"><h1>13:30</h1></button></c:otherwise>
</c:choose>

	
	
	
	
	
	
	  	
	  		

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