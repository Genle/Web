(function () {
    let express = require('express');
    let handlebar = require('express-handlebars');
    let helpers = require('./lib/helpers');
    let app = express();

    app.use('/static', express.static('public')); 
    app.engine('.hb', handlebar({defaultLayout: 'main',
                                extname: '.hb',
                                layoutsDir:__dirname + '/views/layouts',
                                partialsDir:__dirname + '/views/partials',
                                helpers: helpers }));
    app.set('view engine', '.hb');



    //endpoint

    app.get('/', (req, res) => {
        res.render('home');
    });

    app.get('/about', (req,res) => {
        res.render('about');
    });

    app.get('/events', (req, res) => {
        res.sendFile(__dirname + '/views/events.html');
    })

    let port = 9876; //process.env.PORT ||

    app.listen(port, () => {
        console.log("App is listening to port 9876");
    });

} () )
