const dataAccess = require('../data/addressDataAccess');

class Address {

    constructor(id, streetAddress, subdivision, city, zipCode, countryId) {
        this.id = id;
        this.streetAddress = streetAddress;
        this.subdivision = subdivision;
        this.city = city;
        this.zipCode = zipCode;
        this.countryId = countryId;
    }

    async create() {
        return await dataAccess.create(this.streetAddress, this.subdivision, this.city, this.zipCode, this.countryId);
    }

}

module.exports = Address;