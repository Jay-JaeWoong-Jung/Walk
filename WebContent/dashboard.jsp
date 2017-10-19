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
<link rel="stylesheet" href="./css/dashboard.css">
<title>Dashboard</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  
	  <a class="navbar-brand" href="#">Logo</a>
	  
	   <p id="tDate" class="lead displayInline mb-0 text-center text-right ">10월 19일 오늘 산책</p>
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
	          <a class="dropdown-item" href="#">예약 변경</a>
	          <div class="dropdown-divider"></div>
	          
	          <a class="dropdown-item" href="#">예약 취소</a>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Profile</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Dashboard</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Blog</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Sign out</a>
	      </li>
	    </ul>
	    <!-- <form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	    </form> -->
	  </div>
	 
	  
	  
	</nav>
	<div class="jumbotron">
	  <p class="display-4 text-right"><span class="smallFont text-muted">Meet by</span> 11:30 AM</p>
	  <p class="display-4 text-right"><span class="smallFont text-muted	">Start at</span> 11:35 AM</p>
	  
	  <hr class="my-4">
	  <p class="lead text-right"><span class="text-muted">팀원(4):&emsp;</span>오호진, 서영의, 김보경, 박인수 </p>
	  <hr class="my-4">
	  
	  <div class="container">
	  	  	<h1 class=" mb-3 text-center">활동 기록하기</h1>
	  	  	<h1 class="display-1 mb-5 col text-center">00:00:00</h1>
		  <div class="row justify-content-around">
		    <a class="btn btn-primary btn-lg col-5" href="#" role="button">START</a>
		    <a class="btn btn-primary btn-lg col-5 " href="#" role="button">FINISH</a>
		  </div><br>
		  
		  
	  </div>
	</div>
	<div class="jumbotron groupColorCard bg-danger text-white">
	    <p class="display-4 text-center">그룹색상</p>
	    <p class="lead text-center">집결장소에서 다른 멤버들에게 색상을 보여주세요</p>
	    <a href="#">
		<img class="card-image rounded mx-auto d-block" src="./pic/zoom_in.png" alt="Card image">
		</a>
  	</div>
	
  	
</body>
</html>