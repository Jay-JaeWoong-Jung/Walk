<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>회원정보 수정 페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/main.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/sunny/jquery-ui.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script>
<link href="./open-iconic-master/font/css/open-iconic-bootstrap.css"
	rel="stylesheet">
</head>

<style>
body {
font-family: bmjua;
	
	
}

@font-face {
	font-family: bmjua;
	src: url(./css/font/BMJUA_ttf.ttf);
}

</style>

<c:if test="${deleteResult == '0'}">

<script>
alert("회원탈퇴에 실패 하셨습니다. 비밀번호를 다시 입력해주세요")

</script>

</c:if>

<script type="text/javascript">
	function updateClose() {
		location.href = "newProfile.jsp?userId=${mvo.userId}";
	}
	function deleteMember() {
		location.href = "delete.jsp?userId=${mvo.userId}";
	}
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
		var isGender=$('input[name=gender]').is(':checked');
		
		
		if (userPass == "") {
			alert("비밀번호를 입력해 주세요.");
			document.regForm.userPass2.focus();
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
		}if (isGender ==false) {
			alert("성별을 입력해주세요.");
			document.regForm.email.focus();
			return;
		}
		if (birthday =="") {
			alert("생년월일을  입력해 주세요.");
			document.regForm.email.focus();
			return;
			 
			
		}
		
		document.updateForm.submit();
		
		//$('#updateForm').submit();
	}
</script>

<body>
	<form action="DispatcherServlet?command=updateMember" method="post"
		name="updateForm"  id="updateForm"
		enctype="multipart/form-data">

		<div class="header" align="center">
			<font size="5"> 회원 정보 수정</font>
			<div>
				<input type="hidden" name="command" value="updateMember">
				<button type="button" class="btn btn-primary" value="저장"
					onclick="updateCheck()" style="font-size:30px;">저장</button>
				<button type="button" class="btn btn-secondary"
					onclick="updateClose()" style="font-size:30px;">취소</button>
				<a href="#" name="delete" class="btn btn-danger"
				data-toggle="modal" data-target="#deleteModal" style="color:white; font-size:30px;">
					회원탈퇴</a>
			</div>

		</div>
		
		




		<div class="form-group">
					<label for="profile">프로필 사진</label> <input type="file"
						name="file" class="form-control" id="InputProfile">

				</div> 


				<div class="form-group">
					<label for="id">이름</label> <input type="text" name="userName"
						class="form-control" id="InputName" placeholder="이름" readonly
						value="${mvo.userName}">
				</div>
				<div class="form-group row">
					<div class="col-sm-10">
						<label for="id">ID</label>
					</div>
					<div class="col-xs-7">
						<input type="text" name="userId" class="form-control" id="InputId"
							value="${mvo.userId}" readonly>
					</div>
					<div class="col-xs-3">
						<span id="span_id"></span>
						
						<input type="hidden" name="doubleCheck" id="doubleCheck"
							value="false">
					</div>
				</div>

				

				<div class="form-group">
					<label for="exampleInputPassword1">비밀번호</label> 
					<input type="password" name="userPass2" class="form-control" id="InputPassword"  > 
						<label><b>비밀번호 확인</b></label> 
						<input type="password" name="userRepass" class="form-control" id="InputPasswordRepeat" placeholder="비밀번호 확인" >
				</div>
				<div class="form-group ">
					<label for="">핸드폰 번호 </label>
				</div>
				<div>
					<select name="phone1" class="selectpicker col-xs-3"
						id="InputPhone1" value="${mvo.phone1}">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select> &nbsp; - &nbsp;<input type="text" name="phone2" id="InputPhone2"
						value="${mvo.phone2}" class="form-group input-sm" /> &nbsp; -
					&nbsp;<input type="text" name="phone3" id="InputPhone3"
						value="${mvo.phone3}" class="form-group input-sm" />
				</div>

			
			<div class="form-group">
				<div class="col-sm-10">
							<label for="exampleInputEmail1">이메일</label>
						</div>
						<div class="col-xs-7">
							<input type="text" name="emailId" class="form-control" id="InputEmailId"
								aria-describedby="emailHelp" value="${mvo.emailId}">
						</div>
						<div>
						
							<div>
							
						
								
							<span id="emailChange">
								<select class="selectpicker" name="emailAdd" id="InputSelectedEmail"  value="${mvo.emailAdd}"  onchange="changeFunc();">
									
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


					<div class="form-group">
						<div class="col-sm-10">
							<label for="">Email 수신여부 : &nbsp;&nbsp;</label> <input
								type="checkbox" name="emailAccept" value="y" <c:if test="${mvo.emailAccept == 'y'}"><c:out value="checked"> </c:out> </c:if> />
						
						
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-10">
						<label for="birth">생년월일</label>
					</div>
					<div class="col-sm-10">
						<input type="date" name="birthday" id="InputBirth"
							class="birthday " style="margin-right: 5px;" readonly
							value="${mvo.birth}" />
					</div>
				</div>


				<div class="form-group">
					<div class="col-sm-10">
						<label for="">성별</label>
					</div>
					<div class="col-sm-10">
						<input type="radio" name="gender" value="0" id="male"   <c:if test="${mvo.gender == '0'}"><c:out value="checked"> </c:out> </c:if>/>남자
						<input type="radio" name="gender" value="1" id="female"   <c:if test="${mvo.gender == '1'}"><c:out value="checked"> </c:out> </c:if> />여자
				
					</div>

				</div>

			</div>
			
		
	</form>
	
	
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
					<input type="password"  id="userPass1"
											name="userPass" maxlength="40" size="40" 
											style="font-family:'Saira Semi Condensed', sans-serif;font-size:20px;width:300px;">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							
							id="ClickBtnDel" >ㅜ,.ㅜ</button>

						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
							
							 <script type="text/javascript">
								$(document).ready(function () {
									$('#ClickBtnDel').click(function () {
										
										var userPass=$('#userPass1').val();
										location.href = "DispatcherServlet?command=deleteMember&&userId=${mvo.userId}"
										+"&&userPass=" + userPass;
														
									});
													
								});
											
							</script> 
							
						<!-- <script type="text/javascript">
							function sumbit_Delete(mvouserId, mvouserpass) {
								var userId = mvouserId
								var userPass = mvouserpass
								location.href = "DispatcherServlet?command=deleteMember&&userId="
										+ userId + "&&userPass=" + userPass;
							}
						</script> -->

					</div>
				</div>
			</div>
		</div>
		<!-- *************************** End Modal ******************************  -->
</body>
</html>
