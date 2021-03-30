const UserDataAccess = require('../data/UserDataAccess.js');
const Controller = require('./Controller.js');

const EMAIL_REGEX = /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/;

class UserController extends Controller {

    constructor(configuration, database) {
        super();
        this.userDataAccess = new UserDataAccess(configuration, database);
    }

    create(req, res) {
        // console.log(req.body, this);
        const information = req.body;
        const errors = this.validateCreation(information);
        if (errors.length > 0) {
            console.log(errors);
            res.render('static/register', {
                input: information,
                errors: errors
            });
        } else {
            this.userDataAccess.createAddress(
                information.streetAddress,
                information.state,
                information.city,
                information.zipCode,
                33 /* TODO: Country Drop Down */
            ).then(addressId => {
                this.userDataAccess.create(
                    information.firstName,
                    information.lastName,
                    information.email,
                    information.password,
                    information.phoneNumber,
                    addressId
                ).then(id => {
                    res.send('Successfully created account with id: ' + id);
                }).catch(error => {
                    res.send('Failed to create account: ' + error);
                });
            }).catch(error => {
                res.send('Failed to create account: ' + error);
            });
        }
    }

    validateCreation(information) {
        let errors = [];
        if (information.firstName.length == 0) errors.push({ element: 'firstName', message: 'Please enter your first name.' });
        if (information.lastName.length == 0) errors.push({ element: 'lastName', message: 'Please enter your last name.' });
        if (information.email.match(EMAIL_REGEX) === null) errors.push({ element: 'email', message: 'Please enter a valid email address.' });
        if (information.phoneNumber.length == 0) errors.push({ element: 'phoneNumber', message: 'Please enter a valid phone number.' });
        if (information.streetAddress.length == 0) errors.push({ element: 'streetAddress', message: 'Please enter a valid phone number.' });
        if (information.city.length == 0) errors.push({ element: 'city', message: 'Please enter a valid phone number.' });
        if (information.country.length == 0) errors.push({ element: 'country', message: 'Please enter a valid phone number.' });
        if (information.state.length == 0) errors.push({ element: 'state', message: 'Please enter a valid phone number.' });
        if (information.zipCode.length == 0) errors.push({ element: 'zipCode', message: 'Please enter a valid phone number.' });
        if (information.password.length <= 6) errors.push({ element: 'password', message: 'Please choose a password longer than 6 characters.' });
        if (information.password !== information.confirmPassword) errors.push({ element: 'confirmPassword', message: 'Please ensure that your confirmation password matches.' });
        return errors;
    }

}

module.exports = UserController;