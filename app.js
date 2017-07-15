(function() {
    const express = require('express');
    const handlebar = require('express-handlebars');
    const helpers = require('./lib/helpers');
    const bodyParser = require('body-parser');
    const bcrypt = require('bcrypt');
    const morgan = require('morgan');
    const app = express();
    const db = require("./db");
    require('dotenv').config();


    app.use(bodyParser.json()); // support json encoded bodies
    app.use(bodyParser.urlencoded({
        extended: true
    })); // support encoded bodies

    app.set('supersecret', process.env.SECRET);
    app.use(morgan('dev'));



    app.use('/static', express.static('public'));
    app.engine('.hb', handlebar({
        defaultLayout: 'main',
        extname: '.hb',
        layoutsDir: __dirname + '/views/layouts',
        partialsDir: __dirname + '/views/partials',
        helpers: helpers
    }));
    app.set('view engine', '.hb');



    app.get('/', (req, res) => {
        res.render('pizza');
    });

    app.get('/about', (req, res) => {
        res.render('about');
    });

    app.get('/events', (req, res) => {
        res.sendFile(__dirname + '/views/events.html');
    });


    app.get('/deals', (req, res) => {
        res.render('deals');
    });

    app.get('/re-order', (req, res) => {
        res.render('reorder');
    });

    app.get('/new-order', (req, res) => {
        res.render('neworder');
    });

    app.get('/signup', (req, res) => {
        res.render('signup');
    });

    app.get('/login', (req, res) => {
        res.render('login');
    });

    app.post('/api/create/user', (req, res) => {
        console.log("email of body: ", req.body.email);
        console.log("email of password: ", req.body.password);

        let saveUser = db.createUser(req.body.email, req.body.password );
        saveUser.then(
            function (message) {
                res.send(message);
            }
        ).catch(
            function (err) {
                res.send(err);
            }
        );

    });

    app.post('/api/login', (req, res) => {
        let login = db.checkLoginInfo(req.body.email, req.body.password);


        login.then(
            function (message) {
                res.send(message);
            }
        ).catch(function (err) {
            res.send(err);
        })

    });

    app.post('/api/create/pizza', (req,res)=>{
        let newPizza = {
            url: req.body.url,
            title: req.body.title,
            description: [], //not yet found
            price: req.body.price,
            type: 1
        };

        let pizza = db.createPizza(newPizza);

        pizza.then(
            function(message){
                res.send(message);
            }
        ).catch(function(err) {
            res.send(err);
        });
    });

    app.get('/pizzas', (req,res)=>{
        let desc = "Champignon Peperonni Cheese anana";
        let newPizza = {
            url: "https://cdn.pixabay.com/photo/2016/04/09/09/22/pizza-1317699_960_720.jpg",
            title: "Pizza Slice",
            description: desc.split(" "), //not yet found
            price: 10,
            type: 0
        };

        let pizza = db.createPizza(newPizza);

        pizza.then(
            function(message){
                console.log(message);
            }
        ).catch(function(err) {
            console.log(err);
        });

        res.send("OK");
    });

    app.get('/api/premade/pizzas', (req,res)=>{
        let pizzas = db.getPreMadePizza();
        pizzas.then(function(data){
            res.send(data);
        }).catch(function(err){
            res.send(err);
        })
    });

    app.post('/api/populate/ingredients', (req, res)=>{
        // console.log(req.body);
        if(req.body){
            let ingredients = {
            crust:req.body.crust.split("."),
            sauce:req.body.sauce.split("."),
            toppings: req.body.toppings.split("."),
            cheese: req.body.cheese.split(".")

            }

            let result = db.populateIngredients(ingredients);

            result.then(
                function(data){
                    res.send(data);
                }
            ).catch(
                function(err){
                    res.send(err);
                }
            )
        }else{
            res.send({"message":"missing  parameter"});
        }
    });

    // app.get('/ingredient', (req, res) => {
    //     console.log("hello");
    //     console.log(users);
    //     // res.send(users);
    //
    // });

    let port = 9876; //process.env.PORT ||

    app.listen(port, () => {
        console.log("App is listening to port 9876");
    });

}());