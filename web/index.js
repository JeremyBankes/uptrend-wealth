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

app.use(express.urlencoded({ extended: false }));
app.use(express.static('public'));

require('./controllers/static')(app);
require('./controllers/user')(app);
require('./controllers/trade')(app);
require('./controllers/fund')(app);
app.get('*', (req, res) => { res.render('404.hbs'); });

app.listen(configuration.port, () => {
    console.log(`Server now listening on port ${configuration.port}`);
});

require('./data/dataAccess');