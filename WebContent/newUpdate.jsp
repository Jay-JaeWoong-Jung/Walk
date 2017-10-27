<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/newUpdate.css?ver=1">



<link href="./open-iconic-master/font/css/open-iconic-bootstrap.css"
	rel="stylesheet">

<c:if test="${deleteResult == '0'}">

<script>
alert("회원탈퇴에 실패 하셨습니다. 비밀번호를 다시 입력해주세요")

</script>

</c:if>
</head>

<script type="text/javascript">
	function updateClose() {
		location.href = "newProfile.jsp?userId=${mvo.userId}";
	}
	/* function deleteMember() {
		location.href = "delete.jsp?userId=${mvo.userId}";
	} */
</script>


	<script>
	function updateCheck() {
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

		if (phone2 == "") {
			alert("전화번호 중간자리를 입력해 주세요.");
			document.regForm.phone2.focus();
			return;
		}
		if (phone3 == "") {
			alert("전화번호 뒷자리를 입력해 주세요.");
			document.regForm.phone3.focus();
			return;
		}
		if (emailId == "") {
			alert("이메일을 입력해 주세요.");
			document.regForm.email.focus();
			return;
		}
		if (emailAdd == "") {
			alert("이메일을 입력해 주세요.");
			document.regForm.email.focus();
			return;
		}
		if (male == "" && female == "") {
			alert("성별을 입력해주세요.");
			document.regForm.email.focus();
			return;
		}
		if (birthday == "") {
			alert("생년월일을  입력해 주세요.");
			window.close();

		}

		$('#updateForm').submit();
	}
</script>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light"> 
<a  href="newMain.jsp" class ="btn btn-danger" ><span class="oi oi-home" style="font-size:25px"></span></a>
</nav>

