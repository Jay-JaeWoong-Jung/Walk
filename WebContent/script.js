function idCheck() {
		var userId = $('#InputId').val();
	if (userId == "") {
		alert("아이디를 입력해 주세요.");
		document.regForm.userId.focus();
	} else {
		
		url = "DispatcherServlet?userId="+userId+"&&command=idCheck";
		window.open(url, "", "width=300,height=150");
	}
}

function inputCheck() {
	var userName = $('#InputName').val();
	var userId = $('#InputId').val();
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

	if (phone1 == "") {
		alert("통신사를 입력해 주세요.");
		document.regForm.phone1.focus();
		return;
	}
	if (phone2== "") {
		alert("전화번호를 입력해 주세요.");
		document.regForm.phone2.focus();
		return;
	}
	if (phone3 == "") {
		alert("전화번호를 입력해 주세요.");
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
	if (birthday== "") {
		alert("생년월일을 입력해 주세요.");
		document.regForm.birthday.focus();
		return;
	}
	
	
	$('#regForm').submit();
}
function checkLogin() {
	var userId = $('#InputId').val();
	var userPass = $('#InputPassword').val();
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
/*	function updateCheck() {
		if (document.main.name.value == "") {
			alert("이름을 입력해 주세요.");
			document.main.name.focus();
			return;
		}
		
		if (document.main.id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.main.id.focus();
			return;
		}
		if (document.main.pass.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.main.pass.focus();
			return;
		}
		if (document.main.repass.value == "") {
			alert("비밀번호를 확인해 주세요.");
			document.main.repass.focus();
			return;
		}
		if (document.main.pass.value != document.main.repass.value) {
			alert("비밀번호가 일치하지 않습니다.");
			document.main.repass.focus();
			return;
		}

		if (document.main.phone1.value == "") {
			alert("통신사를 입력해 주세요.");
			document.main.phone1.focus();
			return;
		}
		if (document.main.phone2.value == "") {
			alert("전화번호를 입력해 주세요.");
			document.main.phone2.focus();
			return;
		}
		if (document.main.phone3.value == "") {
			alert("전화번호를 입력해 주세요.");
			document.main.phone3.focus();
			return;
		}
		if (document.main.email.value == "") {
			alert("이메일을 입력해 주세요.");
			document.main.email.focus();
			return;
		}
		document.main.submit();*/
	}


