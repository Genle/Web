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

{{getScript "neworder"}}