<form action="DispatcherServlet?command=updateMember" method="post"
		name="updateForm" onsubmit="return updateCheck()" id="updateForm"
		enctype="multipart/form-data">
	<div class="container-fluid">
	  
		<div class="header" align="center">
			<font size="5"> 회원 정보 수정</font>
			

		</div>
	




		<div class="form-group row">
			<div class="col-sm-4">
					<label for="profile">프로필 사진</label> <input type="file"
						name="file" class="form-control" id="InputProfile">
			</div>		
		</div> 


				<div class="form-group">
				  
					<label for="id">이름</label> <input type="text" name="userName"
						class="form-control" id="InputName" placeholder="이름" readonly
						value="${mvo.userName}">
						
				  	
				</div>
				<div class="form-group row">
					<div class="col-sm-7">
						<label for="id">ID</label>
					</div>
					<div class="col-sm-12">
						<input type="text" name="userId" class="form-control" id="InputId"
							value="${mvo.userId}" size="20" readonly >
					</div>
					
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">비밀번호</label> <input
						type="password" name="userPass" class="form-control InputPassword"
						id="InputPassword" value="${mvo.userPass}" required> <label><b>비밀번호
							확인</b></label> <input type="password" name="userRepass" class="form-control InputPassword"
						id="InputPasswordRepeat" placeholder="Check Password" name="psw-repeat"
						required>
				</div>
				<div class="form-group ">
					<label for="">핸드폰 번호 </label>
				</div>
				<div>
					<select name="phone1" class="selectpicker col-sm-3 InputPhone"
						id="InputPhone1" value="${mvo.phone1}">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select> &nbsp; - &nbsp;<input type="text" name="phone2" id="InputPhone2"
						value="${mvo.phone2}" class="form-group input-sm InputPhone" /> &nbsp; 
					&nbsp;<input type="text" name="phone3" id="InputPhone3"
						value="${mvo.phone3}" class="form-group input-sm InputPhone" />
				</div>

			<div class="form-group">
			<div class=" row">
					<div class="col-sm-10">
						<label for="exampleInputEmail1">이메일</label>
					</div>
			</div>
					<div class="row">
						<div class="col-sm-6">
							<input type="text" name="emailId" class="form-control"
								id="InputEmailId" aria-describedby="emailHelp"
								value="${mvo.emailId}">
						</div>
						<div class="col-sm-1" id="gol">
						<b> @</b>
						</div>
						


						<div class="col-sm-5">
							<span id="emailChange"> <select class="selectpicker"
								name="emailAdd" id="InputSelectedEmail" value="${mvo.emailAdd}"
								onchange="changeFunc();">

									<option value="@naver.com"> naver.com</option>
									<option value="@nate.com"> nate.com</option>
									<option value="@dreamwiz.com"> dreamwiz.com</option>
									<option value="@yahoo.co.kr"> yahoo.co.kr</option>
									<option value="@empal.com"> empal.com</option>
									<option value="@unitel.co.kr"> unitel.co.kr</option>
									<option value="@gmail.com"> gmail.com</option>
									<option value="@korea.com"> korea.com</option>
									<option value="@chol.com"> chol.com</option>
									<option value="@paran.com"> paran.com</option>
									<option value="@freechal.com"> freechal.com</option>
									<option value="@hanmail.net"> hanmail.net</option>
									<option value="@hotmail.com"> hotmail.com</option>
									<option value=" 직접선택"> 직접선택</option>

							</select>
							</span>
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
				</div>
			
					<div class="form-group row">
						<div class="col-sm-10">
							<label for="">Email 수신여부 : &nbsp;&nbsp;</label> <input
								type="checkbox" name="emailAccept" value="y" <c:if test="${mvo.emailAccept == 'y'}"><c:out value="checked"> </c:out> </c:if> />
						
						
						</div>
					</div>
				

				<div class="form-group row">
					<div class="col-sm-10">
						<label for="birth">생년월일</label>
					</div>
					<div class="col-sm-10">
						<input type="date" name="birthday" id="InputBirth"
							class="birthday " style="margin-right: 5px;" readonly
							value="${mvo.birth}" />
					</div>
				</div>


				<div class="form-group row">
					<div class="col-sm-10">
						<label for="">성별</label>
					</div>
					<div class="col-sm-10">
						<input type="radio" name="gender" value="0" id="male"   <c:if test="${mvo.gender == '0'}"><c:out value="checked"> </c:out> </c:if>/>남자
						<input type="radio" name="gender" value="1" id="female"   <c:if test="${mvo.gender == '1'}"><c:out value="checked"> </c:out> </c:if> />여자
				
					</div>

				</div>

			
			
		 </div>	
			<div align="center">
				<input type="hidden" name="command" value="updateMember">
				<button type="submit" class="btn btn-primary goBtn" value="저장"
					onclick="updateCheck()" >저장</button>
				<button type="button" class="btn btn-secondary goBtn"
					onclick="updateClose()" >취소</button>
				<a href="#" name="delete" class="btn btn-danger goBtn"
				data-toggle="modal" data-target="#deleteModal" >
					회원탈퇴</a>
			</div>
			<!-- *************************** Start Modal ******************************  -->



		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">
							<img src="./image/footstep.svg" style="width: 40px;">
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" style="font-size:20px">정말로 산책을 그만두고 나태한 삶을 사시겠어요?<br>
					<input type="password"  id="userPass"
											name="userPass" maxlength="40" size="40" 
											>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							
							id="ClickBtnDel" >탈퇴</button>

						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
							
							 <script type="text/javascript">
								$(document).ready(function () {
									$('#ClickBtnDel').click(function () {
										
										var userPass=$('#userPass').val();
										location.href = "DispatcherServlet?command=deleteMember&&userId=${mvo.userId}"
										+"&&userPass=" + userPass;
														
									});
													
								});
											
							</script> 
						
					</div>
				</div>
			</div>
		</div>
		<!-- *************************** End Modal ******************************  -->
	 
	</form>
</body>
</html>












