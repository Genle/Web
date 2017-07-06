(function () {
    let express = require('express');
    let handlebar = require('express-handlebars');
    let helpers = require('./lib/helpers');
    let app = express();
    let db = require("./db");

    // db.saveUser('joe', 'milipap');
    db.getUserInfo();
    console.log(db);

    app.use('/static', express.static('public'));
    app.engine('.hb', handlebar({
        defaultLayout: 'main',
        extname: '.hb',
        layoutsDir: __dirname + '/views/layouts',
        partialsDir: __dirname + '/views/partials',
        helpers: helpers
    }));
    app.set('view engine', '.hb');


    //data
    let users = [
        {username: "jfageek", password: "lamelma"},
        {username: "angelo",password: "lama"},
        {username: "joseph", password: "french"}
        ];

    //endpoint


    app.get('/', (req, res) => {
        res.render('home');
    });

    app.get('/about', (req, res) => {
        res.render('about');
    });

    app.get('/events', (req, res) => {
        res.sendFile(__dirname + '/views/events.html');
    });

    app.get('/ingredient', (req, res) => {
        res.send(users);

    });

    let port = 9876; //process.env.PORT ||

    app.listen(port, () => {
        console.log("App is listening to port 9876");
    });

}() );
