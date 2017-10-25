<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Bootstrap Theme Company Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/main.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/sunny/jquery-ui.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script>



<script type="text/javascript">
	$('.selectpicker').selectpicker('refresh');
	
	
	
</script>

<script>
function checkLogin(){
	
	console.log("첵로긴");
	var userId = $('#loginId').val();
	var userPass = $('#loginPass').val();
	if (userId=="") {
		alert("아이디를 입력해 주세요.");
		document.loginForm.userId.focus();
		return;
	}
	if (userPass == "") {
		alert("비밀번호를 입력해 주세요.");
		document.loginForm.userPass.focus();
		return;
	}else {

		$('#loginForm').submit();
	}

}




</script>

</head>


<c:if test="${param.loginfail =='true'}">
<script>
alert("로그인에 실패하였습니다. 다시 로그인 해주세요")
</script>
</c:if>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#myPage"><img src="./image/logo1.png" class="img-circle"
										alt="./image/logo1.png" width="70%" ></a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li data-toggle="collapse" data-target="#myNavbar"><a
					href="#about">ABOUT</a></li>
				<li data-toggle="collapse" data-target="#myNavbar"><a
					href="#services">SERVICES</a></li>
				<li data-toggle="collapse" data-target="#myNavbar"><a
					href="profile.jsp">프로필</a></li>
				<li data-toggle="collapse" data-target="#myNavbar"><a
					href="#pricing">PRICING</a></li>
				<li data-toggle="collapse" data-target="#myNavbar"><a
					href="#contact">CONTACT</a></li>
				<li data-toggle="collapse" data-target="#myNavbar"><c:choose>
						<c:when test="${mvo.userId != null}">
							<a href="#" data-toggle="modal" data-target="#signUp "
								id="regForm">${mvo.userId}님 </a>
						</c:when>
						<c:otherwise>
							<a href="#" data-toggle="modal" data-target="#signUp "
								id="regForm">회원가입 </a>
						</c:otherwise>
					</c:choose>
				</li>
				<li data-toggle="collapse" data-target="#myNavbar">
				
				<c:choose>
						<c:when test="${mvo.userId != null}"> <!-- 로그인 상태라면 -->
							<a href="DispatcherServlet?command=logout&userId=${mvo.userId}"
								data-toggle="modal"  id="login"> 로그아웃</a>

						</c:when>
						<c:otherwise> 
							
							<a href="#signIn" data-toggle="modal" data-target="#signIn" id="login">로그인</a>
		
						</c:otherwise>
				</c:choose>


				</li>

			</ul>
		</div>
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

				<form action="DispatcherServlet" method="post" name="regForm" onsubmit="inputCheck()" id="regForm" >
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
								<input type="text"   name="userId" class="form-control" id="InputId"
									placeholder="아이디" >
							</div>
							<div class="col-xs-3">
							<span id="span_id"></span>
								<!-- <input type="button" value="중복확인"
									onclick="idCheck()" class="btn btn-secondary" /> -->
									<input type="hidden" name="doubleCheck" id="doubleCheck" value="false" >
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
								type="password" name="userPass" class="form-control" id="InputPassword"
								placeholder="비밀번호" required> <label><b>비밀번호
									확인</b></label> <input type="password" name="userRepass" class="form-control"
								id="InputPasswordRepeat" placeholder="비밀번호 확인" name="psw-repeat"
								required>
						</div>
						<div class="form-group ">
							<label for="">핸드폰 번호 </label>
						</div>
						<div>
							<select name="phone1" class="selectpicker col-xs-3" id="InputPhone1">
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select> &nbsp; - &nbsp;<input type="text" name="phone2" id="InputPhone2"
								class="form-group input-sm" /> &nbsp; - &nbsp;<input
								type="text" name="phone3" id="InputPhone3"class="form-group input-sm" />
						</div>

					</div>
					<div class="form-group">
						<div class="col-sm-10">
							<label for="exampleInputEmail1">이메일</label>
						</div>
						<div class="col-xs-7">
							<input type="text" name="emailId" class="form-control" id="InputEmailId"
								aria-describedby="emailHelp" placeholder="Email" required>
						</div>
						<div>
						
							<div>
							
						
								
							<span id="emailChange">
								<select class="selectpicker" name="emailAdd" id="InputSelectedEmail"   onchange="changeFunc();">
									
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
									<option value="직접선택"   > 직접선택</option>
									
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
								<input type="radio" name="gender" value="0" id="male"   />남자 <input
									type="radio" name="gender" value="1" id="female"  />여자
							</div>

						</div>
					</div>

					<div class="modal-footer" style="margin-top:160px">
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
				<form action="DispatcherServlet" method="post" name="loginForm"  id="loginForm" onsubmit="return checkLogin()" >
					<div class="modal-body">
						<div class="form-group">
							<label for="id">ID</label> <input type="text"
								class="form-control" id="loginId" placeholder="아이디"  name="userId" value="">

