module.exports = (app) => {

    app.get('/', (req, res) => {
        res.redirect('/landing');
    });

    app.get('/landing', (req, res) => {

        res.render('landing', {
            data: 'Hello World'
        });

    });

    app.get('/about', (req, res) => {
        res.render('info/about.hbs');
    });

    app.get('/contact', (req, res) => {
        res.render('info/contact.hbs');
    });

    app.get('/faq', (req, res) => {
        res.render('info/faq.hbs');
    });

    // THESE TWO SHALL BE HERE FOR NOW
    app.get('/site-policy/privacy-policy', (req, res) => {
        res.render('todo.hbs');
    });

    app.get('/site-policy/terms-of-service', (req, res) => {
        res.render('todo.hbs');
    });

};