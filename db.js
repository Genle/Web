let mongoose = require('mongoose');
require('dotenv').config();

// console.log(process.env.DB_HOST);
mongoose.connect('mongodb://'+ process.env.DB_HOST +'/'+process.env.DB_NAME);

let db = mongoose.connection;

//Bind connection to error event
db.on('error', console.error.bind(console, 'MongoDB connection error:'));

let schema = mongoose.Schema;

let user = new schema({
    username: String,
    password: String
});

let UserModel = mongoose.model('UserModel',user );

function getUserInfo () {
    UserModel.findOne(function(err, user){
        console.log(user);
    })
}


exports.createUser = (email, password) => {
    
}
