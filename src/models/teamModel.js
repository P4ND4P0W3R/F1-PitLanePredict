const pool = require('../utils/db');

class Team {
    constructor(teamId, teamName, teamLogo) {
        this.team_id = teamId;
        this.team_name = teamName;
        this.team_logo = teamLogo;
    }
}

// Function to get all teams from the database
const getAllTeamsFromDatabase = () => {
    return new Promise(async (resolve, reject) => {
        try {
            // Get a connection from the pool
            const connection = await pool.getConnection();

            // Use the connection to query the database
            const [results] = await connection.query('SELECT * FROM Teams');

            // Release the connection back to the pool
            connection.release();

            resolve(results);
        } catch (error) {
            reject(error);
        }
    });
};

module.exports = {
    Team, getAllTeamsFromDatabase,
};

