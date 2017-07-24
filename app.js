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

    app.get('/re-order/', (req, res) => {
        let orders = db.getOrders();
        let delay = 2;
        orders.then(
            function(data) {
                let delay = 2;
                res.render('reorder', {
                    data: data,
                    delay: delay
                });
            }
        ).catch(
            function(err) {
                res.render('reorder', {
                    data
                });
            }
        )

    });

    app.get('/new-order', (req, res) => {
        let ingredients = db.getIngredients();

        ingredients.then(
            function(data) {
                // console.l
                //    res.send(data);
                // console.log("data from promise: ",data);
                let newData = [];
                let index = 0;
                data[0]['size'] = ["small", "medium", "large", "extra large", "Mega Large"];
                // console.log("Data--------------: ", data);
                for (let value in data) {
                    // console.log("value from data: ", data[value]);
                    newData[index] = data[value];
                    index++;
                };
                // console.log("New data: ",newData);
                res.render('neworder', {
                    newData
                });
            }
        ).catch(
            function(err) {
                //    res.send(err);
                res.render('neworder', {
                    err
                });
            }
        )

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

        let saveUser = db.createUser(req.body.email, req.body.password);
        saveUser.then(
            function(message) {
                res.send(message);
            }
        ).catch(
            function(err) {
                res.send(err);
            }
        );

    });

    app.post('/api/login', (req, res) => {
        let login = db.checkLoginInfo(req.body.email, req.body.password);


        login.then(
            function(message) {
                res.send(message);
            }
        ).catch(function(err) {
            res.send(err);
        })

    });

    app.post('/api/create/pizza', (req, res) => {
        let newPizza = {
            url: req.body.url,
            title: req.body.title,
            description: [], //not yet found
            price: req.body.price,
            type: 1,
            email: req.body.email
        };

        let pizza = db.createPizza(newPizza);

        pizza.then(
            function(message) {
                res.send(message);
            }
        ).catch(function(err) {
            res.send(err);
        });
    });

    app.get('/pizzas', (req, res) => {
        let description = {
            size: 'medium',
            crust: 'flatbread',
            sauce: 'Bechamel',
            toppings: ['pepperoni, onions'],
            cheese: ['chedar,mozarella']
        };

        let newPizza = {
            url: "/static/img/pizza3.jpg",
            title: "Pizza Pepperoni onions",
            description: description, //not yet found
            price: 10,
            type: 0,
            status: "active",
            email: "creol@gmail.com"
        };

        let pizza = db.createPizza(newPizza);

        pizza.then(
            function(message) {
                console.log(message);
            }
        ).catch(function(err) {
            console.log(err);
        });

        res.send("OK");
    });

    app.post('/api/create/custom/pizza', (req, res) => {
        let newDescription = JSON.parse(req.body.description);
        let newPizza = {
            url: "",
            title: req.body.title,
            description: newDescription,
            price: req.body.price,
            type: 1,
            status: req.body.status,
            email: req.body.email
        };

        let pizza = db.createPizza(newPizza);

        pizza.then(
            function(message) {
                console.log(message);
                let order = {
                    email: newPizza.email,
                    pizzas: [{
                        url: newPizza.url,
                        title: newPizza.title,
                        description: newPizza.description,
                        type: 1,
                        status: newPizza.status,
                        price: newPizza.price,
                        email: newPizza.email
                    }]
                }
                let orderObject = db.saveOrder(order);

                orderObject.then(
                    function(data) {
                        console.log('Data: ', data);
                        res.send(data);
                    }
                ).catch(function(err) {
                    res.send(err);

                })
            }
        ).catch(function(err) {
            res.send(err);
        });
    });

    app.get('/api/premade/pizzas', (req, res) => {
        let pizzas = db.getPreMadePizza();
        pizzas.then(function(data) {
            // console.log("data from premade pizza: ",data);
            res.send(data);
        }).catch(function(err) {
            res.send(err);
        })
    });

    app.post('/api/populate/ingredients', (req, res) => {
        // console.log(req.body);
        if (req.body) {
            let ingredients = {
                crust: req.body.crust.split("."),
                sauce: req.body.sauce.split("."),
                toppings: req.body.toppings.split("."),
                cheese: req.body.cheese.split(".")

            };

            let result = db.populateIngredients(ingredients);

            result.then(
                function(data) {
                    res.send(data);
                }
            ).catch(
                function(err) {
                    res.send(err);
                }
            )
        } else {
            res.send({
                "message": "missing  parameter"
            });
        }
    });

    app.post('/api/create/order', (req, res) => {
        console.log("description from things: ", req.body.description);
        let descArray = req.body.description.split(",");
        console.log(descArray.length);
        let queryInfo = {
            title: req.body.title,
            'description.size': descArray[0],
            'description.crust': descArray[1],
            'description.sauce': descArray[2],
            'description.toppings': descArray[3].split(","),
            'description.cheese': descArray[4].split(","),
            price: req.body.price
        };

        // console.log(queryInfo);

        let pizza = db.getPizza(queryInfo);

        pizza.then(
            function(data) {
                //save order
                let order = {
                    email: data.email,
                    pizzas: [{
                        url: data.url,
                        title: data.title,
                        description: data.description,
                        type: data.type,
                        status: data.status,
                        price: data.price,
                        email: data.email
                    }]
                }
                let orderObject = db.saveOrder(order);

                orderObject.then(
                    function(data) {
                        console.log('Data: ', data);
                        res.send(data);
                    }
                ).catch(function(err) {
                    res.send(err);

                })
            }
        ).catch(
            function(err) {
                res.send(err);
            }
        )
    });


    app.get("/api/ingredients", (req, res) => {
        let ingredients = db.getIngredients();

        ingredients.then(
            function(data) {
                // console.l
                res.send(data);
            }
        ).catch(
            function(err) {
                res.send(err);
            }
        )
    });




    let port = 9876; //process.env.PORT ||

    app.listen(port, () => {
        console.log("App is listening to port 9876");
    });

}());