
module.exports = {

    validateRegister: (input) => {
        const errors = [];
        if (!input.firstName || input.firstName.length === 0) errors.push('Please enter your first name');
        if (!input.lastName || input.lastName.length === 0) errors.push('Please enter your last name');
        if (!input.email || input.email.length <= 3) errors.push('Please enter a valid email address');
        if (!input.phone || input.phone.length <= 6) errors.push('Please enter a valid phone number');
        if (!input.street || input.street.length <= 3) errors.push('Please enter a street address');
        if (!input.state || input.state.length <= 2) errors.push('Please enter a valid state');
        if (!input.city || input.city.length <= 1) errors.push('Please enter a valid city');
        if (!input.postal || input.postal.length <= 2) errors.push('Please enter a valid postal code');
        if (!input.countryId) errors.push('Please choose a country');
        if (!input.password) errors.push('Please choose a password');
        else if (!input.confirm) errors.push('Please confirm your password');
        else if (input.password.length <= 6) errors.push('Please choose a password longer than 6 characters');
        else if (input.password !== input.confirm) errors.push('Please ensure that your password confirmation matches');
        return errors;
    },

    validateLogin: (input) => {
        const errors = [];
        if (!input.email) errors.push('Please enter your email');
        if (!input.password) errors.push('Please enter your password');
        return errors;
    }

}