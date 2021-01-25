module.exports = (app) => {

    app.get('/user', (req, res) => {

        res.render('user', {
            scripts: [
                '/scripts/chart.js',
                '/scripts/user/core.js'
            ]
        });
        
    });

}