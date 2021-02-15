const express = require('express');
const handlebars = require('express-handlebars');
const configuration = require('./configuration');
const helpers = require("./helpers/utilities");

const app = express();

app.engine('hbs', handlebars({
    helpers: helpers,
    layoutsDir: 'views',
    partialsDir: 'views/partials',
    defaultLayout: 'main',
    extname: '.hbs'
}));

app.set('view engine', 'hbs');

app.use(express.static('public'));

require('./controllers/landing')(app);
require('./controllers/user')(app);

const user = require('./models/user');

const newUser = user.create(3, 'Jeremy', 'Bankes', '100 Water Street, Pugwash, Nova Scotia, Canada', '902-809-7323', new Date(), null, 0);

newUser.create();

app.listen(configuration.port, () => {
    console.log(`Server now listening on port ${configuration.port}`);
});