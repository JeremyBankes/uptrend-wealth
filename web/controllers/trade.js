
module.exports = (app) => {

    app.get('/trade/*', (req, res) => {
        const id = req.params[0];
        res.render('todo.hbs');
    });

}