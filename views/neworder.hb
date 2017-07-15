<!--<div class="new-order">-->
    <!--<img src="/static/img/pizzabg.jpg" alt="" class="responsive-img">-->
<!--</div>-->

<div class="new-order">
    <div id="populate">
        <button class="btn" onclick="populateIngredients()">populate</button>
    </div>
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
                        <option value="1">Thin Crust</option>
                        <option value="2">Thick Crust</option>
                        <option value="3">Flatbread Crust</option>
                        <option value="3">Focacciat</option>
                    </select>
                    <!--<label class="white-text">Crust</label>-->
                </div>
                <div class="input-field col s12 m4 offset-m4">
                    <select class="">
                        <option value="" disabled selected>Choose the sauce</option>
                        <option value="1">Pesto</option>
                        <option value="2">Bechamel</option>
                        <option value="3">Salsa</option>
                        <option value="4">BBQ Sauce</option>
                        <option value="5">Hummus</option>
                        <option value="6">Pumpkin Pizza Sauce</option>
                        <option value="7">Pumpkin and Beet "Marinara"</option>
                        <option value="8">Tapenade</option>
                        <option value="9">Carrot-Harissa Sauce</option>

                    </select>
                    <!--<label class="white-text">Crust</label>-->
                </div>

            </div>
            <div class="row">
                <div class="input-field col s12 m4">
                    <select class="" multiple>
                        <option value="" disabled selected>Choose the toppings</option>
                        <option value="1">Anchovies</option>
                        <option value="2">Onions</option>
                        <option value="3">Pepperoni</option>
                        <option value="4">Beef</option>
                        <option value="5">Peppers</option>
                        <option value="6">Bacon</option>
                        <option value="7">Pesto</option>
                        <option value="8">olives</option>
                        <option value="9">Black </option>
                        <option value="10">Pineapple</option>
                        <option value="11">Chicken</option>
                        <option value="12">Extra cheese</option>
                        <option value="13">Sausage</option>
                        <option value="14">Spinach</option>
                        <option value="15">Ham</option>
                        <option value="16">Mushrooms</option>
                    </select>

                    	
	

	
	


                    <!--<label class="white-text">Crust</label>-->
                </div>
                <div class="input-field col s12 m4 offset-m4">
                    <select class="" multiple>
                        <option value="" disabled selected>Choose the cheese</option>
                        <option value="1">Mozzarella</option>
                        <option value="2">Provolone</option>
                        <option value="3">Cheddar</option>
                        <option value="4">Gouda</option>
                        <option value="5">Goat</option>
                        <option value="6">Gruyere</option>
                        <option value="7">Ricotta</option>
                    </select>
                    <!--<label class="white-text">Crust</label>-->
                </div>
            </div>
            <div class="row">
                <div class="btn-new-order">
                    <input type="submit" class="hoverable col s12 m4 btn offset-m4 red darken-2 " value="Order custom Pizza"> <!--grey darken-2-->
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

 

    let params = `crust=Thin.Flatbread.Focacciat.Thick&sauce=Pesto.Bechamel.Salsa.BBQ Sauce.Hummus.Pumpkin Pizza Sauce.Pumpkin and Beet "Marinara".Tapenade.Carrot-Harissa Sauce&toppings=Anchovies.Onions.Pepperoni.Beef.Peppers.Bacon.Pesto.olives.Black.Pineapple.Chicken.Extra cheese.Sausage.Spinach.Ham.Mushrooms&cheese=Mozzarella.Provolone.Cheddar.Gouda.Goat.Gruyere.Ricotta`;

    function populateIngredients(){
        let ajax = new XMLHttpRequest();

        ajax.onreadystatechange = function(){
             if(ajax.readyState === XMLHttpRequest.DONE && ajax.status === 200) {
                // data = JSON.parse(ajax.responseText);
                console.log(ajax.responseText);

            }
        }
        ajax.open("POST", "http://localhost:9876/api/populate/ingredients", true);

        ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        console.log(params);
        ajax.send(params);
    }


</script>