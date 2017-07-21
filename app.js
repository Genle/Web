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
        let orders = db.getOrders();
        let delay = 2;
        orders.then(
            function(data){
                let delay = 2;
                res.render('reorder',{data:data,delay:delay});
            }
        ).catch(
            function(err){
                res.render('reorder',{data});
            }
        )

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
            type: 1,
            email:req.body.email
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
        let desc = "Thin Bechamel pepperoni chedar".split(" ");
        let description = {crust:desc[0], sauce:desc[1], toppings:[desc[2]], cheese:[desc[3]]};
        console.log("description from create pizza: ",description);

        let newPizza = {
            url: "data:image/jpeg;base64,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",
            title: "Pizza Pepperoni",
            description: description, //not yet found
            price: 10,
            type: 0,
            status: "In route",
            email:"french@gmail.com"
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
            // console.log("data from premade pizza: ",data);
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

            };

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

    app.post('/api/create/order', (req,res) => {
        let descArray = req.body.description.split(" ");
        let queryInfo = {title:req.body.title, 'description.crust': descArray[0],'description.sauce': descArray[1],'description.toppings': [descArray[2]] ,'description.cheese':[descArray[3]],price:req.body.price};
        // console.log(queryInfo);

        let pizza = db.getPizza(queryInfo);

        pizza.then(
            function(data){
                //save order
                let order = {email:'test@gmail.com', pizzas:[{url:data.url,title:data.title,description:data.description,type:data.type,status:data.status, price:data.price,email:data.email}]}
                let orderObject = db.saveOrder(order);

                orderObject.then(
                    function(data){
                        res.send(data);
                    }
                ).catch(function (err) {
                    res.send(err);

                })
            }
        ).catch(
            function(err){
                res.send(err);
            }
        )
    });


    app.get("/api/ingredients", (req,res)=>{
       let ingredients = db.getIngredients();

       ingredients.then(
           function(data){
               // console.l
               res.send(data);
           }
       ).catch(
           function (err) {
               res.send(err);
           }
       )
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