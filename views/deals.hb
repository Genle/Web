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

       for(let i=0; i<deals.length; i++){
           let elem = createDealInfo(deals[i]);
           container.appendChild(elem);
       }
   }

   function createDealInfo (deal) {

       let outterDiv = document.createElement('div')
       outterDiv.className = 'row';

       let span = document.createElement('span');
       span.innerHTML = 5;
//       span.innerHTML = deal.price;

       let h5 = document.createElement('h5');
       h5.className = 'center-align';
       h5.innerHTML = 'test';
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





</script>