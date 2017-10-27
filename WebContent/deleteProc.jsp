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
<style>
body {

	font-family: bmjua;
	
	
}

@font-face {
	font-family: bmjua;
	src: url(./css/font/BMJUA_ttf.ttf);
}
</style>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function toMain() {
		location.href = "newMain.jsp";
	}
</script>

<meta http-equiv="Refresh" content="3;url=newMain.jsp">

<body>

	<c:import url="./navbar.jsp"></c:import>
   
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<div class="row">
				<div class="col">
							<h2 class="display-4">회원탈퇴가 되었습니다.</h2>
						
				</div>
			</div>
			<br>
			<div class="row">
				<p class="lead col">다시 만나길 기원해요 :-) </p>
				<hr class="my-4">
			</div>
			<div class="row">
				<div class="lead col">
							<input type="button" class="btn btn-primary btn-lg" value="3초 후 메인으로 이동합니다."
								style="width: 300px;" onclick="toMain()">
						
						


				</div>
			</div>

		</div>
	</div>	
	

</body>
</html>