function valite() {
  let form = document.getElementById('login');
  let email = form.email.value;
  let emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email);
  if (email == "" || !emailFormat) {
    // write message in message space
    form.email.focus();
    form.reset();
    return false;
  }

  let pass = form.password.value;


  if (pass == "") {
    //write message empty field
    return false;
  }

  console.log(`${config['env'][environment]['baseUrl']}/api/login`);
  let params = `email=${email}&password=${pass}`;
  let ajax = new XMLHttpRequest();
  ajax.onreadystatechange = function() {
    if (ajax.readyState === XMLHttpRequest.DONE && ajax.status === 200) {
      data = JSON.parse(ajax.responseText);

      if (data.message == "true") {
        if (window.localStorage.object) {
          let orderInfo = JSON.parse(window.localStorage.object);
          window.localStorage.removeItem('object');
          let params = `title=${orderInfo.title}&description=${orderInfo.description}&price=${orderInfo.price}`;
          ajax.open("POST", `${config['env'][environment]['baseUrl']}/api/create/order`, true);
          ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
          ajax.send(params);
          window.localStorage.setItem("email", email);
          window.location.replace(`${config['env'][environment]['baseUrl']}/re-order`);
        } else if (window.localStorage.page == "reorder") {
          window.localStorage.setItem("email", email);
          window.location.replace(`${config['env'][environment]['baseUrl']}/re-order`);
        } else {
          window.location.replace(`${config['env'][environment]['baseUrl']}`);
          window.localStorage.setItem("email", email);
        }
      }
    }
  };
  console.log(`${config['env'][environment]['baseUrl']}/api/login`);
  ajax.open("POST", `${config['env'][environment]['baseUrl']}/api/login`, true);

  ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  ajax.send(params);



  return false;
}