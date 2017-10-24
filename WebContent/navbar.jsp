<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="#">Logo</a>

	<p id="tDate" class="lead displayInline mb-0 text-center text-right ">
		<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
	</p>
	<button class="navbar-toggler " type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>



	<div class="collapse navbar-collapse mr-auto"
		id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="#">About</a>
			</li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="http://example.com"
				id="navbarDropdownMenuLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Reserve </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="#" onclick="reserveChange()">예약변경</a>
						<script>
						function reserveChange(){
							location.href="reserve.jsp?change=true";
						}
						</script>
					<!-- 	          DispatcherServlet?userId=myId1&selectedTime=selectedTime&command=reserveChange -->
					<div class="dropdown-divider"></div>

					<a class="dropdown-item" href="#"onclick="reserveCancel()">예약 취소</a>
					<script>
						function reserveCancel(){
							location.href="DispatcherServlet?userId=${mvo.userId}&selectedTime=${mvo.selectedTime}&command=reserveCancel";
						}
					</script>
						
					
				</div></li>
			<li class="nav-item"><a class="nav-link" href="#">Profile</a></li>
			<li class="nav-item"><a class="nav-link"
				href="DispatcherServlet?userId=myId1&selectedTime=1&command=dashboard">Dashboard</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">Blog</a></li>

			<li class="nav-item" data-toggle="collapse" data-target="#myNavbar">
			<c:choose>
				
					<c:when test="${mvo.userId != null}">
						<a href="#" data-toggle="modal" data-target="#signUp "
							id="regForm">${mvo.userId}님 </a>
					</c:when>
				
					<c:otherwise>
						<a class="nav-link" href="#" data-toggle="modal"
							data-target="#signUp " id="regForm">회원가입 </a>
					</c:otherwise>
				</c:choose></li>
			<li class="nav-item" data-toggle="collapse" data-target="#myNavbar">

				<c:choose>
					<c:when test="${mvo.userId != null}">
						
						<a class="nav-link"
							href="DispatcherServlet?command=logout&userId=${mvo.userId}"
							data-toggle="modal" id="login"> 로그아웃</a>

					</c:when>
					<c:otherwise>
						
						<a class="nav-link" href="#signIn" data-toggle="modal"
							data-target="#signIn" id="login">로그인</a>

					</c:otherwise>
				</c:choose>


			</li>
		</ul>

	</div>



	</nav>

	<!-- 회원가입 Modal -->

	<script>
function inputCheck() {
	var userName = $('#InputName').val();
	var userId = $('#InputId').val();
	var doubleCheck = $('#doubleCheck').val();
	var userPass = $('#InputPassword').val();
	var userRepass = $('#InputPasswordRepeat').val();
	var phone1 = $('#InputPhone1').val();
	var phone2 = $('#InputPhone2').val();
	var phone3 = $('#InputPhone3').val();
	var emailId = $('#InputEmailId').val();
	var emailAdd = $('#InputSelectedEmail').val();
	var birthday = $('#InputBirth').val();
	
	var male = $('#male').val();
	var female = $('#female').val();
	if (userName == "") {
		alert("이름을 입력해 주세요.");
		document.regForm.userName.focus();
		return;
	}
	
	if (userId== "") {
		alert("아이디를 입력해 주세요.");
		document.regForm.userId.focus();
		return;
	}
	if (doubleCheck== "false") {
		alert("아이디 중복확인을 해주세요.");
		
		return;
	}
	if (userPass == "") {
		alert("비밀번호를 입력해 주세요.");
		document.regForm.userPass.focus();
		return;
	}
	if (userRepass == "") {
		alert("비밀번호를 확인해 주세요.");
		document.regForm.userRepass.focus();
		return;
	}
	if (userPass != userRepass) {
		alert("비밀번호가 일치하지 않습니다.");
		document.regForm.userRepass.focus();
		return;
	}

	
	if (phone2== "") {
		alert("전화번호 중간자리를 입력해 주세요.");
		document.regForm.phone2.focus();
		return;
	}
	if (phone3 == "") {
		alert("전화번호 뒷자리를 입력해 주세요.");
		document.regForm.phone3.focus();
		return;
	}
	if (emailId== "") {
		alert("이메일을 입력해 주세요.");
		document.regForm.email.focus();
		return;
	}
	if (emailAdd== "") {
		alert("이메일을 입력해 주세요.");
		document.regForm.email.focus();
		return;
	}if (male== "" && female=="") {
		alert("성별을 입력해주세요.");
		document.regForm.email.focus();
		return;
	}
	if (birthday =="") {
		alert("생년월일을  입력해 주세요.");
		window.close();
		 
		
	}
	
	
	 $('#regForm').submit(); 
}


