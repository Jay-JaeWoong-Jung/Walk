<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
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

<title>Insert title here</title>
</head>
<script type="text/javascript">
	function toDashBoard() {
		location.href = "DispatcherServlet?userId=${mvo.userId}&selectedTime=${mvo.selectedTime}&command=dashboard";
	}
</script>


<body>

<c:choose>
	<c:when test="${mvo.userId == null}">
		<script>
			alert("로그인 후 이용가능합니다. 메인 페이지로 이동합니다.")
			location.href="main.jsp";
		</script>
	</c:when>
	<c:otherwise>

	<c:import url="./navbar.jsp"></c:import>
	<div class="jumbotron  jumbotron-fluid">
		<div class="container">
			<div class="row">
				<div class="col">
					<c:choose>
						<c:when test="${param.change =='true'}">
							<h2 class="display-4">예약 변경 성공!</h2>
						</c:when>
						<c:otherwise>
							<h2 class="display-4">예약 성공!</h2>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<br>
			<div class="row">
				<p class="lead col">시작 15분 전에 그룹 배정이 됩니다. 그룹정보는 시작 15분 전 부터
					대시보드에서 확인 가능합니다.</p>
				<hr class="my-4">
			</div>
			<div class="row">
				<div class="lead col">

					<c:choose>
						<c:when test="${param.change =='true'}">
							<input type="button" class="btn btn-primary btn-lg" value="대시보드로 이동"
								style="width: 300px;" onclick="toDashBoard()">
						</c:when>
						<c:otherwise>
							<form action="DispatcherServlet" method="post">
								<input type="submit" class="btn btn-primary btn-lg" value="dashboard가기"> 
								<input type="hidden" name="command" value="dashboard">
								<input type="hidden" name="userId" value="${mvo.userId}">
								<input type="hidden" name="selectedTime" value="${mvo.selectedTime}">
							</form>
						</c:otherwise>
					</c:choose>





				</div>
			</div>

		</div>
	</div>
	

	
	
		
		
	</c:otherwise>
	
</c:choose>

</body>
</html>