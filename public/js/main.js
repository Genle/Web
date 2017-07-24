// /**
//  * Created by shadowx on 7/16/17.
//  */
// let config = require("./config");
// const environment = config.environement;

// //create custom element
// let custom = document.createElement('link');
// custom.rel = "stylesheet";
// custom.href = config['env'][environment]['custom'];
// document.head.appendChild(custom);

// let materializeCss = document.createElement('link');
// materializeCss.rel = "stylesheet";
// materializeCss.href = config['env']['materialize']['cssSrc'];
// document.head.appendChild(materializeCss);

// let materializeFont = document.createElement('link');
// materializeFont.rel = "stylesheet";
// materializeFont.href = config['materialize']['fontSrc'];
// document.head.appendChild(materializeFont);

// let jquery = document.createElement('script');
// jquery.src = config['jquery']['src'];
// jquery.integrity = config['jquery']['integrity'];
// jquery.crossorigin = config['jquery']['crossorigin'];
// document.head.appendChild(jquery);

// let materializeJs = document.createElement('script');
// materializeJs.src = config['materialize']['jsSrc'];
// document.head.appendChild(materializeJs);
// function check() {
// 	let anchor = document.getElementById('reorder');
// 	console.log(anchor);

// 	alert(anchor);
// }


function checkLogin() {
	var Anchors = document.getElementById('reorder');

	Anchors.addEventListener("click",
		function(event) {
			event.preventDefault();
			if (window.localStorage.email) {
				window.location = this.href;
			} else {
				window.localStorage.setItem("page", "reorder");
				window.location.replace("http://localhost:9876/login");
			}
		},
		false);

}

checkLogin();