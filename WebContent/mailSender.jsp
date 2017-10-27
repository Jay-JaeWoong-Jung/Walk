<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<link rel="stylesheet" href="./css/mailSender.css?ver=1">
<title>Insert title here</title>
</head>

<script>
	function changeFunc() {

		var selectBox = document.getElementById("InputSelectedEmail");
		var selectedValue = selectBox.options[selectBox.selectedIndex].value;

		if (selectedValue == "직접선택") {
			$("#emailChange")
					.html(
							"<input type='text' name='emailAdd' id='InputSelectedEmail' value='' />")

		}
	}
</script>

<body>
	<%@ include file="./navbar.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12 text-center">
				<h2>본인확인 이메일로 인증</h2>
				<hr>
				<p>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 임시 비밀번호를 받을 수 있습니다.</p>
				<form action="DispatcherServlet?command=sendPass" method="post"
					name="mailSenderForm" id="mailSenderForm">

					<label>이름:</label><input type="text" name="userName"
						value="${userName}"> <label>이메일:</label> <input type="text"
						name="emailId" id="InputEmailId" aria-describedby="emailHelp"
						value="${emailId }"> <span id="emailChange"> <select
						class="selectpicker" name="emailAdd" id="InputSelectedEmail"
						placeholder="이메일" onchange="changeFunc();">

							<option value="@naver.com">@naver.com</option>
							<option value="@nate.com">@nate.com</option>
							<option value="@dreamwiz.com">@dreamwiz.com</option>
							<option value="@yahoo.co.kr">@yahoo.co.kr</option>
							<option value="@empal.com">@empal.com</option>
							<option value="@unitel.co.kr">@unitel.co.kr</option>
							<option value="@gmail.com">@gmail.com</option>
							<option value="@korea.com">@korea.com</option>
							<option value="@chol.com">@chol.com</option>
							<option value="@paran.com">@paran.com</option>
							<option value="@freechal.com">@freechal.com</option>
							<option value="@hanmail.net">@hanmail.net</option>
							<option value="@hotmail.com">@hotmail.com</option>
							<option value="직접선택">직접선택</option>

					</select>
					</span> <input type="hidden" name="command" value="sendPass">
					<button type="submit" class="btn btn-primary" value="sendEmail">임시
						비밀번호 받기</button>

				</form>

			</div>
		</div>

	</div>



	<%-- <form action="DispatcherServlet?command=authPass" method="post"
		name="authPassForm" id="authPassForm">
		<div>
			<input type="text" name="authNum" placeholder="인증번호  5자리 숫자 입력">
			<p>
				<a href="mailSender.jsp">인증번호가 오지 않나요?</a> <br> 
<<<<<<< HEAD
				<input type="hidden" name="command" value="authPass">
				<input type="hidden" name="userName" value="${userName }">
=======
				${userId }
				<input
					type="hidden" name="command" value="authPass">
>>>>>>> f67228ccb2c028cab388f59d6d90a793dec7a48c
				<button type="submit" class="btn btn-primary" value="nextButton">다음</button>
		</div> 
	</form> --%>
</body>
</html>