<!--<div class="new-order">-->
    <!--<img src="/static/img/pizzabg.jpg" alt="" class="responsive-img">-->
<!--</div>-->

<div class="new-order">
    <!--<div id="populate">-->
        <!--<button class="btn" onclick="populateIngredients()">populate</button>-->
    <!--</div>-->
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
        <form id="newPizza" class="col s12 m12">
        </form>
        <!--<button class="btn" onclick="getIngredients();">Get Ingredients</button>-->
    </div>
    <!--<div class="container">-->
    <!--</div>-->
</div>





<script>

 

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

    function createOptions (data) {
        let form = document.getElementById("newPizza");
        let ingredients = JSON.parse(data);
        ingredients = ingredients[0];

        //create div row up
        let divUp = document.createElement('div');
        divUp.className = 'row';

        //select crust type
        let divCrust = document.createElement('div');
        divCrust.className = "input-field col s12 m4";
        let selectCrust = document.createElement('select');
        selectCrust.id = "crust";
        let option = document.createElement('option');
        option.value = 0;
        option.text = "Choose the crust type";
        option.setAttribute('selected','');
        option.setAttribute('disabled','');
        selectCrust.appendChild(option);

        for (let key in ingredients.crust){
            option = document.createElement('option');
            option.value = key+1;
            option.text = ingredients.crust[key];
            selectCrust.appendChild(option);
        }
        divCrust.appendChild(selectCrust);


        //select sauce type
        let selectSauce = document.createElement('select');
        selectSauce.id = "sauce";
        option = document.createElement('option');
        option.value = 0;
        option.text = "Choose the sauce type";
        option.setAttribute('selected','');
        option.setAttribute('disabled','');
        selectSauce.appendChild(option);

        let divSauce = document.createElement('div');
        divSauce.className = "input-field col s12 m4 offset-m4";
        for (let key in ingredients.sauce){
            option = document.createElement('option');
            option.value = key+1;
            option.text = ingredients.sauce[key];
            selectSauce.appendChild(option);
        }
        divSauce.appendChild(selectSauce);
        divUp.appendChild(divCrust);
        divUp.appendChild(divSauce);
        form.appendChild(divUp);

        //create div row down
        let divDown = document.createElement('div');
        divDown.className = 'row';


        //select toppings
        let selectToppings = document.createElement('select');
        selectToppings.id = "toppings";
        selectToppings.setAttribute('multiple', '');
        option = document.createElement('option');
        option.value = 0;
        option.text = "Choose the toppings type";
        option.setAttribute('selected','');
        option.setAttribute('disabled','');
        selectToppings.appendChild(option);

        let divToppings = document.createElement('div');
        divToppings.className = 'input-field col s12 m4';
        for (let key in ingredients.toppings){
            option = document.createElement('option');
            option.value = key+1;
            option.text = ingredients.toppings[key];
            selectToppings.appendChild(option);
        }

        divToppings.appendChild(selectToppings);

        //select cheese
        let selectCheese = document.createElement('select');
        selectCheese.id = "cheese";
        selectCheese.setAttribute('multiple', '');
        option = document.createElement('option');
        option.value = 0;
        option.text = "Choose the cheese type";
        option.setAttribute('selected','');
        option.setAttribute('disabled','');
        selectCheese.appendChild(option);

        let divCheese = document.createElement('div');
        divCheese.className = 'input-field col s12 m4 offset-m4';
        for (let key in ingredients.cheese){
            option = document.createElement('option');
            option.value = key+1;
            option.text = ingredients.cheese[key];
            selectCheese.appendChild(option);
        }
        divCheese.appendChild(selectCheese);

        //create button order new custom pizza
        let divBtnRow = document.createElement('div');
        divBtnRow.className = 'row';

        let divBtn = document.createElement('div');
        divBtn.className = 'btn-new-order';

        let inputbtn = document.createElement('input');
        inputbtn.type = "submit";
        inputbtn.className = 'hoverable col s12 m4 btn offset-m4 red darken-2';
        inputbtn.value = 'Order custom Pizza';

        divBtn.appendChild(inputbtn);
        divBtnRow.appendChild(divBtn);




        divDown.appendChild(divToppings);
        divDown.appendChild(divCheese);
        form.appendChild(divDown);
        form.appendChild(divBtnRow);
        console.log(form);

        $(document).ready(function(){
            $('select').material_select();
        });



    }

    function getIngredients(){
        let ajax = new XMLHttpRequest();

        ajax.onreadystatechange = function(){
            if(ajax.readyState === XMLHttpRequest.DONE && ajax.status === 200) {
                // data = JSON.parse(ajax.responseText);
                console.log(ajax.responseText);
                createOptions(ajax.responseText);

            }
        }
        ajax.open("GET", "http://localhost:9876/api/ingredients");
        ajax.send();
    }

    getIngredients();


</script>