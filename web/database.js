const mariadb = require('mariadb');
const bcrypt = require('bcrypt');

class Database {

    constructor(configuration) {
        this.pool = mariadb.createPool({
            host: configuration.host,
            user: configuration.user,
            port: configuration.port,
            password: configuration.password,
            database: configuration.database,
            connectionLimit: 3
        });
        this.saltRounds = configuration.saltRounds || 3;

        this.pool.getConnection().then(connection => {
            console.log(`Successful connection to "${configuration.database}" database at ${configuration.host}:${configuration.port} as ${configuration.user}.`);
            connection.release();
        }).catch(error => {
            console.log(`Failed to connect "${this.name}" database at ${this.host}:${this.port} as ${this.user}.`);
            console.log(error.message);
        });
    }

    callProcedure(name, ...parameters) {
        return this.pool.getConnection().then(connection => {
            return connection.query(`CALL ${name}(${Array(parameters.length).fill('?').join()})`, parameters).finally(() => {
                connection.release();
            });
        });
    }

    createAddress(street, state, city, postal, countryId) {
        return this.callProcedure('CreateAddress', street, state, city, postal, countryId);
    }

    createUser(firstName, lastName, email, password, phone, addressId) {
        const hash = bcrypt.hashSync(password, this.saltRounds);
        return this.callProcedure('CreateUser', firstName, lastName, email, hash, phone, addressId);
    }

    readUser(emailOrId) {
        if (Number.isInteger(emailOrId)) return this.callProcedure('ReadUser', emailOrId, null);
        else return this.callProcedure('ReadUser', null, emailOrId);
    }

    createAccount() {
        return this.callProcedure('CreateAccount');
    }

    assignAccount(userId, accountId) {
        return this.callProcedure('AssignAccount', userId, accountId);
    }

    createTransfer(userId, amount) {
        return this.callProcedure('CreateTransfer', userId, amount, new Date());
    }

    readTransfers(userId, contribution) {
        return this.readUser(userId).then(result => {
            const userData = result[0][0];
            return this.callProcedure('ReadTransfers', userId, userData['Registration'], new Date(), contribution);
        });
    }

    createTrade(pair, entryPrice, entryTime, exitPrice, exitTime, direction, initialStopPrice, positionSize, fundSize) {
        const profit = (direction ? (exitPrice - entryPrice) : (entryPrice - exitPrice)) * positionSize;
        return this.callProcedure('CreateTrade', pair, entryPrice, entryTime, exitPrice, exitTime, direction, initialStopPrice, positionSize, fundSize, profit);
    }

    readTrades(userId) {
        return this.callProcedure('ReadTrades', userId);
    }

    assignClaim(userId, tradeId, ownership) {
        return this.callProcedure('AssignClaim', userId, tradeId, ownership);
    }

    getCountries() {
        return this.callProcedure('GetCountries').then(results => results.length > 0 ? results[0] : null);
    }

    validate(password, hash) {
        return bcrypt.compareSync(password, hash);
    }

}

module.exports = Database;