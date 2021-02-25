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

    static async create(firstName, lastName, email, password, phone, addressId) {
        const id = await dataAccess.create(firstName, lastName, email, password, phone, addressId);
        return this.read(id);
    }

    static async read(id) {
        const data = await dataAccess.read(id);
        return new User(
            data['Id'],
            data['FirstName'],
            data['LastName'],
            data['Email'],
            data['Hash'],
            data['Phone'],
            data['Registration'],
            data['Unregistration'],
            data['AccountId'],
            data['AddressId']
        );
    }

}

module.exports = User;