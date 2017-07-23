<!--<div class="new-order">-->
    <!--<img src="/static/img/pizzabg.jpg" alt="" class="responsive-img">-->
<!--</div>-->

<div class="new-order">
    <!--<div id="populate">-->
        <!--<button class="btn" onclick="populateIngredients()">populate</button>-->
    <!--</div>-->
    {{!-- <div class="valign-wrapper">
         <img class="parallax-like-pic" width="300" height="300" src="/static/img/pepperoni.png" alt=""> 
    </div> --}}
    {{!-- <div class="row">
        <img class="bgpizza" src="/static/img/bgpizza.jpg" alt="" width="100%" height="74%">
    </div> --}}
    {{!-- <div class="row">
        <h5 class="white-text">Create your custom pizza from different ingredients</h5>
    </div> --}}
    
    <div class="row">

    <div class="col s12 m4 white-text">
        <div class="row" >
            <div class="col s12 m12" >
                <h5 class="center-align">Create your own pizza</h5>
            </div>
        </div>
        {{#if newData}}        
            <form id="newPizza" class="col s12 m12"> 
                <div class="row">
                    <div class="input-field col s12 m12">
                        <input type="text" name="pizzaTitle" id="pizzaTitle">
                        <label for="pizza-title">Name your pizza</label>
                    </div>
                </div>
                {{#each newData}}
                    {{#if this}}
                        <div class="row">
                            <div class="input-field col s12 m12">
                                <select name="size" id="size">
                                    <option>Choose your pizza size.</option>
                                    {{#each this.size}}
                                        <option value="{{@index}}">{{this}}</option>
                                    {{/each}}
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m12">
                                <select name="crust" id="crust">
                                    <option selected disabled>Choose your crust.</option>
                                    {{#each this.crust}}
                                        <option value="{{@index}}">{{this}}</option>
                                    {{/each}}
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m12">
                                <select name="sauce" id="sauce">
                                    <option selected disabled>Choose your sauce.</option>
                                    {{#each this.sauce}}
                                        <option value="{{@index}}">{{this}}</option>
                                    {{/each}}
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m12">
                                <select name="toppings" id="toppings">
                                    <option selected disabled>Choose your toppings.</option>
                                    {{#each this.toppings}}
                                        <option value="{{@index}}">{{this}}</option>
                                    {{/each}}
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m12">
                                <select name="cheese" id="cheese">
                                    <option selected disabled>Choose your cheese.</option>
                                    {{#each this.cheese}}
                                        <option value="{{@index}}">{{this}}</option>
                                    {{/each}}
                                </select>
                            </div>
                        </div>
                    {{/if}}
                {{/each}}
                <div class="row">
                    <input id="form-submit" class="custom-btn btn col s12 m12 red darken-2" onclick="orderCustomPizza()" type="submit" name="custom" value="Order custom pizza">
                </div>
            </form>
            {{!-- <button class="btn" onclick="getOrderInfo();">Get Order info</button> --}}
        {{/if}}
    </div>
    </div>
    
</div>


<script>

    (function preventFormRefresh () {
        document.getElementById('form-submit').addEventListener('click', function(event){
            event.preventDefault();
        });
    }());

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

     


    
    //order custom pizza made

    function getOrderInfo () {
        let selects = document.getElementsByTagName('select');
        let form = document.getElementById('newPizza');
        let title = form.pizzaTitle.value;
        let description = "{";

        for(let key=0; key<selects.length; key++){
            if(selects[key].selectedOptions[0].parentNode.id != "toppings" && selects[key].selectedOptions[0].parentNode.id != "cheese"){
               if(selects[key].selectedOptions[0].parentNode.id == 'size'){
                    description += '"size":' + '"' +selects[key].selectedOptions[0].text + '",';
               }else if(selects[key].selectedOptions[0].parentNode.id == 'crust'){
                   description += '"crust":' + '"' +selects[key].selectedOptions[0].text+'",';
               }else if(selects[key].selectedOptions[0].parentNode.id == 'sauce'){
                   description += '"sauce":' + '"' + selects[key].selectedOptions[0].text+'",';
               }
            }
            if(selects[key].selectedOptions[0].parentNode.id == "toppings" ) {
                let options = selects[key].selectedOptions;
                description += '"toppings":[';
                for (let i=0; i<options.length; i++){
                    if(i == options.length-1){
                        description += '"' + options[i].text + '"';
                    }else{
                        description += '"' + options[i].text + '",';
                    }
                }
                description += '],';
            }else if(selects[key].selectedOptions[0].parentNode.id == "cheese"){
                    let options = selects[key].selectedOptions;
                     description += '"cheese":[';
                    for (let i=0; i<options.length; i++){
                        if(i == options.length-1){
                            description += '"' + options[i].text + '"';
                        }else{
                            description += '"' + options[i].text + '",';
                        }
                    }
                    description += ']}';
            }
        
        }
        console.log("description: ",description);

        return {title:title, price:10, description:description};

    }

    
    function getIngredients(){
        let ajax = new XMLHttpRequest();

        ajax.onreadystatechange = function(){
            if(ajax.readyState === XMLHttpRequest.DONE && ajax.status === 200) {
                // data = JSON.parse(ajax.responseText);
                // console.log(ajax.responseText);
                createOptions(ajax.responseText);
            }
        }
        ajax.open("GET", "http://localhost:9876/api/ingredients");
        ajax.send();
    }


    function orderCustomPizza () {
        let orderInfo = getOrderInfo();
        //check if he is logged in
        console.log(JSON.stringify(orderInfo));
          if(localStorage.email){

            let ajax = new XMLHttpRequest();
            ajax.onreadystatechange = function(){
                if(ajax.readyState === XMLHttpRequest.DONE && ajax.status === 200) {
                    data = JSON.parse(ajax.responseText);
                    console.log("response data: ", data);
                    if(data.message){
                        window.location.replace("http://localhost:9876/re-order");
                    }
                }
            };

            let params = `title=${orderInfo.title}&description=${orderInfo.description}&price=${orderInfo.price}`;
            ajax.open("POST", "http://localhost:9876/api/create/custom/pizza", true);
            ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            ajax.send(params);
        }else{
            window.localStorage.setItem("object", JSON.stringify(orderInfo));
            window.location.replace("http://localhost:9876/login");
        }  

        //if he is send him to checkout

        //if he is not save object to localstorage and send him to log in page
        return false;

    }

 $(document).ready(function(){
            $('select').material_select();
        });

</script>