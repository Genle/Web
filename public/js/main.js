function checkLogin() {
	var Anchors = document.getElementById('reorder');

	Anchors.addEventListener("click",
		function(event) {
			event.preventDefault();
			if (window.localStorage.email) {
				window.location = this.href;
			} else {
				window.localStorage.setItem("page", "reorder");
				window.location.replace(`${config['env'][environment]['baseUrl']}/login`);
			}
		},
		false);

}

checkLogin();