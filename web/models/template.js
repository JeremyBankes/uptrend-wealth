module.exports = {
    create: (id, field1, feild2, feild3) => {
        const create = function () {
            // Create entry in database
        }
        const update = function () {
            // Update entry in database
        }
        const remove = function () {
            // Remove entry from database
        }
        return {
            id, field1, feild2, feild3, // Fields
            create, update, remove // Methods
        };
    },
    retrieve: (id) => {
        // Retrieve entry based on id
    }
}