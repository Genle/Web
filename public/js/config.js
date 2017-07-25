let config = {};
config['environment'] = 'dev';
config['type'] = 'static';
config['materialize'] = {
    'dynamic': {
        cssSrc: 'https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/css/materialize.min.css',
        jsSrc: 'https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/js/materialize.min.js',
        fontSrc: 'https://fonts.googleapis.com/icon?family=Material+Icons'
    },
    'static': {
        cssSrc: '/static/css/materialize.min.css',
        jsSrc: '/static/js/materialize.min.js',
        fontSrc: 'https://fonts.googleapis.com/icon?family=Material+Icons'
    }
};


config['jquery'] = {
    'dynamic': {
        src: 'https://code.jquery.com/jquery-3.2.1.min.js',
        integrity: 'sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=',
        crossorigin: 'anonymous'
    },
    'static': {
        src: '/static/js/jquery.min.js'
    }
};


config['env'] = {
    dev: {
        baseUrl: 'http://localhost:9876',
        home: '/',
        deals: '/deals',
        reorder: '/re-order',
        neworder: '/new-order',
        login: '/login',
        signup: '/signup',
        custom: '/static/css/custom.css',
        mainJs: '/static/js/main.js',
        reorderJs: '/static/js/reorder.js',
        neworderJs: '/static/js/neworder.js',
        dealsJs: '/static/js/deals.js',
        pizzaJs: '/static/js/pizza.js',
        loginJs: '/static/js/login.js',
        signupJs: '/static/js/signup.js'


    },
    prod: {
        baseUrl: '45.55.65.103/joseph',
        home: '/',
        deals: 'deals',
        reorder: 're-order',
        neworder: 'new-order',
        login: 'login',
        signup: 'signup',
        custom: 'static/css/custom.css',
        mainJs: 'static/js/main.js',
        reorderJs: 'static/js/reorder.js',
        neworderJs: 'static/js/neworder.js',
        dealsJs: 'static/js/deals.js',
        pizzaJs: 'static/js/pizza.js',
        loginJs: 'static/js/login.js',
        signupJs: 'static/js/signup.js'

    }
}

let environment = config.environment;

// module.exports = config;