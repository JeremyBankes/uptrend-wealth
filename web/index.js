const express = require('express');
const handlebars = require('express-handlebars');
const configuration = require('./configuration');

//
// APPLICATION SETUP
//

const app = express();

// Setup view engine
app.engine('hbs', handlebars({
    helpers: require("./helpers/helper"),
    layoutsDir: 'views',
    partialsDir: 'views/partials',
    defaultLayout: 'main',
    extname: '.hbs'
}));
app.set('view engine', 'hbs');

// Handle url encoded request bodies (from forms)
app.use(express.urlencoded({ extended: false }));

// Serve public files
app.use(express.static('public'));

//
// DATABASE SETUP
//
const Database = require('./data/Database.js');
const database = new Database(
    configuration.database_name,
    configuration.database_host,
    configuration.database_port,
    configuration.database_user,
    configuration.database_password
);
database.connect();

// 
// PAGE ROUTING
//

// Static
const StaticController = require('./controllers/StaticController.js');
const staticController = new StaticController();

const UserController = require('./controllers/UserController.js');
const userController = new UserController(configuration, database);

app.get('/', (req, res) => res.redirect('/landing'));
app.get('/landing', staticController.landing);
app.get('/about', staticController.about);
app.get('/contact', staticController.contact);
app.get('/faq', staticController.faq);
app.get('/login', staticController.login);
app.get('/register', staticController.register);
app.post('/user/create', (req, res) => userController.create(req, res));
app.get('*', staticController.error);

// Start listening
app.listen(configuration.port, () => {
    console.log(`Server now listening @ http://localhost:${configuration.port}`);
});