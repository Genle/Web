let mongoose = require('mongoose');
require('dotenv').config();

mongoose.Promise = global.Promise;
mongoose.connect('mongodb://' + process.env.DB_HOST + '/' + process.env.DB_NAME,
    {useMongoClient: true});

let db = mongoose.connection;

//Bind connection to error event
db.on('error', console.error.bind(console, 'MongoDB connection error:'));


let schema = mongoose.Schema;

let user = new schema({
    username: String,
    password: String
});

let User = mongoose.model('User', user);


exports.getUserInfo = () => {
    User.find({}).exec(function (err, user) {
        console.log(user);
    })
}


exports.saveUser = (username, password)=>{

    let newUser = User({
        username: username,
        password: password
    });

    newUser.save(function(err){
        if(err) throw err;

        console.log("User created");
    })
}
