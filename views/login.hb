<div class="login-form">
    <div class="row">
        <div class="col s12 m4 offset-m4">
            <span id="error-message"></span>
        </div>
    </div>
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
                <input class="btn col s12 m12 red darken-2" type="submit" name="login" value="Login">
            </div>
        </form>
    </div>
</div>

{{getScript "login"}}
{{getScript "main"}}