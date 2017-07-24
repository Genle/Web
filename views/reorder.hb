
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
                    </tr>
                {{/each}}
            {{/if}}
            </tbody>
        </table>
    </div>
    </div>

</div>



 {{getScript "reorder"}} 