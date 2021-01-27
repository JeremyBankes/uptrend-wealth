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

// app.listen(configuration.port, () => {
//     console.log(`Server now listening on port ${configuration.port}`);
// });
app.listen(8080, () => {
    console.log(`Server now listening on port 8080.`);
});