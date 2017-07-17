let config = {};
config['environement'] = 'dev';
config['materialize'] = {
    cssSrc: 'https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/css/materialize.min.css',
    jsSrc: 'https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/js/materialize.min.js',
    fontSrc: 'https://fonts.googleapis.com/icon?family=Material+Icons'
};

config['jquery'] = {
    src: 'https://code.jquery.com/jquery-3.2.1.min.js',
    integrity:'sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=',
    crossorigin: 'anonymous'
};



config['env'] ={
    dev:{
        baseUrl:'http://localhost:9876',
        home:'/',
        deals:'/deals',
        reorder:'/re-order',
        neworder: '/new-order',
        login:'/login',
        signup:'/signup',
        custom: '/static/css/custom.css'

    },
    prod:{
        baseUrl:'45.55.65.103/joseph',
        home:'/',
        deals:'deals',
        reorder:'re-order',
        neworder: 'new-order',
        login:'login',
        signup:'signup',
        custom: 'static/css/custom.css'
    }
}

module.exports = config;