let Handlebars = require('handlebars');
let config = require('./../config');

{ /* <link href=${config['materialize']['fontSrc']} rel="stylesheet"> */ }
// integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"

let environment = config.environment;
let type = config.type;

exports.headerLink = function() {
    let includeFile = `<link rel="stylesheet" href=${config['env'][environment]['custom']}>
                        <link rel="stylesheet" href=${config['materialize'][type]['cssSrc']}>
                        <link href=${config['materialize'][type]['fontSrc']} rel="stylesheet"> 
                        <script type="text/javascript" src=${config['env'][environment]['config']}></script>
                        <script src=${config['jquery'][type]['src']}></script>
                        <script src=${config['materialize'][type]['jsSrc']}></script>`
    return new Handlebars.SafeString(includeFile);
};

exports.getDateFormat = (dateStr) => {

    let d = new Date(dateStr);
    let date = d.getDate() + "/" + d.getMonth() + "/" + d.getFullYear() + " - " + d.getHours() + "h" + d.getMinutes() + "m" + d.getSeconds() + "s";

    return new Handlebars.SafeString(date);
};


exports.getString = (description) => {
    console.log('description from getString in helper:', description);
    let desc = "";
    console.log('description size: ', description.size)
    if (description.size) {
        desc = description.size + "-";
    }
    desc += description.crust + "-" + description.sauce + "-" + description.toppings + "-" + description.cheese;

    return new Handlebars.SafeString(desc);
};

exports.navigation = () => {
    let nav = `
     <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
        <ul id="nav-mobile" class="left hide-on-med-and-down">
            <li><a href=${config['env'][environment]['home']}>Pizza</a></li>
            <li><a href=${config['env'][environment]['deals']}>Deals</a></li>
            <li><a id="reorder"  href=${config['env'][environment]['reorder']}>Re-Order</a></li>
            <li><a href=${config['env'][environment]['neworder']}>New Order</a></li>
        </ul>
        <ul class="nav-mobile right hide-on-med-and-down">
            <li><a href=${config['env'][environment]['login']}>Login</a></li>
            <li><a href=${config['env'][environment]['signup']}>SignUp</a></li>
        </ul>
         <ul class="side-nav red darken-2 center-align" id="mobile-demo">
            <li class="white-text center-align">Menu</li>
            <div class="divider"></div>
            <li><a class="white-text" href=${config['env'][environment]['login']}>Login</a></li>
            <li><a class="white-text" href=${config['env'][environment]['home']}>Pizza</a></li>
            <li><a class="white-text" href=${config['env'][environment]['deals']}>Deals</a></li>
            <li><a id="reorder"  class="white-text" href=${config['env'][environment]['reorder']}>Re-Order</a></li>
            <li><a class="white-text" href=${config['env'][environment]['neworder']}>New Order</a></li>
            <li><a class="white-text" href=${config['env'][environment]['signup']}>SignUp</a></li>
        </ul>`;

    return new Handlebars.SafeString(nav);
}


exports.print = (obj) => {
    for (let i in obj) {
        console.log("value i: ", i);
    }
}


exports.tableBtn = (dateStr, index) => {
    console.log('index is: ', index);
    let buttons = "";
    var startDate = new Date(dateStr);
    // Do your operations
    var endDate = new Date();
    var seconds = (endDate.getTime() - startDate.getTime()) / 1000;
    console.log("Number of seconds: ", seconds, "logincal: ", seconds < 120);
    if (seconds < 120) {
        buttons = `<td>
                    <button id="${index}-reorder" onclick="orderPizza(this.id)" class="btn red darken-2 white-text hoverable">Re-order</button>
                    <button id="${index}-cancel" class="btn red darken-2 white-text hoverable">Cancel</button>
                    </td>`;
    } else {
        buttons = `<td>
                    <button id="${index}-reorder" onclick="orderPizza(this.id)" class="btn red darken-2 white-text hoverable">Re-order</button>
                    <button id="${index}-cancel" disabled  class="btn red darken-2 white-text hoverable">Cancel</button>
                    </td>`;
    }
    return new Handlebars.SafeString(buttons);
}


exports.getScript = (page) => {
    console.log("page from get script", page);
    let script = "";
    console.log("mwen nan get script");
    switch (page) {
        case "reorder":
            script = buildScriptTag("reorderJs");
            break;
        case "main":
            script = buildScriptTag("mainJs");
            break;
        case "neworder":
            script = buildScriptTag("neworderJs");
            break;
        case "deals":
            script = buildScriptTag("dealsJs");
            break;
        case "pizza":
            script = buildScriptTag("pizzaJs");
            break;
        case "login":
            script = buildScriptTag("loginJs");
            break;


        default:
            break;
    }

    return new Handlebars.SafeString(script);
}




function buildScriptTag(name) {
    return `<script src=${config['env'][environment][name]}></script>`;
}