</script>


	<div class="modal fade " id="signUp" tabindex="-1" role="dialog">
		<div class="modal-dialog m-t-5" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">JOIN US</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form action="DispatcherServlet" method="post" name="regForm"
					onsubmit="inputCheck()" id="regForm">
					<div class="modal-body">
						<div class="form-group">
							<label for="id">이름</label> <input type="text" name="userName"
								class="form-control" id="InputName" placeholder="이름" required>
						</div>
						<div class="form-group row">
							<div class="col-sm-10">
								<label for="id">ID</label>
							</div>
							<div class="col-xs-7">
								<input type="text" name="userId" class="form-control"
									id="InputId" placeholder="아이디">
							</div>
							<div class="col-xs-3">
								<span id="span_id"></span>
								<!-- <input type="button" value="중복확인"
									onclick="idCheck()" class="btn btn-secondary" /> -->
								<input type="hidden" name="doubleCheck" id="doubleCheck"
									value="false">
							</div>
						</div>

						<script>
						$("#InputId").keyup(function(){
							
							var userId=$("#InputId").val();
							var param = "userId="+userId+"&command=idCheck";
							
							
							
								$.ajax({
									type: "post",
									url: "DispatcherServlet",
									data: param,
									success: function(result){
										if(result.indexOf("Usable") >0){
											
											//검증한걸로...
											var checkResult= $('input[name=doubleCheck]').val("true"); 
											
										}else{
											var checkResult= $('input[name=doubleCheck]').val("false"); 
											
										}
										$("#span_id").html(result);
									}
								});
							
						});
						
						</script>

						<div class="form-group">
							<label for="exampleInputPassword1">비밀번호</label> <input
								type="password" name="userPass" class="form-control"
								id="InputPassword" placeholder="비밀번호" required> <label><b>비밀번호
									확인</b></label> <input type="password" name="userRepass"
								class="form-control" id="InputPasswordRepeat"
								placeholder="비밀번호 확인" name="psw-repeat" required>
						</div>
						<div class="form-group ">
							<label for="">핸드폰 번호 </label>
						</div>
						<div>
							<select name="phone1" class="selectpicker col-xs-3"
								id="InputPhone1">
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select> &nbsp; - &nbsp;<input type="text" name="phone2" id="InputPhone2"
								class="form-group input-sm" /> &nbsp; - &nbsp;<input
								type="text" name="phone3" id="InputPhone3"
								class="form-group input-sm" />
						</div>

					</div>
					<div class="form-group">
						<div class="col-sm-10">
							<label for="exampleInputEmail1">이메일</label>
						</div>
						<div class="col-xs-7">
							<input type="text" name="emailId" class="form-control"
								id="InputEmailId" aria-describedby="emailHelp"
								placeholder="Email" required>
						</div>
						<div>

							<div>



								<span id="emailChange"> <select class="selectpicker"
									name="emailAdd" id="InputSelectedEmail"
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
							<script>
							function changeFunc() {
								  
							    var selectBox =document.getElementById("InputSelectedEmail");
							    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
							    
							    if(selectedValue =="직접선택"){
							    	$("#emailChange").html("<input type='text' name='emailAdd' id='InputSelectedEmail' value='' />")
							    	
							    }
							   }
							
							
							</script>


							<div class="form-group">
								<div class="col-sm-10">
									<label for="">Email 수신여부 : &nbsp;&nbsp;</label> <input
										type="checkbox" name="emailAccept" value="y" />
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-10">
								<label for="birth">생년월일</label>
							</div>
							<div class="col-sm-10">
								<input type="date" name="birthday" id="InputBirth"
									class="birthday " style="margin-right: 5px;" />
							</div>
						</div>


						<div class="form-group">
							<div class="col-sm-10">
								<label for="">성별</label>
							</div>
							<div class="col-sm-10">
								<input type="radio" name="gender" value="0" id="male" />남자 <input
									type="radio" name="gender" value="1" id="female" />여자
							</div>

						</div>
					</div>

					<div class="modal-footer" style="margin-top: 160px">
						<input type="hidden" value="register" name="command">
						<button type="submit" class="btn btn-primary" value="회원가입"
							onclick="inputCheck()">회원가입</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>


	</div>


	<!-- Sign-in Modal -->
	<div class="modal fade m-t-5" id="signIn" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">Log In</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="DispatcherServlet" method="post" name="loginForm"
					id="loginForm" onsubmit="return checkLogin()">
					<div class="modal-body">
						<div class="form-group">
							<label for="id">ID</label> <input type="text"
								class="form-control" id="loginId" placeholder="아이디"
								name="userId">

						</div>

						<div class="form-group">
							<label for="exampleInputPassword1">비밀번호</label> <input
								type="password" class="form-control" id="loginPass"
								placeholder="비밀번호" name="userPass">
						</div>

						<div class="form-check">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" value="y" name="retainId"> 로그인
								유지
							</label>
						</div>
					</div>
					<div class="modal-footer">
						<input type="hidden" name="command" value="login">
						<button type="submit" class="btn btn-primary">로그인</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</form>



			</div>
		</div>
	</div>
</body>
</html>