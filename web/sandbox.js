// const userModel = require('./models/user');

// const id = userModel.create('Allie', 'Brekker', 'allie.brekker@gmail.com', 'carbonfiber', '902 567 2334', '203 Grudge Cst.', 'Ontario', 'Ashelyville', 'B3D 2F4', 33);

// console.log(id);

const AddressModel = require('./models/address');

let address = new AddressModel(0, '105 Sheep Street', 'British Columbia', 'Closehaggen', '1F6 Z4B', 33);

address.create().then(id => {
    console.log('Created new address:', id);
}).catch(error => {
    console.log(error);
});