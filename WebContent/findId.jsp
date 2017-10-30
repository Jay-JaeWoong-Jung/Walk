<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>아이디 찾기</title>
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
</head>

<script>
	function findId() {
		alert("findId");

		var userName = $('#InputName').val();
		var InputEmailId = $('#InputEmailId').val();
		var InputSelectedEmail = $('#InputSelectedEmail').val();

		var param = "command=findId&userName=" + userName + "&InputEmailId="
				+ InputEmailId + "&InputSelectedEmail=" + InputSelectedEmail;

		$.ajax({
			type : "post",
			url : "DispatcherServlet",
			data : param,
			success : function(result) {

				if (result.trim().charAt(1) != "") {

					document.getElementById("IdRemember").checked = true;
				}
				$("#loginId").val(result);
			}
		});

		$('#findIdForm').submit();
	}
</script>






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
			<div class="col-sm-10 text-center">
				<h2 class="title">아이디 찾기</h2>
				<hr>
				<p>* 이메일로 인증</p>
				<form action="DispatcherServlet?command=findId" method="post"
					name="findIdForm" id="findIdForm">

					<label for="name"> &nbsp;&nbsp;&nbsp;이름:</label> 
					<input type="text"
						 name="userName" id="InputName" placeholder="이름"> <br>
					
					<label for="exampleInputEmail1">이메일:</label> <input type="text"  
						name="emailId" id="InputEmailId" placeholder="이메일">
					<span id="emailChange"> <select class="selectpicker"
						name="emailAdd" id="InputSelectedEmail"  class="form-control" 
						onchange="changeFunc();">

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
							<option value="직접선택"> 직접선택</option>

					</select>
					</span>

					<p></p>

					<div class="form-group">
						<input type="hidden" name="command" value="findId">
						<button type="submit" class="btn btn-primary" id="findId"
							onclick="findId()">아이디 찾기</button>
						<button type="button" class="btn btn-secondary">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>
