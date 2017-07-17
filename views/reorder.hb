<div class="re-order">
    <div class="container">
        <div class="row reorder-title">
            <div class="col s12 m12 red darken-2 white-text">
                <h5>Your orders</h5>
            </div>
        </div>
        <table class="striped">
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
                        {{#if delay}}
                                <td><button class="btn red darken-2 white-text hoverable">Cancel</button></td>
                        {{else}}
                                <td><button class="btn red darken-2 white-text hoverable" disabled >Cancel</button></td>
                        {{/if}}
                    </tr>
                {{/each}}
            {{/if}}
            </tbody>
        </table>
        {{delay}}
    </div>

</div>