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
        res.render('todo.hbs');
    });

}