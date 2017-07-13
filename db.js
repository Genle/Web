let mongoose = require('mongoose');
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

let pizza = new Schema({
    url: String,
    title: String,
    description: [],
    price: Number,
    type: Number

});


let User = mongoose.model('User', user);
let Pizza = mongoose.model('Pizza', pizza);

function getUserInfo() {
	UserModel.findOne(function(err, user) {
		console.log(user);
	})
}


exports.createPizza = (pizza) => {
    return new Promise((resolve,reject)=>{
        let newPizza = new Pizza({
            url: pizza.url,
            title: pizza.title,
            description:pizza.description,
            price:pizza.price,
            type:pizza.type
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
        let user = new User({
            email: email,
            password: password
        });

        user.save((err) => {
            if (err) {
                reject(err);
            }
            resolve({message: "User saved"});
        });

	});

};
exports.checkLoginInfo = (email, password) => {
    return new Promise((resolve, reject) => {
            User.findOne({
                "email": email,
                "password": password
            }, function (err, User) {
                if (err) {
                    reject(err);
                }

                if (User) {
                    if (User.email == email && User.password) {
                        resolve({message: "OK"});
                    }
                } else {
                    resolve({message: "user not found"});
                }
            });
        }
    );
};