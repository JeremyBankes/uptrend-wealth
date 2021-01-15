const express = require('express');
const handlebars = require('express-handlebars');
const configuration = require('./configuration');

const app = express();

app.engine('hbs', handlebars({
    layoutsDir: 'views',
    partialsDir: 'views',
    defaultLayout: 'main',
    extname: '.hbs'
}));

app.set('view engine', 'hbs');

app.use(express.static('public'));

require('./controllers/home')(app);

app.listen(configuration.port, () => {
    console.log(`Server now listening on port ${configuration.port}`);
});