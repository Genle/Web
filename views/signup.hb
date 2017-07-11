<div class="signup-form ">
    <div class="row">
        <h5 class="center-align">Create an account</h5>
        <form id="signup" class="col s12 m4 offset-m4" onsubmit="return(valite())">
            <div class="row">
                <div class="input-field col s12 m12">
                    <input  id="email" type="text" class="validate" name="email" value="">
                    <label for="email">Email</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m12">
                    <input  id="password" type="password" class="validate" name="password" value="">
                    <label for="password">Password</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m12">
                    <input  id="confirm-password" type="password" class="validate" name="confirmPassword" value="">
                    <label for="confirm-password">Confirm password</label>
                </div>
            </div>
            <div class="row">
                <input type="submit" name="signup" class="btn red darken-2 col s12 m12" id="signup-btn" value="Signup">
            </div>
        </form>
    </div>
</div>

<script>
function valite(){
    let form = document.getElementById('signup');
    let email = form.email.value;
    let emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)
    if( email == "" || !emailFormat){
        // write message in message space
        return false;
    }

    let pass = form.password.value;
    let confirmPass = form.confirmPassword.value;

    if(pass == "" || confirmPass == ""){
        //write message empty field
        return false;
    }

    if (pass != confirmPass){
        //write message pass not same with confirm password
        return false;
    }

    let params = `email=${email}&password=${pass}`;
    let ajax = new XMLHttpRequest(); 
    ajax.onreadystatechange = function () {
    if(ajax.readyState === XMLHttpRequest.DONE && ajax.status === 200) {
        console.log(JSON.parse(ajax.responseText));
            form.reset();
        }
    };
    ajax.open("POST", "http://localhost:9876/api/create/user", true);
    
    ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    ajax.send(params);
    


    return false;
}

</script>