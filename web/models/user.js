const database = require('../data/memoryDatabase');

module.exports = {
    create: (id, firstName, lastName, emailAddress, address, phoneNumber, registration, unregistration, accountId) => {
        const create = function () {
            // Temporary code to save users into memory.
            // This code will be replaced with calls to MariaDB stored procedures.
            if (!database.user) database.user = {};
            if (!database.user[this.id]) database.user[this.id] = {};
            database.user[this.id].firstName = this.firstName;
            database.user[this.id].lastName = this.lastName;
            database.user[this.id].emailAddress = this.emailAddress;
            database.user[this.id].address = this.address;
            database.user[this.id].phoneNumber = this.phoneNumber;
            database.user[this.id].registration = this.registration;
            database.user[this.id].unregistration = this.unregistration;
            database.user[this.id].accountId = this.accountId;
        }
        const update = () => {
            // Temporary code to update users in memory.
            // This code will be replaced with calls to MariaDB stored procedures.
            database.user[this.id].firstName = this.firstName;
            database.user[this.id].lastName = this.lastName;
            database.user[this.id].emailAddress = this.emailAddress;
            database.user[this.id].address = this.address;
            database.user[this.id].phoneNumber = this.phoneNumber;
            database.user[this.id].registration = this.registration;
            database.user[this.id].unregistration = this.unregistration;
            database.user[this.id].accountId = this.accountId;
        }
        const remove = () => {
            // Temporary code to update users in memory.
            // This code will be replaced with calls to MariaDB stored procedures.
            database.user[this.id].unregistration = new Date();
        }
        return {
            id, firstName, lastName, emailAddress, address, phoneNumber, registration, unregistration, accountId, // Fields
            create, update, remove // Methods
        };
    },
    retrieve: (id) => {
        if (!database.user) return null;
        return database.user[id];
    },
    retrieve: (emailAddress, password) => {
        for (let user in database.user) {
            if (user.emailAddress.toLowerCase() === emailAddress.toLowerCase()) { return user; }
        }
        return null;
    }
}