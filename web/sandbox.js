const userModel = require('./models/user');

const id = userModel.create('Allie', 'Brekker', 'allie.brekker@gmail.com', 'carbonfiber', '902 567 2334', '203 Grudge Cst.', 'Ontario', 'Ashelyville', 'B3D 2F4', 33);

console.log(id);