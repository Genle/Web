(function () {
    let express = require('express');
    let handlebar = require('express-handlebars');
    let helpers = require('./lib/helpers');
    let app = express();
    let db = require("./db");

   

    app.use('/static', express.static('public')); 
    app.engine('.hb', handlebar({defaultLayout: 'main',
                                extname: '.hb',
                                layoutsDir:__dirname + '/views/layouts',
                                partialsDir:__dirname + '/views/partials',
                                helpers: helpers }));
    app.set('view engine', '.hb');



    app.get('/', (req, res) => {
        res.render('pizza');
    });

    app.get('/about', (req,res) => {
        res.render('about');
    });

    app.get('/events', (req, res) => {
        res.sendFile(__dirname + '/views/events.html');
    });

    app.get('/pizza', (req,res) => {

    });

    app.get('/deals', (req,res)=>{

    });

    app.get('/re-order', (req,res) => {

    });

    app.get('/new-order', (req,res) => {

    });

    app.get('/signup', (req,res)=>{
        res.render('signup');
    });

    app.get('/login', (req,res)=>{
        res.render('login');
    });

    app.get('/api/create/user', (req, res)=>{

    })

    app.get('/ingredient', (req, res) => {
        console.log("hello");
        console.log(users);
        // res.send(users);
     
    });

    let port = 9876; //process.env.PORT ||

    app.listen(port, () => {
        console.log("App is listening to port 9876");
    });

} () )
