<div class="container">
    <div id="content" class="pizza">
        <div class="row deals-tile">
            <div class="col s12 m12 red darken-2">
                <h5 class="white-text">Pizzas</h5>
            </div>
        </div>

        <div class="row">
            <div class="col s12 m4">
                <div class="row">
                    <img class="col s12 m8 offset-m2"
                         src="https://vignette3.wikia.nocookie.net/teenage-mutant-ninja-turtles-2012-series/images/f/fd/Pizza_trad_pepperoni.png/revision/latest?cb=20161106191944">
                </div>
                <div class="row">
                    <div class="col s12 m12">
                        <h5 class="center-align">Pizza peperroni</h5>
                        <p class="center-align">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                            exercitation ullamco laboris nisi </p>
                        <button class="btn red darken-2 col s12 m12">Order</button>
                    </div>
                </div>
            </div>
            <div class="col s12 m4">
                <div class="row">
                    <img class="col s12 m8 offset-m2"
                         src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPDqhXVbS3q1_T56W7VC61GvwzJg6oTJQA2gLtiOe8O6Tdf3xv">
                </div>
                <div class="row">
                    <div class="col s12 m12">
                        <h5 class="center-align">Pizza peperroni</h5>
                        <p class="center-align">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                            exercitation ullamco laboris nisi</p>
                        <button class="btn red darken-2 col s12 m12">Order</button>
                    </div>
                </div>
            </div>
            <div class="col s12 m4">
                <div class="row">
                    <img class="col s12 m8 offset-m2"
                         src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPDqhXVbS3q1_T56W7VC61GvwzJg6oTJQA2gLtiOe8O6Tdf3xv">
                </div>
                <div class="row">
                    <div class="col s12 m12">
                        <h5 class="center-align">Pizza peperroni</h5>
                        <p class="center-align">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                            exercitation ullamco laboris nisi </p>
                        <button class="btn red darken-2 col s12 m12">Order</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col s12 m4">
                <div class="row">
                    <img class="col s12 m8 offset-m2"
                         src="https://vignette3.wikia.nocookie.net/teenage-mutant-ninja-turtles-2012-series/images/f/fd/Pizza_trad_pepperoni.png/revision/latest?cb=20161106191944">
                </div>
                <div class="row">
                    <div class="col s12 m12">
                        <h5 class="center-align">Pizza peperroni</h5>
                        <p class="center-align">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                            exercitation ullamco laboris nisi </p>
                        <button class="btn red darken-2 col s12 m12">Order</button>
                    </div>
                </div>
            </div>
            <div class="col s12 m4">
                <div class="row">
                    <img class="col s12 m8 offset-m2"
                         src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPDqhXVbS3q1_T56W7VC61GvwzJg6oTJQA2gLtiOe8O6Tdf3xv">
                </div>
                <div class="row">
                    <div class="col s12 m12">
                        <h5 class="center-align">Pizza peperroni</h5>
                        <p class="center-align">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                            exercitation ullamco laboris nisi</p>
                        <button class="btn red darken-2 col s12 m12">Order</button>
                    </div>
                </div>
            </div>
            <div class="col s12 m4">
                <div class="row">
                    <img class="col s12 m8 offset-m2"
                         src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPDqhXVbS3q1_T56W7VC61GvwzJg6oTJQA2gLtiOe8O6Tdf3xv">
                </div>
                <div class="row">
                    <div class="col s12 m12">
                        <h5 class="center-align">Pizza peperroni</h5>
                        <p class="center-align">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                            exercitation ullamco laboris nisi </p>
                        <button class="btn red darken-2 col s12 m12">Order</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script>
    function addDeals (deals) {
        let container = document.getElementById("content");
        let outterDiv = document.createElement('div');
        outterDiv.className = 'row';

        let counter = 0;
        let id = "id"
        for(let i=0; i<deals.length; i++){
            let elem = createDealInfo(deals[i], id+counter );
            if( i%3 == 0 && i!=0){
                container.appendChild(outterDiv);
                outterDiv = document.createElement('div');
                outterDiv.className = 'row';
                outterDiv.appendChild(elem);

            }else{
                outterDiv.appendChild(elem);

            }
            counter++;

        }

        container.appendChild(outterDiv);
    }

    function createDealInfo (deal, id) {

        let span = document.createElement('span');
        span.innerHTML = deal.price;
//       span.innerHTML = deal.price;

        let h5 = document.createElement('h5');
        h5.className = 'center-align';
        h5.innerHTML = deal.title+ " ";
//       h5.innerHTML = deal.title;

        h5.appendChild(span);

        let p = document.createElement('p');
        p.className = 'center-align';
        p.innerHTML = "";
        for(let i=0; i<deal.description.length; i++){
            p.innerHTML += " "+deal.description[i];
        }

        let divInfo = document.createElement('div');
        divInfo.className = 'col s12 m12';
        divInfo.appendChild(h5);
        divInfo.appendChild(p);

        let divSecondRow = document.createElement('div');
        divSecondRow.className = 'row';
        divSecondRow.appendChild(divInfo);

        let img = document.createElement('img');
        img.className = 'col s12 m8 offset-m2';
        img.src = deal.url;

        let divFirstRow = document.createElement('div');
        divFirstRow.className = 'row';
        divFirstRow.appendChild(img);

        let divMain = document.createElement('div');
        divMain.className = 'col s12 m4';
        console.log(id);
        divMain.id = id;
        divMain.appendChild(divFirstRow);
        divMain.appendChild(divSecondRow);

        let button = document.createElement('button');
        button.className = "btn red darken-2 col s12 m12";
        button.innerHTML = "Order";
        button.onclick = orderPizza;
        divMain.appendChild(button);

//        outterDiv.appendChild(divMain);

        return divMain;
    }


    function getPreMadePizzas(){
        let ajax = new XMLHttpRequest();
        ajax.onreadystatechange = function () {
            if(ajax.readyState === XMLHttpRequest.DONE && ajax.status === 200) {
                data = JSON.parse(ajax.responseText);
                addDeals(data);

            }
        };
        ajax.open("GET", "http://localhost:9876/api/premade/pizzas", true);

//        ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        ajax.send();
    }

    function getOrderInfo () {
        let mainDiv = document.getElementById('id0');
        let elements = mainDiv.getElementsByClassName('center-align');
        let titleAndPrice = null;
        let description = null;
        for(let i=0;i<elements.length;i++){
            if(elements[i].tagName == 'H5'){
                titleAndPrice = separateTitleToPrice(elements[i].innerText);
            }else{
                description = elements[i].innerText;
            }
        }

        return {title:titleAndPrice[0], price:titleAndPrice[1], description:description};

    }

    function separateTitleToPrice(element){
        let titleAndPrice = element.split(" ");
        let result = "";
        let length = titleAndPrice.length;
        for (key in titleAndPrice){
            if(key != (length-1)){
                console.log("key: ",key);
                if(key < length-2){
                    result += titleAndPrice[key] + " ";
                }else{
                    result += titleAndPrice[key];
                }
            }
        }

        return [result, titleAndPrice[length-1]]

    }

    function orderPizza () {
        let orderInfo = getOrderInfo();

        //check if he is logged in
            //if he is send him to checkout

            //if he is not save object to localstorage and send him to log in page

        let xhttp = new XMLHttpRequest();


    }

    getPreMadePizzas();




</script>
