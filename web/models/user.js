const dataAccess = require('../data/userDataAccess');

class User {

    constructor(id, firstName, lastName, email, hash, phone, registration, unregistration, accountId, addressId) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.hash = hash;
        this.phone = phone;
        this.registration = registration;
        this.unregistration = unregistration;
        this.accountId = accountId;
        this.addressId = addressId;
    }

    static create(firstName, lastName, email, password, phone, streetAddress, subdivision, city, zipCode, countryId) {
        try {
            const addressId = await dataAccess.createAddress(streetAddress, subdivision, city, zipCode, countryId);
            const userId = await dataAccess.createUser(firstName, lastName, email, password, phone, addressId);
            return userId;
        } catch (error) {
            throw error;
        }
    }

}

module.exports = User;