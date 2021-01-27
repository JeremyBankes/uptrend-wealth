module.exports = (app) => {

    app.get('/', (req, res) => {
        res.redirect('/landing');
    });

    app.get('/landing', (req, res) => {

        res.render('landing', {
            data: 'Hello World'
        });

    });

    app.get('/sandbox', (req, res) => {
        res.render('sandbox', {
            isLoggedIn: false,
            data: 'Hello World',
            book: {
                title: 'The King',
                pages: 120
            },
            foods: [
                'Hamburger',
                'Hotdog',
                'Pizza',
                'Taco'
            ]
        });
    });
};