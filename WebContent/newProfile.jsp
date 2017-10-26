<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/newProfile.css">
<link rel="stylesheet" href="css/circle.css">

<title>Insert title here</title>
</head>
<body>
	<%@ include file="./navbar.jsp"%>
	<div class="container">
		<div class="row my-5">
		<img alt="profile image" src="./upload/${mvo.profile}" id="profileImg" class="rounded mx-auto d-block">
		</div>
		<div class="row">
			<div class="col-12">
				<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate var="currYear" value="${now}" pattern="yyyy" />
				 <c:set var = "birthYear" value = "${fn:substring(mvo.birth, 0, 4)}" />
				<p class="display-1 text-center">${mvo.userName},${currYear - birthYear + 1}</p>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<p class="display-4 text-center">Kosta</p>
			</div>
		</div>
		<div class="row"> 
			<div class="col-6 left-btn">
				<a href="#">
					<img alt="" src="./image/settings.png" class="main-buttons rounded mx-auto d-block ">
				</a>
			</div>
			<div class="col-6">
				<a href="update.jsp?userId=${mvo.userId}">			
					<img alt="" src="./image/Editing-edit-icon.png" class="main-buttons rounded mx-auto d-block">
				</a>			
			</div>
			
		</div>
		<br>
	
		<div class="row mt-5">
			<div class="col-12">
				<p class="display-4 text-center">이번주</p>
			</div>
			<div class="col-12 d-flex justify-content-center">
				<div class="c100 p50 big m-auto">					
					<span>50%</span>
					<div class="slice">
						<div class="bar"></div>
						<div class="fill"></div>
					</div>
				</div>
			</div>
			

		</div>
		
		<div class="row mt-5">
			<div class="col-12">
				<fmt:formatDate var="currMonth" value="${now}" pattern="M" />
				<p class="display-4 text-center">${currMonth}월</p>
			</div>
			<div class="col-12 d-flex justify-content-center">
				<div class="c100 p50 big m-auto">
					<span>50%</span>
					<div class="slice">
						<div class="bar"></div>
						<div class="fill"></div>
					</div>
				</div>
			</div>
			

		</div>

	</div>

</body>
</html>