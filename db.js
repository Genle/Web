let mongoose = require('mongoose');
const bcrypt = require('bcrypt');
require('dotenv').config();

mongoose.Promise = global.Promise;

// console.log(process.env.DB_HOST);
mongoose.connect('mongodb://' + process.env.DB_HOST + '/' + process.env.DB_NAME, {
	useMongoClient: true
});

let db = mongoose.connection;

//Bind connection to error event
db.on('error', console.error.bind(console, 'MongoDB connection error:'));

let Schema = mongoose.Schema;

let user = new Schema({
	email: String,
	password: String
});

//pizza premade or customed by the user
let pizza = new Schema({
    url: String,
    title: String,
    description: {
        crust:String,
        sauce:String,
        toppings:[],
        cheese:[]
    },
    price: Number,
    type: Number,
    status: String,
    email: String

});

//title and description are custom and the other assigned

//all existed ingredients
let ingredients = new Schema({
    crust:[],
    sauce:[],
    toppings:[],
    cheese:[]
});

//order made by a user
let order = new Schema({
    email:String,
    date:{ type: Date, default: Date.now },
    pizzas: []
});




let User = mongoose.model('User', user);
let Pizza = mongoose.model('Pizza', pizza);
let Ingredients = mongoose.model('Ingredients', ingredients);
let Order = mongoose.model('Order', order);


exports.createPizza = (pizza) => {
    return new Promise((resolve,reject)=>{
        let newPizza = new Pizza({
            url: pizza.url,
            title: pizza.title,
            description:pizza.description,
            price:pizza.price,
            type:pizza.type,
            status: pizza.status,
            email: pizza.email
        });

        newPizza.save((err)=>{
            if(err){
                reject(err);
            }
            resolve({message:"Pizza saved"});
        });
    });
};

exports.getPreMadePizza = () => {
    return new Promise((resolve,reject)=>{
        Pizza.find({type:0}, (err,pizzas)=>{
            if(err){
                reject({message:"Error"});
            }
            resolve(pizzas);
        });
    });
};

exports.getCustomPizza = () => {
    return new Promise((resolve,reject)=>{
        Pizza.find({type:1}, (err,pizzas)=>{
            if(err){
                reject(err);
            }
            resolve(pizzas);
        });
    });
};

exports.createUser = (email, password) => {

    return new Promise((resolve, reject) => {
        bcrypt.hash(password, 10, function(err, hash) {
            // Store hash in database
            console.log(hash);

            if(hash){
                let user = new User({
                    email: email,
                    password: hash
                });
                user.save((err) => {
                    if (err) {
                        reject(err);
                    }
                    resolve({message: "User saved"});
                });
            }else{
                reject({message:"Password has couldn't be created"});
            }


        });




	});

};
exports.checkLoginInfo = (email, password) => {
    return new Promise((resolve, reject) => {
            User.findOne({
                "email": email
            }, function (err, User) {
                if (err) {
                    reject(err);
                }

                if (User) {
                    if (User.email == email) {
                        console.log("here: ", User.password);
                        bcrypt.compare( password, User.password, function(err, res) {
                            if(res) {
                                // Passwords match
                                resolve({message: "true"});
                            } else {
                                // Passwords don't match
                                reject({message: "false"});
                            }
                        })

                    }
                } else {
                    resolve({message: "user not found"});
                }
            });
        }
    );
};