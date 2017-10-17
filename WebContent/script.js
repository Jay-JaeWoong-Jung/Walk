function idCheck(id) {
	if (id == "") {
		alert("아이디를 입력해 주세요.");
		document.main.id.focus();
	} else {
		url = "idCheck.jsp?id=" + id;
		window.open(url, "post", "width=300,height=150");
	}
}

function inputCheck() {
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
	
	document.main.submit();
}
	function updateCheck() {
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
		document.main.submit();
	}
