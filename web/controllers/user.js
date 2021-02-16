const user = require('../models/user');

module.exports = (app) => {

    app.get('/user', (req, res) => {
        res.render('user/user', {
            scripts: [
                '/scripts/chart.js',
                '/scripts/user/core.js'
            ]
        });
    });

    app.get('/login', (req, res) => {
        res.render('user/login');
    });

    app.get('/register', (req, res) => {
        res.render('user/register');
    });

    app.post('/login', (req, res) => {
        res.render('todo.hbs');
    });

    app.post('/user/create', (req, res) => {
        console.log(req.body);
        const newUser = user.create(
            Math.floor(Math.random() * 1000),
            req.body.firstName,
            req.body.lastName,
            req.body.emailAddress,
            req.body.address,
            req.body.phoneNumber,
            new Date(),
            null,
            0
        );
        console.log(newUser);

        res.render('todo.hbs');
    });

}