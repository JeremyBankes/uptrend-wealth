const express = require('express');
const session = require('express-session');
const exphbs = require('express-handlebars');
const config = require('./config.json');

const Database = require('./database');
const { validateLogin, validateRegister } = require('./validation');

const db = new Database({
    host: config.database_host,
    user: config.database_user,
    port: config.database_port,
    password: config.database_password,
    database: config.database_name,
    saltRounds: config.password_hash_salt_rounds
});

const app = express();

app.engine('handlebars', exphbs({
    helpers: {
        sticky: (input) => { return `value="${input ? input : ''}"`; }
    }
}));
app.set('view engine', 'handlebars');

app.use(session({
    secret: config.session_secret,
    resave: false,
    saveUninitialized: true
}));

app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

app.use((req, res, next) => {
    next();
});

async function getCountries() {
    return (await db.getCountries()).map(country => ({ id: country['Id'], name: country['Name'] }));
}

function context(req) {
    const path = req.path;
    const active = {};
    active[path.substr(1)] = true;
    const context = { active, ...req.session };
    delete context.cookie;
    console.log(context);
    return context;
}

app.get('/landing', (req, res) => {
    res.render('landing', context(req));
});

app.get('/about', (req, res) => {
    res.render('about', context(req));
});

app.get('/contact', async (req, res) => {
    res.render('contact', {
        countries: await getCountries(),
        ...context(req)
    });
});

app.get('/login', (req, res) => {
    res.render('login', context(req));
});

app.post('/login', (req, res) => {
    const input = req.body;
    const errors = validateLogin(input);
    if (errors.length > 0) {
        res.render('login', {
            ...context(req),
            messages: errors,
            input: input
        });
        return;
    }
    db.readUser(input.email).then(result => {
        if (result[0].length > 0) {
            const userInformation = result[0][0];
            const hash = userInformation['Hash'].toString();
            if (db.validate(input.password, hash)) {
                const userId = userInformation['Id'];
                console.log(`User logged in (${userId}) ${userInformation['FirstName']} ${userInformation['LastName']}`);
                req.session.userId = userId;
                res.status(200).end();
            } else {
                res.render('login', {
                    ...context(req),
                    messages: ['The password you have entered is incorrect'],
                    input: input
                });
            }
        } else {
            res.render('login', {
                ...context(req),
                messages: ['That email address is not registered'],
                input: input
            });
        }
    }).catch(error => {
        console.error(error);
        delete input.password;
        res.render('login', {
            ...context(req),
            messages: [error.code || error.message],
            input: input
        });
    });
});

app.get('/register', async (req, res) => {
    const countries = (await db.getCountries()).map(country => ({ id: country['Id'], name: country['Name'] }));
    res.render('register', {
        countries: await getCountries(),
        ...context(req)
    });
});

app.post('/register', async (req, res) => {
    const input = req.body;

    const errors = validateRegister(input);
    if (errors.length > 0) {
        res.render('register', {
            ...context(req),
            countries: await getCountries(),
            messages: errors,
            input: input
        });
        return;
    }

    db.createAddress(input.street, input.state, input.city, input.postal, input.countryId).then(result => {
        const addressId = result[0][0]['Id'];
        return db.createUser(input.firstName, input.lastName, input.email, input.password, input.phone, addressId);
    }).then(result => {
        const userId = result[0][0]['Id'];
        console.log(`Created new user (${userId}) ${input.firstName} ${input.lastName}`);
        req.session.userId = userId;
        db.createAccount().then(result => {
            const accountId = result[0][0]['Id'];
            db.assignAccount(userId, accountId).then(() => {
                res.status(200).end();
            });
        });
    }).catch(async error => {
        console.error(error);
        res.render('register', {
            ...context(req),
            countries: await getCountries(),
            messages: [error.code || error.message],
            input: input
        });
    });
});

app.get('/logout', (req, res) => {
    req.session.userId = null;
    res.redirect('/login');
});

app.get('/investment', (req, res) => {
    Promise.all([
        db.readTransfers(req.session.userId, true),
        db.readTransfers(req.session.userId, false),
        db.readTrades(req.session.userId)
    ]).then(results => {
        const contributions = results[0][0].map(result => ({ amount: result['Amount'], date: result['Time'].toLocaleString() }));
        const withdrawals = results[1][0].map(result => ({ amount: Math.abs(result['Amount']), date: result['Time'].toLocaleString() }));
        const totalContribution = contributions.reduce((accumulator, contribution) => accumulator + contribution.amount, 0);
        const totalWithdrawal = withdrawals.reduce((accumulator, withdrawal) => accumulator + withdrawal.amount, 0);

        const pastTrades = [];
        const currentTrades = [];

        const trades = results[2][0].forEach(result => {
            const trade = {
                id: result['Id'],
                entryTime: result['EntryTime'].toLocaleString(),
                pair: result['Pair'],
                direction: result['Direction'] ? 'Long' : 'Short',
                entryPrice: result['EntryPrice'],
                profit: result['Profit']?.toFixed(2),
                exitPrice: result['ExitPrice'],
                exitTime: result['ExitTime']?.toLocaleString()
            };
            if (trade.exitTime) {
                pastTrades.push(trade);
            } else {
                currentTrades.push(trade);
            }
        });

        res.render('investment', {
            ...context(req),
            contributions,
            withdrawals,
            totalContribution,
            totalWithdrawal,
            pastTrades,
            currentTrades
        });
    }).catch(error => {
        console.error(error);
        res.end('fatal error');
    });
});

app.get('/performance', (req, res) => {
    Promise.all([
        db.readTrades(req.session.userId),
        db.readTrades(-1)
    ]).then(results => {
        const process = (result) => {
            let balance = 0;
            return result.reduce((accumulator, row) => {
                const exitTime = row['ExitTime'];
                balance += row['Profit'];
                if (exitTime) {
                    accumulator.push([
                        exitTime,
                        balance
                    ]);
                }
                return accumulator;
            }, []);
        };
        res.json({
            individual: process(results[0][0]),
            fund: process(results[1][0])
        });
    });
});

app.listen(config.web_port, () => {
    console.log(`Web server now listening and http://localhost:${config.web_port}`);
});

// Generate mock trade data
// let pairs = ['EURUSD', 'USDJPY', 'GBPUSD', 'USDCHF', 'AUDUSD', 'USDCAD'];
// for (let i = 0; i < 100; i++) {
//     let before = new Date();
//     before.setDate(before.getDate() - 103 + i);

//     after = new Date(before);
//     after.setDate(after.getDate() + 5 * Math.random());

//     let direction = Math.random() > 0.5;
//     let first = direction ? 1.20 + 0.1 * Math.random() : 1.25 + 0.1 * Math.random();
//     let second = direction ? 1.25 + 0.1 * Math.random() : 1.20 + 0.1 * Math.random();
//     let size = 50000 + Math.random() * 50000;
//     db.createTrade(pairs[Math.floor(Math.random() * pairs.length)], first, before, second, after, direction, 0, size, 0);
// }

// Generate mock claims
// for (let i = 106; i < 183; i++) {
//     if (Math.random() < 0.25) {
//         db.assignClaim(3, i, Math.random() * 0.25);
//     }
// }