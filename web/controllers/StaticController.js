const Controller = require('./Controller.js');

class StaticController extends Controller {

    landing(req, res) {
        res.render('static/landing');
    }

    about(req, res) {
        res.render('static/about');
    }

    contact(req, res) {
        res.render('static/contact');
    }

    faq(req, res) {
        res.render('static/faq');
    }

    login(req, res) {
        res.render('static/login');
    }

    register(req, res) {
        res.render('static/register');
    }

    error(req, res) {
        res.render('static/404');
    }

}

module.exports = StaticController;