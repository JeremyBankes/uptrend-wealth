const database = require('../data/memoryDatabase');

module.exports = {
    create: (id, firstName, lastName, address, phoneNumber, registration, unregistration, accountId) => {

        const create = function () {
            if (!database.user) database.user = {};
            if (!database.user[this.id]) database.user[this.id] = {};
            database.user[this.id].firstName = this.firstName;
            database.user[this.id].lastName = this.lastName;
            database.user[this.id].address = this.address;
            database.user[this.id].phoneNumber = this.phoneNumber;
            database.user[this.id].registration = this.registration;
            database.user[this.id].unregistration = this.unregistration;
            database.user[this.id].accountId = this.accountId;
        }

        const update = () => {

        }

        const remove = () => {

        }


        return {
            id, firstName, lastName, address, phoneNumber, registration, unregistration, accountId, // Fields
            create: create, update, remove // Methods
        };
    }
}