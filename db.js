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

	let user = new User({
		email: email,
		password: password
	});
	user.save(function(err, object) {
		if (err) {
			console.log("err: ", message);
			return err;
		}
		console.log(object);
		return object;
	});

}
exports.checkLoginInfo = (email, password) => {
	console.log("info login", email, password);
	User.findOne({
		"email": email,
		"password": password
	}, function(err, User) {
		if (err) {
			return err;
		}

		if (User) {
			return User;
		} else {
			return "No User found";
		}
	});
}