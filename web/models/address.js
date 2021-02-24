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

    async static create(streetAddress, subdivision, city, zipCode, countryId) {
        const id = await dataAccess.create(streetAddress, subdivision, city, zipCode, countryId);
        return new Address(id, streetAddress, subdivision, city, zipCode, countryId);
    }

}

module.exports = Address;