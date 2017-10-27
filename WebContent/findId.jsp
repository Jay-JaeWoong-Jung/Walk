<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>아이디 찾기</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/main.css">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/sunny/jquery-ui.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script>
</head>

<script>
							function findId(){
								alert("findId");
	
								
								var userName = $('#InputName').val();
								var InputEmailId=$('#InputEmailId').val();
								var InputSelectedEmail=$('#InputSelectedEmail').val();
								
								 var param = "command=findId&userName="+userName+
								 			"&InputEmailId="+InputEmailId+"&InputSelectedEmail="+InputSelectedEmail;

								$.ajax({
									type: "post",
									url: "DispatcherServlet",
									data: param,
									success: function(result){
										 
												
										if(result.trim().charAt(1) != ""){
											
											document.getElementById("IdRemember").checked = true;
										}
										$("#loginId").val(result);
									}
								}); 
								
								$('#findIdForm').submit();
							}
				</script>

								</div>
							</div>
							
							
							

							


							<script>
								function changeFunc() {

									var selectBox = document
											.getElementById("InputSelectedEmail");
									var selectedValue = selectBox.options[selectBox.selectedIndex].value;

									if (selectedValue == "직접선택") {
										$("#emailChange")
												.html(
														"<input type='text' name='emailAdd' id='InputSelectedEmail' value='' />")

									}
								}
							</script>
<body>




	<div class="container">
		<div class="row">
			<div class="col-sm-10">
				<h2 class="title">아이디 찾기</h2>
				<h4>이메일로 인증</h4>
				<button type="button" class="close" page-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<hr>
			<div class="col-sm-10">


				<form action="DispatcherServlet?command=findId" method="post"
					name="findIdForm" id="findIdForm">
					<div class="body">
						<div class="col-sm-5">
							<div class="form-group">
								<label for="name">이름</label> <input type="text" name="userName"
									id="InputName" placeholder="이름">
							</div>
							<div class="form-group">
								<div class="col-sm-3">
									<label for="exampleInputEmail1">이메일</label>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-10">
									<input type="text" name="emailId" id="InputEmailId"
										aria-describedby="emailHelp"> <span id="emailChange">
										<select class="selectpicker" name="emailAdd"
										id="InputSelectedEmail" placeholder="이메일"
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
								</div>
								<div>
									<input type="hidden" name="command" value="findId">
									<button type="submit" class="btn btn-primary" id="findId" onclick="findId()">아이디
										찾기</button>
									<button type="button" class="btn btn-secondary">취소</button>
							
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>