<%-- <c:if test="${retainId !='null'}"><c:out value="${retainId}"></c:out></c:if> --%>

						</div>
				<script>
				$('#login').click(function() {
					
					
					
						
					
					 var param = "command=cookieConfirm";
					
					
					
					$.ajax({
						type: "post",
						url: "DispatcherServlet",
						data: param,
						success: function(result){
							
							$("#loginId").val(result);
						}
					}); 
					
				})
				</script>
						<div class="form-group">
							<label for="exampleInputPassword1">비밀번호</label> <input
								type="password" class="form-control" id="loginPass"
								placeholder="비밀번호" name="userPass" value="" >
						<%-- <c:if test="${retainPass !='null'}"><c:out value="${retainPass}"></c:out></c:if> --%>
						</div>
						

						<div class="form-check">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" value="y" name="retainId"> 아이디 기억
							</label>
						</div>
					</div>
					<div class="modal-footer">
					<input type="hidden" name="command" value="login">
						<button type="submit" class="btn btn-primary" >로그인</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</form>
				
				

			</div>
		</div>
	</div>

	<div class="jumbotron text-center">
		<h1>Walk & Talk</h1> 
		<p>Social Activity Platform</p>
		<form>
			<div class="input-group">
				<input type="email" class="form-control" size="50"
					placeholder="Email Address" required>
				<div class="input-group-btn">
					<button type="button" class="btn btn-danger">Subscribe</button>
				</div>
			</div>
		</form>
	</div>

	<!-- Container (About Section) -->
	<div id="about" class="container-fluid">
		<div class="row">
			<div class="col-sm-8">
				<h2>About Company Page</h2>
				<br>
				<h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
					sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
					Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
					nisi ut aliquip ex ea commodo consequat.</h4>
				<br>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
					enim ad minim veniam, quis nostrud exercitation ullamco laboris
					nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat
					cupidatat non proident, sunt in culpa qui officia deserunt mollit
					anim id est laborum consectetur adipiscing elit, sed do eiusmod
					tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
					minim veniam, quis nostrud exercitation ullamco laboris nisi ut
					aliquip ex ea commodo consequat.</p>
				<br>
				<button class="btn btn-default btn-lg">Get in Touch</button>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-signal logo"></span>
			</div>
		</div>
	</div>

	<div class="container-fluid bg-grey">
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-globe logo slideanim"></span>
			</div>
			<div class="col-sm-8">
				<h2>Our Values</h2>
				<br>
				<h4>
					<strong>MISSION:</strong> Our mission lorem ipsum dolor sit amet,
					consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua. Ut enim ad minim veniam, quis
					nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat.
				</h4>
				<br>
				<p>
					<strong>VISION:</strong> Our vision Lorem ipsum dolor sit amet,
					consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua. Ut enim ad minim veniam, quis
					nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit,
					sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
					Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
					nisi ut aliquip ex ea commodo consequat.
				</p>
			</div>
		</div>
	</div>

	<!-- Container (Services Section) -->
	<div id="services" class="container-fluid text-center">
		<h2>SERVICES</h2>
		<h4>What we offer</h4>
		<br>
		<div class="row slideanim">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-off logo-small"></span>
				<h4>POWER</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-heart logo-small"></span>
				<h4>LOVE</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-lock logo-small"></span>
				<h4>JOB DONE</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
		</div>
		<br> <br>
		<div class="row slideanim">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-leaf logo-small"></span>
				<h4>GREEN</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-certificate logo-small"></span>
				<h4>CERTIFIED</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-wrench logo-small"></span>
				<h4 style="color: #303030;">HARD WORK</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
		</div>
	</div>

	<!-- Container (Portfolio Section) -->
	<div id="portfolio" class="container-fluid text-center bg-grey">
		<h2>Portfolio</h2>
		<br>
		<h4>What we have created</h4>
		<div class="row text-center slideanim">
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="#" alt="Paris" width="400" height="300">
					<p>
						<strong>Paris</strong>
					</p>
					<p>Yes, we built Paris</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="#" alt="New York" width="400" height="300">
					<p>
						<strong>New York</strong>
					</p>
					<p>We built New York</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="#" alt="San Francisco" width="400" height="300">
					<p>
						<strong>San Francisco</strong>
					</p>
					<p>Yes, San Fran is ours</p>
				</div>
			</div>
		</div>
		<br>

		<h2>What our customers say</h2>
		<div id="myCarousel" class="carousel slide text-center"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<h4>
						"This company is the best. I am so happy with the result!"<br>
						<span>Michael Roe, Vice President, Comment Box</span>
					</h4>
				</div>
				<div class="item">
					<h4>
						"One word... WOW!!"<br> <span>John Doe, Salesman, Rep
							Inc</span>
					</h4>
				</div>
				<div class="item">
					<h4>
						"Could I... BE any more happy with this company?"<br> <span>Chandler
							Bing, Actor, FriendsAlot</span>
					</h4>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<!-- Container (Pricing Section) -->
	<div id="pricing" class="container-fluid">
		<div class="text-center">
			<h2>Pricing</h2>
			<h4>Choose a payment plan that works for you</h4>
		</div>
		<div class="row slideanim">
			<div class="col-sm-4 col-xs-12">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h1>Basic</h1>
					</div>
					<div class="panel-body">
						<p>
							<strong>20</strong> Lorem
						</p>
						<p>
							<strong>15</strong> Ipsum
						</p>
						<p>
							<strong>5</strong> Dolor
						</p>
						<p>
							<strong>2</strong> Sit
						</p>
						<p>
							<strong>Endless</strong> Amet
						</p>
					</div>
					<div class="panel-footer">
						<h3>$19</h3>
						<h4>per month</h4>
						<button class="btn btn-lg">Sign Up</button>
					</div>
				</div>
			</div>
			<div class="col-sm-4 col-xs-12">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h1>Pro</h1>
					</div>
					<div class="panel-body">
						<p>
							<strong>50</strong> Lorem
						</p>
						<p>
							<strong>25</strong> Ipsum
						</p>
						<p>
							<strong>10</strong> Dolor
						</p>
						<p>
							<strong>5</strong> Sit
						</p>
						<p>
							<strong>Endless</strong> Amet
						</p>
					</div>
					<div class="panel-footer">
						<h3>$29</h3>
						<h4>per month</h4>
						<button class="btn btn-lg">Sign Up</button>
					</div>
				</div>
			</div>
			<div class="col-sm-4 col-xs-12">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h1>Premium</h1>
					</div>
					<div class="panel-body">
						<p>
							<strong>100</strong> Lorem
						</p>
						<p>
							<strong>50</strong> Ipsum
						</p>
						<p>
							<strong>25</strong> Dolor
						</p>
						<p>
							<strong>10</strong> Sit
						</p>
						<p>
							<strong>Endless</strong> Amet
						</p>
					</div>
					<div class="panel-footer">
						<h3>$49</h3>
						<h4>per month</h4>
						<button class="btn btn-lg">Sign Up</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Container (Contact Section) -->
	<div id="contact" class="container-fluid bg-grey">
		<h2 class="text-center">CONTACT</h2>
		<div class="row">
			<div class="col-sm-5">
				<p>Contact us and we'll get back to you within 24 hours.</p>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span> Chicago, US
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span> +00 1515151515
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span>
					myemail@something.com
				</p>
			</div>
			<div class="col-sm-7 slideanim">
				<div class="row">
					<div class="col-sm-6 form-group">
						<input class="form-control" id="name" name="name"
							placeholder="Name" type="text" required>
					</div>
					<div class="col-sm-6 form-group">
						<input class="form-control" id="email" name="email"
							placeholder="Email" type="email" required>
					</div>
				</div>
				<textarea class="form-control" id="comments" name="comments"
					placeholder="Comment" rows="5"></textarea>
				<br>
				<div class="row">
					<div class="col-sm-12 form-group">
						<button class="btn btn-default pull-right" type="submit">Send</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Google Maps -->
	<div id="googleMap" style="height: 400px;" class="w3-grayscale-max"></div>
	<script>
		function myMap() {
			myCenter = new google.maps.LatLng(41.878114, -87.629798);
			var mapOptions = {
				center : myCenter,
				zoom : 12,
				scrollwheel : false,
				draggable : false,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapOptions);

			var marker = new google.maps.Marker({
				position : myCenter,
			});
			marker.setMap(map);
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABmESzR_EPQzZZCwZV_DFTEHWOjVJWOtc&callback=myMap"></script>	<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

	<footer class="container-fluid text-center"> <a href="#myPage"
		title="To Top"> <span class="glyphicon glyphicon-chevron-up"></span>
	</a>
	<p>
		Bootstrap Theme Made By <a href="https://www.w3schools.com"
			title="Visit w3schools">www.w3schools.com</a>
	</p>
	</footer>

	<script>
		$(document).ready(
				function() {
					// Add smooth scrolling to all links in navbar + footer link
					$(".navbar a, footer a[href='#myPage']").on('click',
							function(event) {
								// Make sure this.hash has a value before overriding default behavior
								if (this.hash !== "") {
									// Prevent default anchor click behavior
									event.preventDefault();

									// Store hash
									var hash = this.hash;

									// Using jQuery's animate() method to add smooth page scroll
									// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
									$('html, body').animate({
										scrollTop : $(hash).offset().top
									}, 900, function() {

										// Add hash (#) to URL when done scrolling (default click behavior)
										window.location.hash = hash;
									});
								} // End if
							});

					$(window).scroll(function() {
						$(".slideanim").each(function() {
							var pos = $(this).offset().top;

							var winTop = $(window).scrollTop();
							if (pos < winTop + 600) {
								$(this).addClass("slide");
							}
						});
					});
				})
	</script>

</body>
</html>