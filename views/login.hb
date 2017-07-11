<div class="login-form">
    <div class="row">
        <h5 class="center-align">Login to your account</h5>
        <form id="login" class="col s12 m4 offset-m4" onsubmit="return(valite())">
            <div class="row">
                <div class="input-field col s12 m12">
                    <input  id="email" type="text" class="validate">
                    <label for="email">Email</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m12">
                    <input  id="password" type="password" class="validate">
                    <label for="email">Password</label>
                </div>
            </div>
            <div class="row">
                <input class="btn col s12 m12" type="submit" name="login" value="Login">
            </div>
        </form>
    </div>
</div>


<script type="text/javascript">

    function valite(){
    let form = document.getElementById('login');
    let email = form.email.value;
    let emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)
    if( email == "" || !emailFormat){
        // write message in message space
        return false;
    }

    let pass = form.password.value;
    

    if(pass == ""){
        //write message empty field
        return false;
    }


    let params = `email=${email}&password=${pass}`;
    console.log("params: ",params);
    let ajax = new XMLHttpRequest(); 
    ajax.onreadystatechange = function () {
    if(ajax.readyState === XMLHttpRequest.DONE && ajax.status === 200) {
            console.log(ajax.responseText);
            data = JSON.parse(ajax.responseText);
            console.log(data)
            if (data.message == "OK"){
                window.location.replace('http://localhost:9876/');
            }
        }
    };
    ajax.open("POST", "http://localhost:9876/api/login", true);
    
    ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    ajax.send(params);
    


    return false;
}
</script>