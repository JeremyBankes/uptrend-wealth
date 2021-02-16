
module.exports = (app) => {

    app.get('/fund', (req, res) => {
        res.render('todo.hbs');
    });

}