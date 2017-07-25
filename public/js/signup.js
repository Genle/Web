function valite() {
	let form = document.getElementById('signup');
	let email = form.email.value;
	let emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)
	if (email == "" || !emailFormat) {
		// write message in message space
		return false;
	}

	let pass = form.password.value;
	let confirmPass = form.confirmPassword.value;

	if (pass == "" || confirmPass == "") {
		//write message empty field
		return false;
	}

	if (pass != confirmPass) {
		//write message pass not same with confirm password
		return false;
	}

	let params = `email=${email}&password=${pass}`;
	let ajax = new XMLHttpRequest();
	ajax.onreadystatechange = function() {
		if (ajax.readyState === XMLHttpRequest.DONE && ajax.status === 200) {
			console.log(JSON.parse(ajax.responseText));
			form.reset();
		}
	};
	ajax.open("POST", `api/create/user`, true);

	ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	ajax.send(params);



	return false;
}