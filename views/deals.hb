<div class="deals">
    <div id="content" class="container">
        <div class="row deals-tile">
            <div class="col s12 m12 red darken-2">
                <h5 class="white-text">Pizza Deals</h5>
            </div>
        </div>

    </div>
</div>


<script>
    function addDeals (deals) {
        let container = document.getElementById("content");
        let outterDiv = document.createElement('div');
        outterDiv.className = 'row';

        for(let i=0; i<deals.length; i++){
            let elem = createDealInfo(deals[i]);
            if( i%3 == 0 && i!=0){
                container.appendChild(outterDiv);
                outterDiv = document.createElement('div');
                outterDiv.className = 'row';
                outterDiv.appendChild(elem);

            }else{
                outterDiv.appendChild(elem);

            }

        }

        container.appendChild(outterDiv);
    }


    function createDealInfo (deal) {

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
        divMain.appendChild(divFirstRow);
        divMain.appendChild(divSecondRow);

        let button = document.createElement('button');
        button.className = "btn red darken-2 col s12 m12";
        button.innerHTML = "Order";
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

    getPreMadePizzas();




</script>