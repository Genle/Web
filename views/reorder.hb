<div class="re-order">
    <div class="row">
    <div class="col s12 m10 offset-m1">
        <div class="row reorder-title">
            <div class="col s12 m12 red darken-2 white-text">
                <h5>Your orders</h5>
            </div>
        </div>
        <table id="reOrderTable" class="striped responsive-table">
            <thead>
            <tr>
                <td>Title</td>
                <td>Description</td>
                <td>Price</td>
                <td>Status</td>
                <td>Date</td>
                <td>Action</td>
            </tr>
            </thead>
            <tbody>
            {{#if data}}
                {{#each data}}
                    {{#each this.pizzas}}
                        <tr>
                            <td>{{this.title}}</td>
                            <td>{{getString this.description}}</td>
                            <td>{{this.price}}</td>
                            <td>{{this.status}}</td>
                    {{/each}}
                        <td>{{getDateFormat this.date}}</td>
                            {{tableBtn this.date}}                        
                        {{!-- {{#each this.pizzas}}
                            {{tableBtn this.status}}
                        {{/each}} --}}
                    </tr>
                {{/each}}
            {{/if}}
            </tbody>
        </table>
    </div>
    </div>

</div>


<script>
    function count(){
        let ajax = new XMLHttpRequest();

        ajax.onreadystatechange = function(){
            if(ajax.readyState === XMLHttpRequest.DONE && ajax.status === 200) {
                data = JSON.parse(ajax.responseText);
                console.log(ajax.responseText);
                if(data.message == "done"){
                    return "disable";
                }
                
            }
        }
        let url = "http://localhost:9876/api/count/" + getRandomArbitrary(0,2);
        ajax.open("GET", url );
        ajax.send();
    }

    function getRandomArbitrary(min, max) {
        return Math.random() * (max - min) + min;
    }

    function checkTable() {
        let table = document.getElementById('reOrderTable');
        let tbodyChildren = table.getElementsByTagName("tbody")[0].children;
        
        let index = 0;
        while(index < tbodyChildren.length){
            console.log("content and index: ", tbodyChildren[index], " :: ", index);
            {{!-- let buttons = tbodyChildren[index].getElementsByTagName('button');
            for (let i=0; i<buttons.length; i++){
                if (buttons[i].)
            } --}}
            if(tbodyChildren.length > 5){
                if(index == 4)
                    break;
            }
            index++;
        }
        {{!-- let i = 1;
        while(row=table.rows[i++]){
            console.log("index: ", i);
            console.log('row in table: ', row );
            let j = 0;
            while(cell= row.cells[j++]){
                console.log("cell in row table: ", cell.innerHTML, " of index ", j);
            }
        } --}}

    }

    checkTable();


   
</script>