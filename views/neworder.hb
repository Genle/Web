<!--<div class="new-order">-->
    <!--<img src="/static/img/pizzabg.jpg" alt="" class="responsive-img">-->
<!--</div>-->

<div class="new-order">
    <div class="valign-wrapper">
        <img class="parallax-like-pic" width="300" height="300" src="/static/img/pepperoni.png" alt="">
    </div>

    <div class="row">
        <h5 class="center-align">Create your custom pizza from different ingredients</h5>
    </div>
    <div class="row">
        <!--<h5 class="white-text">Create your custom pizza from different ingredients</h5>-->
    </div>


    <div class="col s12 m8 offset-m2">
        <form class="col s12 m12">

            <div class="row">
                <div class="input-field col s12 m4">
                    <select class="">
                        <option value="" disabled selected>Choose the crust</option>
                        <option value="1">Option 1</option>
                        <option value="2">Option 2</option>
                        <option value="3">Option 3</option>
                    </select>
                    <!--<label class="white-text">Crust</label>-->
                </div>
                <div class="input-field col s12 m4 offset-m4">
                    <select class="">
                        <option value="" disabled selected>Choose the sauce</option>
                        <option value="1">Option 1</option>
                        <option value="2">Option 2</option>
                        <option value="3">Option 3</option>
                    </select>
                    <!--<label class="white-text">Crust</label>-->
                </div>

            </div>
            <div class="row">
                <div class="input-field col s12 m4">
                    <select class="" multiple>
                        <option value="" disabled selected>Choose the toppings</option>
                        <option value="1">Option 1</option>
                        <option value="2">Option 2</option>
                        <option value="3">Option 3</option>
                    </select>
                    <!--<label class="white-text">Crust</label>-->
                </div>
                <div class="input-field col s12 m4 offset-m4">
                    <select class="" multiple>
                        <option value="" disabled selected>Choose the toppings</option>
                        <option value="1">Option 1</option>
                        <option value="2">Option 2</option>
                        <option value="3">Option 3</option>
                    </select>
                    <!--<label class="white-text">Crust</label>-->
                </div>
            </div>
            <div class="row">
                <div class="btn-new-order">
                    <input type="submit" class="hoverable col s12 m4 btn offset-m4 grey darken-2" value="Order custom Pizza">
                </div>
            </div>
        </form>
    </div>
    <!--<div class="container">-->
    <!--</div>-->
</div>





<script>
    $(document).ready(function(){
//        $('.parallax').parallax();
        $('select').material_select();
    });
</script>