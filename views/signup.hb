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

{{getScript "signup"}}