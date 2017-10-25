<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/newMain.css">
 

</head>



<title>프로필 페이지</title>
<script type="text/javascript">
	function infoUpdate() {
		/* 	location.href="DispatcherServlet?command=infoUpdate&&userId=${mvo.userId}"; */
		location.href = "update.jsp?userId=${mvo.userId}";

	}
	function setupdate() {
		location.href = "setting.jsp?userId=${mvo.userId}";

	}
</script>


<%@ include file="./navbar.jsp"%> 
<body>

	<c:choose>
		<c:when test="${mvo.userId != null}">
			<div class="container-fluid" align="center">
				<div class="row" >
					<div class="col-lg-12"><h1>profile</h1></div>
				</div>		
				<div class="row" >
						
					<div class="col-sm-12" >
						<c:choose>
							<c:when test="${mvo.profile != null}">
								<img src="./upload/${mvo.profile}" class="rounded mx-auto d-block"
									alt="Cinque Terre" width="300" height="300" align="center">
							</c:when>
							<c:otherwise>
								<img src="./image/default.png" class="rounded mx-auto d-block"
									alt="Cinque Terre" width="300" height="272">
							</c:otherwise>
						</c:choose>
						<br><br>  <b>${mvo.userId}님의 정보입니다.${mvo.profile} </b><br><br>
					</div>
				</div>		
				<div class="row" >
						<div class="col-sm-6">
							<span><img src="./image/settings.png" class="img-circle"
								alt="Cinque Terre" width="100" style="cursor: pointer;"
								onclick="setupdate()"></span>
						</div>
						<div class="col-sm-6">
							<span><img src="./image/info2.png" class="img-circle"
								alt="Cinque Terre" width="100" style="cursor: pointer;"
								onclick="infoUpdate()"> </span>
						</div>
					
				</div>
				<div class="row" >
				
					<div class="col-sm-12">
						<nav class="nav nav-tabs" id="myTab" role="tablist">
						<a class="nav-item nav-link active" id="nav-week-tab" data-toggle="tab" href="#nav-week" role="tab" aria-controls="nav-week" aria-selected="true">1week</a>
  						<a class="nav-item nav-link" id="nav-month-tab" data-toggle="tab" href="#nav-month" role="tab" aria-controls="nav-month" aria-selected="false">1 month</a>
						
						
						
						
						</nav>
	
						<div class="tab-content" id="nav-tabContent">
						
							<div class="tab-pane fade show active" id="nav-week" role="tabpanel" aria-labelledby="nav-week-tab">
									<h3>1 Week</h3>
								<img alt="./image/1week.png" src="./image/1week.png" width="100%">
								<p>지난 1주 동안 평균 ${weekAvg}분 걸었습니다.</p>
							</div>
	 						 <div class="tab-pane fade" id="nav-month" role="tabpanel" aria-labelledby="nav-month-tab">
	 						 	<h3>1 Month</h3>
								<img alt="./image/1month.png" src="./image/1month.png"
									width="100%">
								<p>지난 1달 동안 평균 ${monthAvg}분 걸었습니다.</p>
	 						 </div>
  
  						</div>
						
						
					</div>
			</div>
		</div>
			
		</c:when>

		<c:otherwise>
			<center>
			<script>
				alert("로그인 후 이용바랍니다.")
				location.href="newMain.jsp";
			</script>
				
			</center>
		</c:otherwise>
	</c:choose>
</body>
</html>