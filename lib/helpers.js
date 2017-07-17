let Handlebars = require('handlebars');
let config = require('./../config');


let environment = config.environement;
exports.test = function () {
    // console.log("Hello from test");
    let includeFile = `<link rel="stylesheet" href=${config['env'][environment]['custom']}>
                        <link rel="stylesheet" href=${config['materialize']['cssSrc']}>
                        <link href=${config['materialize']['fontSrc']} rel="stylesheet">
                        <script src=${config['jquery']['src']} integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
                        <script src=${config['materialize']['jsSrc']}></script>`
    return  new Handlebars.SafeString(includeFile);
};

exports.getDateFormat = (dateStr) => {

    let d = new Date(dateStr);
    let date = d.getDate() + "/" + d.getMonth() + "/" + d.getFullYear() + " - " + d.getHours() +"h"+d.getMinutes()+"m"+d.getSeconds()+"s";

    return new Handlebars.SafeString(date);
};


exports.getString = (description) => {
    let desc = "";
    for(let index in description){
        // console.log('index: ', description[index]);
        desc += description[index] + " ";
    }
    return new Handlebars.SafeString(desc);
};

exports.navigation = () => {
    let nav = `
     <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
        <ul id="nav-mobile" class="left hide-on-med-and-down">
            <li><a href=${config['env'][environment]['home']}>Pizza</a></li>
            <li><a href=${config['env'][environment]['deals']}>Deals</a></li>
            <li><a href=${config['env'][environment]['reorder']}>Re-Order</a></li>
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
            <li><a class="white-text" href=${config['env'][environment]['reorder']}>Re-Order</a></li>
            <li><a class="white-text" href=${config['env'][environment]['neworder']}>New Order</a></li>
            <li><a class="white-text" href=${config['env'][environment]['signup']}>SignUp</a></li>
        </ul>`;

    return new Handlebars.SafeString(nav);
}




