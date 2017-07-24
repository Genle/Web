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