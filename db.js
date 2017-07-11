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

let schema = mongoose.Schema;

let user = new schema({
	email: String,
	password: String
});

let User = mongoose.model('User', user);

function getUserInfo() {
	UserModel.findOne(function(err, user) {
		console.log(user);
	})
}


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

}
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
            })
        }
    )
}