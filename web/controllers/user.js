module.exports = (app) => {

    app.get('/user', (req, res) => {

        res.render('user', {
            scripts: [
                '/scripts/chart.js',
                '/scripts/user/core.js'
            ]
        });

    });

    app.get('/login', (req, res) => {
        res.render('login');
    });

    app.get('/register', (req, res) => {
        res.render('register');
    });

}