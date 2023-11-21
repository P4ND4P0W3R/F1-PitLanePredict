const db = require('../utils/db');

// Function to get all teams from the database
async function getAllTeamsFromDatabase(callback) {
    const query = 'SELECT * FROM Teams';

    try {
    // Using db pool for async/await syntax
        const [teams, fields] = await db.promise().execute(query);
        callback(null, teams);
    } catch (error) {
        callback(error, null);
    }
}

// You can define other functions for updating, deleting, or inserting teams as needed

module.exports = {
    getAllTeamsFromDatabase,
};
