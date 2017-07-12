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

        for(let i=0; i<deals.length; i++){
            let elem = createDealInfo(deals[i]);
            container.appendChild(elem);
        }
    }

    function createDealInfo (deal) {

        let outterDiv = document.createElement('div');
        outterDiv.className = 'row';

        let span = document.createElement('span');
        span.innerHTML = deal.price;
//       span.innerHTML = deal.price;

        let h5 = document.createElement('h5');
        h5.className = 'center-align';
        h5.innerHTML = 'test ';
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
        divMain.appendChild(divFirstRow);
        divMain.appendChild(divSecondRow);

        outterDiv.appendChild(divMain);

        return outterDiv;
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

    getPreMadePizzas();


</script>
