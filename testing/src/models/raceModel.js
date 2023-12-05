const pool = require('../utils/db');
class Race {
    constructor(raceId, raceName, circuit, location, dateOfRace, winnerId) {
    this.race_id = raceId;
    this.race_name = raceName;
    this.circuit = circuit;
    this.location = location;
    this.date_of_race = dateOfRace;
    this.winner_id = winnerId;
    }
}

// Function to get all races from the database
const getAllRacesFromDatabase = () => {
    return new Promise(async (resolve, reject) => {
        try {
            // Get a connection from the pool
            const connection = await pool.getConnection();

            // Use the connection to query the database
            const [results] = await connection.query('SELECT * FROM Races');

            // Release the connection back to the pool
            connection.release();

            resolve(results);
        } catch (error) {
            reject(error);
        }
    });
};

module.exports = {
    Race,
    getAllRacesFromDatabase,
};


