<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로필 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function infoUpdate() {
		/* 	location.href="DispatcherServlet?command=infoUpdate&&userId=${mvo.userId}"; */
		location.href = "update.jsp?userId=${mvo.userId}";

	}
	function setupdate() {
		location.href = "setting.jsp?userId=${mvo.userId}";

	}
</script>



<body>
	<c:choose>
		<c:when test="${mvo.userId != null}">
			<div class="container" align="center">
				<div class="row" align="center">
					<div class="col-sm-4">
						<h1>profile</h1>
						<div class="thumbnail">
							<c:choose>
								<c:when test="${mvo.profile != null}">
									<img src="./upload/${mvo.profile}" class="img-circle"
										alt="Cinque Terre" width="300" height="300" >
								</c:when>
								<c:otherwise>
									<img src="./image/default.png" class="img-circle"
										alt="Cinque Terre" width="300" height="272">
								</c:otherwise>
							</c:choose>
							<br> <br /> <b>${mvo.userId}님의 정보입니다.${mvo.profile} </b><br> <br />
						</div>
						<div class="col-sm-6">
							<span><img src="./image/setting.png" class="img-circle"
								alt="Cinque Terre" width="100" style="cursor: pointer;"
								onclick="setupdate()"></span>
						</div>
						<div class="col-sm-6">
							<span><img src="./image/Info.png" class="img-circle"
								alt="Cinque Terre" width="100" style="cursor: pointer;"
								onclick="infoUpdate()"> </span>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#1week">1
								Week</a></li>
						<li><a data-toggle="tab" href="#1month">1 Month</a></li>
					</ul>

					<div class="tab-content">
						<div id="1week" class="tab-pane fade in active">
							<h3>1 Week</h3>
							<img alt="./image/1week.png" src="./image/1week.png" width="100%">
							<p>지난 1주 동안 평균 ${weekAvg}분 걸었습니다.</p>

						</div>
						<div id="1month" class="tab-pane fade">
							<h3>1 Month</h3>
							<img alt="./image/1week.png" src="./image/1month.png"
								width="100%">
							<p>지난 1달 동안 평균 ${monthAvg}분 걸었습니다.</p>
						</div>
					</div>
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<center>
				<div class="col-md-4">
					<a href="main.jsp"> <font size="5" face="바탕체"> <b>로그인
								후 이용하실 수 있습니다.</b></font></a>
				</div>
			</center>
		</c:otherwise>
	</c:choose>
</body>
</html>